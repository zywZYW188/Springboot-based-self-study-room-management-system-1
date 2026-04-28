-- ============================================================
-- 自习室管理系统数据库初始化脚本
-- 数据库：zixishi
-- 字符集：utf8mb4
-- 排序规则：utf8mb4_unicode_ci
-- 存储引擎：InnoDB
-- ============================================================

-- 1. 创建数据库
CREATE DATABASE IF NOT EXISTS zixishi
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE zixishi;

-- 2. 管理员表
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- 3. 学生表
CREATE TABLE IF NOT EXISTS `xuesheng` (
  `id` bigint(20) NOT NULL COMMENT '学生ID',
  `xueshenghao` varchar(200) NOT NULL COMMENT '学生号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_xueshenghao` (`xueshenghao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表';

-- 4. 自习室表
CREATE TABLE IF NOT EXISTS `zixishi` (
  `id` bigint(20) NOT NULL COMMENT '自习室ID',
  `mingcheng` varchar(200) DEFAULT NULL COMMENT '名称',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `weizhi` varchar(200) DEFAULT NULL COMMENT '位置',
  `peitaosheshi` longtext COMMENT '配套设施',
  `jiaoshixiangqing` longtext COMMENT '教室详情',
  `number` int(11) DEFAULT NULL COMMENT '座位总数',
  `selected` varchar(200) DEFAULT NULL COMMENT '已选座位（逗号分隔）',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自习室表';

-- 5. 座位预订表
CREATE TABLE IF NOT EXISTS `zuoweiyuding` (
  `id` bigint(20) NOT NULL COMMENT '预订ID',
  `xueshenghao` varchar(200) DEFAULT NULL COMMENT '学生号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `mingcheng` varchar(200) DEFAULT NULL COMMENT '自习室名称',
  `zuoweihao` varchar(200) DEFAULT NULL COMMENT '座位号',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `shiyongshizhang` varchar(200) DEFAULT NULL COMMENT '使用时长',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='座位预订表';

-- 6. 公告信息表
CREATE TABLE IF NOT EXISTS `gonggaoxinxi` (
  `id` bigint(20) NOT NULL COMMENT '公告ID',
  `wenzhangbiaoti` varchar(200) DEFAULT NULL COMMENT '文章标题',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `wenzhangneirong` longtext COMMENT '文章内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公告信息表';

-- 7. 留言板表
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) NOT NULL COMMENT '留言ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '留言人ID',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='留言板表';

-- 8. 客服聊天表
CREATE TABLE IF NOT EXISTS `chat` (
  `id` bigint(20) NOT NULL COMMENT '聊天ID',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客服聊天表';

-- 9. Token表
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Token ID',
  `userid` bigint(20) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT 'Token值',
  `expiratedtime` datetime NOT NULL COMMENT '过期时间',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Token表';

-- 10. 系统配置表
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) DEFAULT NULL COMMENT '配置键',
  `value` varchar(100) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置表';

-- ============================================================
-- 初始化数据
-- ============================================================

-- 默认管理员账号（密码：admin）
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
(1, 'admin', 'admin', '管理员', NOW());
