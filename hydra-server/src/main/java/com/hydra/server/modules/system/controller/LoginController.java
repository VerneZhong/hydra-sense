package com.hydra.server.modules.system.controller;


import com.hydra.common.component.redis.CaptchaService;
import com.hydra.common.result.R;
import com.hydra.server.common.component.JwtToken;
import com.hydra.server.common.domain.LoginUser;
import com.hydra.server.modules.system.entity.XlMenu;
import com.hydra.server.modules.system.entity.XlUser;
import com.hydra.server.modules.system.service.LoginService;
import com.hydra.server.modules.system.service.XlMenuService;
import com.hydra.server.modules.system.vo.LoginVo;
import com.hydra.server.modules.system.vo.RouterVo;
import com.hydra.server.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author hydra
 * @description
 * @date 2022/6/30
 */
@Api(tags = "登录管理")
@RestController
public class LoginController {

    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value(value = "${xl.login.authcode.enable}")
    private boolean needAuthCode;
    @Autowired
    private LoginService loginService;
    @Autowired
    private XlMenuService menuService;
    @Autowired
    private CaptchaService captchaService;
    @Autowired
    private JwtToken jwtToken;

    @ApiOperation(value = "登录")
    @PostMapping(value = "old-login")
    public R login(@RequestBody LoginVo loginVo) {
        // 只有开启了验证码功能才需要验证
        if (needAuthCode) {
            String msg = captchaService.checkImageCode(loginVo.getNonceStr(),loginVo.getValue());
            if (StringUtils.isNotBlank(msg)) {
                return R.error(msg);
            }
        }
        String token = loginService.login(loginVo.getUserName(), loginVo.getPassWord());
        if (StringUtils.isBlank(token)) {
            return R.error("用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);
        return R.ok(tokenMap);
    }

    @ApiOperation(value = "登录后获取用户信息")
    @GetMapping("get-info")
    public R getInfo() {
        XlUser user = SecurityUtils.getLoginUser().getUser();
        if (user == null) {
            return R.unauthorized();
        }
        // 权限集合
        Set<String> permissions = loginService.getMenuPermission(user);
        // 角色集合
        Set<String> roles = loginService.getRolePermission(user);
        Map<String, Object> data = new HashMap<>();
        data.put("userCode", user.getUserCode());
        data.put("name", user.getRealName());
        data.put("avatar", user.getAvatar());
        data.put("roles", roles);
        data.put("permissions", permissions);
        return R.ok(data);
    }

    @ApiOperation(value = "登录后获取路由信息")
    @GetMapping("get-routers")
    public R getRoutes() {
        List<XlMenu> menus = menuService.selectMenuTreeByUserId(SecurityUtils.getUserId());
        List<RouterVo> routerVos = menuService.buildMenus(menus);
        return R.ok(routerVos);
    }

    @ApiOperation(value = "登录")
    @PostMapping(value = "login")
    public R newLogin(@RequestBody LoginVo loginVo) {
        // 只有开启了验证码功能才需要验证
        if (needAuthCode) {
            String msg = captchaService.checkImageCode(loginVo.getNonceStr(),loginVo.getValue());
            if (StringUtils.isNotBlank(msg)) {
                return R.error(msg);
            }
        }
        // 用户登录
        LoginUser userInfo = loginService.newLogin(loginVo.getUserName(), loginVo.getPassWord());
        Map<String, Object> tokenMap = jwtToken.createToken(userInfo);
        return R.ok(tokenMap);
    }
}
