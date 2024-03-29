package com.hydra.server.modules.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hydra.common.annotation.Log;
import com.hydra.common.constant.Constants;
import com.hydra.common.constant.UserConstants;
import com.hydra.common.enums.BusinessType;
import com.hydra.common.result.R;
import com.hydra.server.common.component.JwtToken;
import com.hydra.server.common.domain.LoginUser;
import com.hydra.server.common.exception.ServiceException;
import com.hydra.server.manager.AsyncManager;
import com.hydra.server.manager.factory.AsyncFactory;
import com.hydra.server.modules.system.entity.XlRole;
import com.hydra.server.modules.system.entity.XlUser;
import com.hydra.server.modules.system.service.XlRoleService;
import com.hydra.server.modules.system.service.XlUserService;
import com.hydra.server.modules.system.vo.UserQueryVo;
import com.hydra.server.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author hydra
 * @since 2021-09-03
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/ucenter/user")
public class XlUserController {

    @Autowired
    private XlUserService userService;
    @Autowired
    private XlRoleService roleService;
    @Autowired
    private JwtToken tokenService;

    @ApiOperation(value = "注册用户")
    @PostMapping(value = "register")
    public R register(@RequestBody XlUser user) {
        XlUser xlUser = userService.register(user);
        if (xlUser == null) {
            return R.error("注册失败,用户名已存在");
        }
        return R.ok(xlUser);
    }

    @ApiOperation(value = "分页用户列表")
    @GetMapping(value = "/list-page")
    public R listPage(UserQueryVo queryVo) {
        Page<XlUser> page = userService.listMemberPage(queryVo);
        return R.ok(page);
    }

    @ApiOperation(value = "添加用户")
    @PostMapping(value = "add")
    public R add(@RequestBody XlUser user) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserCode()))) {
            return R.error("新增用户'" + user.getUserCode() + "'失败，登录账号已存在");
        }
        boolean success = userService.create(user);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    @ApiOperation(value = "修改用户")
    @PostMapping(value = "/update/{id}")
    public R update(@PathVariable("id") Long id, @RequestBody XlUser user) {
        user.setUserId(id);
        boolean flag = userService.update(user);
        if (flag) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    @ApiOperation(value = "删除用户")
    @PostMapping(value = "/delete/{id}")
    public R delete(@PathVariable("id") Long id) {
        if (userService.delete(Collections.singletonList(id))) {
            return R.ok();
        }
        return R.error();
    }

    @ApiOperation(value = "登出功能")
    @PostMapping(value = "logout")
    public R logout() {
        return R.ok();
    }

    @ApiOperation(value = "根据用户id获取详细信息")
    @GetMapping(value = {"/", "/{userId}"})
    public R getInfo(@PathVariable(value = "userId", required = false) Long userId) {
        Map<String, Object> map = new HashMap<>(24);
        List<XlRole> roles = roleService.selectRoleList(new XlRole());
        map.put("roles", XlUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        if (userId != null) {
            XlUser user = userService.selectUserById(userId);
            map.put("roleIds", user.getRoles().stream().map(XlRole::getRoleId).collect(Collectors.toList()));
            map.put("user", user);
        }
        return R.ok(map);
    }

    @ApiOperation(value = "获取个人信息")
    @GetMapping(value = "/profile")
    public R getProfile() {
        Map<String, Object> map = new HashMap<>();
        XlUser loginUser = userService.selectUserById(SecurityUtils.getUserId());
        map.put("user", loginUser);
        map.put("roleGroup", userService.selectUserRoleGroup(loginUser.getUserId()));
        return R.ok(map);
    }

    @ApiOperation(value = "用户头像上传")
    @Log(title = "用户头像上传", businessType = BusinessType.UPDATE)
    @PostMapping("/profile/avatar")
    public R uploadAvatar(@RequestParam("avatarfile") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
//            String avatar = CosClientUtils.upload(file, "avatar");
            String avatar = "";
            if (userService.updateUserAvatar(SecurityUtils.getUserId(), avatar)) {
                // 更新缓存用户头像
                LoginUser loginUser = SecurityUtils.getLoginUser();
                loginUser.getUser().setAvatar(avatar);
                tokenService.refreshToken(loginUser);
                return R.ok(avatar);
            }
        }
        return R.error("Abnormal upload of avatar, please contact the administrator");
    }

    @ApiOperation(value = "用户修改密码")
    @Log(title = "用户修改密码", businessType = BusinessType.UPDATE)
    @PutMapping("/profile/updatePwd")
    public R updatePwd(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword) {
        XlUser user = userService.getById(SecurityUtils.getUserId());
        if (user != null) {
            if (SecurityUtils.matchesPassword(oldPassword, user.getPassWord())) {
                AsyncManager.me().execute(AsyncFactory.recordLoginLog(user.getUserCode(), Constants.LOGIN_FAIL, "wrong password"));
                throw new ServiceException("wrong password");
            }
            String encryptPassword = SecurityUtils.encryptPassword(newPassword);
            // 修改新密码
            user.setPassWord(encryptPassword);
            boolean flag = userService.update(user);
            if (flag) {
                return R.ok();
            }
        }
        return R.error("If the password change is abnormal, please contact the administrator.");
    }
}

