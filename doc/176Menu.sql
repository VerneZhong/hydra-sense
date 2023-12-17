-- 菜单 SQL
insert into hydra_menu (menu_name, parent_id, sort, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表', '3', '1', '176', 'system/176/index', 1, 0, 'C', '0', '0', 'system:176:list', '#', 'admin', sysdate(), '', null);

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into hydra_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'system:176:query',        '#', 'admin', sysdate(), '', null);

insert into hydra_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'system:176:create',          '#', 'admin', sysdate(), '', null);

insert into hydra_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'system:176:edit',         '#', 'admin', sysdate(), '', null);

insert into hydra_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'system:176:remove',       '#', 'admin', sysdate(), '', null);

insert into hydra_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, created_by, created_time, updated_by, updated_time)
values('潘多拉176湿度表导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'system:176:export',       '#', 'admin', sysdate(), '', null);