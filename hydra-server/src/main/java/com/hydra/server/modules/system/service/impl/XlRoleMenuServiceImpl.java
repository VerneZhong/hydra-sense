package com.hydra.server.modules.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydra.server.modules.system.entity.XlRoleMenu;
import com.hydra.server.modules.system.mapper.XlRoleMenuMapper;
import com.hydra.server.modules.system.service.XlRoleMenuService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色和菜单关联表 服务实现类
 * </p>
 *
 * @author hydra
 * @since 2022-07-06
 */
@Service
public class XlRoleMenuServiceImpl extends ServiceImpl<XlRoleMenuMapper, XlRoleMenu> implements XlRoleMenuService {

}
