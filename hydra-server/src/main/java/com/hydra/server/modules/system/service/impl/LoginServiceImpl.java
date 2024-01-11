package com.hydra.server.modules.system.service.impl;


import com.hydra.common.constant.Constants;

import com.hydra.common.constant.UserConstants;
import com.hydra.common.utils.StringUtils;
import com.hydra.server.common.component.JwtToken;
import com.hydra.server.common.domain.LoginUser;
import com.hydra.server.common.exception.ServiceException;
import com.hydra.server.common.security.entity.JwtUser;
import com.hydra.server.manager.AsyncManager;
import com.hydra.server.manager.factory.AsyncFactory;
import com.hydra.server.modules.system.entity.XlUser;
import com.hydra.server.modules.system.service.LoginService;
import com.hydra.server.modules.system.service.XlMenuService;
import com.hydra.server.modules.system.service.XlRoleService;
import com.hydra.server.modules.system.service.XlUserService;
import com.hydra.server.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * @author hydra
 * @description
 * @date 2022/7/6
 */
@Slf4j
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private JwtToken jwtTokenUtil;
    @Autowired
    private XlMenuService menuService;
    @Autowired
    private XlRoleService roleService;
    @Autowired
    private XlUserService xlUserService;

    @Override
    public String login(String username, String password) {
        String token = null;
        try {
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);
            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                throw new BadCredentialsException("密码不正确");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            // 登录成功记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_SUCCESS, "登录成功"));
            JwtUser jwtUser = (JwtUser) authentication.getPrincipal();
            token = jwtTokenUtil.createToken(jwtUser);
        } catch (AuthenticationException e) {
            log.warn("登录异常:{}", e.getMessage());
            // 登录失败记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, e.getMessage()));
        }
        return token;
    }

    @Override
    public Set<String> getMenuPermission(XlUser user) {
        Set<String> perms = new HashSet<String>();
        // 超级管理员拥有所有权限
        if (SecurityUtils.isAdmin(user.getUserId())) {
            perms.add("*:*:*");
        } else {
            perms = menuService.selectMenuPermsByUserId(user.getUserId());
        }
        return perms;
    }

    @Override
    public Set<String> getRolePermission(XlUser user) {
        Set<String> roles = new HashSet<String>();
        // 超级管理员拥有所有权限
        if (SecurityUtils.isAdmin(user.getUserId())) {
            roles.add("admin");
        } else {
            roles = roleService.selectRolePermissionByUserId(user.getUserId());
        }
        return roles;
    }

    @Override
    public LoginUser newLogin(String username, String password) {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "User/password must be filled in"));
            throw new ServiceException("User/password must be filled in");
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "User password is not in the specified range"));
            throw new ServiceException("User password is not in the specified range");
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "Username is not in the specified range"));
            throw new ServiceException("Username is not in the specified range");
        }
        LoginUser userInfo = this.getLoginUserInfo(username);
        if (userInfo == null) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "Username does not exist"));
            throw new ServiceException("Username does not exist");
        }
        XlUser user = userInfo.getUser();
        if (SecurityUtils.matchesPassword(password, user.getPassWord())) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "wrong password"));
            throw new ServiceException("wrong password");
        }
        //线程塞入租户ID
        if (user.getStatus().intValue() == 1) {
            // 登录记录日志
            AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_FAIL, "User has been deactivated, please contact the administrator"));
            throw new ServiceException("Sorry, your account：" + username + " Disabled, please contact the administrator");
        }
        AsyncManager.me().execute(AsyncFactory.recordLoginLog(username, Constants.LOGIN_SUCCESS, "login successful"));
        return userInfo;
    }

    @Override
    public LoginUser getLoginUserInfo(String userName) {
        XlUser sysUser = xlUserService.selectUserByUserName(userName);
        if (StringUtils.isNotNull(sysUser)) {
            // 角色集合
            Set<String> roles = this.getRolePermission(sysUser);
            // 权限集合
            Set<String> permissions = this.getMenuPermission(sysUser);
            LoginUser sysUserVo = new LoginUser();
            sysUserVo.setUser(sysUser);
            sysUserVo.setRoles(roles);
            sysUserVo.setPermissions(permissions);
            return sysUserVo;
        }
        return null;
    }
}
