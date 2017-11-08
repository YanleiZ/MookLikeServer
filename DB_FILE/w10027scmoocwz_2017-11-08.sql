# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: w10027scmoocwz
# Generation Time: 2017-11-08 15:33:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_admins
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_admins` WRITE;
/*!40000 ALTER TABLE `t_admins` DISABLE KEYS */;

INSERT INTO `t_admins` (`id`, `name`, `sex`, `age`, `tel`, `address`, `email`, `users`)
VALUES
	(1,'小明asdf','男','111','11111111121','11','11@QQ.COM',3);

/*!40000 ALTER TABLE `t_admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `descp` varchar(200) DEFAULT NULL COMMENT '备注',
  `img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;

INSERT INTO `t_course` (`id`, `name`, `descp`, `img`)
VALUES
	(1,'Android平台运用与开发','Android平台运用与开发','201604222151105110.jpg'),
	(2,'Java程序设计','Java程序设计','201604222151355135.jpg'),
	(3,'移动搜索引擎','移动搜索引擎','20160422215202522.jpg');

/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_donetest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_donetest`;

CREATE TABLE `t_donetest` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '已做试题id,主键',
  `member` int(11) DEFAULT NULL COMMENT '用户id,外键',
  `tests` int(11) DEFAULT NULL COMMENT '课程测试id,外键',
  `settime` datetime DEFAULT NULL COMMENT '测试时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_donetest` WRITE;
/*!40000 ALTER TABLE `t_donetest` DISABLE KEYS */;

INSERT INTO `t_donetest` (`id`, `member`, `tests`, `settime`)
VALUES
	(1,1,1,'2016-04-23 00:49:58'),
	(2,1,1,'2016-04-23 00:50:02'),
	(3,1,1,'2016-04-23 00:51:58'),
	(4,0,1,'2016-04-23 08:55:12'),
	(5,1,1,'2016-04-23 08:55:59'),
	(6,1,1,'2017-03-25 20:21:05');

/*!40000 ALTER TABLE `t_donetest` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_index`;

CREATE TABLE `t_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页id,主键',
  `course` int(11) DEFAULT NULL COMMENT '课程id,外键',
  `ppts` int(11) DEFAULT NULL COMMENT '教学课件id,外键',
  `videos` int(11) DEFAULT NULL COMMENT '教学视频id,外键',
  `words` int(11) DEFAULT NULL COMMENT '教学文档id,外键',
  `tests` int(11) DEFAULT NULL COMMENT '课程测试id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table t_member
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;

INSERT INTO `t_member` (`id`, `name`, `sex`, `age`, `tel`, `address`, `email`, `users`)
VALUES
	(12,'tttt','女','','8','t','t',0),
	(13,'ee','男','','33','ee','e',10),
	(14,'rr','男','','7','r','r',11),
	(15,'r','男','','7','r','r',12),
	(16,'侯成','女','','15853109260','济南','1069575331@qq.com',13);

/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_news`;

CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻公告id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '标题',
  `img` varchar(200) DEFAULT NULL COMMENT '展示图片',
  `settime` datetime DEFAULT NULL COMMENT '发布时间',
  `descp` varchar(200) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_news` WRITE;
/*!40000 ALTER TABLE `t_news` DISABLE KEYS */;

INSERT INTO `t_news` (`id`, `name`, `img`, `settime`, `descp`, `content`)
VALUES
	(1,'测试测试测试测试测试','20160422231300130.jpg','2016-04-22 00:00:00','阿斯顿发斯蒂芬','<p><img src=\"upload_image/201604222313161316.png\" style=\"max-width:100%\" /></p>\r\n');

/*!40000 ALTER TABLE `t_news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_ppts
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_ppts` WRITE;
/*!40000 ALTER TABLE `t_ppts` DISABLE KEYS */;

INSERT INTO `t_ppts` (`id`, `name`, `settime`, `course`, `descp`, `docts`, `content`, `img`)
VALUES
	(1,'Activity初步','2016-04-22 00:00:00',1,'Activity初步','201604222125352535.ppt','<div class=\"item\"><a href=\"javascript:void(0)\"><img src=\"upload_image/201604222130293029.png\" style=\"width:100%\" /></a></div>\r\n\r\n<div class=\"item\"><a href=\"javascript:void(0)\"><img src=\"upload_image/201604222130343034.png\" style=\"width:100%\" /></a></div>\r\n\r\n<div class=\"item\"><a href=\"javascript:void(0)\"><img src=\"upload_image/201604222130383038.png\" style=\"width:100%\" /></a></div>\r\n\r\n<div class=\"item\"><a href=\"javascript:void(0)\"><img src=\"upload_image/201604222130433043.png\" style=\"width:100%\" /></a></div>\r\n\r\n<p>&nbsp;</p>\r\n','201604222124512451.png');

/*!40000 ALTER TABLE `t_ppts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id,主键',
  `name` varchar(200) DEFAULT NULL COMMENT '权限名称',
  `descp` varchar(200) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;

INSERT INTO `t_role` (`id`, `name`, `descp`)
VALUES
	(1,'超级管理员',''),
	(2,'用户',NULL),
	(3,'管理员',NULL);

/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_tests
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_tests` WRITE;
/*!40000 ALTER TABLE `t_tests` DISABLE KEYS */;

INSERT INTO `t_tests` (`id`, `name`, `settime`, `course`, `descp`, `timucontent`, `daancontent`)
VALUES
	(1,'Android基础试题','2016-04-22 00:00:00',1,'Android基础试题','<p>试题一</p>\r\n\r\n<p>（每题10分，满分100）</p>\r\n\r\n<ol>\r\n	<li>被称为&ldquo;Android之父&rdquo;的是（&nbsp;&nbsp;&nbsp; ）</li>\r\n</ol>\r\n\r\n<p>A、Steve Jobs</p>\r\n\r\n<p>B、Andy Rubin</p>\r\n\r\n<p>C、Tim Cook</p>\r\n\r\n<p>D、Bill Gates</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;\r\n<ol>\r\n	<li>下面选项中，哪一项是Android的四大组件之一（&nbsp;&nbsp; ）</li>\r\n</ol>\r\n</p>\r\n\r\n<p>A、 ListView</p>\r\n\r\n<p>B、Activity</p>\r\n\r\n<p>C、 Intent</p>\r\n\r\n<p>D、Bundle</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面对于Activity的四种基本状态描述不正确的是（&nbsp; ）&nbsp;</li>\r\n</ol>\r\n\r\n<p>A、运行态（Running）：Activity处于屏幕最前端，被用户可见且获得焦点，此&nbsp;&nbsp; 时可以与用户交互。</p>\r\n\r\n<p>B、暂停态（Paused）：Activity被置于后台但仍然被用户可见， 此时它失去了焦点，所以不可与用户进行交互，但是其状态信息会被系统保留。</p>\r\n\r\n<p>C、停止态（Stopped）：Activity被新的Activity覆盖，此时该Activity不仅失去焦点，而且用户不可见。</p>\r\n\r\n<p>D、终止态（Destroyed）：Activity被系统终止，资源被回收。</p>\r\n\r\n<p>&nbsp;\r\n<p>&nbsp;</p>\r\n</p>\r\n\r\n<ol>\r\n	<li>下面关于AndroidUI框架描述的选项中有误的一项是（&nbsp;&nbsp;&nbsp; ）</li>\r\n</ol>\r\n\r\n<p>A、Android中所有的UI（用户界面）元素都是使用View和ViewGroup对象建立的。</p>\r\n\r\n<p>B、ViewGroup是一个可以将一些信息绘制在屏幕上并与用户产生交互的对象。</p>\r\n\r\n<p>C、ViewGroup是一个包含多个的View和ViewGroup的容器，用来定义UI布局。</p>\r\n\r\n<p>D、Android使用View类作为界面开发的超类，所有的界面开发都与View有关。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;\r\n<p>&nbsp;</p>\r\n</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面说法错误的是（&nbsp;&nbsp;&nbsp; ）。</li>\r\n</ol>\r\n\r\n<p>A、Activity Manager（活动管理器）管理各个应用程序生命周期以及通常的导航回退功能。</p>\r\n\r\n<p>B、Window Manager（窗口管理器）管理所有的移动设备窗口功能。</p>\r\n\r\n<p>C、Content Provider（内容提供器）使得不同应用程序之间存取或者分享数据。</p>\r\n\r\n<p>D、View System（视图系统）构建应用程序的基本组件。</p>\r\n\r\n<p>&nbsp;\r\n<p>&nbsp;</p>\r\n</p>\r\n\r\n<ol>\r\n	<li>下面关于UI布局描述错误的一项是（&nbsp;&nbsp;&nbsp; ）。 ．．</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>LinearLayout（线性布局）是按照横或竖的线性排列布局。</li>\r\n	<li>RelativeLayout（相对布局）是按照相对位置来布局。</li>\r\n</ul>\r\n\r\n<p>C、FrameLayout（帧布局）一块在屏幕上提前预定好的空白区域，可以填充一些View元素到里面。</p>\r\n\r\n<p>D、AbsoluteLayout（绝对布局）是以表格的形式布局。</p>\r\n\r\n<p>&nbsp;\r\n<p>&nbsp;</p>\r\n</p>\r\n\r\n<ol>\r\n	<li>Android中关于View继承关系的论述错误的是（&nbsp;&nbsp; ）</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>ViewGroup继承自View</li>\r\n	<li>B、AdapterView继承自ViewGroup</li>\r\n	<li>C、TableLayout继承自RelativeLayout</li>\r\n</ul>\r\n\r\n<p>D、Menu、Notification和Toast都不是View的子类</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>绝对布局中，android:layout_x 的含义有(&nbsp;&nbsp;&nbsp; )&nbsp;</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>以手机左下为原点，组件显示到屏幕中的横向坐标值。</li>\r\n	<li>以手机左上为原点，组件显示到屏幕中的横向坐标值。</li>\r\n</ul>\r\n\r\n<p>C、以手机右下为原点，组件显示到屏幕中的横向坐标值。&nbsp;</p>\r\n\r\n<p>D、以手机右下为原点，组件显示到屏幕中的横向坐标值</p>\r\n\r\n<p>&nbsp;\r\n<p>&nbsp;</p>\r\n</p>\r\n\r\n<ol>\r\n	<li>上下文菜单与其他菜单不同的是(&nbsp;&nbsp;&nbsp; )</li>\r\n</ol>\r\n\r\n<p>A、上下文菜单项上的单击事件可以使用onMenuItemSelected方法来响应&nbsp;</p>\r\n\r\n<p>B、上下文菜单必须注册到指定的view上才能显示&nbsp;</p>\r\n\r\n<p>C、上下文菜单的菜单项可以添加，可以删除&nbsp;</p>\r\n\r\n<p>D、上下文菜单的菜单项可以有子项</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下列哪项说法是错误的（&nbsp; ）</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>某些传感器是基于硬件的，有些传感器是基于软件的&nbsp;&nbsp;</li>\r\n	<li>Android传感器框架不能够让你访问多种类型的传感器&nbsp;&nbsp;</li>\r\n	<li>大多数的Android设备都有内置的测量运动、方向、和各种环境条件的传感器</li>\r\n	<li>线性加速度传感器和重力传感器是基于硬件的传感器的实例</li>\r\n</ul>\r\n','<p>试题一</p>\r\n\r\n<p>（每题10分，满分100）</p>\r\n\r\n<ol>\r\n	<li>被称为&ldquo;Android之父&rdquo;的是（&nbsp; B&nbsp; ）</li>\r\n</ol>\r\n\r\n<p>A、Steve Jobs</p>\r\n\r\n<p>B、Andy Rubin</p>\r\n\r\n<p>C、Tim Cook</p>\r\n\r\n<p>D、Bill Gates</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】安迪-鲁宾（Andy Rubin），Andrew Rubin，Google移动平台副总裁、Android主管，Android 平台创始人。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面选项中，哪一项是Android的四大组件之一（&nbsp; B&nbsp; ）</li>\r\n</ol>\r\n\r\n<p>A、 ListView</p>\r\n\r\n<p>B、Activity</p>\r\n\r\n<p>C、 Intent</p>\r\n\r\n<p>D、Bundle</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】Android的四大组件：Activity、Service、BroadcastReceiver、Content Provider 。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面对于Activity的四种基本状态描述不正确的是（&nbsp; B&nbsp; ）&nbsp;</li>\r\n</ol>\r\n\r\n<p>A、运行态（Running）：Activity处于屏幕最前端，被用户可见且获得焦点，此&nbsp;&nbsp; 时可以与用户交互。</p>\r\n\r\n<p>B、暂停态（Paused）：Activity被置于后台但仍然被用户可见， 此时它失去了焦点，所以不可与用户进行交互，但是其状态信息会被系统保留。</p>\r\n\r\n<p>C、停止态（Stopped）：Activity被新的Activity覆盖，此时该Activity不仅失去焦点，而且用户不可见。</p>\r\n\r\n<p>D、终止态（Destroyed）：Activity被系统终止，资源被回收。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】Paused状态：当Activity被另一个透明或者Dialog样式的Activity覆盖时的状态。此时它依然与窗口管理器保持连接，系统继续维护其内部状态，它仍然可见，但它已经失去了焦点，故不可与用户交互。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面关于AndroidUI框架描述的选项中有误的一项是（&nbsp; B&nbsp; ）</li>\r\n</ol>\r\n\r\n<p>A、Android中所有的UI（用户界面）元素都是使用View和ViewGroup对象建立的。</p>\r\n\r\n<p>B、ViewGroup是一个可以将一些信息绘制在屏幕上并与用户产生交互的对象。</p>\r\n\r\n<p>C、ViewGroup是一个包含多个的View和ViewGroup的容器，用来定义UI布局。</p>\r\n\r\n<p>D、Android使用View类作为界面开发的超类，所有的界面开发都与View有关。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】View是一个可以将一些信息绘制在屏幕上并与用户产生交互的对象。</p>\r\n\r\n<p>ViewGroup是一个包含多个的View和ViewGroup的容器，用来定义UI布局。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面说法错误的是（&nbsp; B&nbsp; ）。</li>\r\n</ol>\r\n\r\n<p>A、Activity Manager（活动管理器）管理各个应用程序生命周期以及通常的导航回退功能。</p>\r\n\r\n<p>B、Window Manager（窗口管理器）管理所有的移动设备窗口功能。</p>\r\n\r\n<p>C、Content Provider（内容提供器）使得不同应用程序之间存取或者分享数据。</p>\r\n\r\n<p>D、View System（视图系统）构建应用程序的基本组件。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】WindowManager主要用来管理窗口的一些状态、属性、view增加、删除、更新、窗口顺序、消息收集和处理等。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>下面关于UI布局描述错误的一项是（&nbsp; D&nbsp; ）。 ．．</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>LinearLayout（线性布局）是按照横或竖的线性排列布局。</li>\r\n	<li>RelativeLayout（相对布局）是按照相对位置来布局。</li>\r\n</ul>\r\n\r\n<p>C、FrameLayout（帧布局）一块在屏幕上提前预定好的空白区域，可以填充一些View元素到里面。</p>\r\n\r\n<p>D、AbsoluteLayout（绝对布局）是以表格的形式布局。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a name=\"_GoBack\">【解析】</a>绝对布局也叫坐标布局，指定元素的绝对位置，因为适应性很差，一般很少用到。可以使用RelativeLayout替代。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Android中关于View继承关系的论述错误的是（&nbsp; C&nbsp; ）</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>ViewGroup继承自View</li>\r\n	<li>B、AdapterView继承自ViewGroup</li>\r\n	<li>C、TableLayout继承自RelativeLayout</li>\r\n</ul>\r\n\r\n<p>D、Menu、Notification和Toast都不是View的子类</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】TableLayout继承自LinearLayout。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>绝对布局中，android:layout_x 的含义有(&nbsp; B&nbsp; )&nbsp;</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>以手机左下为原点，组件显示到屏幕中的横向坐标值。</li>\r\n	<li>以手机左上为原点，组件显示到屏幕中的横向坐标值。</li>\r\n</ul>\r\n\r\n<p>C、以手机右下为原点，组件显示到屏幕中的横向坐标值。&nbsp;</p>\r\n\r\n<p>D、以手机右下为原点，组件显示到屏幕中的横向坐标值</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】指定初始坐标，layout_x：指定这个控件他的左上角点的x轴坐标。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>上下文菜单与其他菜单不同的是(&nbsp; B&nbsp; )</li>\r\n</ol>\r\n\r\n<p>A、上下文菜单项上的单击事件可以使用onMenuItemSelected方法来响应&nbsp;</p>\r\n\r\n<p>B、上下文菜单必须注册到指定的view上才能显示&nbsp;</p>\r\n\r\n<p>C、上下文菜单的菜单项可以添加，可以删除&nbsp;</p>\r\n\r\n<p>D、上下文菜单的菜单项可以有子项</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】上下文菜单必须注册到指定的View上才能显示。注册上下文菜单可以使用Activity.registerForContextMenu方法。</p>\r\n\r\n<ol>\r\n	<li>下列哪项说法是错误的（&nbsp; B&nbsp; ）</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>某些传感器是基于硬件的，有些传感器是基于软件的&nbsp;&nbsp;</li>\r\n	<li>Android传感器框架不能够让你访问多种类型的传感器&nbsp;&nbsp;</li>\r\n	<li>大多数的Android设备都有内置的测量运动、方向、和各种环境条件的传感器</li>\r\n	<li>线性加速度传感器和重力传感器是基于硬件的传感器的实例</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>【解析】Android传感器框架能够让你访问多种类型的传感器。</p>\r\n');

/*!40000 ALTER TABLE `t_tests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id,主键',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '登录密码',
  `role` int(11) DEFAULT NULL COMMENT '权限id,外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;

INSERT INTO `t_user` (`id`, `username`, `password`, `role`)
VALUES
	(1,'admin','admin',1),
	(10,'eee','eee',2),
	(11,'rrr','rrrrrr',2),
	(12,'rrrr','rrrrrr',2),
	(13,'hc','941212',2);

/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_videos
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_videos` WRITE;
/*!40000 ALTER TABLE `t_videos` DISABLE KEYS */;

INSERT INTO `t_videos` (`id`, `name`, `settime`, `course`, `descp`, `docts`, `content`, `img`)
VALUES
	(1,'android框架布局的使用','2016-04-22 00:00:00',1,'android框架布局的使用','201604222134503450.mp4','<p>android框架布局的使用android框架布局的使用android框架布局的使用</p>\r\n','201604222135303530.png'),
	(2,'数据库简介','2017-03-30 00:00:00',1,'数据库简介第一课','20170330211209129.mp4','<p>略吧！</p>\r\n','201604222130433043.png');

/*!40000 ALTER TABLE `t_videos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_words
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_words` WRITE;
/*!40000 ALTER TABLE `t_words` DISABLE KEYS */;

INSERT INTO `t_words` (`id`, `name`, `settime`, `course`, `descp`, `docts`, `content`, `img`)
VALUES
	(1,'Android Toast几种使用方法','2016-04-22 00:00:00',1,'Android Toast几种使用方法','201604222136483648.doc','<div style=\"padding:0 30px\">\r\n<p><span style=\"font-size:26px\"><strong>Android Toast</strong><strong>几种<span style=\"color:#FF0000\">使用方法</span></strong></span></p>\r\n\r\n<p>Toast经常会用到,今天做个总结,特别是自定义Toast的布局,值得一看。</p>\r\n\r\n<p><strong>一、默认显示</strong></p>\r\n\r\n<p style=\"margin-left:-18.0pt\">Toast toast=Toast.makeText(getApplicationContext(), &quot;默认的Toast&quot;, Toast.LENGTH_SHORT);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">// 第一个参数：当前的上下文环境。可用getApplicationContext()或this&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">// 第二个参数：要显示的字符串。也可是R.string中字符串ID&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">// 第三个参数：显示的时间长短。Toast默认的有两个LENGTH_LONG(长)和LENGTH_SHORT(短)，也可以使用毫秒如2000ms&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">//显示toast信息&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">toast.show();&nbsp;</p>\r\n\r\n<p><strong>二、自定义显示位置</strong></p>\r\n\r\n<p style=\"margin-left:-18.0pt\">Toast toast=Toast.makeText(getApplicationContext(), &quot;自定义显示位置的Toast&quot;, Toast.LENGTH_SHORT);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toast.setGravity(Gravity.TOP|Gravity.CENTER, -50, 100);&nbsp;&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //第一个参数：设置toast在屏幕中显示的位置。我现在的设置是居中靠顶&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //第二个参数：相对于第一个参数设置toast位置的横向X轴的偏移量，正数向右偏移，负数向左偏移&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //第三个参数：相对于第一个参数设置toast位置的横向Y轴的偏移量，正数向下偏移，负数向上偏移</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //如果你设置的偏移量超过了屏幕的范围，toast将在屏幕内靠近超出的那个边界显示&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //屏幕居中显示，X轴和Y轴偏移量都是0&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //toast.setGravity(Gravity.CENTER, 0, 0); &nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toast.show();&nbsp;</p>\r\n\r\n<p><strong>三、带图片的Toast</strong></p>\r\n\r\n<p style=\"margin-left:-18.0pt\">Toast toast=Toast.makeText(getApplicationContext(), &quot;显示带图片的toast&quot;, 3000);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toast.setGravity(Gravity.CENTER, 0, 0);&nbsp;&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"color:#FF0000\">//创建图片视图对象&nbsp;</span></p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ImageView imageView= new ImageView(getApplicationContext());&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //设置图片&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageView.setImageResource(R.drawable.ic_launcher);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //获得toast的布局&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LinearLayout toastView = (LinearLayout) toast.getView();&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //设置此布局为横向的&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toastView.setOrientation(LinearLayout.HORIZONTAL);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //将ImageView在加入到此布局中的第一个位置&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toastView.addView(imageView, 0);&nbsp;</p>\r\n\r\n<p style=\"margin-left:-18.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toast.show();&nbsp;</p>\r\n</div>\r\n','201604222137143714.jpg');

/*!40000 ALTER TABLE `t_words` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
