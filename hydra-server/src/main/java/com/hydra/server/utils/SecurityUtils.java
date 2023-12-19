package com.hydra.server.utils;


import com.hydra.server.common.domain.LoginUser;
import com.hydra.server.common.security.entity.JwtUser;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 安全服务工具类
 * @author hydra
 */
public class SecurityUtils {
    /**
     * 用户ID
     **/
    public static Long getUserId() {
        try {
            return getLoginUser().getUser().getUserId();
        } catch (Exception e) {
            throw new RuntimeException("获取用户ID异常");
        }
    }

    /**
     * 获取用户账户
     **/
    public static String getUsername() {
        try {
            return getLoginUser().getUsername();
        } catch (Exception e) {
            throw new RuntimeException("获取用户账户异常");
        }
    }

    /**
     * 获取用户
     **/
    public static JwtUser getOldLoginUser() {
        try {
            JwtUser jwtUser = (JwtUser) getAuthentication().getPrincipal();
            return jwtUser;
        } catch (Exception e) {
            throw new RuntimeException("获取用户信息异常");
        }
    }
    /**
     * 获取用户
     **/
    public static LoginUser getLoginUser() {
        try {
            LoginUser jwtUser = (LoginUser) getAuthentication().getPrincipal();
            return jwtUser;
        } catch (Exception e) {
            throw new RuntimeException("获取用户信息异常");
        }
    }
    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication()
    {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    /**
     * 是否登录
     **/
    public static boolean isLogin() {
        return getAuthentication()!=null && getAuthentication().getPrincipal() != null;
    }

    /**
     * 是否为超级管理员
     * @param userId 用户ID
     * @return 结果
     */
    public static boolean isAdmin(Long userId) {
        return userId != null && 1L == userId;
    }

    /**
     * 生成BCryptPasswordEncoder密码
     * @param password 密码
     * @return 加密字符串
     */
    public static String encryptPassword(String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(password);
    }
    /**
     * 判断密码是否相同
     * @param rawPassword 真实密码
     * @param encodedPassword 加密后字符
     * @return 结果
     */
    public static boolean matchesPassword(String rawPassword, String encodedPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
}
