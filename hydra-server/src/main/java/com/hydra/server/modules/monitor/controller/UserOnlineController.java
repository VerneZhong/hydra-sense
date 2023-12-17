package com.hydra.server.modules.monitor.controller;


import com.hydra.common.annotation.Log;
import com.hydra.common.component.redis.RedisCache;
import com.hydra.common.constant.CacheConstants;
import com.hydra.common.controller.BaseController;
import com.hydra.common.enums.BusinessType;
import com.hydra.common.page.TableDataInfo;
import com.hydra.common.result.R;
import com.hydra.common.utils.StringUtils;
import com.hydra.server.common.domain.LoginUser;
import com.hydra.server.modules.monitor.entity.UserOnline;
import com.hydra.server.modules.monitor.service.UserOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author huoqiang
 * @description 在线用户监控
 * @date 2022/10/18
 */
@RestController
@RequestMapping("/monitor/online")
public class UserOnlineController  extends BaseController {

    @Autowired
    private RedisCache redisCache;
    @Autowired
    private UserOnlineService userOnlineService;

    @PreAuthorize("@customSs.hasPermi('monitor:online:list')")
    @GetMapping("/list")
    public TableDataInfo list(String ipaddr, String userName) {
        Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<UserOnline> userOnlineList = new ArrayList<>();
        for (String key : keys) {
            LoginUser user = redisCache.getCacheObject(key);
            if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName)) {
                if (StringUtils.equals(ipaddr, user.getIpaddr()) && StringUtils.equals(userName, user.getUsername())) {
                    userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, user));
                }
            } else if (StringUtils.isNotEmpty(ipaddr)) {
                if (StringUtils.equals(ipaddr, user.getIpaddr())) {
                    userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, user));
                }
            } else if (StringUtils.isNotEmpty(userName) && StringUtils.isNotNull(user.getUser())) {
                if (StringUtils.equals(userName, user.getUsername())) {
                    userOnlineList.add(userOnlineService.selectOnlineByUserName(userName,user));
                }
            } else {
                userOnlineList.add(userOnlineService.setUserOnline(user));
            }
        }
        return getDataTable(userOnlineList);
    }

    /**
     * 强退用户
     */
    @PreAuthorize("@customSs.hasPermi('monitor:online:forceLogout')")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @DeleteMapping("/{tokenId}")
    public R forceLogout(@PathVariable String tokenId) {
        redisCache.deleteObject(CacheConstants.LOGIN_TOKEN_KEY + tokenId);
        return R.ok();
    }
}
