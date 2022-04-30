-- 权限管理: 系统map
CREATE TABLE `auth_ms` (
       `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
       `ms_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '系统名称',
       `ms_desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '系描述',
       `ms_domain` varchar(255) NOT NULL DEFAULT '0' COMMENT '系统域名',
       `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
       `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人staff_id',
       `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
       `update_by` int(11) NOT NULL DEFAULT '0' COMMENT '修改人staff_id',
       `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1:enable, 0:disable, -1:deleted',
       PRIMARY KEY (`id`),
       KEY `idx_domain` (`ms_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统map(登记目前存在的后台系统信息)';

-- 权限管理: 系统menu
CREATE TABLE `auth_ms_menu` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
        `ms_id` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT '系统id',
        `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
        `menu_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '菜单名称',
        `menu_desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '菜描述',
        `menu_uri` varchar(255) NOT NULL DEFAULT '0' COMMENT '菜单uri',
        `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
        `is_show` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT '是否展示菜单',
        `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人staff_id',
        `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
        `update_by` int(11) NOT NULL DEFAULT '0' COMMENT '修改人staff_id',
        `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1:enable, 0:disable, -1:deleted',
        PRIMARY KEY (`id`),
        KEY `idx_ms_id` (`ms_id`),
        KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统menu';

-- 权限管理: 系统权限
CREATE TABLE `auth_item` (
     `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
     `ms_id` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '系统id',
     `menu_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '页面/接口uri',
     `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
     `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人staff_id',
     `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
     `update_by` int(11) NOT NULL DEFAULT '0' COMMENT '修改人staff_id',
     `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1:enable, 0:disable, -1:deleted',
     PRIMARY KEY (`id`),
     KEY `idx_ms_menu` (`ms_id`, `menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统权限';

-- 权限管理: 系统权限(权限的各个集合)
CREATE TABLE `auth_role` (
     `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
     `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色名称',
     `desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '角描述',
     `auth_item_set` text COMMENT '权限集合 多个值,号隔开',
     `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
     `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人staff_id',
     `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
     `update_by` int(11) NOT NULL DEFAULT '0' COMMENT '修改人staff_id',
     `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1:enable, 0:disable, -1:deleted',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='员工角色';

-- 权限管理: 角色与员工关系
CREATE TABLE `auth_role_staff` (
       `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
       `staff_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
       `role_set` text COMMENT '角色集合 多个值,号隔开',
       `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
       `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人staff_id',
       `update_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
       `update_by` int(11) NOT NULL DEFAULT '0' COMMENT '修改人staff_id',
       `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1:enable, 0:disable, -1:deleted',
       PRIMARY KEY (`id`),
       KEY `idx_staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限角色与员工关系';
