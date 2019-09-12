-- 业务对象、以及表单模块的表创建语句

-- ----------------------------
-- Table structure for bus_column
-- ----------------------------
DROP TABLE IF EXISTS `bus_column`;
CREATE TABLE `bus_column` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `table_id_` varchar(64) DEFAULT NULL COMMENT '表id',
  `key_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) DEFAULT NULL COMMENT '名字',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型',
  `length_` int(11) DEFAULT NULL,
  `decimal_` int(11) DEFAULT NULL,
  `required_` tinyint(4) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  `default_value_` varchar(128) DEFAULT NULL,
  `comment_` varchar(256) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务字段表';


-- ----------------------------
-- Table structure for bus_column_ctrl
-- ----------------------------
DROP TABLE IF EXISTS `bus_column_ctrl`;
CREATE TABLE `bus_column_ctrl` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `column_id_` varchar(64) DEFAULT NULL COMMENT '字段ID',
  `type_` varchar(64) DEFAULT NULL COMMENT '控件类型',
  `config_` varchar(256) DEFAULT NULL COMMENT '控件配置',
  `valid_rule_` varchar(256) DEFAULT NULL COMMENT '验证规则',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `column_id_unique` (`column_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段控件表';


-- ----------------------------
-- Table structure for bus_object
-- ----------------------------
DROP TABLE IF EXISTS `bus_object`;
CREATE TABLE `bus_object` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT 'key',
  `name_` varchar(128) DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) DEFAULT NULL COMMENT '描述',
  `relation_json_` text COMMENT 'relation字段用来持久化入库的字符串字段',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `persistence_type_` varchar(64) DEFAULT NULL COMMENT '持久化类型',
   per_type_config_ varchar(255) DEFAULT NULL COMMENT '持久化类型的配置内容',
  `overall_arrangement_` text DEFAULT NULL COMMENT '整体布局',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象';


-- ----------------------------
-- Table structure for bus_permission
-- ----------------------------
DROP TABLE IF EXISTS `bus_permission`;
CREATE TABLE `bus_permission` (
  `id_` varchar(64) NOT NULL,
  `bo_key_` varchar(128) DEFAULT NULL COMMENT 'boKey',
  `obj_type_` varchar(64) NOT NULL COMMENT '配置这个权限的对象，可以是表单，流程，或流程节点',
  `obj_val_` varchar(128) DEFAULT NULL COMMENT '能获取到配置权限的对象的唯一值\r\n 通常是key 或 id \r\n 可以是自定义的\r\n 例如 某个流程的某个节点，可以是 流程key.nodeKey\r\n 这样的格式\r\n',
  `bus_obj_map_json_` longtext COMMENT 'busObjMap的json数据',
  `rights_json_` longtext COMMENT 'rights的json数据',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `obj_type_obj_val_unique_idx_` (`obj_type_`,`obj_val_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bo权限';


-- ----------------------------
-- Table structure for bus_table
-- ----------------------------
DROP TABLE IF EXISTS `bus_table`;
CREATE TABLE `bus_table` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT '业务表key',
  `name_` varchar(64) DEFAULT NULL COMMENT '表名',
  `comment_` varchar(256) DEFAULT NULL COMMENT '描述',
  `ds_key_` varchar(64) DEFAULT NULL COMMENT '数据源的别名',
  `ds_name_` varchar(128) DEFAULT NULL COMMENT '数据源名称',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `external_` smallint(6) DEFAULT NULL COMMENT '是否外部表',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Table structure for form_cust_dialog
-- ----------------------------
DROP TABLE IF EXISTS `form_cust_dialog`;
CREATE TABLE `form_cust_dialog` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(128) NOT NULL COMMENT '名字',
  `desc_` varchar(256) DEFAULT NULL COMMENT '描述',
  `style_` varchar(32) DEFAULT NULL COMMENT '显示类型',
  `ds_key_` varchar(64) DEFAULT NULL COMMENT '数据源别名',
  `ds_name_` varchar(128) DEFAULT NULL COMMENT '数据源名字',
  `obj_type_` varchar(32) DEFAULT NULL COMMENT '对象类型',
  `obj_name_` varchar(64) NOT NULL COMMENT '对象名称',
  `page_` tinyint(4) DEFAULT NULL COMMENT '是否分页',
  `page_size_` int(11) DEFAULT NULL COMMENT '分页大小',
  `width_` int(11) DEFAULT NULL COMMENT '弹出框的宽度',
  `height_` int(11) DEFAULT NULL COMMENT '弹出框的高度',
  `system_` tinyint(4) DEFAULT NULL COMMENT '是否系统内置',
  `multiple_` tinyint(4) DEFAULT NULL COMMENT '是否多选',
  `tree_config_json_` varchar(512) DEFAULT NULL COMMENT '树形的配置信息，json字段',
  `display_fields_json_` text COMMENT '显示字段',
  `condition_fields_json_` text COMMENT '条件字段的json',
  `return_fields_json_` text COMMENT '返回字段json',
  `sort_fields_json_` text COMMENT '排序字段',
  `data_source_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `idx_unqiue` (`key_`) USING BTREE
) DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='自定义对话框';
 
-- ----------------------------
-- Table structure for form_def
-- ----------------------------
DROP TABLE IF EXISTS `form_def`;
CREATE TABLE `form_def` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `type_` varchar(64) NOT NULL COMMENT '分类（pc/mobile）',
  `key_` varchar(64) DEFAULT NULL COMMENT 'key',
  `name_` varchar(128) DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) DEFAULT NULL COMMENT '描述',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `bo_key_` varchar(64) DEFAULT NULL COMMENT '业务对象key',
  `bo_name_` varchar(128) DEFAULT NULL COMMENT '业务对象名称',
  `html_` longtext COMMENT 'html',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creator_` varchar(128) DEFAULT NULL COMMENT '创建人名字',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updator_` varchar(128) DEFAULT NULL COMMENT '更新人名字',
  `version_` int(11) DEFAULT NULL COMMENT '版本号',
  `delete_` tinyint(4) DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='表单';
 
-- ----------------------------
-- Table structure for form_template
-- ----------------------------
DROP TABLE IF EXISTS `form_template`;
CREATE TABLE `form_template` (
  `id_` varchar(64) NOT NULL COMMENT '模板id',
  `name_` varchar(128) DEFAULT NULL COMMENT '模板名称',
  `form_type_` varchar(64) DEFAULT NULL COMMENT '表单类型（pc/mobile/vuepc）',
  `type_` varchar(32) DEFAULT NULL COMMENT '模板类型',
  `html_` text COMMENT '模板内容',
  `desc_` varchar(400) DEFAULT NULL COMMENT '模板描述',
  `editable_` tinyint(4) DEFAULT NULL COMMENT '是否可以编辑',
  `key_` varchar(64) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id_`)
) DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='表单模版';

-- ---------------ORG 模块 SQL语句 ---------------
CREATE TABLE `org_user` (
  `id_` varchar(64) NOT NULL,
  `fullname_` varchar(255) NOT NULL COMMENT '姓名',
  `account_` varchar(255) NOT NULL COMMENT '账号',
  `password_` varchar(64) NOT NULL COMMENT '密码',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `mobile_` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `weixin_` varchar(64) DEFAULT NULL COMMENT '微信号',
  `address_` varchar(512) DEFAULT NULL COMMENT '地址',
  `photo_` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_` varchar(10) DEFAULT NULL COMMENT '性别：男，女，未知',
  `from_` varchar(64) DEFAULT NULL COMMENT '来源',
  `status_` int(11) NOT NULL DEFAULT '1' COMMENT '0:禁用，1正常',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  KEY `account` (`account_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

 
CREATE TABLE `org_group` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) NOT NULL COMMENT '名字',
  `parent_id_` varchar(64) DEFAULT NULL COMMENT '父ID',
  `sn_` int(11) DEFAULT '100' COMMENT '排序',
  `code_` varchar(64) NOT NULL,
  `type_` varchar(64) DEFAULT NULL COMMENT '类型：0集团，1公司，3部门',
  `desc_` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `path_` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `parent_id_` (`parent_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构';


CREATE TABLE `org_relation` (
  `id_` varchar(64) NOT NULL COMMENT 'ID',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '组ID',
  `user_id_` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `is_master_` int(11) DEFAULT '0' COMMENT '0:默认组织，1：从组织',
  `role_id_` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `status_` int(11) DEFAULT '1' COMMENT '状态：1启用，2禁用',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型：groupUser,groupRole,userRole,groupUserRole',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  KEY `FK_reference_21` (`user_id_`) USING BTREE,
  KEY `FK_reference_22` (`group_id_`) USING BTREE,
  KEY `FK_reference_23` (`role_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `org_role` (
  `id_` varchar(64) NOT NULL,
  `name_` varchar(64) NOT NULL COMMENT '角色名称',
  `alias_` varchar(64) NOT NULL COMMENT '别名',
  `enabled_` int(11) NOT NULL DEFAULT '1' COMMENT '0：禁用，1：启用',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '分类ID',
  `type_name_` varchar(64) DEFAULT NULL COMMENT '分类名字',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色管理';

-- 创建组织用户关系视图
CREATE VIEW org_relation_view AS
SELECT tgroup.name_ groupName,tuser.fullname_ userName,role.name_ roleName ,
	CONCAT(tgroup.name_,'-',role.name_) postName,concat(`tgroup`.`id_`,'-',`role`.`id_`) AS `postId`, relation.*
	FROM org_relation relation 
	left join org_user tuser on relation.user_id_ = tuser.id_
	left join org_group tgroup on relation.group_id_ = tgroup.id_
	left join org_role role on relation.role_id_ = role.id_

-- ----- 常用脚本，流水号，子系统，菜单资源，通用授权，面板，系统属性，数据字典等功能表

 
SET FOREIGN_KEY_CHECKS=0;
-- ------------------sys 模块功能 持久化表-----------------

-- ----------------------------
-- Table structure for sys_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorization`;
CREATE TABLE `sys_authorization` (
  `rights_id_` varchar(64) NOT NULL COMMENT 'id',
  `rights_object_` varchar(64) NOT NULL COMMENT '授权对象表分区用',
  `rights_target_` varchar(64) NOT NULL COMMENT '授权目标ID',
  `rights_type_` varchar(64) NOT NULL COMMENT '权限类型',
  `rights_identity_` varchar(64) NOT NULL COMMENT '授权标识',
  `rights_identity_name_` varchar(255) NOT NULL COMMENT '标识名字',
  `rights_permission_code_` varchar(125) NOT NULL COMMENT '授权code=identity+type',
  `rights_create_time_` timestamp NOT NULL   COMMENT '创建时间',
  `rights_create_by_` varchar(64) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`rights_id_`),
  KEY `idx_permission_code_` (`rights_permission_code_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='通用资源授权配置';

-- ----------------------------
-- Table structure for sys_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_dict`;
CREATE TABLE `sys_data_dict` (
  `id_` varchar(64) NOT NULL COMMENT 'id',
  `parent_id_` varchar(64) DEFAULT NULL COMMENT '上级id',
  `key_` varchar(255) NOT NULL COMMENT 'key',
  `name_` varchar(255) NOT NULL COMMENT 'name',
  `dict_key_` varchar(255) NOT NULL COMMENT '字典key',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `dict_type_` varchar(10) NOT NULL COMMENT 'dict/node字典项',
  `delete_flag_` varchar(1) DEFAULT NULL COMMENT '是否删除',
  `create_time_` timestamp NOT NULL   COMMENT '创建时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='数据字典';

-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_source`;
CREATE TABLE `sys_data_source` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) DEFAULT NULL COMMENT '数据源名称',
  `desc_` varchar(256) DEFAULT NULL COMMENT '数据源的描述',
  `db_type_` varchar(64) DEFAULT NULL COMMENT '数据库类型',
  `class_path_` varchar(100) DEFAULT NULL COMMENT '数据源全路径',
  `attributes_json_` text COMMENT '属性配置',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='数据源';

-- ----------------------------
-- Table structure for sys_data_source_def
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_source_def`;
CREATE TABLE `sys_data_source_def` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) DEFAULT NULL COMMENT '数据源名称',
  `class_path_` varchar(100) DEFAULT NULL COMMENT '数据源全路径',
  `attributes_json_` text COMMENT '属性配置',
  PRIMARY KEY (`id_`),
  KEY `class_path_unique` (`class_path_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='数据源模板';
 
-- ----------------------------
-- Table structure for sys_log_err
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_err`;
CREATE TABLE `sys_log_err` (
  `id_` varchar(50) NOT NULL COMMENT '主键',
  `account_` varchar(20) DEFAULT NULL COMMENT '帐号',
  `ip_` varchar(20) DEFAULT NULL COMMENT 'IP来源',
  `ip_address_` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `status_` varchar(64) DEFAULT NULL COMMENT '状态：unchecked，checked，fixed',
  `url_` varchar(1500) DEFAULT NULL COMMENT '错误URL',
  `content_` text COMMENT '出错信息',
  `request_param_` text COMMENT '请求参数',
  `create_time_` datetime DEFAULT NULL COMMENT '出错时间',
  `stack_trace_` longtext COMMENT '出错异常堆栈',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常日志';

-- ----------------------------
-- Table structure for sys_properties
-- ----------------------------
CREATE TABLE `sys_properties` (
  `id_` varchar(64) NOT NULL COMMENT 'ID',
  `name_` varchar(64) DEFAULT NULL COMMENT '属性名',
  `alias_` varchar(64) DEFAULT NULL COMMENT '别名',
  `group_` varchar(64) DEFAULT NULL COMMENT '分组',
  `value_` varchar(500) DEFAULT NULL COMMENT '值',
  `encrypt_` int(11) DEFAULT NULL COMMENT '是否加密',
  `update_by_` varchar(64) DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `create_by_` varchar(64) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL,
  `description_` varchar(500) DEFAULT NULL,
  `environment_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统属性';
 

CREATE TABLE `sys_resource` (
  `ID_` varchar(64) NOT NULL COMMENT '主键',
  `system_id_` varchar(64) DEFAULT NULL COMMENT '子系统ID',
  `alias_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) DEFAULT NULL COMMENT '名字',
  `url_` varchar(120) DEFAULT NULL COMMENT '请求地址',
  `enable_` int(11) DEFAULT NULL COMMENT '显示到菜单(1,显示,0 ,不显示)',
  `opened_` int(11) DEFAULT NULL COMMENT '是否默认打开',
  `icon_` varchar(50) DEFAULT NULL COMMENT '图标',
  `type_` varchar(50) DEFAULT NULL COMMENT 'menu，button，link',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `parent_id_` varchar(50) DEFAULT NULL COMMENT '父节点ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Table structure for sys_res_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_res_role`;
CREATE TABLE `sys_res_role` (
  `ID_` varchar(50) NOT NULL DEFAULT '' COMMENT '主键',
  `SYSTEM_ID_` varchar(50) DEFAULT NULL COMMENT '系统ID',
  `res_id_` varchar(50) DEFAULT NULL COMMENT '资源ID',
  `role_id_` varchar(50) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='角色资源分配';
 
-- ----------------------------
-- Table structure for sys_script
-- ----------------------------
DROP TABLE IF EXISTS `sys_script`;
CREATE TABLE `sys_script` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(128) DEFAULT NULL COMMENT '脚本名称',
  `script_` text COMMENT '脚本',
  `category_` varchar(128) DEFAULT NULL COMMENT '脚本分类',
  `memo_` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='常用脚本';

-- ----------------------------
-- Table structure for sys_serialno
-- ----------------------------
DROP TABLE IF EXISTS `sys_serialno`;
CREATE TABLE `sys_serialno` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) DEFAULT NULL COMMENT '名称',
  `alias_` varchar(20) DEFAULT NULL COMMENT '别名',
  `regulation_` varchar(128) DEFAULT NULL COMMENT '规则',
  `gen_type_` smallint(6) DEFAULT NULL COMMENT '生成类型',
  `no_length_` int(11) DEFAULT NULL COMMENT '流水号长度',
  `cur_date_` varchar(20) DEFAULT NULL COMMENT '当前日期',
  `init_value_` int(11) DEFAULT NULL COMMENT '初始值',
  `cur_value_` int(11) DEFAULT NULL COMMENT '当前值',
  `step_` smallint(6) DEFAULT NULL COMMENT '步长',
  PRIMARY KEY (`id_`),
  KEY `idx_uni_alias_val` (`alias_`,`cur_value_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='流水号生成';

 
CREATE TABLE `sys_subsystem` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '系统名称',
  `alias_` varchar(64) DEFAULT NULL COMMENT '系统别名',
  `url_` varchar(500) DEFAULT NULL COMMENT '子系统地址，空则为当前系统',
  `open_type_` varchar(64) DEFAULT NULL COMMENT '打开方式',
  `enabled_` int(11) DEFAULT NULL COMMENT '是否可用 1 可用，0 ，不可用',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `is_default_` int(11) DEFAULT NULL COMMENT '是否默认 1 可用，0 ，不可用',
  `desc_` varchar(500) DEFAULT NULL,
  `config_` varchar(2000) DEFAULT NULL,
  `create_by_` varchar(64) DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `update_by_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子系统定义';


-- ----------------------------
-- Table structure for sys_tree
-- ----------------------------
DROP TABLE IF EXISTS `sys_tree`;
CREATE TABLE `sys_tree` (
  `id_` varchar(64)  NOT NULL COMMENT '主键',
  `key_` varchar(64)  DEFAULT NULL COMMENT '别名',
  `name_` varchar(256)  DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256)  DEFAULT NULL COMMENT '描述',
  `system_` tinyint(4) DEFAULT NULL COMMENT '是否系统内置树',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin    COMMENT='系统树';

-- ----------------------------
-- Table structure for sys_tree_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_tree_node`;
CREATE TABLE `sys_tree_node` (
  `id_` varchar(64)  NOT NULL COMMENT '主键',
  `key_` varchar(64)  DEFAULT NULL COMMENT '别名',
  `name_` varchar(128)  DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256)  DEFAULT NULL COMMENT '描述',
  `tree_id_` varchar(64)  DEFAULT NULL COMMENT '所属树id',
  `parent_id_` varchar(64)  DEFAULT NULL COMMENT '父ID',
  `path_` varchar(512)  DEFAULT NULL COMMENT '路径 eg:pppid.ppid.pid',
  `sn_` tinyint(4) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `tree_id_key_unique_` (`key_`,`tree_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin    COMMENT='系统树节点';

-- ----------------------------
-- Table structure for sys_workbench_layout
-- ----------------------------
DROP TABLE IF EXISTS `sys_workbench_layout`;
CREATE TABLE `sys_workbench_layout` (
  `id_` varchar(64) NOT NULL,
  `panel_id_` varchar(255) NOT NULL COMMENT '面板id',
  `cust_width_` int(10) DEFAULT NULL COMMENT '自定义宽',
  `cust_height_` int(10) DEFAULT NULL COMMENT '自定义高',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `user_id_` varchar(64) NOT NULL COMMENT '用户id',
  `create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_`),
  KEY `idx_panel_id_` (`panel_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='工作台布局';

-- ----------------------------
-- Table structure for sys_workbench_panel
-- ----------------------------
DROP TABLE IF EXISTS `sys_workbench_panel`;
CREATE TABLE `sys_workbench_panel` (
  `id_` varchar(64) NOT NULL,
  `alias_` varchar(255) NOT NULL COMMENT '标识',
  `name_` varchar(255) NOT NULL DEFAULT '' COMMENT '名字',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型',
  `desc_` varchar(500) DEFAULT NULL COMMENT '描述',
  `data_type_` varchar(64) DEFAULT NULL COMMENT '数据类型',
  `data_source_` varchar(255) DEFAULT NULL COMMENT '数据来源',
  `auto_refresh_` int(10) DEFAULT '0' COMMENT '自动刷新',
  `width_` int(10) DEFAULT NULL COMMENT '宽',
  `height_` int(10) DEFAULT NULL COMMENT '高',
  `display_content_` text COMMENT '展示内容',
  `more_url_` varchar(255) DEFAULT NULL COMMENT '更多链接',
  `create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by_` varchar(64) DEFAULT NULL,
  `update_time_`  datetime  DEFAULT NULL ,
  `update_by_` varchar(64) DEFAULT NULL,
  `delete_flag_` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `idx_alias_` (`alias_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='工作台面板';

-- ----------------------------
-- Table structure for sys_workbench_panel_templ
-- ----------------------------
DROP TABLE IF EXISTS `sys_workbench_panel_templ`;
CREATE TABLE `sys_workbench_panel_templ` (
  `id_` varchar(64) NOT NULL,
  `key_` varchar(255) DEFAULT NULL COMMENT '模板key',
  `name_` varchar(255) DEFAULT NULL,
  `desc_` varchar(500) DEFAULT NULL COMMENT '模板描述',
  `html_` text COMMENT '模板内容',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='工作台面板模板';

CREATE TABLE `sys_file` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) DEFAULT NULL COMMENT '附件名',
  `uploader_` varchar(128) DEFAULT NULL COMMENT '上传器',
  `path_` varchar(256) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `version_` int(11) DEFAULT NULL COMMENT '版本号',
  `delete_` tinyint(4) DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`id_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='系统附件';


-- 附件存储 2018-6-10 00:29:06
-- IUploader 实现db策略的上传实现
CREATE TABLE `db_uploader` (
  `id_` varchar(64) NOT NULL,
  `bytes_` longblob,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `c_holiday_conf` (
  `id_` varchar(64) NOT NULL,
  `name_` varchar(255) DEFAULT NULL,
  `system_` varchar(255) DEFAULT NULL,
  `year_` int(255) DEFAULT NULL,
  `startDay_` date DEFAULT NULL,
  `endDay_` date DEFAULT NULL,
  `type_` varchar(255) DEFAULT NULL,
  `remark_` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `c_work_calendar` (
  `id_` varchar(20) NOT NULL,
  `day_` date DEFAULT NULL,
  `isWorkDay_` varchar(20) DEFAULT NULL,
  `type_` varchar(255) DEFAULT NULL,
  `system_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `c_schedule` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `title_` varchar(500) DEFAULT NULL COMMENT '标题',
  `desc_` varchar(2000) DEFAULT NULL COMMENT '描述',
  `task_url_` varchar(255) DEFAULT NULL COMMENT '任务连接',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型',
  `open_type_` varchar(64) DEFAULT NULL COMMENT '任务打开方式',
  `owner_` varchar(64) DEFAULT NULL COMMENT '所属人',
  `owner_name_` varchar(64) DEFAULT NULL COMMENT '所属人',
  `participant_names_` varchar(1000) DEFAULT NULL COMMENT '参与者',
  `start_time_` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time_` datetime DEFAULT NULL  COMMENT '结束日期',
  `actual_start_time_` datetime DEFAULT NULL COMMENT '实际开始日期',
  `complete_time_` datetime DEFAULT NULL COMMENT '完成时间',
  `rate_progress_` int(10) DEFAULT NULL COMMENT '进度',
  `submitter_` varchar(64) DEFAULT NULL COMMENT '提交人',
  `submitNamer_` varchar(64) DEFAULT NULL COMMENT '提交人',
  `remark_` varchar(500) DEFAULT NULL,
  `isLock_` varchar(10) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL  COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `delete_flag_` varchar(10) DEFAULT NULL COMMENT '删除标记',
  `rev_` int(10) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程';



CREATE TABLE `c_schedule_participant` (
  `id_` varchar(20) NOT NULL COMMENT 'id',
  `schedule_id_` varchar(20) DEFAULT NULL COMMENT '日程ID',
  `participantor_name_` varchar(255) DEFAULT NULL COMMENT '参与者名字',
  `participantor_` varchar(64) DEFAULT NULL COMMENT '参与者',
  `rate_progress_` int(10) DEFAULT NULL COMMENT 'ilka完成比例',
  `submit_comment_` varchar(500) DEFAULT NULL COMMENT 'ilka提交注释',
  `create_time_` datetime DEFAULT NULL   COMMENT '创建时间',
  `update_time_` datetime DEFAULT NULL   COMMENT '更新时间',
  `actual_start_time_` datetime DEFAULT NULL   COMMENT 'ilka实际开始时间',
  `complete_time_` datetime DEFAULT NULL   COMMENT 'ilka完成时间',
  PRIMARY KEY (`id_`),
  KEY `idx_schedule_id` (`schedule_id_`),
  KEY `idx_participantor` (`participantor_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程参与者';


CREATE TABLE `c_schedule_biz` (
  `id_` varchar(20) NOT NULL COMMENT 'id',
  `schedule_id_` varchar(20) NOT NULL COMMENT '日程id',
  `biz_id_` varchar(20) NOT NULL COMMENT '业务id',
  `from_` varchar(64) NOT NULL COMMENT '来源',
  PRIMARY KEY (`id_`),
  KEY `idx_schedule_id` (`schedule_id_`),
  KEY `idx_biz_id` (`biz_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程业务关联表';

-- 流程模块表创建语句   含 activiti SQL， AgileBPM包装的SQL



SET FOREIGN_KEY_CHECKS=0;

-- ---------------- Activiti table create --------------------
-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `ACT_EVT_LOG`;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64)  DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64)  DEFAULT NULL,
  `PROC_INST_ID_` varchar(64)  DEFAULT NULL,
  `EXECUTION_ID_` varchar(64)  DEFAULT NULL,
  `TASK_ID_` varchar(64)  DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255)  DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255)  DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `act_ge_bytearray_ibfk_1` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) NOT NULL,
  `VALUE_` varchar(300) DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64)  NOT NULL,
  `PROC_DEF_ID_` varchar(64)  NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64)  DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE
) ENGINE=InnoDB ;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_MODEL`;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_TIME_` datetime NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_1` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_2` (`PROC_INST_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_3` (`TASK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_JOB`;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) NOT NULL,
  `LOCK_OWNER_` varchar(255) DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUEDATE_` datetime NOT NULL,
  PRIMARY KEY (`ID_`),
  KEY `act_ru_job_ibfk_1` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) NOT NULL,
  `EVENT_NAME_` varchar(255) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) DEFAULT NULL,
  `CONFIGURATION_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) DEFAULT NULL,
  `ACT_ID_` varchar(255) DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `act_ru_execution_ibfk_1` (`PARENT_ID_`) USING BTREE,
  KEY `act_ru_execution_ibfk_2` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_execution_ibfk_4` (`SUPER_EXEC_`) USING BTREE,
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


DROP TABLE IF EXISTS `ACT_RU_TASK`;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) DEFAULT NULL,
  `OWNER_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `DELEGATION_` varchar(64) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_RU_TASK_IBFK_1` (`EXECUTION_ID_`) USING BTREE,
  KEY `act_ru_task_ibfk_2` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_task_ibfk_3` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) DEFAULT NULL,
  `TEXT2_` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_1` (`BYTEARRAY_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_2` (`EXECUTION_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_3` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
 

-- ---------------- AgileBPM table create --------------------

-- ----------------------------
-- Table structure for bpm_bus_link
-- ----------------------------
DROP TABLE IF EXISTS `bpm_bus_link`;
CREATE TABLE `bpm_bus_link` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `def_id_` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  `inst_id_` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `biz_id_` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_code_` varchar(64) NOT NULL COMMENT 'bo_code',
  PRIMARY KEY (`id_`,`biz_code_`),
  KEY `link_inst_id_idx` (`inst_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例与业务数据关系表'
/*!50500 PARTITION BY LIST  COLUMNS(biz_code_)
(PARTITION p01 VALUES IN ('unknown') ENGINE = InnoDB) */;




-- ----------------------------
-- Table structure for bpm_definition
-- ----------------------------
DROP TABLE IF EXISTS `bpm_definition`;
CREATE TABLE `bpm_definition` (
  `id_` varchar(64) NOT NULL COMMENT '流程定义ID',
  `name_` varchar(64) NOT NULL COMMENT '流程名称',
  `key_` varchar(64) NOT NULL COMMENT '流程业务主键',
  `desc_` varchar(1024) DEFAULT NULL COMMENT '流程描述',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '所属分类ID',
  `status_` varchar(40) DEFAULT NULL COMMENT '流程状态。草稿、发布、禁用',
  `act_def_id_` varchar(64) DEFAULT NULL COMMENT 'BPMN - 流程定义ID',
  `act_model_id_` varchar(64) DEFAULT NULL,
  `act_deploy_id_` varchar(64) DEFAULT NULL COMMENT 'BPMN - 流程发布ID',
  `version_` int(11) DEFAULT NULL COMMENT '版本 - 当前版本号',
  `main_def_id_` varchar(64) DEFAULT NULL COMMENT '版本 - 主版本流程ID',
  `is_main_` char(1) DEFAULT NULL COMMENT '版本 - 是否主版本',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `support_mobile_` int(11) DEFAULT '0',
  `def_setting_` text,
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `bpm_process_def_key` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin  COMMENT='流程定义';

-- ----------------------------
-- Table structure for bpm_instance
-- ----------------------------
DROP TABLE IF EXISTS `bpm_instance`;
CREATE TABLE `bpm_instance` (
  `id_` varchar(64) NOT NULL COMMENT '流程实例ID',
  `subject_` varchar(128) NOT NULL COMMENT '流程实例标题',
  `def_id_` varchar(64) NOT NULL COMMENT '流程定义ID',
  `act_def_id_` varchar(64) DEFAULT NULL COMMENT 'BPMN流程定义ID',
  `def_key_` varchar(128) DEFAULT NULL COMMENT '流程定义Key',
  `def_name_` varchar(128) NOT NULL COMMENT '流程名称',
  `biz_key_` varchar(64) DEFAULT NULL COMMENT '关联数据业务主键',
  `status_` varchar(40) DEFAULT NULL COMMENT '实例状态',
  `end_time_` datetime DEFAULT NULL COMMENT '实例结束时间',
  `duration_` bigint(20) DEFAULT NULL COMMENT '持续时间(ms)',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '所属分类ID',
  `act_inst_id_` varchar(64) DEFAULT NULL COMMENT 'BPMN流程实例ID',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creator_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `is_formmal_` char(1) NOT NULL COMMENT '是否正式数据',
  `parent_inst_id_` varchar(64) DEFAULT NULL COMMENT '父实例Id',
  `is_forbidden_` smallint(6) DEFAULT NULL COMMENT '禁止',
  `data_mode_` varchar(20) DEFAULT NULL,
  `support_mobile_` int(11) DEFAULT '0',
  `super_node_id_` varchar(50) DEFAULT NULL COMMENT '父流程定义节点ID',
  PRIMARY KEY (`id_`),
  KEY `idx_proinst_bpminstid` (`act_inst_id_`) USING BTREE,
  KEY `idx_proinst_parentId` (`parent_inst_id_`) USING BTREE,
  KEY `idx_proinst_bizkey` (`biz_key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='流程实例';

-- ----------------------------
-- Table structure for bpm_task
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task`;
CREATE TABLE `bpm_task` (
  `id_` varchar(64) NOT NULL COMMENT '任务ID',
  `name_` varchar(64) NOT NULL COMMENT '任务名称',
  `subject_` varchar(128) NOT NULL COMMENT '待办事项标题',
  `inst_id_` varchar(64) NOT NULL COMMENT '关联 - 流程实例ID',
  `task_id_` varchar(64) DEFAULT NULL COMMENT '关联的任务ID',
  `act_inst_id_` varchar(64) DEFAULT NULL COMMENT 'activiti 实例id',
  `act_execution_id_` varchar(64) DEFAULT NULL COMMENT 'activiti 执行id',
  `node_id_` varchar(64) DEFAULT NULL COMMENT '关联 - 任务节点ID',
  `def_id_` varchar(64) NOT NULL COMMENT '关联 - 流程定义ID',
  `assignee_id_` varchar(64) DEFAULT NULL COMMENT '任务执行人ID',
  `assignee_names_` varchar(500) DEFAULT NULL,
  `status_` varchar(64) NOT NULL COMMENT '任务状态',
  `priority_` int(11) DEFAULT NULL COMMENT '任务优先级',
  `due_time_` datetime DEFAULT NULL COMMENT '任务到期时间',
  `task_type_` varchar(64) DEFAULT NULL COMMENT '任务类型',
  `parent_id_` varchar(64) DEFAULT NULL COMMENT '父任务ID',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '分类ID',
  `create_time_` datetime NOT NULL COMMENT '任务创建时间',
  `create_by_` varchar(64) DEFAULT NULL,
  `support_mobile_` int(11) DEFAULT '0',
  `back_node_` varchar(64) DEFAULT NULL COMMENT '返回节点',
  PRIMARY KEY (`id_`),
  KEY `idx_bpmtask_instid` (`inst_id_`) USING BTREE,
  KEY `idx_bpmtask_taskid` (`task_id_`) USING BTREE,
  KEY `idx_bpmtask_parentid` (`parent_id_`) USING BTREE,
  KEY `idx_bpmtask_userid` (`assignee_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='流程任务';

-- ----------------------------
-- Table structure for bpm_task_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task_identitylink`;
CREATE TABLE `bpm_task_identitylink` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `task_id_` varchar(64) DEFAULT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) DEFAULT NULL,
  `type_` varchar(20) DEFAULT NULL COMMENT '候选人类型',
  `identity_name_` varchar(64) DEFAULT NULL COMMENT '名字',
  `identity_` varchar(64) DEFAULT NULL COMMENT 'ID',
  `permission_code_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `idx_taskcandidate_taskid` (`task_id_`) USING BTREE,
  KEY `idx_candidate_instid` (`inst_id_`) USING BTREE,
  KEY `idx_permission_code_` (`permission_code_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='任务候选人';

-- ----------------------------
-- Table structure for bpm_task_opinion
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task_opinion`;
CREATE TABLE `bpm_task_opinion` (
  `id_` varchar(64) NOT NULL COMMENT '意见ID',
  `inst_id_` varchar(64) NOT NULL COMMENT '流程实例ID',
  `sup_inst_id_` varchar(64) DEFAULT NULL COMMENT '父流程实例ID',
  `task_id_` varchar(64) DEFAULT NULL COMMENT '任务ID',
  `task_key_` varchar(64) DEFAULT NULL COMMENT '任务定义Key',
  `task_name_` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `token_` varchar(64) DEFAULT NULL COMMENT '任务令牌',
  `assign_info_` varchar(2000) DEFAULT NULL COMMENT '任务分配情况',
  `approver_` varchar(64) DEFAULT NULL COMMENT '审批人',
  `approver_name_` varchar(64) DEFAULT NULL COMMENT '审批人名字',
  `approve_time_` datetime DEFAULT NULL COMMENT '审批时间',
  `opinion_` varchar(2000) DEFAULT NULL COMMENT '审批意见',
  `status_` varchar(64) NOT NULL COMMENT '审批状态。start=发起流程；awaiting_check=待审批；agree=同意；against=反对；return=驳回；abandon=弃权；retrieve=追回',
  `form_id_` varchar(64) DEFAULT NULL COMMENT '表单定义ID',
  `create_by_` varchar(255) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '执行开始时间',
  `dur_ms_`  bigint(20) DEFAULT NULL COMMENT '持续时间(ms)',
  PRIMARY KEY (`id_`),
  KEY `idx_opinion_supinstid` (`sup_inst_id_`) USING BTREE,
  KEY `idx_opinion_task` (`task_id_`) USING BTREE,
  KEY `idx_opinion_instId` (`inst_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='流程任务审批记录';

-- ----------------------------
-- Table structure for bpm_task_stack
-- ----------------------------
DROP TABLE IF EXISTS `bpm_task_stack`;
CREATE TABLE `bpm_task_stack` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `task_id_` varchar(64) NOT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `parent_id_` varchar(64) DEFAULT NULL COMMENT '父ID',
  `node_id_` varchar(64) NOT NULL COMMENT '节点ID',
  `node_name_` varchar(125) DEFAULT NULL,
  `start_time_` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `is_muliti_task_` smallint(6) DEFAULT NULL COMMENT '1=是\r\n                        0=否',
  `node_type_` varchar(64) DEFAULT NULL COMMENT '节点类型',
  `action_name_` varchar(64) DEFAULT NULL COMMENT '响应动作',
  PRIMARY KEY (`id_`),
  KEY `idx_exestack_instid` (`inst_id_`) USING BTREE,
  KEY `idx_exestack_taskid` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT='流程执行堆栈树';


-- 流程提交日志插件
CREATE TABLE `bpm_submit_data_log` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `task_id_` varchar(64) DEFAULT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) DEFAULT NULL COMMENT '实例ID',
  `data` longtext COMMENT '业务数据',
  `destination` varchar(255) DEFAULT NULL COMMENT '目标节点',
  `extendConf` varchar(500) DEFAULT NULL COMMENT '特殊配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象数据提交日志';


-- 催办相关表
CREATE TABLE `bpm_plugin_reminder_trigger` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `task_id_` varchar(20) NOT NULL COMMENT '任务ID',
  `reminder_desc_` varchar(255) DEFAULT NULL COMMENT '催办的描述',
  `before_script_` varchar(500) DEFAULT NULL COMMENT '催办前置脚本',
  `msg_type_` varchar(10) DEFAULT NULL COMMENT '催办消息类型',
  `html_msg_` varchar(1000) DEFAULT NULL COMMENT 'html消息',
  `text_msg_` varchar(500) DEFAULT NULL COMMENT '普通消息',
  `is_calc_workday_` int(1) DEFAULT NULL COMMENT '是否工作日计算',
  `is_urgent_` int(1) DEFAULT NULL COMMENT '是否加急任务',
  `max_reminder_times` int(10) DEFAULT NULL COMMENT '最多催办次数',
  `reminder_times_` int(10) DEFAULT NULL COMMENT '催办次数',
  `reminder_cycle_` int(12) DEFAULT NULL COMMENT '催办周期',
  `duedate_` datetime NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id_`),
  KEY `task_id_` (`task_id_`) USING BTREE,
  KEY `duedate_` (`duedate_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程催办触发';



CREATE TABLE `bpm_plugin_reminder_log` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `instance_id_` varchar(20) DEFAULT NULL COMMENT '实例ID',
  `reminder_title_` varchar(255) DEFAULT NULL COMMENT '催办标题',
  `subject_` varchar(500) DEFAULT NULL COMMENT '流程标题',
  `node_id_` varchar(64) DEFAULT NULL COMMENT '节点ID',
  `msg_type_` varchar(64) DEFAULT NULL COMMENT '催办消息类型',
  `reminder_users_` varchar(500) DEFAULT NULL COMMENT '催办人',
  `reminder_userids_` varchar(500) DEFAULT NULL COMMENT '催办人ID',
  `reminder_date_` datetime DEFAULT NULL COMMENT '催办时间',
  `extend_` varchar(500) DEFAULT NULL COMMENT '其他说明',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程催办日志';


CREATE TABLE `bpm_user_agency_config` (
  `id_` varchar(64) NOT NULL COMMENT '配置ID',
  `start_datetime_` datetime NOT NULL COMMENT '起始时间',
  `end_datetime_` datetime NOT NULL COMMENT '结束时间',
  `agency_flow_key_` varchar(1000) NOT NULL COMMENT '代理流程编码，多个中间逗号分隔(,)',
  `agency_flow_name_` varchar(5000) NOT NULL COMMENT '代理流程名称，多个中间逗号分隔(,)',
  `config_user_id_` varchar(64) NOT NULL COMMENT '配置用户编码',
  `target_user_id_` varchar(1000) NOT NULL COMMENT '目标用户编码，多个中间逗号分隔(,)',
  `target_user_name_` varchar(1000) NOT NULL COMMENT '目标用户姓名，多个中间逗哥分隔(,)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用/未启用(1/0)',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `config_user_id_` (`config_user_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务流程用户代理配置';

CREATE TABLE `bpm_user_agency_log` (
  `id_` varchar(64) NOT NULL COMMENT '日志ID',
  `config_id_` varchar(64) NOT NULL COMMENT '配置ID',
  `flow_instance_id_` varchar(64) NOT NULL COMMENT '流程实例编号',
  `task_id_` varchar(64) NOT NULL COMMENT '代理任务编号',
  `task_node_id_` varchar(64) NOT NULL COMMENT '代理任务节点',
  `task_node_name_` varchar(64) NOT NULL COMMENT '代理任务节点名称',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `config_id_` (`config_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务流程用户代理日志';


