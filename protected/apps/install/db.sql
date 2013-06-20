/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : yxcmsapp

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2013-05-29 14:26:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `yx_admin`
-- ----------------------------
DROP TABLE IF EXISTS `yx_admin`;
CREATE TABLE `yx_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `groupid` tinyint(4) NOT NULL default '1',
  `username` char(10) NOT NULL,
  `realname` char(15) NOT NULL,
  `password` char(32) NOT NULL,
  `lastlogin_time` int(10) unsigned NOT NULL,
  `lastlogin_ip` char(15) NOT NULL,
  `iflock` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `usename` (`username`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of yx_admin
-- ----------------------------
INSERT INTO `yx_admin` VALUES ('1', '1', 'admin', 'YX', '168a73655bfecefdb15b14984dd2ad60', '1369788199', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for `yx_extend`
-- ----------------------------
DROP TABLE IF EXISTS `yx_extend`;
CREATE TABLE `yx_extend` (
  `id` int(10) NOT NULL auto_increment,
  `pid` int(10) default '0',
  `tableinfo` varchar(255) default NULL,
  `type` int(4) default '0',
  `defvalue` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `norder` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_extend
-- ----------------------------
INSERT INTO `yx_extend` VALUES ('1', '0', 'extend_product', '0', '', '产品拓展', '0');
INSERT INTO `yx_extend` VALUES ('2', '1', 'stand', '1', '未知', '产品型号', '0');
INSERT INTO `yx_extend` VALUES ('3', '1', 'price', '1', '0', '产品价格', '0');
INSERT INTO `yx_extend` VALUES ('4', '1', 'brand', '1', '未知', '所属品牌', '0');
INSERT INTO `yx_extend` VALUES ('5', '1', 'color', '1', '白色', '产品颜色', '0');
INSERT INTO `yx_extend` VALUES ('6', '1', 'area', '1', '未知', '所在地区', '0');
INSERT INTO `yx_extend` VALUES ('7', '0', 'extend_conment', '1', '', '内容评论', '0');
INSERT INTO `yx_extend` VALUES ('8', '7', 'aid', '1', '0', '资讯id', '4');
INSERT INTO `yx_extend` VALUES ('9', '7', 'comby', '1', '', '评论者', '2');
INSERT INTO `yx_extend` VALUES ('10', '7', 'comcontent', '3', '', '评论内容', '1');
INSERT INTO `yx_extend` VALUES ('11', '7', 'type', '1', '0', '类型', '3');
INSERT INTO `yx_extend` VALUES ('12', '0', 'extend_guestbook', '1', '', '留言本', '0');
INSERT INTO `yx_extend` VALUES ('13', '12', 'tname', '1', '', '姓名', '0');
INSERT INTO `yx_extend` VALUES ('14', '12', 'tel', '1', '', '电话', '0');
INSERT INTO `yx_extend` VALUES ('15', '12', 'qq', '1', '', 'QQ', '0');
INSERT INTO `yx_extend` VALUES ('16', '12', 'content', '3', '', '留言内容', '0');
INSERT INTO `yx_extend` VALUES ('17', '12', 'reply', '2', '', '回复内容', '0');

-- ----------------------------
-- Table structure for `yx_extend_conment`
-- ----------------------------
DROP TABLE IF EXISTS `yx_extend_conment`;
CREATE TABLE `yx_extend_conment` (
  `id` int(11) NOT NULL auto_increment,
  `addtime` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ispass` tinyint(1) NOT NULL,
  `aid` varchar(250) NOT NULL,
  `comby` varchar(250) NOT NULL,
  `comcontent` text NOT NULL,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_extend_conment
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_extend_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `yx_extend_guestbook`;
CREATE TABLE `yx_extend_guestbook` (
  `id` int(11) NOT NULL auto_increment,
  `addtime` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ispass` tinyint(1) NOT NULL,
  `tname` varchar(250) NOT NULL,
  `tel` varchar(250) NOT NULL,
  `qq` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `reply` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_extend_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_extend_product`
-- ----------------------------
DROP TABLE IF EXISTS `yx_extend_product`;
CREATE TABLE `yx_extend_product` (
  `id` int(11) NOT NULL auto_increment,
  `stand` varchar(250) NOT NULL,
  `price` varchar(250) NOT NULL,
  `brand` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `area` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_extend_product
-- ----------------------------
INSERT INTO `yx_extend_product` VALUES ('1', 'X1 xDrive20i豪华型', '9000000', '宝马', '白色', '北京');
INSERT INTO `yx_extend_product` VALUES ('2', 'GT 4.0L V8', '4000000', '宾利', '灰色', '上海');

-- ----------------------------
-- Table structure for `yx_fragment`
-- ----------------------------
DROP TABLE IF EXISTS `yx_fragment`;
CREATE TABLE `yx_fragment` (
  `id` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `sign` varchar(255) NOT NULL COMMENT '前台调用标记',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_fragment
-- ----------------------------
INSERT INTO `yx_fragment` VALUES ('1', '右侧公告信息', 'announce', '<p>\r\n	本站为YXcms的默认演示模板，YXcms是一款基于PHP+MYSQL构建的高效网站管理系统。 后台地址请在网址后面加上/index.php?r=admin进入。 后台的用户名:admin;密码:123456，请进入后修改默认密码。\r\n</p>');

-- ----------------------------
-- Table structure for `yx_group`
-- ----------------------------
DROP TABLE IF EXISTS `yx_group`;
CREATE TABLE `yx_group` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `power` varchar(1000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_group
-- ----------------------------
INSERT INTO `yx_group` VALUES ('1', '超级管理员', '-1');

-- ----------------------------
-- Table structure for `yx_link`
-- ----------------------------
DROP TABLE IF EXISTS `yx_link`;
CREATE TABLE `yx_link` (
  `id` int(10) NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL COMMENT '类型',
  `norder` int(5) NOT NULL COMMENT '排序',
  `name` varchar(30) NOT NULL COMMENT '站点名',
  `url` varchar(40) NOT NULL COMMENT '站点地址',
  `picture` varchar(30) NOT NULL COMMENT '本地logo',
  `logourl` varchar(50) NOT NULL COMMENT '远程logo',
  `siteowner` varchar(30) NOT NULL COMMENT '站点所有者',
  `info` varchar(300) NOT NULL COMMENT '介绍',
  `ispass` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_link
-- ----------------------------
INSERT INTO `yx_link` VALUES ('1', '2', '0', 'canphp', 'http://www.canphp.com/', '1342232505.jpg', '', '', '', '1');
INSERT INTO `yx_link` VALUES ('2', '2', '0', 'Yxcms', 'http://www.yxcms.net', '1342232581.jpg', '', '', '', '1');
INSERT INTO `yx_link` VALUES ('3', '1', '0', 'baidu', 'http://www.baidu.com', '', '', '', '', '1');
INSERT INTO `yx_link` VALUES ('4', '1', '0', 'Google', 'http://www.google.com', '', '', '', '', '1');

-- ----------------------------
-- Table structure for `yx_members`
-- ----------------------------
DROP TABLE IF EXISTS `yx_members`;
CREATE TABLE `yx_members` (
  `id` int(20) NOT NULL auto_increment,
  `groupid` int(3) NOT NULL,
  `account` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `rmb` int(8) NOT NULL default '0',
  `crmb` int(8) NOT NULL default '0',
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `regtime` int(11) NOT NULL,
  `regip` varchar(16) NOT NULL,
  `lasttime` int(11) NOT NULL,
  `lastip` varchar(16) NOT NULL,
  `islock` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_members
-- ----------------------------
INSERT INTO `yx_members` VALUES ('1', '2', 'admin', '15bf4d760b796a8d5340d741c7edf85c', '9000', '3774', '会员演示', '404138@qq.com', '13638816362', '404133749', '0', '', '1367317198', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for `yx_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `yx_member_group`;
CREATE TABLE `yx_member_group` (
  `id` int(3) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `notallow` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_member_group
-- ----------------------------
INSERT INTO `yx_member_group` VALUES ('1', '未登录', 'member/index/index|member/infor|member/order');
INSERT INTO `yx_member_group` VALUES ('2', '普通会员', '');

-- ----------------------------
-- Table structure for `yx_method`
-- ----------------------------
DROP TABLE IF EXISTS `yx_method`;
CREATE TABLE `yx_method` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `rootid` int(10) unsigned NOT NULL,
  `pid` float unsigned NOT NULL,
  `operate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ifmenu` tinyint(1) NOT NULL default '0' COMMENT '是否菜单显示',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_method
-- ----------------------------
INSERT INTO `yx_method` VALUES ('1', '1', '0', 'admin', '后台登陆管理', '1');
INSERT INTO `yx_method` VALUES ('2', '1', '1', 'index', '管理员管理', '1');
INSERT INTO `yx_method` VALUES ('4', '1', '1', 'admindel', '管理员删除', '0');
INSERT INTO `yx_method` VALUES ('5', '1', '1', 'adminedit', '管理员编辑', '0');
INSERT INTO `yx_method` VALUES ('6', '1', '1', 'adminlock', '管理员锁定', '0');
INSERT INTO `yx_method` VALUES ('7', '1', '1', 'group', '权限管理', '1');
INSERT INTO `yx_method` VALUES ('8', '1', '1', 'groupedit', '管理组编辑', '0');
INSERT INTO `yx_method` VALUES ('9', '1', '1', 'groupdel', '管理组删除', '0');
INSERT INTO `yx_method` VALUES ('10', '10', '0', 'news', '资讯管理', '1');
INSERT INTO `yx_method` VALUES ('11', '10', '10', 'index', '已有资讯', '1');
INSERT INTO `yx_method` VALUES ('12', '10', '10', 'add', '添加资讯', '1');
INSERT INTO `yx_method` VALUES ('13', '10', '10', 'edit', '资讯编辑', '0');
INSERT INTO `yx_method` VALUES ('14', '10', '10', 'del', '资讯删除', '0');
INSERT INTO `yx_method` VALUES ('15', '10', '10', 'lock', '资讯锁定', '0');
INSERT INTO `yx_method` VALUES ('16', '10', '10', 'recmd', '资讯推荐', '0');
INSERT INTO `yx_method` VALUES ('17', '17', '0', 'dbback', '数据库管理', '1');
INSERT INTO `yx_method` VALUES ('18', '17', '17', 'index', '数据库备份', '1');
INSERT INTO `yx_method` VALUES ('19', '17', '17', 'recover', '备份恢复', '0');
INSERT INTO `yx_method` VALUES ('20', '17', '17', 'detail', '备份详细', '0');
INSERT INTO `yx_method` VALUES ('21', '17', '17', 'del', '备份删除', '0');
INSERT INTO `yx_method` VALUES ('22', '22', '0', 'index', '后台面板', '0');
INSERT INTO `yx_method` VALUES ('23', '22', '22', 'index', '后台首页', '0');
INSERT INTO `yx_method` VALUES ('24', '22', '22', 'login', '登陆', '0');
INSERT INTO `yx_method` VALUES ('25', '22', '22', 'logout', '退出登陆', '0');
INSERT INTO `yx_method` VALUES ('26', '22', '22', 'verify', '验证码', '0');
INSERT INTO `yx_method` VALUES ('27', '22', '22', 'welcome', '服务器环境', '0');
INSERT INTO `yx_method` VALUES ('28', '28', '0', 'set', '全局设置', '1');
INSERT INTO `yx_method` VALUES ('29', '28', '28', 'index', '网站设置', '1');
INSERT INTO `yx_method` VALUES ('30', '30', '0', 'sort', '分类管理', '1');
INSERT INTO `yx_method` VALUES ('31', '30', '30', 'index', '栏目列表', '1');
INSERT INTO `yx_method` VALUES ('32', '30', '30', 'edit', '分类编辑', '0');
INSERT INTO `yx_method` VALUES ('33', '30', '30', 'del', '分类删除', '0');
INSERT INTO `yx_method` VALUES ('160', '150', '150', 'delpic', '图集单张图删除', '0');
INSERT INTO `yx_method` VALUES ('277', '0', '0', 'appmanage', '应用管理', '1');
INSERT INTO `yx_method` VALUES ('85', '28', '28', 'menuname', '后台功能', '1');
INSERT INTO `yx_method` VALUES ('159', '150', '150', 'images_upload', '图片批量上传', '0');
INSERT INTO `yx_method` VALUES ('158', '10', '10', 'FileManagerJson', '编辑器上传管理', '0');
INSERT INTO `yx_method` VALUES ('157', '10', '10', 'UploadJson', '编辑器上传', '0');
INSERT INTO `yx_method` VALUES ('150', '150', '0', 'photo', '图集管理', '1');
INSERT INTO `yx_method` VALUES ('151', '150', '150', 'index', '已有图集', '1');
INSERT INTO `yx_method` VALUES ('152', '150', '150', 'add', '添加图集', '1');
INSERT INTO `yx_method` VALUES ('153', '150', '150', 'edit', '图集编辑', '0');
INSERT INTO `yx_method` VALUES ('154', '150', '150', 'del', '图集删除', '0');
INSERT INTO `yx_method` VALUES ('155', '150', '150', 'lock', '图集锁定', '0');
INSERT INTO `yx_method` VALUES ('156', '150', '150', 'recmd', '图集推荐', '0');
INSERT INTO `yx_method` VALUES ('174', '10', '10', 'cutcover', '封面图剪切', '0');
INSERT INTO `yx_method` VALUES ('236', '30', '30', 'PageUploadJson', '单页上传', '0');
INSERT INTO `yx_method` VALUES ('235', '30', '30', 'pageedit', '单页编辑', '0');
INSERT INTO `yx_method` VALUES ('234', '30', '30', 'pageadd', '添加单页栏目', '0');
INSERT INTO `yx_method` VALUES ('233', '30', '30', 'photoedit', '图集栏目编辑', '0');
INSERT INTO `yx_method` VALUES ('232', '30', '30', 'photoadd', '添加图集栏目', '0');
INSERT INTO `yx_method` VALUES ('231', '30', '30', 'newsedit', '文章栏目编辑', '0');
INSERT INTO `yx_method` VALUES ('230', '30', '30', 'newsadd', '添加文章栏目', '0');
INSERT INTO `yx_method` VALUES ('182', '28', '28', 'clear', '网站缓存', '1');
INSERT INTO `yx_method` VALUES ('188', '188', '0', 'link', '友情链接', '1');
INSERT INTO `yx_method` VALUES ('189', '188', '188', 'index', '链接列表', '1');
INSERT INTO `yx_method` VALUES ('190', '188', '188', 'add', '添加链接', '1');
INSERT INTO `yx_method` VALUES ('191', '188', '188', 'edit', '链接编辑', '0');
INSERT INTO `yx_method` VALUES ('192', '188', '188', 'del', '链接删除', '0');
INSERT INTO `yx_method` VALUES ('228', '1', '1', 'adminnow', '账户管理', '1');
INSERT INTO `yx_method` VALUES ('229', '188', '188', 'lock', '锁定', '0');
INSERT INTO `yx_method` VALUES ('237', '30', '30', 'PageFileManagerJson', '单页上传管理', '0');
INSERT INTO `yx_method` VALUES ('238', '238', '0', 'fragment', '碎片管理', '1');
INSERT INTO `yx_method` VALUES ('239', '238', '238', 'index', '碎片列表', '1');
INSERT INTO `yx_method` VALUES ('240', '238', '238', 'add', '碎片添加', '1');
INSERT INTO `yx_method` VALUES ('241', '238', '238', 'edit', '碎片编辑', '0');
INSERT INTO `yx_method` VALUES ('242', '238', '238', 'del', '碎片删除', '0');
INSERT INTO `yx_method` VALUES ('243', '238', '238', 'UploadJson', '编辑器上传', '0');
INSERT INTO `yx_method` VALUES ('244', '238', '238', 'FileManagerJson', '编辑器上传管理', '0');
INSERT INTO `yx_method` VALUES ('245', '28', '28', 'tpchange', '前台模板', '1');
INSERT INTO `yx_method` VALUES ('251', '30', '30', 'pluginadd', '添加应用栏目', '0');
INSERT INTO `yx_method` VALUES ('252', '30', '30', 'pluginedit', '应用栏目编辑', '0');
INSERT INTO `yx_method` VALUES ('258', '258', '0', 'extendfield', '自定义表', '1');
INSERT INTO `yx_method` VALUES ('259', '258', '258', 'index', '自定义表列表', '1');
INSERT INTO `yx_method` VALUES ('260', '258', '258', 'tableadd', '添加自定义表', '1');
INSERT INTO `yx_method` VALUES ('261', '258', '258', 'tableedit', '拓展表编辑', '0');
INSERT INTO `yx_method` VALUES ('262', '258', '258', 'tabledel', '拓展表删除', '0');
INSERT INTO `yx_method` VALUES ('263', '258', '258', 'fieldlist', '字段列表', '0');
INSERT INTO `yx_method` VALUES ('264', '258', '258', 'fieldadd', '添加字段', '0');
INSERT INTO `yx_method` VALUES ('265', '258', '258', 'fieldedit', '编辑字段', '0');
INSERT INTO `yx_method` VALUES ('266', '258', '258', 'fielddel', '字段删除', '0');
INSERT INTO `yx_method` VALUES ('267', '258', '258', 'file', '文件上传', '0');
INSERT INTO `yx_method` VALUES ('268', '10', '10', 'ex_field', '字段拓展', '0');
INSERT INTO `yx_method` VALUES ('269', '150', '150', 'ex_field', '字段拓展', '0');
INSERT INTO `yx_method` VALUES ('270', '30', '30', 'linkadd', '添加自定义栏目', '0');
INSERT INTO `yx_method` VALUES ('271', '30', '30', 'linkedit', '自定义栏目编辑', '0');
INSERT INTO `yx_method` VALUES ('283', '0', '0', 'member', '会员管理(应用)', '1');
INSERT INTO `yx_method` VALUES ('288', '10', '10', 'colchange', '资讯转移栏目', '0');
INSERT INTO `yx_method` VALUES ('289', '150', '150', 'colchange', '图集转移栏目', '0');
INSERT INTO `yx_method` VALUES ('290', '150', '150', 'UploadJson', '图集编辑器上传', '0');
INSERT INTO `yx_method` VALUES ('291', '150', '150', 'FileManagerJson', '图集编辑器上传管理', '0');
INSERT INTO `yx_method` VALUES ('292', '28', '28', 'tplist', '模板文件列表', '0');
INSERT INTO `yx_method` VALUES ('293', '28', '28', 'tpadd', '模板文件添加', '0');
INSERT INTO `yx_method` VALUES ('294', '28', '28', 'tpedit', '模板文件编辑', '0');
INSERT INTO `yx_method` VALUES ('295', '28', '28', 'tpdel', '删除模板文件', '0');
INSERT INTO `yx_method` VALUES ('296', '28', '28', 'tpgetcode', '获取模板内容', '0');
INSERT INTO `yx_method` VALUES ('297', '258', '258', 'meslist', '自定义表信息', '0');
INSERT INTO `yx_method` VALUES ('298', '258', '258', 'mesedit', '自定义表信息编辑', '0');
INSERT INTO `yx_method` VALUES ('299', '258', '258', 'mesdel', '自定义表信息删除', '0');
INSERT INTO `yx_method` VALUES ('300', '258', '258', 'meslock', '自定义表信息审核', '0');
INSERT INTO `yx_method` VALUES ('301', '30', '30', 'add', '添加栏目', '1');
INSERT INTO `yx_method` VALUES ('302', '30', '30', 'extendadd', '添加表单栏目', '0');
INSERT INTO `yx_method` VALUES ('303', '30', '30', 'extendedit', '表单栏目编辑', '0');
INSERT INTO `yx_method` VALUES ('304', '30', '30', 'placelist', '内容定位列表', '1');
INSERT INTO `yx_method` VALUES ('305', '30', '30', 'placeadd', '添加内容定位', '1');
INSERT INTO `yx_method` VALUES ('306', '30', '30', 'placeedit', '定位编辑', '0');
INSERT INTO `yx_method` VALUES ('307', '30', '30', 'placedel', '定位删除', '0');
INSERT INTO `yx_method` VALUES ('308', '308', '0', 'tags', 'TAG标签', '1');
INSERT INTO `yx_method` VALUES ('309', '308', '308', 'index', '标签列表', '1');
INSERT INTO `yx_method` VALUES ('310', '308', '308', 'del', '删除标签', '0');
INSERT INTO `yx_method` VALUES ('311', '308', '308', 'hits', '编辑点击量', '0');
INSERT INTO `yx_method` VALUES ('312', '308', '308', 'add', '生成标签', '1');
INSERT INTO `yx_method` VALUES ('313', '308', '308', 'mesup', '文档数量更新', '0');
INSERT INTO `yx_method` VALUES ('314', '314', '0', 'files', '附件管理', '1');
INSERT INTO `yx_method` VALUES ('315', '314', '314', 'index', '文件列表', '1');
INSERT INTO `yx_method` VALUES ('316', '314', '314', 'del', '删除文件', '0');

-- ----------------------------
-- Table structure for `yx_news`
-- ----------------------------
DROP TABLE IF EXISTS `yx_news`;
CREATE TABLE `yx_news` (
  `id` int(20) NOT NULL auto_increment,
  `sort` varchar(350) NOT NULL COMMENT '类别',
  `account` char(15) NOT NULL COMMENT '发布者账户',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `places` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL COMMENT '标题颜色',
  `picture` varchar(80) NOT NULL,
  `keywords` varchar(300) NOT NULL COMMENT '关键字',
  `description` varchar(600) NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `method` varchar(100) NOT NULL COMMENT '方法',
  `tpcontent` varchar(100) NOT NULL COMMENT '模板',
  `norder` int(4) NOT NULL COMMENT '排序',
  `recmd` tinyint(1) NOT NULL COMMENT '推荐',
  `hits` int(10) NOT NULL COMMENT '点击量',
  `ispass` tinyint(1) NOT NULL,
  `origin` varchar(30) NOT NULL COMMENT '来源',
  `addtime` int(11) NOT NULL,
  `extfield` int(10) NOT NULL default '0' COMMENT '拓展字段',
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_news
-- ----------------------------
INSERT INTO `yx_news` VALUES ('1', ',000000,100001,100005,100016', 'admin', '企业建站需要提供哪些资料', '', '', 'NoPic.gif', '公司,信息,企业建站,资料,需要,信任,这些,用户,获得,很大,程度,上会,可以,基本,取决于,状况,准备,之前,哪些,提供,为了,网站,了解,初步,是否', '企业建站之前需要准备好的资料、信息有：1、公司信息：公司信息是为了让公司网站的新访问者对公司状况有初步的了解，公司是否可以获得用户的信任，在很大程度上会取决于这些基本', '<p>\r\n	企业建站之前需要准备好的资料、信息有：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、<b>公司信息</b>：公司信息是为了让公司网站的新访问者对公司状况有初步的了解，公司是否可以获得用户的信任，在很大程度上会取决于这些基本信息。在公司信息中，如果内容比较丰富，可以进一步分解为若干子栏目，如：公司概况、发展历程、公司动态、媒体报道、主要业绩（证书、数据）、组织结构、企业主要领导人员介绍、联系方式等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、<b>产品信息</b>：企业网站上的产品信息应全面反映所有系列和各种型号的产品，对产品进行详尽的介绍，如果必要，除了文字介绍之外，可配备相应的图片资料、视频文件等。其他有助于用户产生信任和购买决策的信息，都可以用适当的方式发布在企业网站上，如有关机构、专家的检测和鉴定、用户评论、相关产品知识等。\r\n</p>\r\n<p>\r\n	产品信息通常可按照产品类别分为不同的子栏目。如果公司产品种类比较多，无法在简单的目录中全部列出，为了让用户能够方便的找到所需要的产品，除了设计详细的分级目录之外，还有必要增加产品搜索功能。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3、<b>用户服务信息</b>：用户对不同企业、不同产品所期望获得的服务有很大差别。网站常见的服务信息有产品选择和使用常识、产品说明书、在线问答等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	4、<b>促销信息</b>：但网站拥有一定的访问量是，企业网站本身便具有一定的<a href=\"/view/3115165.htm\" target=\"_blank\">广告价值</a>，因此，可在自己的网站上发布促销信息，如<a href=\"/view/9184.htm\" target=\"_blank\">网络广告</a>、有奖竞赛、有奖征文、下载优惠券等。网上的促销活动通常与网下结合进行，网站可以作为一种有效的补充，供用户了解促销互动细则、参与报名等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	5、<b>销售信息</b>：当用户对于企业和产品有一定的了解，并且产生了购买动机之后，在网站上应为用户购买提供进一步的支持，以促成销售。在决定购买产品之后，用户仍需要进一步了解相关的购买信息，如最方便的网下销售地点、网上订购方式、售后服务措施等。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	6、<b>公众信息</b>：指并非作为用户的身份对于公司进行了解的信息，如投资人、媒体记者、调查研究人员等。公众信息包括股权结构、投资信息、<a href=\"/view/3897396.htm\" target=\"_blank\">企业财务报告</a>、企业文化、公关活动等。\r\n</p>\r\n<div class=\"spctrl\" paragraphindex=\"54\">\r\n</div>\r\n<p>\r\n	7、<b>其他信息</b>：根据企业的需要，可以在网站上发表其他有关的信息，如招聘信息、采购信息等。对于产品销售范围跨国家的企业，通常还需要不同语言的网站内容。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	在进行企业信息的选择和发布时，应掌握一定的原则：有价值的信息应尽量丰富、完整、及时；不必要的信息和服务，如天气预报、社会新闻、生活服务、免费邮箱等应力求避免。\r\n</p>', 'news/content', 'news_content', '0', '0', '33', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('2', ',000000,100001,100005,100017', 'admin', '为什么企业需要有自己的网站', '', '', 'NoPic.gif', '企业,网站,互联网,优秀,一个,时代,建站,成功,重要,当今,步骤,网上,主页,自己,需要,展示,形象,基地,电子交易,开展,门户,为什么', '企业的主页是企业在Internet上展示形象的门户，是企业开展电子交易的基地，是企业网上的&quot;家&quot;，设计制作一个优秀的网站是建站企业成功迈向互联网的重要步骤。 在当今互联网时代，一', '&nbsp;企业的主页是企业在Internet上展示形象的门户，是企业开展电子交易的基地，是企业网上的\"家\"，设计制作一个优秀的网站是建站企业成功迈向互联网的重要步骤。 <br />\r\n在当今互联网时代，一个企业没有自己的网站就像一个人没有住址，一个商店没有门脸。随着经济全球化和<a href=\"/view/757.htm\" target=\"_blank\">电子商务</a>经济的到来，企业如果还固守于传统模式则必定不能再适应经济全球化的趋势，企业建站和开展电子商务是一个不可回避的现实，当你的<a href=\"/view/89764.htm\" target=\"_blank\">竞争</a>对手正在通过INTERNET共享信息，通过电子商务降低成本，拓展<a href=\"/view/9250.htm\" target=\"_blank\">销售</a>渠道时，你却只能坐失良机。<br />\r\n<h3>\r\n	<a></a><a></a>一、竞争的需要\r\n</h3>\r\n国际互联网的用户在迅猛地增长，中国上网用户由1995年的一万户速增至2001年上半年的2650万用户。这增长速度是全世界范围的普遍现象。在美国、欧洲、日本、台湾、港澳及其它许多国家，网站和电子信箱系统已经成为公司立业不可缺少的重要组成部分。人们用电子信箱已经比用电话多了，百分之九十以上的大小企业、学校、政府机关、服务业甚至酒吧都设法在热门网络上设立自己的网站，供数以百万计的人们前来参观、浏览和查询。中国及全世界的上网用户在未来几十年内还会迅速增加。您的企业要为这众多的民众、企业服务就必须建立自己的网站和电子信箱系统，在这信息的高速公路上宣传自己高效的工作。企业网站、电子信箱给客户、潜在客户，特别是大客户及海外客户，带来了便利的联系，增加了了解，增强了信任感。这些企业自然是他们要打交道的首选，没有网站和电子信箱的企业将失去越来越多的机会而最终被淘汰。<br />\r\n<h3>\r\n	<a></a><a></a>二、可以迅速树立企业形象\r\n</h3>\r\n今天，国际互联网络已成为高科技和未来生活的代名词，要显示你公司的实力，提升公司的形象，没有什么比在员工名片、企业信笺、广告及各种公众能看得到的东西上印上自己公司独有的网络地址和专用的集团电子邮件地址更有说服力了。消费者、客户和海外投资者自然对您另眼相看。<br />\r\n<h3>\r\n	<a></a><a></a>三、可以让客户获得所需的商业信息\r\n</h3>\r\n什么是商业信息？你的营业时间？你的服务项目？你的联系方法？你的支付方式？你的地址？你的新的产品资料？如果你让客户明白与你合作的所有原因和好处，那么何愁生意不上门？更重要的是，你的眼光已经放得非常长远，因为在许多你的销售人员未能到达的地方，人们已经可以通过上网这一最便捷的途径获取你的商业信息，并且不是你花大笔的宣传费用去让客户得到你公司的商业信息，而是客户愿意花钱从您那儿取得所需商业信息，这样一来，既能使你节约大量不必要的支出，又能使你的现有客户或潜在客户更满意。<br />\r\n<h3>\r\n	<a></a><a></a>四、可以为客户提供服务\r\n</h3>\r\n让客户获得所需的信息是为客户服务的重要方法之一。但是如果你仔细研究了为客户服务的方法，你就会发现许多利用WWW技术为客户服务的方法。你不妨把售后服务项目做成电子表格，让你的员工开发你的客户所感兴趣的产品和服务，并且放在网上，让电脑自动记录客户的查询和订单，使你迅速掌握第一手的统计数据，而无需让员工天天守候在电话机前记录电话内容。你可以让你的客户在数据库中查询到你所生产的产品的颜色、规格。同样，你既不费力也无需花费太多精力就可以在互联网上从事上述活动了。<br />\r\n<h3>\r\n	<a></a><a></a>五、可以吸引公众的注意力\r\n</h3>\r\n你不可能将你的新产品信息在全球的周刊上发表，但你可以把上述信息放在你的企业网站上向全世界发表。即使你可以把上述信息在全球的周刊上发表，但消费者遗忘广告、忽略广告，你也无可奈何。有了网站上的信息，任何一个人都可在网上浏览你的网页，都会成为你的潜在客户。<br />\r\n<h3>\r\n	<a></a><a></a>六、可以及时发布时间性强的信息\r\n</h3>\r\n如果你必须在当晚发表一篇文章、发布季度财政报告、发表新产品宣传信息、进行突发性事件的回应处理，在以前，这些都可能因时间太紧，媒体或印刷厂不能配合而被耽搁。而如今上述信息和附带的图片都可以在你希望的任何时间发布，这是一个全球性的概念，是抢在对手之前的竞争手段。<br />\r\n<h3>\r\n	<a></a><a></a>七、可以销售产品\r\n</h3>\r\n许多人认为能够销售产品是使用互联网的主要原因，因为它可以到达推销员和销售渠道无法到达的地方，并且极大地方便了消费者。如果有人想成为你的用户，他们就想了解你是做什么的?你能为他们提供什么样的服务？但是在大多数情况下你的潜在用户总是找不到你的推销员，利用互联网你可以轻松廉价地展开销售攻势，你的潜在用户也可以轻松廉价地了解你公司的资料，与你的销售部门联络。<br />\r\n<h3>\r\n	<a></a><a></a>八、可以让公司简介、产品说明声情并茂\r\n</h3>\r\n尽管你的产品非常好，但人们总是看不到它的样子和它到底是怎么样工作的；产品画册虽然非常好，但它是静止的，也没有人知道它工作时发出什么声音。如果以上因素对你的准用户非常重要，你就应该利用互联网来介绍你的公司和产品，因为万维网（WWW）技术可以很简便地为一段产品介绍加入声音、图形、动画甚至影像等等，这些不断涌现出来的多媒体技术已让网络世界变得丰富多彩。<br />\r\n<h3>\r\n	<a></a><a></a>九、可以进入一个高需求的市场\r\n</h3>\r\n据统计，www的使用者们可能是一个需求最高的市场。通常，大学或更高学历的人已经获得一份较高的薪水，或者即将获得一份较高的薪水。进入INTERNET社会的这群人，会主动寻找或接受各种高档新产品的广告。尽管有其他因素影响，但这的确是一个目标高度集中的市场。<br />\r\n<h3>\r\n	<a></a><a></a>十、可以回答用户经常关心的问题\r\n</h3>\r\n在你的公司里任何一个经常接电话的人的都会告诉你，他们的时间被消耗在一遍又一遍回答同一个问题上，你甚至要为回答这些售前和售后问题而专门增设人手；而把这些问题的答案放到企业网站上你，就既能使用户们弄清楚问题又节省了大量时间和人力资源。<br />\r\n<h3>\r\n	<a></a><a></a>十一、可以同你的销售人员随时保持联系\r\n</h3>\r\n正在出差的员工可能需要产品资料和促成一笔生意的最新信息。如果你有这些信息，如何第一时间交到在外地的销售人员手上呢？派人送去？用速递？还是由他自生自灭？利用WWW技术你的销售人员可以在当地用市内电话上网，及时从企业主机上获取所需资料，无需长途电话费也无需派专人在公司留守。<br />\r\n<h3>\r\n	<a></a><a></a>十二、可以开拓国际市场\r\n</h3>\r\n你可能对国际潜在市场的信函、电话或法律的含义不太了解，现在通过访问该国的一些企业站点，你可以象同公司对面的公司交谈一样方便地了解国际市场，事实上当你想利用互联网走入国际市场之前，外国的公司可能已经用同样的方法了解过你公司的情况了。当你收到一些外国公司的国际电子邮件的查询时，你就明白到国际市场已为你打开，而这一切都是你以前认为难以办到的。<br />\r\n<h3>\r\n	<a></a><a></a>十三、可以提供24小时服务\r\n</h3>\r\n你也许有这样的经验，与大洋彼岸约定通话时间不是太早就是太晚，这样的情况难免让你觉得尴尬。因为你们之间存在时间差。你的业务也许遍布全球，但你的当地标准时间并非如此，你睡觉的时候正是你的客户的工作时间，怎么办？企业网站为你和你的客户提供每周7天每天24小时的不间断联系，无论什么时候你总能抢在竞争对手之前为客户提供他们需要的信息。甚至可以赶在他们上班之前做了一份计划书，当客户早上打开电脑，你的计划书就在那里了。<br />\r\n<h3>\r\n	<a></a><a></a>十四、可以尽可能快地更新信息\r\n</h3>\r\n有时许多信息还没有发布就变成旧的信息了，需要更新了，而印好的资料在你的手上就变成一堆废纸。电子出版改变了你的一切，没有纸张、油墨无需、无需预订版面、不论面积大小、没有加收、随时修改内容……，任何传统印刷方式都不可能有这种灵活性。<br />\r\n<h3>\r\n	<a></a><a></a>十五、可以得到客户的反馈\r\n</h3>\r\n你向客户发出各类目录和小册子，但是没有顾客上门，这到底是为什么？是产品的颜色、价格还是市场战略出了问题？你没有时间去寻找问题的答案，也没有大量金钱测试市场。有了企业网站，有了你的电子信箱系统，极大地方便客户/消费者及时向你反映情况，提出意见。', 'news/content', 'news_content', '0', '0', '48', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('3', ',000000,100001,100005,100016', 'admin', '什么是企业网站', '', '', 'NoPic.gif', '企业,宣传,企业网站,一个,不但,名片,形象,同时,销售,辅助,可以,网络,良好,平台,互联,就是,概念,网上,进行,相当于', '企业网站的概念\r\n企业网站，就是企业在互联网上进行网络建设和形像宣传的平台。企业网站就相当于一个企业的网络名片，不但对企业的形象是一个良好的宣传，同时可以辅助企业的销售', '<p>\r\n	<strong><span style=\"font-size:14px;\">企业网站的概念</span></strong><br />\r\n企业网站，就是企业在互联网上进行网络建设和形像宣传的平台。企业网站就相当于一个企业的网络名片，不但对企业的形象是一个良好的宣传，同时可以辅助企业的销售，甚至可以通过网络直接帮助企业实现产品的销售，企业可以利用网站来进行宣传、产品资讯发布、招聘等等。企业网站的作用就是为展现公司形象，加强客户服务，完善网络业务，还可以与潜在客户建立商业联系。随着网络的发展，出现了提供网络资讯为盈利手段的网络公司，通常这些公司的网站上提供人们生活各个方面的资讯，如时事新闻、旅游、娱乐、经济等。\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">企业网站的分类</span></strong><br />\r\n<strong>电子商务型</strong><br />\r\n主要面向供应商、客户或者企业产品（服务）的消费群体，以提供某种直属于企业业务范围的服务或交易、或者为业务服务的服务或者交易为主；这样的网站可以说是正处于电子商务化的一个中间阶段，由于行业特色和企业投入的深度广度的不同，其电子商务化程度可能处于从比较初级的服务支持、产品列表到比较高级的网上支付的其中某一阶段。通常这种类型可以形象的称为\"网上XX企业\"。例如，网上银行、网上酒店等。<br />\r\n<strong>多媒体广告型</strong><br />\r\n主要面向客户或者企业产品（服务）的消费群体，以宣传企业的核心品牌形象或者主要产品（服务）为主。这种类型无论从目的上还是实际表现手法上相对于普通网站而言更像一个平面广告或者电视广告，因此用\"多媒体广告\"来称呼这种类型的网站更贴切一点。<br />\r\n<strong>产品展示型</strong><br />\r\n主要面向需求商，展示自己产品的详细情况，以及公司的实力。对产品的价格、生产、详细介绍等做最全面的介绍。这种类型的企业站点主要目的是要展示自己产品的最直接有效的方式。在注重品牌和形象的同时也要重视您的产品的介绍。 　　在实际应用中，很多网站往往不能简单的归为某一种类型，无论是建站目的还是表现形式都可能涵盖了两种或两种以上类型；对于这种企业网站，可以按上述类型的区别划分为不同的部分，每一个部分都基本上可以认为是一个较为完整的网站类型。注意：由于互联网公司的特殊性，在这里不包含互联网的信息提供商或者服务提供商的网站。 　　提起企业网站,很多人都以为建立一个简单的具有展示性能的网站就可以了。但是往往忽略了一点——营销。其实建立一个企业网站,核心的观点就是如何使用这个网站推进或者推动企业营销,进而实现企业的信息化管理。 　　信息产业目前已成为第一大规模的产业，并位居全球第三位。这就意味着我国的企业信息化也迎来了前所未有的好时机。第四代智能网站的推出也为中小企业建站提供了思路，可以从企业实用角度出发，对网站进行“总体规划，分步实施”，既可以节省成本，又不影响企业的应用。这种方式目前已经为大多数中小企业所接受，并渐成热潮。\r\n</p>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">企业网站的本质和特点</span></strong><br />\r\n（1）<strong>企业网站具有自主性和灵活性 </strong> \r\n</p>\r\n<p>\r\n	企业网站完全是根据企业本身的需要建立的，并非由其他网络服务商所经营，因此在功能上有较大的自主性和灵活性，也正因为如此，每个企业网站的内容和功能会有较大的差别。企业网站效果的好坏，主动权掌握在自己手里，其前提是对企业网站有正确的认识，这样才能适应企业营销策略的需要，并且从经济上、技术上有实现的条件。因此，企业网站应适应企业的经营需要。\r\n</p>\r\n<p>\r\n	（2）<strong>企业网站是主动性与被动性的矛盾同一体 </strong> \r\n</p>\r\n<p>\r\n	企业通过自己的网站可以主动发布信息，这是企业网站主动性的一面，但是发布在网站上的信息不会自动传递给用户，只能“被动地”等待用户自己来获取信息，这又表现出企业网站具有被动性的一面。同时具有主动性与被动性也是企业网站与搜索引擎和电子邮件等网络营销工具在信息传递方式上的主要差异。从网络营销信息的传递方式来看，搜索引擎完全是被动的，只能被动地等待用户检索，只有用户检索使用的关键词和企业网站相关，并且在检索结果中的信息可以被用户看到并被点击的情况下，这一次网络营销信息的传递才得以实现。电子邮件传递信息则基本上是主动的，发送什么信息、什么时间用什么时候发送，都是营销人员自己可以决定的。\r\n</p>\r\n<p>\r\n	（3）<strong>企业网站的功能需要通过其他网络营销手段才能体现出来 </strong> \r\n</p>\r\n<p>\r\n	企业网站的网络营销价值，是通过网站的各种功能以及各种网络营销手段而体现出来的，网站的信息和功能是基础，网络营销方法的应用是条件。如果建设一个网站而不去合理应用，企业网站这个网络营销工具将不会发挥应用的作用，无论功能多么完善的网站，如果没有用户来浏览和应用，企业网站也就成为摆设，这也就是为什么网站推广作为网络营销首要职能的原因。在实际应用中，一些企业由于缺乏专业人员维护管理，于是呈现给浏览者的网站内容往往数年如一日，甚至用户的咨询邮件也不给予回复，这样的企业网站没有发挥其应用的作用，也就不足为怪了。\r\n</p>\r\n<p>\r\n	（4）<strong>企业网站的功能具有相对稳定性 </strong> \r\n</p>\r\n<p>\r\n	企业网站功能的相对稳定性具有两方面的含义：一方面，一旦网站的结构和功能被设计完成并正式开始运作，在一定时期内将基本稳定，只有在运行一个阶段后进行功能升级的情况下，才能拥有新的功能，网站功能的相对稳定性对于无论网站的运营维护还是对于一些常规网络营销方法的应用都很有必要，一个不断变化中的企业网站是不利于网络营销；另一方面，功能的相对稳定性也意味着，如果存在某些功能方面的缺陷，在下次升级之前的一段时间内，将影响网络营销效果的发挥，因此在企业网站策划过程中应充分考虑到网站功能的这一特点，尽量做到在一定阶段内功能适用并具有一定的前瞻性。 　　（5）企业网站是其他网络营销手段和方法的基础 　　企业网站是一个综合性的网络营销工具，这也就决定了企业网站在网络营销中的作用不是孤立的，不仅与其他营销方法具有直接的关系，也构成了开展网络营销的基础。本章后面的内容也将介绍，整个网络营销方法体系可分为无站点网络营销和基于企业网站的网络营销，后者在网络营销中居于支配地位，这也是在网络营销体系中不能脱离企业网站的根本原因。\r\n</p>', 'news/content', 'news_content', '0', '0', '59', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('6', ',000000,100001,100006', 'admin', '自助建站与定制开发的区别', '101', '', '20120716/thumb_1342406669.jpg', '建站,定制,这里,详细,这么,说明,手工,程序开发,优点,缺点,费用,为什么,行业,网站制作,区别,开发,客户,经常,模板,问题,两者', '在网站制作行业中，客户经常会问到的问题：“什么是模板建站，什么是定制建站”“为什么两者的费用会差这么多” \r\n这里做详细的说明： \r\n1.“手工建站”的优缺点： \r\n优点： 程序开发较', '<div>\r\n	<span style=\"font-size:14px;\">在网站制作行业中，客户经常会问到的问题：“什么是模板建站，什么是定制建站”“为什么两者的费用会差这么多”</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">这里做详细的说明：</span> \r\n</div>\r\n<div>\r\n	<strong><span style=\"font-size:14px;\">1.“手工建站”的优缺点：</span></strong> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">优点： 程序开发较自由，能够充分发挥网站开发人员的能力，使建成后的网站更具个性化，安全性、稳定性更好，同时，也使网站具有更强的扩展性。 网站便于优化、推广。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">缺点： 由于采用手工开发，人力成本相对较高，比其他建站方式需要花费更多的资源。</span> \r\n</div>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	&nbsp;\r\n</div>\r\n<div>\r\n	<strong><span style=\"font-size:14px;\">2.“模板建站”的优缺点：</span></strong> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">“模板建站”也称“自助建站”“智能建站”等</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">优点：建站速度快，成就低，被众多提供企业网站建设服务的网络公司采用。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">缺点：所建网站缺乏个性且功能简单。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">大多数模板建站工具将建站的快慢作为衡量标准，提出了\"一分钟建站\"的口号。一分钟建好一个网站，在技术上并不困难，但用户不禁会问：一分钟建好的网站好看吗？风格有个性吗？网站好用吗？</span> \r\n</div>\r\n<div>\r\n	<strong><span style=\"font-size:14px;\">·不能自由地移植用户网站</span></strong> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">由于建站、管理和维护工作必须在服务商的网站上完成，因此用户的网站也被捆绑在该公司的服务器上，用户网站不能自由地移植，限制了用户自由选择的权利。</span> \r\n</div>\r\n<div>\r\n	<strong><span style=\"font-size:14px;\">·不能灵活地扩展网站功能</span></strong> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">模板建站工具的功能模块是固定提供的，用户不能对其进行剪裁、或设置、或组合，更谈不上对其进行二次开发，或自由地导入自己开发的网站功能模块。</span> \r\n</div>\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	&nbsp;\r\n</div>\r\n<div>\r\n	<strong><span style=\"font-size:14px;\">·不能随意地编辑网页模板</span></strong> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">对于选用的网站模板，用户无法对其进行独立、随意地编辑，更不能导入自定义的模板，利用这样的技术制作网站，往往是一个呆板而雷同的网站，难以让人接受。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">最主要的缺点：绝大部分的自助建站都没有从营销的角度来建设，而且速度慢等问题让网站很难推广。而且自助建站系统是非常不利于优化、关键排名的。一个采用自助建站系统建设的企业网站，即使被百度、Google、雅虎、搜狗等搜索引擎收录了很多页面，但其排名也是非常落后的，达不到应有的公司产品宣传、推广效果。 </span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">网站的自助建站说到底，就是把建站的软件与服务器空间绑定在一起，用户直接利用软件来添加数据，数据添加好了，网站就形成了，但全是用的模板，不好轻易的进行风格改变，当然也可以换换模板，但再换，网络公司提供的也只是模板而矣，模板里面的内容可以添加与修改，但是，模板本身不好变化，现在先进的模板自身也可以变化，但出来的网页页面不是手工开发而成的。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">网站开发是指网站制作，即制作出一个个的网页，通过相互链接，形成一个整体，这个整体是一个单独的网页组成，这些网页我们称之为源程序或叫做源代码，然后再申请一个服务器空间，将这些源程序放置在这个虚拟的空间中，接着再用域名指向到这个IP空间上，当然，作为空间本身，也要绑定这个域名。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">这样，在地址栏上，输入域名，即可以找开域名指向的空间里面的内容，即网站内定，供浏览者进行浏览。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">网站的自助建站与网站开发出来的手工建站的根本区别在于，一是模板化和模块化，而手工建站是根据要求量身订做的，网站风格及设计效果根本无法进行比较。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">模板网站：框架固定，后台固定，页面版式大众化。代码漏洞多。想升级的话麻烦。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">专业网站：无论是页面，还是后台都是根据顾客的想法来定制开发，专业的网站基本上都是独一无二的，做的好会比较吸引人。以后升级的话也方便。</span> \r\n</div>', 'news/content', 'news_content', '0', '1', '125', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('7', ',000000,100001,100006', 'admin', '新一代iPad 3 5.1不受限制的越狱演示', '101', '#ff8040', '20120716/thumb_1342400219.jpg', '新一代iPad 3 5.1不受限制的越狱演示', '新一代iPad 3 5.1不受限制的越狱演示', '<p align=\"center\">\r\n	<embed src=\"http://www.tudou.com/v/BAgtUpeInTw/&resourceId=0_05_05_99&bid=05/v.swf\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"opaque\" width=\"480\" height=\"400\" /> \r\n</p>', 'news/content', 'news_content', '0', '1', '62', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('5', ',000000,100001,100006', 'admin', '网站推广的方法', '', '', 'NoPic.gif', '网站推广,方法,资源,工具,利用,可以,常用,科技,相应,发现,根据,合理利用,实现,具体,所有,实际上,实施,通过,各种', '网站推广的实施是通过各种具体的方法来实现的，所有的网站推广方法实际上都是对网站推广工具和资源 的合理利用。根据可以利用的常用的网站推广工具和资源御彩科技发现，相应地，', '<p>\r\n	网站推广的实施是通过各种具体的方法来实现的，所有的网站推广方法实际上都是对网站推广工具和资源 的合理利用。根据可以利用的常用的网站推广工具和资源御彩科技发现，相应地，可以将网站推广的基本方法也可以归纳为八种：搜索引擎推广方法、电子邮件推广方法、资源合作推广方法、信息发布推广方法、病毒性营销方法、快捷网址推广方法、网络广告推广方法、综合网站推广方法。<br />\r\n<br />\r\n<strong>1. 搜索引擎推广方法</strong><br />\r\n搜索引擎推广是指利用搜索引擎、分类目录等具 有在线检索信息功能的网络工具进行网站推广的方法。由于搜索引擎的基本形式可以分为网络蜘蛛型搜索引擎（简称搜索引擎）和基于人工分类目录的搜索引擎（简称分类目录），因此搜索引擎推广的形式也相应地有基于搜索引擎的方法和基于分类目录的方法，前者包括搜索引擎优化、关键词广告、竞价排名、固定排名、基于 内容定位的广告等多种形式，而后者则主要是在分类目录合适的类别中进行网站登录。随着搜索引擎形式的进一步发展变化，也出现了其他一些形式的搜索引擎，不过大都是以这两种形式为基础。<br />\r\n搜索引擎推广的方法又可以分为多种不同的形式，常见的有：登录免费分类目录、登录付费分类目录、搜索引擎优化、关键词广告、关键词竞价排名、网 页内容定位广告等。 <br />\r\n从目前的发展趋势来看，搜索引擎在网络营销中的地位依然重要，并且受到越来越多企业的认可，搜索引擎营销的方式也在不断发展演变，因此应根据环 境的变化选择搜索引擎营销的合适方式。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>2. 电子邮件推广方法</strong><br />\r\n以电子邮件为主要的网站推广手段，常用的方法包括电子刊物、会员通讯、专业服务商的电子邮件广告等。<br />\r\n基于用户许可的Email营销与滥发邮件（Spam）不同，许可营销比传统的推广方式或未经许可的Email营销具有明显的优势，比如可以减少 广告对用户的滋扰、增加潜在客户定位的准确度、增强与客户的关系、提高品牌忠诚度等。根据许可Email营销所应用的用户电子邮件地址资源的所有形式，可 以分为内部列表Email营销和外部列表Email营销，或简称内部列表和外部列表。内部列表也就是通常所说的邮件列表，是利用网站的注册用户资料开展 Email营销的方式，常见的形式如新闻邮件、会员通讯、电子刊物等。外部列表Email营销则是利用专业服务商的用户电子邮件地址来开展Email营 销，也就是电子邮件广告的形式向服务商的用户发送信息。许可Email营销是网络营销方法体系中相对独立的一种，既可以与其他网络营销方法相结合，也可以独立应用。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>3. 资源合作推广方法</strong><br />\r\n通过网站交换链接、交换广告、内容合作、用户资源合作等方式，在具有类似目标网站之间实现互相推广的目 的，其中最常用的资源合作方式为网站链接策略，利用合作伙伴之间网站访问量资源合作互为推广。<br />\r\n每个企业网站均可以拥有自己的资源，这种资源可以表现为一定的访问量、注册用户信息、有价值的内容和功能、网络广告空间等，利用网站的资源与合 作伙伴开展合作，实现资源共享，共同扩大收益的目的。在这些资源合作形式中，交换链接是最简单的一种合作方式，调查表明也是新网站推广的有效方式之一。交换链接或称互惠链接，是具有一定互补优势的网站之间的简单合作形式，即分别在自己的网站上放置对方网站的LOGO或网站名称并设置对方网站的超级链接，使得用户可以从合作网站中发现自己的网站，达到互相推广的目。交换链接的作用主要表现在几个方面：获得访问量、增加用户浏览时的印象、在搜索引擎排名中增加 优势、通过合作网站的推荐增加访问者的可信度等。交换链接还有比是否可以取得直接效果更深一层的意义，一般来说，每个网站都倾向于链接价值高的其他网站，因此获得其他网站的链接也就意味着获得了于合作伙伴和一个领域内同类网站的认可。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>4. 信息发布推广方法</strong><br />\r\n将有关的网站推广信息发布在其他潜在用户可能访问的网站上，利用用户在这些网站获取信息的机会实现网站推广 的目的，适用于这些信息发布的网站包括在线黄页、分类广告、论坛、博客网站、供求信息平台、行业网站等。信息发布是免费网站推广的常用方法之一，尤其在互联网发展早期，网上信息量相对较少时，往往通过信息发布的方式即可取得满意的效果，不过随着网上信息量爆炸式的增长，这种依靠免费信息发布的方式所能发挥 的作用日益降低，同时由于更多更加有效的网站推广方法的出现，信息发布在网站推广的常用方法中的重要程度也有明显的下降，因此依靠大量发送免费信息的方式已经没有太大价值，不过一些针对性、专业性的信息仍然可以引起人们极大的关注，尤其当这些信息发布在相关性比较高。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>5. 病毒性营销方法</strong><br />\r\n病毒性营销方法并非传播病毒，而是利用用户之间的主动传播，让信息像病毒那样扩散，从而达到推广的目的，病毒 性营销方法实质上是在为用户提供有价值的免费服务的同时，附加上一定的推广信息，常用的工具包括免费电子书、免费软件、免费FLASH作品、免费贺卡、免 费邮箱、免费即时聊天工具等可以为用户获取信息、使用网络服务、娱乐等带来方便的工具和内容。如果应用得当，这种病毒性营销手段往往可以以极低的代价取得非常显著的效果。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>6. 快捷网址推广方法</strong><br />\r\n即合理利用网络实名、通用网址以及其他类似的关键词网站快捷访问方式来实现网站推广的方法。快捷网址使用自 然语言和网站URL建立其对应关系，这对于习惯于使用中文的用户来说，提供了极大的方便，用户只需输入比英文网址要更加容易记忆的快捷网址就可以访问网站，用自己的母语或者其他简单的词汇为网站“更换”一个更好记忆、更容易体现品牌形象的网址，例如选择企业名称或者商标、主要产品名称等作为中文网址，这样可以大大弥补英文网址不便于宣传的缺陷，因为在网址推广方面有一定的价值。随着企业注册快捷网址数量的增加，这些快捷网址用户数据可也相当于一个搜索引 擎，这样，当用户利用某个关键词检索时，即使与某网站注册的中文网址并不一致，同样存在被用户发现的机会。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>7. 网络广告推广方法</strong><br />\r\n网络广告是常用的网络营销策略之一，在网络品牌、产品促销、网站推广等方面均有明显作用。网络广告的常见 形式包括：BANNER广告、关键词广告、分类广告、赞助式广告、Email广告等。BANNER广告所依托的媒体是网页、关键词广告属于搜索引擎营销的 一种形式，Email广告则是许可Email营销的一种，可见网络广告本身并不能独立存在，需要与各种网络工具相结合才能实现信息传递的功能，因此也可以 认为，网络广告存在于各种网络营销工具中，只是具体的表现形式不同。将网络广告用户网站推广，具有可选择网络媒体范围广、形式多样、适用性强、投放及时等优点，适合于网站发布初期及运营期的任何阶段。\r\n</p>\r\n<p>\r\n	<br />\r\n<strong>8. 综合网站推广方法</strong><br />\r\n除了前面介绍的常用网站推广方法之外，还有许多专用性、临时性的网站推广方法，如有奖竞猜、在线优惠卷、有 奖调查、针对在线购物网站推广的比较购物和购物搜索引擎等，有些甚至采用建立一个辅助网站进行推广。有些网站推广方法可能别出心裁，有些网站则可能采用有一定强迫性的方式来达到推广的目的，例如修改用户浏览器默认首页设置、自动加入收藏夹，甚至在用户电脑上安装病毒程序等，真正值得推广的是合理的、文明的 网站推广方法，应拒绝和反对带有强制性、破坏性的网站推广手段。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'news/content', 'news_content', '0', '0', '39', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('8', ',000000,100001,100005', 'admin', '用最少的代码完成对多的事情', '100', '', '20130407/thumb_1365298922.jpg', '代码,完成,事情,最少,优雅,幻灯,简洁,高效,首页', '简洁、高效、优雅，用最少的代码完成对多的事情', '简洁、高效、优雅，用最少的代码完成对多的事情', 'news/content', 'news_content', '0', '0', '31', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('9', ',000000,100001,100005', 'admin', '为客户创造价值就是我们存在的价值', '100', '', '20130407/thumb_1365298980.jpg', '价值,就是,存在,我们,创造,幻灯,客户,首页', '为客户创造价值就是我们存在的价值', '为客户创造价值就是我们存在的价值', 'news/content', 'news_content', '0', '0', '34', '1', '原创', '1366353661', '0');
INSERT INTO `yx_news` VALUES ('11', ',000000,100018', 'admin', '为什么我按照提示安装不上系统？', '', '', 'NoPic.gif', '安装,检查,是否,使用,记得,或者,修改,程序,其他,文件,打开,填写,发布,环境,系统,提示,按照,为什么,正确,参数,版本,确认', '1、检查您的发布环境是否为PHP+MySql,且版本都是5.0上。\r\n2、检查您的安装参数是否填写正确。\r\n3、请确认您没用修改过程序，或者使用记得事本或其他非专业编辑器打开过.php后缀文件。\r\n4、如', '<p>\r\n	1、检查您的发布环境是否为PHP+MySql,且版本都是5.0上。&nbsp;\r\n</p>\r\n<p>\r\n	2、检查您的安装参数是否填写正确。&nbsp;\r\n</p>\r\n<p>\r\n	3、请确认您没用修改过程序，或者使用记得事本或其他非专业编辑器打开过.php后缀文件。\r\n</p>\r\n<p>\r\n	4、如果以上都检查无误，请将错误提示发送给客服帮您解决。如果没有显示错误提示请在protected/config.php中检查DEBUG是否设置为true。\r\n</p>', 'news/content', 'news_content', '0', '0', '35', '1', '原创', '1367283616', '0');
INSERT INTO `yx_news` VALUES ('12', ',000000,100018', 'admin', '使用YXcms需要收费么？', '', '', 'NoPic.gif', '需要,功能,版权,系统,使用,信息,如果,登陆,模板,定制,或者,查看,联系,费用,保留,并且,基础,收费,收取,建站,任何,项目', '如果您使用YXcms建站系统基础功能并且保留系统版权信息是不收取任何费用的。\r\n如果您的项目需要去除版权信息，或者您需要定制功能或模板，请登陆官网：http://www.yxcms.net 联系客服查看详', '如果您使用YXcms建站系统基础功能并且保留系统版权信息是不收取任何费用的。如果您的项目需要去除版权信息，或者您需要定制功能或模板，请登陆官网：http://www.yxcms.net 联系客服查看详细收费信息。', 'news/content', 'news_content', '3', '0', '3', '1', '原创', '1367283664', '0');

-- ----------------------------
-- Table structure for `yx_orders`
-- ----------------------------
DROP TABLE IF EXISTS `yx_orders`;
CREATE TABLE `yx_orders` (
  `id` int(15) NOT NULL auto_increment,
  `ordernum` varchar(20) NOT NULL COMMENT ' 订单号',
  `account` varchar(30) NOT NULL COMMENT '账户',
  `total` float NOT NULL COMMENT '总价',
  `freight` float NOT NULL COMMENT '运费',
  `ordertime` int(11) NOT NULL COMMENT '订单时间',
  `state` tinyint(1) NOT NULL COMMENT '订单状态',
  `mess` text NOT NULL COMMENT '订单信息',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `yx_order_detail`;
CREATE TABLE `yx_order_detail` (
  `id` int(20) NOT NULL auto_increment,
  `code` varchar(10) NOT NULL COMMENT '商品编号',
  `ordernum` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `num` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `yx_page`
-- ----------------------------
DROP TABLE IF EXISTS `yx_page`;
CREATE TABLE `yx_page` (
  `id` int(10) NOT NULL auto_increment,
  `sort` varchar(350) NOT NULL,
  `content` text NOT NULL,
  `edittime` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_page
-- ----------------------------
INSERT INTO `yx_page` VALUES ('1', ',000000,100003', '采用三级缓存：数据库缓存、模板缓存、静态缓存，可使网站数据达到百万级负载！\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n采用功能与显示分离设计，灵活的标签库和任意拓展的插件机制，让您随心所欲，将DIY进行到底！\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n拥有建站各种实用功能，摒弃各种复杂繁琐的功能操作。卓越的用户体验，让您使用起来方便明了！\r\n<hr style=\"page-break-after:always;\" class=\"ke-pagebreak\" />\r\n遵循BSD开源协议，不对用户做任何功能限制，保证用户二次商业开发使用！\r\n', '2012-07-12 14:52:41');

-- ----------------------------
-- Table structure for `yx_photo`
-- ----------------------------
DROP TABLE IF EXISTS `yx_photo`;
CREATE TABLE `yx_photo` (
  `id` int(20) NOT NULL auto_increment,
  `sort` varchar(350) NOT NULL COMMENT '类别',
  `account` char(15) NOT NULL COMMENT '发布者账户',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `places` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL COMMENT '标题颜色',
  `picture` varchar(80) NOT NULL COMMENT '封面图',
  `keywords` varchar(300) NOT NULL COMMENT '关键字',
  `description` varchar(600) NOT NULL,
  `photolist` text NOT NULL COMMENT '图片集',
  `conlist` text NOT NULL COMMENT '图片说明',
  `content` text NOT NULL COMMENT '内容',
  `method` varchar(100) NOT NULL COMMENT '方法',
  `tpcontent` varchar(100) NOT NULL COMMENT '模板',
  `norder` int(4) NOT NULL COMMENT '排序',
  `recmd` tinyint(1) NOT NULL COMMENT '推荐',
  `hits` int(10) NOT NULL COMMENT '点击量',
  `ispass` tinyint(1) NOT NULL,
  `addtime` int(11) NOT NULL,
  `extfield` int(10) NOT NULL default '0' COMMENT '拓展字段',
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_photo
-- ----------------------------
INSERT INTO `yx_photo` VALUES ('1', ',000000,100002,100007', 'admin', 'Kristen Jaymes Stewart', '', '', '1207130223541112317932.jpg', '依然,没有改变,文艺,爱好者,最爱,气质,迷人,演员,凭借', '克里斯汀·斯图尔特，美国演员，凭借《暮色》走红，但斯图尔特清丽迷人的气质没有改变，她依然是文艺片爱好者心头最爱。', '1207130223531353040021.jpg,1207130223541112317932.jpg,1207130223541632278949.jpg', 'Kristen Jaymes Stewart,Kristen Jaymes Stewart,Kristen Jaymes Stewart', '克里斯汀·斯图尔特，美国演员，凭借《暮色》走红，但斯图尔特清丽迷人的气质没有改变，她依然是文艺片爱好者心头最爱。', 'photo/content', 'photo_content', '0', '0', '47', '1', '1366353661', '0');
INSERT INTO `yx_photo` VALUES ('2', ',000000,100002,100007', 'admin', '音乐才女邓福如', '', '', '12071302251562304480.jpg', '网络,翻唱,自己,学生,如果,人气,因为,跟随,像是,纷纷,知道,全球,青年,学子,一样,甚至,实在,觉得,有趣,没想到,喜欢,还有,外国,同样,效应,网站,夺冠,原来,专辑,如此,成绩,更是,发行,', '声名远播的新人气歌手邓福如，因为在YouTube网路上翻唱歌曲爆红，正式发行首张专辑【原来如此!!】成绩更是惊人！不但在KK BOX数位下载， 五大和光南唱片实体销售、YouTube网络人气上夺冠， 更因为勤跑超过20场校园和网络效应的扩延,让全球青年学子都知道台湾有个网络爆红的阿福，跟随阿福脚步的学生纷纷在YouTube翻唱阿福新歌『未填词』，甚至还有外国学生也同样在YouTube网络上翻唱阿福新歌『如果有如果』和『一点点喜欢』，让阿福自己都觉得很有趣，没想到有一天自己的歌竟也会被翻唱到网站上，实在像是作梦一样！', '1207130225141960794180.jpg,1207130225151558808654.jpg,12071302251562304480.jpg', '邓福如,邓福如,邓福如', '声名远播的新人气歌手邓福如，因为在YouTube网路上翻唱歌曲爆红，正式发行首张专辑【原来如此!!】成绩更是惊人！不但在KK BOX数位下载， 五大和光南唱片实体销售、YouTube网络人气上夺冠， 更因为勤跑超过20场校园和网络效应的扩延,让全球青年学子都知道台湾有个网络爆红的阿福，跟随阿福脚步的学生纷纷在YouTube翻唱阿福新歌『未填词』，甚至还有外国学生也同样在YouTube网络上翻唱阿福新歌『如果有如果』和『一点点喜欢』，让阿福自己都觉得很有趣，没想到有一天自己的歌竟也会被翻唱到网站上，实在像是作梦一样！', 'photo/content', 'photo_content', '0', '0', '81', '1', '1366353661', '0');
INSERT INTO `yx_photo` VALUES ('3', ',000000,100002,100008', 'admin', '知性美女桂纶镁', '', '', '1207130226051497895902.jpg', '大学,出演,形象,高中,导演,合作,颠覆,其中,女人,周迅,不能,周杰伦,扮演,电影,秘密,一贯,戴立忍,男友,多年,年初,分手,登场,歌手,清新,个性,十足,摇滚,自己,心灵,前往,文学,里昂,第三', '桂纶镁，女，1983年12月25日出生，中国台湾新生代演员。高中就读薇阁高中，大学毕业于淡江大学法国语文学系，曾于2004年9月前往法国里昂第三大学交换学生。高二时出演《蓝色大门》当中的“孟克柔”，跨出了她人生第一步表演生涯。之后桂纶镁出演了《经过》《危险心灵》《波丽士大人》等影视剧。2007年，扮演周杰伦电影导演处女作《不能说的秘密》中的女主角。2008年，她与周迅、张雨绮合作出演了徐克导演的《女人不坏》，在其中颠覆自己一贯的清新形象，以个性十足的摇滚歌手形象登场。与男友戴立忍相恋多年，2010年初被传分手。', '1207130226041130855370.jpg,1207130226051164136083.jpg,1207130226051497895902.jpg', '桂纶镁,桂纶镁,桂纶镁', '桂纶镁，女，1983年12月25日出生，中国台湾新生代演员。高中就读薇阁高中，大学毕业于淡江大学法国语文学系，曾于2004年9月前往法国里昂第三大学交换学生。高二时出演《蓝色大门》当中的“孟克柔”，跨出了她人生第一步表演生涯。之后桂纶镁出演了《经过》《危险心灵》《波丽士大人》等影视剧。2007年，扮演周杰伦电影导演处女作《不能说的秘密》中的女主角。2008年，她与周迅、张雨绮合作出演了徐克导演的《女人不坏》，在其中颠覆自己一贯的清新形象，以个性十足的摇滚歌手形象登场。与男友戴立忍相恋多年，2010年初被传分手。', 'photo/content', 'photo_content', '0', '0', '50', '1', '1366353661', '0');
INSERT INTO `yx_photo` VALUES ('4', ',000000,100002,100008', 'admin', '惠美的李英爱', '', '', '12071409164974461451.jpg', '电影,大长今,参与,出演,事业,演艺,连续剧,演出,电影节,地毯,更是,美女,戏剧,大学,出生,专业,博士,美的,形象,绯闻,学历', '韩国女演员李英爱于1971年出生，2009年获汉阳大学研究生院戏剧电影学专业博士——高学历、绯闻少、形象佳的她，被誉为“氧气美女”。于1993年入演艺事业，2003年，她因出演《大长今》而红遍亚洲。曾参与30多出连续剧及2部电影演出，2005年更是走在了威尼斯电影节的红地毯上。2011年2月20日，李英爱在首尔诞下一对龙凤胎。', '1207140916481346431949.jpg,1207140916492035362256.jpg,12071409164974461451.jpg', '李英爱,李英爱,李英爱', '韩国女演员李英爱于1971年出生，2009年获汉阳大学研究生院戏剧电影学专业博士——高学历、绯闻少、形象佳的她，被誉为“氧气美女”。于1993年入演艺事业，2003年，她因出演《大长今》而红遍亚洲。曾参与30多出连续剧及2部电影演出，2005年更是走在了威尼斯电影节的红地毯上。2011年2月20日，李英爱在首尔诞下一对龙凤胎。', 'photo/content', 'photo_content', '0', '0', '75', '1', '1366353661', '0');
INSERT INTO `yx_photo` VALUES ('5', ',000000,100004,100009', 'admin', '2012款 华晨宝马X1 xDrive20i豪华型', '', '', '1207141009151467340643.jpg', '豪华型,宝马', '2012款 华晨宝马X1 xDrive20i豪华型', '120714100914380365650.jpg,1207141009151467340643.jpg,1207141009161460552430.jpg,1207141009161683601778.jpg,120714100917518719018.jpg', ',,,,', '2012款 华晨宝马X1 xDrive20i豪华型', 'photo/content', 'photo_pcontent', '0', '0', '112', '1', '1366353661', '1');
INSERT INTO `yx_photo` VALUES ('6', ',000000,100004,100010', 'admin', '2012款 宾利欧陆(进口) GT 4.0L V8', '', '', '1207141017071099344068.jpg', '进口', '2012款 宾利欧陆(进口) GT 4.0L V8', '1207141017051955819764.jpg,1207141017051663967042.jpg,1207141017062055178821.jpg,1207141017071129248170.jpg,1207141017071099344068.jpg', ',,,,', '2012款 宾利欧陆(进口) GT 4.0L V8', 'photo/content', 'photo_pcontent', '0', '0', '94', '1', '1366353661', '2');

-- ----------------------------
-- Table structure for `yx_place`
-- ----------------------------
DROP TABLE IF EXISTS `yx_place`;
CREATE TABLE `yx_place` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `norder` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_place
-- ----------------------------
INSERT INTO `yx_place` VALUES ('100', '首页banner', '0');
INSERT INTO `yx_place` VALUES ('101', '首页幻灯', '0');

-- ----------------------------
-- Table structure for `yx_sort`
-- ----------------------------
DROP TABLE IF EXISTS `yx_sort`;
CREATE TABLE `yx_sort` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `type` tinyint(2) unsigned NOT NULL default '0' COMMENT '模型类别',
  `path` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `deep` int(5) unsigned NOT NULL default '1' COMMENT '深度',
  `norder` tinyint(10) unsigned NOT NULL default '0' COMMENT '排序',
  `ifmenu` tinyint(1) NOT NULL COMMENT '是否前台显示',
  `method` varchar(100) NOT NULL COMMENT '模型方法',
  `tplist` varchar(100) NOT NULL COMMENT '列表模板',
  `keywords` varchar(255) NOT NULL COMMENT '描述',
  `description` varchar(300) NOT NULL COMMENT '描述',
  `url` varchar(100) NOT NULL COMMENT '外部链接',
  `extendid` int(10) NOT NULL COMMENT '拓展表id',
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `path` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=100024 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_sort
-- ----------------------------
INSERT INTO `yx_sort` VALUES ('100001', '1', ',000000', '网站常识', '1', '1', '1', 'news/index', 'news_index,news_content', '网站常识', '网站常识', '10', '0');
INSERT INTO `yx_sort` VALUES ('100002', '2', ',000000', '趣味图集', '1', '2', '1', 'photo/index', 'photo_index,photo_content', '趣味图集', '趣味图集', '10', '0');
INSERT INTO `yx_sort` VALUES ('100003', '3', ',000000', '系统介绍', '1', '0', '1', 'page/index', 'page_index', '系统介绍', '系统介绍', '', '0');
INSERT INTO `yx_sort` VALUES ('100004', '2', ',000000', '酷车在线', '1', '3', '1', 'photo/index', 'photo_indexp,photo_pcontent', '酷车在线', '酷车在线', '10', '1');
INSERT INTO `yx_sort` VALUES ('100005', '1', ',000000,100001', '建站知识', '2', '0', '1', 'news/index', 'news_index,news_content', '建站知识', '建站知识', '10', '0');
INSERT INTO `yx_sort` VALUES ('100006', '1', ',000000,100001', '推广常识', '2', '0', '1', 'news/index', 'news_index,news_content', '推广常识', '推广常识', '10', '0');
INSERT INTO `yx_sort` VALUES ('100007', '2', ',000000,100002', '气质美女', '2', '0', '1', 'photo/index', 'photo_index,photo_content', '气质美女', '气质美女', '10', '0');
INSERT INTO `yx_sort` VALUES ('100008', '2', ',000000,100002', '性感美女', '2', '0', '1', 'photo/index', 'photo_index,photo_content', '性感美女', '性感美女', '10', '0');
INSERT INTO `yx_sort` VALUES ('100009', '2', ',000000,100004', '品牌汽车', '2', '0', '1', 'photo/index', 'photo_indexp,photo_pcontent', '品牌汽车', '品牌汽车', '10', '1');
INSERT INTO `yx_sort` VALUES ('100010', '2', ',000000,100004', '酷车DIY', '2', '0', '1', 'photo/index', 'photo_indexp,photo_pcontent', '酷车DIY', '酷车DIY', '10', '1');
INSERT INTO `yx_sort` VALUES ('100012', '5', ',000000', 'Yxcms', '1', '4', '1', '', '', '', '', 'http://www.yxcms.net', '1');
INSERT INTO `yx_sort` VALUES ('100022', '6', ',000000', '内容评论', '1', '6', '0', 'extend/index', 'extend_index', '', '', '10', '7');
INSERT INTO `yx_sort` VALUES ('100016', '1', ',000000,100001,100005', 'PHP学习', '3', '1', '1', 'news/index', 'news_index,news_content', 'PHP学习', 'PHP学习', '10', '0');
INSERT INTO `yx_sort` VALUES ('100017', '1', ',000000,100001,100005', 'JavaScript', '3', '2', '1', 'news/index', 'news_index,news_content', 'JavaScript', 'JavaScript', '10', '0');
INSERT INTO `yx_sort` VALUES ('100018', '1', ',000000', '常见问题', '1', '0', '1', 'news/index', 'news_index,news_content', 'HTML布局', 'HTML布局', '10', '0');
INSERT INTO `yx_sort` VALUES ('100019', '1', ',000000,100001,100005,100017', 'Jquery框架', '4', '0', '1', 'news/index', 'news_index,news_content', 'Jquery框架', 'Jquery框架', '10', '0');
INSERT INTO `yx_sort` VALUES ('100023', '6', ',000000', '留言本', '1', '5', '1', 'extend/index', 'extend_guestbook', '', '', '10', '12');

-- ----------------------------
-- Table structure for `yx_tags`
-- ----------------------------
DROP TABLE IF EXISTS `yx_tags`;
CREATE TABLE `yx_tags` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `hits` int(10) NOT NULL default '0',
  `mesnum` int(10) NOT NULL default '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_tags
-- ----------------------------
INSERT INTO `yx_tags` VALUES ('1', '网络', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('2', '翻唱', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('4', '学生', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('5', '如果', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('6', '人气', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('7', '因为', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('8', '跟随', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('9', '像是', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('10', '纷纷', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('11', '知道', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('12', '全球', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('13', '青年', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('14', '学子', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('19', '有趣', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('21', '喜欢', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('23', '外国', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('24', '同样', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('25', '效应', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('26', '网站', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('27', '夺冠', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('29', '专辑', '0', '0', '1369743083');
INSERT INTO `yx_tags` VALUES ('31', '成绩', '0', '1', '1369743083');
