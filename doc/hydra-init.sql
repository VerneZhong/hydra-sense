-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '表名称',
  `table_comment` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '实体类名称',
  `tpl_category` varchar(30) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `table_id` bigint DEFAULT NULL COMMENT '归属表id',
  `column_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '列名称',
  `column_comment` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '列描述',
  `column_type` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '是否查询字段（1是）',
  `query_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Table structure for hydra_dept
-- ----------------------------
DROP TABLE IF EXISTS `hydra_dept`;
CREATE TABLE `hydra_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `sort` int DEFAULT NULL COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `dept_level` int DEFAULT NULL COMMENT '部门级别',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

-- ----------------------------
-- Table structure for hydra_dict
-- ----------------------------
DROP TABLE IF EXISTS `hydra_dict`;
CREATE TABLE `hydra_dict` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典表';

-- ----------------------------
-- Records of hydra_dict
-- ----------------------------
INSERT INTO `hydra_dict` VALUES ('1', 'sys_common_status', '系统状态', '0', '成功/失败', '2023-03-04 22:55:25', '1', '2023-03-04 22:47:15', '1', '0', '1');
INSERT INTO `hydra_dict` VALUES ('2', 'sys_normal_disable', '默认状态', '0', '正常/停用', '2023-03-04 22:55:40', '1', '2023-03-04 22:50:21', '1', '0', '1');
INSERT INTO `hydra_dict` VALUES ('3', 'sys_show_hide', '显示状态', '0', '显示/隐藏', null, null, '2023-03-05 09:36:34', '1', '0', '1');
INSERT INTO `hydra_dict` VALUES ('4', 'sys_menu_status', '菜单状态', '0', '1正常/0禁用', null, null, '2023-03-05 10:57:35', '1', '0', '1');

-- ----------------------------
-- Table structure for hydra_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `hydra_dict_data`;
CREATE TABLE `hydra_dict_data` (
  `dict_data_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_label` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典值',
  `sort` int DEFAULT NULL COMMENT '显示顺序',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`dict_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of hydra_dict_data
-- ----------------------------
INSERT INTO `hydra_dict_data` VALUES ('1', 'sys_common_status', 'success', '0', '0', 'N', 'success', '0', null, '2023-03-04 22:54:25', '1', '2023-03-04 22:48:45', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('2', 'sys_common_status', 'fail', '1', '0', 'N', 'danger', '0', null, '2023-03-04 22:54:36', '1', '2023-03-04 22:49:52', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('3', 'sys_normal_disable', 'normal', '0', '0', 'N', 'primary', '0', null, '2023-03-04 22:53:19', '1', '2023-03-04 22:50:40', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('4', 'sys_normal_disable', 'deactivate', '1', '0', 'N', 'danger', '0', null, '2023-03-04 22:53:27', '1', '2023-03-04 22:50:53', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('5', 'sys_show_hide', 'display', '1', '0', 'N', 'primary', '0', null, null, null, '2023-03-05 09:37:02', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('6', 'sys_show_hide', 'hide', '0', '1', 'N', 'warning', '0', null, null, null, '2023-03-05 09:37:16', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('8', 'sys_menu_status', 'disable', '0', '2', 'N', 'danger', '0', null, null, null, '2023-03-05 10:59:08', '1', '0', '1');
INSERT INTO `hydra_dict_data` VALUES ('12', 'sys_tenant_type', 'other', '3', '3', 'N', 'primary', '0', null, null, null, '2023-03-06 14:13:34', '1', '0', '1');

-- ----------------------------
-- Table structure for hydra_login_log
-- ----------------------------
DROP TABLE IF EXISTS `hydra_login_log`;
CREATE TABLE `hydra_login_log` (
  `login_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提示消息',
  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问日志表';

-- ----------------------------
-- Table structure for hydra_menu
-- ----------------------------
DROP TABLE IF EXISTS `hydra_menu`;
CREATE TABLE `hydra_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `permission` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权标识',
  `menu_level` bigint DEFAULT NULL COMMENT '菜单级别',
  `sort` int DEFAULT NULL COMMENT '排序',
  `parent_id` bigint DEFAULT NULL COMMENT '父ID',
  `menu_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '鐘舵€?1:鏄剧ず,0:涓嶆樉绀?',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `router_query` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '0' COMMENT '是否为外链（0否 1是）',
  `visible` int DEFAULT '1' COMMENT '菜单是否显示;0:隐藏 1:显示',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单表';

-- ----------------------------
-- Records of hydra_menu
-- ----------------------------
# INSERT INTO `hydra_menu` VALUES ('1', 'System Management', null, 'system', null, null, '1', '0', '0', '0', null, '/sys', null, null, '0', '1', '2023-03-05 12:38:02', null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('2', 'System Tool', null, 'email', null, null, '2', '0', '0', '0', null, '/tool', null, null, '0', '1', null, null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('3', 'code generation', null, 'code', null, null, '1', '2', '1', '0', null, 'gen', 'tool/gen/index', null, '0', '1', null, null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('4', 'Dictionary management', null, 'dict', 'system:dict:list', null, '4', '1', '1', '0', null, 'dict', 'sys/dict/index', null, '0', '1', '2023-03-05 13:00:11', null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('5', 'Menu management', null, 'date-range', 'system:menu:list', null, '1', '1', '1', '0', null, 'menu', 'sys/menu/index', null, '0', '1', null, null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('6', 'Role management', null, 'dashboard', 'system:role:list', null, '2', '1', '1', '0', null, 'role', 'sys/role/index', null, '0', '1', '2023-03-05 12:59:54', null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('7', 'Menu query', null, '#', 'system:menu:query', null, '1', '5', '2', '0', null, null, null, null, '0', '1', null, null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('8', 'Menu new', null, '#', 'system:menu:create', null, '2', '5', '2', '0', null, null, null, null, '0', '1', null, null, null, null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('9', 'Dictionary lookup', null, '#', 'system:dict:query', null, '1', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:16:16', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('10', 'Dictionary added', null, '#', 'system:dict:create', null, '2', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:16:59', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('11', '字典修改', null, '#', 'system:dict:edit', null, '3', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:17:21', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('12', '字典删除', null, '#', 'system:dict:remove', null, '4', '4', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:17:53', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('13', '菜单修改', null, '#', 'system:menu:edit', null, '3', '5', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:20:27', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('14', '菜单删除', null, '#', 'system:menu:remove', null, '4', '5', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:21:09', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('15', '角色查询', null, '#', 'system:role:query', null, '1', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:26:41', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('16', '角色新增', null, '#', 'system:role:create', null, '2', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:30:45', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('17', '角色修改', null, '#', 'system:role:edit', null, '3', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:31:21', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('18', '角色删除', null, '#', 'system:role:remove', null, '4', '6', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-04 21:31:48', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('19', '系统监控', null, 'monitor', null, null, '3', '0', '0', '0', null, '/monitor', null, null, '0', '1', null, null, '2023-03-05 12:30:45', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('20', '在线用户', null, 'online', 'monitor:online:list', null, '1', '19', '1', '0', null, 'online', 'monitor/online/index', null, '0', '1', null, null, '2023-03-05 12:32:17', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('21', '查询', null, '#', 'monitor:online:query', null, '1', '20', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:32:59', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('22', '强退', null, '#', 'monitor:online:batchLogout', null, '2', '20', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:33:27', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('23', 'Service monitoring', null, 'server', 'monitor:server:list', null, '2', '19', '1', '0', null, 'server', 'monitor/server/index', null, '0', '1', null, null, '2023-03-05 12:34:40', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('24', '缓存监控', null, 'redis', 'monitor:cache:list', null, '3', '19', '1', '0', null, 'cache', 'monitor/cache/index', null, '0', '1', null, null, '2023-03-05 12:35:45', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('25', '缓存列表', null, 'redis-list', 'monitor:cache:list', null, '4', '19', '1', '0', null, 'cacheList', 'monitor/cache/list', null, '0', '1', null, null, '2023-03-05 12:36:31', null, '0', '1');
INSERT INTO `hydra_menu` VALUES ('26', 'Platform Management', null, 'auth', null, null, '0', '0', '0', '0', null, '/platform', null, null, '0', '1', null, null, '2023-03-05 12:39:11', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('27', '部门管理', null, 'tree-table', 'system:dept:list', null, '3', '1', '1', '0', null, 'dept', 'sys/dept/index', null, '0', '1', '2023-03-05 13:00:21', null, '2023-03-05 12:41:45', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('28', '日志管理', null, 'log', null, null, '5', '1', '0', '0', null, 'log', null, null, '0', '1', null, null, '2023-03-05 12:45:51', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('29', '登录日志', null, 'logininfor', 'system:loginlog:list', null, '1', '28', '1', '0', null, 'loginlog', 'sys/log/loginlog/index', null, '0', '1', null, null, '2023-03-05 12:47:21', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('30', '操作日志', null, 'form', 'system:operlog:list', null, '2', '28', '1', '0', null, 'operlog', 'sys/log/operlog/index', null, '0', '1', null, null, '2023-03-05 12:48:06', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('31', '登录查询', null, '#', 'system:loginlog:query', null, '1', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:49:48', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('32', '记录删除', null, '#', 'system:loginlog:remove', null, '2', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:14', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('33', '清空', null, '#', 'system:loginlog:clean', null, '3', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:40', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('34', '导出', null, '#', 'system:loginlog:export', null, '4', '29', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:50:56', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('35', '操作查询', null, '#', 'system:operlog:query', null, '1', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:51:32', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('36', '操作删除', null, '#', 'system:operlog:remove', null, '2', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:51:55', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('37', '操作导出', null, '#', 'system:operlog:export', null, '3', '30', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:52:09', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('38', '部门查询', null, '#', 'system:dept:query', null, '1', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:53:52', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('39', '部门新增', null, '#', 'system:dept:create', null, '2', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:54:33', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('40', '部门修改', null, '#', 'system:dept:edit', null, '3', '28', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:54:49', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('41', '部门删除', null, '#', 'system:dept:remove', null, '4', '27', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 12:55:20', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('42', 'User Management', null, 'user', 'system:user:list', null, '0', '1', '1', '0', null, 'user', 'sys/user/index', null, '0', '1', null, null, '2023-03-05 12:57:51', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('43', 'User query', null, '#', 'system:user:query', null, '1', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:01:52', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('44', 'User new', null, '#', 'system:user:create', null, '2', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:18', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('45', 'User update', null, '#', 'system:user:edit', null, '3', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:38', null, '0', '1');
# INSERT INTO `hydra_menu` VALUES ('46', 'User delete', null, '#', 'system:user:delete', null, '4', '42', '2', '0', null, null, null, null, '0', '1', null, null, '2023-03-05 13:02:56', null, '0', '1');
INSERT INTO `hydra_menu` VALUES ('47','Pandora Management',NULL,'#','system:pandora:queryList',NULL,1,26,1,0,NULL,'pandora','pandora/index',NULL,0,1,'2023-12-19 22:10:10',NULL,'2023-12-17 21:06:38',NULL,0,1);


DROP TABLE IF EXISTS `hydra_oper_log`;
CREATE TABLE `hydra_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块标题',
  `business_type` int NOT NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人员',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志表';

-- ----------------------------
-- Table structure for hydra_role
-- ----------------------------
DROP TABLE IF EXISTS `hydra_role`;
CREATE TABLE `hydra_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色权限字符串',
  `data_scope` tinyint DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示（ 0：父子不互相关联显示 1：父子互相关联显示）',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:正常;1:禁用',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of hydra_role
-- ----------------------------
INSERT INTO `hydra_role` VALUES ('1', 'super admin', 'Have the highest authority on the system', 'admin', '1', '1', '1', '0', '9999', '2023-03-04 18:01:35', '1', '2023-03-03 18:03:28', null, '0', '1');

-- ----------------------------
-- Table structure for hydra_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `hydra_role_dept`;
CREATE TABLE `hydra_role_dept` (
  `role_dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色部门关联表';

-- ----------------------------
-- Table structure for hydra_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `hydra_role_menu`;
CREATE TABLE `hydra_role_menu` (
  `role_menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户id',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单角色关联表';

-- ----------------------------
-- Records of hydra_role_menu
-- ----------------------------
INSERT INTO `hydra_role_menu` VALUES ('1', '1', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('2', '2', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('3', '3', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('4', '4', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('5', '5', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('6', '6', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('7', '7', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('8', '8', '1', null, null, null, null, null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('9', '1', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('10', '4', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('11', '5', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('12', '7', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('13', '8', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('14', '6', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('15', '2', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('16', '3', '1', null, null, null, '2023-03-04 17:37:36', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('17', '1', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('18', '4', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('19', '9', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('20', '10', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('21', '11', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('22', '12', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('23', '5', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('24', '7', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('25', '8', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('26', '13', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('27', '14', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('28', '6', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('29', '15', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('30', '16', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('31', '17', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('32', '18', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('33', '2', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('34', '3', '1', null, null, null, '2023-03-04 21:33:19', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('35', '26', '1', null, null, null, '2023-03-05 13:14:22', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('36', '47', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('37', '48', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('38', '1', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('39', '42', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('40', '43', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('41', '44', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('42', '45', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('43', '46', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('44', '5', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('45', '7', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('46', '8', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('47', '13', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('48', '14', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('49', '6', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('50', '15', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('51', '16', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('52', '17', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('53', '18', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('54', '27', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('55', '38', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('56', '39', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('57', '41', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('58', '4', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('59', '9', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('60', '10', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('61', '11', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('62', '12', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('63', '28', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('64', '29', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('65', '31', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('66', '32', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('67', '33', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('68', '34', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('69', '30', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('70', '35', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('71', '36', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('72', '37', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('73', '40', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('74', '2', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('75', '3', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('76', '19', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('77', '20', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('78', '21', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('79', '22', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('80', '23', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('81', '24', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('82', '25', '1', null, null, null, '2023-03-05 13:14:23', null, '1', '1');
INSERT INTO `hydra_role_menu` VALUES ('83', '26', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('84', '47', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('85', '53', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('86', '54', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('87', '55', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('88', '56', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('89', '48', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('90', '49', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('91', '50', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('92', '51', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('93', '52', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('94', '1', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('95', '42', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('96', '43', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('97', '44', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('98', '45', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('99', '46', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('100', '5', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('101', '7', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('102', '8', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('103', '13', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('104', '14', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('105', '6', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('106', '15', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('107', '16', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('108', '17', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('109', '18', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('110', '27', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('111', '38', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('112', '39', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('113', '41', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('114', '4', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('115', '9', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('116', '10', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('117', '11', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('118', '12', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('119', '28', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('120', '29', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('121', '31', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('122', '32', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('123', '33', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('124', '34', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('125', '30', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('126', '35', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('127', '36', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('128', '37', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('129', '40', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('130', '2', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('131', '3', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('132', '19', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('133', '20', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('134', '21', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('135', '22', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('136', '23', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('137', '24', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('138', '25', '1', null, null, null, '2023-03-05 15:33:21', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('166', '19', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('167', '20', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('168', '21', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('169', '22', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('170', '23', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('171', '24', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('172', '25', '7', '6', null, null, '2023-03-09 15:07:43', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('173', '1', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('174', '42', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('175', '43', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('176', '44', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('177', '45', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('178', '46', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('179', '5', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('180', '7', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('181', '8', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('182', '13', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('183', '14', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('184', '6', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('185', '15', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('186', '16', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('187', '17', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('188', '18', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('189', '27', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('190', '38', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('191', '39', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('192', '41', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('193', '4', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('194', '9', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('195', '10', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('196', '11', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('197', '12', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('198', '28', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('199', '29', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('200', '31', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('201', '32', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('202', '33', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('203', '34', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('204', '30', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('205', '35', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('206', '36', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('207', '37', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('208', '40', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('209', '2', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('210', '3', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('211', '19', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('212', '20', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('213', '21', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('214', '22', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('215', '23', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('216', '24', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('217', '25', '11', '9999', null, null, '2023-03-10 15:35:05', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('303', '1', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('304', '4', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('305', '9', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('306', '10', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('307', '11', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('308', '12', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('309', '5', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('310', '7', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('311', '8', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('312', '13', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('313', '14', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('314', '6', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('315', '15', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('316', '16', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('317', '17', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('318', '18', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('319', '27', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('320', '38', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('321', '39', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('322', '41', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('323', '28', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('324', '29', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('325', '31', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('326', '32', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('327', '33', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('328', '34', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('329', '30', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('330', '35', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('331', '36', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('332', '37', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('333', '40', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('334', '42', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('335', '43', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('336', '44', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('337', '45', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('338', '46', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('339', '20', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('340', '21', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('341', '22', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('342', '19', '5', '4', null, null, '2023-03-13 14:31:37', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('343', '19', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('344', '1', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('345', '42', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('346', '43', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('347', '44', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('348', '45', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('349', '46', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('350', '5', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('351', '7', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('352', '8', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('353', '13', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('354', '14', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('355', '6', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('356', '15', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('357', '16', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('358', '17', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('359', '18', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('360', '27', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('361', '38', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('362', '39', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('363', '41', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('364', '4', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('365', '9', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('366', '10', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('367', '11', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('368', '12', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('369', '28', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('370', '29', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('371', '31', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('372', '32', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('373', '33', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('374', '34', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('375', '30', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('376', '35', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('377', '36', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('378', '37', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('379', '40', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('380', '20', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('381', '21', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');
INSERT INTO `hydra_role_menu` VALUES ('382', '22', '13', '9999', null, null, '2023-03-13 17:07:56', null, '0', '1');

-- ----------------------------
-- Table structure for hydra_user
-- ----------------------------
DROP TABLE IF EXISTS `hydra_user`;
CREATE TABLE `hydra_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_code` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `real_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `user_nickname` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `user_email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `status` tinyint DEFAULT '0' COMMENT '状态 0:正常；1:停用 ',
  `user_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户ID',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of hydra_user
-- ----------------------------
INSERT INTO `hydra_user` VALUES ('1', '1', '0', null, null, '', 'admin', '$2a$10$AtQatJCSY3L0qP07AlKf5OATykQ/OUAgNQMsd/IFoBXIY.1tJJE26', 'super admin', null, '', '0', '', '', null, null, '9999', null, null, null, null, '0', '1');

-- ----------------------------
-- Table structure for hydra_user_role
-- ----------------------------
DROP TABLE IF EXISTS `hydra_user_role`;
CREATE TABLE `hydra_user_role` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint DEFAULT NULL COMMENT '租户id',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人的id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint DEFAULT NULL COMMENT '创建人的id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1已删除 0未删除',
  `version` int NOT NULL DEFAULT '1' COMMENT '数据版本',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色关联表';

-- ----------------------------
-- Records of hydra_user_role
-- ----------------------------
INSERT INTO `hydra_user_role` VALUES ('1', '1', '1', null, null, null, null, null, '0', '1');
INSERT INTO `hydra_user_role` VALUES ('2', '3', '5', '4', null, null, '2023-03-07 11:34:10', null, '0', '1');
INSERT INTO `hydra_user_role` VALUES ('4', '5', '7', '6', null, null, '2023-03-09 15:07:44', null, '0', '1');
INSERT INTO `hydra_user_role` VALUES ('8', '2', '11', '9999', null, null, '2023-03-13 17:14:46', null, '0', '1');
