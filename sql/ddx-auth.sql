/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80022
Source Host           : 127.0.0.1:3306
Source Database       : ddx-auth

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2022-08-12 17:16:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_aspect_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_aspect_log`;
CREATE TABLE `sys_aspect_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_number` varchar(32) DEFAULT NULL COMMENT '全局流水号',
  `type` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `url` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求接口',
  `header` text COMMENT '请求头',
  `param` text COMMENT '请求响应参数',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求IP地址',
  `nickname` varchar(32) DEFAULT NULL COMMENT '请求用户名称',
  `userId` varchar(32) DEFAULT NULL COMMENT '请求用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5319 DEFAULT CHARSET=utf8 COMMENT='切面日志';

-- ----------------------------
-- Records of sys_aspect_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典值',
  `group_type` varchar(255) DEFAULT NULL COMMENT '字典分组类型',
  `sort` bigint NOT NULL DEFAULT '0' COMMENT '排序字段',
  `modules` varchar(255) NOT NULL DEFAULT 'all' COMMENT '字典模块  all-所有模块',
  `dict_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典描述',
  `create_Id` bigint DEFAULT NULL COMMENT '创建者',
  `update_Id` bigint DEFAULT NULL COMMENT '修改者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '1', '男', 'userGender', '0', 'sys', '用户性别', '1', '1', '2022-06-07 18:53:47', '2022-06-07 18:53:49');
INSERT INTO `sys_dict` VALUES ('2', '2', '女', 'userGender', '1', 'sys', '用户性别', '1', '1', '2022-06-07 18:53:47', '2022-06-07 18:53:49');
INSERT INTO `sys_dict` VALUES ('3', '0', '禁用', 'userStatus', '0', 'sys', '用户状态', '1', '1', '2022-06-08 18:38:51', '2022-06-08 18:38:49');
INSERT INTO `sys_dict` VALUES ('4', '1', '正常', 'userStatus', '1', 'sys', '用户状态', '1', '1', '2022-06-08 18:38:51', '2022-06-08 18:38:49');
INSERT INTO `sys_dict` VALUES ('5', '2', '已锁', 'userStatus', '2', 'sys', '用户状态', '1', '1', '2022-06-08 18:38:51', '2022-06-08 18:38:49');
INSERT INTO `sys_dict` VALUES ('6', 'sys', '系统基础应用', 'serviceModulesName', '0', 'all', '系统服务模块名称', '1', '1', '2022-06-13 09:45:28', '2022-06-13 09:45:31');
INSERT INTO `sys_dict` VALUES ('7', 'auth', '认证服务', 'serviceModulesName', '1', 'all', '系统服务模块名称', '1', '1', '2022-06-13 09:48:24', '2022-06-13 09:48:27');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(128) DEFAULT NULL COMMENT 'URL权限标识',
  `service_module` varchar(64) DEFAULT NULL COMMENT '服务模块 sys-系统服务 auth-认证服务',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_id` bigint DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`name`) USING BTREE,
  KEY `id_2` (`id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '查询字典列表', 'POST:/ddx/sys/sys-dict/list', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('2', '添加字典', 'POST:/ddx/sys/sys-dict/add', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('3', '修改字典', 'POST:/ddx/sys/sys-dict/edit', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('4', '删除字典', 'POST:/ddx/sys/sys-dict/delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('5', '批量删除字典', 'POST:/ddx/sys/sys-dict/batch-delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('6', '校验字典主键', 'POST:/ddx/sys/sys-dict/check-key', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('7', '查询用户列表', 'POST:/ddx/sys/sys-user/list', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('8', '添加用户', 'POST:/ddx/sys/sys-user/add', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('9', '修改用户', 'POST:/ddx/sys/sys-user/edit', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('10', '删除用户', 'POST:/ddx/sys/sys-user/delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('11', '批量删除用户', 'POST:/ddx/sys/sys-user/batch-delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('12', '校验用户主键', 'POST:/ddx/sys/sys-user/check-key', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('13', '查询角色列表', 'POST:/ddx/sys/sys-role/list', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('14', '添加角色', 'POST:/ddx/sys/sys-role/add', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('15', '修改角色', 'POST:/ddx/sys/sys-role/edit', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('16', '删除角色', 'POST:/ddx/sys/sys-role/delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('17', '批量删除角色', 'POST:/ddx/sys/sys-role/batch-delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('18', '校验角色主键', 'POST:/ddx/sys/sys-role/check-key', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('19', '查询资源列表', 'POST:/ddx/sys/sys-resource/list', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('20', '添加资源', 'POST:/ddx/sys/sys-resource/add', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('21', '修改资源', 'POST:/ddx/sys/sys-resource/edit', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('22', '删除资源', 'POST:/ddx/sys/sys-resource/delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('23', '批量删除资源', 'POST:/ddx/sys/sys-resource/batch-delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('24', '校验资源主键', 'POST:/ddx/sys/sys-resource/check-key', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('25', '查询权限列表', 'POST:/ddx/sys/sys-permission/list', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('26', '添加权限', 'POST:/ddx/sys/sys-permission/add', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('27', '修改权限', 'POST:/ddx/sys/sys-permission/edit', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('28', '删除权限', 'POST:/ddx/sys/sys-permission/delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('29', '批量删除权限', 'POST:/ddx/sys/sys-permission/batch-delete', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('30', '校验权限主键', 'POST:/ddx/sys/sys-permission/check-key', 'sys', '2022-04-03 01:15:37', '2022-04-03 01:15:12', '1', '1');
INSERT INTO `sys_permission` VALUES ('31', '系统参数查询', 'POST:/ddx/sys/sys-param-config/get-sys-param-config', 'sys', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('32', '系统参数修改', 'POST:/ddx/sys/sys-param-config/update-param-config', 'sys', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('33', '系统公钥查询', 'POST:/ddx/sys/sys-param-config/get-public-key', 'sys', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('34', '退出登入', 'POST:/ddx/auth/oauth/logout', 'auth', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('35', '查询切面日志列表', 'POST:/ddx/sys/sys-aspect-log/list', 'sys', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('36', '批量删除切面日志', 'POST:/ddx/sys/sys-aspect-log/batch-delete', 'sys', '2022-04-04 02:06:01', '2022-04-04 02:06:04', '1', '1');
INSERT INTO `sys_permission` VALUES ('37', '获取用户树菜单', 'POST:/ddx/sys/sys-user/get-user-tree-menu', 'sys', '2022-05-13 11:02:09', '2022-05-13 11:02:11', '1', '1');
INSERT INTO `sys_permission` VALUES ('38', '修改用户密码', 'POST:/ddx/sys/sys-user/password-change', 'sys', '2022-05-20 14:07:46', '2022-05-20 14:07:50', '1', '1');
INSERT INTO `sys_permission` VALUES ('39', '查询用户详细信息', 'POST:/ddx/sys/sys-user/get-user-info-byId', 'sys', '2022-06-07 16:02:17', '2022-06-07 16:02:20', '1', '1');
INSERT INTO `sys_permission` VALUES ('40', '获取模块分组字典键值', 'POST:/ddx/sys/sys-dict/get-modules-all-group-dict-key-value', 'sys', '2022-06-08 18:10:48', '2022-06-08 18:10:50', '1', '1');
INSERT INTO `sys_permission` VALUES ('41', '根据用户身份ID修改基本信息', 'POST:/ddx/sys/sys-user/update-by-userId', 'sys', '2022-06-15 13:34:30', '2022-06-15 13:34:33', '1', '1');
INSERT INTO `sys_permission` VALUES ('42', '查询所有角色键值', 'POST:/ddx/sys/sys-role/select-role-key-val-all', 'sys', '2022-08-05 10:00:37', '2022-08-05 10:00:40', '1', '1');
INSERT INTO `sys_permission` VALUES ('43', '查询资源菜单树', 'POST:/ddx/sys/sys-resource/select-menu-tree', 'sys', '2022-08-05 16:21:15', '2022-08-05 16:21:18', '1', '1');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `root_id` bigint DEFAULT NULL COMMENT '跟节点',
  `parent_id` bigint DEFAULT NULL COMMENT '父节点',
  `sort` bigint DEFAULT '0' COMMENT '排序',
  `resource_name` varchar(64) DEFAULT NULL COMMENT '资源名称',
  `resource_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源类型 0页签 1 菜单 2 元素',
  `resource_url` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `redirect` varchar(255) DEFAULT NULL COMMENT '重定向地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '使用组件',
  `service_module` varchar(64) DEFAULT NULL COMMENT '服务模块',
  `is_external` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否外部连接 N不是  Y是',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `hide_close` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否可以关闭tabs标签 false 不关闭 true 关闭',
  `hide_tabs` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否隐藏tabs标签 false 不隐藏 true 隐藏 ',
  `hide_menu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单是否隐藏菜单栏 false 不隐藏 true 隐藏 ',
  `cache` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否缓存 true缓存菜单 false补缓存菜单',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', null, null, '0', '控制台', '0', '/', '/sys/dashboard', 'Layout', 'sys', '', 'el-icon-menu', '1', '1', '0', '0', '2022-05-13 11:10:39', '2022-05-13 11:10:42', '1', '1');
INSERT INTO `sys_resource` VALUES ('2', '1', '1', '0', '首页', '1', '/sys/dashboard', null, 'index', 'sys', 'N', 'el-icon-menu', '0', '1', '0', '1', '2022-05-13 11:13:49', '2022-05-13 11:13:52', '1', '1');
INSERT INTO `sys_resource` VALUES ('3', null, null, '1', '测试页面', '0', '/sys/tests', '/sys/test', 'Layout', 'sys', '', 'el-icon-menu', '0', '0', '0', '1', '2022-05-13 11:21:55', '2022-05-13 11:21:59', '1', '1');
INSERT INTO `sys_resource` VALUES ('4', '3', '3', '1', 'test', '1', '/sys/test', null, 'test-list', 'sys', 'N', 'el-icon-menu', '0', '0', '0', '1', '2022-05-13 11:25:23', '2022-05-13 11:25:26', '1', '1');
INSERT INTO `sys_resource` VALUES ('5', '3', '4', '0', '测试按钮', '2', null, null, 'test_bnt', 'sys', '', null, '', '', '', '', '2022-05-23 15:19:35', '2022-05-23 15:19:43', '1', '1');
INSERT INTO `sys_resource` VALUES ('6', null, null, '2', '用户管理', '0', '/sys/user', '', 'Layout', 'sys', null, 'el-icon-menu', '0', '0', '0', '1', '2022-06-13 15:11:27', '2022-06-13 15:11:40', '1', '1');
INSERT INTO `sys_resource` VALUES ('7', '6', '6', '0', '用户列表', '1', 'userList', '', 'user-list', 'sys', 'N', 'el-icon-menu', '0', '0', '0', '1', '2022-06-13 15:15:06', '2022-06-13 15:15:10', '1', '1');
INSERT INTO `sys_resource` VALUES ('8', '6', '6', '1', '操作日志', '1', 'userOper', null, 'user-oper-log', 'sys', 'N', 'el-icon-menu', '0', '0', '0', '1', '2022-06-13 15:50:07', '2022-06-13 15:50:11', '1', '1');
INSERT INTO `sys_resource` VALUES ('9', '1', '2', '0', '查询系统参数', '2', null, null, 'param_config', 'sys', null, null, null, null, null, null, '2022-06-15 16:31:45', '2022-06-15 16:31:48', '1', '1');
INSERT INTO `sys_resource` VALUES ('10', '6', '7', '0', '新增用户', '2', null, null, 'create', 'sys', null, null, null, null, null, null, '2022-07-18 14:25:56', '2022-07-18 14:25:59', '1', '1');
INSERT INTO `sys_resource` VALUES ('11', '6', '7', '1', '编辑用户', '2', null, null, 'edit', 'sys', null, null, null, null, null, null, '2022-07-18 14:28:53', '2022-07-18 14:28:57', '1', '1');
INSERT INTO `sys_resource` VALUES ('12', '6', '7', '2', '删除用户', '2', null, null, 'delete', 'sys', null, null, null, null, null, null, '2022-07-18 14:29:48', '2022-07-18 14:29:51', '1', '1');
INSERT INTO `sys_resource` VALUES ('13', '6', '7', '3', '批量删除用户', '2', null, null, 'batch_delete', 'sys', null, null, null, null, null, null, '2022-07-18 14:30:49', '2022-07-18 14:30:53', '1', '1');
INSERT INTO `sys_resource` VALUES ('14', '6', '7', '4', '查看详情', '2', null, null, 'info', 'sys', null, null, null, null, null, null, '2022-07-18 16:27:40', '2022-07-18 16:27:42', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `status` tinyint(1) DEFAULT '1' COMMENT '角色状态：0-正常；1-停用',
  `create_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'ROOT', '0', '2021-05-21 14:56:51', '2018-12-23 16:00:00', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '系统管理员', 'ADMIN', '0', '2021-03-25 12:39:54', '2018-12-23 16:00:00', '1', '1');
INSERT INTO `sys_role` VALUES ('3', '访问用户', 'GUEST', '0', '2021-05-26 15:49:05', '2019-05-05 16:00:00', '1', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `permission_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '1', '2');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '3');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('5', '1', '5');
INSERT INTO `sys_role_permission` VALUES ('6', '1', '6');
INSERT INTO `sys_role_permission` VALUES ('7', '1', '7');
INSERT INTO `sys_role_permission` VALUES ('8', '1', '8');
INSERT INTO `sys_role_permission` VALUES ('9', '1', '9');
INSERT INTO `sys_role_permission` VALUES ('10', '1', '10');
INSERT INTO `sys_role_permission` VALUES ('11', '1', '11');
INSERT INTO `sys_role_permission` VALUES ('12', '1', '12');
INSERT INTO `sys_role_permission` VALUES ('13', '1', '13');
INSERT INTO `sys_role_permission` VALUES ('14', '1', '14');
INSERT INTO `sys_role_permission` VALUES ('15', '1', '15');
INSERT INTO `sys_role_permission` VALUES ('16', '1', '16');
INSERT INTO `sys_role_permission` VALUES ('17', '1', '17');
INSERT INTO `sys_role_permission` VALUES ('18', '1', '18');
INSERT INTO `sys_role_permission` VALUES ('19', '1', '19');
INSERT INTO `sys_role_permission` VALUES ('20', '1', '20');
INSERT INTO `sys_role_permission` VALUES ('21', '1', '21');
INSERT INTO `sys_role_permission` VALUES ('22', '1', '22');
INSERT INTO `sys_role_permission` VALUES ('23', '1', '23');
INSERT INTO `sys_role_permission` VALUES ('24', '1', '24');
INSERT INTO `sys_role_permission` VALUES ('25', '1', '25');
INSERT INTO `sys_role_permission` VALUES ('26', '1', '26');
INSERT INTO `sys_role_permission` VALUES ('27', '1', '27');
INSERT INTO `sys_role_permission` VALUES ('28', '1', '28');
INSERT INTO `sys_role_permission` VALUES ('29', '1', '29');
INSERT INTO `sys_role_permission` VALUES ('30', '1', '30');
INSERT INTO `sys_role_permission` VALUES ('31', '1', '31');
INSERT INTO `sys_role_permission` VALUES ('32', '1', '32');
INSERT INTO `sys_role_permission` VALUES ('33', '1', '33');
INSERT INTO `sys_role_permission` VALUES ('34', '1', '34');
INSERT INTO `sys_role_permission` VALUES ('35', '1', '35');
INSERT INTO `sys_role_permission` VALUES ('36', '1', '36');
INSERT INTO `sys_role_permission` VALUES ('37', '1', '37');
INSERT INTO `sys_role_permission` VALUES ('38', '1', '38');
INSERT INTO `sys_role_permission` VALUES ('39', '1', '39');
INSERT INTO `sys_role_permission` VALUES ('40', '1', '40');
INSERT INTO `sys_role_permission` VALUES ('41', '1', '41');
INSERT INTO `sys_role_permission` VALUES ('42', '1', '42');
INSERT INTO `sys_role_permission` VALUES ('43', '1', '43');
INSERT INTO `sys_role_permission` VALUES ('44', null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) DEFAULT NULL COMMENT '用户id',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别：1-男 2-女',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `login_service` varchar(20) DEFAULT NULL COMMENT '默认登入服务',
  `status` varchar(1) DEFAULT '1' COMMENT '用户状态：1-正常 ,2已锁 0-禁用',
  `error_count` int DEFAULT '0' COMMENT '登入错误次数',
  `email` varchar(128) DEFAULT NULL COMMENT '用户邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'ID20220201000001', 'adminroot', '超级管理员', '1', '207CF410532F92A47DEE245CE9B11FF71F578EBD763EB3BBEA44EBD043D018FB', 'https://gitee.com/haoxr/image/raw/master/20210605215800.png', '17621590365', 'sys', '1', '0', '123@163.com', '2019-10-10 13:41:22', '2022-07-26 10:41:48', '1', '1');
INSERT INTO `sys_user` VALUES ('2', 'ID20220201000002', 'admin', '系统管理员', '1', '207CF410532F92A47DEE245CE9B11FF71F578EBD763EB3BBEA44EBD043D018FB', 'https://gitee.com/haoxr/image/raw/master/20210605215800.png', '17621210366', 'sys', '1', '0', '123@163.com', '2019-10-10 13:41:22', '2022-06-01 17:56:41', '1', '1');
INSERT INTO `sys_user` VALUES ('3', 'ID20220201000003', 'test', '测试小用户', '1', '207CF410532F92A47DEE245CE9B11FF71F578EBD763EB3BBEA44EBD043D018FB', 'https://gitee.com/haoxr/image/raw/master/20210605215800.png', '17621210366', 'sys', '1', '0', '123@163.com', '2021-06-05 01:31:29', '2021-06-05 01:31:29', '1', '1');
INSERT INTO `sys_user` VALUES ('4', 'ID20220201000004', 'user', '用户', '1', '207CF410532F92A47DEE245CE9B11FF71F578EBD763EB3BBEA44EBD043D018FB', 'https://gitee.com/haoxr/image/raw/master/20210605215800.png', '17621210366', 'sys', '1', '0', '123@163.com', '2021-06-05 01:31:29', '2022-07-26 01:31:29', '1', '1');

-- ----------------------------
-- Table structure for sys_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_resource`;
CREATE TABLE `sys_user_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `resource_id` bigint DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户资源关联表';

-- ----------------------------
-- Records of sys_user_resource
-- ----------------------------
INSERT INTO `sys_user_resource` VALUES ('1', '1', '1');
INSERT INTO `sys_user_resource` VALUES ('2', '1', '2');
INSERT INTO `sys_user_resource` VALUES ('3', '1', '3');
INSERT INTO `sys_user_resource` VALUES ('4', '1', '4');
INSERT INTO `sys_user_resource` VALUES ('5', '1', '5');
INSERT INTO `sys_user_resource` VALUES ('6', '1', '6');
INSERT INTO `sys_user_resource` VALUES ('7', '1', '7');
INSERT INTO `sys_user_resource` VALUES ('8', '1', '8');
INSERT INTO `sys_user_resource` VALUES ('9', '1', '9');
INSERT INTO `sys_user_resource` VALUES ('10', '1', '10');
INSERT INTO `sys_user_resource` VALUES ('11', '1', '11');
INSERT INTO `sys_user_resource` VALUES ('12', '1', '12');
INSERT INTO `sys_user_resource` VALUES ('13', '1', '13');
INSERT INTO `sys_user_resource` VALUES ('14', '1', '14');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3', '3');
INSERT INTO `sys_user_role` VALUES ('4', '4', '3');

-- ----------------------------
-- Table structure for sys_whitelist_request
-- ----------------------------
DROP TABLE IF EXISTS `sys_whitelist_request`;
CREATE TABLE `sys_whitelist_request` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '白名单路由名称',
  `url` varchar(225) DEFAULT NULL COMMENT '白名单路由',
  `type` varchar(255) DEFAULT NULL COMMENT '请求白名单类型 1 接口访问 2接口访问时间',
  `service_module` varchar(64) DEFAULT NULL COMMENT '服务模块 sys-系统服务 auth-认证服务',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` bigint DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='白名单路由';

-- ----------------------------
-- Records of sys_whitelist_request
-- ----------------------------
INSERT INTO `sys_whitelist_request` VALUES ('1', '验证ToKen', '/ddx/auth/oauth/token', '1', 'auth', '2022-04-26 16:06:09', '2022-04-26 16:06:12', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('2', '权限验证', '/ddx/auth/oauth/authorize', '1', 'auth', '2022-04-26 16:06:16', '2022-04-26 16:06:20', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('3', 'swagger-ui', '/ddx/sys/swagger-ui.html', '1', 'sys', '2022-05-20 17:56:23', '2022-05-20 17:56:25', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('4', 'swagger-web', '/ddx/sys/webjars/**', '1', 'sys', '2022-05-20 17:56:23', '2022-05-20 17:56:23', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('5', 'swagger-resource', '/ddx/sys/swagger-resources/**', '1', 'sys', '2022-05-20 17:56:23', '2022-05-20 17:56:23', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('6', 'swagger-v2', '/ddx/sys/v2/**', '1', 'sys', '2022-05-20 17:56:23', '2022-05-20 17:56:23', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('7', 'swagger-doc-ui', '/ddx/sys/doc.html', '1', 'sys', '2022-05-20 17:56:23', '2022-05-20 17:56:23', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('8', '查询用户列表', '/ddx/sys/sys-user/list', '2', 'sys', '2022-07-14 10:46:28', '2022-07-14 10:46:32', '1', '1');
INSERT INTO `sys_whitelist_request` VALUES ('9', '查询角色列表', '/ddx/sys/sys-role/list', '2', 'sys', '2022-07-18 18:12:49', '2022-07-18 18:12:52', '1', '1');
