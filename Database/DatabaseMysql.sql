DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id,主键',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '登录密码',
  `role` int(11) DEFAULT NULL COMMENT '权限id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert  into `t_user`(`id`,`username`,`password`,`role`) values (1,'admin','admin','1');
DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '权限名称',
  `descp` varchar(200) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert  into `t_role`(`id`,`name`) values (1,'管理员');
insert  into `t_role`(`name`) values ('用户');

DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(200) DEFAULT NULL COMMENT '性别',
  `age` varchar(200) DEFAULT NULL COMMENT '年龄',
  `tel` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '住址',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `users` int(11) DEFAULT NULL COMMENT '登录用户id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

insert  into `t_role`(`name`) values ('管理员');

DROP TABLE IF EXISTS `t_admins`;

CREATE TABLE `t_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(200) DEFAULT NULL COMMENT '性别',
  `age` varchar(200) DEFAULT NULL COMMENT '年龄',
  `tel` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '住址',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `users` int(11) DEFAULT NULL COMMENT '登录用户id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `descp` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_ppts`;

CREATE TABLE `t_ppts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教学课件id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `settime` datetime DEFAULT NULL COMMENT '上传时间',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `descp` varchar(200) DEFAULT NULL COMMENT '摘要',
  `docts` varchar(200) DEFAULT NULL COMMENT '文件',
  `content` text COMMENT '内容',
  `img` varchar(200) DEFAULT NULL COMMENT '展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_videos`;

CREATE TABLE `t_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教学视频id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `settime` datetime DEFAULT NULL COMMENT '上传时间',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `descp` varchar(200) DEFAULT NULL COMMENT '摘要',
  `docts` varchar(200) DEFAULT NULL COMMENT '文件',
  `content` text COMMENT '简介',
  `img` varchar(200) DEFAULT NULL COMMENT '展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_words`;

CREATE TABLE `t_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教学文档id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `settime` datetime DEFAULT NULL COMMENT '上传时间',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `descp` varchar(200) DEFAULT NULL COMMENT '摘要',
  `docts` varchar(200) DEFAULT NULL COMMENT '文件',
  `content` text COMMENT '简介',
  `img` varchar(200) DEFAULT NULL COMMENT '展示图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_tests`;

CREATE TABLE `t_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程测试id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `settime` datetime DEFAULT NULL COMMENT '上传时间',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `descp` varchar(200) DEFAULT NULL COMMENT '摘要',
  `timucontent` text COMMENT '题目',
  `daancontent` text COMMENT '答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_doneTest`;

CREATE TABLE `t_doneTest` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '已做试题id,主键',
  `member` int(11) DEFAULT NULL COMMENT '用户id,外键',
  `tests` int(11) DEFAULT NULL COMMENT '课程测试id,外键',
  `settime` datetime DEFAULT NULL COMMENT '测试时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_index`;

CREATE TABLE `t_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页id,主键',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `ppts` int(11) DEFAULT NULL COMMENT '教学课件id,外键',
  `videos` int(11) DEFAULT NULL COMMENT '教学视频id,外键',
  `words` int(11) DEFAULT NULL COMMENT '教学文档id,外键',
  `tests` int(11) DEFAULT NULL COMMENT '课程测试id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

