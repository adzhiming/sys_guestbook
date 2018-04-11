/*
Navicat MySQL Data Transfer

Source Server         : 共想科技rds(正式)
Source Server Version : 50718
Source Host           : 39.108.137.149:9572
Source Database       : sys_guestbook

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-11 10:59:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sy_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `sy_adminuser`;
CREATE TABLE `sy_adminuser` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `username` varchar(30) DEFAULT NULL COMMENT '帐号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `admin` varchar(5) DEFAULT 'user' COMMENT '管理级别',
  `gid` varchar(512) NOT NULL DEFAULT '0' COMMENT '绑定留言本ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sy_adminuser
-- ----------------------------
INSERT INTO `sy_adminuser` VALUES ('1', '0', 'admin', '8d55f377e5b778d1b417d2c82982cde8', '', '0');
INSERT INTO `sy_adminuser` VALUES ('13', '1', 'lzm', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '0');
INSERT INTO `sy_adminuser` VALUES ('14', '1', 'bliss', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '0');
INSERT INTO `sy_adminuser` VALUES ('15', '1', 'dana', 'e10adc3949ba59abbe56e057f20f883e', 'user', '0');
INSERT INTO `sy_adminuser` VALUES ('16', '14', 'bliss1', 'e10adc3949ba59abbe56e057f20f883e', 'user', '0');
INSERT INTO `sy_adminuser` VALUES ('17', '1', 'fuerdai', 'a139cb0b55552beb7a6c9b783fd0e55d', 'admin', '0');
INSERT INTO `sy_adminuser` VALUES ('18', '1', 'gxkj', 'e64bb94c7182d34478f0ba48bd075836', 'admin', '0');
INSERT INTO `sy_adminuser` VALUES ('19', '1', 'cxzy', 'a2b7590ef60e63ca7ad5cb22ec93eebd', 'admin', '0');

-- ----------------------------
-- Table structure for sy_admin_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `sy_admin_guestbook`;
CREATE TABLE `sy_admin_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL,
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sy_admin_guestbook
-- ----------------------------
INSERT INTO `sy_admin_guestbook` VALUES ('29', '14', '5', '2018-03-13 16:11:33');
INSERT INTO `sy_admin_guestbook` VALUES ('31', '16', '5', '2018-03-14 11:03:31');
INSERT INTO `sy_admin_guestbook` VALUES ('32', '17', '6', '2018-03-15 15:31:53');
INSERT INTO `sy_admin_guestbook` VALUES ('33', '18', '7', '2018-03-16 17:04:05');
INSERT INTO `sy_admin_guestbook` VALUES ('34', '19', '8', '2018-03-26 16:33:43');
INSERT INTO `sy_admin_guestbook` VALUES ('35', '19', '9', '2018-03-31 18:01:23');
INSERT INTO `sy_admin_guestbook` VALUES ('36', '19', '10', '2018-04-04 11:24:36');

-- ----------------------------
-- Table structure for sy_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `sy_guestbook`;
CREATE TABLE `sy_guestbook` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `gName` varchar(100) NOT NULL COMMENT '名称',
  `gLogo` varchar(100) DEFAULT 'tpl/guestbook/default/images/logo.jpg',
  `gIntroduction` text COMMENT '介绍',
  `gBanner` varchar(100) DEFAULT 'tpl/images/notlogo.jpg' COMMENT 'banner',
  `gTpl` varchar(30) DEFAULT 'default' COMMENT '模版',
  `gPag` int(5) DEFAULT '8' COMMENT '每页留言数',
  `gKeywords` varchar(160) DEFAULT NULL COMMENT '关键字',
  `gDescription` varchar(500) DEFAULT NULL COMMENT '简介',
  `gCheck` varchar(3) DEFAULT 'no' COMMENT '是否需要审核',
  `gDisplay` varchar(3) DEFAULT 'yes' COMMENT '是否显示留言列表',
  `gFilter` varchar(3) DEFAULT 'no' COMMENT '是否安全过滤留言',
  `gTongji` varchar(300) DEFAULT NULL COMMENT '统计代码',
  `gBeian` varchar(30) DEFAULT NULL COMMENT '备案',
  `access_ip` varchar(512) NOT NULL DEFAULT '' COMMENT '允许调用的ip（留空为不现在）',
  `gPowerby` varchar(100) DEFAULT NULL COMMENT '版权',
  `gNav` varchar(500) DEFAULT NULL COMMENT '自定义导航',
  `gHead` varchar(6) DEFAULT 'qqshow' COMMENT '调用头像类型',
  `creator` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sy_guestbook
-- ----------------------------
INSERT INTO `sy_guestbook` VALUES ('5', '共想演示留言板', 'tpl/images/notlogo.jpg', '', 'tpl/images/notlogo.jpg', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '127.0.0.1,192.168.6.2', '', '', 'qqshow', '14');
INSERT INTO `sy_guestbook` VALUES ('6', '富二贷留言板', '', '', '', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '', '', '', 'qqshow', '17');
INSERT INTO `sy_guestbook` VALUES ('7', ' 共想科技官网', '', '', '', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '', '', '', 'qqshow', '18');
INSERT INTO `sy_guestbook` VALUES ('8', 'book.biksc.com（小帮手）', 'tpl/images/notlogo.jpg', '', 'tpl/images/notlogo.jpg', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '', '', '', 'qqshow', '19');
INSERT INTO `sy_guestbook` VALUES ('9', 'xihuan.biksc.com（小邦手客户发货留言板）', 'tpl/images/notlogo.jpg', '', 'tpl/images/notlogo.jpg', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '', '', '', 'qqshow', '19');
INSERT INTO `sy_guestbook` VALUES ('10', 'xinhuan.knengda.com(昕环推广页)', 'tpl/images/notlogo.jpg', '', 'tpl/images/notlogo.jpg', 'simple', '8', '', '', 'yes', 'yes', 'yes', '', '', '', '', '', 'qqshow', '19');

-- ----------------------------
-- Table structure for sy_message
-- ----------------------------
DROP TABLE IF EXISTS `sy_message`;
CREATE TABLE `sy_message` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `gid` int(8) DEFAULT NULL COMMENT '留言本ID',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `nick` varchar(50) DEFAULT '' COMMENT '昵称',
  `phone` varchar(20) DEFAULT '',
  `qq` varchar(15) DEFAULT NULL COMMENT 'QQ',
  `message` text COMMENT '留言内容',
  `reply` text COMMENT '回复',
  `replyAdmin` varchar(30) DEFAULT NULL COMMENT '回复管理员',
  `addtime` varchar(13) DEFAULT NULL COMMENT '留言时间',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP',
  `url` varchar(512) NOT NULL DEFAULT '' COMMENT '留言来源url',
  `address` varchar(50) DEFAULT NULL COMMENT '解析的地址',
  `good` int(8) DEFAULT '0' COMMENT '赞',
  `status` varchar(3) DEFAULT 'yes' COMMENT '审核状态',
  `remark` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sy_message
-- ----------------------------
INSERT INTO `sy_message` VALUES ('1', '1', '随意留言板', '', '', '1030040075', '第一条留言！', null, null, '1447433541', '183.92.138.25', '', '湖北孝感', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('2', '1', '熊妹子', '', '', '1030040075', '第二条留言！', null, null, '1447433576', '183.92.138.25', '', '湖北孝感', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('3', '2', '随意留言板', '', '', '1030040075', '请用手机浏览', '', 'admin', '1447433817', '183.92.138.25', '', '湖北孝感', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('4', '1', '布布', '', '', '', '留言测一下', null, null, '1520574540', '119.129.225.203', '', '广东广州', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('5', '1', 'lzmmmm', '', '13710332006', null, '塑料袋风扫地福克斯地方i', null, null, '1520590544', '121.33.20.194', '', '广东广州', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('6', '1', '布布1', '', '13126549969', null, '请认真填写您的留言信息，以便我们能更快的处理您的问题！', null, null, '1520590629', '121.33.20.194', '', '广东广州', '0', 'yes', '');
INSERT INTO `sy_message` VALUES ('8', '2', '拜拜', '', '13466667777', null, '不知行不行呢', null, null, '1520591040', '117.136.41.80', '', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('9', '2', 'chen', '', '13566656565', null, '这次可以留言吗？', null, null, '1520823091', '119.129.226.211', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=megAddPost&gid=2', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('10', '5', '技术测试', '', '13724881515', null, '的留言信息，以便我们能更快的处理您的问题！技术测试', null, null, '1520929957', '121.33.21.150', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=megAddPost&gid=5', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('11', '7', '布布', '', '13825020000', null, '官网开通测试，可以留言了。', null, null, '1521191129', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=megAddPost&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('12', '7', '1212', '1212', '13437846334', null, '产品类型APP  内容123213', null, null, '1521195128', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('13', '7', '123', '12312', '13437846334', null, '产品类型APP  内容123123', null, null, '1521195178', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('14', '7', '123123', '123123', '13437846334', null, '产品类型APP  内容ASDASDASDASD', null, null, '1521195235', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('15', '7', '123123', '123123', '13437846334', null, '产品类型APP  内容ASDASDASDASD', null, null, '1521195271', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('16', '7', '123123', '123123', '13437846334', null, '产品类型APP  内容ASDASDASDASD', null, null, '1521195276', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('17', '7', '123123', '123123', '13437846334', null, '产品类型APP  内容ASDASDASDASD', null, null, '1521195292', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('18', '7', '123123', '123123', '13437846334', null, '产品类型APP  内容ASDASDASDASD', null, null, '1521195295', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('19', '7', '1', '`1123213', '13437846334', null, '产品类型APP  内容123213', null, null, '1521195309', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('20', '7', '1123', '123213', '13437846334', null, '产品类型APP  内容11111', null, null, '1521195328', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('21', '7', '131', '123123', '13437846334', null, '产品类型APP  内容123213213123', null, null, '1521195431', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('22', '6', '2222', '', '13437846334', null, '123213213213asdeasadsasd阿德飒飒的·', null, null, '1521195704', '116.23.26.15', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=megAddPost&gid=6', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('23', '7', '张君', '张君', '13560464310', null, '产品类型PC管理后台  内容测试官网留言', null, null, '1521200024', '223.104.63.91', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东', '0', 'no', '是地方');
INSERT INTO `sy_message` VALUES ('24', '7', '布布', '布布', '13825023333', null, '产品类型APP  内容订餐app，能外卖，能堂食，可以呼叫服务员。\n电商系统多少钱？', null, null, '1521770554', '121.33.21.117', 'http://guestbook.gzgxkj.com/index.php?c=guestbook&a=api_message_add&gid=7', '广东广州', '0', 'no', '测试');
INSERT INTO `sy_message` VALUES ('56', '8', '测试', '', '18822882511', null, '推广到留言版的接口信息', null, null, '1522064049', '116.21.130.127', 'http://book.biksc.com/', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('129', '10', '勇测试', '', '13437846334', null, '留言内容是：收到留言了吗', null, null, '1522824157', '119.129.227.169', 'file:///C:/Users/Administrator/Desktop/xihuan/index.html', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('138', '9', '王洪灵', '', '15976853972', null, '收货地址：深圳市宝安区西乡海城路麻布村四巷十一号905', null, null, '1522977700', '113.87.88.236', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('142', '9', '王春元', '', '13755061293', null, '收货地址：湖南省长沙市开福区四方商贸城a19栋402室', null, null, '1522982360', '101.130.55.52', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '湖南长沙', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('143', '9', '赖晓革', '', '13978235097', null, '收货地址：广西省贵港市平南县', null, null, '1522984027', '117.136.97.34', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('145', '9', '钱宇泓', '', '13867497115', null, '收货地址：浙江省杭州市富阳区春江街道建设村', null, null, '1522984693', '112.17.235.98', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('147', '9', '赵礼', '', '15957779621', null, '收货地址：浙江温州市鹿城区白鹿湾新希望龙元建设', null, null, '1522986164', '112.17.241.29', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('148', '9', '王乐军', '', '15192982767', null, '收货地址：山东省莒南县开发区古路沟村', null, null, '1522995064', '111.37.20.255', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东临沂', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('150', '9', '苏桂元', '', '15013031131', null, '收货地址：南岭工业区五横路六号', null, null, '1522995710', '27.47.232.96', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('151', '9', '陈金本', '', '15159172425', null, '收货地址：三明市大田县吴山乡镇吴山村224号', null, null, '1522997579', '140.243.136.24', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('152', '9', '郭贝', '', '15036321425', null, '收货地址：河南省洛阳市栾川县庙子乡庙子村四组42号', null, null, '1522998810', '117.136.44.231', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '河南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('153', '9', '胡振江', '', '13755785419', null, '收货地址：深圳坪山新区 金牌路飞西第二工明智注塑有公司', null, null, '1522998960', '117.136.79.105', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('155', '9', '郑天福', '', '15058552204', null, '收货地址：浙江省兰溪市灵洞乡龚塘村麻车桥39号', null, null, '1523066912', '112.17.241.88', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('157', '9', '于鹏飞', '', '14740210090', null, '收货地址：辽宁省鞍山市台安县台安镇大庆西路庆丰巷16杠3号', null, null, '1523067910', '223.104.176.41', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('159', '9', '顾腾生', '', '13879098474', null, '收货地址：江西省新余市仙来西大道仙境苑正对面王坑村', null, null, '1523070087', '117.136.109.233', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('160', '9', '刘美芳', '', '15079866652', null, '收货地址：广东省汕头市谷饶镇谷关路新坡路同桌网吧', null, null, '1523070681', '183.46.138.190', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广东汕头', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('161', '8', '丁立水', '', '18669702718', null, '推广到留言版的接口信息', null, null, '1523071308', '58.58.47.210', 'http://xjbys.66jiedai.cn/?cid=4', '山东青岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('162', '8', '丁立水', '', '18669702718', null, '推广到留言版的接口信息', null, null, '1523071317', '58.58.47.210', 'http://xjbys.66jiedai.cn/?cid=4', '山东青岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('163', '8', '丁立水', '', '18669702718', null, '推广到留言版的接口信息', null, null, '1523071327', '58.58.47.210', 'http://xjbys.66jiedai.cn/?cid=4', '山东青岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('165', '8', '张明星', '', '15834886010', null, '推广到留言版的接口信息', null, null, '1523071529', '111.26.33.138', 'http://xjbys.66jiedai.cn/?cid=4', '吉林', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('166', '8', '张明星', '', '15834886010', null, '推广到留言版的接口信息', null, null, '1523071560', '111.26.33.138', 'http://xjbys.66jiedai.cn/?cid=4', '吉林', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('167', '8', '王雪松', '', '15386602829', null, '推广到留言版的接口信息', null, null, '1523071885', '171.210.154.211', 'http://xjbys.66jiedai.cn/?cid=3', '四川', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('168', '8', '王雪松', '', '15386602829', null, '推广到留言版的接口信息', null, null, '1523071897', '171.210.154.211', 'http://xjbys.66jiedai.cn/?cid=3', '四川', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('169', '8', '15235502340', '', '15235502340', null, '推广到留言版的接口信息', null, null, '1523071963', '223.8.84.166', 'http://xjbys.66jiedai.cn/?cid=4', '山西长治', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('170', '8', '15235502340', '', '15235502340', null, '推广到留言版的接口信息', null, null, '1523071973', '223.8.84.166', 'http://xjbys.66jiedai.cn/?cid=4', '山西长治', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('171', '9', '魏朝刚', '', '18384467899', null, '收货地址：四川省凉山、彝族自治州西昌市西溪乡牛郎村九组四十七号', null, null, '1523072323', '117.136.69.163', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '四川', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('172', '8', '阿尔孜古丽', '', '17699793181', null, '推广到留言版的接口信息', null, null, '1523072406', '43.242.152.214', 'http://xjbys.66jiedai.cn/?cid=3', '新疆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('173', '8', '15942912646', '', '15942912646', null, '推广到留言版的接口信息', null, null, '1523072429', '182.204.235.175', 'http://xjbys.66jiedai.cn/?cid=4', '辽宁葫芦岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('174', '8', '阿尔孜古丽', '', '17699793181', null, '推广到留言版的接口信息', null, null, '1523072431', '43.242.152.214', 'http://xjbys.66jiedai.cn/?cid=3', '新疆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('175', '8', '15942912646', '', '15942912646', null, '推广到留言版的接口信息', null, null, '1523072440', '182.204.235.175', 'http://xjbys.66jiedai.cn/?cid=4', '辽宁葫芦岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('176', '9', '李所萍', '', '15125754938', null, '收货地址：云南省楚雄彝族自治州大姚县咪依噜大酒店餐饮部', null, null, '1523072738', '223.104.12.102', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '云南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('177', '8', '于洪涛', '', '13351352551', null, '推广到留言版的接口信息', null, null, '1523072981', '218.7.171.242', 'http://xjbys.66jiedai.cn/?cid=4', '黑龙江绥化', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('178', '8', '于洪涛', '', '13351352551', null, '推广到留言版的接口信息', null, null, '1523073008', '218.7.171.242', 'http://xjbys.66jiedai.cn/?cid=4', '黑龙江绥化', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('179', '8', '于前', '', '13478031008', null, '推广到留言版的接口信息', null, null, '1523073152', '223.104.177.27', 'http://xjbys.66jiedai.cn/?cid=4', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('180', '8', '于前', '', '13478031008', null, '推广到留言版的接口信息', null, null, '1523073163', '223.104.177.27', 'http://xjbys.66jiedai.cn/?cid=4', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('181', '8', '王武林', '', '13914522660', null, '推广到留言版的接口信息', null, null, '1523075116', '117.136.45.177', 'http://xjbys.66jiedai.cn/?cid=1', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('182', '8', '王武林', '', '13914522660', null, '推广到留言版的接口信息', null, null, '1523075133', '117.136.45.177', 'http://xjbys.66jiedai.cn/?cid=1', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('183', '8', '张月芝', '', '15874327073', null, '推广到留言版的接口信息', null, null, '1523075388', '223.104.131.47', 'http://xjbys.66jiedai.cn/?cid=1', '湖南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('184', '8', '张月芝', '', '15874327073', null, '推广到留言版的接口信息', null, null, '1523075400', '223.104.131.47', 'http://xjbys.66jiedai.cn/?cid=1', '湖南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('185', '8', '陈建朝', '', '17733022555', null, '推广到留言版的接口信息', null, null, '1523075783', '106.119.25.178', 'http://xjbys.66jiedai.cn/?cid=2', '河北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('186', '8', '陈建朝', '', '17733022555', null, '推广到留言版的接口信息', null, null, '1523075791', '106.119.25.178', 'http://xjbys.66jiedai.cn/?cid=2', '河北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('187', '8', '陈建朝', '', '17733022555', null, '推广到留言版的接口信息', null, null, '1523075825', '106.119.25.178', 'http://xjbys.66jiedai.cn/?cid=2', '河北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('188', '8', '董艳文', '', '13363299586', null, '推广到留言版的接口信息', null, null, '1523076610', '101.75.17.28', 'http://xjbys.66jiedai.cn/?cid=1', '河北唐山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('189', '8', '董艳文', '', '13363299586', null, '推广到留言版的接口信息', null, null, '1523076615', '101.75.17.28', 'http://xjbys.66jiedai.cn/?cid=1', '河北唐山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('190', '8', '董艳文', '', '13363299586', null, '推广到留言版的接口信息', null, null, '1523076619', '101.75.17.28', 'http://xjbys.66jiedai.cn/?cid=1', '河北唐山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('191', '8', '董艳文', '', '13363299586', null, '推广到留言版的接口信息', null, null, '1523076683', '101.75.17.28', 'http://xjbys.66jiedai.cn/?cid=1', '河北唐山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('192', '8', '白天国', '', '13698012799', null, '推广到留言版的接口信息', null, null, '1523077058', '117.136.60.202', 'http://xjbys.66jiedai.cn/?cid=4', '江西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('193', '8', '白天国', '', '13698012799', null, '推广到留言版的接口信息', null, null, '1523077066', '117.136.60.202', 'http://xjbys.66jiedai.cn/?cid=4', '江西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('195', '9', '张钝', '', '18758887823', null, '收货地址：浙江省杭州市余杭区风雅乐府排屋9-3', null, null, '1523080647', '112.17.240.142', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('198', '8', '13274476528', '', '13274476525', null, '推广到留言版的接口信息', null, null, '1523083710', '10.53.50.152', 'http://xjbys.66jiedai.cn/?cid=4', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('199', '8', '13274476528', '', '13274476525', null, '推广到留言版的接口信息', null, null, '1523083754', '10.53.50.152', 'http://xjbys.66jiedai.cn/?cid=4', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('200', '8', '13274476528', '', '13274476525', null, '推广到留言版的接口信息', null, null, '1523083763', '10.53.50.152', 'http://xjbys.66jiedai.cn/?cid=4', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('201', '8', '13274476528', '', '13274476525', null, '推广到留言版的接口信息', null, null, '1523083769', '10.53.50.152', 'http://xjbys.66jiedai.cn/?cid=4', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('202', '9', '张华忠', '', '13987223701', null, '收货地址：云南省大理州宾川县金牛镇桑园居委会金川路208号', null, null, '1523084244', '223.104.238.162', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('203', '9', '冷建俊', '', '13775305235', null, '收货地址：江苏省扬中市油坊镇良善村8组275号', null, null, '1523084743', '117.136.46.232', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('205', '9', '刘民', '', '15166239501', null, '收货地址：山东省东营市河口区凤凰城市场大成玉器店', null, null, '1523085810', '223.104.186.210', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('207', '9', '陈世钟', '', '15960490046', null, '收货地址：福建省福鼎市流美路5巷73号', null, null, '1523087985', '110.125.217.1', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建宁德', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('208', '9', '梁宜瑶', '', '13197603029', null, '收货地址：广西南宁市江南区星光大道荣宝华商贸城A12栋105信誉广告设计部', null, null, '1523095084', '117.141.110.253', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广西防城港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('210', '8', '邓弘武', '', '15826348189', null, '推广到留言版的接口信息', null, null, '1523117596', '113.250.54.124', 'http://xjbys.66jiedai.cn/?cid=1', '重庆重庆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('211', '8', '邓弘武', '', '15826348189', null, '推广到留言版的接口信息', null, null, '1523117611', '113.250.54.124', 'http://xjbys.66jiedai.cn/?cid=1', '重庆重庆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('212', '8', '游光梅', '', '15221233021', null, '推广到留言版的接口信息', null, null, '1523117677', '180.172.73.147', 'http://xjbys.66jiedai.cn/?cid=1', '上海上海', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('213', '8', '游光梅', '', '15221233021', null, '推广到留言版的接口信息', null, null, '1523117745', '180.172.73.147', 'http://xjbys.66jiedai.cn/?cid=1', '上海上海', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('214', '8', '陈弟', '', '13434821207', null, '推广到留言版的接口信息', null, null, '1523117767', '121.9.141.194', 'http://xjbys.66jiedai.cn/?cid=1', '广东佛山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('215', '8', '陈弟', '', '13434821207', null, '推广到留言版的接口信息', null, null, '1523117776', '121.9.141.194', 'http://xjbys.66jiedai.cn/?cid=1', '广东佛山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('216', '8', '王晨曦', '', '15172582773', null, '推广到留言版的接口信息', null, null, '1523117782', '27.27.48.58', 'http://xjbys.66jiedai.cn/?cid=1', '湖北襄阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('217', '8', '王晨曦', '', '15172582773', null, '推广到留言版的接口信息', null, null, '1523117800', '27.27.48.58', 'http://xjbys.66jiedai.cn/?cid=1', '湖北襄阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('218', '8', '杨菁菁', '', '15391319484', null, '推广到留言版的接口信息', null, null, '1523117813', '106.61.15.121', 'http://xjbys.66jiedai.cn/?cid=3', '云南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('219', '8', '邓玉成', '', '15778436268', null, '推广到留言版的接口信息', null, null, '1523117818', '111.58.11.246', 'http://xjbys.66jiedai.cn/?cid=3', '广西贺州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('220', '8', '杨菁菁', '', '15391319484', null, '推广到留言版的接口信息', null, null, '1523117821', '106.61.15.121', 'http://xjbys.66jiedai.cn/?cid=3', '云南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('221', '8', '邓玉成', '', '15778436268', null, '推广到留言版的接口信息', null, null, '1523117826', '111.58.11.246', 'http://xjbys.66jiedai.cn/?cid=3', '广西贺州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('222', '8', '邓玉成', '', '15778436268', null, '推广到留言版的接口信息', null, null, '1523117861', '111.58.11.246', 'http://xjbys.66jiedai.cn/?cid=3', '广西贺州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('223', '8', '刘晓东', '', '17691229893', null, '推广到留言版的接口信息', null, null, '1523118394', '113.135.160.8', 'http://xjbys.66jiedai.cn/?cid=4', '陕西渭南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('224', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118398', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('225', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118403', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('226', '8', '刘晓东', '', '17691229893', null, '推广到留言版的接口信息', null, null, '1523118406', '113.135.160.8', 'http://xjbys.66jiedai.cn/?cid=4', '陕西渭南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('227', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118411', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('228', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118418', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('229', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118433', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('230', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118436', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('231', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118438', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('232', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118446', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('233', '8', '许丽', '', '15707300785', null, '推广到留言版的接口信息', null, null, '1523118448', '223.144.130.5', 'http://xjbys.66jiedai.cn/?cid=1', '湖南岳阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('234', '8', '李見和', '', '13872405790', null, '推广到留言版的接口信息', null, null, '1523118482', '43.227.137.26', 'http://xjbys.66jiedai.cn/?cid=3', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('235', '8', '李見和', '', '13872405790', null, '推广到留言版的接口信息', null, null, '1523118490', '43.227.137.26', 'http://xjbys.66jiedai.cn/?cid=3', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('236', '8', '李見和', '', '13872405790', null, '推广到留言版的接口信息', null, null, '1523118524', '43.227.137.26', 'http://xjbys.66jiedai.cn/?cid=3', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('237', '8', '李見和', '', '13872405790', null, '推广到留言版的接口信息', null, null, '1523118530', '43.227.137.26', 'http://xjbys.66jiedai.cn/?cid=3', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('238', '8', '魏佐钦', '', '15779778601', null, '推广到留言版的接口信息', null, null, '1523118546', '223.104.174.34', 'http://xjbys.66jiedai.cn/?cid=1', '江西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('239', '8', '魏佐钦', '', '15779778601', null, '推广到留言版的接口信息', null, null, '1523118552', '223.104.174.34', 'http://xjbys.66jiedai.cn/?cid=1', '江西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('240', '8', '魏佐钦', '', '15779778601', null, '推广到留言版的接口信息', null, null, '1523118582', '223.104.174.34', 'http://xjbys.66jiedai.cn/?cid=1', '江西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('241', '8', '贵剑云', '', '13600508051', null, '推广到留言版的接口信息', null, null, '1523118802', '125.106.187.207', 'http://xjbys.66jiedai.cn/?cid=1', '浙江衢州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('242', '8', '贵剑云', '', '13600508051', null, '推广到留言版的接口信息', null, null, '1523118807', '125.106.187.207', 'http://xjbys.66jiedai.cn/?cid=1', '浙江衢州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('243', '8', '贵剑云', '', '13600508051', null, '推广到留言版的接口信息', null, null, '1523118837', '125.106.187.207', 'http://xjbys.66jiedai.cn/?cid=1', '浙江衢州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('244', '8', '宋静雯', '', '13513765534', null, '推广到留言版的接口信息', null, null, '1523119039', '117.136.36.248', 'http://xjbys.66jiedai.cn/?cid=1', '河南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('245', '8', '杨国华', '', '13835943850', null, '推广到留言版的接口信息', null, null, '1523119057', '117.136.90.160', 'http://xjbys.66jiedai.cn/?cid=1', '山西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('246', '8', '宋静雯', '', '13513765534', null, '推广到留言版的接口信息', null, null, '1523119058', '117.136.36.248', 'http://xjbys.66jiedai.cn/?cid=1', '河南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('247', '8', '杨国华', '', '13835943850', null, '推广到留言版的接口信息', null, null, '1523119065', '117.136.90.160', 'http://xjbys.66jiedai.cn/?cid=1', '山西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('248', '8', '杨国华', '', '13835943850', null, '推广到留言版的接口信息', null, null, '1523119078', '117.136.90.160', 'http://xjbys.66jiedai.cn/?cid=1', '山西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('249', '8', '游尊容', '', '15923599909', null, '推广到留言版的接口信息', null, null, '1523119500', '183.228.117.210', 'http://xjbys.66jiedai.cn/?cid=1', '重庆重庆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('250', '8', '游尊容', '', '15923599909', null, '推广到留言版的接口信息', null, null, '1523119509', '183.228.117.210', 'http://xjbys.66jiedai.cn/?cid=1', '重庆重庆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('251', '8', '李新苗', '', '13923801012', null, '推广到留言版的接口信息', null, null, '1523119682', '202.104.114.145', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('252', '8', '李新苗', '', '13923801012', null, '推广到留言版的接口信息', null, null, '1523119698', '202.104.114.145', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('253', '8', '李新苗', '', '13923801012', null, '推广到留言版的接口信息', null, null, '1523119701', '202.104.114.145', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('254', '8', '李新苗', '', '13923801012', null, '推广到留言版的接口信息', null, null, '1523119718', '202.104.114.145', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('255', '8', '李新苗', '', '13923801012', null, '推广到留言版的接口信息', null, null, '1523119824', '202.104.114.145', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('256', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120053', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('257', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120057', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('258', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120062', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('259', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120068', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('260', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120073', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('261', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120087', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('262', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120257', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('263', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120263', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('264', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120287', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('265', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120300', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('266', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120309', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('267', '8', '朱邵波', '', '15105522369', null, '推广到留言版的接口信息', null, null, '1523120313', '223.245.106.24', 'http://xjbys.66jiedai.cn/?cid=1', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('268', '8', '王进仓', '', '18255283956', null, '推广到留言版的接口信息', null, null, '1523120826', '117.65.23.114', 'http://xjbys.66jiedai.cn/?cid=4', '安徽蚌埠', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('269', '8', '張志源', '', '15394584329', null, '推广到留言版的接口信息', null, null, '1523122401', '111.147.50.88', 'http://xjbys.66jiedai.cn/?cid=4', '福建三明', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('270', '8', '張志源', '', '15394584329', null, '推广到留言版的接口信息', null, null, '1523122410', '111.147.50.88', 'http://xjbys.66jiedai.cn/?cid=4', '福建三明', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('271', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125342', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('272', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125365', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('273', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125400', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('274', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125404', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('275', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125406', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('276', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125417', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('277', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125422', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('278', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125425', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('279', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125432', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('280', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125472', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('281', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125477', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('282', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125479', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('283', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125525', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('284', '8', '梁强', '', '13457622008', null, '推广到留言版的接口信息', null, null, '1523125565', '117.181.90.77', 'http://xjbys.66jiedai.cn/?cid=4', '广西贵港', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('285', '8', '郑刘郑', '', '15150061669', null, '推广到留言版的接口信息', null, null, '1523135467', '180.124.71.27', 'http://xjbys.66jiedai.cn/?cid=4', '江苏徐州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('286', '8', '郑刘郑', '', '15150061669', null, '推广到留言版的接口信息', null, null, '1523135504', '180.124.71.27', 'http://xjbys.66jiedai.cn/?cid=4', '江苏徐州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('287', '8', '郑刘郑', '', '15150061669', null, '推广到留言版的接口信息', null, null, '1523135580', '180.124.71.27', 'http://xjbys.66jiedai.cn/?cid=4', '江苏徐州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('288', '8', '郑刘郑', '', '15150061669', null, '推广到留言版的接口信息', null, null, '1523135621', '180.124.71.27', 'http://xjbys.66jiedai.cn/?cid=4', '江苏徐州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('289', '8', '雷文忠', '', '15957025765', null, '推广到留言版的接口信息', null, null, '1523148208', '39.173.14.187', 'http://xjbys.66jiedai.cn/?cid=2', '浙江衢州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('290', '8', '雷文忠', '', '15957025765', null, '推广到留言版的接口信息', null, null, '1523148218', '39.173.14.187', 'http://xjbys.66jiedai.cn/?cid=2', '浙江衢州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('292', '9', '陈德安', '', '13489683996', null, '收货地址：福建漳州平和县山格镇山格村大街50号', null, null, '1523150985', '140.224.162.137', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建漳州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('293', '9', '孙美娜', '', '13754617786', null, '收货地址：山东省威海市经济开发区青岛南路温泉康城小区', null, null, '1523151881', '112.224.67.158', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('294', '8', 'lzm', '', '13710332006', null, '推广到留言版的接口信息', null, null, '1523153977', '119.129.227.121', 'http://xjbys.66jiedai.cn/', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('296', '9', '蔡克龙', '', '13698968087', null, '收货地址：海南省五指山市海榆北路104号', null, null, '1523156112', '153.0.1.243', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '海南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('297', '9', '薛锋', '', '13666759605', null, '收货地址：浙江省加兴市南湖区长新公寓四期1‘34栋602室', null, null, '1523156303', '218.205.55.96', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江杭州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('299', '9', '刘烈贵', '', '13797322322', null, '收货地址：湖北省监利县容城镇民主路1号', null, null, '1523160003', '223.104.20.129', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('302', '9', '崔稳全', '', '13546495710', null, '收货地址：山西省运城市工农西街盛世花园一号楼五单元601', null, null, '1523183824', '117.136.91.86', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('303', '8', '刘志军', '', '18703075528', null, '推广到留言版的接口信息', null, null, '1523204550', '223.116.83.181', 'http://xjbys.66jiedai.cn/?cid=1', '新疆塔城', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('304', '8', '秦美娟', '', '15929907121', null, '推广到留言版的接口信息', null, null, '1523204647', '117.35.135.194', 'http://xjbys.66jiedai.cn/?cid=1', '陕西西安', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('305', '8', '俞力', '', '13301617313', null, '推广到留言版的接口信息', null, null, '1523204708', '61.165.149.2', 'http://xjbys.66jiedai.cn/?cid=1', '上海上海', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('306', '8', '俞涛', '', '18857626328', null, '推广到留言版的接口信息', null, null, '1523205189', '39.182.232.103', 'http://xjbys.66jiedai.cn/?cid=3', '浙江台州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('307', '8', '刘西光', '', '15266392522', null, '推广到留言版的接口信息', null, null, '1523205222', '223.104.185.165', 'http://xjbys.66jiedai.cn/?cid=1', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('308', '8', '张雷', '', '15927246594', null, '推广到留言版的接口信息', null, null, '1523205319', '117.136.52.218', 'http://xjbys.66jiedai.cn/?cid=3', '湖北武汉', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('309', '8', '张雷', '', '15927246594', null, '推广到留言版的接口信息', null, null, '1523205319', '117.136.52.218', 'http://xjbys.66jiedai.cn/?cid=3', '湖北武汉', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('310', '8', '马永才', '', '18173023603', null, '推广到留言版的接口信息', null, null, '1523206705', '118.206.228.6', 'http://xjbys.66jiedai.cn/?cid=3', '湖南长沙', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('311', '8', '陆林升', '', '13769604018', null, '推广到留言版的接口信息', null, null, '1523206942', '112.116.115.148', 'http://xjbys.66jiedai.cn/?cid=3', '云南红河', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('312', '8', '陆小焱', '', '13690134785', null, '推广到留言版的接口信息', null, null, '1523207251', '113.70.46.49', 'http://xjbys.66jiedai.cn/?cid=1', '广东佛山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('313', '8', '宋谢洪', '', '18111181883', null, '推广到留言版的接口信息', null, null, '1523208448', '171.210.148.161', 'http://xjbys.66jiedai.cn/?cid=1', '四川', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('314', '8', '李建伟', '', '13884188627', null, '推广到留言版的接口信息', null, null, '1523209082', '223.104.27.168', 'http://xjbys.66jiedai.cn/?cid=1', '甘肃', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('315', '8', '苏淑芳', '', '18060676269', null, '推广到留言版的接口信息', null, null, '1523210717', '140.243.143.179', 'http://xjbys.66jiedai.cn/?cid=1', '福建', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('316', '8', '刘庆彬', '', '17367678440', null, '推广到留言版的接口信息', null, null, '1523211162', '36.98.143.77', 'http://xjbys.66jiedai.cn/?cid=3', '河北石家庄', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('317', '8', '吴晓宇', '', '18727036633', null, '推广到留言版的接口信息', null, null, '1523212136', '117.154.121.26', 'http://xjbys.66jiedai.cn/?cid=1', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('318', '8', '杨会胜', '', '13329288695', null, '推广到留言版的接口信息', null, null, '1523218450', '117.69.38.56', 'http://xjbys.66jiedai.cn/?cid=1', '安徽淮南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('319', '8', '佘聪', '', '18436166555', null, '推广到留言版的接口信息', null, null, '1523219831', '223.91.214.213', 'http://xjbys.66jiedai.cn/?cid=4', '河南焦作', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('320', '8', '张成明', '', '18809558855', null, '推广到留言版的接口信息', null, null, '1523223166', '121.57.213.133', 'http://xjbys.66jiedai.cn/?cid=1', '内蒙古阿拉善', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('321', '8', '莫桥競', '', '17817584409', null, '推广到留言版的接口信息', null, null, '1523224274', '117.136.13.209', 'http://xjbys.66jiedai.cn/?cid=1', '海南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('322', '8', '张林亮', '', '15187930944', null, '推广到留言版的接口信息', null, null, '1523227478', '117.136.85.141', 'http://xjbys.66jiedai.cn/?cid=4', '云南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('323', '8', '任凤海', '', '15174834946', null, '推广到留言版的接口信息', null, null, '1523231326', '1.183.230.109', 'http://xjbys.66jiedai.cn/?cid=1', '内蒙古赤峰', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('324', '8', '唐海林', '', '13615166375', null, '推广到留言版的接口信息', null, null, '1523231391', '180.126.149.239', 'http://xjbys.66jiedai.cn/?cid=1', '江苏盐城', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('325', '8', '吴兴津', '', '15767199427', null, '推广到留言版的接口信息', null, null, '1523232171', '223.73.131.46', 'http://xjbys.66jiedai.cn/?cid=1', '广东佛山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('326', '8', '李雪娇', '', '13009718596', null, '推广到留言版的接口信息', null, null, '1523234598', '220.201.230.181', 'http://xjbys.66jiedai.cn/?cid=1', '黑龙江哈尔滨', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('327', '9', '赵黎明', '', '15244170885', null, '收货地址：山东省淄博市淄川区西关二村35号', null, null, '1523239124', '182.34.135.249', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东淄博', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('329', '9', '李红雷', '', '15270162688', null, '收货地址：江西吉安市吉州区阳光新城19栋2单元1301', null, null, '1523243133', '117.166.232.40', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '江西吉安', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('331', '9', '华丽金', '', '18750018460', null, '收货地址：福建省莆田市荔城区黄石镇沙坂村田柄', null, null, '1523243218', '223.104.6.66', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('333', '9', '黄永林', '', '13317643377', null, '收货地址：广西梧州市长洲区新兴三路73号恒安小区六栋二单元302房', null, null, '1523252701', '171.111.235.64', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广西河池', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('335', '9', '吴泽灿', '', '13656945558', null, '收货地址：福建省福安市阳头街道栖云西路32号一2', null, null, '1523257995', '110.83.166.85', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建宁德', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('336', '9', '王良', '', '13778772543', null, '收货地址：四川省巴中市巴州区新市街富力锦城3楼巴中眼科医院', null, null, '1523258370', '183.223.148.142', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '四川巴中', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('337', '9', '王德财', '', '15169283566', null, '收货地址：山东省淄博市周村区王村镇张古村358号', null, null, '1523261379', '27.195.216.129', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东淄博', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('338', '9', '马璐', '', '15942912646', null, '收货地址：辽宁省葫芦岛市连山区寺儿卜镇圆通快递', null, null, '1523262450', '112.41.250.32', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('342', '9', '周鹏飞', '', '13513492018', null, '收货地址：河北省沧州市任丘市文化北道梅园新村', null, null, '1523263908', '27.128.43.244', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '河北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('343', '9', '苏淑芳', '', '13159401826', null, '收货地址：福州市永泰县岭路乡岭路村大府仑16号', null, null, '1523267896', '110.84.171.7', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '福建福州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('344', '8', '罗运峰', '', '18486518234', null, '推广到留言版的接口信息', null, null, '1523291477', '111.85.57.195', 'http://xjbys.66jiedai.cn/?cid=4', '贵州毕节', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('345', '8', '纪金鹏', '', '18299524666', null, '推广到留言版的接口信息', null, null, '1523292108', '120.69.39.16', 'http://xjbys.66jiedai.cn/?cid=4', '新疆昌吉', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('346', '8', '闫雅琼', '', '13500023583', null, '推广到留言版的接口信息', null, null, '1523292298', '120.230.81.8', 'http://xjbys.66jiedai.cn/?cid=1', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('347', '8', '闫雅琼', '', '13500023583', null, '推广到留言版的接口信息', null, null, '1523292298', '120.230.81.8', 'http://xjbys.66jiedai.cn/?cid=1', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('348', '8', '闫雅琼', '', '13500023583', null, '推广到留言版的接口信息', null, null, '1523292298', '120.230.81.8', 'http://xjbys.66jiedai.cn/?cid=1', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('349', '8', '李超', '', '15367262960', null, '推广到留言版的接口信息', null, null, '1523297332', '223.211.94.188', 'http://xjbys.66jiedai.cn/?cid=4', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('350', '8', '杨晓军', '', '18277880772', null, '推广到留言版的接口信息', null, null, '1523297977', '117.136.76.246', 'http://xjbys.66jiedai.cn/?cid=1', '广西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('351', '8', '李毓国', '', '15286291556', null, '推广到留言版的接口信息', null, null, '1523298213', '112.17.240.242', 'http://xjbys.66jiedai.cn/?cid=3', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('352', '8', '王祥华', '', '13913695820', null, '推广到留言版的接口信息', null, null, '1523305986', '223.104.145.120', 'http://xjbys.66jiedai.cn/?cid=1', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('353', '8', '张艳红', '', '13673225040', null, '推广到留言版的接口信息', null, null, '1523306486', '183.48.30.180', 'http://xjbys.66jiedai.cn/?cid=2', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('354', '8', '梁章勇', '', '18938391646', null, '推广到留言版的接口信息', null, null, '1523308089', '112.96.64.129', 'http://xjbys.66jiedai.cn/?cid=1', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('355', '8', '吴国庆', '', '15123419292', null, '推广到留言版的接口信息', null, null, '1523311447', '223.104.4.125', 'http://xjbys.66jiedai.cn/?cid=4', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('356', '8', '刘佳佳', '', '18362388750', null, '推广到留言版的接口信息', null, null, '1523315438', '223.104.145.89', 'http://xjbys.66jiedai.cn/?cid=4', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('357', '8', '杨进', '', '15132344411', null, '推广到留言版的接口信息', null, null, '1523317183', '111.225.178.129', 'http://xjbys.66jiedai.cn/?cid=1', '河北张家口', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('359', '9', '孙毅', '', '18601939835', null, '收货地址：北京市朝阳区保利嘉园一号院7号楼314', null, null, '1523324139', '101.254.236.232', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '北京北京', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('360', '8', '张勋靓', '', '18255399233', null, '推广到留言版的接口信息', null, null, '1523327645', '36.33.147.185', 'http://xjbys.66jiedai.cn/?cid=1', '安徽马鞍山', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('362', '8', '韩连春', '', '15715778874', null, '推广到留言版的接口信息', null, null, '1523338416', '218.205.55.234', 'http://xjbys.66jiedai.cn/?cid=1', '浙江杭州', '0', 'no', '备注');
INSERT INTO `sy_message` VALUES ('363', '9', '秦标', '', '15187423414', null, '收货地址：云南省曲靖市沾益区卓越明郡3栋3003', null, null, '1523338679', '182.240.97.220', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '云南曲靖', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('364', '9', '陈慈云', '', '15913859864', null, '收货地址：惠州市惠城区三栋镇莲塘新楼村兴华百货', null, null, '1523339022', '211.161.65.159', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '广东惠州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('365', '9', '李雪娇', '', '13009718596', null, '收货地址：黑龙江省哈尔滨市人和古玩城', null, null, '1523339172', '113.5.8.94', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '黑龙江哈尔滨', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('366', '9', '李雪娇', '', '13009718596', null, '收货地址：黑龙江省哈尔滨市人和古玩城负二层GS29号慧缘阁', null, null, '1523339340', '113.5.8.94', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '黑龙江哈尔滨', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('367', '9', '朱良友', '', '18299260511', null, '收货地址：霍城县公安局兰干乡警务站', null, null, '1523345352', '36.108.91.40', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '新疆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('368', '9', '朱良友', '', '18299260511', null, '收货地址：霍城县公安局兰干乡中心小学警务站', null, null, '1523345834', '49.117.231.45', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '新疆伊犁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('369', '9', '朱华强', '', '15558644422', null, '收货地址：浙江玉环市芦浦道头村深浦二街29号', null, null, '1523346246', '111.3.110.229', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江台州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('370', '9', '朱华强', '', '15558644422', null, '收货地址：浙江玉环市芦浦道头村深浦二街29号', null, null, '1523346313', '111.3.110.229', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江台州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('371', '9', '毛华', '', '18622044559', null, '收货地址：贵州省兴义市坪东镇洒金大道南兴社区9栋2单元1102号', null, null, '1523346507', '211.94.243.226', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '天津天津', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('372', '9', '毛华', '', '18622044559', null, '收货地址：贵州省兴义市坪东镇洒金大道南兴社区9栋2单元1102号', null, null, '1523346508', '211.94.243.226', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '天津天津', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('373', '9', '刘燕飞', '', '15973824561', null, '收货地址：湖南省娄底市双峰县迎宾路西艺富和园三栋二单元502', null, null, '1523346737', '223.157.14.243', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '湖南娄底', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('374', '9', '毛华', '', '18622044559', null, '收货地址：贵州省兴义市坪东镇洒金大道南兴社区9栋2单元1102号', null, null, '1523346998', '211.94.243.226', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '天津天津', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('375', '9', '沈吉', '', '15168334965', null, '收货地址：杭州市余杭区临平南苑街道南大街326号时代广场1号楼B座', null, null, '1523348531', '112.17.238.184', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('376', '9', '沈吉', '', '15168334965', null, '收货地址：杭州市余杭区临平南苑街道南大街326号时代广场1号楼B座', null, null, '1523348580', '112.17.238.184', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '浙江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('377', '9', '曹泽奇', '', '15953647933', null, '收货地址：山东潍坊寿光菜都路西城大厦509', null, null, '1523348633', '223.104.188.84', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('378', '9', '曹泽奇', '', '15953647933', null, '收货地址：山东寿光菜都路西城大厦509', null, null, '1523348797', '223.104.188.84', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('379', '9', '李大民', '', '13483231230', null, '收货地址：河北省保定市高碑店新城达子营村', null, null, '1523350279', '117.136.2.189', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '河北保定', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('380', '9', '李大民', '', '13483231230', null, '收货地址：河北省保定市高碑店市新城达子营', null, null, '1523350330', '117.136.2.189', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '河北保定', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('381', '9', '前进·马斯肯', '', '15099313586', null, '收货地址：新疆乌鲁木齐市天山区南门国际置地E1座一单元202', null, null, '1523351210', '124.117.91.239', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '新疆乌鲁木齐', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('382', '9', '前进·马斯肯', '', '15099313583', null, '收货地址：新疆乌鲁木齐市天山区南门国际置地E1座一单元202', null, null, '1523351276', '124.117.91.239', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '新疆乌鲁木齐', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('383', '9', '前进马斯肯', '', '15099313583', null, '收货地址：新疆乌鲁木齐市天山区南门国际置地E1座一单元202', null, null, '1523351501', '124.117.91.239', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '新疆乌鲁木齐', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('384', '8', '郭小杰', '', '15817409433', null, '推广到留言版的接口信息', null, null, '1523357204', '117.136.79.116', 'http://book.biksc.com/', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('385', '8', '董清', '', '15106108523', null, '推广到留言版的接口信息', null, null, '1523377028', '36.149.97.42', 'http://xjbys.66jiedai.cn/?cid=3', '江苏镇江', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('386', '8', '梁彬', '', '15182636505', null, '推广到留言版的接口信息', null, null, '1523377081', '117.136.64.105', 'http://xjbys.66jiedai.cn/?cid=1', '四川', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('387', '8', '郭大勇', '', '17386827490', null, '推广到留言版的接口信息', null, null, '1523377373', '124.235.137.68', 'http://xjbys.66jiedai.cn/?cid=3', '吉林长春', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('388', '8', '利月香', '', '13878768038', null, '推广到留言版的接口信息', null, null, '1523377677', '175.51.254.237', 'http://xjbys.66jiedai.cn/?cid=1', '广西百色', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('389', '8', '潘瑜峰', '', '15960032288', null, '推广到留言版的接口信息', null, null, '1523378025', '120.32.54.5', 'http://xjbys.66jiedai.cn/?cid=3', '福建福州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('390', '8', '罗从义', '', '18378319257', null, '推广到留言版的接口信息', null, null, '1523378188', '125.73.192.161', 'http://xjbys.66jiedai.cn/?cid=1', '广西桂林', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('391', '8', '杨首', '', '18724995227', null, '推广到留言版的接口信息', null, null, '1523379336', '183.225.113.143', 'http://xjbys.66jiedai.cn/?cid=1', '云南楚雄', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('392', '8', '梁铭', '', '15878043854', null, '推广到留言版的接口信息', null, null, '1523379772', '116.11.159.97', 'http://xjbys.66jiedai.cn/?cid=3', '广西玉林', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('393', '8', '高伟荣', '', '15295000286', null, '推广到留言版的接口信息', null, null, '1523379896', '112.24.222.94', 'http://xjbys.66jiedai.cn/?cid=1', '江苏常州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('394', '8', '江五金', '', '18218585143', null, '推广到留言版的接口信息', null, null, '1523380360', '117.136.79.232', 'http://xjbys.66jiedai.cn/?cid=1', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('395', '8', '刘之兴', '', '13750201636', null, '推广到留言版的接口信息', null, null, '1523380535', '113.75.104.247', 'http://xjbys.66jiedai.cn/?cid=1', '广东河源', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('396', '8', '刘庆', '', '15739736967', null, '推广到留言版的接口信息', null, null, '1523380704', '223.104.30.202', 'http://xjbys.66jiedai.cn/?cid=4', '新疆', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('397', '8', '郭嵩', '', '18904013202', null, '推广到留言版的接口信息', null, null, '1523387933', '123.235.86.98', 'http://xjbys.66jiedai.cn/?cid=1', '山东青岛', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('398', '8', '冯燕玲', '', '13713784402', null, '推广到留言版的接口信息', null, null, '1523391911', '116.24.37.187', 'http://xjbys.66jiedai.cn/?cid=1', '广东深圳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('399', '8', '尹海英', '', '13519651547', null, '推广到留言版的接口信息', null, null, '1523396777', '171.13.214.62', 'http://xjbys.66jiedai.cn/?cid=1', '河南安阳', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('400', '8', '李彦瑞', '', '13363538366', null, '推广到留言版的接口信息', null, null, '1523397016', '1.68.39.160', 'http://xjbys.66jiedai.cn/?cid=1', '山西', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('401', '8', '许烽', '', '15171348981', null, '推广到留言版的接口信息', null, null, '1523397854', '117.136.52.97', 'http://xjbys.66jiedai.cn/?cid=1', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('402', '8', '潘海建', '', '18018077813', null, '推广到留言版的接口信息', null, null, '1523398678', '49.90.154.14', 'http://xjbys.66jiedai.cn/?cid=1', '江苏南京', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('403', '8', '袁慎雨', '', '15897788306', null, '推广到留言版的接口信息', null, null, '1523399075', '223.104.20.86', 'http://xjbys.66jiedai.cn/?cid=1', '湖北', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('404', '8', '宋红水', '', '15271269470', null, '推广到留言版的接口信息', null, null, '1523399377', '171.114.130.253', 'http://xjbys.66jiedai.cn/?cid=1', '湖北咸宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('405', '8', '王华', '', '15842113650', null, '推广到留言版的接口信息', null, null, '1523401515', '223.104.175.174', 'http://xjbys.66jiedai.cn/?cid=1', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('406', '8', '王明', '', '13834259502', null, '推广到留言版的接口信息', null, null, '1523402441', '110.178.115.102', 'http://xjbys.66jiedai.cn/?cid=1', '山西太原', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('407', '8', '丁晓岩', '', '13115311816', null, '推广到留言版的接口信息', null, null, '1523402622', '112.102.254.69', 'http://xjbys.66jiedai.cn/?cid=1', '黑龙江哈尔滨', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('408', '8', '丁士兀', '', '15902744434', null, '推广到留言版的接口信息', null, null, '1523404613', '27.17.101.78', 'http://xjbys.66jiedai.cn/?cid=1', '湖北武汉', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('409', '8', '洪早彬', '', '18058805816', null, '推广到留言版的接口信息', null, null, '1523405262', '183.158.123.209', 'http://xjbys.66jiedai.cn/?cid=2', '浙江杭州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('410', '8', '杨春良', '', '15061589130', null, '推广到留言版的接口信息', null, null, '1523406617', '223.104.4.108', 'http://xjbys.66jiedai.cn/?cid=1', '江苏', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('411', '8', '刘西庆', '', '18763261680', null, '推广到留言版的接口信息', null, null, '1523406801', '112.248.238.148', 'http://xjbys.66jiedai.cn/?cid=4', '山东枣庄', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('412', '9', '勇', '', '13437846334', null, '收货地址：广东省广州市白云区国际单位666', null, null, '1523410151', '119.129.226.23', 'file:///C:/Users/Administrator/Desktop/watch_ld/index.html', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('413', '9', '勇2', '', '13437846334', null, '收货地址：北京市北京市市辖区通州区123', null, null, '1523410190', '119.129.226.23', 'file:///C:/Users/Administrator/Desktop/watch_ld/index.html', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('414', '8', '郭素英', '', '13835601222', null, '推广到留言版的接口信息', null, null, '1523410196', '183.202.193.130', 'http://xjbys.66jiedai.cn/?cid=4', '山西晋城', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('415', '9', '勇3', '', '13437846334', null, '收货地址：吉林省松原市长岭县123123', null, null, '1523410245', '119.129.226.23', 'file:///C:/Users/Administrator/Desktop/watch_ld/index.html', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('416', '9', '123', '', '13437846334', null, '收货地址：浙江省衢州市开化县123456789', null, null, '1523410472', '119.129.226.23', 'file:///C:/Users/Administrator/Desktop/watch_ld/index.html', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('417', '8', '王红梅', '', '13668161759', null, '推广到留言版的接口信息', null, null, '1523410498', '117.175.131.132', 'http://xjbys.66jiedai.cn/?cid=1', '四川成都', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('418', '9', '勇11', '', '13437846334', null, '收货地址：广东省广州市白云区国际单位测试', null, null, '1523410685', '119.129.226.23', 'http://xihuan.biksc.com/', '广东广州', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('419', '9', '技术测试', '', '13087946666', null, '收货地址：广东省江门市恩平市1234技术测试', null, null, '1523411757', '223.104.1.241', 'http://xihuan.biksc.com/', '广东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('420', '9', '李红梅', '', '13845224558', null, '收货地址：黑龙江省齐齐哈尔市克东县克东县保安街圣水路18号财政局', null, null, '1523411810', '221.209.49.110', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '黑龙江齐齐哈尔', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('421', '9', '李红梅', '', '13845224558', null, '收货地址：黑龙江省齐齐哈尔市克东县克东县保安街圣水路18号财政局', null, null, '1523411986', '221.209.49.110', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '黑龙江齐齐哈尔', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('422', '9', '倪阳义', '', '13841729722', null, '收货地址：辽宁省营口市大石桥市盛福今元4号楼三单元702', null, null, '1523412144', '223.104.177.6', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '辽宁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('423', '9', '卫京涛', '', '13969119907', null, '收货地址：山东省济南市长清区常春藤小区', null, null, '1523413144', '223.104.186.42', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('424', '8', '李苗', '', '15939287169', null, '推广到留言版的接口信息', null, null, '1523413166', '42.239.192.59', 'http://xjbys.66jiedai.cn/?cid=1', '河南鹤壁', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('425', '9', '卫京涛', '', '13969119907', null, '收货地址：山东省济南市长清区常春藤小区', null, null, '1523413291', '223.104.186.42', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '山东', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('426', '9', '肖学贤', '', '15200432537', null, '收货地址：湖南省株洲市荷塘区新华东路96号', null, null, '1523413910', '117.136.89.73', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '湖南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('427', '9', '肖学贤', '', '15200432537', null, '收货地址：湖南省株洲市荷塘区新华东路96只', null, null, '1523414052', '117.136.89.73', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '湖南', '0', 'no', '');
INSERT INTO `sy_message` VALUES ('428', '9', '周小波', '', '18194260565', null, '收货地址：甘肃省兰州市城关区红星紫郡城8单元1706', null, null, '1523415526', '117.136.27.112', 'http://xihuan.biksc.com/?from=singlemessage&isappinstalled=0', '甘肃', '0', 'no', '');

-- ----------------------------
-- Table structure for sy_voteip
-- ----------------------------
DROP TABLE IF EXISTS `sy_voteip`;
CREATE TABLE `sy_voteip` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mid` int(8) NOT NULL COMMENT '留言ID',
  `ip` varchar(15) NOT NULL COMMENT '赞一下IP',
  `addtime` varchar(13) NOT NULL COMMENT '赞一下时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sy_voteip
-- ----------------------------
