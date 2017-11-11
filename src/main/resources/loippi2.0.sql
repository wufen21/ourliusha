/*
Navicat MySQL Data Transfer

Source Server         : 139.199.175.39中艺
Source Server Version : 50538
Source Host           : 139.199.175.39:3306
Source Database       : loippi2.0

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2017-04-28 10:46:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_api_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_api_category`;
CREATE TABLE `t_api_category` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(50) NOT NULL COMMENT '中文名称',
  `MODULE_NAME` varchar(50) DEFAULT NULL COMMENT '模块名称',
  `UUID` varchar(100) DEFAULT NULL COMMENT 'UUID标识',
  `SORTS` int(11) DEFAULT NULL COMMENT '排序',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='接口分类';

-- ----------------------------
-- Records of t_api_category
-- ----------------------------
INSERT INTO `t_api_category` VALUES ('1', '公共模块', 'Common', 'c92df75b-edb0-42ed-8b25-a4a14739b1e7', '1', '系统API公共模块: 发送短信/版本检测/用户反馈/广告列表/地区信息', '2016-04-27 13:59:19', 'fa fa-inbox ');
INSERT INTO `t_api_category` VALUES ('2', '个人中心', 'Person', '6edea197-9f7c-46e5-9ca7-0940cbd5fe39\r\n', '2', '用户个人资料模块', '2016-04-27 14:00:03', 'fa fa-certificate');
INSERT INTO `t_api_category` VALUES ('3', '商品信息', 'Product', '38230e46-02f0-4046-90ee-777678e61174\r\n', '3', '商城产品信息', '2016-04-27 14:01:06', 'fa fa-file-text-o');

-- ----------------------------
-- Table structure for `t_api_interfacer`
-- ----------------------------
DROP TABLE IF EXISTS `t_api_interfacer`;
CREATE TABLE `t_api_interfacer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `METHOD` varchar(20) NOT NULL DEFAULT 'POST' COMMENT '请求方式',
  `URL` varchar(255) NOT NULL COMMENT '接口地址',
  `UUID` varchar(255) NOT NULL COMMENT 'UUID',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类',
  `CODES` text COMMENT '代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='接口';

-- ----------------------------
-- Records of t_api_interfacer
-- ----------------------------
INSERT INTO `t_api_interfacer` VALUES ('1', '发送短信', 'POST', '/api/common/msg.json', '953209ab-1c83-4325-b50b-7b38de0844b3', '调用第三方发送短信验证码', '2016-04-27 14:32:20', '2016-05-13 11:59:41', '1', '// 操作成功\r\n{\r\n	\"code\":\"1\",\r\n    \"message\":\"操作成功\"\r\n}\r\n\r\n// 操作失败\r\n{\r\n	\"code\":\"0\",\r\n    \"message\":\"操作失败\"\r\n}\r\n\r\n\r\n// 其他操作 TODO');
INSERT INTO `t_api_interfacer` VALUES ('2', '版本检测', 'POST', '/api/common/version.json', 'a4a6b560-83f6-4ea1-bb3e-e4cd30256f4e', '安智APP版本检测更新', '2016-04-27 14:33:31', '2016-04-27 14:33:33', '1', null);
INSERT INTO `t_api_interfacer` VALUES ('3', '用户反馈', 'POST', '/api/common/feedback.json', '3fda7df3-4412-4504-bc48-ad26496fee3c', 'APP意见反馈收集接口', '2016-04-27 14:34:30', '2016-04-27 14:34:31', '1', null);
INSERT INTO `t_api_interfacer` VALUES ('4', '广告列表', 'POST', '/api/common/advertise.json', 'dade153d-08ae-4795-a2f9-20964d7442c9', '首页广告Banner', '2016-04-27 14:35:29', '2016-04-27 14:35:31', '1', null);
INSERT INTO `t_api_interfacer` VALUES ('5', '地区信息', 'POST', '/api/common/area.json', 'a53c7c9f-f44b-4e50-a13b-7583fc868807', '获取系统地区信息XML文件', '2016-04-27 14:40:39', '2016-04-27 14:40:41', '1', null);

-- ----------------------------
-- Table structure for `t_api_parameters`
-- ----------------------------
DROP TABLE IF EXISTS `t_api_parameters`;
CREATE TABLE `t_api_parameters` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(100) NOT NULL COMMENT '参数名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '参数说明',
  `TYPE` varchar(100) NOT NULL COMMENT '参数类型',
  `INTERFACER_ID` bigint(20) NOT NULL COMMENT '关联接口',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='接口参数';

-- ----------------------------
-- Records of t_api_parameters
-- ----------------------------
INSERT INTO `t_api_parameters` VALUES ('2', 'version', '版本号', 'String', '2');
INSERT INTO `t_api_parameters` VALUES ('3', 'device', '设备类型:IOS、ANDROID', 'String', '2');
INSERT INTO `t_api_parameters` VALUES ('10', 'mobile', '手机号', 'String', '1');

-- ----------------------------
-- Table structure for `t_api_results`
-- ----------------------------
DROP TABLE IF EXISTS `t_api_results`;
CREATE TABLE `t_api_results` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(100) NOT NULL COMMENT '名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '说明',
  `TYPE` varchar(100) NOT NULL COMMENT '类型',
  `INTERFACER_ID` bigint(20) NOT NULL COMMENT '关联接口',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级返回值编号',
  `DEBUG_VALUES` varchar(255) DEFAULT NULL COMMENT '测试值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='返回值';

-- ----------------------------
-- Records of t_api_results
-- ----------------------------
INSERT INTO `t_api_results` VALUES ('7', 'mobile', '手机号', 'String', '1', null, '3');

-- ----------------------------
-- Table structure for `t_gen_scheme`
-- ----------------------------
DROP TABLE IF EXISTS `t_gen_scheme`;
CREATE TABLE `t_gen_scheme` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '修改者',
  `STRATEGY` varchar(255) DEFAULT NULL COMMENT '生成策略',
  `SCHEME_NAME` varchar(255) DEFAULT NULL COMMENT '方案名称',
  `SCHEME_TEMPLATE` varchar(255) DEFAULT NULL COMMENT '方案模版',
  `PACKAGE_NAME` varchar(255) DEFAULT NULL COMMENT '包名',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `AUTHOR` varchar(255) DEFAULT NULL COMMENT '作者',
  `GEN_TABLE_ID` bigint(20) DEFAULT NULL COMMENT '关联表',
  `MODULE_NAME` varchar(20) DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

-- ----------------------------
-- Records of t_gen_scheme
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `t_gen_table`;
CREATE TABLE `t_gen_table` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '修改者',
  `TABLE_NAME` varchar(100) NOT NULL COMMENT '表名',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `CLASS_NAME` varchar(100) NOT NULL COMMENT '对应Java类名',
  `PARENT_TABLE` varchar(100) DEFAULT NULL COMMENT '父级表',
  `PARENT_TABLE_FK` varchar(100) DEFAULT NULL COMMENT '外键关联字段',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Records of t_gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `t_gen_table_column`;
CREATE TABLE `t_gen_table_column` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '修改者',
  `GEN_TABLE_ID` bigint(20) DEFAULT NULL COMMENT '表名称',
  `NAME` varchar(100) DEFAULT NULL COMMENT '列名',
  `COMMENTS` varchar(255) DEFAULT NULL COMMENT '列说明',
  `JDBC_TYPE` varchar(255) DEFAULT NULL COMMENT 'JDBC类型',
  `MYBATIS_JDBC_TYPE` varchar(255) DEFAULT NULL COMMENT 'Mybatis对应类型',
  `JAVA_TYPE` varchar(255) DEFAULT NULL COMMENT 'Java类型',
  `JAVA_FIELD` varchar(255) DEFAULT NULL COMMENT 'Java字段',
  `IS_PK` int(1) DEFAULT '0' COMMENT '是否为主键',
  `IS_NULL` int(1) DEFAULT '0' COMMENT '是否为空',
  `IS_INSERT` int(1) DEFAULT '0' COMMENT '可插入',
  `IS_EDIT` int(1) DEFAULT '0' COMMENT '可修改',
  `IS_LIST` int(1) DEFAULT '0' COMMENT '列表',
  `IS_QUERY` int(1) DEFAULT '0' COMMENT '查询',
  `QUERY_TYPE` varchar(255) DEFAULT NULL COMMENT '查询类型',
  `SHOW_TYPE` varchar(255) DEFAULT NULL COMMENT '显示类型',
  `SORTS` int(11) DEFAULT '0' COMMENT '排序',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表字段';

-- ----------------------------
-- Records of t_gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_consulation`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_consulation`;
CREATE TABLE `t_shop_consulation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `CONTENT` varchar(255) NOT NULL COMMENT '咨询内容',
  `IP` varchar(255) NOT NULL COMMENT '用户IP',
  `IS_SHOW` int(1) NOT NULL COMMENT '是否显示',
  `REPLY` bigint(20) DEFAULT NULL COMMENT '回复',
  `GOODS` bigint(20) NOT NULL COMMENT '货品',
  `MEMBER` bigint(20) DEFAULT NULL COMMENT '会员',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品咨询';

-- ----------------------------
-- Records of t_shop_consulation
-- ----------------------------
INSERT INTO `t_shop_consulation` VALUES ('1', '2016-06-06 14:57:34', '2016-06-06 14:57:36', '好用吗', '127.0.0.1', '1', '222223333', '1', '1');

-- ----------------------------
-- Table structure for `t_shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_goods`;
CREATE TABLE `t_shop_goods` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `NAME` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `FULL_NAME` varchar(255) DEFAULT NULL COMMENT '产品全称',
  `UNIT` varchar(20) DEFAULT NULL COMMENT '单位',
  `WEIGHT` int(11) DEFAULT NULL COMMENT '重量',
  `MARKETABLE` int(1) unsigned DEFAULT NULL COMMENT '是否上架',
  `PRICE` decimal(21,6) unsigned DEFAULT NULL COMMENT '价格',
  `COST` decimal(21,6) DEFAULT NULL COMMENT '成本',
  `MARKET_PRICE` decimal(21,6) DEFAULT NULL COMMENT '市场价',
  `SN` varchar(255) DEFAULT NULL COMMENT '货号',
  `SALES` int(11) DEFAULT NULL COMMENT '售出',
  `STOCK` int(11) unsigned DEFAULT NULL COMMENT '库存',
  `PRODUCT_CATEGORY` bigint(20) unsigned DEFAULT NULL COMMENT '产品分类',
  `IMAGE` varchar(255) DEFAULT NULL COMMENT '图片',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `INTRODUCTION` longtext COMMENT '介绍',
  `SPECIFICATION_ITEMS` longtext COMMENT '规格属性',
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '搜索关键字',
  `PARAMETER_VALUES` longtext COMMENT '参数',
  `PRODUCT_IMAGES` longtext COMMENT '产品图片',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货品';

-- ----------------------------
-- Records of t_shop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order`;
CREATE TABLE `t_shop_order` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `AMOUNT` decimal(21,6) NOT NULL COMMENT '订单金额',
  `AREA_NAME` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `CONSIGNEE` varchar(255) DEFAULT NULL COMMENT '收货人',
  `NEED_INVOICE` int(11) DEFAULT '0' COMMENT '是否需要发票',
  `INVOICE_TITLE` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `PAYMENT_METHOD_NAME` varchar(255) DEFAULT NULL COMMENT '支付方式名称',
  `PAYMENT_METHOD_TYPE` int(11) DEFAULT NULL COMMENT '支付类型',
  `PHONE` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `QUANTITY` int(11) NOT NULL COMMENT '商品数量',
  `SN` varchar(255) NOT NULL COMMENT '订单序号',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `WEIGHT` int(11) NOT NULL COMMENT '商品重量',
  `ZIP_CODE` varchar(255) DEFAULT NULL COMMENT '邮编',
  `AREA_ID` bigint(20) DEFAULT NULL COMMENT '地区编号',
  `MEMBER_ID` bigint(20) NOT NULL COMMENT '会员',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of t_shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_item`;
CREATE TABLE `t_shop_order_item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `NAME` varchar(255) DEFAULT NULL COMMENT '产品',
  `PRICE` decimal(21,6) NOT NULL COMMENT '金额',
  `QUANTITY` int(11) NOT NULL COMMENT '商品数量',
  `SN` varchar(255) NOT NULL COMMENT '订单序号',
  `SPECIFICATIONS` longtext COMMENT '产品规格',
  `WEIGHT` int(11) NOT NULL COMMENT '商品重量',
  `ORDER_ID` bigint(20) NOT NULL COMMENT '订单编号',
  `PRODUCT_ID` bigint(20) NOT NULL COMMENT '产品编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单项目';

-- ----------------------------
-- Records of t_shop_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_order_log`;
CREATE TABLE `t_shop_order_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '日志内容',
  `TYPE` int(11) NOT NULL COMMENT '日志类型',
  `ORDER_ID` bigint(20) NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单日志';

-- ----------------------------
-- Records of t_shop_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_parameter`;
CREATE TABLE `t_shop_parameter` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `SORTS` int(11) DEFAULT NULL COMMENT '排序',
  `PARAMETER_GROUP` varchar(255) NOT NULL COMMENT '参数组名',
  `NAMES` longtext NOT NULL COMMENT '参数',
  `PRODUCT_CATEGORY` bigint(20) NOT NULL COMMENT '产品分类',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参数';

-- ----------------------------
-- Records of t_shop_parameter
-- ----------------------------
INSERT INTO `t_shop_parameter` VALUES ('1', '2016-06-06 10:33:10', '2016-06-06 10:33:10', '1', '111111', '[\"111\",\"222\"]', '2');
INSERT INTO `t_shop_parameter` VALUES ('4', '2016-06-06 10:53:56', '2016-06-06 10:53:56', '2', '222222', '[\"材质\",\"某某某\",\"叉叉叉\"]', '2');

-- ----------------------------
-- Table structure for `t_shop_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_product`;
CREATE TABLE `t_shop_product` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `PRICE` decimal(21,6) NOT NULL COMMENT '价格',
  `COST` decimal(21,6) DEFAULT NULL COMMENT '成本',
  `MARKET_PRICE` decimal(21,6) DEFAULT NULL COMMENT '市场价',
  `SN` varchar(255) NOT NULL COMMENT '货号',
  `STOCK` int(11) NOT NULL COMMENT '库存',
  `GOODS` bigint(20) NOT NULL COMMENT '所属货品',
  `SPECIFICATION_VALUES` longtext COMMENT '规格属性',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of t_shop_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_product_category`;
CREATE TABLE `t_shop_product_category` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `SORTS` int(11) DEFAULT NULL COMMENT '排序',
  `GRADE` int(11) NOT NULL COMMENT '等级',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `TREE_PATH` varchar(255) NOT NULL COMMENT '树路径',
  `PARENT` bigint(20) DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品分类';

-- ----------------------------
-- Records of t_shop_product_category
-- ----------------------------
INSERT INTO `t_shop_product_category` VALUES ('1', '2016-06-03 15:46:21', '2016-06-03 15:46:23', '1', '0', '手机', ',', null);
INSERT INTO `t_shop_product_category` VALUES ('2', '2016-06-03 16:39:14', '2016-06-03 16:39:16', '2', '1', '安卓', ',1,', '1');
INSERT INTO `t_shop_product_category` VALUES ('3', '2016-06-03 16:39:50', '2016-06-03 16:39:51', '3', '1', '苹果', ',1,', '1');

-- ----------------------------
-- Table structure for `t_shop_review`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_review`;
CREATE TABLE `t_shop_review` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `CONTENT` varchar(255) NOT NULL COMMENT '咨询内容',
  `IP` varchar(255) NOT NULL COMMENT '用户IP',
  `IS_SHOW` bit(1) NOT NULL COMMENT '是否显示',
  `SCORE` int(11) NOT NULL COMMENT '评分',
  `GOODS` bigint(20) NOT NULL COMMENT '货品',
  `REVIEW_IMAGES` longtext COMMENT '晒图',
  `MEMBER` bigint(20) DEFAULT NULL COMMENT '会员',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评论';

-- ----------------------------
-- Records of t_shop_review
-- ----------------------------

-- ----------------------------
-- Table structure for `t_shop_specification`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_specification`;
CREATE TABLE `t_shop_specification` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `SORTS` int(11) DEFAULT NULL COMMENT '排序',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `OPTIONS` longtext NOT NULL COMMENT '规格项',
  `PRODUCT_CATEGORY` bigint(20) NOT NULL COMMENT '分类',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='规格';

-- ----------------------------
-- Records of t_shop_specification
-- ----------------------------
INSERT INTO `t_shop_specification` VALUES ('5', '2016-06-06 14:50:26', '2016-06-06 14:50:26', '1', '颜色', '[\"黄色\",\"黑色\",\"白色\",\"酒红色\"]', '2');
INSERT INTO `t_shop_specification` VALUES ('6', '2016-06-06 14:50:26', '2016-06-07 17:08:41', '1', '容量', '[\"16G\",\"32G\",\"64G\"]', '0');

-- ----------------------------
-- Table structure for `t_system_acl`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_acl`;
CREATE TABLE `t_system_acl` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `URL` varchar(255) DEFAULT '' COMMENT 'URL',
  `ACL_NAME` varchar(255) NOT NULL COMMENT '资源名称',
  `ACL_TYPE` int(11) NOT NULL COMMENT '资源类型',
  `PERMISSION` varchar(255) NOT NULL COMMENT '权限标识',
  `ICON` varchar(255) DEFAULT NULL COMMENT '图标',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级编号',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '修改者',
  `SORTS` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of t_system_acl
-- ----------------------------
INSERT INTO `t_system_acl` VALUES ('1', '2015-10-28 12:10:09', 'javascript:;', '系统管理', '0', 'admin:system:main', 'fa fa-skyatlas', null, null, '1', null, '200');
INSERT INTO `t_system_acl` VALUES ('2', '2015-10-28 12:10:09', '/admin/setting/edit.jhtml', '系统设置', '1', 'admin:system:setting', null, '1', null, '1', null, '210');
INSERT INTO `t_system_acl` VALUES ('3', '2015-10-28 12:10:09', '/admin/acl/list.jhtml', '资源管理', '1', 'admin:system:acl', null, '1', null, '1', null, '220');
INSERT INTO `t_system_acl` VALUES ('4', '2015-10-28 12:10:09', '/admin/role/list.jhtml', '角色权限', '1', 'admin:system:role', null, '1', null, '1', null, '230');
INSERT INTO `t_system_acl` VALUES ('5', '2015-10-28 12:10:09', '/admin/user/list.jhtml', '管理员', '1', 'admin:system:user', null, '1', null, '1', null, '240');
INSERT INTO `t_system_acl` VALUES ('6', '2015-10-28 12:10:09', '/admin/log/list.jhtml', '日志管理', '1', 'admin:system:log', null, '1', null, '1', null, '250');
INSERT INTO `t_system_acl` VALUES ('7', '2015-10-28 12:10:09', '/druid/index.html', '数据监控', '1', 'admin:system:druid', null, '1', null, '1', null, '260');
INSERT INTO `t_system_acl` VALUES ('8', '2015-10-28 12:10:09', 'javascript:;', '开发管理', '0', 'admin:gen:main', 'fa fa-ge', null, null, '1', null, '300');
INSERT INTO `t_system_acl` VALUES ('9', '2015-10-28 12:10:09', '/admin/gen_table/list.jhtml', '业务表', '1', 'admin:gen:table', null, '8', null, '1', null, '310');
INSERT INTO `t_system_acl` VALUES ('11', '2015-10-28 12:10:09', '/admin/gen_scheme/list.jhtml', '生成方案', '1', 'admin:gen:scheme', null, '8', null, '1', null, '330');
INSERT INTO `t_system_acl` VALUES ('12', '2015-10-28 12:10:09', '/admin/common/dic.jhtml', '数据字典', '1', 'admin:system:datadic', null, '8', null, '1', null, '340');
INSERT INTO `t_system_acl` VALUES ('15', '2015-10-28 12:10:09', '/resources/index.html', '前端框架', '0', 'admin:system:ui', null, '8', null, '1', null, '350');
INSERT INTO `t_system_acl` VALUES ('16', '2016-04-19 15:04:33', 'javascript:;', '内容管理', '0', 'admin:content:main', 'fa fa-send-o', null, null, '1', null, '100');
INSERT INTO `t_system_acl` VALUES ('17', '2016-04-19 15:05:40', '/admin/article/list.jhtml', '文章管理', '1', 'admin:article:list', null, '16', null, '1', null, '101');
INSERT INTO `t_system_acl` VALUES ('18', '2016-04-19 15:06:39', '/admin/article_category/list.jhtml', '文章分类', '1', 'admin:artile_category:list', null, '16', null, '1', null, '102');
INSERT INTO `t_system_acl` VALUES ('19', '2016-04-19 15:07:37', '/admin/app/list.jhtml', '应用版本', '1', 'admin:app:list', null, '16', null, '1', null, '103');
INSERT INTO `t_system_acl` VALUES ('20', '2016-04-19 15:08:04', '/admin/feedback/list.jhtml', '意见反馈', '0', 'admin:feedback:list', null, '16', null, '1', null, '104');
INSERT INTO `t_system_acl` VALUES ('21', '2016-04-19 15:17:03', 'javascript:;', '插件管理', '0', 'admin:plugins:main', 'fa fa-laptop', null, null, '1', null, '180');
INSERT INTO `t_system_acl` VALUES ('24', '2016-04-19 15:22:40', '/admin/sms_plugin/list.jhtml', '短信插件', '1', 'admin:plugins:msg', null, '21', null, '1', null, '183');
INSERT INTO `t_system_acl` VALUES ('25', '2016-04-19 15:23:46', '/admin/storage_plugin/list.jhtml', '存储插件', '1', 'admin:plugins:storage', null, '21', null, '1', null, '184');
INSERT INTO `t_system_acl` VALUES ('26', '2016-04-19 15:25:33', '/admin/mobile_payment_plugin/list.jhtml', 'APP支付插件', '1', 'admin:plugins:app_pay_plugin', null, '21', null, '1', null, '188');
INSERT INTO `t_system_acl` VALUES ('27', '2016-04-19 15:26:36', '/admin/push_plugin/list.jhtml', '推送插件', '1', 'admin:plugins:push_plugin', null, '21', null, '1', null, '186');
INSERT INTO `t_system_acl` VALUES ('28', '2016-04-19 15:28:05', '/admin/payment_plugin/list.jhtml', '网页支付', '1', 'admin:plugins:payment_plugin', null, '21', null, '1', null, '187');
INSERT INTO `t_system_acl` VALUES ('29', '2016-04-19 15:36:33', '/admin/wap_pay_plugin/index.jhtml', 'Wap支付插件', '1', 'admin:plugins:wap_pay_plugin', null, '21', null, '1', null, '189');
INSERT INTO `t_system_acl` VALUES ('30', '2016-04-19 15:36:33', '/admin/api/index.jhtml', '接口管理', '1', 'admin:api:main', null, '8', null, '1', null, '360');
INSERT INTO `t_system_acl` VALUES ('31', '2016-04-19 15:36:33', '/admin/echarts/index.jhtml', '图表示例', '1', 'admin:echarts:main', null, '8', null, '1', null, '370');
INSERT INTO `t_system_acl` VALUES ('32', '2016-06-03 13:44:40', 'javascript:;', '商品管理', '0', 'admin:shop:main', 'fa fa-jsfiddle', null, null, '1', null, '90');
INSERT INTO `t_system_acl` VALUES ('33', '2016-06-03 13:45:36', '/admin/goods/list.jhtml', '商品管理', '1', 'admin:shop:goods', null, '32', null, '1', null, '91');
INSERT INTO `t_system_acl` VALUES ('34', '2016-06-03 13:46:15', '/admin/product_category/list.jhtml', '商品分类', '1', 'admin:shop:product_category', null, '32', null, '1', null, '92');
INSERT INTO `t_system_acl` VALUES ('35', '2016-06-03 13:46:59', '/admin/parameter/list.jhtml', '商品参数', '1', 'admin:shop:parameter', null, '32', null, '1', null, '93');
INSERT INTO `t_system_acl` VALUES ('36', '2016-06-03 13:47:59', '/admin/specification/list.jhtml', '商品规格', '1', 'admin:shop:specification', null, '32', null, '1', null, '94');
INSERT INTO `t_system_acl` VALUES ('37', '2016-06-03 13:49:31', '/admin/consulation/list.jhtml', '商品咨询', '1', 'admin:shop:consulation', null, '32', null, '1', null, '95');
INSERT INTO `t_system_acl` VALUES ('38', '2016-06-03 13:50:13', '/admin/review/list.jhtml', '商品评论', '1', 'admin:shop:review', null, '32', null, '1', null, '96');
INSERT INTO `t_system_acl` VALUES ('39', '2016-04-19 15:36:33', '/admin/webim/login.jhtml', '环信在线', '1', 'admin:webim:main', null, '8', null, '1', null, '380');

-- ----------------------------
-- Table structure for `t_system_ad`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_ad`;
CREATE TABLE `t_system_ad` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `SORTS` int(11) DEFAULT '0' COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL COMMENT '连接',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `START_DATE` datetime DEFAULT NULL COMMENT '开始时间',
  `END_DATE` datetime DEFAULT NULL COMMENT '结束时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `IMAGE` varchar(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of t_system_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_app`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_app`;
CREATE TABLE `t_system_app` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  `DEVICE` int(20) DEFAULT NULL COMMENT '设备：IOS 1   Android 2',
  `VERSION` varchar(20) DEFAULT NULL COMMENT '版本号',
  `CONTENT` varchar(200) DEFAULT NULL COMMENT '升级内容',
  `URL` varchar(200) DEFAULT NULL COMMENT '地址',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '更新者',
  `IS_FORCE` bit(1) DEFAULT NULL COMMENT '强制升级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of t_system_app
-- ----------------------------
INSERT INTO `t_system_app` VALUES ('1', '2016-04-19 15:11:39', '2016-04-19 15:11:39', '0', '1.0', 'DEMO', null, '1', null);
INSERT INTO `t_system_app` VALUES ('2', '2016-04-19 15:11:39', '2016-04-19 15:11:39', '1', '1.0', 'DEMO', null, '1', null);

-- ----------------------------
-- Table structure for `t_system_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_area`;
CREATE TABLE `t_system_area` (
  `ID` bigint(20) NOT NULL COMMENT '编号',
  `TREE_PATH` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '树路径',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `NAME` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `FULL_NAME` varchar(100) DEFAULT NULL COMMENT '地区全称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of t_system_area
-- ----------------------------
INSERT INTO `t_system_area` VALUES ('110100', ',', null, '2016-01-25 14:31:00', '北京市', '北京市');
INSERT INTO `t_system_area` VALUES ('110101', ',110100,', '110100', '2016-01-25 14:31:00', '东城区', '北京市东城区');
INSERT INTO `t_system_area` VALUES ('110102', ',110100,', '110100', '2016-01-25 14:31:00', '西城区', '北京市西城区');
INSERT INTO `t_system_area` VALUES ('110103', ',110100,', '110100', '2016-01-25 14:31:00', '崇文区', '北京市崇文区');
INSERT INTO `t_system_area` VALUES ('110104', ',110100,', '110100', '2016-01-25 14:31:00', '宣武区', '北京市宣武区');
INSERT INTO `t_system_area` VALUES ('110105', ',110100,', '110100', '2016-01-25 14:31:00', '朝阳区', '北京市朝阳区');
INSERT INTO `t_system_area` VALUES ('110106', ',110100,', '110100', '2016-01-25 14:31:00', '丰台区', '北京市丰台区');
INSERT INTO `t_system_area` VALUES ('110107', ',110100,', '110100', '2016-01-25 14:31:00', '石景山区', '北京市石景山区');
INSERT INTO `t_system_area` VALUES ('110108', ',110100,', '110100', '2016-01-25 14:31:00', '海淀区', '北京市海淀区');
INSERT INTO `t_system_area` VALUES ('110109', ',110100,', '110100', '2016-01-25 14:31:00', '门头沟区', '北京市门头沟区');
INSERT INTO `t_system_area` VALUES ('110111', ',110100,', '110100', '2016-01-25 14:31:00', '房山区', '北京市房山区');
INSERT INTO `t_system_area` VALUES ('110112', ',110100,', '110100', '2016-01-25 14:31:00', '通州区', '北京市通州区');
INSERT INTO `t_system_area` VALUES ('110113', ',110100,', '110100', '2016-01-25 14:31:01', '顺义区', '北京市顺义区');
INSERT INTO `t_system_area` VALUES ('110114', ',110100,', '110100', '2016-01-25 14:31:01', '昌平区', '北京市昌平区');
INSERT INTO `t_system_area` VALUES ('110115', ',110100,', '110100', '2016-01-25 14:31:01', '大兴区', '北京市大兴区');
INSERT INTO `t_system_area` VALUES ('110116', ',110100,', '110100', '2016-01-25 14:31:01', '怀柔区', '北京市怀柔区');
INSERT INTO `t_system_area` VALUES ('110117', ',110100,', '110100', '2016-01-25 14:31:01', '平谷区', '北京市平谷区');
INSERT INTO `t_system_area` VALUES ('110228', ',110100,', '110100', '2016-01-25 14:31:01', '密云县', '北京市密云县');
INSERT INTO `t_system_area` VALUES ('110229', ',110100,', '110100', '2016-01-25 14:31:01', '延庆县', '北京市延庆县');
INSERT INTO `t_system_area` VALUES ('110230', ',110100,', '110100', '2016-01-25 14:31:01', '其它区', '北京市其它区');
INSERT INTO `t_system_area` VALUES ('120100', ',', null, '2016-01-25 14:31:01', '天津市', '天津市');
INSERT INTO `t_system_area` VALUES ('120101', ',120100,', '120100', '2016-01-25 14:31:01', '和平区', '天津市和平区');
INSERT INTO `t_system_area` VALUES ('120102', ',120100,', '120100', '2016-01-25 14:31:01', '河东区', '天津市河东区');
INSERT INTO `t_system_area` VALUES ('120103', ',120100,', '120100', '2016-01-25 14:31:01', '河西区', '天津市河西区');
INSERT INTO `t_system_area` VALUES ('120104', ',120100,', '120100', '2016-01-25 14:31:01', '南开区', '天津市南开区');
INSERT INTO `t_system_area` VALUES ('120105', ',120100,', '120100', '2016-01-25 14:31:01', '河北区', '天津市河北区');
INSERT INTO `t_system_area` VALUES ('120106', ',120100,', '120100', '2016-01-25 14:31:01', '红桥区', '天津市红桥区');
INSERT INTO `t_system_area` VALUES ('120107', ',120100,', '120100', '2016-01-25 14:31:01', '塘沽区', '天津市塘沽区');
INSERT INTO `t_system_area` VALUES ('120108', ',120100,', '120100', '2016-01-25 14:31:01', '汉沽区', '天津市汉沽区');
INSERT INTO `t_system_area` VALUES ('120109', ',120100,', '120100', '2016-01-25 14:31:01', '大港区', '天津市大港区');
INSERT INTO `t_system_area` VALUES ('120110', ',120100,', '120100', '2016-01-25 14:31:01', '东丽区', '天津市东丽区');
INSERT INTO `t_system_area` VALUES ('120111', ',120100,', '120100', '2016-01-25 14:31:01', '西青区', '天津市西青区');
INSERT INTO `t_system_area` VALUES ('120112', ',120100,', '120100', '2016-01-25 14:31:01', '津南区', '天津市津南区');
INSERT INTO `t_system_area` VALUES ('120113', ',120100,', '120100', '2016-01-25 14:31:01', '北辰区', '天津市北辰区');
INSERT INTO `t_system_area` VALUES ('120114', ',120100,', '120100', '2016-01-25 14:31:01', '武清区', '天津市武清区');
INSERT INTO `t_system_area` VALUES ('120115', ',120100,', '120100', '2016-01-25 14:31:01', '宝坻区', '天津市宝坻区');
INSERT INTO `t_system_area` VALUES ('120116', ',120100,', '120100', '2016-01-25 14:31:01', '滨海新区', '天津市滨海新区');
INSERT INTO `t_system_area` VALUES ('120221', ',120100,', '120100', '2016-01-25 14:31:01', '宁河县', '天津市宁河县');
INSERT INTO `t_system_area` VALUES ('120223', ',120100,', '120100', '2016-01-25 14:31:01', '静海县', '天津市静海县');
INSERT INTO `t_system_area` VALUES ('120225', ',120100,', '120100', '2016-01-25 14:31:01', '蓟县', '天津市蓟县');
INSERT INTO `t_system_area` VALUES ('120226', ',120100,', '120100', '2016-01-25 14:31:01', '其它区', '天津市其它区');
INSERT INTO `t_system_area` VALUES ('130000', ',', null, '2016-01-25 14:31:02', '河北省', '河北省');
INSERT INTO `t_system_area` VALUES ('130100', ',130000,', '130000', '2016-01-25 14:31:02', '石家庄市', '河北省石家庄市');
INSERT INTO `t_system_area` VALUES ('130102', ',130000,130100,', '130100', '2016-01-25 14:31:02', '长安区', '河北省石家庄市长安区');
INSERT INTO `t_system_area` VALUES ('130103', ',130000,130100,', '130100', '2016-01-25 14:31:02', '桥东区', '河北省石家庄市桥东区');
INSERT INTO `t_system_area` VALUES ('130104', ',130000,130100,', '130100', '2016-01-25 14:31:02', '桥西区', '河北省石家庄市桥西区');
INSERT INTO `t_system_area` VALUES ('130105', ',130000,130100,', '130100', '2016-01-25 14:31:02', '新华区', '河北省石家庄市新华区');
INSERT INTO `t_system_area` VALUES ('130107', ',130000,130100,', '130100', '2016-01-25 14:31:02', '井陉矿区', '河北省石家庄市井陉矿区');
INSERT INTO `t_system_area` VALUES ('130108', ',130000,130100,', '130100', '2016-01-25 14:31:02', '裕华区', '河北省石家庄市裕华区');
INSERT INTO `t_system_area` VALUES ('130121', ',130000,130100,', '130100', '2016-01-25 14:31:02', '井陉县', '河北省石家庄市井陉县');
INSERT INTO `t_system_area` VALUES ('130123', ',130000,130100,', '130100', '2016-01-25 14:31:02', '正定县', '河北省石家庄市正定县');
INSERT INTO `t_system_area` VALUES ('130124', ',130000,130100,', '130100', '2016-01-25 14:31:02', '栾城县', '河北省石家庄市栾城县');
INSERT INTO `t_system_area` VALUES ('130125', ',130000,130100,', '130100', '2016-01-25 14:31:02', '行唐县', '河北省石家庄市行唐县');
INSERT INTO `t_system_area` VALUES ('130126', ',130000,130100,', '130100', '2016-01-25 14:31:02', '灵寿县', '河北省石家庄市灵寿县');
INSERT INTO `t_system_area` VALUES ('130127', ',130000,130100,', '130100', '2016-01-25 14:31:02', '高邑县', '河北省石家庄市高邑县');
INSERT INTO `t_system_area` VALUES ('130128', ',130000,130100,', '130100', '2016-01-25 14:31:02', '深泽县', '河北省石家庄市深泽县');
INSERT INTO `t_system_area` VALUES ('130129', ',130000,130100,', '130100', '2016-01-25 14:31:02', '赞皇县', '河北省石家庄市赞皇县');
INSERT INTO `t_system_area` VALUES ('130130', ',130000,130100,', '130100', '2016-01-25 14:31:02', '无极县', '河北省石家庄市无极县');
INSERT INTO `t_system_area` VALUES ('130131', ',130000,130100,', '130100', '2016-01-25 14:31:02', '平山县', '河北省石家庄市平山县');
INSERT INTO `t_system_area` VALUES ('130132', ',130000,130100,', '130100', '2016-01-25 14:31:02', '元氏县', '河北省石家庄市元氏县');
INSERT INTO `t_system_area` VALUES ('130133', ',130000,130100,', '130100', '2016-01-25 14:31:02', '赵县', '河北省石家庄市赵县');
INSERT INTO `t_system_area` VALUES ('130181', ',130000,130100,', '130100', '2016-01-25 14:31:02', '辛集市', '河北省石家庄市辛集市');
INSERT INTO `t_system_area` VALUES ('130182', ',130000,130100,', '130100', '2016-01-25 14:31:02', '藁城市', '河北省石家庄市藁城市');
INSERT INTO `t_system_area` VALUES ('130183', ',130000,130100,', '130100', '2016-01-25 14:31:02', '晋州市', '河北省石家庄市晋州市');
INSERT INTO `t_system_area` VALUES ('130184', ',130000,130100,', '130100', '2016-01-25 14:31:02', '新乐市', '河北省石家庄市新乐市');
INSERT INTO `t_system_area` VALUES ('130185', ',130000,130100,', '130100', '2016-01-25 14:31:02', '鹿泉市', '河北省石家庄市鹿泉市');
INSERT INTO `t_system_area` VALUES ('130186', ',130000,130100,', '130100', '2016-01-25 14:31:02', '其它区', '河北省石家庄市其它区');
INSERT INTO `t_system_area` VALUES ('130200', ',130000,', '130000', '2016-01-25 14:31:02', '唐山市', '河北省唐山市');
INSERT INTO `t_system_area` VALUES ('130202', ',130000,130200,', '130200', '2016-01-25 14:31:02', '路南区', '河北省唐山市路南区');
INSERT INTO `t_system_area` VALUES ('130203', ',130000,130200,', '130200', '2016-01-25 14:31:02', '路北区', '河北省唐山市路北区');
INSERT INTO `t_system_area` VALUES ('130204', ',130000,130200,', '130200', '2016-01-25 14:31:02', '古冶区', '河北省唐山市古冶区');
INSERT INTO `t_system_area` VALUES ('130205', ',130000,130200,', '130200', '2016-01-25 14:31:02', '开平区', '河北省唐山市开平区');
INSERT INTO `t_system_area` VALUES ('130207', ',130000,130200,', '130200', '2016-01-25 14:31:02', '丰南区', '河北省唐山市丰南区');
INSERT INTO `t_system_area` VALUES ('130208', ',130000,130200,', '130200', '2016-01-25 14:31:02', '丰润区', '河北省唐山市丰润区');
INSERT INTO `t_system_area` VALUES ('130223', ',130000,130200,', '130200', '2016-01-25 14:31:02', '滦县', '河北省唐山市滦县');
INSERT INTO `t_system_area` VALUES ('130224', ',130000,130200,', '130200', '2016-01-25 14:31:02', '滦南县', '河北省唐山市滦南县');
INSERT INTO `t_system_area` VALUES ('130225', ',130000,130200,', '130200', '2016-01-25 14:31:02', '乐亭县', '河北省唐山市乐亭县');
INSERT INTO `t_system_area` VALUES ('130227', ',130000,130200,', '130200', '2016-01-25 14:31:02', '迁西县', '河北省唐山市迁西县');
INSERT INTO `t_system_area` VALUES ('130229', ',130000,130200,', '130200', '2016-01-25 14:31:02', '玉田县', '河北省唐山市玉田县');
INSERT INTO `t_system_area` VALUES ('130230', ',130000,130200,', '130200', '2016-01-25 14:31:02', '曹妃甸区', '河北省唐山市曹妃甸区');
INSERT INTO `t_system_area` VALUES ('130281', ',130000,130200,', '130200', '2016-01-25 14:31:02', '遵化市', '河北省唐山市遵化市');
INSERT INTO `t_system_area` VALUES ('130283', ',130000,130200,', '130200', '2016-01-25 14:31:02', '迁安市', '河北省唐山市迁安市');
INSERT INTO `t_system_area` VALUES ('130284', ',130000,130200,', '130200', '2016-01-25 14:31:02', '其它区', '河北省唐山市其它区');
INSERT INTO `t_system_area` VALUES ('130300', ',130000,', '130000', '2016-01-25 14:31:02', '秦皇岛市', '河北省秦皇岛市');
INSERT INTO `t_system_area` VALUES ('130302', ',130000,130300,', '130300', '2016-01-25 14:31:02', '海港区', '河北省秦皇岛市海港区');
INSERT INTO `t_system_area` VALUES ('130303', ',130000,130300,', '130300', '2016-01-25 14:31:02', '山海关区', '河北省秦皇岛市山海关区');
INSERT INTO `t_system_area` VALUES ('130304', ',130000,130300,', '130300', '2016-01-25 14:31:02', '北戴河区', '河北省秦皇岛市北戴河区');
INSERT INTO `t_system_area` VALUES ('130321', ',130000,130300,', '130300', '2016-01-25 14:31:02', '青龙满族自治县', '河北省秦皇岛市青龙满族自治县');
INSERT INTO `t_system_area` VALUES ('130322', ',130000,130300,', '130300', '2016-01-25 14:31:02', '昌黎县', '河北省秦皇岛市昌黎县');
INSERT INTO `t_system_area` VALUES ('130323', ',130000,130300,', '130300', '2016-01-25 14:31:02', '抚宁县', '河北省秦皇岛市抚宁县');
INSERT INTO `t_system_area` VALUES ('130324', ',130000,130300,', '130300', '2016-01-25 14:31:02', '卢龙县', '河北省秦皇岛市卢龙县');
INSERT INTO `t_system_area` VALUES ('130398', ',130000,130300,', '130300', '2016-01-25 14:31:02', '其它区', '河北省秦皇岛市其它区');
INSERT INTO `t_system_area` VALUES ('130399', ',130000,130300,', '130300', '2016-01-25 14:31:02', '经济技术开发区', '河北省秦皇岛市经济技术开发区');
INSERT INTO `t_system_area` VALUES ('130400', ',130000,', '130000', '2016-01-25 14:31:02', '邯郸市', '河北省邯郸市');
INSERT INTO `t_system_area` VALUES ('130402', ',130000,130400,', '130400', '2016-01-25 14:31:02', '邯山区', '河北省邯郸市邯山区');
INSERT INTO `t_system_area` VALUES ('130403', ',130000,130400,', '130400', '2016-01-25 14:31:02', '丛台区', '河北省邯郸市丛台区');
INSERT INTO `t_system_area` VALUES ('130404', ',130000,130400,', '130400', '2016-01-25 14:31:02', '复兴区', '河北省邯郸市复兴区');
INSERT INTO `t_system_area` VALUES ('130406', ',130000,130400,', '130400', '2016-01-25 14:31:02', '峰峰矿区', '河北省邯郸市峰峰矿区');
INSERT INTO `t_system_area` VALUES ('130421', ',130000,130400,', '130400', '2016-01-25 14:31:02', '邯郸县', '河北省邯郸市邯郸县');
INSERT INTO `t_system_area` VALUES ('130423', ',130000,130400,', '130400', '2016-01-25 14:31:02', '临漳县', '河北省邯郸市临漳县');
INSERT INTO `t_system_area` VALUES ('130424', ',130000,130400,', '130400', '2016-01-25 14:31:02', '成安县', '河北省邯郸市成安县');
INSERT INTO `t_system_area` VALUES ('130425', ',130000,130400,', '130400', '2016-01-25 14:31:02', '大名县', '河北省邯郸市大名县');
INSERT INTO `t_system_area` VALUES ('130426', ',130000,130400,', '130400', '2016-01-25 14:31:02', '涉县', '河北省邯郸市涉县');
INSERT INTO `t_system_area` VALUES ('130427', ',130000,130400,', '130400', '2016-01-25 14:31:02', '磁县', '河北省邯郸市磁县');
INSERT INTO `t_system_area` VALUES ('130428', ',130000,130400,', '130400', '2016-01-25 14:31:02', '肥乡县', '河北省邯郸市肥乡县');
INSERT INTO `t_system_area` VALUES ('130429', ',130000,130400,', '130400', '2016-01-25 14:31:02', '永年县', '河北省邯郸市永年县');
INSERT INTO `t_system_area` VALUES ('130430', ',130000,130400,', '130400', '2016-01-25 14:31:02', '邱县', '河北省邯郸市邱县');
INSERT INTO `t_system_area` VALUES ('130431', ',130000,130400,', '130400', '2016-01-25 14:31:02', '鸡泽县', '河北省邯郸市鸡泽县');
INSERT INTO `t_system_area` VALUES ('130432', ',130000,130400,', '130400', '2016-01-25 14:31:02', '广平县', '河北省邯郸市广平县');
INSERT INTO `t_system_area` VALUES ('130433', ',130000,130400,', '130400', '2016-01-25 14:31:02', '馆陶县', '河北省邯郸市馆陶县');
INSERT INTO `t_system_area` VALUES ('130434', ',130000,130400,', '130400', '2016-01-25 14:31:02', '魏县', '河北省邯郸市魏县');
INSERT INTO `t_system_area` VALUES ('130435', ',130000,130400,', '130400', '2016-01-25 14:31:02', '曲周县', '河北省邯郸市曲周县');
INSERT INTO `t_system_area` VALUES ('130481', ',130000,130400,', '130400', '2016-01-25 14:31:02', '武安市', '河北省邯郸市武安市');
INSERT INTO `t_system_area` VALUES ('130482', ',130000,130400,', '130400', '2016-01-25 14:31:02', '其它区', '河北省邯郸市其它区');
INSERT INTO `t_system_area` VALUES ('130500', ',130000,', '130000', '2016-01-25 14:31:02', '邢台市', '河北省邢台市');
INSERT INTO `t_system_area` VALUES ('130502', ',130000,130500,', '130500', '2016-01-25 14:31:02', '桥东区', '河北省邢台市桥东区');
INSERT INTO `t_system_area` VALUES ('130503', ',130000,130500,', '130500', '2016-01-25 14:31:02', '桥西区', '河北省邢台市桥西区');
INSERT INTO `t_system_area` VALUES ('130521', ',130000,130500,', '130500', '2016-01-25 14:31:02', '邢台县', '河北省邢台市邢台县');
INSERT INTO `t_system_area` VALUES ('130522', ',130000,130500,', '130500', '2016-01-25 14:31:02', '临城县', '河北省邢台市临城县');
INSERT INTO `t_system_area` VALUES ('130523', ',130000,130500,', '130500', '2016-01-25 14:31:02', '内丘县', '河北省邢台市内丘县');
INSERT INTO `t_system_area` VALUES ('130524', ',130000,130500,', '130500', '2016-01-25 14:31:02', '柏乡县', '河北省邢台市柏乡县');
INSERT INTO `t_system_area` VALUES ('130525', ',130000,130500,', '130500', '2016-01-25 14:31:02', '隆尧县', '河北省邢台市隆尧县');
INSERT INTO `t_system_area` VALUES ('130526', ',130000,130500,', '130500', '2016-01-25 14:31:02', '任县', '河北省邢台市任县');
INSERT INTO `t_system_area` VALUES ('130527', ',130000,130500,', '130500', '2016-01-25 14:31:02', '南和县', '河北省邢台市南和县');
INSERT INTO `t_system_area` VALUES ('130528', ',130000,130500,', '130500', '2016-01-25 14:31:02', '宁晋县', '河北省邢台市宁晋县');
INSERT INTO `t_system_area` VALUES ('130529', ',130000,130500,', '130500', '2016-01-25 14:31:02', '巨鹿县', '河北省邢台市巨鹿县');
INSERT INTO `t_system_area` VALUES ('130530', ',130000,130500,', '130500', '2016-01-25 14:31:02', '新河县', '河北省邢台市新河县');
INSERT INTO `t_system_area` VALUES ('130531', ',130000,130500,', '130500', '2016-01-25 14:31:02', '广宗县', '河北省邢台市广宗县');
INSERT INTO `t_system_area` VALUES ('130532', ',130000,130500,', '130500', '2016-01-25 14:31:02', '平乡县', '河北省邢台市平乡县');
INSERT INTO `t_system_area` VALUES ('130533', ',130000,130500,', '130500', '2016-01-25 14:31:02', '威县', '河北省邢台市威县');
INSERT INTO `t_system_area` VALUES ('130534', ',130000,130500,', '130500', '2016-01-25 14:31:02', '清河县', '河北省邢台市清河县');
INSERT INTO `t_system_area` VALUES ('130535', ',130000,130500,', '130500', '2016-01-25 14:31:02', '临西县', '河北省邢台市临西县');
INSERT INTO `t_system_area` VALUES ('130581', ',130000,130500,', '130500', '2016-01-25 14:31:02', '南宫市', '河北省邢台市南宫市');
INSERT INTO `t_system_area` VALUES ('130582', ',130000,130500,', '130500', '2016-01-25 14:31:02', '沙河市', '河北省邢台市沙河市');
INSERT INTO `t_system_area` VALUES ('130583', ',130000,130500,', '130500', '2016-01-25 14:31:02', '其它区', '河北省邢台市其它区');
INSERT INTO `t_system_area` VALUES ('130600', ',130000,', '130000', '2016-01-25 14:31:02', '保定市', '河北省保定市');
INSERT INTO `t_system_area` VALUES ('130602', ',130000,130600,', '130600', '2016-01-25 14:31:03', '新市区', '河北省保定市新市区');
INSERT INTO `t_system_area` VALUES ('130603', ',130000,130600,', '130600', '2016-01-25 14:31:03', '北市区', '河北省保定市北市区');
INSERT INTO `t_system_area` VALUES ('130604', ',130000,130600,', '130600', '2016-01-25 14:31:03', '南市区', '河北省保定市南市区');
INSERT INTO `t_system_area` VALUES ('130621', ',130000,130600,', '130600', '2016-01-25 14:31:03', '满城县', '河北省保定市满城县');
INSERT INTO `t_system_area` VALUES ('130622', ',130000,130600,', '130600', '2016-01-25 14:31:03', '清苑县', '河北省保定市清苑县');
INSERT INTO `t_system_area` VALUES ('130623', ',130000,130600,', '130600', '2016-01-25 14:31:03', '涞水县', '河北省保定市涞水县');
INSERT INTO `t_system_area` VALUES ('130624', ',130000,130600,', '130600', '2016-01-25 14:31:03', '阜平县', '河北省保定市阜平县');
INSERT INTO `t_system_area` VALUES ('130625', ',130000,130600,', '130600', '2016-01-25 14:31:03', '徐水县', '河北省保定市徐水县');
INSERT INTO `t_system_area` VALUES ('130626', ',130000,130600,', '130600', '2016-01-25 14:31:03', '定兴县', '河北省保定市定兴县');
INSERT INTO `t_system_area` VALUES ('130627', ',130000,130600,', '130600', '2016-01-25 14:31:03', '唐县', '河北省保定市唐县');
INSERT INTO `t_system_area` VALUES ('130628', ',130000,130600,', '130600', '2016-01-25 14:31:03', '高阳县', '河北省保定市高阳县');
INSERT INTO `t_system_area` VALUES ('130629', ',130000,130600,', '130600', '2016-01-25 14:31:03', '容城县', '河北省保定市容城县');
INSERT INTO `t_system_area` VALUES ('130630', ',130000,130600,', '130600', '2016-01-25 14:31:03', '涞源县', '河北省保定市涞源县');
INSERT INTO `t_system_area` VALUES ('130631', ',130000,130600,', '130600', '2016-01-25 14:31:03', '望都县', '河北省保定市望都县');
INSERT INTO `t_system_area` VALUES ('130632', ',130000,130600,', '130600', '2016-01-25 14:31:03', '安新县', '河北省保定市安新县');
INSERT INTO `t_system_area` VALUES ('130633', ',130000,130600,', '130600', '2016-01-25 14:31:03', '易县', '河北省保定市易县');
INSERT INTO `t_system_area` VALUES ('130634', ',130000,130600,', '130600', '2016-01-25 14:31:03', '曲阳县', '河北省保定市曲阳县');
INSERT INTO `t_system_area` VALUES ('130635', ',130000,130600,', '130600', '2016-01-25 14:31:03', '蠡县', '河北省保定市蠡县');
INSERT INTO `t_system_area` VALUES ('130636', ',130000,130600,', '130600', '2016-01-25 14:31:03', '顺平县', '河北省保定市顺平县');
INSERT INTO `t_system_area` VALUES ('130637', ',130000,130600,', '130600', '2016-01-25 14:31:03', '博野县', '河北省保定市博野县');
INSERT INTO `t_system_area` VALUES ('130638', ',130000,130600,', '130600', '2016-01-25 14:31:03', '雄县', '河北省保定市雄县');
INSERT INTO `t_system_area` VALUES ('130681', ',130000,130600,', '130600', '2016-01-25 14:31:03', '涿州市', '河北省保定市涿州市');
INSERT INTO `t_system_area` VALUES ('130682', ',130000,130600,', '130600', '2016-01-25 14:31:03', '定州市', '河北省保定市定州市');
INSERT INTO `t_system_area` VALUES ('130683', ',130000,130600,', '130600', '2016-01-25 14:31:03', '安国市', '河北省保定市安国市');
INSERT INTO `t_system_area` VALUES ('130684', ',130000,130600,', '130600', '2016-01-25 14:31:03', '高碑店市', '河北省保定市高碑店市');
INSERT INTO `t_system_area` VALUES ('130698', ',130000,130600,', '130600', '2016-01-25 14:31:03', '高开区', '河北省保定市高开区');
INSERT INTO `t_system_area` VALUES ('130699', ',130000,130600,', '130600', '2016-01-25 14:31:03', '其它区', '河北省保定市其它区');
INSERT INTO `t_system_area` VALUES ('130700', ',130000,', '130000', '2016-01-25 14:31:03', '张家口市', '河北省张家口市');
INSERT INTO `t_system_area` VALUES ('130702', ',130000,130700,', '130700', '2016-01-25 14:31:03', '桥东区', '河北省张家口市桥东区');
INSERT INTO `t_system_area` VALUES ('130703', ',130000,130700,', '130700', '2016-01-25 14:31:03', '桥西区', '河北省张家口市桥西区');
INSERT INTO `t_system_area` VALUES ('130705', ',130000,130700,', '130700', '2016-01-25 14:31:03', '宣化区', '河北省张家口市宣化区');
INSERT INTO `t_system_area` VALUES ('130706', ',130000,130700,', '130700', '2016-01-25 14:31:03', '下花园区', '河北省张家口市下花园区');
INSERT INTO `t_system_area` VALUES ('130721', ',130000,130700,', '130700', '2016-01-25 14:31:03', '宣化县', '河北省张家口市宣化县');
INSERT INTO `t_system_area` VALUES ('130722', ',130000,130700,', '130700', '2016-01-25 14:31:03', '张北县', '河北省张家口市张北县');
INSERT INTO `t_system_area` VALUES ('130723', ',130000,130700,', '130700', '2016-01-25 14:31:03', '康保县', '河北省张家口市康保县');
INSERT INTO `t_system_area` VALUES ('130724', ',130000,130700,', '130700', '2016-01-25 14:31:03', '沽源县', '河北省张家口市沽源县');
INSERT INTO `t_system_area` VALUES ('130725', ',130000,130700,', '130700', '2016-01-25 14:31:03', '尚义县', '河北省张家口市尚义县');
INSERT INTO `t_system_area` VALUES ('130726', ',130000,130700,', '130700', '2016-01-25 14:31:03', '蔚县', '河北省张家口市蔚县');
INSERT INTO `t_system_area` VALUES ('130727', ',130000,130700,', '130700', '2016-01-25 14:31:03', '阳原县', '河北省张家口市阳原县');
INSERT INTO `t_system_area` VALUES ('130728', ',130000,130700,', '130700', '2016-01-25 14:31:03', '怀安县', '河北省张家口市怀安县');
INSERT INTO `t_system_area` VALUES ('130729', ',130000,130700,', '130700', '2016-01-25 14:31:03', '万全县', '河北省张家口市万全县');
INSERT INTO `t_system_area` VALUES ('130730', ',130000,130700,', '130700', '2016-01-25 14:31:03', '怀来县', '河北省张家口市怀来县');
INSERT INTO `t_system_area` VALUES ('130731', ',130000,130700,', '130700', '2016-01-25 14:31:03', '涿鹿县', '河北省张家口市涿鹿县');
INSERT INTO `t_system_area` VALUES ('130732', ',130000,130700,', '130700', '2016-01-25 14:31:03', '赤城县', '河北省张家口市赤城县');
INSERT INTO `t_system_area` VALUES ('130733', ',130000,130700,', '130700', '2016-01-25 14:31:03', '崇礼县', '河北省张家口市崇礼县');
INSERT INTO `t_system_area` VALUES ('130734', ',130000,130700,', '130700', '2016-01-25 14:31:03', '其它区', '河北省张家口市其它区');
INSERT INTO `t_system_area` VALUES ('130800', ',130000,', '130000', '2016-01-25 14:31:03', '承德市', '河北省承德市');
INSERT INTO `t_system_area` VALUES ('130802', ',130000,130800,', '130800', '2016-01-25 14:31:03', '双桥区', '河北省承德市双桥区');
INSERT INTO `t_system_area` VALUES ('130803', ',130000,130800,', '130800', '2016-01-25 14:31:03', '双滦区', '河北省承德市双滦区');
INSERT INTO `t_system_area` VALUES ('130804', ',130000,130800,', '130800', '2016-01-25 14:31:03', '鹰手营子矿区', '河北省承德市鹰手营子矿区');
INSERT INTO `t_system_area` VALUES ('130821', ',130000,130800,', '130800', '2016-01-25 14:31:03', '承德县', '河北省承德市承德县');
INSERT INTO `t_system_area` VALUES ('130822', ',130000,130800,', '130800', '2016-01-25 14:31:03', '兴隆县', '河北省承德市兴隆县');
INSERT INTO `t_system_area` VALUES ('130823', ',130000,130800,', '130800', '2016-01-25 14:31:03', '平泉县', '河北省承德市平泉县');
INSERT INTO `t_system_area` VALUES ('130824', ',130000,130800,', '130800', '2016-01-25 14:31:03', '滦平县', '河北省承德市滦平县');
INSERT INTO `t_system_area` VALUES ('130825', ',130000,130800,', '130800', '2016-01-25 14:31:03', '隆化县', '河北省承德市隆化县');
INSERT INTO `t_system_area` VALUES ('130826', ',130000,130800,', '130800', '2016-01-25 14:31:03', '丰宁满族自治县', '河北省承德市丰宁满族自治县');
INSERT INTO `t_system_area` VALUES ('130827', ',130000,130800,', '130800', '2016-01-25 14:31:03', '宽城满族自治县', '河北省承德市宽城满族自治县');
INSERT INTO `t_system_area` VALUES ('130828', ',130000,130800,', '130800', '2016-01-25 14:31:03', '围场满族蒙古族自治县', '河北省承德市围场满族蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('130829', ',130000,130800,', '130800', '2016-01-25 14:31:03', '其它区', '河北省承德市其它区');
INSERT INTO `t_system_area` VALUES ('130900', ',130000,', '130000', '2016-01-25 14:31:03', '沧州市', '河北省沧州市');
INSERT INTO `t_system_area` VALUES ('130902', ',130000,130900,', '130900', '2016-01-25 14:31:03', '新华区', '河北省沧州市新华区');
INSERT INTO `t_system_area` VALUES ('130903', ',130000,130900,', '130900', '2016-01-25 14:31:03', '运河区', '河北省沧州市运河区');
INSERT INTO `t_system_area` VALUES ('130921', ',130000,130900,', '130900', '2016-01-25 14:31:03', '沧县', '河北省沧州市沧县');
INSERT INTO `t_system_area` VALUES ('130922', ',130000,130900,', '130900', '2016-01-25 14:31:03', '青县', '河北省沧州市青县');
INSERT INTO `t_system_area` VALUES ('130923', ',130000,130900,', '130900', '2016-01-25 14:31:03', '东光县', '河北省沧州市东光县');
INSERT INTO `t_system_area` VALUES ('130924', ',130000,130900,', '130900', '2016-01-25 14:31:03', '海兴县', '河北省沧州市海兴县');
INSERT INTO `t_system_area` VALUES ('130925', ',130000,130900,', '130900', '2016-01-25 14:31:03', '盐山县', '河北省沧州市盐山县');
INSERT INTO `t_system_area` VALUES ('130926', ',130000,130900,', '130900', '2016-01-25 14:31:03', '肃宁县', '河北省沧州市肃宁县');
INSERT INTO `t_system_area` VALUES ('130927', ',130000,130900,', '130900', '2016-01-25 14:31:03', '南皮县', '河北省沧州市南皮县');
INSERT INTO `t_system_area` VALUES ('130928', ',130000,130900,', '130900', '2016-01-25 14:31:03', '吴桥县', '河北省沧州市吴桥县');
INSERT INTO `t_system_area` VALUES ('130929', ',130000,130900,', '130900', '2016-01-25 14:31:03', '献县', '河北省沧州市献县');
INSERT INTO `t_system_area` VALUES ('130930', ',130000,130900,', '130900', '2016-01-25 14:31:03', '孟村回族自治县', '河北省沧州市孟村回族自治县');
INSERT INTO `t_system_area` VALUES ('130981', ',130000,130900,', '130900', '2016-01-25 14:31:03', '泊头市', '河北省沧州市泊头市');
INSERT INTO `t_system_area` VALUES ('130982', ',130000,130900,', '130900', '2016-01-25 14:31:03', '任丘市', '河北省沧州市任丘市');
INSERT INTO `t_system_area` VALUES ('130983', ',130000,130900,', '130900', '2016-01-25 14:31:03', '黄骅市', '河北省沧州市黄骅市');
INSERT INTO `t_system_area` VALUES ('130984', ',130000,130900,', '130900', '2016-01-25 14:31:03', '河间市', '河北省沧州市河间市');
INSERT INTO `t_system_area` VALUES ('130985', ',130000,130900,', '130900', '2016-01-25 14:31:03', '其它区', '河北省沧州市其它区');
INSERT INTO `t_system_area` VALUES ('131000', ',130000,', '130000', '2016-01-25 14:31:03', '廊坊市', '河北省廊坊市');
INSERT INTO `t_system_area` VALUES ('131002', ',130000,131000,', '131000', '2016-01-25 14:31:03', '安次区', '河北省廊坊市安次区');
INSERT INTO `t_system_area` VALUES ('131003', ',130000,131000,', '131000', '2016-01-25 14:31:03', '广阳区', '河北省廊坊市广阳区');
INSERT INTO `t_system_area` VALUES ('131022', ',130000,131000,', '131000', '2016-01-25 14:31:03', '固安县', '河北省廊坊市固安县');
INSERT INTO `t_system_area` VALUES ('131023', ',130000,131000,', '131000', '2016-01-25 14:31:03', '永清县', '河北省廊坊市永清县');
INSERT INTO `t_system_area` VALUES ('131024', ',130000,131000,', '131000', '2016-01-25 14:31:03', '香河县', '河北省廊坊市香河县');
INSERT INTO `t_system_area` VALUES ('131025', ',130000,131000,', '131000', '2016-01-25 14:31:03', '大城县', '河北省廊坊市大城县');
INSERT INTO `t_system_area` VALUES ('131026', ',130000,131000,', '131000', '2016-01-25 14:31:03', '文安县', '河北省廊坊市文安县');
INSERT INTO `t_system_area` VALUES ('131028', ',130000,131000,', '131000', '2016-01-25 14:31:03', '大厂回族自治县', '河北省廊坊市大厂回族自治县');
INSERT INTO `t_system_area` VALUES ('131051', ',130000,131000,', '131000', '2016-01-25 14:31:03', '开发区', '河北省廊坊市开发区');
INSERT INTO `t_system_area` VALUES ('131052', ',130000,131000,', '131000', '2016-01-25 14:31:03', '燕郊经济技术开发区', '河北省廊坊市燕郊经济技术开发区');
INSERT INTO `t_system_area` VALUES ('131081', ',130000,131000,', '131000', '2016-01-25 14:31:03', '霸州市', '河北省廊坊市霸州市');
INSERT INTO `t_system_area` VALUES ('131082', ',130000,131000,', '131000', '2016-01-25 14:31:03', '三河市', '河北省廊坊市三河市');
INSERT INTO `t_system_area` VALUES ('131083', ',130000,131000,', '131000', '2016-01-25 14:31:03', '其它区', '河北省廊坊市其它区');
INSERT INTO `t_system_area` VALUES ('131100', ',130000,', '130000', '2016-01-25 14:31:03', '衡水市', '河北省衡水市');
INSERT INTO `t_system_area` VALUES ('131102', ',130000,131100,', '131100', '2016-01-25 14:31:03', '桃城区', '河北省衡水市桃城区');
INSERT INTO `t_system_area` VALUES ('131121', ',130000,131100,', '131100', '2016-01-25 14:31:03', '枣强县', '河北省衡水市枣强县');
INSERT INTO `t_system_area` VALUES ('131122', ',130000,131100,', '131100', '2016-01-25 14:31:03', '武邑县', '河北省衡水市武邑县');
INSERT INTO `t_system_area` VALUES ('131123', ',130000,131100,', '131100', '2016-01-25 14:31:03', '武强县', '河北省衡水市武强县');
INSERT INTO `t_system_area` VALUES ('131124', ',130000,131100,', '131100', '2016-01-25 14:31:03', '饶阳县', '河北省衡水市饶阳县');
INSERT INTO `t_system_area` VALUES ('131125', ',130000,131100,', '131100', '2016-01-25 14:31:03', '安平县', '河北省衡水市安平县');
INSERT INTO `t_system_area` VALUES ('131126', ',130000,131100,', '131100', '2016-01-25 14:31:03', '故城县', '河北省衡水市故城县');
INSERT INTO `t_system_area` VALUES ('131127', ',130000,131100,', '131100', '2016-01-25 14:31:03', '景县', '河北省衡水市景县');
INSERT INTO `t_system_area` VALUES ('131128', ',130000,131100,', '131100', '2016-01-25 14:31:03', '阜城县', '河北省衡水市阜城县');
INSERT INTO `t_system_area` VALUES ('131181', ',130000,131100,', '131100', '2016-01-25 14:31:03', '冀州市', '河北省衡水市冀州市');
INSERT INTO `t_system_area` VALUES ('131182', ',130000,131100,', '131100', '2016-01-25 14:31:04', '深州市', '河北省衡水市深州市');
INSERT INTO `t_system_area` VALUES ('131183', ',130000,131100,', '131100', '2016-01-25 14:31:04', '其它区', '河北省衡水市其它区');
INSERT INTO `t_system_area` VALUES ('140000', ',', null, '2016-01-25 14:31:04', '山西省', '山西省');
INSERT INTO `t_system_area` VALUES ('140100', ',140000,', '140000', '2016-01-25 14:31:04', '太原市', '山西省太原市');
INSERT INTO `t_system_area` VALUES ('140105', ',140000,140100,', '140100', '2016-01-25 14:31:04', '小店区', '山西省太原市小店区');
INSERT INTO `t_system_area` VALUES ('140106', ',140000,140100,', '140100', '2016-01-25 14:31:04', '迎泽区', '山西省太原市迎泽区');
INSERT INTO `t_system_area` VALUES ('140107', ',140000,140100,', '140100', '2016-01-25 14:31:04', '杏花岭区', '山西省太原市杏花岭区');
INSERT INTO `t_system_area` VALUES ('140108', ',140000,140100,', '140100', '2016-01-25 14:31:04', '尖草坪区', '山西省太原市尖草坪区');
INSERT INTO `t_system_area` VALUES ('140109', ',140000,140100,', '140100', '2016-01-25 14:31:04', '万柏林区', '山西省太原市万柏林区');
INSERT INTO `t_system_area` VALUES ('140110', ',140000,140100,', '140100', '2016-01-25 14:31:04', '晋源区', '山西省太原市晋源区');
INSERT INTO `t_system_area` VALUES ('140121', ',140000,140100,', '140100', '2016-01-25 14:31:04', '清徐县', '山西省太原市清徐县');
INSERT INTO `t_system_area` VALUES ('140122', ',140000,140100,', '140100', '2016-01-25 14:31:04', '阳曲县', '山西省太原市阳曲县');
INSERT INTO `t_system_area` VALUES ('140123', ',140000,140100,', '140100', '2016-01-25 14:31:04', '娄烦县', '山西省太原市娄烦县');
INSERT INTO `t_system_area` VALUES ('140181', ',140000,140100,', '140100', '2016-01-25 14:31:04', '古交市', '山西省太原市古交市');
INSERT INTO `t_system_area` VALUES ('140182', ',140000,140100,', '140100', '2016-01-25 14:31:04', '其它区', '山西省太原市其它区');
INSERT INTO `t_system_area` VALUES ('140200', ',140000,', '140000', '2016-01-25 14:31:04', '大同市', '山西省大同市');
INSERT INTO `t_system_area` VALUES ('140202', ',140000,140200,', '140200', '2016-01-25 14:31:04', '城区', '山西省大同市城区');
INSERT INTO `t_system_area` VALUES ('140203', ',140000,140200,', '140200', '2016-01-25 14:31:04', '矿区', '山西省大同市矿区');
INSERT INTO `t_system_area` VALUES ('140211', ',140000,140200,', '140200', '2016-01-25 14:31:04', '南郊区', '山西省大同市南郊区');
INSERT INTO `t_system_area` VALUES ('140212', ',140000,140200,', '140200', '2016-01-25 14:31:04', '新荣区', '山西省大同市新荣区');
INSERT INTO `t_system_area` VALUES ('140221', ',140000,140200,', '140200', '2016-01-25 14:31:04', '阳高县', '山西省大同市阳高县');
INSERT INTO `t_system_area` VALUES ('140222', ',140000,140200,', '140200', '2016-01-25 14:31:04', '天镇县', '山西省大同市天镇县');
INSERT INTO `t_system_area` VALUES ('140223', ',140000,140200,', '140200', '2016-01-25 14:31:04', '广灵县', '山西省大同市广灵县');
INSERT INTO `t_system_area` VALUES ('140224', ',140000,140200,', '140200', '2016-01-25 14:31:04', '灵丘县', '山西省大同市灵丘县');
INSERT INTO `t_system_area` VALUES ('140225', ',140000,140200,', '140200', '2016-01-25 14:31:04', '浑源县', '山西省大同市浑源县');
INSERT INTO `t_system_area` VALUES ('140226', ',140000,140200,', '140200', '2016-01-25 14:31:04', '左云县', '山西省大同市左云县');
INSERT INTO `t_system_area` VALUES ('140227', ',140000,140200,', '140200', '2016-01-25 14:31:04', '大同县', '山西省大同市大同县');
INSERT INTO `t_system_area` VALUES ('140228', ',140000,140200,', '140200', '2016-01-25 14:31:04', '其它区', '山西省大同市其它区');
INSERT INTO `t_system_area` VALUES ('140300', ',140000,', '140000', '2016-01-25 14:31:04', '阳泉市', '山西省阳泉市');
INSERT INTO `t_system_area` VALUES ('140302', ',140000,140300,', '140300', '2016-01-25 14:31:04', '城区', '山西省阳泉市城区');
INSERT INTO `t_system_area` VALUES ('140303', ',140000,140300,', '140300', '2016-01-25 14:31:04', '矿区', '山西省阳泉市矿区');
INSERT INTO `t_system_area` VALUES ('140311', ',140000,140300,', '140300', '2016-01-25 14:31:04', '郊区', '山西省阳泉市郊区');
INSERT INTO `t_system_area` VALUES ('140321', ',140000,140300,', '140300', '2016-01-25 14:31:04', '平定县', '山西省阳泉市平定县');
INSERT INTO `t_system_area` VALUES ('140322', ',140000,140300,', '140300', '2016-01-25 14:31:04', '盂县', '山西省阳泉市盂县');
INSERT INTO `t_system_area` VALUES ('140323', ',140000,140300,', '140300', '2016-01-25 14:31:04', '其它区', '山西省阳泉市其它区');
INSERT INTO `t_system_area` VALUES ('140400', ',140000,', '140000', '2016-01-25 14:31:04', '长治市', '山西省长治市');
INSERT INTO `t_system_area` VALUES ('140421', ',140000,140400,', '140400', '2016-01-25 14:31:04', '长治县', '山西省长治市长治县');
INSERT INTO `t_system_area` VALUES ('140423', ',140000,140400,', '140400', '2016-01-25 14:31:04', '襄垣县', '山西省长治市襄垣县');
INSERT INTO `t_system_area` VALUES ('140424', ',140000,140400,', '140400', '2016-01-25 14:31:04', '屯留县', '山西省长治市屯留县');
INSERT INTO `t_system_area` VALUES ('140425', ',140000,140400,', '140400', '2016-01-25 14:31:04', '平顺县', '山西省长治市平顺县');
INSERT INTO `t_system_area` VALUES ('140426', ',140000,140400,', '140400', '2016-01-25 14:31:04', '黎城县', '山西省长治市黎城县');
INSERT INTO `t_system_area` VALUES ('140427', ',140000,140400,', '140400', '2016-01-25 14:31:04', '壶关县', '山西省长治市壶关县');
INSERT INTO `t_system_area` VALUES ('140428', ',140000,140400,', '140400', '2016-01-25 14:31:04', '长子县', '山西省长治市长子县');
INSERT INTO `t_system_area` VALUES ('140429', ',140000,140400,', '140400', '2016-01-25 14:31:04', '武乡县', '山西省长治市武乡县');
INSERT INTO `t_system_area` VALUES ('140430', ',140000,140400,', '140400', '2016-01-25 14:31:04', '沁县', '山西省长治市沁县');
INSERT INTO `t_system_area` VALUES ('140431', ',140000,140400,', '140400', '2016-01-25 14:31:04', '沁源县', '山西省长治市沁源县');
INSERT INTO `t_system_area` VALUES ('140481', ',140000,140400,', '140400', '2016-01-25 14:31:04', '潞城市', '山西省长治市潞城市');
INSERT INTO `t_system_area` VALUES ('140482', ',140000,140400,', '140400', '2016-01-25 14:31:04', '城区', '山西省长治市城区');
INSERT INTO `t_system_area` VALUES ('140483', ',140000,140400,', '140400', '2016-01-25 14:31:04', '郊区', '山西省长治市郊区');
INSERT INTO `t_system_area` VALUES ('140484', ',140000,140400,', '140400', '2016-01-25 14:31:04', '高新区', '山西省长治市高新区');
INSERT INTO `t_system_area` VALUES ('140485', ',140000,140400,', '140400', '2016-01-25 14:31:04', '其它区', '山西省长治市其它区');
INSERT INTO `t_system_area` VALUES ('140500', ',140000,', '140000', '2016-01-25 14:31:04', '晋城市', '山西省晋城市');
INSERT INTO `t_system_area` VALUES ('140502', ',140000,140500,', '140500', '2016-01-25 14:31:04', '城区', '山西省晋城市城区');
INSERT INTO `t_system_area` VALUES ('140521', ',140000,140500,', '140500', '2016-01-25 14:31:04', '沁水县', '山西省晋城市沁水县');
INSERT INTO `t_system_area` VALUES ('140522', ',140000,140500,', '140500', '2016-01-25 14:31:04', '阳城县', '山西省晋城市阳城县');
INSERT INTO `t_system_area` VALUES ('140524', ',140000,140500,', '140500', '2016-01-25 14:31:04', '陵川县', '山西省晋城市陵川县');
INSERT INTO `t_system_area` VALUES ('140525', ',140000,140500,', '140500', '2016-01-25 14:31:04', '泽州县', '山西省晋城市泽州县');
INSERT INTO `t_system_area` VALUES ('140581', ',140000,140500,', '140500', '2016-01-25 14:31:04', '高平市', '山西省晋城市高平市');
INSERT INTO `t_system_area` VALUES ('140582', ',140000,140500,', '140500', '2016-01-25 14:31:04', '其它区', '山西省晋城市其它区');
INSERT INTO `t_system_area` VALUES ('140600', ',140000,', '140000', '2016-01-25 14:31:04', '朔州市', '山西省朔州市');
INSERT INTO `t_system_area` VALUES ('140602', ',140000,140600,', '140600', '2016-01-25 14:31:04', '朔城区', '山西省朔州市朔城区');
INSERT INTO `t_system_area` VALUES ('140603', ',140000,140600,', '140600', '2016-01-25 14:31:04', '平鲁区', '山西省朔州市平鲁区');
INSERT INTO `t_system_area` VALUES ('140621', ',140000,140600,', '140600', '2016-01-25 14:31:04', '山阴县', '山西省朔州市山阴县');
INSERT INTO `t_system_area` VALUES ('140622', ',140000,140600,', '140600', '2016-01-25 14:31:04', '应县', '山西省朔州市应县');
INSERT INTO `t_system_area` VALUES ('140623', ',140000,140600,', '140600', '2016-01-25 14:31:04', '右玉县', '山西省朔州市右玉县');
INSERT INTO `t_system_area` VALUES ('140624', ',140000,140600,', '140600', '2016-01-25 14:31:04', '怀仁县', '山西省朔州市怀仁县');
INSERT INTO `t_system_area` VALUES ('140625', ',140000,140600,', '140600', '2016-01-25 14:31:04', '其它区', '山西省朔州市其它区');
INSERT INTO `t_system_area` VALUES ('140700', ',140000,', '140000', '2016-01-25 14:31:04', '晋中市', '山西省晋中市');
INSERT INTO `t_system_area` VALUES ('140702', ',140000,140700,', '140700', '2016-01-25 14:31:04', '榆次区', '山西省晋中市榆次区');
INSERT INTO `t_system_area` VALUES ('140721', ',140000,140700,', '140700', '2016-01-25 14:31:04', '榆社县', '山西省晋中市榆社县');
INSERT INTO `t_system_area` VALUES ('140722', ',140000,140700,', '140700', '2016-01-25 14:31:04', '左权县', '山西省晋中市左权县');
INSERT INTO `t_system_area` VALUES ('140723', ',140000,140700,', '140700', '2016-01-25 14:31:04', '和顺县', '山西省晋中市和顺县');
INSERT INTO `t_system_area` VALUES ('140724', ',140000,140700,', '140700', '2016-01-25 14:31:04', '昔阳县', '山西省晋中市昔阳县');
INSERT INTO `t_system_area` VALUES ('140725', ',140000,140700,', '140700', '2016-01-25 14:31:04', '寿阳县', '山西省晋中市寿阳县');
INSERT INTO `t_system_area` VALUES ('140726', ',140000,140700,', '140700', '2016-01-25 14:31:04', '太谷县', '山西省晋中市太谷县');
INSERT INTO `t_system_area` VALUES ('140727', ',140000,140700,', '140700', '2016-01-25 14:31:04', '祁县', '山西省晋中市祁县');
INSERT INTO `t_system_area` VALUES ('140728', ',140000,140700,', '140700', '2016-01-25 14:31:04', '平遥县', '山西省晋中市平遥县');
INSERT INTO `t_system_area` VALUES ('140729', ',140000,140700,', '140700', '2016-01-25 14:31:04', '灵石县', '山西省晋中市灵石县');
INSERT INTO `t_system_area` VALUES ('140781', ',140000,140700,', '140700', '2016-01-25 14:31:04', '介休市', '山西省晋中市介休市');
INSERT INTO `t_system_area` VALUES ('140782', ',140000,140700,', '140700', '2016-01-25 14:31:04', '其它区', '山西省晋中市其它区');
INSERT INTO `t_system_area` VALUES ('140800', ',140000,', '140000', '2016-01-25 14:31:04', '运城市', '山西省运城市');
INSERT INTO `t_system_area` VALUES ('140802', ',140000,140800,', '140800', '2016-01-25 14:31:04', '盐湖区', '山西省运城市盐湖区');
INSERT INTO `t_system_area` VALUES ('140821', ',140000,140800,', '140800', '2016-01-25 14:31:04', '临猗县', '山西省运城市临猗县');
INSERT INTO `t_system_area` VALUES ('140822', ',140000,140800,', '140800', '2016-01-25 14:31:04', '万荣县', '山西省运城市万荣县');
INSERT INTO `t_system_area` VALUES ('140823', ',140000,140800,', '140800', '2016-01-25 14:31:04', '闻喜县', '山西省运城市闻喜县');
INSERT INTO `t_system_area` VALUES ('140824', ',140000,140800,', '140800', '2016-01-25 14:31:04', '稷山县', '山西省运城市稷山县');
INSERT INTO `t_system_area` VALUES ('140825', ',140000,140800,', '140800', '2016-01-25 14:31:04', '新绛县', '山西省运城市新绛县');
INSERT INTO `t_system_area` VALUES ('140826', ',140000,140800,', '140800', '2016-01-25 14:31:04', '绛县', '山西省运城市绛县');
INSERT INTO `t_system_area` VALUES ('140827', ',140000,140800,', '140800', '2016-01-25 14:31:04', '垣曲县', '山西省运城市垣曲县');
INSERT INTO `t_system_area` VALUES ('140828', ',140000,140800,', '140800', '2016-01-25 14:31:04', '夏县', '山西省运城市夏县');
INSERT INTO `t_system_area` VALUES ('140829', ',140000,140800,', '140800', '2016-01-25 14:31:04', '平陆县', '山西省运城市平陆县');
INSERT INTO `t_system_area` VALUES ('140830', ',140000,140800,', '140800', '2016-01-25 14:31:04', '芮城县', '山西省运城市芮城县');
INSERT INTO `t_system_area` VALUES ('140881', ',140000,140800,', '140800', '2016-01-25 14:31:04', '永济市', '山西省运城市永济市');
INSERT INTO `t_system_area` VALUES ('140882', ',140000,140800,', '140800', '2016-01-25 14:31:04', '河津市', '山西省运城市河津市');
INSERT INTO `t_system_area` VALUES ('140883', ',140000,140800,', '140800', '2016-01-25 14:31:04', '其它区', '山西省运城市其它区');
INSERT INTO `t_system_area` VALUES ('140900', ',140000,', '140000', '2016-01-25 14:31:04', '忻州市', '山西省忻州市');
INSERT INTO `t_system_area` VALUES ('140902', ',140000,140900,', '140900', '2016-01-25 14:31:04', '忻府区', '山西省忻州市忻府区');
INSERT INTO `t_system_area` VALUES ('140921', ',140000,140900,', '140900', '2016-01-25 14:31:04', '定襄县', '山西省忻州市定襄县');
INSERT INTO `t_system_area` VALUES ('140922', ',140000,140900,', '140900', '2016-01-25 14:31:04', '五台县', '山西省忻州市五台县');
INSERT INTO `t_system_area` VALUES ('140923', ',140000,140900,', '140900', '2016-01-25 14:31:04', '代县', '山西省忻州市代县');
INSERT INTO `t_system_area` VALUES ('140924', ',140000,140900,', '140900', '2016-01-25 14:31:04', '繁峙县', '山西省忻州市繁峙县');
INSERT INTO `t_system_area` VALUES ('140925', ',140000,140900,', '140900', '2016-01-25 14:31:04', '宁武县', '山西省忻州市宁武县');
INSERT INTO `t_system_area` VALUES ('140926', ',140000,140900,', '140900', '2016-01-25 14:31:04', '静乐县', '山西省忻州市静乐县');
INSERT INTO `t_system_area` VALUES ('140927', ',140000,140900,', '140900', '2016-01-25 14:31:05', '神池县', '山西省忻州市神池县');
INSERT INTO `t_system_area` VALUES ('140928', ',140000,140900,', '140900', '2016-01-25 14:31:05', '五寨县', '山西省忻州市五寨县');
INSERT INTO `t_system_area` VALUES ('140929', ',140000,140900,', '140900', '2016-01-25 14:31:05', '岢岚县', '山西省忻州市岢岚县');
INSERT INTO `t_system_area` VALUES ('140930', ',140000,140900,', '140900', '2016-01-25 14:31:05', '河曲县', '山西省忻州市河曲县');
INSERT INTO `t_system_area` VALUES ('140931', ',140000,140900,', '140900', '2016-01-25 14:31:05', '保德县', '山西省忻州市保德县');
INSERT INTO `t_system_area` VALUES ('140932', ',140000,140900,', '140900', '2016-01-25 14:31:05', '偏关县', '山西省忻州市偏关县');
INSERT INTO `t_system_area` VALUES ('140981', ',140000,140900,', '140900', '2016-01-25 14:31:05', '原平市', '山西省忻州市原平市');
INSERT INTO `t_system_area` VALUES ('140982', ',140000,140900,', '140900', '2016-01-25 14:31:05', '其它区', '山西省忻州市其它区');
INSERT INTO `t_system_area` VALUES ('141000', ',140000,', '140000', '2016-01-25 14:31:05', '临汾市', '山西省临汾市');
INSERT INTO `t_system_area` VALUES ('141002', ',140000,141000,', '141000', '2016-01-25 14:31:05', '尧都区', '山西省临汾市尧都区');
INSERT INTO `t_system_area` VALUES ('141021', ',140000,141000,', '141000', '2016-01-25 14:31:05', '曲沃县', '山西省临汾市曲沃县');
INSERT INTO `t_system_area` VALUES ('141022', ',140000,141000,', '141000', '2016-01-25 14:31:05', '翼城县', '山西省临汾市翼城县');
INSERT INTO `t_system_area` VALUES ('141023', ',140000,141000,', '141000', '2016-01-25 14:31:05', '襄汾县', '山西省临汾市襄汾县');
INSERT INTO `t_system_area` VALUES ('141024', ',140000,141000,', '141000', '2016-01-25 14:31:05', '洪洞县', '山西省临汾市洪洞县');
INSERT INTO `t_system_area` VALUES ('141025', ',140000,141000,', '141000', '2016-01-25 14:31:05', '古县', '山西省临汾市古县');
INSERT INTO `t_system_area` VALUES ('141026', ',140000,141000,', '141000', '2016-01-25 14:31:05', '安泽县', '山西省临汾市安泽县');
INSERT INTO `t_system_area` VALUES ('141027', ',140000,141000,', '141000', '2016-01-25 14:31:05', '浮山县', '山西省临汾市浮山县');
INSERT INTO `t_system_area` VALUES ('141028', ',140000,141000,', '141000', '2016-01-25 14:31:05', '吉县', '山西省临汾市吉县');
INSERT INTO `t_system_area` VALUES ('141029', ',140000,141000,', '141000', '2016-01-25 14:31:05', '乡宁县', '山西省临汾市乡宁县');
INSERT INTO `t_system_area` VALUES ('141030', ',140000,141000,', '141000', '2016-01-25 14:31:05', '大宁县', '山西省临汾市大宁县');
INSERT INTO `t_system_area` VALUES ('141031', ',140000,141000,', '141000', '2016-01-25 14:31:05', '隰县', '山西省临汾市隰县');
INSERT INTO `t_system_area` VALUES ('141032', ',140000,141000,', '141000', '2016-01-25 14:31:05', '永和县', '山西省临汾市永和县');
INSERT INTO `t_system_area` VALUES ('141033', ',140000,141000,', '141000', '2016-01-25 14:31:05', '蒲县', '山西省临汾市蒲县');
INSERT INTO `t_system_area` VALUES ('141034', ',140000,141000,', '141000', '2016-01-25 14:31:05', '汾西县', '山西省临汾市汾西县');
INSERT INTO `t_system_area` VALUES ('141081', ',140000,141000,', '141000', '2016-01-25 14:31:05', '侯马市', '山西省临汾市侯马市');
INSERT INTO `t_system_area` VALUES ('141082', ',140000,141000,', '141000', '2016-01-25 14:31:05', '霍州市', '山西省临汾市霍州市');
INSERT INTO `t_system_area` VALUES ('141083', ',140000,141000,', '141000', '2016-01-25 14:31:05', '其它区', '山西省临汾市其它区');
INSERT INTO `t_system_area` VALUES ('141100', ',140000,', '140000', '2016-01-25 14:31:05', '吕梁市', '山西省吕梁市');
INSERT INTO `t_system_area` VALUES ('141102', ',140000,141100,', '141100', '2016-01-25 14:31:05', '离石区', '山西省吕梁市离石区');
INSERT INTO `t_system_area` VALUES ('141121', ',140000,141100,', '141100', '2016-01-25 14:31:05', '文水县', '山西省吕梁市文水县');
INSERT INTO `t_system_area` VALUES ('141122', ',140000,141100,', '141100', '2016-01-25 14:31:05', '交城县', '山西省吕梁市交城县');
INSERT INTO `t_system_area` VALUES ('141123', ',140000,141100,', '141100', '2016-01-25 14:31:05', '兴县', '山西省吕梁市兴县');
INSERT INTO `t_system_area` VALUES ('141124', ',140000,141100,', '141100', '2016-01-25 14:31:05', '临县', '山西省吕梁市临县');
INSERT INTO `t_system_area` VALUES ('141125', ',140000,141100,', '141100', '2016-01-25 14:31:05', '柳林县', '山西省吕梁市柳林县');
INSERT INTO `t_system_area` VALUES ('141126', ',140000,141100,', '141100', '2016-01-25 14:31:05', '石楼县', '山西省吕梁市石楼县');
INSERT INTO `t_system_area` VALUES ('141127', ',140000,141100,', '141100', '2016-01-25 14:31:05', '岚县', '山西省吕梁市岚县');
INSERT INTO `t_system_area` VALUES ('141128', ',140000,141100,', '141100', '2016-01-25 14:31:05', '方山县', '山西省吕梁市方山县');
INSERT INTO `t_system_area` VALUES ('141129', ',140000,141100,', '141100', '2016-01-25 14:31:05', '中阳县', '山西省吕梁市中阳县');
INSERT INTO `t_system_area` VALUES ('141130', ',140000,141100,', '141100', '2016-01-25 14:31:05', '交口县', '山西省吕梁市交口县');
INSERT INTO `t_system_area` VALUES ('141181', ',140000,141100,', '141100', '2016-01-25 14:31:05', '孝义市', '山西省吕梁市孝义市');
INSERT INTO `t_system_area` VALUES ('141182', ',140000,141100,', '141100', '2016-01-25 14:31:05', '汾阳市', '山西省吕梁市汾阳市');
INSERT INTO `t_system_area` VALUES ('141183', ',140000,141100,', '141100', '2016-01-25 14:31:05', '其它区', '山西省吕梁市其它区');
INSERT INTO `t_system_area` VALUES ('150000', ',', null, '2016-01-25 14:31:05', '内蒙古', '内蒙古');
INSERT INTO `t_system_area` VALUES ('150100', ',150000,', '150000', '2016-01-25 14:31:05', '呼和浩特市', '内蒙古呼和浩特市');
INSERT INTO `t_system_area` VALUES ('150102', ',150000,150100,', '150100', '2016-01-25 14:31:05', '新城区', '内蒙古呼和浩特市新城区');
INSERT INTO `t_system_area` VALUES ('150103', ',150000,150100,', '150100', '2016-01-25 14:31:05', '回民区', '内蒙古呼和浩特市回民区');
INSERT INTO `t_system_area` VALUES ('150104', ',150000,150100,', '150100', '2016-01-25 14:31:05', '玉泉区', '内蒙古呼和浩特市玉泉区');
INSERT INTO `t_system_area` VALUES ('150105', ',150000,150100,', '150100', '2016-01-25 14:31:05', '赛罕区', '内蒙古呼和浩特市赛罕区');
INSERT INTO `t_system_area` VALUES ('150121', ',150000,150100,', '150100', '2016-01-25 14:31:05', '土默特左旗', '内蒙古呼和浩特市土默特左旗');
INSERT INTO `t_system_area` VALUES ('150122', ',150000,150100,', '150100', '2016-01-25 14:31:05', '托克托县', '内蒙古呼和浩特市托克托县');
INSERT INTO `t_system_area` VALUES ('150123', ',150000,150100,', '150100', '2016-01-25 14:31:05', '和林格尔县', '内蒙古呼和浩特市和林格尔县');
INSERT INTO `t_system_area` VALUES ('150124', ',150000,150100,', '150100', '2016-01-25 14:31:05', '清水河县', '内蒙古呼和浩特市清水河县');
INSERT INTO `t_system_area` VALUES ('150125', ',150000,150100,', '150100', '2016-01-25 14:31:05', '武川县', '内蒙古呼和浩特市武川县');
INSERT INTO `t_system_area` VALUES ('150126', ',150000,150100,', '150100', '2016-01-25 14:31:05', '其它区', '内蒙古呼和浩特市其它区');
INSERT INTO `t_system_area` VALUES ('150200', ',150000,', '150000', '2016-01-25 14:31:05', '包头市', '内蒙古包头市');
INSERT INTO `t_system_area` VALUES ('150202', ',150000,150200,', '150200', '2016-01-25 14:31:05', '东河区', '内蒙古包头市东河区');
INSERT INTO `t_system_area` VALUES ('150203', ',150000,150200,', '150200', '2016-01-25 14:31:05', '昆都仑区', '内蒙古包头市昆都仑区');
INSERT INTO `t_system_area` VALUES ('150204', ',150000,150200,', '150200', '2016-01-25 14:31:05', '青山区', '内蒙古包头市青山区');
INSERT INTO `t_system_area` VALUES ('150205', ',150000,150200,', '150200', '2016-01-25 14:31:05', '石拐区', '内蒙古包头市石拐区');
INSERT INTO `t_system_area` VALUES ('150206', ',150000,150200,', '150200', '2016-01-25 14:31:05', '白云鄂博矿区', '内蒙古包头市白云鄂博矿区');
INSERT INTO `t_system_area` VALUES ('150207', ',150000,150200,', '150200', '2016-01-25 14:31:05', '九原区', '内蒙古包头市九原区');
INSERT INTO `t_system_area` VALUES ('150221', ',150000,150200,', '150200', '2016-01-25 14:31:05', '土默特右旗', '内蒙古包头市土默特右旗');
INSERT INTO `t_system_area` VALUES ('150222', ',150000,150200,', '150200', '2016-01-25 14:31:05', '固阳县', '内蒙古包头市固阳县');
INSERT INTO `t_system_area` VALUES ('150223', ',150000,150200,', '150200', '2016-01-25 14:31:05', '达尔罕茂明安联合旗', '内蒙古包头市达尔罕茂明安联合旗');
INSERT INTO `t_system_area` VALUES ('150224', ',150000,150200,', '150200', '2016-01-25 14:31:05', '其它区', '内蒙古包头市其它区');
INSERT INTO `t_system_area` VALUES ('150300', ',150000,', '150000', '2016-01-25 14:31:05', '乌海市', '内蒙古乌海市');
INSERT INTO `t_system_area` VALUES ('150302', ',150000,150300,', '150300', '2016-01-25 14:31:05', '海勃湾区', '内蒙古乌海市海勃湾区');
INSERT INTO `t_system_area` VALUES ('150303', ',150000,150300,', '150300', '2016-01-25 14:31:05', '海南区', '内蒙古乌海市海南区');
INSERT INTO `t_system_area` VALUES ('150304', ',150000,150300,', '150300', '2016-01-25 14:31:05', '乌达区', '内蒙古乌海市乌达区');
INSERT INTO `t_system_area` VALUES ('150305', ',150000,150300,', '150300', '2016-01-25 14:31:05', '其它区', '内蒙古乌海市其它区');
INSERT INTO `t_system_area` VALUES ('150400', ',150000,', '150000', '2016-01-25 14:31:05', '赤峰市', '内蒙古赤峰市');
INSERT INTO `t_system_area` VALUES ('150402', ',150000,150400,', '150400', '2016-01-25 14:31:05', '红山区', '内蒙古赤峰市红山区');
INSERT INTO `t_system_area` VALUES ('150403', ',150000,150400,', '150400', '2016-01-25 14:31:05', '元宝山区', '内蒙古赤峰市元宝山区');
INSERT INTO `t_system_area` VALUES ('150404', ',150000,150400,', '150400', '2016-01-25 14:31:05', '松山区', '内蒙古赤峰市松山区');
INSERT INTO `t_system_area` VALUES ('150421', ',150000,150400,', '150400', '2016-01-25 14:31:05', '阿鲁科尔沁旗', '内蒙古赤峰市阿鲁科尔沁旗');
INSERT INTO `t_system_area` VALUES ('150422', ',150000,150400,', '150400', '2016-01-25 14:31:05', '巴林左旗', '内蒙古赤峰市巴林左旗');
INSERT INTO `t_system_area` VALUES ('150423', ',150000,150400,', '150400', '2016-01-25 14:31:05', '巴林右旗', '内蒙古赤峰市巴林右旗');
INSERT INTO `t_system_area` VALUES ('150424', ',150000,150400,', '150400', '2016-01-25 14:31:05', '林西县', '内蒙古赤峰市林西县');
INSERT INTO `t_system_area` VALUES ('150425', ',150000,150400,', '150400', '2016-01-25 14:31:05', '克什克腾旗', '内蒙古赤峰市克什克腾旗');
INSERT INTO `t_system_area` VALUES ('150426', ',150000,150400,', '150400', '2016-01-25 14:31:05', '翁牛特旗', '内蒙古赤峰市翁牛特旗');
INSERT INTO `t_system_area` VALUES ('150428', ',150000,150400,', '150400', '2016-01-25 14:31:05', '喀喇沁旗', '内蒙古赤峰市喀喇沁旗');
INSERT INTO `t_system_area` VALUES ('150429', ',150000,150400,', '150400', '2016-01-25 14:31:05', '宁城县', '内蒙古赤峰市宁城县');
INSERT INTO `t_system_area` VALUES ('150430', ',150000,150400,', '150400', '2016-01-25 14:31:05', '敖汉旗', '内蒙古赤峰市敖汉旗');
INSERT INTO `t_system_area` VALUES ('150431', ',150000,150400,', '150400', '2016-01-25 14:31:05', '其它区', '内蒙古赤峰市其它区');
INSERT INTO `t_system_area` VALUES ('150500', ',150000,', '150000', '2016-01-25 14:31:05', '通辽市', '内蒙古通辽市');
INSERT INTO `t_system_area` VALUES ('150502', ',150000,150500,', '150500', '2016-01-25 14:31:05', '科尔沁区', '内蒙古通辽市科尔沁区');
INSERT INTO `t_system_area` VALUES ('150521', ',150000,150500,', '150500', '2016-01-25 14:31:05', '科尔沁左翼中旗', '内蒙古通辽市科尔沁左翼中旗');
INSERT INTO `t_system_area` VALUES ('150522', ',150000,150500,', '150500', '2016-01-25 14:31:05', '科尔沁左翼后旗', '内蒙古通辽市科尔沁左翼后旗');
INSERT INTO `t_system_area` VALUES ('150523', ',150000,150500,', '150500', '2016-01-25 14:31:05', '开鲁县', '内蒙古通辽市开鲁县');
INSERT INTO `t_system_area` VALUES ('150524', ',150000,150500,', '150500', '2016-01-25 14:31:05', '库伦旗', '内蒙古通辽市库伦旗');
INSERT INTO `t_system_area` VALUES ('150525', ',150000,150500,', '150500', '2016-01-25 14:31:05', '奈曼旗', '内蒙古通辽市奈曼旗');
INSERT INTO `t_system_area` VALUES ('150526', ',150000,150500,', '150500', '2016-01-25 14:31:05', '扎鲁特旗', '内蒙古通辽市扎鲁特旗');
INSERT INTO `t_system_area` VALUES ('150581', ',150000,150500,', '150500', '2016-01-25 14:31:05', '霍林郭勒市', '内蒙古通辽市霍林郭勒市');
INSERT INTO `t_system_area` VALUES ('150582', ',150000,150500,', '150500', '2016-01-25 14:31:05', '其它区', '内蒙古通辽市其它区');
INSERT INTO `t_system_area` VALUES ('150600', ',150000,', '150000', '2016-01-25 14:31:05', '鄂尔多斯市', '内蒙古鄂尔多斯市');
INSERT INTO `t_system_area` VALUES ('150602', ',150000,150600,', '150600', '2016-01-25 14:31:05', '东胜区', '内蒙古鄂尔多斯市东胜区');
INSERT INTO `t_system_area` VALUES ('150621', ',150000,150600,', '150600', '2016-01-25 14:31:05', '达拉特旗', '内蒙古鄂尔多斯市达拉特旗');
INSERT INTO `t_system_area` VALUES ('150622', ',150000,150600,', '150600', '2016-01-25 14:31:05', '准格尔旗', '内蒙古鄂尔多斯市准格尔旗');
INSERT INTO `t_system_area` VALUES ('150623', ',150000,150600,', '150600', '2016-01-25 14:31:05', '鄂托克前旗', '内蒙古鄂尔多斯市鄂托克前旗');
INSERT INTO `t_system_area` VALUES ('150624', ',150000,150600,', '150600', '2016-01-25 14:31:05', '鄂托克旗', '内蒙古鄂尔多斯市鄂托克旗');
INSERT INTO `t_system_area` VALUES ('150625', ',150000,150600,', '150600', '2016-01-25 14:31:05', '杭锦旗', '内蒙古鄂尔多斯市杭锦旗');
INSERT INTO `t_system_area` VALUES ('150626', ',150000,150600,', '150600', '2016-01-25 14:31:06', '乌审旗', '内蒙古鄂尔多斯市乌审旗');
INSERT INTO `t_system_area` VALUES ('150627', ',150000,150600,', '150600', '2016-01-25 14:31:06', '伊金霍洛旗', '内蒙古鄂尔多斯市伊金霍洛旗');
INSERT INTO `t_system_area` VALUES ('150628', ',150000,150600,', '150600', '2016-01-25 14:31:06', '其它区', '内蒙古鄂尔多斯市其它区');
INSERT INTO `t_system_area` VALUES ('150700', ',150000,', '150000', '2016-01-25 14:31:06', '呼伦贝尔市', '内蒙古呼伦贝尔市');
INSERT INTO `t_system_area` VALUES ('150702', ',150000,150700,', '150700', '2016-01-25 14:31:06', '海拉尔区', '内蒙古呼伦贝尔市海拉尔区');
INSERT INTO `t_system_area` VALUES ('150703', ',150000,150700,', '150700', '2016-01-25 14:31:06', '扎赉诺尔区', '内蒙古呼伦贝尔市扎赉诺尔区');
INSERT INTO `t_system_area` VALUES ('150721', ',150000,150700,', '150700', '2016-01-25 14:31:06', '阿荣旗', '内蒙古呼伦贝尔市阿荣旗');
INSERT INTO `t_system_area` VALUES ('150722', ',150000,150700,', '150700', '2016-01-25 14:31:06', '莫力达瓦达斡尔族自治旗', '内蒙古呼伦贝尔市莫力达瓦达斡尔族自治旗');
INSERT INTO `t_system_area` VALUES ('150723', ',150000,150700,', '150700', '2016-01-25 14:31:06', '鄂伦春自治旗', '内蒙古呼伦贝尔市鄂伦春自治旗');
INSERT INTO `t_system_area` VALUES ('150724', ',150000,150700,', '150700', '2016-01-25 14:31:06', '鄂温克族自治旗', '内蒙古呼伦贝尔市鄂温克族自治旗');
INSERT INTO `t_system_area` VALUES ('150725', ',150000,150700,', '150700', '2016-01-25 14:31:06', '陈巴尔虎旗', '内蒙古呼伦贝尔市陈巴尔虎旗');
INSERT INTO `t_system_area` VALUES ('150726', ',150000,150700,', '150700', '2016-01-25 14:31:06', '新巴尔虎左旗', '内蒙古呼伦贝尔市新巴尔虎左旗');
INSERT INTO `t_system_area` VALUES ('150727', ',150000,150700,', '150700', '2016-01-25 14:31:06', '新巴尔虎右旗', '内蒙古呼伦贝尔市新巴尔虎右旗');
INSERT INTO `t_system_area` VALUES ('150781', ',150000,150700,', '150700', '2016-01-25 14:31:06', '满洲里市', '内蒙古呼伦贝尔市满洲里市');
INSERT INTO `t_system_area` VALUES ('150782', ',150000,150700,', '150700', '2016-01-25 14:31:06', '牙克石市', '内蒙古呼伦贝尔市牙克石市');
INSERT INTO `t_system_area` VALUES ('150783', ',150000,150700,', '150700', '2016-01-25 14:31:06', '扎兰屯市', '内蒙古呼伦贝尔市扎兰屯市');
INSERT INTO `t_system_area` VALUES ('150784', ',150000,150700,', '150700', '2016-01-25 14:31:06', '额尔古纳市', '内蒙古呼伦贝尔市额尔古纳市');
INSERT INTO `t_system_area` VALUES ('150785', ',150000,150700,', '150700', '2016-01-25 14:31:06', '根河市', '内蒙古呼伦贝尔市根河市');
INSERT INTO `t_system_area` VALUES ('150786', ',150000,150700,', '150700', '2016-01-25 14:31:06', '其它区', '内蒙古呼伦贝尔市其它区');
INSERT INTO `t_system_area` VALUES ('150800', ',150000,', '150000', '2016-01-25 14:31:06', '巴彦淖尔市', '内蒙古巴彦淖尔市');
INSERT INTO `t_system_area` VALUES ('150802', ',150000,150800,', '150800', '2016-01-25 14:31:06', '临河区', '内蒙古巴彦淖尔市临河区');
INSERT INTO `t_system_area` VALUES ('150821', ',150000,150800,', '150800', '2016-01-25 14:31:06', '五原县', '内蒙古巴彦淖尔市五原县');
INSERT INTO `t_system_area` VALUES ('150822', ',150000,150800,', '150800', '2016-01-25 14:31:06', '磴口县', '内蒙古巴彦淖尔市磴口县');
INSERT INTO `t_system_area` VALUES ('150823', ',150000,150800,', '150800', '2016-01-25 14:31:06', '乌拉特前旗', '内蒙古巴彦淖尔市乌拉特前旗');
INSERT INTO `t_system_area` VALUES ('150824', ',150000,150800,', '150800', '2016-01-25 14:31:06', '乌拉特中旗', '内蒙古巴彦淖尔市乌拉特中旗');
INSERT INTO `t_system_area` VALUES ('150825', ',150000,150800,', '150800', '2016-01-25 14:31:06', '乌拉特后旗', '内蒙古巴彦淖尔市乌拉特后旗');
INSERT INTO `t_system_area` VALUES ('150826', ',150000,150800,', '150800', '2016-01-25 14:31:06', '杭锦后旗', '内蒙古巴彦淖尔市杭锦后旗');
INSERT INTO `t_system_area` VALUES ('150827', ',150000,150800,', '150800', '2016-01-25 14:31:06', '其它区', '内蒙古巴彦淖尔市其它区');
INSERT INTO `t_system_area` VALUES ('150900', ',150000,', '150000', '2016-01-25 14:31:06', '乌兰察布市', '内蒙古乌兰察布市');
INSERT INTO `t_system_area` VALUES ('150902', ',150000,150900,', '150900', '2016-01-25 14:31:06', '集宁区', '内蒙古乌兰察布市集宁区');
INSERT INTO `t_system_area` VALUES ('150921', ',150000,150900,', '150900', '2016-01-25 14:31:06', '卓资县', '内蒙古乌兰察布市卓资县');
INSERT INTO `t_system_area` VALUES ('150922', ',150000,150900,', '150900', '2016-01-25 14:31:06', '化德县', '内蒙古乌兰察布市化德县');
INSERT INTO `t_system_area` VALUES ('150923', ',150000,150900,', '150900', '2016-01-25 14:31:06', '商都县', '内蒙古乌兰察布市商都县');
INSERT INTO `t_system_area` VALUES ('150924', ',150000,150900,', '150900', '2016-01-25 14:31:06', '兴和县', '内蒙古乌兰察布市兴和县');
INSERT INTO `t_system_area` VALUES ('150925', ',150000,150900,', '150900', '2016-01-25 14:31:06', '凉城县', '内蒙古乌兰察布市凉城县');
INSERT INTO `t_system_area` VALUES ('150926', ',150000,150900,', '150900', '2016-01-25 14:31:06', '察哈尔右翼前旗', '内蒙古乌兰察布市察哈尔右翼前旗');
INSERT INTO `t_system_area` VALUES ('150927', ',150000,150900,', '150900', '2016-01-25 14:31:06', '察哈尔右翼中旗', '内蒙古乌兰察布市察哈尔右翼中旗');
INSERT INTO `t_system_area` VALUES ('150928', ',150000,150900,', '150900', '2016-01-25 14:31:06', '察哈尔右翼后旗', '内蒙古乌兰察布市察哈尔右翼后旗');
INSERT INTO `t_system_area` VALUES ('150929', ',150000,150900,', '150900', '2016-01-25 14:31:06', '四子王旗', '内蒙古乌兰察布市四子王旗');
INSERT INTO `t_system_area` VALUES ('150981', ',150000,150900,', '150900', '2016-01-25 14:31:06', '丰镇市', '内蒙古乌兰察布市丰镇市');
INSERT INTO `t_system_area` VALUES ('150982', ',150000,150900,', '150900', '2016-01-25 14:31:06', '其它区', '内蒙古乌兰察布市其它区');
INSERT INTO `t_system_area` VALUES ('152200', ',150000,', '150000', '2016-01-25 14:31:06', '兴安盟', '内蒙古兴安盟');
INSERT INTO `t_system_area` VALUES ('152201', ',150000,152200,', '152200', '2016-01-25 14:31:06', '乌兰浩特市', '内蒙古兴安盟乌兰浩特市');
INSERT INTO `t_system_area` VALUES ('152202', ',150000,152200,', '152200', '2016-01-25 14:31:06', '阿尔山市', '内蒙古兴安盟阿尔山市');
INSERT INTO `t_system_area` VALUES ('152221', ',150000,152200,', '152200', '2016-01-25 14:31:06', '科尔沁右翼前旗', '内蒙古兴安盟科尔沁右翼前旗');
INSERT INTO `t_system_area` VALUES ('152222', ',150000,152200,', '152200', '2016-01-25 14:31:06', '科尔沁右翼中旗', '内蒙古兴安盟科尔沁右翼中旗');
INSERT INTO `t_system_area` VALUES ('152223', ',150000,152200,', '152200', '2016-01-25 14:31:06', '扎赉特旗', '内蒙古兴安盟扎赉特旗');
INSERT INTO `t_system_area` VALUES ('152224', ',150000,152200,', '152200', '2016-01-25 14:31:06', '突泉县', '内蒙古兴安盟突泉县');
INSERT INTO `t_system_area` VALUES ('152225', ',150000,152200,', '152200', '2016-01-25 14:31:06', '其它区', '内蒙古兴安盟其它区');
INSERT INTO `t_system_area` VALUES ('152500', ',150000,', '150000', '2016-01-25 14:31:06', '锡林郭勒盟', '内蒙古锡林郭勒盟');
INSERT INTO `t_system_area` VALUES ('152501', ',150000,152500,', '152500', '2016-01-25 14:31:06', '二连浩特市', '内蒙古锡林郭勒盟二连浩特市');
INSERT INTO `t_system_area` VALUES ('152502', ',150000,152500,', '152500', '2016-01-25 14:31:06', '锡林浩特市', '内蒙古锡林郭勒盟锡林浩特市');
INSERT INTO `t_system_area` VALUES ('152522', ',150000,152500,', '152500', '2016-01-25 14:31:06', '阿巴嘎旗', '内蒙古锡林郭勒盟阿巴嘎旗');
INSERT INTO `t_system_area` VALUES ('152523', ',150000,152500,', '152500', '2016-01-25 14:31:06', '苏尼特左旗', '内蒙古锡林郭勒盟苏尼特左旗');
INSERT INTO `t_system_area` VALUES ('152524', ',150000,152500,', '152500', '2016-01-25 14:31:06', '苏尼特右旗', '内蒙古锡林郭勒盟苏尼特右旗');
INSERT INTO `t_system_area` VALUES ('152525', ',150000,152500,', '152500', '2016-01-25 14:31:06', '东乌珠穆沁旗', '内蒙古锡林郭勒盟东乌珠穆沁旗');
INSERT INTO `t_system_area` VALUES ('152526', ',150000,152500,', '152500', '2016-01-25 14:31:06', '西乌珠穆沁旗', '内蒙古锡林郭勒盟西乌珠穆沁旗');
INSERT INTO `t_system_area` VALUES ('152527', ',150000,152500,', '152500', '2016-01-25 14:31:06', '太仆寺旗', '内蒙古锡林郭勒盟太仆寺旗');
INSERT INTO `t_system_area` VALUES ('152528', ',150000,152500,', '152500', '2016-01-25 14:31:06', '镶黄旗', '内蒙古锡林郭勒盟镶黄旗');
INSERT INTO `t_system_area` VALUES ('152529', ',150000,152500,', '152500', '2016-01-25 14:31:06', '正镶白旗', '内蒙古锡林郭勒盟正镶白旗');
INSERT INTO `t_system_area` VALUES ('152530', ',150000,152500,', '152500', '2016-01-25 14:31:06', '正蓝旗', '内蒙古锡林郭勒盟正蓝旗');
INSERT INTO `t_system_area` VALUES ('152531', ',150000,152500,', '152500', '2016-01-25 14:31:06', '多伦县', '内蒙古锡林郭勒盟多伦县');
INSERT INTO `t_system_area` VALUES ('152532', ',150000,152500,', '152500', '2016-01-25 14:31:06', '其它区', '内蒙古锡林郭勒盟其它区');
INSERT INTO `t_system_area` VALUES ('152900', ',150000,', '150000', '2016-01-25 14:31:06', '阿拉善盟', '内蒙古阿拉善盟');
INSERT INTO `t_system_area` VALUES ('152921', ',150000,152900,', '152900', '2016-01-25 14:31:06', '阿拉善左旗', '内蒙古阿拉善盟阿拉善左旗');
INSERT INTO `t_system_area` VALUES ('152922', ',150000,152900,', '152900', '2016-01-25 14:31:06', '阿拉善右旗', '内蒙古阿拉善盟阿拉善右旗');
INSERT INTO `t_system_area` VALUES ('152923', ',150000,152900,', '152900', '2016-01-25 14:31:06', '额济纳旗', '内蒙古阿拉善盟额济纳旗');
INSERT INTO `t_system_area` VALUES ('152924', ',150000,152900,', '152900', '2016-01-25 14:31:06', '其它区', '内蒙古阿拉善盟其它区');
INSERT INTO `t_system_area` VALUES ('210000', ',', null, '2016-01-25 14:31:06', '辽宁省', '辽宁省');
INSERT INTO `t_system_area` VALUES ('210100', ',210000,', '210000', '2016-01-25 14:31:06', '沈阳市', '辽宁省沈阳市');
INSERT INTO `t_system_area` VALUES ('210102', ',210000,210100,', '210100', '2016-01-25 14:31:06', '和平区', '辽宁省沈阳市和平区');
INSERT INTO `t_system_area` VALUES ('210103', ',210000,210100,', '210100', '2016-01-25 14:31:06', '沈河区', '辽宁省沈阳市沈河区');
INSERT INTO `t_system_area` VALUES ('210104', ',210000,210100,', '210100', '2016-01-25 14:31:06', '大东区', '辽宁省沈阳市大东区');
INSERT INTO `t_system_area` VALUES ('210105', ',210000,210100,', '210100', '2016-01-25 14:31:06', '皇姑区', '辽宁省沈阳市皇姑区');
INSERT INTO `t_system_area` VALUES ('210106', ',210000,210100,', '210100', '2016-01-25 14:31:06', '铁西区', '辽宁省沈阳市铁西区');
INSERT INTO `t_system_area` VALUES ('210111', ',210000,210100,', '210100', '2016-01-25 14:31:06', '苏家屯区', '辽宁省沈阳市苏家屯区');
INSERT INTO `t_system_area` VALUES ('210112', ',210000,210100,', '210100', '2016-01-25 14:31:06', '东陵区', '辽宁省沈阳市东陵区');
INSERT INTO `t_system_area` VALUES ('210113', ',210000,210100,', '210100', '2016-01-25 14:31:06', '新城子区', '辽宁省沈阳市新城子区');
INSERT INTO `t_system_area` VALUES ('210114', ',210000,210100,', '210100', '2016-01-25 14:31:06', '于洪区', '辽宁省沈阳市于洪区');
INSERT INTO `t_system_area` VALUES ('210122', ',210000,210100,', '210100', '2016-01-25 14:31:06', '辽中县', '辽宁省沈阳市辽中县');
INSERT INTO `t_system_area` VALUES ('210123', ',210000,210100,', '210100', '2016-01-25 14:31:06', '康平县', '辽宁省沈阳市康平县');
INSERT INTO `t_system_area` VALUES ('210124', ',210000,210100,', '210100', '2016-01-25 14:31:06', '法库县', '辽宁省沈阳市法库县');
INSERT INTO `t_system_area` VALUES ('210181', ',210000,210100,', '210100', '2016-01-25 14:31:06', '新民市', '辽宁省沈阳市新民市');
INSERT INTO `t_system_area` VALUES ('210182', ',210000,210100,', '210100', '2016-01-25 14:31:06', '浑南新区', '辽宁省沈阳市浑南新区');
INSERT INTO `t_system_area` VALUES ('210183', ',210000,210100,', '210100', '2016-01-25 14:31:06', '张士开发区', '辽宁省沈阳市张士开发区');
INSERT INTO `t_system_area` VALUES ('210184', ',210000,210100,', '210100', '2016-01-25 14:31:06', '沈北新区', '辽宁省沈阳市沈北新区');
INSERT INTO `t_system_area` VALUES ('210185', ',210000,210100,', '210100', '2016-01-25 14:31:06', '其它区', '辽宁省沈阳市其它区');
INSERT INTO `t_system_area` VALUES ('210200', ',210000,', '210000', '2016-01-25 14:31:06', '大连市', '辽宁省大连市');
INSERT INTO `t_system_area` VALUES ('210202', ',210000,210200,', '210200', '2016-01-25 14:31:06', '中山区', '辽宁省大连市中山区');
INSERT INTO `t_system_area` VALUES ('210203', ',210000,210200,', '210200', '2016-01-25 14:31:06', '西岗区', '辽宁省大连市西岗区');
INSERT INTO `t_system_area` VALUES ('210204', ',210000,210200,', '210200', '2016-01-25 14:31:06', '沙河口区', '辽宁省大连市沙河口区');
INSERT INTO `t_system_area` VALUES ('210211', ',210000,210200,', '210200', '2016-01-25 14:31:06', '甘井子区', '辽宁省大连市甘井子区');
INSERT INTO `t_system_area` VALUES ('210212', ',210000,210200,', '210200', '2016-01-25 14:31:06', '旅顺口区', '辽宁省大连市旅顺口区');
INSERT INTO `t_system_area` VALUES ('210213', ',210000,210200,', '210200', '2016-01-25 14:31:06', '金州区', '辽宁省大连市金州区');
INSERT INTO `t_system_area` VALUES ('210224', ',210000,210200,', '210200', '2016-01-25 14:31:06', '长海县', '辽宁省大连市长海县');
INSERT INTO `t_system_area` VALUES ('210251', ',210000,210200,', '210200', '2016-01-25 14:31:06', '开发区', '辽宁省大连市开发区');
INSERT INTO `t_system_area` VALUES ('210281', ',210000,210200,', '210200', '2016-01-25 14:31:06', '瓦房店市', '辽宁省大连市瓦房店市');
INSERT INTO `t_system_area` VALUES ('210282', ',210000,210200,', '210200', '2016-01-25 14:31:06', '普兰店市', '辽宁省大连市普兰店市');
INSERT INTO `t_system_area` VALUES ('210283', ',210000,210200,', '210200', '2016-01-25 14:31:06', '庄河市', '辽宁省大连市庄河市');
INSERT INTO `t_system_area` VALUES ('210297', ',210000,210200,', '210200', '2016-01-25 14:31:06', '岭前区', '辽宁省大连市岭前区');
INSERT INTO `t_system_area` VALUES ('210298', ',210000,210200,', '210200', '2016-01-25 14:31:06', '其它区', '辽宁省大连市其它区');
INSERT INTO `t_system_area` VALUES ('210300', ',210000,', '210000', '2016-01-25 14:31:06', '鞍山市', '辽宁省鞍山市');
INSERT INTO `t_system_area` VALUES ('210302', ',210000,210300,', '210300', '2016-01-25 14:31:06', '铁东区', '辽宁省鞍山市铁东区');
INSERT INTO `t_system_area` VALUES ('210303', ',210000,210300,', '210300', '2016-01-25 14:31:07', '铁西区', '辽宁省鞍山市铁西区');
INSERT INTO `t_system_area` VALUES ('210304', ',210000,210300,', '210300', '2016-01-25 14:31:07', '立山区', '辽宁省鞍山市立山区');
INSERT INTO `t_system_area` VALUES ('210311', ',210000,210300,', '210300', '2016-01-25 14:31:07', '千山区', '辽宁省鞍山市千山区');
INSERT INTO `t_system_area` VALUES ('210321', ',210000,210300,', '210300', '2016-01-25 14:31:07', '台安县', '辽宁省鞍山市台安县');
INSERT INTO `t_system_area` VALUES ('210323', ',210000,210300,', '210300', '2016-01-25 14:31:07', '岫岩满族自治县', '辽宁省鞍山市岫岩满族自治县');
INSERT INTO `t_system_area` VALUES ('210351', ',210000,210300,', '210300', '2016-01-25 14:31:07', '高新区', '辽宁省鞍山市高新区');
INSERT INTO `t_system_area` VALUES ('210381', ',210000,210300,', '210300', '2016-01-25 14:31:07', '海城市', '辽宁省鞍山市海城市');
INSERT INTO `t_system_area` VALUES ('210382', ',210000,210300,', '210300', '2016-01-25 14:31:07', '其它区', '辽宁省鞍山市其它区');
INSERT INTO `t_system_area` VALUES ('210400', ',210000,', '210000', '2016-01-25 14:31:07', '抚顺市', '辽宁省抚顺市');
INSERT INTO `t_system_area` VALUES ('210402', ',210000,210400,', '210400', '2016-01-25 14:31:07', '新抚区', '辽宁省抚顺市新抚区');
INSERT INTO `t_system_area` VALUES ('210403', ',210000,210400,', '210400', '2016-01-25 14:31:07', '东洲区', '辽宁省抚顺市东洲区');
INSERT INTO `t_system_area` VALUES ('210404', ',210000,210400,', '210400', '2016-01-25 14:31:07', '望花区', '辽宁省抚顺市望花区');
INSERT INTO `t_system_area` VALUES ('210411', ',210000,210400,', '210400', '2016-01-25 14:31:07', '顺城区', '辽宁省抚顺市顺城区');
INSERT INTO `t_system_area` VALUES ('210421', ',210000,210400,', '210400', '2016-01-25 14:31:07', '抚顺县', '辽宁省抚顺市抚顺县');
INSERT INTO `t_system_area` VALUES ('210422', ',210000,210400,', '210400', '2016-01-25 14:31:07', '新宾满族自治县', '辽宁省抚顺市新宾满族自治县');
INSERT INTO `t_system_area` VALUES ('210423', ',210000,210400,', '210400', '2016-01-25 14:31:07', '清原满族自治县', '辽宁省抚顺市清原满族自治县');
INSERT INTO `t_system_area` VALUES ('210424', ',210000,210400,', '210400', '2016-01-25 14:31:07', '其它区', '辽宁省抚顺市其它区');
INSERT INTO `t_system_area` VALUES ('210500', ',210000,', '210000', '2016-01-25 14:31:07', '本溪市', '辽宁省本溪市');
INSERT INTO `t_system_area` VALUES ('210502', ',210000,210500,', '210500', '2016-01-25 14:31:07', '平山区', '辽宁省本溪市平山区');
INSERT INTO `t_system_area` VALUES ('210503', ',210000,210500,', '210500', '2016-01-25 14:31:07', '溪湖区', '辽宁省本溪市溪湖区');
INSERT INTO `t_system_area` VALUES ('210504', ',210000,210500,', '210500', '2016-01-25 14:31:07', '明山区', '辽宁省本溪市明山区');
INSERT INTO `t_system_area` VALUES ('210505', ',210000,210500,', '210500', '2016-01-25 14:31:07', '南芬区', '辽宁省本溪市南芬区');
INSERT INTO `t_system_area` VALUES ('210521', ',210000,210500,', '210500', '2016-01-25 14:31:07', '本溪满族自治县', '辽宁省本溪市本溪满族自治县');
INSERT INTO `t_system_area` VALUES ('210522', ',210000,210500,', '210500', '2016-01-25 14:31:07', '桓仁满族自治县', '辽宁省本溪市桓仁满族自治县');
INSERT INTO `t_system_area` VALUES ('210523', ',210000,210500,', '210500', '2016-01-25 14:31:07', '其它区', '辽宁省本溪市其它区');
INSERT INTO `t_system_area` VALUES ('210600', ',210000,', '210000', '2016-01-25 14:31:07', '丹东市', '辽宁省丹东市');
INSERT INTO `t_system_area` VALUES ('210602', ',210000,210600,', '210600', '2016-01-25 14:31:07', '元宝区', '辽宁省丹东市元宝区');
INSERT INTO `t_system_area` VALUES ('210603', ',210000,210600,', '210600', '2016-01-25 14:31:07', '振兴区', '辽宁省丹东市振兴区');
INSERT INTO `t_system_area` VALUES ('210604', ',210000,210600,', '210600', '2016-01-25 14:31:07', '振安区', '辽宁省丹东市振安区');
INSERT INTO `t_system_area` VALUES ('210624', ',210000,210600,', '210600', '2016-01-25 14:31:07', '宽甸满族自治县', '辽宁省丹东市宽甸满族自治县');
INSERT INTO `t_system_area` VALUES ('210681', ',210000,210600,', '210600', '2016-01-25 14:31:07', '东港市', '辽宁省丹东市东港市');
INSERT INTO `t_system_area` VALUES ('210682', ',210000,210600,', '210600', '2016-01-25 14:31:07', '凤城市', '辽宁省丹东市凤城市');
INSERT INTO `t_system_area` VALUES ('210683', ',210000,210600,', '210600', '2016-01-25 14:31:07', '其它区', '辽宁省丹东市其它区');
INSERT INTO `t_system_area` VALUES ('210700', ',210000,', '210000', '2016-01-25 14:31:07', '锦州市', '辽宁省锦州市');
INSERT INTO `t_system_area` VALUES ('210702', ',210000,210700,', '210700', '2016-01-25 14:31:07', '古塔区', '辽宁省锦州市古塔区');
INSERT INTO `t_system_area` VALUES ('210703', ',210000,210700,', '210700', '2016-01-25 14:31:07', '凌河区', '辽宁省锦州市凌河区');
INSERT INTO `t_system_area` VALUES ('210711', ',210000,210700,', '210700', '2016-01-25 14:31:07', '太和区', '辽宁省锦州市太和区');
INSERT INTO `t_system_area` VALUES ('210726', ',210000,210700,', '210700', '2016-01-25 14:31:07', '黑山县', '辽宁省锦州市黑山县');
INSERT INTO `t_system_area` VALUES ('210727', ',210000,210700,', '210700', '2016-01-25 14:31:07', '义县', '辽宁省锦州市义县');
INSERT INTO `t_system_area` VALUES ('210781', ',210000,210700,', '210700', '2016-01-25 14:31:07', '凌海市', '辽宁省锦州市凌海市');
INSERT INTO `t_system_area` VALUES ('210782', ',210000,210700,', '210700', '2016-01-25 14:31:07', '北镇市', '辽宁省锦州市北镇市');
INSERT INTO `t_system_area` VALUES ('210783', ',210000,210700,', '210700', '2016-01-25 14:31:07', '其它区', '辽宁省锦州市其它区');
INSERT INTO `t_system_area` VALUES ('210800', ',210000,', '210000', '2016-01-25 14:31:07', '营口市', '辽宁省营口市');
INSERT INTO `t_system_area` VALUES ('210802', ',210000,210800,', '210800', '2016-01-25 14:31:07', '站前区', '辽宁省营口市站前区');
INSERT INTO `t_system_area` VALUES ('210803', ',210000,210800,', '210800', '2016-01-25 14:31:07', '西市区', '辽宁省营口市西市区');
INSERT INTO `t_system_area` VALUES ('210804', ',210000,210800,', '210800', '2016-01-25 14:31:07', '鲅鱼圈区', '辽宁省营口市鲅鱼圈区');
INSERT INTO `t_system_area` VALUES ('210811', ',210000,210800,', '210800', '2016-01-25 14:31:07', '老边区', '辽宁省营口市老边区');
INSERT INTO `t_system_area` VALUES ('210881', ',210000,210800,', '210800', '2016-01-25 14:31:07', '盖州市', '辽宁省营口市盖州市');
INSERT INTO `t_system_area` VALUES ('210882', ',210000,210800,', '210800', '2016-01-25 14:31:07', '大石桥市', '辽宁省营口市大石桥市');
INSERT INTO `t_system_area` VALUES ('210883', ',210000,210800,', '210800', '2016-01-25 14:31:07', '其它区', '辽宁省营口市其它区');
INSERT INTO `t_system_area` VALUES ('210900', ',210000,', '210000', '2016-01-25 14:31:07', '阜新市', '辽宁省阜新市');
INSERT INTO `t_system_area` VALUES ('210902', ',210000,210900,', '210900', '2016-01-25 14:31:07', '海州区', '辽宁省阜新市海州区');
INSERT INTO `t_system_area` VALUES ('210903', ',210000,210900,', '210900', '2016-01-25 14:31:07', '新邱区', '辽宁省阜新市新邱区');
INSERT INTO `t_system_area` VALUES ('210904', ',210000,210900,', '210900', '2016-01-25 14:31:07', '太平区', '辽宁省阜新市太平区');
INSERT INTO `t_system_area` VALUES ('210905', ',210000,210900,', '210900', '2016-01-25 14:31:07', '清河门区', '辽宁省阜新市清河门区');
INSERT INTO `t_system_area` VALUES ('210911', ',210000,210900,', '210900', '2016-01-25 14:31:07', '细河区', '辽宁省阜新市细河区');
INSERT INTO `t_system_area` VALUES ('210921', ',210000,210900,', '210900', '2016-01-25 14:31:07', '阜新蒙古族自治县', '辽宁省阜新市阜新蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('210922', ',210000,210900,', '210900', '2016-01-25 14:31:07', '彰武县', '辽宁省阜新市彰武县');
INSERT INTO `t_system_area` VALUES ('210923', ',210000,210900,', '210900', '2016-01-25 14:31:07', '其它区', '辽宁省阜新市其它区');
INSERT INTO `t_system_area` VALUES ('211000', ',210000,', '210000', '2016-01-25 14:31:07', '辽阳市', '辽宁省辽阳市');
INSERT INTO `t_system_area` VALUES ('211002', ',210000,211000,', '211000', '2016-01-25 14:31:07', '白塔区', '辽宁省辽阳市白塔区');
INSERT INTO `t_system_area` VALUES ('211003', ',210000,211000,', '211000', '2016-01-25 14:31:07', '文圣区', '辽宁省辽阳市文圣区');
INSERT INTO `t_system_area` VALUES ('211004', ',210000,211000,', '211000', '2016-01-25 14:31:07', '宏伟区', '辽宁省辽阳市宏伟区');
INSERT INTO `t_system_area` VALUES ('211005', ',210000,211000,', '211000', '2016-01-25 14:31:07', '弓长岭区', '辽宁省辽阳市弓长岭区');
INSERT INTO `t_system_area` VALUES ('211011', ',210000,211000,', '211000', '2016-01-25 14:31:07', '太子河区', '辽宁省辽阳市太子河区');
INSERT INTO `t_system_area` VALUES ('211021', ',210000,211000,', '211000', '2016-01-25 14:31:07', '辽阳县', '辽宁省辽阳市辽阳县');
INSERT INTO `t_system_area` VALUES ('211081', ',210000,211000,', '211000', '2016-01-25 14:31:07', '灯塔市', '辽宁省辽阳市灯塔市');
INSERT INTO `t_system_area` VALUES ('211082', ',210000,211000,', '211000', '2016-01-25 14:31:07', '其它区', '辽宁省辽阳市其它区');
INSERT INTO `t_system_area` VALUES ('211100', ',210000,', '210000', '2016-01-25 14:31:07', '盘锦市', '辽宁省盘锦市');
INSERT INTO `t_system_area` VALUES ('211102', ',210000,211100,', '211100', '2016-01-25 14:31:07', '双台子区', '辽宁省盘锦市双台子区');
INSERT INTO `t_system_area` VALUES ('211103', ',210000,211100,', '211100', '2016-01-25 14:31:07', '兴隆台区', '辽宁省盘锦市兴隆台区');
INSERT INTO `t_system_area` VALUES ('211121', ',210000,211100,', '211100', '2016-01-25 14:31:07', '大洼县', '辽宁省盘锦市大洼县');
INSERT INTO `t_system_area` VALUES ('211122', ',210000,211100,', '211100', '2016-01-25 14:31:07', '盘山县', '辽宁省盘锦市盘山县');
INSERT INTO `t_system_area` VALUES ('211123', ',210000,211100,', '211100', '2016-01-25 14:31:07', '其它区', '辽宁省盘锦市其它区');
INSERT INTO `t_system_area` VALUES ('211200', ',210000,', '210000', '2016-01-25 14:31:07', '铁岭市', '辽宁省铁岭市');
INSERT INTO `t_system_area` VALUES ('211202', ',210000,211200,', '211200', '2016-01-25 14:31:07', '银州区', '辽宁省铁岭市银州区');
INSERT INTO `t_system_area` VALUES ('211204', ',210000,211200,', '211200', '2016-01-25 14:31:07', '清河区', '辽宁省铁岭市清河区');
INSERT INTO `t_system_area` VALUES ('211221', ',210000,211200,', '211200', '2016-01-25 14:31:07', '铁岭县', '辽宁省铁岭市铁岭县');
INSERT INTO `t_system_area` VALUES ('211223', ',210000,211200,', '211200', '2016-01-25 14:31:07', '西丰县', '辽宁省铁岭市西丰县');
INSERT INTO `t_system_area` VALUES ('211224', ',210000,211200,', '211200', '2016-01-25 14:31:07', '昌图县', '辽宁省铁岭市昌图县');
INSERT INTO `t_system_area` VALUES ('211281', ',210000,211200,', '211200', '2016-01-25 14:31:07', '调兵山市', '辽宁省铁岭市调兵山市');
INSERT INTO `t_system_area` VALUES ('211282', ',210000,211200,', '211200', '2016-01-25 14:31:07', '开原市', '辽宁省铁岭市开原市');
INSERT INTO `t_system_area` VALUES ('211283', ',210000,211200,', '211200', '2016-01-25 14:31:07', '其它区', '辽宁省铁岭市其它区');
INSERT INTO `t_system_area` VALUES ('211300', ',210000,', '210000', '2016-01-25 14:31:07', '朝阳市', '辽宁省朝阳市');
INSERT INTO `t_system_area` VALUES ('211302', ',210000,211300,', '211300', '2016-01-25 14:31:07', '双塔区', '辽宁省朝阳市双塔区');
INSERT INTO `t_system_area` VALUES ('211303', ',210000,211300,', '211300', '2016-01-25 14:31:07', '龙城区', '辽宁省朝阳市龙城区');
INSERT INTO `t_system_area` VALUES ('211321', ',210000,211300,', '211300', '2016-01-25 14:31:07', '朝阳县', '辽宁省朝阳市朝阳县');
INSERT INTO `t_system_area` VALUES ('211322', ',210000,211300,', '211300', '2016-01-25 14:31:07', '建平县', '辽宁省朝阳市建平县');
INSERT INTO `t_system_area` VALUES ('211324', ',210000,211300,', '211300', '2016-01-25 14:31:07', '喀喇沁左翼蒙古族自治县', '辽宁省朝阳市喀喇沁左翼蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('211381', ',210000,211300,', '211300', '2016-01-25 14:31:07', '北票市', '辽宁省朝阳市北票市');
INSERT INTO `t_system_area` VALUES ('211382', ',210000,211300,', '211300', '2016-01-25 14:31:07', '凌源市', '辽宁省朝阳市凌源市');
INSERT INTO `t_system_area` VALUES ('211383', ',210000,211300,', '211300', '2016-01-25 14:31:07', '其它区', '辽宁省朝阳市其它区');
INSERT INTO `t_system_area` VALUES ('211400', ',210000,', '210000', '2016-01-25 14:31:07', '葫芦岛市', '辽宁省葫芦岛市');
INSERT INTO `t_system_area` VALUES ('211402', ',210000,211400,', '211400', '2016-01-25 14:31:07', '连山区', '辽宁省葫芦岛市连山区');
INSERT INTO `t_system_area` VALUES ('211403', ',210000,211400,', '211400', '2016-01-25 14:31:07', '龙港区', '辽宁省葫芦岛市龙港区');
INSERT INTO `t_system_area` VALUES ('211404', ',210000,211400,', '211400', '2016-01-25 14:31:07', '南票区', '辽宁省葫芦岛市南票区');
INSERT INTO `t_system_area` VALUES ('211421', ',210000,211400,', '211400', '2016-01-25 14:31:07', '绥中县', '辽宁省葫芦岛市绥中县');
INSERT INTO `t_system_area` VALUES ('211422', ',210000,211400,', '211400', '2016-01-25 14:31:07', '建昌县', '辽宁省葫芦岛市建昌县');
INSERT INTO `t_system_area` VALUES ('211481', ',210000,211400,', '211400', '2016-01-25 14:31:07', '兴城市', '辽宁省葫芦岛市兴城市');
INSERT INTO `t_system_area` VALUES ('211482', ',210000,211400,', '211400', '2016-01-25 14:31:07', '其它区', '辽宁省葫芦岛市其它区');
INSERT INTO `t_system_area` VALUES ('220000', ',', null, '2016-01-25 14:31:07', '吉林省', '吉林省');
INSERT INTO `t_system_area` VALUES ('220100', ',220000,', '220000', '2016-01-25 14:31:07', '长春市', '吉林省长春市');
INSERT INTO `t_system_area` VALUES ('220102', ',220000,220100,', '220100', '2016-01-25 14:31:07', '南关区', '吉林省长春市南关区');
INSERT INTO `t_system_area` VALUES ('220103', ',220000,220100,', '220100', '2016-01-25 14:31:07', '宽城区', '吉林省长春市宽城区');
INSERT INTO `t_system_area` VALUES ('220104', ',220000,220100,', '220100', '2016-01-25 14:31:07', '朝阳区', '吉林省长春市朝阳区');
INSERT INTO `t_system_area` VALUES ('220105', ',220000,220100,', '220100', '2016-01-25 14:31:07', '二道区', '吉林省长春市二道区');
INSERT INTO `t_system_area` VALUES ('220106', ',220000,220100,', '220100', '2016-01-25 14:31:08', '绿园区', '吉林省长春市绿园区');
INSERT INTO `t_system_area` VALUES ('220112', ',220000,220100,', '220100', '2016-01-25 14:31:08', '双阳区', '吉林省长春市双阳区');
INSERT INTO `t_system_area` VALUES ('220122', ',220000,220100,', '220100', '2016-01-25 14:31:08', '农安县', '吉林省长春市农安县');
INSERT INTO `t_system_area` VALUES ('220181', ',220000,220100,', '220100', '2016-01-25 14:31:08', '九台市', '吉林省长春市九台市');
INSERT INTO `t_system_area` VALUES ('220182', ',220000,220100,', '220100', '2016-01-25 14:31:08', '榆树市', '吉林省长春市榆树市');
INSERT INTO `t_system_area` VALUES ('220183', ',220000,220100,', '220100', '2016-01-25 14:31:08', '德惠市', '吉林省长春市德惠市');
INSERT INTO `t_system_area` VALUES ('220184', ',220000,220100,', '220100', '2016-01-25 14:31:08', '高新技术产业开发区', '吉林省长春市高新技术产业开发区');
INSERT INTO `t_system_area` VALUES ('220185', ',220000,220100,', '220100', '2016-01-25 14:31:08', '汽车产业开发区', '吉林省长春市汽车产业开发区');
INSERT INTO `t_system_area` VALUES ('220186', ',220000,220100,', '220100', '2016-01-25 14:31:08', '经济技术开发区', '吉林省长春市经济技术开发区');
INSERT INTO `t_system_area` VALUES ('220187', ',220000,220100,', '220100', '2016-01-25 14:31:08', '净月旅游开发区', '吉林省长春市净月旅游开发区');
INSERT INTO `t_system_area` VALUES ('220188', ',220000,220100,', '220100', '2016-01-25 14:31:08', '其它区', '吉林省长春市其它区');
INSERT INTO `t_system_area` VALUES ('220200', ',220000,', '220000', '2016-01-25 14:31:08', '吉林市', '吉林省吉林市');
INSERT INTO `t_system_area` VALUES ('220202', ',220000,220200,', '220200', '2016-01-25 14:31:08', '昌邑区', '吉林省吉林市昌邑区');
INSERT INTO `t_system_area` VALUES ('220203', ',220000,220200,', '220200', '2016-01-25 14:31:08', '龙潭区', '吉林省吉林市龙潭区');
INSERT INTO `t_system_area` VALUES ('220204', ',220000,220200,', '220200', '2016-01-25 14:31:08', '船营区', '吉林省吉林市船营区');
INSERT INTO `t_system_area` VALUES ('220211', ',220000,220200,', '220200', '2016-01-25 14:31:08', '丰满区', '吉林省吉林市丰满区');
INSERT INTO `t_system_area` VALUES ('220221', ',220000,220200,', '220200', '2016-01-25 14:31:08', '永吉县', '吉林省吉林市永吉县');
INSERT INTO `t_system_area` VALUES ('220281', ',220000,220200,', '220200', '2016-01-25 14:31:08', '蛟河市', '吉林省吉林市蛟河市');
INSERT INTO `t_system_area` VALUES ('220282', ',220000,220200,', '220200', '2016-01-25 14:31:08', '桦甸市', '吉林省吉林市桦甸市');
INSERT INTO `t_system_area` VALUES ('220283', ',220000,220200,', '220200', '2016-01-25 14:31:08', '舒兰市', '吉林省吉林市舒兰市');
INSERT INTO `t_system_area` VALUES ('220284', ',220000,220200,', '220200', '2016-01-25 14:31:08', '磐石市', '吉林省吉林市磐石市');
INSERT INTO `t_system_area` VALUES ('220285', ',220000,220200,', '220200', '2016-01-25 14:31:08', '其它区', '吉林省吉林市其它区');
INSERT INTO `t_system_area` VALUES ('220300', ',220000,', '220000', '2016-01-25 14:31:08', '四平市', '吉林省四平市');
INSERT INTO `t_system_area` VALUES ('220302', ',220000,220300,', '220300', '2016-01-25 14:31:08', '铁西区', '吉林省四平市铁西区');
INSERT INTO `t_system_area` VALUES ('220303', ',220000,220300,', '220300', '2016-01-25 14:31:08', '铁东区', '吉林省四平市铁东区');
INSERT INTO `t_system_area` VALUES ('220322', ',220000,220300,', '220300', '2016-01-25 14:31:08', '梨树县', '吉林省四平市梨树县');
INSERT INTO `t_system_area` VALUES ('220323', ',220000,220300,', '220300', '2016-01-25 14:31:08', '伊通满族自治县', '吉林省四平市伊通满族自治县');
INSERT INTO `t_system_area` VALUES ('220381', ',220000,220300,', '220300', '2016-01-25 14:31:08', '公主岭市', '吉林省四平市公主岭市');
INSERT INTO `t_system_area` VALUES ('220382', ',220000,220300,', '220300', '2016-01-25 14:31:08', '双辽市', '吉林省四平市双辽市');
INSERT INTO `t_system_area` VALUES ('220383', ',220000,220300,', '220300', '2016-01-25 14:31:08', '其它区', '吉林省四平市其它区');
INSERT INTO `t_system_area` VALUES ('220400', ',220000,', '220000', '2016-01-25 14:31:08', '辽源市', '吉林省辽源市');
INSERT INTO `t_system_area` VALUES ('220402', ',220000,220400,', '220400', '2016-01-25 14:31:08', '龙山区', '吉林省辽源市龙山区');
INSERT INTO `t_system_area` VALUES ('220403', ',220000,220400,', '220400', '2016-01-25 14:31:08', '西安区', '吉林省辽源市西安区');
INSERT INTO `t_system_area` VALUES ('220421', ',220000,220400,', '220400', '2016-01-25 14:31:08', '东丰县', '吉林省辽源市东丰县');
INSERT INTO `t_system_area` VALUES ('220422', ',220000,220400,', '220400', '2016-01-25 14:31:08', '东辽县', '吉林省辽源市东辽县');
INSERT INTO `t_system_area` VALUES ('220423', ',220000,220400,', '220400', '2016-01-25 14:31:08', '其它区', '吉林省辽源市其它区');
INSERT INTO `t_system_area` VALUES ('220500', ',220000,', '220000', '2016-01-25 14:31:08', '通化市', '吉林省通化市');
INSERT INTO `t_system_area` VALUES ('220502', ',220000,220500,', '220500', '2016-01-25 14:31:08', '东昌区', '吉林省通化市东昌区');
INSERT INTO `t_system_area` VALUES ('220503', ',220000,220500,', '220500', '2016-01-25 14:31:08', '二道江区', '吉林省通化市二道江区');
INSERT INTO `t_system_area` VALUES ('220521', ',220000,220500,', '220500', '2016-01-25 14:31:08', '通化县', '吉林省通化市通化县');
INSERT INTO `t_system_area` VALUES ('220523', ',220000,220500,', '220500', '2016-01-25 14:31:08', '辉南县', '吉林省通化市辉南县');
INSERT INTO `t_system_area` VALUES ('220524', ',220000,220500,', '220500', '2016-01-25 14:31:08', '柳河县', '吉林省通化市柳河县');
INSERT INTO `t_system_area` VALUES ('220581', ',220000,220500,', '220500', '2016-01-25 14:31:08', '梅河口市', '吉林省通化市梅河口市');
INSERT INTO `t_system_area` VALUES ('220582', ',220000,220500,', '220500', '2016-01-25 14:31:08', '集安市', '吉林省通化市集安市');
INSERT INTO `t_system_area` VALUES ('220583', ',220000,220500,', '220500', '2016-01-25 14:31:08', '其它区', '吉林省通化市其它区');
INSERT INTO `t_system_area` VALUES ('220600', ',220000,', '220000', '2016-01-25 14:31:08', '白山市', '吉林省白山市');
INSERT INTO `t_system_area` VALUES ('220602', ',220000,220600,', '220600', '2016-01-25 14:31:08', '浑江区', '吉林省白山市浑江区');
INSERT INTO `t_system_area` VALUES ('220621', ',220000,220600,', '220600', '2016-01-25 14:31:08', '抚松县', '吉林省白山市抚松县');
INSERT INTO `t_system_area` VALUES ('220622', ',220000,220600,', '220600', '2016-01-25 14:31:08', '靖宇县', '吉林省白山市靖宇县');
INSERT INTO `t_system_area` VALUES ('220623', ',220000,220600,', '220600', '2016-01-25 14:31:08', '长白朝鲜族自治县', '吉林省白山市长白朝鲜族自治县');
INSERT INTO `t_system_area` VALUES ('220625', ',220000,220600,', '220600', '2016-01-25 14:31:08', '江源区', '吉林省白山市江源区');
INSERT INTO `t_system_area` VALUES ('220681', ',220000,220600,', '220600', '2016-01-25 14:31:08', '临江市', '吉林省白山市临江市');
INSERT INTO `t_system_area` VALUES ('220682', ',220000,220600,', '220600', '2016-01-25 14:31:08', '其它区', '吉林省白山市其它区');
INSERT INTO `t_system_area` VALUES ('220700', ',220000,', '220000', '2016-01-25 14:31:08', '松原市', '吉林省松原市');
INSERT INTO `t_system_area` VALUES ('220702', ',220000,220700,', '220700', '2016-01-25 14:31:08', '宁江区', '吉林省松原市宁江区');
INSERT INTO `t_system_area` VALUES ('220721', ',220000,220700,', '220700', '2016-01-25 14:31:08', '前郭尔罗斯蒙古族自治县', '吉林省松原市前郭尔罗斯蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('220722', ',220000,220700,', '220700', '2016-01-25 14:31:08', '长岭县', '吉林省松原市长岭县');
INSERT INTO `t_system_area` VALUES ('220723', ',220000,220700,', '220700', '2016-01-25 14:31:08', '乾安县', '吉林省松原市乾安县');
INSERT INTO `t_system_area` VALUES ('220724', ',220000,220700,', '220700', '2016-01-25 14:31:08', '扶余市', '吉林省松原市扶余市');
INSERT INTO `t_system_area` VALUES ('220725', ',220000,220700,', '220700', '2016-01-25 14:31:08', '其它区', '吉林省松原市其它区');
INSERT INTO `t_system_area` VALUES ('220800', ',220000,', '220000', '2016-01-25 14:31:08', '白城市', '吉林省白城市');
INSERT INTO `t_system_area` VALUES ('220802', ',220000,220800,', '220800', '2016-01-25 14:31:08', '洮北区', '吉林省白城市洮北区');
INSERT INTO `t_system_area` VALUES ('220821', ',220000,220800,', '220800', '2016-01-25 14:31:08', '镇赉县', '吉林省白城市镇赉县');
INSERT INTO `t_system_area` VALUES ('220822', ',220000,220800,', '220800', '2016-01-25 14:31:08', '通榆县', '吉林省白城市通榆县');
INSERT INTO `t_system_area` VALUES ('220881', ',220000,220800,', '220800', '2016-01-25 14:31:08', '洮南市', '吉林省白城市洮南市');
INSERT INTO `t_system_area` VALUES ('220882', ',220000,220800,', '220800', '2016-01-25 14:31:08', '大安市', '吉林省白城市大安市');
INSERT INTO `t_system_area` VALUES ('220883', ',220000,220800,', '220800', '2016-01-25 14:31:08', '其它区', '吉林省白城市其它区');
INSERT INTO `t_system_area` VALUES ('222400', ',220000,', '220000', '2016-01-25 14:31:08', '延边朝鲜族自治州', '吉林省延边朝鲜族自治州');
INSERT INTO `t_system_area` VALUES ('222401', ',220000,222400,', '222400', '2016-01-25 14:31:08', '延吉市', '吉林省延边朝鲜族自治州延吉市');
INSERT INTO `t_system_area` VALUES ('222402', ',220000,222400,', '222400', '2016-01-25 14:31:08', '图们市', '吉林省延边朝鲜族自治州图们市');
INSERT INTO `t_system_area` VALUES ('222403', ',220000,222400,', '222400', '2016-01-25 14:31:08', '敦化市', '吉林省延边朝鲜族自治州敦化市');
INSERT INTO `t_system_area` VALUES ('222404', ',220000,222400,', '222400', '2016-01-25 14:31:08', '珲春市', '吉林省延边朝鲜族自治州珲春市');
INSERT INTO `t_system_area` VALUES ('222405', ',220000,222400,', '222400', '2016-01-25 14:31:08', '龙井市', '吉林省延边朝鲜族自治州龙井市');
INSERT INTO `t_system_area` VALUES ('222406', ',220000,222400,', '222400', '2016-01-25 14:31:08', '和龙市', '吉林省延边朝鲜族自治州和龙市');
INSERT INTO `t_system_area` VALUES ('222424', ',220000,222400,', '222400', '2016-01-25 14:31:08', '汪清县', '吉林省延边朝鲜族自治州汪清县');
INSERT INTO `t_system_area` VALUES ('222426', ',220000,222400,', '222400', '2016-01-25 14:31:08', '安图县', '吉林省延边朝鲜族自治州安图县');
INSERT INTO `t_system_area` VALUES ('222427', ',220000,222400,', '222400', '2016-01-25 14:31:08', '其它区', '吉林省延边朝鲜族自治州其它区');
INSERT INTO `t_system_area` VALUES ('230000', ',', null, '2016-01-25 14:31:08', '黑龙江省', '黑龙江省');
INSERT INTO `t_system_area` VALUES ('230100', ',230000,', '230000', '2016-01-25 14:31:08', '哈尔滨市', '黑龙江省哈尔滨市');
INSERT INTO `t_system_area` VALUES ('230102', ',230000,230100,', '230100', '2016-01-25 14:31:08', '道里区', '黑龙江省哈尔滨市道里区');
INSERT INTO `t_system_area` VALUES ('230103', ',230000,230100,', '230100', '2016-01-25 14:31:08', '南岗区', '黑龙江省哈尔滨市南岗区');
INSERT INTO `t_system_area` VALUES ('230104', ',230000,230100,', '230100', '2016-01-25 14:31:08', '道外区', '黑龙江省哈尔滨市道外区');
INSERT INTO `t_system_area` VALUES ('230106', ',230000,230100,', '230100', '2016-01-25 14:31:08', '香坊区', '黑龙江省哈尔滨市香坊区');
INSERT INTO `t_system_area` VALUES ('230107', ',230000,230100,', '230100', '2016-01-25 14:31:08', '动力区', '黑龙江省哈尔滨市动力区');
INSERT INTO `t_system_area` VALUES ('230108', ',230000,230100,', '230100', '2016-01-25 14:31:08', '平房区', '黑龙江省哈尔滨市平房区');
INSERT INTO `t_system_area` VALUES ('230109', ',230000,230100,', '230100', '2016-01-25 14:31:08', '松北区', '黑龙江省哈尔滨市松北区');
INSERT INTO `t_system_area` VALUES ('230111', ',230000,230100,', '230100', '2016-01-25 14:31:08', '呼兰区', '黑龙江省哈尔滨市呼兰区');
INSERT INTO `t_system_area` VALUES ('230123', ',230000,230100,', '230100', '2016-01-25 14:31:08', '依兰县', '黑龙江省哈尔滨市依兰县');
INSERT INTO `t_system_area` VALUES ('230124', ',230000,230100,', '230100', '2016-01-25 14:31:08', '方正县', '黑龙江省哈尔滨市方正县');
INSERT INTO `t_system_area` VALUES ('230125', ',230000,230100,', '230100', '2016-01-25 14:31:08', '宾县', '黑龙江省哈尔滨市宾县');
INSERT INTO `t_system_area` VALUES ('230126', ',230000,230100,', '230100', '2016-01-25 14:31:08', '巴彦县', '黑龙江省哈尔滨市巴彦县');
INSERT INTO `t_system_area` VALUES ('230127', ',230000,230100,', '230100', '2016-01-25 14:31:08', '木兰县', '黑龙江省哈尔滨市木兰县');
INSERT INTO `t_system_area` VALUES ('230128', ',230000,230100,', '230100', '2016-01-25 14:31:08', '通河县', '黑龙江省哈尔滨市通河县');
INSERT INTO `t_system_area` VALUES ('230129', ',230000,230100,', '230100', '2016-01-25 14:31:08', '延寿县', '黑龙江省哈尔滨市延寿县');
INSERT INTO `t_system_area` VALUES ('230181', ',230000,230100,', '230100', '2016-01-25 14:31:08', '阿城区', '黑龙江省哈尔滨市阿城区');
INSERT INTO `t_system_area` VALUES ('230182', ',230000,230100,', '230100', '2016-01-25 14:31:08', '双城市', '黑龙江省哈尔滨市双城市');
INSERT INTO `t_system_area` VALUES ('230183', ',230000,230100,', '230100', '2016-01-25 14:31:08', '尚志市', '黑龙江省哈尔滨市尚志市');
INSERT INTO `t_system_area` VALUES ('230184', ',230000,230100,', '230100', '2016-01-25 14:31:08', '五常市', '黑龙江省哈尔滨市五常市');
INSERT INTO `t_system_area` VALUES ('230185', ',230000,230100,', '230100', '2016-01-25 14:31:08', '阿城市', '黑龙江省哈尔滨市阿城市');
INSERT INTO `t_system_area` VALUES ('230186', ',230000,230100,', '230100', '2016-01-25 14:31:08', '其它区', '黑龙江省哈尔滨市其它区');
INSERT INTO `t_system_area` VALUES ('230200', ',230000,', '230000', '2016-01-25 14:31:08', '齐齐哈尔市', '黑龙江省齐齐哈尔市');
INSERT INTO `t_system_area` VALUES ('230202', ',230000,230200,', '230200', '2016-01-25 14:31:08', '龙沙区', '黑龙江省齐齐哈尔市龙沙区');
INSERT INTO `t_system_area` VALUES ('230203', ',230000,230200,', '230200', '2016-01-25 14:31:08', '建华区', '黑龙江省齐齐哈尔市建华区');
INSERT INTO `t_system_area` VALUES ('230204', ',230000,230200,', '230200', '2016-01-25 14:31:08', '铁锋区', '黑龙江省齐齐哈尔市铁锋区');
INSERT INTO `t_system_area` VALUES ('230205', ',230000,230200,', '230200', '2016-01-25 14:31:08', '昂昂溪区', '黑龙江省齐齐哈尔市昂昂溪区');
INSERT INTO `t_system_area` VALUES ('230206', ',230000,230200,', '230200', '2016-01-25 14:31:09', '富拉尔基区', '黑龙江省齐齐哈尔市富拉尔基区');
INSERT INTO `t_system_area` VALUES ('230207', ',230000,230200,', '230200', '2016-01-25 14:31:09', '碾子山区', '黑龙江省齐齐哈尔市碾子山区');
INSERT INTO `t_system_area` VALUES ('230208', ',230000,230200,', '230200', '2016-01-25 14:31:09', '梅里斯达斡尔族区', '黑龙江省齐齐哈尔市梅里斯达斡尔族区');
INSERT INTO `t_system_area` VALUES ('230221', ',230000,230200,', '230200', '2016-01-25 14:31:09', '龙江县', '黑龙江省齐齐哈尔市龙江县');
INSERT INTO `t_system_area` VALUES ('230223', ',230000,230200,', '230200', '2016-01-25 14:31:09', '依安县', '黑龙江省齐齐哈尔市依安县');
INSERT INTO `t_system_area` VALUES ('230224', ',230000,230200,', '230200', '2016-01-25 14:31:09', '泰来县', '黑龙江省齐齐哈尔市泰来县');
INSERT INTO `t_system_area` VALUES ('230225', ',230000,230200,', '230200', '2016-01-25 14:31:09', '甘南县', '黑龙江省齐齐哈尔市甘南县');
INSERT INTO `t_system_area` VALUES ('230227', ',230000,230200,', '230200', '2016-01-25 14:31:09', '富裕县', '黑龙江省齐齐哈尔市富裕县');
INSERT INTO `t_system_area` VALUES ('230229', ',230000,230200,', '230200', '2016-01-25 14:31:09', '克山县', '黑龙江省齐齐哈尔市克山县');
INSERT INTO `t_system_area` VALUES ('230230', ',230000,230200,', '230200', '2016-01-25 14:31:09', '克东县', '黑龙江省齐齐哈尔市克东县');
INSERT INTO `t_system_area` VALUES ('230231', ',230000,230200,', '230200', '2016-01-25 14:31:09', '拜泉县', '黑龙江省齐齐哈尔市拜泉县');
INSERT INTO `t_system_area` VALUES ('230281', ',230000,230200,', '230200', '2016-01-25 14:31:09', '讷河市', '黑龙江省齐齐哈尔市讷河市');
INSERT INTO `t_system_area` VALUES ('230282', ',230000,230200,', '230200', '2016-01-25 14:31:09', '其它区', '黑龙江省齐齐哈尔市其它区');
INSERT INTO `t_system_area` VALUES ('230300', ',230000,', '230000', '2016-01-25 14:31:09', '鸡西市', '黑龙江省鸡西市');
INSERT INTO `t_system_area` VALUES ('230302', ',230000,230300,', '230300', '2016-01-25 14:31:09', '鸡冠区', '黑龙江省鸡西市鸡冠区');
INSERT INTO `t_system_area` VALUES ('230303', ',230000,230300,', '230300', '2016-01-25 14:31:09', '恒山区', '黑龙江省鸡西市恒山区');
INSERT INTO `t_system_area` VALUES ('230304', ',230000,230300,', '230300', '2016-01-25 14:31:09', '滴道区', '黑龙江省鸡西市滴道区');
INSERT INTO `t_system_area` VALUES ('230305', ',230000,230300,', '230300', '2016-01-25 14:31:09', '梨树区', '黑龙江省鸡西市梨树区');
INSERT INTO `t_system_area` VALUES ('230306', ',230000,230300,', '230300', '2016-01-25 14:31:09', '城子河区', '黑龙江省鸡西市城子河区');
INSERT INTO `t_system_area` VALUES ('230307', ',230000,230300,', '230300', '2016-01-25 14:31:09', '麻山区', '黑龙江省鸡西市麻山区');
INSERT INTO `t_system_area` VALUES ('230321', ',230000,230300,', '230300', '2016-01-25 14:31:09', '鸡东县', '黑龙江省鸡西市鸡东县');
INSERT INTO `t_system_area` VALUES ('230381', ',230000,230300,', '230300', '2016-01-25 14:31:09', '虎林市', '黑龙江省鸡西市虎林市');
INSERT INTO `t_system_area` VALUES ('230382', ',230000,230300,', '230300', '2016-01-25 14:31:09', '密山市', '黑龙江省鸡西市密山市');
INSERT INTO `t_system_area` VALUES ('230383', ',230000,230300,', '230300', '2016-01-25 14:31:09', '其它区', '黑龙江省鸡西市其它区');
INSERT INTO `t_system_area` VALUES ('230400', ',230000,', '230000', '2016-01-25 14:31:09', '鹤岗市', '黑龙江省鹤岗市');
INSERT INTO `t_system_area` VALUES ('230402', ',230000,230400,', '230400', '2016-01-25 14:31:09', '向阳区', '黑龙江省鹤岗市向阳区');
INSERT INTO `t_system_area` VALUES ('230403', ',230000,230400,', '230400', '2016-01-25 14:31:09', '工农区', '黑龙江省鹤岗市工农区');
INSERT INTO `t_system_area` VALUES ('230404', ',230000,230400,', '230400', '2016-01-25 14:31:09', '南山区', '黑龙江省鹤岗市南山区');
INSERT INTO `t_system_area` VALUES ('230405', ',230000,230400,', '230400', '2016-01-25 14:31:09', '兴安区', '黑龙江省鹤岗市兴安区');
INSERT INTO `t_system_area` VALUES ('230406', ',230000,230400,', '230400', '2016-01-25 14:31:09', '东山区', '黑龙江省鹤岗市东山区');
INSERT INTO `t_system_area` VALUES ('230407', ',230000,230400,', '230400', '2016-01-25 14:31:09', '兴山区', '黑龙江省鹤岗市兴山区');
INSERT INTO `t_system_area` VALUES ('230421', ',230000,230400,', '230400', '2016-01-25 14:31:09', '萝北县', '黑龙江省鹤岗市萝北县');
INSERT INTO `t_system_area` VALUES ('230422', ',230000,230400,', '230400', '2016-01-25 14:31:09', '绥滨县', '黑龙江省鹤岗市绥滨县');
INSERT INTO `t_system_area` VALUES ('230423', ',230000,230400,', '230400', '2016-01-25 14:31:09', '其它区', '黑龙江省鹤岗市其它区');
INSERT INTO `t_system_area` VALUES ('230500', ',230000,', '230000', '2016-01-25 14:31:09', '双鸭山市', '黑龙江省双鸭山市');
INSERT INTO `t_system_area` VALUES ('230502', ',230000,230500,', '230500', '2016-01-25 14:31:09', '尖山区', '黑龙江省双鸭山市尖山区');
INSERT INTO `t_system_area` VALUES ('230503', ',230000,230500,', '230500', '2016-01-25 14:31:09', '岭东区', '黑龙江省双鸭山市岭东区');
INSERT INTO `t_system_area` VALUES ('230505', ',230000,230500,', '230500', '2016-01-25 14:31:09', '四方台区', '黑龙江省双鸭山市四方台区');
INSERT INTO `t_system_area` VALUES ('230506', ',230000,230500,', '230500', '2016-01-25 14:31:09', '宝山区', '黑龙江省双鸭山市宝山区');
INSERT INTO `t_system_area` VALUES ('230521', ',230000,230500,', '230500', '2016-01-25 14:31:09', '集贤县', '黑龙江省双鸭山市集贤县');
INSERT INTO `t_system_area` VALUES ('230522', ',230000,230500,', '230500', '2016-01-25 14:31:09', '友谊县', '黑龙江省双鸭山市友谊县');
INSERT INTO `t_system_area` VALUES ('230523', ',230000,230500,', '230500', '2016-01-25 14:31:09', '宝清县', '黑龙江省双鸭山市宝清县');
INSERT INTO `t_system_area` VALUES ('230524', ',230000,230500,', '230500', '2016-01-25 14:31:09', '饶河县', '黑龙江省双鸭山市饶河县');
INSERT INTO `t_system_area` VALUES ('230525', ',230000,230500,', '230500', '2016-01-25 14:31:09', '其它区', '黑龙江省双鸭山市其它区');
INSERT INTO `t_system_area` VALUES ('230600', ',230000,', '230000', '2016-01-25 14:31:09', '大庆市', '黑龙江省大庆市');
INSERT INTO `t_system_area` VALUES ('230602', ',230000,230600,', '230600', '2016-01-25 14:31:09', '萨尔图区', '黑龙江省大庆市萨尔图区');
INSERT INTO `t_system_area` VALUES ('230603', ',230000,230600,', '230600', '2016-01-25 14:31:09', '龙凤区', '黑龙江省大庆市龙凤区');
INSERT INTO `t_system_area` VALUES ('230604', ',230000,230600,', '230600', '2016-01-25 14:31:09', '让胡路区', '黑龙江省大庆市让胡路区');
INSERT INTO `t_system_area` VALUES ('230605', ',230000,230600,', '230600', '2016-01-25 14:31:09', '红岗区', '黑龙江省大庆市红岗区');
INSERT INTO `t_system_area` VALUES ('230606', ',230000,230600,', '230600', '2016-01-25 14:31:09', '大同区', '黑龙江省大庆市大同区');
INSERT INTO `t_system_area` VALUES ('230621', ',230000,230600,', '230600', '2016-01-25 14:31:09', '肇州县', '黑龙江省大庆市肇州县');
INSERT INTO `t_system_area` VALUES ('230622', ',230000,230600,', '230600', '2016-01-25 14:31:09', '肇源县', '黑龙江省大庆市肇源县');
INSERT INTO `t_system_area` VALUES ('230623', ',230000,230600,', '230600', '2016-01-25 14:31:09', '林甸县', '黑龙江省大庆市林甸县');
INSERT INTO `t_system_area` VALUES ('230624', ',230000,230600,', '230600', '2016-01-25 14:31:09', '杜尔伯特蒙古族自治县', '黑龙江省大庆市杜尔伯特蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('230625', ',230000,230600,', '230600', '2016-01-25 14:31:09', '其它区', '黑龙江省大庆市其它区');
INSERT INTO `t_system_area` VALUES ('230700', ',230000,', '230000', '2016-01-25 14:31:09', '伊春市', '黑龙江省伊春市');
INSERT INTO `t_system_area` VALUES ('230702', ',230000,230700,', '230700', '2016-01-25 14:31:09', '伊春区', '黑龙江省伊春市伊春区');
INSERT INTO `t_system_area` VALUES ('230703', ',230000,230700,', '230700', '2016-01-25 14:31:09', '南岔区', '黑龙江省伊春市南岔区');
INSERT INTO `t_system_area` VALUES ('230704', ',230000,230700,', '230700', '2016-01-25 14:31:09', '友好区', '黑龙江省伊春市友好区');
INSERT INTO `t_system_area` VALUES ('230705', ',230000,230700,', '230700', '2016-01-25 14:31:09', '西林区', '黑龙江省伊春市西林区');
INSERT INTO `t_system_area` VALUES ('230706', ',230000,230700,', '230700', '2016-01-25 14:31:09', '翠峦区', '黑龙江省伊春市翠峦区');
INSERT INTO `t_system_area` VALUES ('230707', ',230000,230700,', '230700', '2016-01-25 14:31:09', '新青区', '黑龙江省伊春市新青区');
INSERT INTO `t_system_area` VALUES ('230708', ',230000,230700,', '230700', '2016-01-25 14:31:09', '美溪区', '黑龙江省伊春市美溪区');
INSERT INTO `t_system_area` VALUES ('230709', ',230000,230700,', '230700', '2016-01-25 14:31:09', '金山屯区', '黑龙江省伊春市金山屯区');
INSERT INTO `t_system_area` VALUES ('230710', ',230000,230700,', '230700', '2016-01-25 14:31:09', '五营区', '黑龙江省伊春市五营区');
INSERT INTO `t_system_area` VALUES ('230711', ',230000,230700,', '230700', '2016-01-25 14:31:09', '乌马河区', '黑龙江省伊春市乌马河区');
INSERT INTO `t_system_area` VALUES ('230712', ',230000,230700,', '230700', '2016-01-25 14:31:09', '汤旺河区', '黑龙江省伊春市汤旺河区');
INSERT INTO `t_system_area` VALUES ('230713', ',230000,230700,', '230700', '2016-01-25 14:31:09', '带岭区', '黑龙江省伊春市带岭区');
INSERT INTO `t_system_area` VALUES ('230714', ',230000,230700,', '230700', '2016-01-25 14:31:09', '乌伊岭区', '黑龙江省伊春市乌伊岭区');
INSERT INTO `t_system_area` VALUES ('230715', ',230000,230700,', '230700', '2016-01-25 14:31:09', '红星区', '黑龙江省伊春市红星区');
INSERT INTO `t_system_area` VALUES ('230716', ',230000,230700,', '230700', '2016-01-25 14:31:09', '上甘岭区', '黑龙江省伊春市上甘岭区');
INSERT INTO `t_system_area` VALUES ('230722', ',230000,230700,', '230700', '2016-01-25 14:31:09', '嘉荫县', '黑龙江省伊春市嘉荫县');
INSERT INTO `t_system_area` VALUES ('230781', ',230000,230700,', '230700', '2016-01-25 14:31:09', '铁力市', '黑龙江省伊春市铁力市');
INSERT INTO `t_system_area` VALUES ('230782', ',230000,230700,', '230700', '2016-01-25 14:31:09', '其它区', '黑龙江省伊春市其它区');
INSERT INTO `t_system_area` VALUES ('230800', ',230000,', '230000', '2016-01-25 14:31:09', '佳木斯市', '黑龙江省佳木斯市');
INSERT INTO `t_system_area` VALUES ('230802', ',230000,230800,', '230800', '2016-01-25 14:31:09', '永红区', '黑龙江省佳木斯市永红区');
INSERT INTO `t_system_area` VALUES ('230803', ',230000,230800,', '230800', '2016-01-25 14:31:09', '向阳区', '黑龙江省佳木斯市向阳区');
INSERT INTO `t_system_area` VALUES ('230804', ',230000,230800,', '230800', '2016-01-25 14:31:09', '前进区', '黑龙江省佳木斯市前进区');
INSERT INTO `t_system_area` VALUES ('230805', ',230000,230800,', '230800', '2016-01-25 14:31:09', '东风区', '黑龙江省佳木斯市东风区');
INSERT INTO `t_system_area` VALUES ('230811', ',230000,230800,', '230800', '2016-01-25 14:31:09', '郊区', '黑龙江省佳木斯市郊区');
INSERT INTO `t_system_area` VALUES ('230822', ',230000,230800,', '230800', '2016-01-25 14:31:09', '桦南县', '黑龙江省佳木斯市桦南县');
INSERT INTO `t_system_area` VALUES ('230826', ',230000,230800,', '230800', '2016-01-25 14:31:09', '桦川县', '黑龙江省佳木斯市桦川县');
INSERT INTO `t_system_area` VALUES ('230828', ',230000,230800,', '230800', '2016-01-25 14:31:09', '汤原县', '黑龙江省佳木斯市汤原县');
INSERT INTO `t_system_area` VALUES ('230833', ',230000,230800,', '230800', '2016-01-25 14:31:09', '抚远县', '黑龙江省佳木斯市抚远县');
INSERT INTO `t_system_area` VALUES ('230881', ',230000,230800,', '230800', '2016-01-25 14:31:09', '同江市', '黑龙江省佳木斯市同江市');
INSERT INTO `t_system_area` VALUES ('230882', ',230000,230800,', '230800', '2016-01-25 14:31:09', '富锦市', '黑龙江省佳木斯市富锦市');
INSERT INTO `t_system_area` VALUES ('230883', ',230000,230800,', '230800', '2016-01-25 14:31:09', '其它区', '黑龙江省佳木斯市其它区');
INSERT INTO `t_system_area` VALUES ('230900', ',230000,', '230000', '2016-01-25 14:31:09', '七台河市', '黑龙江省七台河市');
INSERT INTO `t_system_area` VALUES ('230902', ',230000,230900,', '230900', '2016-01-25 14:31:09', '新兴区', '黑龙江省七台河市新兴区');
INSERT INTO `t_system_area` VALUES ('230903', ',230000,230900,', '230900', '2016-01-25 14:31:09', '桃山区', '黑龙江省七台河市桃山区');
INSERT INTO `t_system_area` VALUES ('230904', ',230000,230900,', '230900', '2016-01-25 14:31:09', '茄子河区', '黑龙江省七台河市茄子河区');
INSERT INTO `t_system_area` VALUES ('230921', ',230000,230900,', '230900', '2016-01-25 14:31:09', '勃利县', '黑龙江省七台河市勃利县');
INSERT INTO `t_system_area` VALUES ('230922', ',230000,230900,', '230900', '2016-01-25 14:31:09', '其它区', '黑龙江省七台河市其它区');
INSERT INTO `t_system_area` VALUES ('231000', ',230000,', '230000', '2016-01-25 14:31:09', '牡丹江市', '黑龙江省牡丹江市');
INSERT INTO `t_system_area` VALUES ('231002', ',230000,231000,', '231000', '2016-01-25 14:31:09', '东安区', '黑龙江省牡丹江市东安区');
INSERT INTO `t_system_area` VALUES ('231003', ',230000,231000,', '231000', '2016-01-25 14:31:09', '阳明区', '黑龙江省牡丹江市阳明区');
INSERT INTO `t_system_area` VALUES ('231004', ',230000,231000,', '231000', '2016-01-25 14:31:09', '爱民区', '黑龙江省牡丹江市爱民区');
INSERT INTO `t_system_area` VALUES ('231005', ',230000,231000,', '231000', '2016-01-25 14:31:09', '西安区', '黑龙江省牡丹江市西安区');
INSERT INTO `t_system_area` VALUES ('231024', ',230000,231000,', '231000', '2016-01-25 14:31:09', '东宁县', '黑龙江省牡丹江市东宁县');
INSERT INTO `t_system_area` VALUES ('231025', ',230000,231000,', '231000', '2016-01-25 14:31:09', '林口县', '黑龙江省牡丹江市林口县');
INSERT INTO `t_system_area` VALUES ('231081', ',230000,231000,', '231000', '2016-01-25 14:31:09', '绥芬河市', '黑龙江省牡丹江市绥芬河市');
INSERT INTO `t_system_area` VALUES ('231083', ',230000,231000,', '231000', '2016-01-25 14:31:10', '海林市', '黑龙江省牡丹江市海林市');
INSERT INTO `t_system_area` VALUES ('231084', ',230000,231000,', '231000', '2016-01-25 14:31:10', '宁安市', '黑龙江省牡丹江市宁安市');
INSERT INTO `t_system_area` VALUES ('231085', ',230000,231000,', '231000', '2016-01-25 14:31:10', '穆棱市', '黑龙江省牡丹江市穆棱市');
INSERT INTO `t_system_area` VALUES ('231086', ',230000,231000,', '231000', '2016-01-25 14:31:10', '其它区', '黑龙江省牡丹江市其它区');
INSERT INTO `t_system_area` VALUES ('231100', ',230000,', '230000', '2016-01-25 14:31:10', '黑河市', '黑龙江省黑河市');
INSERT INTO `t_system_area` VALUES ('231102', ',230000,231100,', '231100', '2016-01-25 14:31:10', '爱辉区', '黑龙江省黑河市爱辉区');
INSERT INTO `t_system_area` VALUES ('231121', ',230000,231100,', '231100', '2016-01-25 14:31:10', '嫩江县', '黑龙江省黑河市嫩江县');
INSERT INTO `t_system_area` VALUES ('231123', ',230000,231100,', '231100', '2016-01-25 14:31:10', '逊克县', '黑龙江省黑河市逊克县');
INSERT INTO `t_system_area` VALUES ('231124', ',230000,231100,', '231100', '2016-01-25 14:31:10', '孙吴县', '黑龙江省黑河市孙吴县');
INSERT INTO `t_system_area` VALUES ('231181', ',230000,231100,', '231100', '2016-01-25 14:31:10', '北安市', '黑龙江省黑河市北安市');
INSERT INTO `t_system_area` VALUES ('231182', ',230000,231100,', '231100', '2016-01-25 14:31:10', '五大连池市', '黑龙江省黑河市五大连池市');
INSERT INTO `t_system_area` VALUES ('231183', ',230000,231100,', '231100', '2016-01-25 14:31:10', '其它区', '黑龙江省黑河市其它区');
INSERT INTO `t_system_area` VALUES ('231200', ',230000,', '230000', '2016-01-25 14:31:10', '绥化市', '黑龙江省绥化市');
INSERT INTO `t_system_area` VALUES ('231202', ',230000,231200,', '231200', '2016-01-25 14:31:10', '北林区', '黑龙江省绥化市北林区');
INSERT INTO `t_system_area` VALUES ('231221', ',230000,231200,', '231200', '2016-01-25 14:31:10', '望奎县', '黑龙江省绥化市望奎县');
INSERT INTO `t_system_area` VALUES ('231222', ',230000,231200,', '231200', '2016-01-25 14:31:10', '兰西县', '黑龙江省绥化市兰西县');
INSERT INTO `t_system_area` VALUES ('231223', ',230000,231200,', '231200', '2016-01-25 14:31:10', '青冈县', '黑龙江省绥化市青冈县');
INSERT INTO `t_system_area` VALUES ('231224', ',230000,231200,', '231200', '2016-01-25 14:31:10', '庆安县', '黑龙江省绥化市庆安县');
INSERT INTO `t_system_area` VALUES ('231225', ',230000,231200,', '231200', '2016-01-25 14:31:10', '明水县', '黑龙江省绥化市明水县');
INSERT INTO `t_system_area` VALUES ('231226', ',230000,231200,', '231200', '2016-01-25 14:31:10', '绥棱县', '黑龙江省绥化市绥棱县');
INSERT INTO `t_system_area` VALUES ('231281', ',230000,231200,', '231200', '2016-01-25 14:31:10', '安达市', '黑龙江省绥化市安达市');
INSERT INTO `t_system_area` VALUES ('231282', ',230000,231200,', '231200', '2016-01-25 14:31:10', '肇东市', '黑龙江省绥化市肇东市');
INSERT INTO `t_system_area` VALUES ('231283', ',230000,231200,', '231200', '2016-01-25 14:31:10', '海伦市', '黑龙江省绥化市海伦市');
INSERT INTO `t_system_area` VALUES ('231284', ',230000,231200,', '231200', '2016-01-25 14:31:10', '其它区', '黑龙江省绥化市其它区');
INSERT INTO `t_system_area` VALUES ('232700', ',230000,', '230000', '2016-01-25 14:31:10', '大兴安岭地区', '黑龙江省大兴安岭地区');
INSERT INTO `t_system_area` VALUES ('232702', ',230000,232700,', '232700', '2016-01-25 14:31:10', '松岭区', '黑龙江省大兴安岭地区松岭区');
INSERT INTO `t_system_area` VALUES ('232703', ',230000,232700,', '232700', '2016-01-25 14:31:10', '新林区', '黑龙江省大兴安岭地区新林区');
INSERT INTO `t_system_area` VALUES ('232704', ',230000,232700,', '232700', '2016-01-25 14:31:10', '呼中区', '黑龙江省大兴安岭地区呼中区');
INSERT INTO `t_system_area` VALUES ('232721', ',230000,232700,', '232700', '2016-01-25 14:31:10', '呼玛县', '黑龙江省大兴安岭地区呼玛县');
INSERT INTO `t_system_area` VALUES ('232722', ',230000,232700,', '232700', '2016-01-25 14:31:10', '塔河县', '黑龙江省大兴安岭地区塔河县');
INSERT INTO `t_system_area` VALUES ('232723', ',230000,232700,', '232700', '2016-01-25 14:31:10', '漠河县', '黑龙江省大兴安岭地区漠河县');
INSERT INTO `t_system_area` VALUES ('232724', ',230000,232700,', '232700', '2016-01-25 14:31:10', '加格达奇区', '黑龙江省大兴安岭地区加格达奇区');
INSERT INTO `t_system_area` VALUES ('232725', ',230000,232700,', '232700', '2016-01-25 14:31:10', '其它区', '黑龙江省大兴安岭地区其它区');
INSERT INTO `t_system_area` VALUES ('310100', ',', null, '2016-01-25 14:31:01', '上海市', '上海市');
INSERT INTO `t_system_area` VALUES ('310101', ',310100,', '310100', '2016-01-25 14:31:01', '黄浦区', '上海市黄浦区');
INSERT INTO `t_system_area` VALUES ('310103', ',310100,', '310100', '2016-01-25 14:31:01', '卢湾区', '上海市卢湾区');
INSERT INTO `t_system_area` VALUES ('310104', ',310100,', '310100', '2016-01-25 14:31:01', '徐汇区', '上海市徐汇区');
INSERT INTO `t_system_area` VALUES ('310105', ',310100,', '310100', '2016-01-25 14:31:01', '长宁区', '上海市长宁区');
INSERT INTO `t_system_area` VALUES ('310106', ',310100,', '310100', '2016-01-25 14:31:01', '静安区', '上海市静安区');
INSERT INTO `t_system_area` VALUES ('310107', ',310100,', '310100', '2016-01-25 14:31:01', '普陀区', '上海市普陀区');
INSERT INTO `t_system_area` VALUES ('310108', ',310100,', '310100', '2016-01-25 14:31:01', '闸北区', '上海市闸北区');
INSERT INTO `t_system_area` VALUES ('310109', ',310100,', '310100', '2016-01-25 14:31:01', '虹口区', '上海市虹口区');
INSERT INTO `t_system_area` VALUES ('310110', ',310100,', '310100', '2016-01-25 14:31:01', '杨浦区', '上海市杨浦区');
INSERT INTO `t_system_area` VALUES ('310112', ',310100,', '310100', '2016-01-25 14:31:01', '闵行区', '上海市闵行区');
INSERT INTO `t_system_area` VALUES ('310113', ',310100,', '310100', '2016-01-25 14:31:01', '宝山区', '上海市宝山区');
INSERT INTO `t_system_area` VALUES ('310114', ',310100,', '310100', '2016-01-25 14:31:01', '嘉定区', '上海市嘉定区');
INSERT INTO `t_system_area` VALUES ('310115', ',310100,', '310100', '2016-01-25 14:31:01', '浦东新区', '上海市浦东新区');
INSERT INTO `t_system_area` VALUES ('310116', ',310100,', '310100', '2016-01-25 14:31:01', '金山区', '上海市金山区');
INSERT INTO `t_system_area` VALUES ('310117', ',310100,', '310100', '2016-01-25 14:31:01', '松江区', '上海市松江区');
INSERT INTO `t_system_area` VALUES ('310118', ',310100,', '310100', '2016-01-25 14:31:01', '青浦区', '上海市青浦区');
INSERT INTO `t_system_area` VALUES ('310119', ',310100,', '310100', '2016-01-25 14:31:01', '南汇区', '上海市南汇区');
INSERT INTO `t_system_area` VALUES ('310120', ',310100,', '310100', '2016-01-25 14:31:01', '奉贤区', '上海市奉贤区');
INSERT INTO `t_system_area` VALUES ('310152', ',310100,', '310100', '2016-01-25 14:31:01', '川沙区', '上海市川沙区');
INSERT INTO `t_system_area` VALUES ('310230', ',310100,', '310100', '2016-01-25 14:31:01', '崇明县', '上海市崇明县');
INSERT INTO `t_system_area` VALUES ('310231', ',310100,', '310100', '2016-01-25 14:31:01', '其它区', '上海市其它区');
INSERT INTO `t_system_area` VALUES ('320000', ',', null, '2016-01-25 14:31:10', '江苏省', '江苏省');
INSERT INTO `t_system_area` VALUES ('320100', ',320000,', '320000', '2016-01-25 14:31:10', '南京市', '江苏省南京市');
INSERT INTO `t_system_area` VALUES ('320102', ',320000,320100,', '320100', '2016-01-25 14:31:10', '玄武区', '江苏省南京市玄武区');
INSERT INTO `t_system_area` VALUES ('320103', ',320000,320100,', '320100', '2016-01-25 14:31:10', '白下区', '江苏省南京市白下区');
INSERT INTO `t_system_area` VALUES ('320104', ',320000,320100,', '320100', '2016-01-25 14:31:10', '秦淮区', '江苏省南京市秦淮区');
INSERT INTO `t_system_area` VALUES ('320105', ',320000,320100,', '320100', '2016-01-25 14:31:10', '建邺区', '江苏省南京市建邺区');
INSERT INTO `t_system_area` VALUES ('320106', ',320000,320100,', '320100', '2016-01-25 14:31:10', '鼓楼区', '江苏省南京市鼓楼区');
INSERT INTO `t_system_area` VALUES ('320107', ',320000,320100,', '320100', '2016-01-25 14:31:10', '下关区', '江苏省南京市下关区');
INSERT INTO `t_system_area` VALUES ('320111', ',320000,320100,', '320100', '2016-01-25 14:31:10', '浦口区', '江苏省南京市浦口区');
INSERT INTO `t_system_area` VALUES ('320113', ',320000,320100,', '320100', '2016-01-25 14:31:10', '栖霞区', '江苏省南京市栖霞区');
INSERT INTO `t_system_area` VALUES ('320114', ',320000,320100,', '320100', '2016-01-25 14:31:10', '雨花台区', '江苏省南京市雨花台区');
INSERT INTO `t_system_area` VALUES ('320115', ',320000,320100,', '320100', '2016-01-25 14:31:10', '江宁区', '江苏省南京市江宁区');
INSERT INTO `t_system_area` VALUES ('320116', ',320000,320100,', '320100', '2016-01-25 14:31:10', '六合区', '江苏省南京市六合区');
INSERT INTO `t_system_area` VALUES ('320124', ',320000,320100,', '320100', '2016-01-25 14:31:10', '溧水区', '江苏省南京市溧水区');
INSERT INTO `t_system_area` VALUES ('320125', ',320000,320100,', '320100', '2016-01-25 14:31:10', '高淳区', '江苏省南京市高淳区');
INSERT INTO `t_system_area` VALUES ('320126', ',320000,320100,', '320100', '2016-01-25 14:31:10', '其它区', '江苏省南京市其它区');
INSERT INTO `t_system_area` VALUES ('320200', ',320000,', '320000', '2016-01-25 14:31:10', '无锡市', '江苏省无锡市');
INSERT INTO `t_system_area` VALUES ('320202', ',320000,320200,', '320200', '2016-01-25 14:31:10', '崇安区', '江苏省无锡市崇安区');
INSERT INTO `t_system_area` VALUES ('320203', ',320000,320200,', '320200', '2016-01-25 14:31:10', '南长区', '江苏省无锡市南长区');
INSERT INTO `t_system_area` VALUES ('320204', ',320000,320200,', '320200', '2016-01-25 14:31:10', '北塘区', '江苏省无锡市北塘区');
INSERT INTO `t_system_area` VALUES ('320205', ',320000,320200,', '320200', '2016-01-25 14:31:10', '锡山区', '江苏省无锡市锡山区');
INSERT INTO `t_system_area` VALUES ('320206', ',320000,320200,', '320200', '2016-01-25 14:31:10', '惠山区', '江苏省无锡市惠山区');
INSERT INTO `t_system_area` VALUES ('320211', ',320000,320200,', '320200', '2016-01-25 14:31:10', '滨湖区', '江苏省无锡市滨湖区');
INSERT INTO `t_system_area` VALUES ('320281', ',320000,320200,', '320200', '2016-01-25 14:31:10', '江阴市', '江苏省无锡市江阴市');
INSERT INTO `t_system_area` VALUES ('320282', ',320000,320200,', '320200', '2016-01-25 14:31:10', '宜兴市', '江苏省无锡市宜兴市');
INSERT INTO `t_system_area` VALUES ('320296', ',320000,320200,', '320200', '2016-01-25 14:31:10', '新区', '江苏省无锡市新区');
INSERT INTO `t_system_area` VALUES ('320297', ',320000,320200,', '320200', '2016-01-25 14:31:10', '其它区', '江苏省无锡市其它区');
INSERT INTO `t_system_area` VALUES ('320300', ',320000,', '320000', '2016-01-25 14:31:10', '徐州市', '江苏省徐州市');
INSERT INTO `t_system_area` VALUES ('320302', ',320000,320300,', '320300', '2016-01-25 14:31:10', '鼓楼区', '江苏省徐州市鼓楼区');
INSERT INTO `t_system_area` VALUES ('320303', ',320000,320300,', '320300', '2016-01-25 14:31:10', '云龙区', '江苏省徐州市云龙区');
INSERT INTO `t_system_area` VALUES ('320304', ',320000,320300,', '320300', '2016-01-25 14:31:10', '九里区', '江苏省徐州市九里区');
INSERT INTO `t_system_area` VALUES ('320305', ',320000,320300,', '320300', '2016-01-25 14:31:10', '贾汪区', '江苏省徐州市贾汪区');
INSERT INTO `t_system_area` VALUES ('320311', ',320000,320300,', '320300', '2016-01-25 14:31:10', '泉山区', '江苏省徐州市泉山区');
INSERT INTO `t_system_area` VALUES ('320321', ',320000,320300,', '320300', '2016-01-25 14:31:10', '丰县', '江苏省徐州市丰县');
INSERT INTO `t_system_area` VALUES ('320322', ',320000,320300,', '320300', '2016-01-25 14:31:10', '沛县', '江苏省徐州市沛县');
INSERT INTO `t_system_area` VALUES ('320323', ',320000,320300,', '320300', '2016-01-25 14:31:10', '铜山区', '江苏省徐州市铜山区');
INSERT INTO `t_system_area` VALUES ('320324', ',320000,320300,', '320300', '2016-01-25 14:31:10', '睢宁县', '江苏省徐州市睢宁县');
INSERT INTO `t_system_area` VALUES ('320381', ',320000,320300,', '320300', '2016-01-25 14:31:10', '新沂市', '江苏省徐州市新沂市');
INSERT INTO `t_system_area` VALUES ('320382', ',320000,320300,', '320300', '2016-01-25 14:31:10', '邳州市', '江苏省徐州市邳州市');
INSERT INTO `t_system_area` VALUES ('320383', ',320000,320300,', '320300', '2016-01-25 14:31:10', '其它区', '江苏省徐州市其它区');
INSERT INTO `t_system_area` VALUES ('320400', ',320000,', '320000', '2016-01-25 14:31:10', '常州市', '江苏省常州市');
INSERT INTO `t_system_area` VALUES ('320402', ',320000,320400,', '320400', '2016-01-25 14:31:10', '天宁区', '江苏省常州市天宁区');
INSERT INTO `t_system_area` VALUES ('320404', ',320000,320400,', '320400', '2016-01-25 14:31:10', '钟楼区', '江苏省常州市钟楼区');
INSERT INTO `t_system_area` VALUES ('320405', ',320000,320400,', '320400', '2016-01-25 14:31:10', '戚墅堰区', '江苏省常州市戚墅堰区');
INSERT INTO `t_system_area` VALUES ('320411', ',320000,320400,', '320400', '2016-01-25 14:31:10', '新北区', '江苏省常州市新北区');
INSERT INTO `t_system_area` VALUES ('320412', ',320000,320400,', '320400', '2016-01-25 14:31:10', '武进区', '江苏省常州市武进区');
INSERT INTO `t_system_area` VALUES ('320481', ',320000,320400,', '320400', '2016-01-25 14:31:10', '溧阳市', '江苏省常州市溧阳市');
INSERT INTO `t_system_area` VALUES ('320482', ',320000,320400,', '320400', '2016-01-25 14:31:10', '金坛市', '江苏省常州市金坛市');
INSERT INTO `t_system_area` VALUES ('320483', ',320000,320400,', '320400', '2016-01-25 14:31:10', '其它区', '江苏省常州市其它区');
INSERT INTO `t_system_area` VALUES ('320500', ',320000,', '320000', '2016-01-25 14:31:10', '苏州市', '江苏省苏州市');
INSERT INTO `t_system_area` VALUES ('320502', ',320000,320500,', '320500', '2016-01-25 14:31:10', '沧浪区', '江苏省苏州市沧浪区');
INSERT INTO `t_system_area` VALUES ('320503', ',320000,320500,', '320500', '2016-01-25 14:31:10', '平江区', '江苏省苏州市平江区');
INSERT INTO `t_system_area` VALUES ('320504', ',320000,320500,', '320500', '2016-01-25 14:31:10', '金阊区', '江苏省苏州市金阊区');
INSERT INTO `t_system_area` VALUES ('320505', ',320000,320500,', '320500', '2016-01-25 14:31:10', '虎丘区', '江苏省苏州市虎丘区');
INSERT INTO `t_system_area` VALUES ('320506', ',320000,320500,', '320500', '2016-01-25 14:31:10', '吴中区', '江苏省苏州市吴中区');
INSERT INTO `t_system_area` VALUES ('320507', ',320000,320500,', '320500', '2016-01-25 14:31:10', '相城区', '江苏省苏州市相城区');
INSERT INTO `t_system_area` VALUES ('320508', ',320000,320500,', '320500', '2016-01-25 14:31:10', '姑苏区', '江苏省苏州市姑苏区');
INSERT INTO `t_system_area` VALUES ('320581', ',320000,320500,', '320500', '2016-01-25 14:31:10', '常熟市', '江苏省苏州市常熟市');
INSERT INTO `t_system_area` VALUES ('320582', ',320000,320500,', '320500', '2016-01-25 14:31:10', '张家港市', '江苏省苏州市张家港市');
INSERT INTO `t_system_area` VALUES ('320583', ',320000,320500,', '320500', '2016-01-25 14:31:10', '昆山市', '江苏省苏州市昆山市');
INSERT INTO `t_system_area` VALUES ('320584', ',320000,320500,', '320500', '2016-01-25 14:31:10', '吴江区', '江苏省苏州市吴江区');
INSERT INTO `t_system_area` VALUES ('320585', ',320000,320500,', '320500', '2016-01-25 14:31:10', '太仓市', '江苏省苏州市太仓市');
INSERT INTO `t_system_area` VALUES ('320594', ',320000,320500,', '320500', '2016-01-25 14:31:10', '新区', '江苏省苏州市新区');
INSERT INTO `t_system_area` VALUES ('320595', ',320000,320500,', '320500', '2016-01-25 14:31:10', '园区', '江苏省苏州市园区');
INSERT INTO `t_system_area` VALUES ('320596', ',320000,320500,', '320500', '2016-01-25 14:31:10', '其它区', '江苏省苏州市其它区');
INSERT INTO `t_system_area` VALUES ('320600', ',320000,', '320000', '2016-01-25 14:31:10', '南通市', '江苏省南通市');
INSERT INTO `t_system_area` VALUES ('320602', ',320000,320600,', '320600', '2016-01-25 14:31:10', '崇川区', '江苏省南通市崇川区');
INSERT INTO `t_system_area` VALUES ('320611', ',320000,320600,', '320600', '2016-01-25 14:31:10', '港闸区', '江苏省南通市港闸区');
INSERT INTO `t_system_area` VALUES ('320612', ',320000,320600,', '320600', '2016-01-25 14:31:10', '通州区', '江苏省南通市通州区');
INSERT INTO `t_system_area` VALUES ('320621', ',320000,320600,', '320600', '2016-01-25 14:31:10', '海安县', '江苏省南通市海安县');
INSERT INTO `t_system_area` VALUES ('320623', ',320000,320600,', '320600', '2016-01-25 14:31:10', '如东县', '江苏省南通市如东县');
INSERT INTO `t_system_area` VALUES ('320681', ',320000,320600,', '320600', '2016-01-25 14:31:10', '启东市', '江苏省南通市启东市');
INSERT INTO `t_system_area` VALUES ('320682', ',320000,320600,', '320600', '2016-01-25 14:31:11', '如皋市', '江苏省南通市如皋市');
INSERT INTO `t_system_area` VALUES ('320683', ',320000,320600,', '320600', '2016-01-25 14:31:11', '通州市', '江苏省南通市通州市');
INSERT INTO `t_system_area` VALUES ('320684', ',320000,320600,', '320600', '2016-01-25 14:31:11', '海门市', '江苏省南通市海门市');
INSERT INTO `t_system_area` VALUES ('320693', ',320000,320600,', '320600', '2016-01-25 14:31:11', '开发区', '江苏省南通市开发区');
INSERT INTO `t_system_area` VALUES ('320694', ',320000,320600,', '320600', '2016-01-25 14:31:11', '其它区', '江苏省南通市其它区');
INSERT INTO `t_system_area` VALUES ('320700', ',320000,', '320000', '2016-01-25 14:31:11', '连云港市', '江苏省连云港市');
INSERT INTO `t_system_area` VALUES ('320703', ',320000,320700,', '320700', '2016-01-25 14:31:11', '连云区', '江苏省连云港市连云区');
INSERT INTO `t_system_area` VALUES ('320705', ',320000,320700,', '320700', '2016-01-25 14:31:11', '新浦区', '江苏省连云港市新浦区');
INSERT INTO `t_system_area` VALUES ('320706', ',320000,320700,', '320700', '2016-01-25 14:31:11', '海州区', '江苏省连云港市海州区');
INSERT INTO `t_system_area` VALUES ('320721', ',320000,320700,', '320700', '2016-01-25 14:31:11', '赣榆县', '江苏省连云港市赣榆县');
INSERT INTO `t_system_area` VALUES ('320722', ',320000,320700,', '320700', '2016-01-25 14:31:11', '东海县', '江苏省连云港市东海县');
INSERT INTO `t_system_area` VALUES ('320723', ',320000,320700,', '320700', '2016-01-25 14:31:11', '灌云县', '江苏省连云港市灌云县');
INSERT INTO `t_system_area` VALUES ('320724', ',320000,320700,', '320700', '2016-01-25 14:31:11', '灌南县', '江苏省连云港市灌南县');
INSERT INTO `t_system_area` VALUES ('320725', ',320000,320700,', '320700', '2016-01-25 14:31:11', '其它区', '江苏省连云港市其它区');
INSERT INTO `t_system_area` VALUES ('320800', ',320000,', '320000', '2016-01-25 14:31:11', '淮安市', '江苏省淮安市');
INSERT INTO `t_system_area` VALUES ('320802', ',320000,320800,', '320800', '2016-01-25 14:31:11', '清河区', '江苏省淮安市清河区');
INSERT INTO `t_system_area` VALUES ('320803', ',320000,320800,', '320800', '2016-01-25 14:31:11', '淮安区', '江苏省淮安市淮安区');
INSERT INTO `t_system_area` VALUES ('320804', ',320000,320800,', '320800', '2016-01-25 14:31:11', '淮阴区', '江苏省淮安市淮阴区');
INSERT INTO `t_system_area` VALUES ('320811', ',320000,320800,', '320800', '2016-01-25 14:31:11', '清浦区', '江苏省淮安市清浦区');
INSERT INTO `t_system_area` VALUES ('320826', ',320000,320800,', '320800', '2016-01-25 14:31:11', '涟水县', '江苏省淮安市涟水县');
INSERT INTO `t_system_area` VALUES ('320829', ',320000,320800,', '320800', '2016-01-25 14:31:11', '洪泽县', '江苏省淮安市洪泽县');
INSERT INTO `t_system_area` VALUES ('320830', ',320000,320800,', '320800', '2016-01-25 14:31:11', '盱眙县', '江苏省淮安市盱眙县');
INSERT INTO `t_system_area` VALUES ('320831', ',320000,320800,', '320800', '2016-01-25 14:31:11', '金湖县', '江苏省淮安市金湖县');
INSERT INTO `t_system_area` VALUES ('320832', ',320000,320800,', '320800', '2016-01-25 14:31:11', '其它区', '江苏省淮安市其它区');
INSERT INTO `t_system_area` VALUES ('320900', ',320000,', '320000', '2016-01-25 14:31:11', '盐城市', '江苏省盐城市');
INSERT INTO `t_system_area` VALUES ('320902', ',320000,320900,', '320900', '2016-01-25 14:31:11', '亭湖区', '江苏省盐城市亭湖区');
INSERT INTO `t_system_area` VALUES ('320903', ',320000,320900,', '320900', '2016-01-25 14:31:11', '盐都区', '江苏省盐城市盐都区');
INSERT INTO `t_system_area` VALUES ('320921', ',320000,320900,', '320900', '2016-01-25 14:31:11', '响水县', '江苏省盐城市响水县');
INSERT INTO `t_system_area` VALUES ('320922', ',320000,320900,', '320900', '2016-01-25 14:31:11', '滨海县', '江苏省盐城市滨海县');
INSERT INTO `t_system_area` VALUES ('320923', ',320000,320900,', '320900', '2016-01-25 14:31:11', '阜宁县', '江苏省盐城市阜宁县');
INSERT INTO `t_system_area` VALUES ('320924', ',320000,320900,', '320900', '2016-01-25 14:31:11', '射阳县', '江苏省盐城市射阳县');
INSERT INTO `t_system_area` VALUES ('320925', ',320000,320900,', '320900', '2016-01-25 14:31:11', '建湖县', '江苏省盐城市建湖县');
INSERT INTO `t_system_area` VALUES ('320981', ',320000,320900,', '320900', '2016-01-25 14:31:11', '东台市', '江苏省盐城市东台市');
INSERT INTO `t_system_area` VALUES ('320982', ',320000,320900,', '320900', '2016-01-25 14:31:11', '大丰市', '江苏省盐城市大丰市');
INSERT INTO `t_system_area` VALUES ('320983', ',320000,320900,', '320900', '2016-01-25 14:31:11', '其它区', '江苏省盐城市其它区');
INSERT INTO `t_system_area` VALUES ('321000', ',320000,', '320000', '2016-01-25 14:31:11', '扬州市', '江苏省扬州市');
INSERT INTO `t_system_area` VALUES ('321002', ',320000,321000,', '321000', '2016-01-25 14:31:11', '广陵区', '江苏省扬州市广陵区');
INSERT INTO `t_system_area` VALUES ('321003', ',320000,321000,', '321000', '2016-01-25 14:31:11', '邗江区', '江苏省扬州市邗江区');
INSERT INTO `t_system_area` VALUES ('321011', ',320000,321000,', '321000', '2016-01-25 14:31:11', '维扬区', '江苏省扬州市维扬区');
INSERT INTO `t_system_area` VALUES ('321023', ',320000,321000,', '321000', '2016-01-25 14:31:11', '宝应县', '江苏省扬州市宝应县');
INSERT INTO `t_system_area` VALUES ('321081', ',320000,321000,', '321000', '2016-01-25 14:31:11', '仪征市', '江苏省扬州市仪征市');
INSERT INTO `t_system_area` VALUES ('321084', ',320000,321000,', '321000', '2016-01-25 14:31:11', '高邮市', '江苏省扬州市高邮市');
INSERT INTO `t_system_area` VALUES ('321088', ',320000,321000,', '321000', '2016-01-25 14:31:11', '江都区', '江苏省扬州市江都区');
INSERT INTO `t_system_area` VALUES ('321092', ',320000,321000,', '321000', '2016-01-25 14:31:11', '经济开发区', '江苏省扬州市经济开发区');
INSERT INTO `t_system_area` VALUES ('321093', ',320000,321000,', '321000', '2016-01-25 14:31:11', '其它区', '江苏省扬州市其它区');
INSERT INTO `t_system_area` VALUES ('321100', ',320000,', '320000', '2016-01-25 14:31:11', '镇江市', '江苏省镇江市');
INSERT INTO `t_system_area` VALUES ('321102', ',320000,321100,', '321100', '2016-01-25 14:31:11', '京口区', '江苏省镇江市京口区');
INSERT INTO `t_system_area` VALUES ('321111', ',320000,321100,', '321100', '2016-01-25 14:31:11', '润州区', '江苏省镇江市润州区');
INSERT INTO `t_system_area` VALUES ('321112', ',320000,321100,', '321100', '2016-01-25 14:31:11', '丹徒区', '江苏省镇江市丹徒区');
INSERT INTO `t_system_area` VALUES ('321181', ',320000,321100,', '321100', '2016-01-25 14:31:11', '丹阳市', '江苏省镇江市丹阳市');
INSERT INTO `t_system_area` VALUES ('321182', ',320000,321100,', '321100', '2016-01-25 14:31:11', '扬中市', '江苏省镇江市扬中市');
INSERT INTO `t_system_area` VALUES ('321183', ',320000,321100,', '321100', '2016-01-25 14:31:11', '句容市', '江苏省镇江市句容市');
INSERT INTO `t_system_area` VALUES ('321184', ',320000,321100,', '321100', '2016-01-25 14:31:11', '其它区', '江苏省镇江市其它区');
INSERT INTO `t_system_area` VALUES ('321200', ',320000,', '320000', '2016-01-25 14:31:11', '泰州市', '江苏省泰州市');
INSERT INTO `t_system_area` VALUES ('321202', ',320000,321200,', '321200', '2016-01-25 14:31:11', '海陵区', '江苏省泰州市海陵区');
INSERT INTO `t_system_area` VALUES ('321203', ',320000,321200,', '321200', '2016-01-25 14:31:11', '高港区', '江苏省泰州市高港区');
INSERT INTO `t_system_area` VALUES ('321281', ',320000,321200,', '321200', '2016-01-25 14:31:11', '兴化市', '江苏省泰州市兴化市');
INSERT INTO `t_system_area` VALUES ('321282', ',320000,321200,', '321200', '2016-01-25 14:31:11', '靖江市', '江苏省泰州市靖江市');
INSERT INTO `t_system_area` VALUES ('321283', ',320000,321200,', '321200', '2016-01-25 14:31:11', '泰兴市', '江苏省泰州市泰兴市');
INSERT INTO `t_system_area` VALUES ('321284', ',320000,321200,', '321200', '2016-01-25 14:31:11', '姜堰区', '江苏省泰州市姜堰区');
INSERT INTO `t_system_area` VALUES ('321285', ',320000,321200,', '321200', '2016-01-25 14:31:11', '其它区', '江苏省泰州市其它区');
INSERT INTO `t_system_area` VALUES ('321300', ',320000,', '320000', '2016-01-25 14:31:11', '宿迁市', '江苏省宿迁市');
INSERT INTO `t_system_area` VALUES ('321302', ',320000,321300,', '321300', '2016-01-25 14:31:11', '宿城区', '江苏省宿迁市宿城区');
INSERT INTO `t_system_area` VALUES ('321311', ',320000,321300,', '321300', '2016-01-25 14:31:11', '宿豫区', '江苏省宿迁市宿豫区');
INSERT INTO `t_system_area` VALUES ('321322', ',320000,321300,', '321300', '2016-01-25 14:31:11', '沭阳县', '江苏省宿迁市沭阳县');
INSERT INTO `t_system_area` VALUES ('321323', ',320000,321300,', '321300', '2016-01-25 14:31:11', '泗阳县', '江苏省宿迁市泗阳县');
INSERT INTO `t_system_area` VALUES ('321324', ',320000,321300,', '321300', '2016-01-25 14:31:11', '泗洪县', '江苏省宿迁市泗洪县');
INSERT INTO `t_system_area` VALUES ('321325', ',320000,321300,', '321300', '2016-01-25 14:31:11', '其它区', '江苏省宿迁市其它区');
INSERT INTO `t_system_area` VALUES ('330000', ',', null, '2016-01-25 14:31:11', '浙江省', '浙江省');
INSERT INTO `t_system_area` VALUES ('330100', ',330000,', '330000', '2016-01-25 14:31:11', '杭州市', '浙江省杭州市');
INSERT INTO `t_system_area` VALUES ('330102', ',330000,330100,', '330100', '2016-01-25 14:31:11', '上城区', '浙江省杭州市上城区');
INSERT INTO `t_system_area` VALUES ('330103', ',330000,330100,', '330100', '2016-01-25 14:31:11', '下城区', '浙江省杭州市下城区');
INSERT INTO `t_system_area` VALUES ('330104', ',330000,330100,', '330100', '2016-01-25 14:31:11', '江干区', '浙江省杭州市江干区');
INSERT INTO `t_system_area` VALUES ('330105', ',330000,330100,', '330100', '2016-01-25 14:31:11', '拱墅区', '浙江省杭州市拱墅区');
INSERT INTO `t_system_area` VALUES ('330106', ',330000,330100,', '330100', '2016-01-25 14:31:11', '西湖区', '浙江省杭州市西湖区');
INSERT INTO `t_system_area` VALUES ('330108', ',330000,330100,', '330100', '2016-01-25 14:31:11', '滨江区', '浙江省杭州市滨江区');
INSERT INTO `t_system_area` VALUES ('330109', ',330000,330100,', '330100', '2016-01-25 14:31:11', '萧山区', '浙江省杭州市萧山区');
INSERT INTO `t_system_area` VALUES ('330110', ',330000,330100,', '330100', '2016-01-25 14:31:11', '余杭区', '浙江省杭州市余杭区');
INSERT INTO `t_system_area` VALUES ('330122', ',330000,330100,', '330100', '2016-01-25 14:31:11', '桐庐县', '浙江省杭州市桐庐县');
INSERT INTO `t_system_area` VALUES ('330127', ',330000,330100,', '330100', '2016-01-25 14:31:11', '淳安县', '浙江省杭州市淳安县');
INSERT INTO `t_system_area` VALUES ('330182', ',330000,330100,', '330100', '2016-01-25 14:31:11', '建德市', '浙江省杭州市建德市');
INSERT INTO `t_system_area` VALUES ('330183', ',330000,330100,', '330100', '2016-01-25 14:31:11', '富阳市', '浙江省杭州市富阳市');
INSERT INTO `t_system_area` VALUES ('330185', ',330000,330100,', '330100', '2016-01-25 14:31:11', '临安市', '浙江省杭州市临安市');
INSERT INTO `t_system_area` VALUES ('330186', ',330000,330100,', '330100', '2016-01-25 14:31:11', '其它区', '浙江省杭州市其它区');
INSERT INTO `t_system_area` VALUES ('330200', ',330000,', '330000', '2016-01-25 14:31:11', '宁波市', '浙江省宁波市');
INSERT INTO `t_system_area` VALUES ('330203', ',330000,330200,', '330200', '2016-01-25 14:31:11', '海曙区', '浙江省宁波市海曙区');
INSERT INTO `t_system_area` VALUES ('330204', ',330000,330200,', '330200', '2016-01-25 14:31:11', '江东区', '浙江省宁波市江东区');
INSERT INTO `t_system_area` VALUES ('330205', ',330000,330200,', '330200', '2016-01-25 14:31:11', '江北区', '浙江省宁波市江北区');
INSERT INTO `t_system_area` VALUES ('330206', ',330000,330200,', '330200', '2016-01-25 14:31:11', '北仑区', '浙江省宁波市北仑区');
INSERT INTO `t_system_area` VALUES ('330211', ',330000,330200,', '330200', '2016-01-25 14:31:11', '镇海区', '浙江省宁波市镇海区');
INSERT INTO `t_system_area` VALUES ('330212', ',330000,330200,', '330200', '2016-01-25 14:31:11', '鄞州区', '浙江省宁波市鄞州区');
INSERT INTO `t_system_area` VALUES ('330225', ',330000,330200,', '330200', '2016-01-25 14:31:11', '象山县', '浙江省宁波市象山县');
INSERT INTO `t_system_area` VALUES ('330226', ',330000,330200,', '330200', '2016-01-25 14:31:11', '宁海县', '浙江省宁波市宁海县');
INSERT INTO `t_system_area` VALUES ('330281', ',330000,330200,', '330200', '2016-01-25 14:31:11', '余姚市', '浙江省宁波市余姚市');
INSERT INTO `t_system_area` VALUES ('330282', ',330000,330200,', '330200', '2016-01-25 14:31:11', '慈溪市', '浙江省宁波市慈溪市');
INSERT INTO `t_system_area` VALUES ('330283', ',330000,330200,', '330200', '2016-01-25 14:31:11', '奉化市', '浙江省宁波市奉化市');
INSERT INTO `t_system_area` VALUES ('330284', ',330000,330200,', '330200', '2016-01-25 14:31:11', '其它区', '浙江省宁波市其它区');
INSERT INTO `t_system_area` VALUES ('330300', ',330000,', '330000', '2016-01-25 14:31:11', '温州市', '浙江省温州市');
INSERT INTO `t_system_area` VALUES ('330302', ',330000,330300,', '330300', '2016-01-25 14:31:11', '鹿城区', '浙江省温州市鹿城区');
INSERT INTO `t_system_area` VALUES ('330303', ',330000,330300,', '330300', '2016-01-25 14:31:11', '龙湾区', '浙江省温州市龙湾区');
INSERT INTO `t_system_area` VALUES ('330304', ',330000,330300,', '330300', '2016-01-25 14:31:11', '瓯海区', '浙江省温州市瓯海区');
INSERT INTO `t_system_area` VALUES ('330322', ',330000,330300,', '330300', '2016-01-25 14:31:11', '洞头县', '浙江省温州市洞头县');
INSERT INTO `t_system_area` VALUES ('330324', ',330000,330300,', '330300', '2016-01-25 14:31:11', '永嘉县', '浙江省温州市永嘉县');
INSERT INTO `t_system_area` VALUES ('330326', ',330000,330300,', '330300', '2016-01-25 14:31:11', '平阳县', '浙江省温州市平阳县');
INSERT INTO `t_system_area` VALUES ('330327', ',330000,330300,', '330300', '2016-01-25 14:31:11', '苍南县', '浙江省温州市苍南县');
INSERT INTO `t_system_area` VALUES ('330328', ',330000,330300,', '330300', '2016-01-25 14:31:12', '文成县', '浙江省温州市文成县');
INSERT INTO `t_system_area` VALUES ('330329', ',330000,330300,', '330300', '2016-01-25 14:31:12', '泰顺县', '浙江省温州市泰顺县');
INSERT INTO `t_system_area` VALUES ('330381', ',330000,330300,', '330300', '2016-01-25 14:31:12', '瑞安市', '浙江省温州市瑞安市');
INSERT INTO `t_system_area` VALUES ('330382', ',330000,330300,', '330300', '2016-01-25 14:31:12', '乐清市', '浙江省温州市乐清市');
INSERT INTO `t_system_area` VALUES ('330383', ',330000,330300,', '330300', '2016-01-25 14:31:12', '其它区', '浙江省温州市其它区');
INSERT INTO `t_system_area` VALUES ('330400', ',330000,', '330000', '2016-01-25 14:31:12', '嘉兴市', '浙江省嘉兴市');
INSERT INTO `t_system_area` VALUES ('330402', ',330000,330400,', '330400', '2016-01-25 14:31:12', '南湖区', '浙江省嘉兴市南湖区');
INSERT INTO `t_system_area` VALUES ('330411', ',330000,330400,', '330400', '2016-01-25 14:31:12', '秀洲区', '浙江省嘉兴市秀洲区');
INSERT INTO `t_system_area` VALUES ('330421', ',330000,330400,', '330400', '2016-01-25 14:31:12', '嘉善县', '浙江省嘉兴市嘉善县');
INSERT INTO `t_system_area` VALUES ('330424', ',330000,330400,', '330400', '2016-01-25 14:31:12', '海盐县', '浙江省嘉兴市海盐县');
INSERT INTO `t_system_area` VALUES ('330481', ',330000,330400,', '330400', '2016-01-25 14:31:12', '海宁市', '浙江省嘉兴市海宁市');
INSERT INTO `t_system_area` VALUES ('330482', ',330000,330400,', '330400', '2016-01-25 14:31:12', '平湖市', '浙江省嘉兴市平湖市');
INSERT INTO `t_system_area` VALUES ('330483', ',330000,330400,', '330400', '2016-01-25 14:31:12', '桐乡市', '浙江省嘉兴市桐乡市');
INSERT INTO `t_system_area` VALUES ('330484', ',330000,330400,', '330400', '2016-01-25 14:31:12', '其它区', '浙江省嘉兴市其它区');
INSERT INTO `t_system_area` VALUES ('330500', ',330000,', '330000', '2016-01-25 14:31:12', '湖州市', '浙江省湖州市');
INSERT INTO `t_system_area` VALUES ('330502', ',330000,330500,', '330500', '2016-01-25 14:31:12', '吴兴区', '浙江省湖州市吴兴区');
INSERT INTO `t_system_area` VALUES ('330503', ',330000,330500,', '330500', '2016-01-25 14:31:12', '南浔区', '浙江省湖州市南浔区');
INSERT INTO `t_system_area` VALUES ('330521', ',330000,330500,', '330500', '2016-01-25 14:31:12', '德清县', '浙江省湖州市德清县');
INSERT INTO `t_system_area` VALUES ('330522', ',330000,330500,', '330500', '2016-01-25 14:31:12', '长兴县', '浙江省湖州市长兴县');
INSERT INTO `t_system_area` VALUES ('330523', ',330000,330500,', '330500', '2016-01-25 14:31:12', '安吉县', '浙江省湖州市安吉县');
INSERT INTO `t_system_area` VALUES ('330524', ',330000,330500,', '330500', '2016-01-25 14:31:12', '其它区', '浙江省湖州市其它区');
INSERT INTO `t_system_area` VALUES ('330600', ',330000,', '330000', '2016-01-25 14:31:12', '绍兴市', '浙江省绍兴市');
INSERT INTO `t_system_area` VALUES ('330602', ',330000,330600,', '330600', '2016-01-25 14:31:12', '越城区', '浙江省绍兴市越城区');
INSERT INTO `t_system_area` VALUES ('330621', ',330000,330600,', '330600', '2016-01-25 14:31:12', '绍兴县', '浙江省绍兴市绍兴县');
INSERT INTO `t_system_area` VALUES ('330624', ',330000,330600,', '330600', '2016-01-25 14:31:12', '新昌县', '浙江省绍兴市新昌县');
INSERT INTO `t_system_area` VALUES ('330681', ',330000,330600,', '330600', '2016-01-25 14:31:12', '诸暨市', '浙江省绍兴市诸暨市');
INSERT INTO `t_system_area` VALUES ('330682', ',330000,330600,', '330600', '2016-01-25 14:31:12', '上虞市', '浙江省绍兴市上虞市');
INSERT INTO `t_system_area` VALUES ('330683', ',330000,330600,', '330600', '2016-01-25 14:31:12', '嵊州市', '浙江省绍兴市嵊州市');
INSERT INTO `t_system_area` VALUES ('330684', ',330000,330600,', '330600', '2016-01-25 14:31:12', '其它区', '浙江省绍兴市其它区');
INSERT INTO `t_system_area` VALUES ('330700', ',330000,', '330000', '2016-01-25 14:31:12', '金华市', '浙江省金华市');
INSERT INTO `t_system_area` VALUES ('330702', ',330000,330700,', '330700', '2016-01-25 14:31:12', '婺城区', '浙江省金华市婺城区');
INSERT INTO `t_system_area` VALUES ('330703', ',330000,330700,', '330700', '2016-01-25 14:31:12', '金东区', '浙江省金华市金东区');
INSERT INTO `t_system_area` VALUES ('330723', ',330000,330700,', '330700', '2016-01-25 14:31:12', '武义县', '浙江省金华市武义县');
INSERT INTO `t_system_area` VALUES ('330726', ',330000,330700,', '330700', '2016-01-25 14:31:12', '浦江县', '浙江省金华市浦江县');
INSERT INTO `t_system_area` VALUES ('330727', ',330000,330700,', '330700', '2016-01-25 14:31:12', '磐安县', '浙江省金华市磐安县');
INSERT INTO `t_system_area` VALUES ('330781', ',330000,330700,', '330700', '2016-01-25 14:31:12', '兰溪市', '浙江省金华市兰溪市');
INSERT INTO `t_system_area` VALUES ('330782', ',330000,330700,', '330700', '2016-01-25 14:31:12', '义乌市', '浙江省金华市义乌市');
INSERT INTO `t_system_area` VALUES ('330783', ',330000,330700,', '330700', '2016-01-25 14:31:12', '东阳市', '浙江省金华市东阳市');
INSERT INTO `t_system_area` VALUES ('330784', ',330000,330700,', '330700', '2016-01-25 14:31:12', '永康市', '浙江省金华市永康市');
INSERT INTO `t_system_area` VALUES ('330785', ',330000,330700,', '330700', '2016-01-25 14:31:12', '其它区', '浙江省金华市其它区');
INSERT INTO `t_system_area` VALUES ('330800', ',330000,', '330000', '2016-01-25 14:31:12', '衢州市', '浙江省衢州市');
INSERT INTO `t_system_area` VALUES ('330802', ',330000,330800,', '330800', '2016-01-25 14:31:12', '柯城区', '浙江省衢州市柯城区');
INSERT INTO `t_system_area` VALUES ('330803', ',330000,330800,', '330800', '2016-01-25 14:31:12', '衢江区', '浙江省衢州市衢江区');
INSERT INTO `t_system_area` VALUES ('330822', ',330000,330800,', '330800', '2016-01-25 14:31:12', '常山县', '浙江省衢州市常山县');
INSERT INTO `t_system_area` VALUES ('330824', ',330000,330800,', '330800', '2016-01-25 14:31:12', '开化县', '浙江省衢州市开化县');
INSERT INTO `t_system_area` VALUES ('330825', ',330000,330800,', '330800', '2016-01-25 14:31:12', '龙游县', '浙江省衢州市龙游县');
INSERT INTO `t_system_area` VALUES ('330881', ',330000,330800,', '330800', '2016-01-25 14:31:12', '江山市', '浙江省衢州市江山市');
INSERT INTO `t_system_area` VALUES ('330882', ',330000,330800,', '330800', '2016-01-25 14:31:12', '其它区', '浙江省衢州市其它区');
INSERT INTO `t_system_area` VALUES ('330900', ',330000,', '330000', '2016-01-25 14:31:12', '舟山市', '浙江省舟山市');
INSERT INTO `t_system_area` VALUES ('330902', ',330000,330900,', '330900', '2016-01-25 14:31:12', '定海区', '浙江省舟山市定海区');
INSERT INTO `t_system_area` VALUES ('330903', ',330000,330900,', '330900', '2016-01-25 14:31:12', '普陀区', '浙江省舟山市普陀区');
INSERT INTO `t_system_area` VALUES ('330921', ',330000,330900,', '330900', '2016-01-25 14:31:12', '岱山县', '浙江省舟山市岱山县');
INSERT INTO `t_system_area` VALUES ('330922', ',330000,330900,', '330900', '2016-01-25 14:31:12', '嵊泗县', '浙江省舟山市嵊泗县');
INSERT INTO `t_system_area` VALUES ('330923', ',330000,330900,', '330900', '2016-01-25 14:31:12', '其它区', '浙江省舟山市其它区');
INSERT INTO `t_system_area` VALUES ('331000', ',330000,', '330000', '2016-01-25 14:31:12', '台州市', '浙江省台州市');
INSERT INTO `t_system_area` VALUES ('331002', ',330000,331000,', '331000', '2016-01-25 14:31:12', '椒江区', '浙江省台州市椒江区');
INSERT INTO `t_system_area` VALUES ('331003', ',330000,331000,', '331000', '2016-01-25 14:31:12', '黄岩区', '浙江省台州市黄岩区');
INSERT INTO `t_system_area` VALUES ('331004', ',330000,331000,', '331000', '2016-01-25 14:31:12', '路桥区', '浙江省台州市路桥区');
INSERT INTO `t_system_area` VALUES ('331021', ',330000,331000,', '331000', '2016-01-25 14:31:12', '玉环县', '浙江省台州市玉环县');
INSERT INTO `t_system_area` VALUES ('331022', ',330000,331000,', '331000', '2016-01-25 14:31:12', '三门县', '浙江省台州市三门县');
INSERT INTO `t_system_area` VALUES ('331023', ',330000,331000,', '331000', '2016-01-25 14:31:12', '天台县', '浙江省台州市天台县');
INSERT INTO `t_system_area` VALUES ('331024', ',330000,331000,', '331000', '2016-01-25 14:31:12', '仙居县', '浙江省台州市仙居县');
INSERT INTO `t_system_area` VALUES ('331081', ',330000,331000,', '331000', '2016-01-25 14:31:12', '温岭市', '浙江省台州市温岭市');
INSERT INTO `t_system_area` VALUES ('331082', ',330000,331000,', '331000', '2016-01-25 14:31:12', '临海市', '浙江省台州市临海市');
INSERT INTO `t_system_area` VALUES ('331083', ',330000,331000,', '331000', '2016-01-25 14:31:12', '其它区', '浙江省台州市其它区');
INSERT INTO `t_system_area` VALUES ('331100', ',330000,', '330000', '2016-01-25 14:31:12', '丽水市', '浙江省丽水市');
INSERT INTO `t_system_area` VALUES ('331102', ',330000,331100,', '331100', '2016-01-25 14:31:12', '莲都区', '浙江省丽水市莲都区');
INSERT INTO `t_system_area` VALUES ('331121', ',330000,331100,', '331100', '2016-01-25 14:31:12', '青田县', '浙江省丽水市青田县');
INSERT INTO `t_system_area` VALUES ('331122', ',330000,331100,', '331100', '2016-01-25 14:31:12', '缙云县', '浙江省丽水市缙云县');
INSERT INTO `t_system_area` VALUES ('331123', ',330000,331100,', '331100', '2016-01-25 14:31:12', '遂昌县', '浙江省丽水市遂昌县');
INSERT INTO `t_system_area` VALUES ('331124', ',330000,331100,', '331100', '2016-01-25 14:31:12', '松阳县', '浙江省丽水市松阳县');
INSERT INTO `t_system_area` VALUES ('331125', ',330000,331100,', '331100', '2016-01-25 14:31:12', '云和县', '浙江省丽水市云和县');
INSERT INTO `t_system_area` VALUES ('331126', ',330000,331100,', '331100', '2016-01-25 14:31:12', '庆元县', '浙江省丽水市庆元县');
INSERT INTO `t_system_area` VALUES ('331127', ',330000,331100,', '331100', '2016-01-25 14:31:12', '景宁畲族自治县', '浙江省丽水市景宁畲族自治县');
INSERT INTO `t_system_area` VALUES ('331181', ',330000,331100,', '331100', '2016-01-25 14:31:12', '龙泉市', '浙江省丽水市龙泉市');
INSERT INTO `t_system_area` VALUES ('331182', ',330000,331100,', '331100', '2016-01-25 14:31:12', '其它区', '浙江省丽水市其它区');
INSERT INTO `t_system_area` VALUES ('340000', ',', null, '2016-01-25 14:31:12', '安徽省', '安徽省');
INSERT INTO `t_system_area` VALUES ('340100', ',340000,', '340000', '2016-01-25 14:31:12', '合肥市', '安徽省合肥市');
INSERT INTO `t_system_area` VALUES ('340102', ',340000,340100,', '340100', '2016-01-25 14:31:12', '瑶海区', '安徽省合肥市瑶海区');
INSERT INTO `t_system_area` VALUES ('340103', ',340000,340100,', '340100', '2016-01-25 14:31:12', '庐阳区', '安徽省合肥市庐阳区');
INSERT INTO `t_system_area` VALUES ('340104', ',340000,340100,', '340100', '2016-01-25 14:31:12', '蜀山区', '安徽省合肥市蜀山区');
INSERT INTO `t_system_area` VALUES ('340111', ',340000,340100,', '340100', '2016-01-25 14:31:12', '包河区', '安徽省合肥市包河区');
INSERT INTO `t_system_area` VALUES ('340121', ',340000,340100,', '340100', '2016-01-25 14:31:12', '长丰县', '安徽省合肥市长丰县');
INSERT INTO `t_system_area` VALUES ('340122', ',340000,340100,', '340100', '2016-01-25 14:31:12', '肥东县', '安徽省合肥市肥东县');
INSERT INTO `t_system_area` VALUES ('340123', ',340000,340100,', '340100', '2016-01-25 14:31:12', '肥西县', '安徽省合肥市肥西县');
INSERT INTO `t_system_area` VALUES ('340151', ',340000,340100,', '340100', '2016-01-25 14:31:12', '高新区', '安徽省合肥市高新区');
INSERT INTO `t_system_area` VALUES ('340191', ',340000,340100,', '340100', '2016-01-25 14:31:12', '中区', '安徽省合肥市中区');
INSERT INTO `t_system_area` VALUES ('340192', ',340000,340100,', '340100', '2016-01-25 14:31:12', '其它区', '安徽省合肥市其它区');
INSERT INTO `t_system_area` VALUES ('340200', ',340000,', '340000', '2016-01-25 14:31:12', '芜湖市', '安徽省芜湖市');
INSERT INTO `t_system_area` VALUES ('340202', ',340000,340200,', '340200', '2016-01-25 14:31:12', '镜湖区', '安徽省芜湖市镜湖区');
INSERT INTO `t_system_area` VALUES ('340203', ',340000,340200,', '340200', '2016-01-25 14:31:12', '弋江区', '安徽省芜湖市弋江区');
INSERT INTO `t_system_area` VALUES ('340207', ',340000,340200,', '340200', '2016-01-25 14:31:12', '鸠江区', '安徽省芜湖市鸠江区');
INSERT INTO `t_system_area` VALUES ('340208', ',340000,340200,', '340200', '2016-01-25 14:31:12', '三山区', '安徽省芜湖市三山区');
INSERT INTO `t_system_area` VALUES ('340221', ',340000,340200,', '340200', '2016-01-25 14:31:12', '芜湖县', '安徽省芜湖市芜湖县');
INSERT INTO `t_system_area` VALUES ('340222', ',340000,340200,', '340200', '2016-01-25 14:31:12', '繁昌县', '安徽省芜湖市繁昌县');
INSERT INTO `t_system_area` VALUES ('340223', ',340000,340200,', '340200', '2016-01-25 14:31:12', '南陵县', '安徽省芜湖市南陵县');
INSERT INTO `t_system_area` VALUES ('340224', ',340000,340200,', '340200', '2016-01-25 14:31:12', '其它区', '安徽省芜湖市其它区');
INSERT INTO `t_system_area` VALUES ('340300', ',340000,', '340000', '2016-01-25 14:31:12', '蚌埠市', '安徽省蚌埠市');
INSERT INTO `t_system_area` VALUES ('340302', ',340000,340300,', '340300', '2016-01-25 14:31:12', '龙子湖区', '安徽省蚌埠市龙子湖区');
INSERT INTO `t_system_area` VALUES ('340303', ',340000,340300,', '340300', '2016-01-25 14:31:12', '蚌山区', '安徽省蚌埠市蚌山区');
INSERT INTO `t_system_area` VALUES ('340304', ',340000,340300,', '340300', '2016-01-25 14:31:12', '禹会区', '安徽省蚌埠市禹会区');
INSERT INTO `t_system_area` VALUES ('340311', ',340000,340300,', '340300', '2016-01-25 14:31:13', '淮上区', '安徽省蚌埠市淮上区');
INSERT INTO `t_system_area` VALUES ('340321', ',340000,340300,', '340300', '2016-01-25 14:31:13', '怀远县', '安徽省蚌埠市怀远县');
INSERT INTO `t_system_area` VALUES ('340322', ',340000,340300,', '340300', '2016-01-25 14:31:13', '五河县', '安徽省蚌埠市五河县');
INSERT INTO `t_system_area` VALUES ('340323', ',340000,340300,', '340300', '2016-01-25 14:31:13', '固镇县', '安徽省蚌埠市固镇县');
INSERT INTO `t_system_area` VALUES ('340324', ',340000,340300,', '340300', '2016-01-25 14:31:13', '其它区', '安徽省蚌埠市其它区');
INSERT INTO `t_system_area` VALUES ('340400', ',340000,', '340000', '2016-01-25 14:31:13', '淮南市', '安徽省淮南市');
INSERT INTO `t_system_area` VALUES ('340402', ',340000,340400,', '340400', '2016-01-25 14:31:13', '大通区', '安徽省淮南市大通区');
INSERT INTO `t_system_area` VALUES ('340403', ',340000,340400,', '340400', '2016-01-25 14:31:13', '田家庵区', '安徽省淮南市田家庵区');
INSERT INTO `t_system_area` VALUES ('340404', ',340000,340400,', '340400', '2016-01-25 14:31:13', '谢家集区', '安徽省淮南市谢家集区');
INSERT INTO `t_system_area` VALUES ('340405', ',340000,340400,', '340400', '2016-01-25 14:31:13', '八公山区', '安徽省淮南市八公山区');
INSERT INTO `t_system_area` VALUES ('340406', ',340000,340400,', '340400', '2016-01-25 14:31:13', '潘集区', '安徽省淮南市潘集区');
INSERT INTO `t_system_area` VALUES ('340421', ',340000,340400,', '340400', '2016-01-25 14:31:13', '凤台县', '安徽省淮南市凤台县');
INSERT INTO `t_system_area` VALUES ('340422', ',340000,340400,', '340400', '2016-01-25 14:31:13', '其它区', '安徽省淮南市其它区');
INSERT INTO `t_system_area` VALUES ('340500', ',340000,', '340000', '2016-01-25 14:31:13', '马鞍山市', '安徽省马鞍山市');
INSERT INTO `t_system_area` VALUES ('340502', ',340000,340500,', '340500', '2016-01-25 14:31:13', '金家庄区', '安徽省马鞍山市金家庄区');
INSERT INTO `t_system_area` VALUES ('340503', ',340000,340500,', '340500', '2016-01-25 14:31:13', '花山区', '安徽省马鞍山市花山区');
INSERT INTO `t_system_area` VALUES ('340504', ',340000,340500,', '340500', '2016-01-25 14:31:13', '雨山区', '安徽省马鞍山市雨山区');
INSERT INTO `t_system_area` VALUES ('340506', ',340000,340500,', '340500', '2016-01-25 14:31:13', '博望区', '安徽省马鞍山市博望区');
INSERT INTO `t_system_area` VALUES ('340521', ',340000,340500,', '340500', '2016-01-25 14:31:13', '当涂县', '安徽省马鞍山市当涂县');
INSERT INTO `t_system_area` VALUES ('340522', ',340000,340500,', '340500', '2016-01-25 14:31:13', '其它区', '安徽省马鞍山市其它区');
INSERT INTO `t_system_area` VALUES ('340600', ',340000,', '340000', '2016-01-25 14:31:13', '淮北市', '安徽省淮北市');
INSERT INTO `t_system_area` VALUES ('340602', ',340000,340600,', '340600', '2016-01-25 14:31:13', '杜集区', '安徽省淮北市杜集区');
INSERT INTO `t_system_area` VALUES ('340603', ',340000,340600,', '340600', '2016-01-25 14:31:13', '相山区', '安徽省淮北市相山区');
INSERT INTO `t_system_area` VALUES ('340604', ',340000,340600,', '340600', '2016-01-25 14:31:13', '烈山区', '安徽省淮北市烈山区');
INSERT INTO `t_system_area` VALUES ('340621', ',340000,340600,', '340600', '2016-01-25 14:31:13', '濉溪县', '安徽省淮北市濉溪县');
INSERT INTO `t_system_area` VALUES ('340622', ',340000,340600,', '340600', '2016-01-25 14:31:13', '其它区', '安徽省淮北市其它区');
INSERT INTO `t_system_area` VALUES ('340700', ',340000,', '340000', '2016-01-25 14:31:13', '铜陵市', '安徽省铜陵市');
INSERT INTO `t_system_area` VALUES ('340702', ',340000,340700,', '340700', '2016-01-25 14:31:13', '铜官山区', '安徽省铜陵市铜官山区');
INSERT INTO `t_system_area` VALUES ('340703', ',340000,340700,', '340700', '2016-01-25 14:31:13', '狮子山区', '安徽省铜陵市狮子山区');
INSERT INTO `t_system_area` VALUES ('340711', ',340000,340700,', '340700', '2016-01-25 14:31:13', '郊区', '安徽省铜陵市郊区');
INSERT INTO `t_system_area` VALUES ('340721', ',340000,340700,', '340700', '2016-01-25 14:31:13', '铜陵县', '安徽省铜陵市铜陵县');
INSERT INTO `t_system_area` VALUES ('340722', ',340000,340700,', '340700', '2016-01-25 14:31:13', '其它区', '安徽省铜陵市其它区');
INSERT INTO `t_system_area` VALUES ('340800', ',340000,', '340000', '2016-01-25 14:31:13', '安庆市', '安徽省安庆市');
INSERT INTO `t_system_area` VALUES ('340802', ',340000,340800,', '340800', '2016-01-25 14:31:13', '迎江区', '安徽省安庆市迎江区');
INSERT INTO `t_system_area` VALUES ('340803', ',340000,340800,', '340800', '2016-01-25 14:31:13', '大观区', '安徽省安庆市大观区');
INSERT INTO `t_system_area` VALUES ('340811', ',340000,340800,', '340800', '2016-01-25 14:31:13', '宜秀区', '安徽省安庆市宜秀区');
INSERT INTO `t_system_area` VALUES ('340822', ',340000,340800,', '340800', '2016-01-25 14:31:13', '怀宁县', '安徽省安庆市怀宁县');
INSERT INTO `t_system_area` VALUES ('340823', ',340000,340800,', '340800', '2016-01-25 14:31:13', '枞阳县', '安徽省安庆市枞阳县');
INSERT INTO `t_system_area` VALUES ('340824', ',340000,340800,', '340800', '2016-01-25 14:31:13', '潜山县', '安徽省安庆市潜山县');
INSERT INTO `t_system_area` VALUES ('340825', ',340000,340800,', '340800', '2016-01-25 14:31:13', '太湖县', '安徽省安庆市太湖县');
INSERT INTO `t_system_area` VALUES ('340826', ',340000,340800,', '340800', '2016-01-25 14:31:13', '宿松县', '安徽省安庆市宿松县');
INSERT INTO `t_system_area` VALUES ('340827', ',340000,340800,', '340800', '2016-01-25 14:31:13', '望江县', '安徽省安庆市望江县');
INSERT INTO `t_system_area` VALUES ('340828', ',340000,340800,', '340800', '2016-01-25 14:31:13', '岳西县', '安徽省安庆市岳西县');
INSERT INTO `t_system_area` VALUES ('340881', ',340000,340800,', '340800', '2016-01-25 14:31:13', '桐城市', '安徽省安庆市桐城市');
INSERT INTO `t_system_area` VALUES ('340882', ',340000,340800,', '340800', '2016-01-25 14:31:13', '其它区', '安徽省安庆市其它区');
INSERT INTO `t_system_area` VALUES ('341000', ',340000,', '340000', '2016-01-25 14:31:13', '黄山市', '安徽省黄山市');
INSERT INTO `t_system_area` VALUES ('341002', ',340000,341000,', '341000', '2016-01-25 14:31:13', '屯溪区', '安徽省黄山市屯溪区');
INSERT INTO `t_system_area` VALUES ('341003', ',340000,341000,', '341000', '2016-01-25 14:31:13', '黄山区', '安徽省黄山市黄山区');
INSERT INTO `t_system_area` VALUES ('341004', ',340000,341000,', '341000', '2016-01-25 14:31:13', '徽州区', '安徽省黄山市徽州区');
INSERT INTO `t_system_area` VALUES ('341021', ',340000,341000,', '341000', '2016-01-25 14:31:13', '歙县', '安徽省黄山市歙县');
INSERT INTO `t_system_area` VALUES ('341022', ',340000,341000,', '341000', '2016-01-25 14:31:13', '休宁县', '安徽省黄山市休宁县');
INSERT INTO `t_system_area` VALUES ('341023', ',340000,341000,', '341000', '2016-01-25 14:31:13', '黟县', '安徽省黄山市黟县');
INSERT INTO `t_system_area` VALUES ('341024', ',340000,341000,', '341000', '2016-01-25 14:31:13', '祁门县', '安徽省黄山市祁门县');
INSERT INTO `t_system_area` VALUES ('341025', ',340000,341000,', '341000', '2016-01-25 14:31:13', '其它区', '安徽省黄山市其它区');
INSERT INTO `t_system_area` VALUES ('341100', ',340000,', '340000', '2016-01-25 14:31:13', '滁州市', '安徽省滁州市');
INSERT INTO `t_system_area` VALUES ('341102', ',340000,341100,', '341100', '2016-01-25 14:31:13', '琅琊区', '安徽省滁州市琅琊区');
INSERT INTO `t_system_area` VALUES ('341103', ',340000,341100,', '341100', '2016-01-25 14:31:13', '南谯区', '安徽省滁州市南谯区');
INSERT INTO `t_system_area` VALUES ('341122', ',340000,341100,', '341100', '2016-01-25 14:31:13', '来安县', '安徽省滁州市来安县');
INSERT INTO `t_system_area` VALUES ('341124', ',340000,341100,', '341100', '2016-01-25 14:31:13', '全椒县', '安徽省滁州市全椒县');
INSERT INTO `t_system_area` VALUES ('341125', ',340000,341100,', '341100', '2016-01-25 14:31:13', '定远县', '安徽省滁州市定远县');
INSERT INTO `t_system_area` VALUES ('341126', ',340000,341100,', '341100', '2016-01-25 14:31:13', '凤阳县', '安徽省滁州市凤阳县');
INSERT INTO `t_system_area` VALUES ('341181', ',340000,341100,', '341100', '2016-01-25 14:31:13', '天长市', '安徽省滁州市天长市');
INSERT INTO `t_system_area` VALUES ('341182', ',340000,341100,', '341100', '2016-01-25 14:31:13', '明光市', '安徽省滁州市明光市');
INSERT INTO `t_system_area` VALUES ('341183', ',340000,341100,', '341100', '2016-01-25 14:31:13', '其它区', '安徽省滁州市其它区');
INSERT INTO `t_system_area` VALUES ('341200', ',340000,', '340000', '2016-01-25 14:31:13', '阜阳市', '安徽省阜阳市');
INSERT INTO `t_system_area` VALUES ('341202', ',340000,341200,', '341200', '2016-01-25 14:31:13', '颍州区', '安徽省阜阳市颍州区');
INSERT INTO `t_system_area` VALUES ('341203', ',340000,341200,', '341200', '2016-01-25 14:31:13', '颍东区', '安徽省阜阳市颍东区');
INSERT INTO `t_system_area` VALUES ('341204', ',340000,341200,', '341200', '2016-01-25 14:31:13', '颍泉区', '安徽省阜阳市颍泉区');
INSERT INTO `t_system_area` VALUES ('341221', ',340000,341200,', '341200', '2016-01-25 14:31:13', '临泉县', '安徽省阜阳市临泉县');
INSERT INTO `t_system_area` VALUES ('341222', ',340000,341200,', '341200', '2016-01-25 14:31:13', '太和县', '安徽省阜阳市太和县');
INSERT INTO `t_system_area` VALUES ('341225', ',340000,341200,', '341200', '2016-01-25 14:31:13', '阜南县', '安徽省阜阳市阜南县');
INSERT INTO `t_system_area` VALUES ('341226', ',340000,341200,', '341200', '2016-01-25 14:31:13', '颍上县', '安徽省阜阳市颍上县');
INSERT INTO `t_system_area` VALUES ('341282', ',340000,341200,', '341200', '2016-01-25 14:31:13', '界首市', '安徽省阜阳市界首市');
INSERT INTO `t_system_area` VALUES ('341283', ',340000,341200,', '341200', '2016-01-25 14:31:13', '其它区', '安徽省阜阳市其它区');
INSERT INTO `t_system_area` VALUES ('341300', ',340000,', '340000', '2016-01-25 14:31:13', '宿州市', '安徽省宿州市');
INSERT INTO `t_system_area` VALUES ('341302', ',340000,341300,', '341300', '2016-01-25 14:31:13', '埇桥区', '安徽省宿州市埇桥区');
INSERT INTO `t_system_area` VALUES ('341321', ',340000,341300,', '341300', '2016-01-25 14:31:13', '砀山县', '安徽省宿州市砀山县');
INSERT INTO `t_system_area` VALUES ('341322', ',340000,341300,', '341300', '2016-01-25 14:31:13', '萧县', '安徽省宿州市萧县');
INSERT INTO `t_system_area` VALUES ('341323', ',340000,341300,', '341300', '2016-01-25 14:31:13', '灵璧县', '安徽省宿州市灵璧县');
INSERT INTO `t_system_area` VALUES ('341324', ',340000,341300,', '341300', '2016-01-25 14:31:13', '泗县', '安徽省宿州市泗县');
INSERT INTO `t_system_area` VALUES ('341325', ',340000,341300,', '341300', '2016-01-25 14:31:13', '其它区', '安徽省宿州市其它区');
INSERT INTO `t_system_area` VALUES ('341400', ',340000,340100,', '340100', '2016-01-25 14:31:12', '巢湖市', '安徽省合肥市巢湖市');
INSERT INTO `t_system_area` VALUES ('341402', ',340000,340100,', '340100', '2016-01-25 14:31:12', '居巢区', '安徽省合肥市居巢区');
INSERT INTO `t_system_area` VALUES ('341421', ',340000,340100,', '340100', '2016-01-25 14:31:12', '庐江县', '安徽省合肥市庐江县');
INSERT INTO `t_system_area` VALUES ('341422', ',340000,340200,', '340200', '2016-01-25 14:31:12', '无为县', '安徽省芜湖市无为县');
INSERT INTO `t_system_area` VALUES ('341423', ',340000,340500,', '340500', '2016-01-25 14:31:13', '含山县', '安徽省马鞍山市含山县');
INSERT INTO `t_system_area` VALUES ('341424', ',340000,340500,', '340500', '2016-01-25 14:31:13', '和县', '安徽省马鞍山市和县');
INSERT INTO `t_system_area` VALUES ('341500', ',340000,', '340000', '2016-01-25 14:31:13', '六安市', '安徽省六安市');
INSERT INTO `t_system_area` VALUES ('341502', ',340000,341500,', '341500', '2016-01-25 14:31:13', '金安区', '安徽省六安市金安区');
INSERT INTO `t_system_area` VALUES ('341503', ',340000,341500,', '341500', '2016-01-25 14:31:13', '裕安区', '安徽省六安市裕安区');
INSERT INTO `t_system_area` VALUES ('341521', ',340000,341500,', '341500', '2016-01-25 14:31:13', '寿县', '安徽省六安市寿县');
INSERT INTO `t_system_area` VALUES ('341522', ',340000,341500,', '341500', '2016-01-25 14:31:13', '霍邱县', '安徽省六安市霍邱县');
INSERT INTO `t_system_area` VALUES ('341523', ',340000,341500,', '341500', '2016-01-25 14:31:13', '舒城县', '安徽省六安市舒城县');
INSERT INTO `t_system_area` VALUES ('341524', ',340000,341500,', '341500', '2016-01-25 14:31:13', '金寨县', '安徽省六安市金寨县');
INSERT INTO `t_system_area` VALUES ('341525', ',340000,341500,', '341500', '2016-01-25 14:31:13', '霍山县', '安徽省六安市霍山县');
INSERT INTO `t_system_area` VALUES ('341526', ',340000,341500,', '341500', '2016-01-25 14:31:13', '其它区', '安徽省六安市其它区');
INSERT INTO `t_system_area` VALUES ('341600', ',340000,', '340000', '2016-01-25 14:31:13', '亳州市', '安徽省亳州市');
INSERT INTO `t_system_area` VALUES ('341602', ',340000,341600,', '341600', '2016-01-25 14:31:13', '谯城区', '安徽省亳州市谯城区');
INSERT INTO `t_system_area` VALUES ('341621', ',340000,341600,', '341600', '2016-01-25 14:31:13', '涡阳县', '安徽省亳州市涡阳县');
INSERT INTO `t_system_area` VALUES ('341622', ',340000,341600,', '341600', '2016-01-25 14:31:13', '蒙城县', '安徽省亳州市蒙城县');
INSERT INTO `t_system_area` VALUES ('341623', ',340000,341600,', '341600', '2016-01-25 14:31:13', '利辛县', '安徽省亳州市利辛县');
INSERT INTO `t_system_area` VALUES ('341624', ',340000,341600,', '341600', '2016-01-25 14:31:14', '其它区', '安徽省亳州市其它区');
INSERT INTO `t_system_area` VALUES ('341700', ',340000,', '340000', '2016-01-25 14:31:14', '池州市', '安徽省池州市');
INSERT INTO `t_system_area` VALUES ('341702', ',340000,341700,', '341700', '2016-01-25 14:31:14', '贵池区', '安徽省池州市贵池区');
INSERT INTO `t_system_area` VALUES ('341721', ',340000,341700,', '341700', '2016-01-25 14:31:14', '东至县', '安徽省池州市东至县');
INSERT INTO `t_system_area` VALUES ('341722', ',340000,341700,', '341700', '2016-01-25 14:31:14', '石台县', '安徽省池州市石台县');
INSERT INTO `t_system_area` VALUES ('341723', ',340000,341700,', '341700', '2016-01-25 14:31:14', '青阳县', '安徽省池州市青阳县');
INSERT INTO `t_system_area` VALUES ('341724', ',340000,341700,', '341700', '2016-01-25 14:31:14', '其它区', '安徽省池州市其它区');
INSERT INTO `t_system_area` VALUES ('341800', ',340000,', '340000', '2016-01-25 14:31:14', '宣城市', '安徽省宣城市');
INSERT INTO `t_system_area` VALUES ('341802', ',340000,341800,', '341800', '2016-01-25 14:31:14', '宣州区', '安徽省宣城市宣州区');
INSERT INTO `t_system_area` VALUES ('341821', ',340000,341800,', '341800', '2016-01-25 14:31:14', '郎溪县', '安徽省宣城市郎溪县');
INSERT INTO `t_system_area` VALUES ('341822', ',340000,341800,', '341800', '2016-01-25 14:31:14', '广德县', '安徽省宣城市广德县');
INSERT INTO `t_system_area` VALUES ('341823', ',340000,341800,', '341800', '2016-01-25 14:31:14', '泾县', '安徽省宣城市泾县');
INSERT INTO `t_system_area` VALUES ('341824', ',340000,341800,', '341800', '2016-01-25 14:31:14', '绩溪县', '安徽省宣城市绩溪县');
INSERT INTO `t_system_area` VALUES ('341825', ',340000,341800,', '341800', '2016-01-25 14:31:14', '旌德县', '安徽省宣城市旌德县');
INSERT INTO `t_system_area` VALUES ('341881', ',340000,341800,', '341800', '2016-01-25 14:31:14', '宁国市', '安徽省宣城市宁国市');
INSERT INTO `t_system_area` VALUES ('341882', ',340000,341800,', '341800', '2016-01-25 14:31:14', '其它区', '安徽省宣城市其它区');
INSERT INTO `t_system_area` VALUES ('350000', ',', null, '2016-01-25 14:31:14', '福建省', '福建省');
INSERT INTO `t_system_area` VALUES ('350100', ',350000,', '350000', '2016-01-25 14:31:14', '福州市', '福建省福州市');
INSERT INTO `t_system_area` VALUES ('350102', ',350000,350100,', '350100', '2016-01-25 14:31:14', '鼓楼区', '福建省福州市鼓楼区');
INSERT INTO `t_system_area` VALUES ('350103', ',350000,350100,', '350100', '2016-01-25 14:31:14', '台江区', '福建省福州市台江区');
INSERT INTO `t_system_area` VALUES ('350104', ',350000,350100,', '350100', '2016-01-25 14:31:14', '仓山区', '福建省福州市仓山区');
INSERT INTO `t_system_area` VALUES ('350105', ',350000,350100,', '350100', '2016-01-25 14:31:14', '马尾区', '福建省福州市马尾区');
INSERT INTO `t_system_area` VALUES ('350111', ',350000,350100,', '350100', '2016-01-25 14:31:14', '晋安区', '福建省福州市晋安区');
INSERT INTO `t_system_area` VALUES ('350121', ',350000,350100,', '350100', '2016-01-25 14:31:14', '闽侯县', '福建省福州市闽侯县');
INSERT INTO `t_system_area` VALUES ('350122', ',350000,350100,', '350100', '2016-01-25 14:31:14', '连江县', '福建省福州市连江县');
INSERT INTO `t_system_area` VALUES ('350123', ',350000,350100,', '350100', '2016-01-25 14:31:14', '罗源县', '福建省福州市罗源县');
INSERT INTO `t_system_area` VALUES ('350124', ',350000,350100,', '350100', '2016-01-25 14:31:14', '闽清县', '福建省福州市闽清县');
INSERT INTO `t_system_area` VALUES ('350125', ',350000,350100,', '350100', '2016-01-25 14:31:14', '永泰县', '福建省福州市永泰县');
INSERT INTO `t_system_area` VALUES ('350128', ',350000,350100,', '350100', '2016-01-25 14:31:14', '平潭县', '福建省福州市平潭县');
INSERT INTO `t_system_area` VALUES ('350181', ',350000,350100,', '350100', '2016-01-25 14:31:14', '福清市', '福建省福州市福清市');
INSERT INTO `t_system_area` VALUES ('350182', ',350000,350100,', '350100', '2016-01-25 14:31:14', '长乐市', '福建省福州市长乐市');
INSERT INTO `t_system_area` VALUES ('350183', ',350000,350100,', '350100', '2016-01-25 14:31:14', '其它区', '福建省福州市其它区');
INSERT INTO `t_system_area` VALUES ('350200', ',350000,', '350000', '2016-01-25 14:31:14', '厦门市', '福建省厦门市');
INSERT INTO `t_system_area` VALUES ('350203', ',350000,350200,', '350200', '2016-01-25 14:31:14', '思明区', '福建省厦门市思明区');
INSERT INTO `t_system_area` VALUES ('350205', ',350000,350200,', '350200', '2016-01-25 14:31:14', '海沧区', '福建省厦门市海沧区');
INSERT INTO `t_system_area` VALUES ('350206', ',350000,350200,', '350200', '2016-01-25 14:31:14', '湖里区', '福建省厦门市湖里区');
INSERT INTO `t_system_area` VALUES ('350211', ',350000,350200,', '350200', '2016-01-25 14:31:14', '集美区', '福建省厦门市集美区');
INSERT INTO `t_system_area` VALUES ('350212', ',350000,350200,', '350200', '2016-01-25 14:31:14', '同安区', '福建省厦门市同安区');
INSERT INTO `t_system_area` VALUES ('350213', ',350000,350200,', '350200', '2016-01-25 14:31:14', '翔安区', '福建省厦门市翔安区');
INSERT INTO `t_system_area` VALUES ('350214', ',350000,350200,', '350200', '2016-01-25 14:31:14', '其它区', '福建省厦门市其它区');
INSERT INTO `t_system_area` VALUES ('350300', ',350000,', '350000', '2016-01-25 14:31:14', '莆田市', '福建省莆田市');
INSERT INTO `t_system_area` VALUES ('350302', ',350000,350300,', '350300', '2016-01-25 14:31:14', '城厢区', '福建省莆田市城厢区');
INSERT INTO `t_system_area` VALUES ('350303', ',350000,350300,', '350300', '2016-01-25 14:31:14', '涵江区', '福建省莆田市涵江区');
INSERT INTO `t_system_area` VALUES ('350304', ',350000,350300,', '350300', '2016-01-25 14:31:14', '荔城区', '福建省莆田市荔城区');
INSERT INTO `t_system_area` VALUES ('350305', ',350000,350300,', '350300', '2016-01-25 14:31:14', '秀屿区', '福建省莆田市秀屿区');
INSERT INTO `t_system_area` VALUES ('350322', ',350000,350300,', '350300', '2016-01-25 14:31:14', '仙游县', '福建省莆田市仙游县');
INSERT INTO `t_system_area` VALUES ('350323', ',350000,350300,', '350300', '2016-01-25 14:31:14', '其它区', '福建省莆田市其它区');
INSERT INTO `t_system_area` VALUES ('350400', ',350000,', '350000', '2016-01-25 14:31:14', '三明市', '福建省三明市');
INSERT INTO `t_system_area` VALUES ('350402', ',350000,350400,', '350400', '2016-01-25 14:31:14', '梅列区', '福建省三明市梅列区');
INSERT INTO `t_system_area` VALUES ('350403', ',350000,350400,', '350400', '2016-01-25 14:31:14', '三元区', '福建省三明市三元区');
INSERT INTO `t_system_area` VALUES ('350421', ',350000,350400,', '350400', '2016-01-25 14:31:14', '明溪县', '福建省三明市明溪县');
INSERT INTO `t_system_area` VALUES ('350423', ',350000,350400,', '350400', '2016-01-25 14:31:14', '清流县', '福建省三明市清流县');
INSERT INTO `t_system_area` VALUES ('350424', ',350000,350400,', '350400', '2016-01-25 14:31:14', '宁化县', '福建省三明市宁化县');
INSERT INTO `t_system_area` VALUES ('350425', ',350000,350400,', '350400', '2016-01-25 14:31:14', '大田县', '福建省三明市大田县');
INSERT INTO `t_system_area` VALUES ('350426', ',350000,350400,', '350400', '2016-01-25 14:31:14', '尤溪县', '福建省三明市尤溪县');
INSERT INTO `t_system_area` VALUES ('350427', ',350000,350400,', '350400', '2016-01-25 14:31:14', '沙县', '福建省三明市沙县');
INSERT INTO `t_system_area` VALUES ('350428', ',350000,350400,', '350400', '2016-01-25 14:31:14', '将乐县', '福建省三明市将乐县');
INSERT INTO `t_system_area` VALUES ('350429', ',350000,350400,', '350400', '2016-01-25 14:31:14', '泰宁县', '福建省三明市泰宁县');
INSERT INTO `t_system_area` VALUES ('350430', ',350000,350400,', '350400', '2016-01-25 14:31:14', '建宁县', '福建省三明市建宁县');
INSERT INTO `t_system_area` VALUES ('350481', ',350000,350400,', '350400', '2016-01-25 14:31:14', '永安市', '福建省三明市永安市');
INSERT INTO `t_system_area` VALUES ('350482', ',350000,350400,', '350400', '2016-01-25 14:31:14', '其它区', '福建省三明市其它区');
INSERT INTO `t_system_area` VALUES ('350500', ',350000,', '350000', '2016-01-25 14:31:14', '泉州市', '福建省泉州市');
INSERT INTO `t_system_area` VALUES ('350502', ',350000,350500,', '350500', '2016-01-25 14:31:14', '鲤城区', '福建省泉州市鲤城区');
INSERT INTO `t_system_area` VALUES ('350503', ',350000,350500,', '350500', '2016-01-25 14:31:14', '丰泽区', '福建省泉州市丰泽区');
INSERT INTO `t_system_area` VALUES ('350504', ',350000,350500,', '350500', '2016-01-25 14:31:14', '洛江区', '福建省泉州市洛江区');
INSERT INTO `t_system_area` VALUES ('350505', ',350000,350500,', '350500', '2016-01-25 14:31:14', '泉港区', '福建省泉州市泉港区');
INSERT INTO `t_system_area` VALUES ('350521', ',350000,350500,', '350500', '2016-01-25 14:31:14', '惠安县', '福建省泉州市惠安县');
INSERT INTO `t_system_area` VALUES ('350524', ',350000,350500,', '350500', '2016-01-25 14:31:14', '安溪县', '福建省泉州市安溪县');
INSERT INTO `t_system_area` VALUES ('350525', ',350000,350500,', '350500', '2016-01-25 14:31:14', '永春县', '福建省泉州市永春县');
INSERT INTO `t_system_area` VALUES ('350526', ',350000,350500,', '350500', '2016-01-25 14:31:14', '德化县', '福建省泉州市德化县');
INSERT INTO `t_system_area` VALUES ('350527', ',350000,350500,', '350500', '2016-01-25 14:31:14', '金门县', '福建省泉州市金门县');
INSERT INTO `t_system_area` VALUES ('350581', ',350000,350500,', '350500', '2016-01-25 14:31:14', '石狮市', '福建省泉州市石狮市');
INSERT INTO `t_system_area` VALUES ('350582', ',350000,350500,', '350500', '2016-01-25 14:31:14', '晋江市', '福建省泉州市晋江市');
INSERT INTO `t_system_area` VALUES ('350583', ',350000,350500,', '350500', '2016-01-25 14:31:14', '南安市', '福建省泉州市南安市');
INSERT INTO `t_system_area` VALUES ('350584', ',350000,350500,', '350500', '2016-01-25 14:31:14', '其它区', '福建省泉州市其它区');
INSERT INTO `t_system_area` VALUES ('350600', ',350000,', '350000', '2016-01-25 14:31:14', '漳州市', '福建省漳州市');
INSERT INTO `t_system_area` VALUES ('350602', ',350000,350600,', '350600', '2016-01-25 14:31:14', '芗城区', '福建省漳州市芗城区');
INSERT INTO `t_system_area` VALUES ('350603', ',350000,350600,', '350600', '2016-01-25 14:31:14', '龙文区', '福建省漳州市龙文区');
INSERT INTO `t_system_area` VALUES ('350622', ',350000,350600,', '350600', '2016-01-25 14:31:14', '云霄县', '福建省漳州市云霄县');
INSERT INTO `t_system_area` VALUES ('350623', ',350000,350600,', '350600', '2016-01-25 14:31:14', '漳浦县', '福建省漳州市漳浦县');
INSERT INTO `t_system_area` VALUES ('350624', ',350000,350600,', '350600', '2016-01-25 14:31:14', '诏安县', '福建省漳州市诏安县');
INSERT INTO `t_system_area` VALUES ('350625', ',350000,350600,', '350600', '2016-01-25 14:31:14', '长泰县', '福建省漳州市长泰县');
INSERT INTO `t_system_area` VALUES ('350626', ',350000,350600,', '350600', '2016-01-25 14:31:14', '东山县', '福建省漳州市东山县');
INSERT INTO `t_system_area` VALUES ('350627', ',350000,350600,', '350600', '2016-01-25 14:31:14', '南靖县', '福建省漳州市南靖县');
INSERT INTO `t_system_area` VALUES ('350628', ',350000,350600,', '350600', '2016-01-25 14:31:14', '平和县', '福建省漳州市平和县');
INSERT INTO `t_system_area` VALUES ('350629', ',350000,350600,', '350600', '2016-01-25 14:31:14', '华安县', '福建省漳州市华安县');
INSERT INTO `t_system_area` VALUES ('350681', ',350000,350600,', '350600', '2016-01-25 14:31:14', '龙海市', '福建省漳州市龙海市');
INSERT INTO `t_system_area` VALUES ('350682', ',350000,350600,', '350600', '2016-01-25 14:31:14', '其它区', '福建省漳州市其它区');
INSERT INTO `t_system_area` VALUES ('350700', ',350000,', '350000', '2016-01-25 14:31:14', '南平市', '福建省南平市');
INSERT INTO `t_system_area` VALUES ('350702', ',350000,350700,', '350700', '2016-01-25 14:31:14', '延平区', '福建省南平市延平区');
INSERT INTO `t_system_area` VALUES ('350721', ',350000,350700,', '350700', '2016-01-25 14:31:14', '顺昌县', '福建省南平市顺昌县');
INSERT INTO `t_system_area` VALUES ('350722', ',350000,350700,', '350700', '2016-01-25 14:31:14', '浦城县', '福建省南平市浦城县');
INSERT INTO `t_system_area` VALUES ('350723', ',350000,350700,', '350700', '2016-01-25 14:31:14', '光泽县', '福建省南平市光泽县');
INSERT INTO `t_system_area` VALUES ('350724', ',350000,350700,', '350700', '2016-01-25 14:31:14', '松溪县', '福建省南平市松溪县');
INSERT INTO `t_system_area` VALUES ('350725', ',350000,350700,', '350700', '2016-01-25 14:31:14', '政和县', '福建省南平市政和县');
INSERT INTO `t_system_area` VALUES ('350781', ',350000,350700,', '350700', '2016-01-25 14:31:14', '邵武市', '福建省南平市邵武市');
INSERT INTO `t_system_area` VALUES ('350782', ',350000,350700,', '350700', '2016-01-25 14:31:14', '武夷山市', '福建省南平市武夷山市');
INSERT INTO `t_system_area` VALUES ('350783', ',350000,350700,', '350700', '2016-01-25 14:31:14', '建瓯市', '福建省南平市建瓯市');
INSERT INTO `t_system_area` VALUES ('350784', ',350000,350700,', '350700', '2016-01-25 14:31:14', '建阳市', '福建省南平市建阳市');
INSERT INTO `t_system_area` VALUES ('350785', ',350000,350700,', '350700', '2016-01-25 14:31:14', '其它区', '福建省南平市其它区');
INSERT INTO `t_system_area` VALUES ('350800', ',350000,', '350000', '2016-01-25 14:31:14', '龙岩市', '福建省龙岩市');
INSERT INTO `t_system_area` VALUES ('350802', ',350000,350800,', '350800', '2016-01-25 14:31:14', '新罗区', '福建省龙岩市新罗区');
INSERT INTO `t_system_area` VALUES ('350821', ',350000,350800,', '350800', '2016-01-25 14:31:14', '长汀县', '福建省龙岩市长汀县');
INSERT INTO `t_system_area` VALUES ('350822', ',350000,350800,', '350800', '2016-01-25 14:31:14', '永定县', '福建省龙岩市永定县');
INSERT INTO `t_system_area` VALUES ('350823', ',350000,350800,', '350800', '2016-01-25 14:31:14', '上杭县', '福建省龙岩市上杭县');
INSERT INTO `t_system_area` VALUES ('350824', ',350000,350800,', '350800', '2016-01-25 14:31:14', '武平县', '福建省龙岩市武平县');
INSERT INTO `t_system_area` VALUES ('350825', ',350000,350800,', '350800', '2016-01-25 14:31:15', '连城县', '福建省龙岩市连城县');
INSERT INTO `t_system_area` VALUES ('350881', ',350000,350800,', '350800', '2016-01-25 14:31:15', '漳平市', '福建省龙岩市漳平市');
INSERT INTO `t_system_area` VALUES ('350882', ',350000,350800,', '350800', '2016-01-25 14:31:15', '其它区', '福建省龙岩市其它区');
INSERT INTO `t_system_area` VALUES ('350900', ',350000,', '350000', '2016-01-25 14:31:15', '宁德市', '福建省宁德市');
INSERT INTO `t_system_area` VALUES ('350902', ',350000,350900,', '350900', '2016-01-25 14:31:15', '蕉城区', '福建省宁德市蕉城区');
INSERT INTO `t_system_area` VALUES ('350921', ',350000,350900,', '350900', '2016-01-25 14:31:15', '霞浦县', '福建省宁德市霞浦县');
INSERT INTO `t_system_area` VALUES ('350922', ',350000,350900,', '350900', '2016-01-25 14:31:15', '古田县', '福建省宁德市古田县');
INSERT INTO `t_system_area` VALUES ('350923', ',350000,350900,', '350900', '2016-01-25 14:31:15', '屏南县', '福建省宁德市屏南县');
INSERT INTO `t_system_area` VALUES ('350924', ',350000,350900,', '350900', '2016-01-25 14:31:15', '寿宁县', '福建省宁德市寿宁县');
INSERT INTO `t_system_area` VALUES ('350925', ',350000,350900,', '350900', '2016-01-25 14:31:15', '周宁县', '福建省宁德市周宁县');
INSERT INTO `t_system_area` VALUES ('350926', ',350000,350900,', '350900', '2016-01-25 14:31:15', '柘荣县', '福建省宁德市柘荣县');
INSERT INTO `t_system_area` VALUES ('350981', ',350000,350900,', '350900', '2016-01-25 14:31:15', '福安市', '福建省宁德市福安市');
INSERT INTO `t_system_area` VALUES ('350982', ',350000,350900,', '350900', '2016-01-25 14:31:15', '福鼎市', '福建省宁德市福鼎市');
INSERT INTO `t_system_area` VALUES ('350983', ',350000,350900,', '350900', '2016-01-25 14:31:15', '其它区', '福建省宁德市其它区');
INSERT INTO `t_system_area` VALUES ('360000', ',', null, '2016-01-25 14:31:15', '江西省', '江西省');
INSERT INTO `t_system_area` VALUES ('360100', ',360000,', '360000', '2016-01-25 14:31:15', '南昌市', '江西省南昌市');
INSERT INTO `t_system_area` VALUES ('360102', ',360000,360100,', '360100', '2016-01-25 14:31:15', '东湖区', '江西省南昌市东湖区');
INSERT INTO `t_system_area` VALUES ('360103', ',360000,360100,', '360100', '2016-01-25 14:31:15', '西湖区', '江西省南昌市西湖区');
INSERT INTO `t_system_area` VALUES ('360104', ',360000,360100,', '360100', '2016-01-25 14:31:15', '青云谱区', '江西省南昌市青云谱区');
INSERT INTO `t_system_area` VALUES ('360105', ',360000,360100,', '360100', '2016-01-25 14:31:15', '湾里区', '江西省南昌市湾里区');
INSERT INTO `t_system_area` VALUES ('360111', ',360000,360100,', '360100', '2016-01-25 14:31:15', '青山湖区', '江西省南昌市青山湖区');
INSERT INTO `t_system_area` VALUES ('360121', ',360000,360100,', '360100', '2016-01-25 14:31:15', '南昌县', '江西省南昌市南昌县');
INSERT INTO `t_system_area` VALUES ('360122', ',360000,360100,', '360100', '2016-01-25 14:31:15', '新建县', '江西省南昌市新建县');
INSERT INTO `t_system_area` VALUES ('360123', ',360000,360100,', '360100', '2016-01-25 14:31:15', '安义县', '江西省南昌市安义县');
INSERT INTO `t_system_area` VALUES ('360124', ',360000,360100,', '360100', '2016-01-25 14:31:15', '进贤县', '江西省南昌市进贤县');
INSERT INTO `t_system_area` VALUES ('360125', ',360000,360100,', '360100', '2016-01-25 14:31:15', '红谷滩新区', '江西省南昌市红谷滩新区');
INSERT INTO `t_system_area` VALUES ('360126', ',360000,360100,', '360100', '2016-01-25 14:31:15', '经济技术开发区', '江西省南昌市经济技术开发区');
INSERT INTO `t_system_area` VALUES ('360127', ',360000,360100,', '360100', '2016-01-25 14:31:15', '昌北区', '江西省南昌市昌北区');
INSERT INTO `t_system_area` VALUES ('360128', ',360000,360100,', '360100', '2016-01-25 14:31:15', '其它区', '江西省南昌市其它区');
INSERT INTO `t_system_area` VALUES ('360200', ',360000,', '360000', '2016-01-25 14:31:15', '景德镇市', '江西省景德镇市');
INSERT INTO `t_system_area` VALUES ('360202', ',360000,360200,', '360200', '2016-01-25 14:31:15', '昌江区', '江西省景德镇市昌江区');
INSERT INTO `t_system_area` VALUES ('360203', ',360000,360200,', '360200', '2016-01-25 14:31:15', '珠山区', '江西省景德镇市珠山区');
INSERT INTO `t_system_area` VALUES ('360222', ',360000,360200,', '360200', '2016-01-25 14:31:15', '浮梁县', '江西省景德镇市浮梁县');
INSERT INTO `t_system_area` VALUES ('360281', ',360000,360200,', '360200', '2016-01-25 14:31:15', '乐平市', '江西省景德镇市乐平市');
INSERT INTO `t_system_area` VALUES ('360282', ',360000,360200,', '360200', '2016-01-25 14:31:15', '其它区', '江西省景德镇市其它区');
INSERT INTO `t_system_area` VALUES ('360300', ',360000,', '360000', '2016-01-25 14:31:15', '萍乡市', '江西省萍乡市');
INSERT INTO `t_system_area` VALUES ('360302', ',360000,360300,', '360300', '2016-01-25 14:31:15', '安源区', '江西省萍乡市安源区');
INSERT INTO `t_system_area` VALUES ('360313', ',360000,360300,', '360300', '2016-01-25 14:31:15', '湘东区', '江西省萍乡市湘东区');
INSERT INTO `t_system_area` VALUES ('360321', ',360000,360300,', '360300', '2016-01-25 14:31:15', '莲花县', '江西省萍乡市莲花县');
INSERT INTO `t_system_area` VALUES ('360322', ',360000,360300,', '360300', '2016-01-25 14:31:15', '上栗县', '江西省萍乡市上栗县');
INSERT INTO `t_system_area` VALUES ('360323', ',360000,360300,', '360300', '2016-01-25 14:31:15', '芦溪县', '江西省萍乡市芦溪县');
INSERT INTO `t_system_area` VALUES ('360324', ',360000,360300,', '360300', '2016-01-25 14:31:15', '其它区', '江西省萍乡市其它区');
INSERT INTO `t_system_area` VALUES ('360400', ',360000,', '360000', '2016-01-25 14:31:15', '九江市', '江西省九江市');
INSERT INTO `t_system_area` VALUES ('360402', ',360000,360400,', '360400', '2016-01-25 14:31:15', '庐山区', '江西省九江市庐山区');
INSERT INTO `t_system_area` VALUES ('360403', ',360000,360400,', '360400', '2016-01-25 14:31:15', '浔阳区', '江西省九江市浔阳区');
INSERT INTO `t_system_area` VALUES ('360421', ',360000,360400,', '360400', '2016-01-25 14:31:15', '九江县', '江西省九江市九江县');
INSERT INTO `t_system_area` VALUES ('360423', ',360000,360400,', '360400', '2016-01-25 14:31:15', '武宁县', '江西省九江市武宁县');
INSERT INTO `t_system_area` VALUES ('360424', ',360000,360400,', '360400', '2016-01-25 14:31:15', '修水县', '江西省九江市修水县');
INSERT INTO `t_system_area` VALUES ('360425', ',360000,360400,', '360400', '2016-01-25 14:31:15', '永修县', '江西省九江市永修县');
INSERT INTO `t_system_area` VALUES ('360426', ',360000,360400,', '360400', '2016-01-25 14:31:15', '德安县', '江西省九江市德安县');
INSERT INTO `t_system_area` VALUES ('360427', ',360000,360400,', '360400', '2016-01-25 14:31:15', '星子县', '江西省九江市星子县');
INSERT INTO `t_system_area` VALUES ('360428', ',360000,360400,', '360400', '2016-01-25 14:31:15', '都昌县', '江西省九江市都昌县');
INSERT INTO `t_system_area` VALUES ('360429', ',360000,360400,', '360400', '2016-01-25 14:31:15', '湖口县', '江西省九江市湖口县');
INSERT INTO `t_system_area` VALUES ('360430', ',360000,360400,', '360400', '2016-01-25 14:31:15', '彭泽县', '江西省九江市彭泽县');
INSERT INTO `t_system_area` VALUES ('360481', ',360000,360400,', '360400', '2016-01-25 14:31:15', '瑞昌市', '江西省九江市瑞昌市');
INSERT INTO `t_system_area` VALUES ('360482', ',360000,360400,', '360400', '2016-01-25 14:31:15', '其它区', '江西省九江市其它区');
INSERT INTO `t_system_area` VALUES ('360483', ',360000,360400,', '360400', '2016-01-25 14:31:15', '共青城市', '江西省九江市共青城市');
INSERT INTO `t_system_area` VALUES ('360500', ',360000,', '360000', '2016-01-25 14:31:15', '新余市', '江西省新余市');
INSERT INTO `t_system_area` VALUES ('360502', ',360000,360500,', '360500', '2016-01-25 14:31:15', '渝水区', '江西省新余市渝水区');
INSERT INTO `t_system_area` VALUES ('360521', ',360000,360500,', '360500', '2016-01-25 14:31:15', '分宜县', '江西省新余市分宜县');
INSERT INTO `t_system_area` VALUES ('360522', ',360000,360500,', '360500', '2016-01-25 14:31:15', '其它区', '江西省新余市其它区');
INSERT INTO `t_system_area` VALUES ('360600', ',360000,', '360000', '2016-01-25 14:31:15', '鹰潭市', '江西省鹰潭市');
INSERT INTO `t_system_area` VALUES ('360602', ',360000,360600,', '360600', '2016-01-25 14:31:15', '月湖区', '江西省鹰潭市月湖区');
INSERT INTO `t_system_area` VALUES ('360622', ',360000,360600,', '360600', '2016-01-25 14:31:15', '余江县', '江西省鹰潭市余江县');
INSERT INTO `t_system_area` VALUES ('360681', ',360000,360600,', '360600', '2016-01-25 14:31:15', '贵溪市', '江西省鹰潭市贵溪市');
INSERT INTO `t_system_area` VALUES ('360682', ',360000,360600,', '360600', '2016-01-25 14:31:15', '其它区', '江西省鹰潭市其它区');
INSERT INTO `t_system_area` VALUES ('360700', ',360000,', '360000', '2016-01-25 14:31:15', '赣州市', '江西省赣州市');
INSERT INTO `t_system_area` VALUES ('360702', ',360000,360700,', '360700', '2016-01-25 14:31:15', '章贡区', '江西省赣州市章贡区');
INSERT INTO `t_system_area` VALUES ('360721', ',360000,360700,', '360700', '2016-01-25 14:31:15', '赣县', '江西省赣州市赣县');
INSERT INTO `t_system_area` VALUES ('360722', ',360000,360700,', '360700', '2016-01-25 14:31:15', '信丰县', '江西省赣州市信丰县');
INSERT INTO `t_system_area` VALUES ('360723', ',360000,360700,', '360700', '2016-01-25 14:31:15', '大余县', '江西省赣州市大余县');
INSERT INTO `t_system_area` VALUES ('360724', ',360000,360700,', '360700', '2016-01-25 14:31:15', '上犹县', '江西省赣州市上犹县');
INSERT INTO `t_system_area` VALUES ('360725', ',360000,360700,', '360700', '2016-01-25 14:31:15', '崇义县', '江西省赣州市崇义县');
INSERT INTO `t_system_area` VALUES ('360726', ',360000,360700,', '360700', '2016-01-25 14:31:15', '安远县', '江西省赣州市安远县');
INSERT INTO `t_system_area` VALUES ('360727', ',360000,360700,', '360700', '2016-01-25 14:31:15', '龙南县', '江西省赣州市龙南县');
INSERT INTO `t_system_area` VALUES ('360728', ',360000,360700,', '360700', '2016-01-25 14:31:15', '定南县', '江西省赣州市定南县');
INSERT INTO `t_system_area` VALUES ('360729', ',360000,360700,', '360700', '2016-01-25 14:31:15', '全南县', '江西省赣州市全南县');
INSERT INTO `t_system_area` VALUES ('360730', ',360000,360700,', '360700', '2016-01-25 14:31:15', '宁都县', '江西省赣州市宁都县');
INSERT INTO `t_system_area` VALUES ('360731', ',360000,360700,', '360700', '2016-01-25 14:31:15', '于都县', '江西省赣州市于都县');
INSERT INTO `t_system_area` VALUES ('360732', ',360000,360700,', '360700', '2016-01-25 14:31:15', '兴国县', '江西省赣州市兴国县');
INSERT INTO `t_system_area` VALUES ('360733', ',360000,360700,', '360700', '2016-01-25 14:31:15', '会昌县', '江西省赣州市会昌县');
INSERT INTO `t_system_area` VALUES ('360734', ',360000,360700,', '360700', '2016-01-25 14:31:15', '寻乌县', '江西省赣州市寻乌县');
INSERT INTO `t_system_area` VALUES ('360735', ',360000,360700,', '360700', '2016-01-25 14:31:15', '石城县', '江西省赣州市石城县');
INSERT INTO `t_system_area` VALUES ('360751', ',360000,360700,', '360700', '2016-01-25 14:31:15', '黄金区', '江西省赣州市黄金区');
INSERT INTO `t_system_area` VALUES ('360781', ',360000,360700,', '360700', '2016-01-25 14:31:15', '瑞金市', '江西省赣州市瑞金市');
INSERT INTO `t_system_area` VALUES ('360782', ',360000,360700,', '360700', '2016-01-25 14:31:15', '南康市', '江西省赣州市南康市');
INSERT INTO `t_system_area` VALUES ('360783', ',360000,360700,', '360700', '2016-01-25 14:31:15', '其它区', '江西省赣州市其它区');
INSERT INTO `t_system_area` VALUES ('360800', ',360000,', '360000', '2016-01-25 14:31:15', '吉安市', '江西省吉安市');
INSERT INTO `t_system_area` VALUES ('360802', ',360000,360800,', '360800', '2016-01-25 14:31:15', '吉州区', '江西省吉安市吉州区');
INSERT INTO `t_system_area` VALUES ('360803', ',360000,360800,', '360800', '2016-01-25 14:31:15', '青原区', '江西省吉安市青原区');
INSERT INTO `t_system_area` VALUES ('360821', ',360000,360800,', '360800', '2016-01-25 14:31:15', '吉安县', '江西省吉安市吉安县');
INSERT INTO `t_system_area` VALUES ('360822', ',360000,360800,', '360800', '2016-01-25 14:31:15', '吉水县', '江西省吉安市吉水县');
INSERT INTO `t_system_area` VALUES ('360823', ',360000,360800,', '360800', '2016-01-25 14:31:15', '峡江县', '江西省吉安市峡江县');
INSERT INTO `t_system_area` VALUES ('360824', ',360000,360800,', '360800', '2016-01-25 14:31:15', '新干县', '江西省吉安市新干县');
INSERT INTO `t_system_area` VALUES ('360825', ',360000,360800,', '360800', '2016-01-25 14:31:15', '永丰县', '江西省吉安市永丰县');
INSERT INTO `t_system_area` VALUES ('360826', ',360000,360800,', '360800', '2016-01-25 14:31:15', '泰和县', '江西省吉安市泰和县');
INSERT INTO `t_system_area` VALUES ('360827', ',360000,360800,', '360800', '2016-01-25 14:31:15', '遂川县', '江西省吉安市遂川县');
INSERT INTO `t_system_area` VALUES ('360828', ',360000,360800,', '360800', '2016-01-25 14:31:15', '万安县', '江西省吉安市万安县');
INSERT INTO `t_system_area` VALUES ('360829', ',360000,360800,', '360800', '2016-01-25 14:31:15', '安福县', '江西省吉安市安福县');
INSERT INTO `t_system_area` VALUES ('360830', ',360000,360800,', '360800', '2016-01-25 14:31:15', '永新县', '江西省吉安市永新县');
INSERT INTO `t_system_area` VALUES ('360881', ',360000,360800,', '360800', '2016-01-25 14:31:15', '井冈山市', '江西省吉安市井冈山市');
INSERT INTO `t_system_area` VALUES ('360882', ',360000,360800,', '360800', '2016-01-25 14:31:15', '其它区', '江西省吉安市其它区');
INSERT INTO `t_system_area` VALUES ('360900', ',360000,', '360000', '2016-01-25 14:31:15', '宜春市', '江西省宜春市');
INSERT INTO `t_system_area` VALUES ('360902', ',360000,360900,', '360900', '2016-01-25 14:31:15', '袁州区', '江西省宜春市袁州区');
INSERT INTO `t_system_area` VALUES ('360921', ',360000,360900,', '360900', '2016-01-25 14:31:15', '奉新县', '江西省宜春市奉新县');
INSERT INTO `t_system_area` VALUES ('360922', ',360000,360900,', '360900', '2016-01-25 14:31:15', '万载县', '江西省宜春市万载县');
INSERT INTO `t_system_area` VALUES ('360923', ',360000,360900,', '360900', '2016-01-25 14:31:15', '上高县', '江西省宜春市上高县');
INSERT INTO `t_system_area` VALUES ('360924', ',360000,360900,', '360900', '2016-01-25 14:31:15', '宜丰县', '江西省宜春市宜丰县');
INSERT INTO `t_system_area` VALUES ('360925', ',360000,360900,', '360900', '2016-01-25 14:31:16', '靖安县', '江西省宜春市靖安县');
INSERT INTO `t_system_area` VALUES ('360926', ',360000,360900,', '360900', '2016-01-25 14:31:16', '铜鼓县', '江西省宜春市铜鼓县');
INSERT INTO `t_system_area` VALUES ('360981', ',360000,360900,', '360900', '2016-01-25 14:31:16', '丰城市', '江西省宜春市丰城市');
INSERT INTO `t_system_area` VALUES ('360982', ',360000,360900,', '360900', '2016-01-25 14:31:16', '樟树市', '江西省宜春市樟树市');
INSERT INTO `t_system_area` VALUES ('360983', ',360000,360900,', '360900', '2016-01-25 14:31:16', '高安市', '江西省宜春市高安市');
INSERT INTO `t_system_area` VALUES ('360984', ',360000,360900,', '360900', '2016-01-25 14:31:16', '其它区', '江西省宜春市其它区');
INSERT INTO `t_system_area` VALUES ('361000', ',360000,', '360000', '2016-01-25 14:31:16', '抚州市', '江西省抚州市');
INSERT INTO `t_system_area` VALUES ('361002', ',360000,361000,', '361000', '2016-01-25 14:31:16', '临川区', '江西省抚州市临川区');
INSERT INTO `t_system_area` VALUES ('361021', ',360000,361000,', '361000', '2016-01-25 14:31:16', '南城县', '江西省抚州市南城县');
INSERT INTO `t_system_area` VALUES ('361022', ',360000,361000,', '361000', '2016-01-25 14:31:16', '黎川县', '江西省抚州市黎川县');
INSERT INTO `t_system_area` VALUES ('361023', ',360000,361000,', '361000', '2016-01-25 14:31:16', '南丰县', '江西省抚州市南丰县');
INSERT INTO `t_system_area` VALUES ('361024', ',360000,361000,', '361000', '2016-01-25 14:31:16', '崇仁县', '江西省抚州市崇仁县');
INSERT INTO `t_system_area` VALUES ('361025', ',360000,361000,', '361000', '2016-01-25 14:31:16', '乐安县', '江西省抚州市乐安县');
INSERT INTO `t_system_area` VALUES ('361026', ',360000,361000,', '361000', '2016-01-25 14:31:16', '宜黄县', '江西省抚州市宜黄县');
INSERT INTO `t_system_area` VALUES ('361027', ',360000,361000,', '361000', '2016-01-25 14:31:16', '金溪县', '江西省抚州市金溪县');
INSERT INTO `t_system_area` VALUES ('361028', ',360000,361000,', '361000', '2016-01-25 14:31:16', '资溪县', '江西省抚州市资溪县');
INSERT INTO `t_system_area` VALUES ('361029', ',360000,361000,', '361000', '2016-01-25 14:31:16', '东乡县', '江西省抚州市东乡县');
INSERT INTO `t_system_area` VALUES ('361030', ',360000,361000,', '361000', '2016-01-25 14:31:16', '广昌县', '江西省抚州市广昌县');
INSERT INTO `t_system_area` VALUES ('361031', ',360000,361000,', '361000', '2016-01-25 14:31:16', '其它区', '江西省抚州市其它区');
INSERT INTO `t_system_area` VALUES ('361100', ',360000,', '360000', '2016-01-25 14:31:16', '上饶市', '江西省上饶市');
INSERT INTO `t_system_area` VALUES ('361102', ',360000,361100,', '361100', '2016-01-25 14:31:16', '信州区', '江西省上饶市信州区');
INSERT INTO `t_system_area` VALUES ('361121', ',360000,361100,', '361100', '2016-01-25 14:31:16', '上饶县', '江西省上饶市上饶县');
INSERT INTO `t_system_area` VALUES ('361122', ',360000,361100,', '361100', '2016-01-25 14:31:16', '广丰县', '江西省上饶市广丰县');
INSERT INTO `t_system_area` VALUES ('361123', ',360000,361100,', '361100', '2016-01-25 14:31:16', '玉山县', '江西省上饶市玉山县');
INSERT INTO `t_system_area` VALUES ('361124', ',360000,361100,', '361100', '2016-01-25 14:31:16', '铅山县', '江西省上饶市铅山县');
INSERT INTO `t_system_area` VALUES ('361125', ',360000,361100,', '361100', '2016-01-25 14:31:16', '横峰县', '江西省上饶市横峰县');
INSERT INTO `t_system_area` VALUES ('361126', ',360000,361100,', '361100', '2016-01-25 14:31:16', '弋阳县', '江西省上饶市弋阳县');
INSERT INTO `t_system_area` VALUES ('361127', ',360000,361100,', '361100', '2016-01-25 14:31:16', '余干县', '江西省上饶市余干县');
INSERT INTO `t_system_area` VALUES ('361128', ',360000,361100,', '361100', '2016-01-25 14:31:16', '鄱阳县', '江西省上饶市鄱阳县');
INSERT INTO `t_system_area` VALUES ('361129', ',360000,361100,', '361100', '2016-01-25 14:31:16', '万年县', '江西省上饶市万年县');
INSERT INTO `t_system_area` VALUES ('361130', ',360000,361100,', '361100', '2016-01-25 14:31:16', '婺源县', '江西省上饶市婺源县');
INSERT INTO `t_system_area` VALUES ('361181', ',360000,361100,', '361100', '2016-01-25 14:31:16', '德兴市', '江西省上饶市德兴市');
INSERT INTO `t_system_area` VALUES ('361182', ',360000,361100,', '361100', '2016-01-25 14:31:16', '其它区', '江西省上饶市其它区');
INSERT INTO `t_system_area` VALUES ('370000', ',', null, '2016-01-25 14:31:16', '山东省', '山东省');
INSERT INTO `t_system_area` VALUES ('370100', ',370000,', '370000', '2016-01-25 14:31:16', '济南市', '山东省济南市');
INSERT INTO `t_system_area` VALUES ('370102', ',370000,370100,', '370100', '2016-01-25 14:31:16', '历下区', '山东省济南市历下区');
INSERT INTO `t_system_area` VALUES ('370103', ',370000,370100,', '370100', '2016-01-25 14:31:16', '市中区', '山东省济南市市中区');
INSERT INTO `t_system_area` VALUES ('370104', ',370000,370100,', '370100', '2016-01-25 14:31:16', '槐荫区', '山东省济南市槐荫区');
INSERT INTO `t_system_area` VALUES ('370105', ',370000,370100,', '370100', '2016-01-25 14:31:16', '天桥区', '山东省济南市天桥区');
INSERT INTO `t_system_area` VALUES ('370112', ',370000,370100,', '370100', '2016-01-25 14:31:16', '历城区', '山东省济南市历城区');
INSERT INTO `t_system_area` VALUES ('370113', ',370000,370100,', '370100', '2016-01-25 14:31:16', '长清区', '山东省济南市长清区');
INSERT INTO `t_system_area` VALUES ('370124', ',370000,370100,', '370100', '2016-01-25 14:31:16', '平阴县', '山东省济南市平阴县');
INSERT INTO `t_system_area` VALUES ('370125', ',370000,370100,', '370100', '2016-01-25 14:31:16', '济阳县', '山东省济南市济阳县');
INSERT INTO `t_system_area` VALUES ('370126', ',370000,370100,', '370100', '2016-01-25 14:31:16', '商河县', '山东省济南市商河县');
INSERT INTO `t_system_area` VALUES ('370181', ',370000,370100,', '370100', '2016-01-25 14:31:16', '章丘市', '山东省济南市章丘市');
INSERT INTO `t_system_area` VALUES ('370182', ',370000,370100,', '370100', '2016-01-25 14:31:16', '其它区', '山东省济南市其它区');
INSERT INTO `t_system_area` VALUES ('370200', ',370000,', '370000', '2016-01-25 14:31:16', '青岛市', '山东省青岛市');
INSERT INTO `t_system_area` VALUES ('370202', ',370000,370200,', '370200', '2016-01-25 14:31:16', '市南区', '山东省青岛市市南区');
INSERT INTO `t_system_area` VALUES ('370203', ',370000,370200,', '370200', '2016-01-25 14:31:16', '市北区', '山东省青岛市市北区');
INSERT INTO `t_system_area` VALUES ('370205', ',370000,370200,', '370200', '2016-01-25 14:31:16', '四方区', '山东省青岛市四方区');
INSERT INTO `t_system_area` VALUES ('370211', ',370000,370200,', '370200', '2016-01-25 14:31:16', '黄岛区', '山东省青岛市黄岛区');
INSERT INTO `t_system_area` VALUES ('370212', ',370000,370200,', '370200', '2016-01-25 14:31:16', '崂山区', '山东省青岛市崂山区');
INSERT INTO `t_system_area` VALUES ('370213', ',370000,370200,', '370200', '2016-01-25 14:31:16', '李沧区', '山东省青岛市李沧区');
INSERT INTO `t_system_area` VALUES ('370214', ',370000,370200,', '370200', '2016-01-25 14:31:16', '城阳区', '山东省青岛市城阳区');
INSERT INTO `t_system_area` VALUES ('370251', ',370000,370200,', '370200', '2016-01-25 14:31:16', '开发区', '山东省青岛市开发区');
INSERT INTO `t_system_area` VALUES ('370281', ',370000,370200,', '370200', '2016-01-25 14:31:16', '胶州市', '山东省青岛市胶州市');
INSERT INTO `t_system_area` VALUES ('370282', ',370000,370200,', '370200', '2016-01-25 14:31:16', '即墨市', '山东省青岛市即墨市');
INSERT INTO `t_system_area` VALUES ('370283', ',370000,370200,', '370200', '2016-01-25 14:31:16', '平度市', '山东省青岛市平度市');
INSERT INTO `t_system_area` VALUES ('370284', ',370000,370200,', '370200', '2016-01-25 14:31:16', '胶南市', '山东省青岛市胶南市');
INSERT INTO `t_system_area` VALUES ('370285', ',370000,370200,', '370200', '2016-01-25 14:31:16', '莱西市', '山东省青岛市莱西市');
INSERT INTO `t_system_area` VALUES ('370286', ',370000,370200,', '370200', '2016-01-25 14:31:16', '其它区', '山东省青岛市其它区');
INSERT INTO `t_system_area` VALUES ('370300', ',370000,', '370000', '2016-01-25 14:31:16', '淄博市', '山东省淄博市');
INSERT INTO `t_system_area` VALUES ('370302', ',370000,370300,', '370300', '2016-01-25 14:31:16', '淄川区', '山东省淄博市淄川区');
INSERT INTO `t_system_area` VALUES ('370303', ',370000,370300,', '370300', '2016-01-25 14:31:16', '张店区', '山东省淄博市张店区');
INSERT INTO `t_system_area` VALUES ('370304', ',370000,370300,', '370300', '2016-01-25 14:31:16', '博山区', '山东省淄博市博山区');
INSERT INTO `t_system_area` VALUES ('370305', ',370000,370300,', '370300', '2016-01-25 14:31:16', '临淄区', '山东省淄博市临淄区');
INSERT INTO `t_system_area` VALUES ('370306', ',370000,370300,', '370300', '2016-01-25 14:31:16', '周村区', '山东省淄博市周村区');
INSERT INTO `t_system_area` VALUES ('370321', ',370000,370300,', '370300', '2016-01-25 14:31:16', '桓台县', '山东省淄博市桓台县');
INSERT INTO `t_system_area` VALUES ('370322', ',370000,370300,', '370300', '2016-01-25 14:31:16', '高青县', '山东省淄博市高青县');
INSERT INTO `t_system_area` VALUES ('370323', ',370000,370300,', '370300', '2016-01-25 14:31:16', '沂源县', '山东省淄博市沂源县');
INSERT INTO `t_system_area` VALUES ('370324', ',370000,370300,', '370300', '2016-01-25 14:31:16', '其它区', '山东省淄博市其它区');
INSERT INTO `t_system_area` VALUES ('370400', ',370000,', '370000', '2016-01-25 14:31:16', '枣庄市', '山东省枣庄市');
INSERT INTO `t_system_area` VALUES ('370402', ',370000,370400,', '370400', '2016-01-25 14:31:16', '市中区', '山东省枣庄市市中区');
INSERT INTO `t_system_area` VALUES ('370403', ',370000,370400,', '370400', '2016-01-25 14:31:16', '薛城区', '山东省枣庄市薛城区');
INSERT INTO `t_system_area` VALUES ('370404', ',370000,370400,', '370400', '2016-01-25 14:31:16', '峄城区', '山东省枣庄市峄城区');
INSERT INTO `t_system_area` VALUES ('370405', ',370000,370400,', '370400', '2016-01-25 14:31:16', '台儿庄区', '山东省枣庄市台儿庄区');
INSERT INTO `t_system_area` VALUES ('370406', ',370000,370400,', '370400', '2016-01-25 14:31:16', '山亭区', '山东省枣庄市山亭区');
INSERT INTO `t_system_area` VALUES ('370481', ',370000,370400,', '370400', '2016-01-25 14:31:16', '滕州市', '山东省枣庄市滕州市');
INSERT INTO `t_system_area` VALUES ('370482', ',370000,370400,', '370400', '2016-01-25 14:31:16', '其它区', '山东省枣庄市其它区');
INSERT INTO `t_system_area` VALUES ('370500', ',370000,', '370000', '2016-01-25 14:31:16', '东营市', '山东省东营市');
INSERT INTO `t_system_area` VALUES ('370502', ',370000,370500,', '370500', '2016-01-25 14:31:16', '东营区', '山东省东营市东营区');
INSERT INTO `t_system_area` VALUES ('370503', ',370000,370500,', '370500', '2016-01-25 14:31:16', '河口区', '山东省东营市河口区');
INSERT INTO `t_system_area` VALUES ('370521', ',370000,370500,', '370500', '2016-01-25 14:31:16', '垦利县', '山东省东营市垦利县');
INSERT INTO `t_system_area` VALUES ('370522', ',370000,370500,', '370500', '2016-01-25 14:31:16', '利津县', '山东省东营市利津县');
INSERT INTO `t_system_area` VALUES ('370523', ',370000,370500,', '370500', '2016-01-25 14:31:16', '广饶县', '山东省东营市广饶县');
INSERT INTO `t_system_area` VALUES ('370589', ',370000,370500,', '370500', '2016-01-25 14:31:16', '西城区', '山东省东营市西城区');
INSERT INTO `t_system_area` VALUES ('370590', ',370000,370500,', '370500', '2016-01-25 14:31:16', '东城区', '山东省东营市东城区');
INSERT INTO `t_system_area` VALUES ('370591', ',370000,370500,', '370500', '2016-01-25 14:31:16', '其它区', '山东省东营市其它区');
INSERT INTO `t_system_area` VALUES ('370600', ',370000,', '370000', '2016-01-25 14:31:16', '烟台市', '山东省烟台市');
INSERT INTO `t_system_area` VALUES ('370602', ',370000,370600,', '370600', '2016-01-25 14:31:16', '芝罘区', '山东省烟台市芝罘区');
INSERT INTO `t_system_area` VALUES ('370611', ',370000,370600,', '370600', '2016-01-25 14:31:16', '福山区', '山东省烟台市福山区');
INSERT INTO `t_system_area` VALUES ('370612', ',370000,370600,', '370600', '2016-01-25 14:31:16', '牟平区', '山东省烟台市牟平区');
INSERT INTO `t_system_area` VALUES ('370613', ',370000,370600,', '370600', '2016-01-25 14:31:16', '莱山区', '山东省烟台市莱山区');
INSERT INTO `t_system_area` VALUES ('370634', ',370000,370600,', '370600', '2016-01-25 14:31:16', '长岛县', '山东省烟台市长岛县');
INSERT INTO `t_system_area` VALUES ('370681', ',370000,370600,', '370600', '2016-01-25 14:31:16', '龙口市', '山东省烟台市龙口市');
INSERT INTO `t_system_area` VALUES ('370682', ',370000,370600,', '370600', '2016-01-25 14:31:16', '莱阳市', '山东省烟台市莱阳市');
INSERT INTO `t_system_area` VALUES ('370683', ',370000,370600,', '370600', '2016-01-25 14:31:16', '莱州市', '山东省烟台市莱州市');
INSERT INTO `t_system_area` VALUES ('370684', ',370000,370600,', '370600', '2016-01-25 14:31:16', '蓬莱市', '山东省烟台市蓬莱市');
INSERT INTO `t_system_area` VALUES ('370685', ',370000,370600,', '370600', '2016-01-25 14:31:16', '招远市', '山东省烟台市招远市');
INSERT INTO `t_system_area` VALUES ('370686', ',370000,370600,', '370600', '2016-01-25 14:31:16', '栖霞市', '山东省烟台市栖霞市');
INSERT INTO `t_system_area` VALUES ('370687', ',370000,370600,', '370600', '2016-01-25 14:31:16', '海阳市', '山东省烟台市海阳市');
INSERT INTO `t_system_area` VALUES ('370688', ',370000,370600,', '370600', '2016-01-25 14:31:16', '其它区', '山东省烟台市其它区');
INSERT INTO `t_system_area` VALUES ('370700', ',370000,', '370000', '2016-01-25 14:31:16', '潍坊市', '山东省潍坊市');
INSERT INTO `t_system_area` VALUES ('370702', ',370000,370700,', '370700', '2016-01-25 14:31:16', '潍城区', '山东省潍坊市潍城区');
INSERT INTO `t_system_area` VALUES ('370703', ',370000,370700,', '370700', '2016-01-25 14:31:16', '寒亭区', '山东省潍坊市寒亭区');
INSERT INTO `t_system_area` VALUES ('370704', ',370000,370700,', '370700', '2016-01-25 14:31:17', '坊子区', '山东省潍坊市坊子区');
INSERT INTO `t_system_area` VALUES ('370705', ',370000,370700,', '370700', '2016-01-25 14:31:17', '奎文区', '山东省潍坊市奎文区');
INSERT INTO `t_system_area` VALUES ('370724', ',370000,370700,', '370700', '2016-01-25 14:31:17', '临朐县', '山东省潍坊市临朐县');
INSERT INTO `t_system_area` VALUES ('370725', ',370000,370700,', '370700', '2016-01-25 14:31:17', '昌乐县', '山东省潍坊市昌乐县');
INSERT INTO `t_system_area` VALUES ('370751', ',370000,370700,', '370700', '2016-01-25 14:31:17', '开发区', '山东省潍坊市开发区');
INSERT INTO `t_system_area` VALUES ('370781', ',370000,370700,', '370700', '2016-01-25 14:31:17', '青州市', '山东省潍坊市青州市');
INSERT INTO `t_system_area` VALUES ('370782', ',370000,370700,', '370700', '2016-01-25 14:31:17', '诸城市', '山东省潍坊市诸城市');
INSERT INTO `t_system_area` VALUES ('370783', ',370000,370700,', '370700', '2016-01-25 14:31:17', '寿光市', '山东省潍坊市寿光市');
INSERT INTO `t_system_area` VALUES ('370784', ',370000,370700,', '370700', '2016-01-25 14:31:17', '安丘市', '山东省潍坊市安丘市');
INSERT INTO `t_system_area` VALUES ('370785', ',370000,370700,', '370700', '2016-01-25 14:31:17', '高密市', '山东省潍坊市高密市');
INSERT INTO `t_system_area` VALUES ('370786', ',370000,370700,', '370700', '2016-01-25 14:31:17', '昌邑市', '山东省潍坊市昌邑市');
INSERT INTO `t_system_area` VALUES ('370787', ',370000,370700,', '370700', '2016-01-25 14:31:17', '其它区', '山东省潍坊市其它区');
INSERT INTO `t_system_area` VALUES ('370800', ',370000,', '370000', '2016-01-25 14:31:17', '济宁市', '山东省济宁市');
INSERT INTO `t_system_area` VALUES ('370802', ',370000,370800,', '370800', '2016-01-25 14:31:17', '市中区', '山东省济宁市市中区');
INSERT INTO `t_system_area` VALUES ('370811', ',370000,370800,', '370800', '2016-01-25 14:31:17', '任城区', '山东省济宁市任城区');
INSERT INTO `t_system_area` VALUES ('370826', ',370000,370800,', '370800', '2016-01-25 14:31:17', '微山县', '山东省济宁市微山县');
INSERT INTO `t_system_area` VALUES ('370827', ',370000,370800,', '370800', '2016-01-25 14:31:17', '鱼台县', '山东省济宁市鱼台县');
INSERT INTO `t_system_area` VALUES ('370828', ',370000,370800,', '370800', '2016-01-25 14:31:17', '金乡县', '山东省济宁市金乡县');
INSERT INTO `t_system_area` VALUES ('370829', ',370000,370800,', '370800', '2016-01-25 14:31:17', '嘉祥县', '山东省济宁市嘉祥县');
INSERT INTO `t_system_area` VALUES ('370830', ',370000,370800,', '370800', '2016-01-25 14:31:17', '汶上县', '山东省济宁市汶上县');
INSERT INTO `t_system_area` VALUES ('370831', ',370000,370800,', '370800', '2016-01-25 14:31:17', '泗水县', '山东省济宁市泗水县');
INSERT INTO `t_system_area` VALUES ('370832', ',370000,370800,', '370800', '2016-01-25 14:31:17', '梁山县', '山东省济宁市梁山县');
INSERT INTO `t_system_area` VALUES ('370881', ',370000,370800,', '370800', '2016-01-25 14:31:17', '曲阜市', '山东省济宁市曲阜市');
INSERT INTO `t_system_area` VALUES ('370882', ',370000,370800,', '370800', '2016-01-25 14:31:17', '兖州市', '山东省济宁市兖州市');
INSERT INTO `t_system_area` VALUES ('370883', ',370000,370800,', '370800', '2016-01-25 14:31:17', '邹城市', '山东省济宁市邹城市');
INSERT INTO `t_system_area` VALUES ('370884', ',370000,370800,', '370800', '2016-01-25 14:31:17', '其它区', '山东省济宁市其它区');
INSERT INTO `t_system_area` VALUES ('370900', ',370000,', '370000', '2016-01-25 14:31:17', '泰安市', '山东省泰安市');
INSERT INTO `t_system_area` VALUES ('370902', ',370000,370900,', '370900', '2016-01-25 14:31:17', '泰山区', '山东省泰安市泰山区');
INSERT INTO `t_system_area` VALUES ('370903', ',370000,370900,', '370900', '2016-01-25 14:31:17', '岱岳区', '山东省泰安市岱岳区');
INSERT INTO `t_system_area` VALUES ('370921', ',370000,370900,', '370900', '2016-01-25 14:31:17', '宁阳县', '山东省泰安市宁阳县');
INSERT INTO `t_system_area` VALUES ('370923', ',370000,370900,', '370900', '2016-01-25 14:31:17', '东平县', '山东省泰安市东平县');
INSERT INTO `t_system_area` VALUES ('370982', ',370000,370900,', '370900', '2016-01-25 14:31:17', '新泰市', '山东省泰安市新泰市');
INSERT INTO `t_system_area` VALUES ('370983', ',370000,370900,', '370900', '2016-01-25 14:31:17', '肥城市', '山东省泰安市肥城市');
INSERT INTO `t_system_area` VALUES ('370984', ',370000,370900,', '370900', '2016-01-25 14:31:17', '其它区', '山东省泰安市其它区');
INSERT INTO `t_system_area` VALUES ('371000', ',370000,', '370000', '2016-01-25 14:31:17', '威海市', '山东省威海市');
INSERT INTO `t_system_area` VALUES ('371002', ',370000,371000,', '371000', '2016-01-25 14:31:17', '环翠区', '山东省威海市环翠区');
INSERT INTO `t_system_area` VALUES ('371081', ',370000,371000,', '371000', '2016-01-25 14:31:17', '文登市', '山东省威海市文登市');
INSERT INTO `t_system_area` VALUES ('371082', ',370000,371000,', '371000', '2016-01-25 14:31:17', '荣成市', '山东省威海市荣成市');
INSERT INTO `t_system_area` VALUES ('371083', ',370000,371000,', '371000', '2016-01-25 14:31:17', '乳山市', '山东省威海市乳山市');
INSERT INTO `t_system_area` VALUES ('371084', ',370000,371000,', '371000', '2016-01-25 14:31:17', '其它区', '山东省威海市其它区');
INSERT INTO `t_system_area` VALUES ('371100', ',370000,', '370000', '2016-01-25 14:31:17', '日照市', '山东省日照市');
INSERT INTO `t_system_area` VALUES ('371102', ',370000,371100,', '371100', '2016-01-25 14:31:17', '东港区', '山东省日照市东港区');
INSERT INTO `t_system_area` VALUES ('371103', ',370000,371100,', '371100', '2016-01-25 14:31:17', '岚山区', '山东省日照市岚山区');
INSERT INTO `t_system_area` VALUES ('371121', ',370000,371100,', '371100', '2016-01-25 14:31:17', '五莲县', '山东省日照市五莲县');
INSERT INTO `t_system_area` VALUES ('371122', ',370000,371100,', '371100', '2016-01-25 14:31:17', '莒县', '山东省日照市莒县');
INSERT INTO `t_system_area` VALUES ('371123', ',370000,371100,', '371100', '2016-01-25 14:31:17', '其它区', '山东省日照市其它区');
INSERT INTO `t_system_area` VALUES ('371200', ',370000,', '370000', '2016-01-25 14:31:17', '莱芜市', '山东省莱芜市');
INSERT INTO `t_system_area` VALUES ('371202', ',370000,371200,', '371200', '2016-01-25 14:31:17', '莱城区', '山东省莱芜市莱城区');
INSERT INTO `t_system_area` VALUES ('371203', ',370000,371200,', '371200', '2016-01-25 14:31:17', '钢城区', '山东省莱芜市钢城区');
INSERT INTO `t_system_area` VALUES ('371204', ',370000,371200,', '371200', '2016-01-25 14:31:17', '其它区', '山东省莱芜市其它区');
INSERT INTO `t_system_area` VALUES ('371300', ',370000,', '370000', '2016-01-25 14:31:17', '临沂市', '山东省临沂市');
INSERT INTO `t_system_area` VALUES ('371302', ',370000,371300,', '371300', '2016-01-25 14:31:17', '兰山区', '山东省临沂市兰山区');
INSERT INTO `t_system_area` VALUES ('371311', ',370000,371300,', '371300', '2016-01-25 14:31:17', '罗庄区', '山东省临沂市罗庄区');
INSERT INTO `t_system_area` VALUES ('371312', ',370000,371300,', '371300', '2016-01-25 14:31:17', '河东区', '山东省临沂市河东区');
INSERT INTO `t_system_area` VALUES ('371321', ',370000,371300,', '371300', '2016-01-25 14:31:17', '沂南县', '山东省临沂市沂南县');
INSERT INTO `t_system_area` VALUES ('371322', ',370000,371300,', '371300', '2016-01-25 14:31:17', '郯城县', '山东省临沂市郯城县');
INSERT INTO `t_system_area` VALUES ('371323', ',370000,371300,', '371300', '2016-01-25 14:31:17', '沂水县', '山东省临沂市沂水县');
INSERT INTO `t_system_area` VALUES ('371324', ',370000,371300,', '371300', '2016-01-25 14:31:17', '苍山县', '山东省临沂市苍山县');
INSERT INTO `t_system_area` VALUES ('371325', ',370000,371300,', '371300', '2016-01-25 14:31:17', '费县', '山东省临沂市费县');
INSERT INTO `t_system_area` VALUES ('371326', ',370000,371300,', '371300', '2016-01-25 14:31:17', '平邑县', '山东省临沂市平邑县');
INSERT INTO `t_system_area` VALUES ('371327', ',370000,371300,', '371300', '2016-01-25 14:31:17', '莒南县', '山东省临沂市莒南县');
INSERT INTO `t_system_area` VALUES ('371328', ',370000,371300,', '371300', '2016-01-25 14:31:17', '蒙阴县', '山东省临沂市蒙阴县');
INSERT INTO `t_system_area` VALUES ('371329', ',370000,371300,', '371300', '2016-01-25 14:31:17', '临沭县', '山东省临沂市临沭县');
INSERT INTO `t_system_area` VALUES ('371330', ',370000,371300,', '371300', '2016-01-25 14:31:17', '其它区', '山东省临沂市其它区');
INSERT INTO `t_system_area` VALUES ('371400', ',370000,', '370000', '2016-01-25 14:31:17', '德州市', '山东省德州市');
INSERT INTO `t_system_area` VALUES ('371402', ',370000,371400,', '371400', '2016-01-25 14:31:17', '德城区', '山东省德州市德城区');
INSERT INTO `t_system_area` VALUES ('371421', ',370000,371400,', '371400', '2016-01-25 14:31:17', '陵县', '山东省德州市陵县');
INSERT INTO `t_system_area` VALUES ('371422', ',370000,371400,', '371400', '2016-01-25 14:31:17', '宁津县', '山东省德州市宁津县');
INSERT INTO `t_system_area` VALUES ('371423', ',370000,371400,', '371400', '2016-01-25 14:31:17', '庆云县', '山东省德州市庆云县');
INSERT INTO `t_system_area` VALUES ('371424', ',370000,371400,', '371400', '2016-01-25 14:31:17', '临邑县', '山东省德州市临邑县');
INSERT INTO `t_system_area` VALUES ('371425', ',370000,371400,', '371400', '2016-01-25 14:31:17', '齐河县', '山东省德州市齐河县');
INSERT INTO `t_system_area` VALUES ('371426', ',370000,371400,', '371400', '2016-01-25 14:31:17', '平原县', '山东省德州市平原县');
INSERT INTO `t_system_area` VALUES ('371427', ',370000,371400,', '371400', '2016-01-25 14:31:17', '夏津县', '山东省德州市夏津县');
INSERT INTO `t_system_area` VALUES ('371428', ',370000,371400,', '371400', '2016-01-25 14:31:17', '武城县', '山东省德州市武城县');
INSERT INTO `t_system_area` VALUES ('371451', ',370000,371400,', '371400', '2016-01-25 14:31:17', '开发区', '山东省德州市开发区');
INSERT INTO `t_system_area` VALUES ('371481', ',370000,371400,', '371400', '2016-01-25 14:31:17', '乐陵市', '山东省德州市乐陵市');
INSERT INTO `t_system_area` VALUES ('371482', ',370000,371400,', '371400', '2016-01-25 14:31:17', '禹城市', '山东省德州市禹城市');
INSERT INTO `t_system_area` VALUES ('371483', ',370000,371400,', '371400', '2016-01-25 14:31:17', '其它区', '山东省德州市其它区');
INSERT INTO `t_system_area` VALUES ('371500', ',370000,', '370000', '2016-01-25 14:31:17', '聊城市', '山东省聊城市');
INSERT INTO `t_system_area` VALUES ('371502', ',370000,371500,', '371500', '2016-01-25 14:31:17', '东昌府区', '山东省聊城市东昌府区');
INSERT INTO `t_system_area` VALUES ('371521', ',370000,371500,', '371500', '2016-01-25 14:31:17', '阳谷县', '山东省聊城市阳谷县');
INSERT INTO `t_system_area` VALUES ('371522', ',370000,371500,', '371500', '2016-01-25 14:31:17', '莘县', '山东省聊城市莘县');
INSERT INTO `t_system_area` VALUES ('371523', ',370000,371500,', '371500', '2016-01-25 14:31:17', '茌平县', '山东省聊城市茌平县');
INSERT INTO `t_system_area` VALUES ('371524', ',370000,371500,', '371500', '2016-01-25 14:31:17', '东阿县', '山东省聊城市东阿县');
INSERT INTO `t_system_area` VALUES ('371525', ',370000,371500,', '371500', '2016-01-25 14:31:17', '冠县', '山东省聊城市冠县');
INSERT INTO `t_system_area` VALUES ('371526', ',370000,371500,', '371500', '2016-01-25 14:31:17', '高唐县', '山东省聊城市高唐县');
INSERT INTO `t_system_area` VALUES ('371581', ',370000,371500,', '371500', '2016-01-25 14:31:17', '临清市', '山东省聊城市临清市');
INSERT INTO `t_system_area` VALUES ('371582', ',370000,371500,', '371500', '2016-01-25 14:31:17', '其它区', '山东省聊城市其它区');
INSERT INTO `t_system_area` VALUES ('371600', ',370000,', '370000', '2016-01-25 14:31:17', '滨州市', '山东省滨州市');
INSERT INTO `t_system_area` VALUES ('371602', ',370000,371600,', '371600', '2016-01-25 14:31:17', '滨城区', '山东省滨州市滨城区');
INSERT INTO `t_system_area` VALUES ('371621', ',370000,371600,', '371600', '2016-01-25 14:31:17', '惠民县', '山东省滨州市惠民县');
INSERT INTO `t_system_area` VALUES ('371622', ',370000,371600,', '371600', '2016-01-25 14:31:17', '阳信县', '山东省滨州市阳信县');
INSERT INTO `t_system_area` VALUES ('371623', ',370000,371600,', '371600', '2016-01-25 14:31:17', '无棣县', '山东省滨州市无棣县');
INSERT INTO `t_system_area` VALUES ('371624', ',370000,371600,', '371600', '2016-01-25 14:31:17', '沾化县', '山东省滨州市沾化县');
INSERT INTO `t_system_area` VALUES ('371625', ',370000,371600,', '371600', '2016-01-25 14:31:17', '博兴县', '山东省滨州市博兴县');
INSERT INTO `t_system_area` VALUES ('371626', ',370000,371600,', '371600', '2016-01-25 14:31:17', '邹平县', '山东省滨州市邹平县');
INSERT INTO `t_system_area` VALUES ('371627', ',370000,371600,', '371600', '2016-01-25 14:31:17', '其它区', '山东省滨州市其它区');
INSERT INTO `t_system_area` VALUES ('371700', ',370000,', '370000', '2016-01-25 14:31:17', '菏泽市', '山东省菏泽市');
INSERT INTO `t_system_area` VALUES ('371702', ',370000,371700,', '371700', '2016-01-25 14:31:17', '牡丹区', '山东省菏泽市牡丹区');
INSERT INTO `t_system_area` VALUES ('371721', ',370000,371700,', '371700', '2016-01-25 14:31:17', '曹县', '山东省菏泽市曹县');
INSERT INTO `t_system_area` VALUES ('371722', ',370000,371700,', '371700', '2016-01-25 14:31:17', '单县', '山东省菏泽市单县');
INSERT INTO `t_system_area` VALUES ('371723', ',370000,371700,', '371700', '2016-01-25 14:31:17', '成武县', '山东省菏泽市成武县');
INSERT INTO `t_system_area` VALUES ('371724', ',370000,371700,', '371700', '2016-01-25 14:31:17', '巨野县', '山东省菏泽市巨野县');
INSERT INTO `t_system_area` VALUES ('371725', ',370000,371700,', '371700', '2016-01-25 14:31:17', '郓城县', '山东省菏泽市郓城县');
INSERT INTO `t_system_area` VALUES ('371726', ',370000,371700,', '371700', '2016-01-25 14:31:17', '鄄城县', '山东省菏泽市鄄城县');
INSERT INTO `t_system_area` VALUES ('371727', ',370000,371700,', '371700', '2016-01-25 14:31:17', '定陶县', '山东省菏泽市定陶县');
INSERT INTO `t_system_area` VALUES ('371728', ',370000,371700,', '371700', '2016-01-25 14:31:17', '东明县', '山东省菏泽市东明县');
INSERT INTO `t_system_area` VALUES ('371729', ',370000,371700,', '371700', '2016-01-25 14:31:17', '其它区', '山东省菏泽市其它区');
INSERT INTO `t_system_area` VALUES ('410000', ',', null, '2016-01-25 14:31:18', '河南省', '河南省');
INSERT INTO `t_system_area` VALUES ('410100', ',410000,', '410000', '2016-01-25 14:31:18', '郑州市', '河南省郑州市');
INSERT INTO `t_system_area` VALUES ('410102', ',410000,410100,', '410100', '2016-01-25 14:31:18', '中原区', '河南省郑州市中原区');
INSERT INTO `t_system_area` VALUES ('410103', ',410000,410100,', '410100', '2016-01-25 14:31:18', '二七区', '河南省郑州市二七区');
INSERT INTO `t_system_area` VALUES ('410104', ',410000,410100,', '410100', '2016-01-25 14:31:18', '管城回族区', '河南省郑州市管城回族区');
INSERT INTO `t_system_area` VALUES ('410105', ',410000,410100,', '410100', '2016-01-25 14:31:18', '金水区', '河南省郑州市金水区');
INSERT INTO `t_system_area` VALUES ('410106', ',410000,410100,', '410100', '2016-01-25 14:31:18', '上街区', '河南省郑州市上街区');
INSERT INTO `t_system_area` VALUES ('410108', ',410000,410100,', '410100', '2016-01-25 14:31:18', '惠济区', '河南省郑州市惠济区');
INSERT INTO `t_system_area` VALUES ('410122', ',410000,410100,', '410100', '2016-01-25 14:31:18', '中牟县', '河南省郑州市中牟县');
INSERT INTO `t_system_area` VALUES ('410181', ',410000,410100,', '410100', '2016-01-25 14:31:18', '巩义市', '河南省郑州市巩义市');
INSERT INTO `t_system_area` VALUES ('410182', ',410000,410100,', '410100', '2016-01-25 14:31:18', '荥阳市', '河南省郑州市荥阳市');
INSERT INTO `t_system_area` VALUES ('410183', ',410000,410100,', '410100', '2016-01-25 14:31:18', '新密市', '河南省郑州市新密市');
INSERT INTO `t_system_area` VALUES ('410184', ',410000,410100,', '410100', '2016-01-25 14:31:18', '新郑市', '河南省郑州市新郑市');
INSERT INTO `t_system_area` VALUES ('410185', ',410000,410100,', '410100', '2016-01-25 14:31:18', '登封市', '河南省郑州市登封市');
INSERT INTO `t_system_area` VALUES ('410186', ',410000,410100,', '410100', '2016-01-25 14:31:18', '郑东新区', '河南省郑州市郑东新区');
INSERT INTO `t_system_area` VALUES ('410187', ',410000,410100,', '410100', '2016-01-25 14:31:18', '高新区', '河南省郑州市高新区');
INSERT INTO `t_system_area` VALUES ('410188', ',410000,410100,', '410100', '2016-01-25 14:31:18', '其它区', '河南省郑州市其它区');
INSERT INTO `t_system_area` VALUES ('410200', ',410000,', '410000', '2016-01-25 14:31:18', '开封市', '河南省开封市');
INSERT INTO `t_system_area` VALUES ('410202', ',410000,410200,', '410200', '2016-01-25 14:31:18', '龙亭区', '河南省开封市龙亭区');
INSERT INTO `t_system_area` VALUES ('410203', ',410000,410200,', '410200', '2016-01-25 14:31:18', '顺河回族区', '河南省开封市顺河回族区');
INSERT INTO `t_system_area` VALUES ('410204', ',410000,410200,', '410200', '2016-01-25 14:31:18', '鼓楼区', '河南省开封市鼓楼区');
INSERT INTO `t_system_area` VALUES ('410205', ',410000,410200,', '410200', '2016-01-25 14:31:18', '禹王台区', '河南省开封市禹王台区');
INSERT INTO `t_system_area` VALUES ('410211', ',410000,410200,', '410200', '2016-01-25 14:31:18', '金明区', '河南省开封市金明区');
INSERT INTO `t_system_area` VALUES ('410221', ',410000,410200,', '410200', '2016-01-25 14:31:18', '杞县', '河南省开封市杞县');
INSERT INTO `t_system_area` VALUES ('410222', ',410000,410200,', '410200', '2016-01-25 14:31:18', '通许县', '河南省开封市通许县');
INSERT INTO `t_system_area` VALUES ('410223', ',410000,410200,', '410200', '2016-01-25 14:31:18', '尉氏县', '河南省开封市尉氏县');
INSERT INTO `t_system_area` VALUES ('410224', ',410000,410200,', '410200', '2016-01-25 14:31:18', '开封县', '河南省开封市开封县');
INSERT INTO `t_system_area` VALUES ('410225', ',410000,410200,', '410200', '2016-01-25 14:31:18', '兰考县', '河南省开封市兰考县');
INSERT INTO `t_system_area` VALUES ('410226', ',410000,410200,', '410200', '2016-01-25 14:31:18', '其它区', '河南省开封市其它区');
INSERT INTO `t_system_area` VALUES ('410300', ',410000,', '410000', '2016-01-25 14:31:18', '洛阳市', '河南省洛阳市');
INSERT INTO `t_system_area` VALUES ('410302', ',410000,410300,', '410300', '2016-01-25 14:31:18', '老城区', '河南省洛阳市老城区');
INSERT INTO `t_system_area` VALUES ('410303', ',410000,410300,', '410300', '2016-01-25 14:31:18', '西工区', '河南省洛阳市西工区');
INSERT INTO `t_system_area` VALUES ('410304', ',410000,410300,', '410300', '2016-01-25 14:31:18', '瀍河回族区', '河南省洛阳市瀍河回族区');
INSERT INTO `t_system_area` VALUES ('410305', ',410000,410300,', '410300', '2016-01-25 14:31:18', '涧西区', '河南省洛阳市涧西区');
INSERT INTO `t_system_area` VALUES ('410306', ',410000,410300,', '410300', '2016-01-25 14:31:18', '吉利区', '河南省洛阳市吉利区');
INSERT INTO `t_system_area` VALUES ('410307', ',410000,410300,', '410300', '2016-01-25 14:31:18', '洛龙区', '河南省洛阳市洛龙区');
INSERT INTO `t_system_area` VALUES ('410322', ',410000,410300,', '410300', '2016-01-25 14:31:18', '孟津县', '河南省洛阳市孟津县');
INSERT INTO `t_system_area` VALUES ('410323', ',410000,410300,', '410300', '2016-01-25 14:31:18', '新安县', '河南省洛阳市新安县');
INSERT INTO `t_system_area` VALUES ('410324', ',410000,410300,', '410300', '2016-01-25 14:31:18', '栾川县', '河南省洛阳市栾川县');
INSERT INTO `t_system_area` VALUES ('410325', ',410000,410300,', '410300', '2016-01-25 14:31:18', '嵩县', '河南省洛阳市嵩县');
INSERT INTO `t_system_area` VALUES ('410326', ',410000,410300,', '410300', '2016-01-25 14:31:18', '汝阳县', '河南省洛阳市汝阳县');
INSERT INTO `t_system_area` VALUES ('410327', ',410000,410300,', '410300', '2016-01-25 14:31:18', '宜阳县', '河南省洛阳市宜阳县');
INSERT INTO `t_system_area` VALUES ('410328', ',410000,410300,', '410300', '2016-01-25 14:31:18', '洛宁县', '河南省洛阳市洛宁县');
INSERT INTO `t_system_area` VALUES ('410329', ',410000,410300,', '410300', '2016-01-25 14:31:18', '伊川县', '河南省洛阳市伊川县');
INSERT INTO `t_system_area` VALUES ('410381', ',410000,410300,', '410300', '2016-01-25 14:31:18', '偃师市', '河南省洛阳市偃师市');
INSERT INTO `t_system_area` VALUES ('410400', ',410000,', '410000', '2016-01-25 14:31:18', '平顶山市', '河南省平顶山市');
INSERT INTO `t_system_area` VALUES ('410402', ',410000,410400,', '410400', '2016-01-25 14:31:18', '新华区', '河南省平顶山市新华区');
INSERT INTO `t_system_area` VALUES ('410403', ',410000,410400,', '410400', '2016-01-25 14:31:18', '卫东区', '河南省平顶山市卫东区');
INSERT INTO `t_system_area` VALUES ('410404', ',410000,410400,', '410400', '2016-01-25 14:31:18', '石龙区', '河南省平顶山市石龙区');
INSERT INTO `t_system_area` VALUES ('410411', ',410000,410400,', '410400', '2016-01-25 14:31:18', '湛河区', '河南省平顶山市湛河区');
INSERT INTO `t_system_area` VALUES ('410421', ',410000,410400,', '410400', '2016-01-25 14:31:18', '宝丰县', '河南省平顶山市宝丰县');
INSERT INTO `t_system_area` VALUES ('410422', ',410000,410400,', '410400', '2016-01-25 14:31:18', '叶县', '河南省平顶山市叶县');
INSERT INTO `t_system_area` VALUES ('410423', ',410000,410400,', '410400', '2016-01-25 14:31:18', '鲁山县', '河南省平顶山市鲁山县');
INSERT INTO `t_system_area` VALUES ('410425', ',410000,410400,', '410400', '2016-01-25 14:31:18', '郏县', '河南省平顶山市郏县');
INSERT INTO `t_system_area` VALUES ('410481', ',410000,410400,', '410400', '2016-01-25 14:31:18', '舞钢市', '河南省平顶山市舞钢市');
INSERT INTO `t_system_area` VALUES ('410482', ',410000,410400,', '410400', '2016-01-25 14:31:18', '汝州市', '河南省平顶山市汝州市');
INSERT INTO `t_system_area` VALUES ('410483', ',410000,410400,', '410400', '2016-01-25 14:31:18', '其它区', '河南省平顶山市其它区');
INSERT INTO `t_system_area` VALUES ('410500', ',410000,', '410000', '2016-01-25 14:31:18', '安阳市', '河南省安阳市');
INSERT INTO `t_system_area` VALUES ('410502', ',410000,410500,', '410500', '2016-01-25 14:31:18', '文峰区', '河南省安阳市文峰区');
INSERT INTO `t_system_area` VALUES ('410503', ',410000,410500,', '410500', '2016-01-25 14:31:18', '北关区', '河南省安阳市北关区');
INSERT INTO `t_system_area` VALUES ('410505', ',410000,410500,', '410500', '2016-01-25 14:31:18', '殷都区', '河南省安阳市殷都区');
INSERT INTO `t_system_area` VALUES ('410506', ',410000,410500,', '410500', '2016-01-25 14:31:18', '龙安区', '河南省安阳市龙安区');
INSERT INTO `t_system_area` VALUES ('410522', ',410000,410500,', '410500', '2016-01-25 14:31:18', '安阳县', '河南省安阳市安阳县');
INSERT INTO `t_system_area` VALUES ('410523', ',410000,410500,', '410500', '2016-01-25 14:31:18', '汤阴县', '河南省安阳市汤阴县');
INSERT INTO `t_system_area` VALUES ('410526', ',410000,410500,', '410500', '2016-01-25 14:31:18', '滑县', '河南省安阳市滑县');
INSERT INTO `t_system_area` VALUES ('410527', ',410000,410500,', '410500', '2016-01-25 14:31:18', '内黄县', '河南省安阳市内黄县');
INSERT INTO `t_system_area` VALUES ('410581', ',410000,410500,', '410500', '2016-01-25 14:31:18', '林州市', '河南省安阳市林州市');
INSERT INTO `t_system_area` VALUES ('410582', ',410000,410500,', '410500', '2016-01-25 14:31:18', '其它区', '河南省安阳市其它区');
INSERT INTO `t_system_area` VALUES ('410600', ',410000,', '410000', '2016-01-25 14:31:18', '鹤壁市', '河南省鹤壁市');
INSERT INTO `t_system_area` VALUES ('410602', ',410000,410600,', '410600', '2016-01-25 14:31:18', '鹤山区', '河南省鹤壁市鹤山区');
INSERT INTO `t_system_area` VALUES ('410603', ',410000,410600,', '410600', '2016-01-25 14:31:18', '山城区', '河南省鹤壁市山城区');
INSERT INTO `t_system_area` VALUES ('410611', ',410000,410600,', '410600', '2016-01-25 14:31:18', '淇滨区', '河南省鹤壁市淇滨区');
INSERT INTO `t_system_area` VALUES ('410621', ',410000,410600,', '410600', '2016-01-25 14:31:18', '浚县', '河南省鹤壁市浚县');
INSERT INTO `t_system_area` VALUES ('410622', ',410000,410600,', '410600', '2016-01-25 14:31:18', '淇县', '河南省鹤壁市淇县');
INSERT INTO `t_system_area` VALUES ('410623', ',410000,410600,', '410600', '2016-01-25 14:31:18', '其它区', '河南省鹤壁市其它区');
INSERT INTO `t_system_area` VALUES ('410700', ',410000,', '410000', '2016-01-25 14:31:18', '新乡市', '河南省新乡市');
INSERT INTO `t_system_area` VALUES ('410702', ',410000,410700,', '410700', '2016-01-25 14:31:18', '红旗区', '河南省新乡市红旗区');
INSERT INTO `t_system_area` VALUES ('410703', ',410000,410700,', '410700', '2016-01-25 14:31:18', '卫滨区', '河南省新乡市卫滨区');
INSERT INTO `t_system_area` VALUES ('410704', ',410000,410700,', '410700', '2016-01-25 14:31:18', '凤泉区', '河南省新乡市凤泉区');
INSERT INTO `t_system_area` VALUES ('410711', ',410000,410700,', '410700', '2016-01-25 14:31:18', '牧野区', '河南省新乡市牧野区');
INSERT INTO `t_system_area` VALUES ('410721', ',410000,410700,', '410700', '2016-01-25 14:31:18', '新乡县', '河南省新乡市新乡县');
INSERT INTO `t_system_area` VALUES ('410724', ',410000,410700,', '410700', '2016-01-25 14:31:18', '获嘉县', '河南省新乡市获嘉县');
INSERT INTO `t_system_area` VALUES ('410725', ',410000,410700,', '410700', '2016-01-25 14:31:18', '原阳县', '河南省新乡市原阳县');
INSERT INTO `t_system_area` VALUES ('410726', ',410000,410700,', '410700', '2016-01-25 14:31:18', '延津县', '河南省新乡市延津县');
INSERT INTO `t_system_area` VALUES ('410727', ',410000,410700,', '410700', '2016-01-25 14:31:18', '封丘县', '河南省新乡市封丘县');
INSERT INTO `t_system_area` VALUES ('410728', ',410000,410700,', '410700', '2016-01-25 14:31:18', '长垣县', '河南省新乡市长垣县');
INSERT INTO `t_system_area` VALUES ('410781', ',410000,410700,', '410700', '2016-01-25 14:31:18', '卫辉市', '河南省新乡市卫辉市');
INSERT INTO `t_system_area` VALUES ('410782', ',410000,410700,', '410700', '2016-01-25 14:31:18', '辉县市', '河南省新乡市辉县市');
INSERT INTO `t_system_area` VALUES ('410783', ',410000,410700,', '410700', '2016-01-25 14:31:18', '其它区', '河南省新乡市其它区');
INSERT INTO `t_system_area` VALUES ('410800', ',410000,', '410000', '2016-01-25 14:31:18', '焦作市', '河南省焦作市');
INSERT INTO `t_system_area` VALUES ('410802', ',410000,410800,', '410800', '2016-01-25 14:31:18', '解放区', '河南省焦作市解放区');
INSERT INTO `t_system_area` VALUES ('410803', ',410000,410800,', '410800', '2016-01-25 14:31:18', '中站区', '河南省焦作市中站区');
INSERT INTO `t_system_area` VALUES ('410804', ',410000,410800,', '410800', '2016-01-25 14:31:18', '马村区', '河南省焦作市马村区');
INSERT INTO `t_system_area` VALUES ('410811', ',410000,410800,', '410800', '2016-01-25 14:31:18', '山阳区', '河南省焦作市山阳区');
INSERT INTO `t_system_area` VALUES ('410821', ',410000,410800,', '410800', '2016-01-25 14:31:18', '修武县', '河南省焦作市修武县');
INSERT INTO `t_system_area` VALUES ('410822', ',410000,410800,', '410800', '2016-01-25 14:31:18', '博爱县', '河南省焦作市博爱县');
INSERT INTO `t_system_area` VALUES ('410823', ',410000,410800,', '410800', '2016-01-25 14:31:18', '武陟县', '河南省焦作市武陟县');
INSERT INTO `t_system_area` VALUES ('410825', ',410000,410800,', '410800', '2016-01-25 14:31:18', '温县', '河南省焦作市温县');
INSERT INTO `t_system_area` VALUES ('410881', ',410000,', '410000', '2016-01-25 14:31:18', '济源市', '河南省济源市');
INSERT INTO `t_system_area` VALUES ('410882', ',410000,410800,', '410800', '2016-01-25 14:31:18', '沁阳市', '河南省焦作市沁阳市');
INSERT INTO `t_system_area` VALUES ('410883', ',410000,410800,', '410800', '2016-01-25 14:31:18', '孟州市', '河南省焦作市孟州市');
INSERT INTO `t_system_area` VALUES ('410884', ',410000,410800,', '410800', '2016-01-25 14:31:18', '其它区', '河南省焦作市其它区');
INSERT INTO `t_system_area` VALUES ('410900', ',410000,', '410000', '2016-01-25 14:31:18', '濮阳市', '河南省濮阳市');
INSERT INTO `t_system_area` VALUES ('410902', ',410000,410900,', '410900', '2016-01-25 14:31:18', '华龙区', '河南省濮阳市华龙区');
INSERT INTO `t_system_area` VALUES ('410922', ',410000,410900,', '410900', '2016-01-25 14:31:19', '清丰县', '河南省濮阳市清丰县');
INSERT INTO `t_system_area` VALUES ('410923', ',410000,410900,', '410900', '2016-01-25 14:31:19', '南乐县', '河南省濮阳市南乐县');
INSERT INTO `t_system_area` VALUES ('410926', ',410000,410900,', '410900', '2016-01-25 14:31:19', '范县', '河南省濮阳市范县');
INSERT INTO `t_system_area` VALUES ('410927', ',410000,410900,', '410900', '2016-01-25 14:31:19', '台前县', '河南省濮阳市台前县');
INSERT INTO `t_system_area` VALUES ('410928', ',410000,410900,', '410900', '2016-01-25 14:31:19', '濮阳县', '河南省濮阳市濮阳县');
INSERT INTO `t_system_area` VALUES ('410929', ',410000,410900,', '410900', '2016-01-25 14:31:19', '其它区', '河南省濮阳市其它区');
INSERT INTO `t_system_area` VALUES ('411000', ',410000,', '410000', '2016-01-25 14:31:19', '许昌市', '河南省许昌市');
INSERT INTO `t_system_area` VALUES ('411002', ',410000,411000,', '411000', '2016-01-25 14:31:19', '魏都区', '河南省许昌市魏都区');
INSERT INTO `t_system_area` VALUES ('411023', ',410000,411000,', '411000', '2016-01-25 14:31:19', '许昌县', '河南省许昌市许昌县');
INSERT INTO `t_system_area` VALUES ('411024', ',410000,411000,', '411000', '2016-01-25 14:31:19', '鄢陵县', '河南省许昌市鄢陵县');
INSERT INTO `t_system_area` VALUES ('411025', ',410000,411000,', '411000', '2016-01-25 14:31:19', '襄城县', '河南省许昌市襄城县');
INSERT INTO `t_system_area` VALUES ('411081', ',410000,411000,', '411000', '2016-01-25 14:31:19', '禹州市', '河南省许昌市禹州市');
INSERT INTO `t_system_area` VALUES ('411082', ',410000,411000,', '411000', '2016-01-25 14:31:19', '长葛市', '河南省许昌市长葛市');
INSERT INTO `t_system_area` VALUES ('411083', ',410000,411000,', '411000', '2016-01-25 14:31:19', '其它区', '河南省许昌市其它区');
INSERT INTO `t_system_area` VALUES ('411100', ',410000,', '410000', '2016-01-25 14:31:19', '漯河市', '河南省漯河市');
INSERT INTO `t_system_area` VALUES ('411102', ',410000,411100,', '411100', '2016-01-25 14:31:19', '源汇区', '河南省漯河市源汇区');
INSERT INTO `t_system_area` VALUES ('411103', ',410000,411100,', '411100', '2016-01-25 14:31:19', '郾城区', '河南省漯河市郾城区');
INSERT INTO `t_system_area` VALUES ('411104', ',410000,411100,', '411100', '2016-01-25 14:31:19', '召陵区', '河南省漯河市召陵区');
INSERT INTO `t_system_area` VALUES ('411121', ',410000,411100,', '411100', '2016-01-25 14:31:19', '舞阳县', '河南省漯河市舞阳县');
INSERT INTO `t_system_area` VALUES ('411122', ',410000,411100,', '411100', '2016-01-25 14:31:19', '临颍县', '河南省漯河市临颍县');
INSERT INTO `t_system_area` VALUES ('411123', ',410000,411100,', '411100', '2016-01-25 14:31:19', '其它区', '河南省漯河市其它区');
INSERT INTO `t_system_area` VALUES ('411200', ',410000,', '410000', '2016-01-25 14:31:19', '三门峡市', '河南省三门峡市');
INSERT INTO `t_system_area` VALUES ('411202', ',410000,411200,', '411200', '2016-01-25 14:31:19', '湖滨区', '河南省三门峡市湖滨区');
INSERT INTO `t_system_area` VALUES ('411221', ',410000,411200,', '411200', '2016-01-25 14:31:19', '渑池县', '河南省三门峡市渑池县');
INSERT INTO `t_system_area` VALUES ('411222', ',410000,411200,', '411200', '2016-01-25 14:31:19', '陕县', '河南省三门峡市陕县');
INSERT INTO `t_system_area` VALUES ('411224', ',410000,411200,', '411200', '2016-01-25 14:31:19', '卢氏县', '河南省三门峡市卢氏县');
INSERT INTO `t_system_area` VALUES ('411281', ',410000,411200,', '411200', '2016-01-25 14:31:19', '义马市', '河南省三门峡市义马市');
INSERT INTO `t_system_area` VALUES ('411282', ',410000,411200,', '411200', '2016-01-25 14:31:19', '灵宝市', '河南省三门峡市灵宝市');
INSERT INTO `t_system_area` VALUES ('411283', ',410000,411200,', '411200', '2016-01-25 14:31:19', '其它区', '河南省三门峡市其它区');
INSERT INTO `t_system_area` VALUES ('411300', ',410000,', '410000', '2016-01-25 14:31:19', '南阳市', '河南省南阳市');
INSERT INTO `t_system_area` VALUES ('411302', ',410000,411300,', '411300', '2016-01-25 14:31:19', '宛城区', '河南省南阳市宛城区');
INSERT INTO `t_system_area` VALUES ('411303', ',410000,411300,', '411300', '2016-01-25 14:31:19', '卧龙区', '河南省南阳市卧龙区');
INSERT INTO `t_system_area` VALUES ('411321', ',410000,411300,', '411300', '2016-01-25 14:31:19', '南召县', '河南省南阳市南召县');
INSERT INTO `t_system_area` VALUES ('411322', ',410000,411300,', '411300', '2016-01-25 14:31:19', '方城县', '河南省南阳市方城县');
INSERT INTO `t_system_area` VALUES ('411323', ',410000,411300,', '411300', '2016-01-25 14:31:19', '西峡县', '河南省南阳市西峡县');
INSERT INTO `t_system_area` VALUES ('411324', ',410000,411300,', '411300', '2016-01-25 14:31:19', '镇平县', '河南省南阳市镇平县');
INSERT INTO `t_system_area` VALUES ('411325', ',410000,411300,', '411300', '2016-01-25 14:31:19', '内乡县', '河南省南阳市内乡县');
INSERT INTO `t_system_area` VALUES ('411326', ',410000,411300,', '411300', '2016-01-25 14:31:19', '淅川县', '河南省南阳市淅川县');
INSERT INTO `t_system_area` VALUES ('411327', ',410000,411300,', '411300', '2016-01-25 14:31:19', '社旗县', '河南省南阳市社旗县');
INSERT INTO `t_system_area` VALUES ('411328', ',410000,411300,', '411300', '2016-01-25 14:31:19', '唐河县', '河南省南阳市唐河县');
INSERT INTO `t_system_area` VALUES ('411329', ',410000,411300,', '411300', '2016-01-25 14:31:19', '新野县', '河南省南阳市新野县');
INSERT INTO `t_system_area` VALUES ('411330', ',410000,411300,', '411300', '2016-01-25 14:31:19', '桐柏县', '河南省南阳市桐柏县');
INSERT INTO `t_system_area` VALUES ('411381', ',410000,411300,', '411300', '2016-01-25 14:31:19', '邓州市', '河南省南阳市邓州市');
INSERT INTO `t_system_area` VALUES ('411382', ',410000,411300,', '411300', '2016-01-25 14:31:19', '其它区', '河南省南阳市其它区');
INSERT INTO `t_system_area` VALUES ('411400', ',410000,', '410000', '2016-01-25 14:31:19', '商丘市', '河南省商丘市');
INSERT INTO `t_system_area` VALUES ('411402', ',410000,411400,', '411400', '2016-01-25 14:31:19', '梁园区', '河南省商丘市梁园区');
INSERT INTO `t_system_area` VALUES ('411403', ',410000,411400,', '411400', '2016-01-25 14:31:19', '睢阳区', '河南省商丘市睢阳区');
INSERT INTO `t_system_area` VALUES ('411421', ',410000,411400,', '411400', '2016-01-25 14:31:19', '民权县', '河南省商丘市民权县');
INSERT INTO `t_system_area` VALUES ('411422', ',410000,411400,', '411400', '2016-01-25 14:31:19', '睢县', '河南省商丘市睢县');
INSERT INTO `t_system_area` VALUES ('411423', ',410000,411400,', '411400', '2016-01-25 14:31:19', '宁陵县', '河南省商丘市宁陵县');
INSERT INTO `t_system_area` VALUES ('411424', ',410000,411400,', '411400', '2016-01-25 14:31:19', '柘城县', '河南省商丘市柘城县');
INSERT INTO `t_system_area` VALUES ('411425', ',410000,411400,', '411400', '2016-01-25 14:31:19', '虞城县', '河南省商丘市虞城县');
INSERT INTO `t_system_area` VALUES ('411426', ',410000,411400,', '411400', '2016-01-25 14:31:19', '夏邑县', '河南省商丘市夏邑县');
INSERT INTO `t_system_area` VALUES ('411481', ',410000,411400,', '411400', '2016-01-25 14:31:19', '永城市', '河南省商丘市永城市');
INSERT INTO `t_system_area` VALUES ('411482', ',410000,411400,', '411400', '2016-01-25 14:31:19', '其它区', '河南省商丘市其它区');
INSERT INTO `t_system_area` VALUES ('411500', ',410000,', '410000', '2016-01-25 14:31:19', '信阳市', '河南省信阳市');
INSERT INTO `t_system_area` VALUES ('411502', ',410000,411500,', '411500', '2016-01-25 14:31:19', '浉河区', '河南省信阳市浉河区');
INSERT INTO `t_system_area` VALUES ('411503', ',410000,411500,', '411500', '2016-01-25 14:31:19', '平桥区', '河南省信阳市平桥区');
INSERT INTO `t_system_area` VALUES ('411521', ',410000,411500,', '411500', '2016-01-25 14:31:19', '罗山县', '河南省信阳市罗山县');
INSERT INTO `t_system_area` VALUES ('411522', ',410000,411500,', '411500', '2016-01-25 14:31:19', '光山县', '河南省信阳市光山县');
INSERT INTO `t_system_area` VALUES ('411523', ',410000,411500,', '411500', '2016-01-25 14:31:19', '新县', '河南省信阳市新县');
INSERT INTO `t_system_area` VALUES ('411524', ',410000,411500,', '411500', '2016-01-25 14:31:19', '商城县', '河南省信阳市商城县');
INSERT INTO `t_system_area` VALUES ('411525', ',410000,411500,', '411500', '2016-01-25 14:31:19', '固始县', '河南省信阳市固始县');
INSERT INTO `t_system_area` VALUES ('411526', ',410000,411500,', '411500', '2016-01-25 14:31:19', '潢川县', '河南省信阳市潢川县');
INSERT INTO `t_system_area` VALUES ('411527', ',410000,411500,', '411500', '2016-01-25 14:31:19', '淮滨县', '河南省信阳市淮滨县');
INSERT INTO `t_system_area` VALUES ('411528', ',410000,411500,', '411500', '2016-01-25 14:31:19', '息县', '河南省信阳市息县');
INSERT INTO `t_system_area` VALUES ('411529', ',410000,411500,', '411500', '2016-01-25 14:31:19', '其它区', '河南省信阳市其它区');
INSERT INTO `t_system_area` VALUES ('411600', ',410000,', '410000', '2016-01-25 14:31:19', '周口市', '河南省周口市');
INSERT INTO `t_system_area` VALUES ('411602', ',410000,411600,', '411600', '2016-01-25 14:31:19', '川汇区', '河南省周口市川汇区');
INSERT INTO `t_system_area` VALUES ('411621', ',410000,411600,', '411600', '2016-01-25 14:31:19', '扶沟县', '河南省周口市扶沟县');
INSERT INTO `t_system_area` VALUES ('411622', ',410000,411600,', '411600', '2016-01-25 14:31:19', '西华县', '河南省周口市西华县');
INSERT INTO `t_system_area` VALUES ('411623', ',410000,411600,', '411600', '2016-01-25 14:31:19', '商水县', '河南省周口市商水县');
INSERT INTO `t_system_area` VALUES ('411624', ',410000,411600,', '411600', '2016-01-25 14:31:19', '沈丘县', '河南省周口市沈丘县');
INSERT INTO `t_system_area` VALUES ('411625', ',410000,411600,', '411600', '2016-01-25 14:31:19', '郸城县', '河南省周口市郸城县');
INSERT INTO `t_system_area` VALUES ('411626', ',410000,411600,', '411600', '2016-01-25 14:31:19', '淮阳县', '河南省周口市淮阳县');
INSERT INTO `t_system_area` VALUES ('411627', ',410000,411600,', '411600', '2016-01-25 14:31:19', '太康县', '河南省周口市太康县');
INSERT INTO `t_system_area` VALUES ('411628', ',410000,411600,', '411600', '2016-01-25 14:31:19', '鹿邑县', '河南省周口市鹿邑县');
INSERT INTO `t_system_area` VALUES ('411681', ',410000,411600,', '411600', '2016-01-25 14:31:19', '项城市', '河南省周口市项城市');
INSERT INTO `t_system_area` VALUES ('411682', ',410000,411600,', '411600', '2016-01-25 14:31:19', '其它区', '河南省周口市其它区');
INSERT INTO `t_system_area` VALUES ('411700', ',410000,', '410000', '2016-01-25 14:31:19', '驻马店市', '河南省驻马店市');
INSERT INTO `t_system_area` VALUES ('411702', ',410000,411700,', '411700', '2016-01-25 14:31:19', '驿城区', '河南省驻马店市驿城区');
INSERT INTO `t_system_area` VALUES ('411721', ',410000,411700,', '411700', '2016-01-25 14:31:19', '西平县', '河南省驻马店市西平县');
INSERT INTO `t_system_area` VALUES ('411722', ',410000,411700,', '411700', '2016-01-25 14:31:19', '上蔡县', '河南省驻马店市上蔡县');
INSERT INTO `t_system_area` VALUES ('411723', ',410000,411700,', '411700', '2016-01-25 14:31:19', '平舆县', '河南省驻马店市平舆县');
INSERT INTO `t_system_area` VALUES ('411724', ',410000,411700,', '411700', '2016-01-25 14:31:19', '正阳县', '河南省驻马店市正阳县');
INSERT INTO `t_system_area` VALUES ('411725', ',410000,411700,', '411700', '2016-01-25 14:31:19', '确山县', '河南省驻马店市确山县');
INSERT INTO `t_system_area` VALUES ('411726', ',410000,411700,', '411700', '2016-01-25 14:31:19', '泌阳县', '河南省驻马店市泌阳县');
INSERT INTO `t_system_area` VALUES ('411727', ',410000,411700,', '411700', '2016-01-25 14:31:19', '汝南县', '河南省驻马店市汝南县');
INSERT INTO `t_system_area` VALUES ('411728', ',410000,411700,', '411700', '2016-01-25 14:31:19', '遂平县', '河南省驻马店市遂平县');
INSERT INTO `t_system_area` VALUES ('411729', ',410000,411700,', '411700', '2016-01-25 14:31:19', '新蔡县', '河南省驻马店市新蔡县');
INSERT INTO `t_system_area` VALUES ('411730', ',410000,411700,', '411700', '2016-01-25 14:31:19', '其它区', '河南省驻马店市其它区');
INSERT INTO `t_system_area` VALUES ('420000', ',', null, '2016-01-25 14:31:19', '湖北省', '湖北省');
INSERT INTO `t_system_area` VALUES ('420100', ',420000,', '420000', '2016-01-25 14:31:19', '武汉市', '湖北省武汉市');
INSERT INTO `t_system_area` VALUES ('420102', ',420000,420100,', '420100', '2016-01-25 14:31:19', '江岸区', '湖北省武汉市江岸区');
INSERT INTO `t_system_area` VALUES ('420103', ',420000,420100,', '420100', '2016-01-25 14:31:19', '江汉区', '湖北省武汉市江汉区');
INSERT INTO `t_system_area` VALUES ('420104', ',420000,420100,', '420100', '2016-01-25 14:31:19', '硚口区', '湖北省武汉市硚口区');
INSERT INTO `t_system_area` VALUES ('420105', ',420000,420100,', '420100', '2016-01-25 14:31:19', '汉阳区', '湖北省武汉市汉阳区');
INSERT INTO `t_system_area` VALUES ('420106', ',420000,420100,', '420100', '2016-01-25 14:31:19', '武昌区', '湖北省武汉市武昌区');
INSERT INTO `t_system_area` VALUES ('420107', ',420000,420100,', '420100', '2016-01-25 14:31:19', '青山区', '湖北省武汉市青山区');
INSERT INTO `t_system_area` VALUES ('420111', ',420000,420100,', '420100', '2016-01-25 14:31:19', '洪山区', '湖北省武汉市洪山区');
INSERT INTO `t_system_area` VALUES ('420112', ',420000,420100,', '420100', '2016-01-25 14:31:19', '东西湖区', '湖北省武汉市东西湖区');
INSERT INTO `t_system_area` VALUES ('420113', ',420000,420100,', '420100', '2016-01-25 14:31:19', '汉南区', '湖北省武汉市汉南区');
INSERT INTO `t_system_area` VALUES ('420114', ',420000,420100,', '420100', '2016-01-25 14:31:19', '蔡甸区', '湖北省武汉市蔡甸区');
INSERT INTO `t_system_area` VALUES ('420115', ',420000,420100,', '420100', '2016-01-25 14:31:19', '江夏区', '湖北省武汉市江夏区');
INSERT INTO `t_system_area` VALUES ('420116', ',420000,420100,', '420100', '2016-01-25 14:31:19', '黄陂区', '湖北省武汉市黄陂区');
INSERT INTO `t_system_area` VALUES ('420117', ',420000,420100,', '420100', '2016-01-25 14:31:19', '新洲区', '湖北省武汉市新洲区');
INSERT INTO `t_system_area` VALUES ('420118', ',420000,420100,', '420100', '2016-01-25 14:31:19', '其它区', '湖北省武汉市其它区');
INSERT INTO `t_system_area` VALUES ('420200', ',420000,', '420000', '2016-01-25 14:31:20', '黄石市', '湖北省黄石市');
INSERT INTO `t_system_area` VALUES ('420202', ',420000,420200,', '420200', '2016-01-25 14:31:20', '黄石港区', '湖北省黄石市黄石港区');
INSERT INTO `t_system_area` VALUES ('420203', ',420000,420200,', '420200', '2016-01-25 14:31:20', '西塞山区', '湖北省黄石市西塞山区');
INSERT INTO `t_system_area` VALUES ('420204', ',420000,420200,', '420200', '2016-01-25 14:31:20', '下陆区', '湖北省黄石市下陆区');
INSERT INTO `t_system_area` VALUES ('420205', ',420000,420200,', '420200', '2016-01-25 14:31:20', '铁山区', '湖北省黄石市铁山区');
INSERT INTO `t_system_area` VALUES ('420222', ',420000,420200,', '420200', '2016-01-25 14:31:20', '阳新县', '湖北省黄石市阳新县');
INSERT INTO `t_system_area` VALUES ('420281', ',420000,420200,', '420200', '2016-01-25 14:31:20', '大冶市', '湖北省黄石市大冶市');
INSERT INTO `t_system_area` VALUES ('420282', ',420000,420200,', '420200', '2016-01-25 14:31:20', '其它区', '湖北省黄石市其它区');
INSERT INTO `t_system_area` VALUES ('420300', ',420000,', '420000', '2016-01-25 14:31:20', '十堰市', '湖北省十堰市');
INSERT INTO `t_system_area` VALUES ('420302', ',420000,420300,', '420300', '2016-01-25 14:31:20', '茅箭区', '湖北省十堰市茅箭区');
INSERT INTO `t_system_area` VALUES ('420303', ',420000,420300,', '420300', '2016-01-25 14:31:20', '张湾区', '湖北省十堰市张湾区');
INSERT INTO `t_system_area` VALUES ('420321', ',420000,420300,', '420300', '2016-01-25 14:31:20', '郧县', '湖北省十堰市郧县');
INSERT INTO `t_system_area` VALUES ('420322', ',420000,420300,', '420300', '2016-01-25 14:31:20', '郧西县', '湖北省十堰市郧西县');
INSERT INTO `t_system_area` VALUES ('420323', ',420000,420300,', '420300', '2016-01-25 14:31:20', '竹山县', '湖北省十堰市竹山县');
INSERT INTO `t_system_area` VALUES ('420324', ',420000,420300,', '420300', '2016-01-25 14:31:20', '竹溪县', '湖北省十堰市竹溪县');
INSERT INTO `t_system_area` VALUES ('420325', ',420000,420300,', '420300', '2016-01-25 14:31:20', '房县', '湖北省十堰市房县');
INSERT INTO `t_system_area` VALUES ('420381', ',420000,420300,', '420300', '2016-01-25 14:31:20', '丹江口市', '湖北省十堰市丹江口市');
INSERT INTO `t_system_area` VALUES ('420382', ',420000,420300,', '420300', '2016-01-25 14:31:20', '城区', '湖北省十堰市城区');
INSERT INTO `t_system_area` VALUES ('420383', ',420000,420300,', '420300', '2016-01-25 14:31:20', '其它区', '湖北省十堰市其它区');
INSERT INTO `t_system_area` VALUES ('420500', ',420000,', '420000', '2016-01-25 14:31:20', '宜昌市', '湖北省宜昌市');
INSERT INTO `t_system_area` VALUES ('420502', ',420000,420500,', '420500', '2016-01-25 14:31:20', '西陵区', '湖北省宜昌市西陵区');
INSERT INTO `t_system_area` VALUES ('420503', ',420000,420500,', '420500', '2016-01-25 14:31:20', '伍家岗区', '湖北省宜昌市伍家岗区');
INSERT INTO `t_system_area` VALUES ('420504', ',420000,420500,', '420500', '2016-01-25 14:31:20', '点军区', '湖北省宜昌市点军区');
INSERT INTO `t_system_area` VALUES ('420505', ',420000,420500,', '420500', '2016-01-25 14:31:20', '猇亭区', '湖北省宜昌市猇亭区');
INSERT INTO `t_system_area` VALUES ('420506', ',420000,420500,', '420500', '2016-01-25 14:31:20', '夷陵区', '湖北省宜昌市夷陵区');
INSERT INTO `t_system_area` VALUES ('420525', ',420000,420500,', '420500', '2016-01-25 14:31:20', '远安县', '湖北省宜昌市远安县');
INSERT INTO `t_system_area` VALUES ('420526', ',420000,420500,', '420500', '2016-01-25 14:31:20', '兴山县', '湖北省宜昌市兴山县');
INSERT INTO `t_system_area` VALUES ('420527', ',420000,420500,', '420500', '2016-01-25 14:31:20', '秭归县', '湖北省宜昌市秭归县');
INSERT INTO `t_system_area` VALUES ('420528', ',420000,420500,', '420500', '2016-01-25 14:31:20', '长阳土家族自治县', '湖北省宜昌市长阳土家族自治县');
INSERT INTO `t_system_area` VALUES ('420529', ',420000,420500,', '420500', '2016-01-25 14:31:20', '五峰土家族自治县', '湖北省宜昌市五峰土家族自治县');
INSERT INTO `t_system_area` VALUES ('420551', ',420000,420500,', '420500', '2016-01-25 14:31:20', '葛洲坝区', '湖北省宜昌市葛洲坝区');
INSERT INTO `t_system_area` VALUES ('420552', ',420000,420500,', '420500', '2016-01-25 14:31:20', '开发区', '湖北省宜昌市开发区');
INSERT INTO `t_system_area` VALUES ('420581', ',420000,420500,', '420500', '2016-01-25 14:31:20', '宜都市', '湖北省宜昌市宜都市');
INSERT INTO `t_system_area` VALUES ('420582', ',420000,420500,', '420500', '2016-01-25 14:31:20', '当阳市', '湖北省宜昌市当阳市');
INSERT INTO `t_system_area` VALUES ('420583', ',420000,420500,', '420500', '2016-01-25 14:31:20', '枝江市', '湖北省宜昌市枝江市');
INSERT INTO `t_system_area` VALUES ('420584', ',420000,420500,', '420500', '2016-01-25 14:31:20', '其它区', '湖北省宜昌市其它区');
INSERT INTO `t_system_area` VALUES ('420600', ',420000,', '420000', '2016-01-25 14:31:20', '襄阳市', '湖北省襄阳市');
INSERT INTO `t_system_area` VALUES ('420602', ',420000,420600,', '420600', '2016-01-25 14:31:20', '襄城区', '湖北省襄阳市襄城区');
INSERT INTO `t_system_area` VALUES ('420606', ',420000,420600,', '420600', '2016-01-25 14:31:20', '樊城区', '湖北省襄阳市樊城区');
INSERT INTO `t_system_area` VALUES ('420607', ',420000,420600,', '420600', '2016-01-25 14:31:20', '襄州区', '湖北省襄阳市襄州区');
INSERT INTO `t_system_area` VALUES ('420624', ',420000,420600,', '420600', '2016-01-25 14:31:20', '南漳县', '湖北省襄阳市南漳县');
INSERT INTO `t_system_area` VALUES ('420625', ',420000,420600,', '420600', '2016-01-25 14:31:20', '谷城县', '湖北省襄阳市谷城县');
INSERT INTO `t_system_area` VALUES ('420626', ',420000,420600,', '420600', '2016-01-25 14:31:20', '保康县', '湖北省襄阳市保康县');
INSERT INTO `t_system_area` VALUES ('420682', ',420000,420600,', '420600', '2016-01-25 14:31:20', '老河口市', '湖北省襄阳市老河口市');
INSERT INTO `t_system_area` VALUES ('420683', ',420000,420600,', '420600', '2016-01-25 14:31:20', '枣阳市', '湖北省襄阳市枣阳市');
INSERT INTO `t_system_area` VALUES ('420684', ',420000,420600,', '420600', '2016-01-25 14:31:20', '宜城市', '湖北省襄阳市宜城市');
INSERT INTO `t_system_area` VALUES ('420685', ',420000,420600,', '420600', '2016-01-25 14:31:20', '其它区', '湖北省襄阳市其它区');
INSERT INTO `t_system_area` VALUES ('420700', ',420000,', '420000', '2016-01-25 14:31:20', '鄂州市', '湖北省鄂州市');
INSERT INTO `t_system_area` VALUES ('420702', ',420000,420700,', '420700', '2016-01-25 14:31:20', '梁子湖区', '湖北省鄂州市梁子湖区');
INSERT INTO `t_system_area` VALUES ('420703', ',420000,420700,', '420700', '2016-01-25 14:31:20', '华容区', '湖北省鄂州市华容区');
INSERT INTO `t_system_area` VALUES ('420704', ',420000,420700,', '420700', '2016-01-25 14:31:20', '鄂城区', '湖北省鄂州市鄂城区');
INSERT INTO `t_system_area` VALUES ('420705', ',420000,420700,', '420700', '2016-01-25 14:31:20', '其它区', '湖北省鄂州市其它区');
INSERT INTO `t_system_area` VALUES ('420800', ',420000,', '420000', '2016-01-25 14:31:20', '荆门市', '湖北省荆门市');
INSERT INTO `t_system_area` VALUES ('420802', ',420000,420800,', '420800', '2016-01-25 14:31:20', '东宝区', '湖北省荆门市东宝区');
INSERT INTO `t_system_area` VALUES ('420804', ',420000,420800,', '420800', '2016-01-25 14:31:20', '掇刀区', '湖北省荆门市掇刀区');
INSERT INTO `t_system_area` VALUES ('420821', ',420000,420800,', '420800', '2016-01-25 14:31:20', '京山县', '湖北省荆门市京山县');
INSERT INTO `t_system_area` VALUES ('420822', ',420000,420800,', '420800', '2016-01-25 14:31:20', '沙洋县', '湖北省荆门市沙洋县');
INSERT INTO `t_system_area` VALUES ('420881', ',420000,420800,', '420800', '2016-01-25 14:31:20', '钟祥市', '湖北省荆门市钟祥市');
INSERT INTO `t_system_area` VALUES ('420882', ',420000,420800,', '420800', '2016-01-25 14:31:20', '其它区', '湖北省荆门市其它区');
INSERT INTO `t_system_area` VALUES ('420900', ',420000,', '420000', '2016-01-25 14:31:20', '孝感市', '湖北省孝感市');
INSERT INTO `t_system_area` VALUES ('420902', ',420000,420900,', '420900', '2016-01-25 14:31:20', '孝南区', '湖北省孝感市孝南区');
INSERT INTO `t_system_area` VALUES ('420921', ',420000,420900,', '420900', '2016-01-25 14:31:20', '孝昌县', '湖北省孝感市孝昌县');
INSERT INTO `t_system_area` VALUES ('420922', ',420000,420900,', '420900', '2016-01-25 14:31:20', '大悟县', '湖北省孝感市大悟县');
INSERT INTO `t_system_area` VALUES ('420923', ',420000,420900,', '420900', '2016-01-25 14:31:20', '云梦县', '湖北省孝感市云梦县');
INSERT INTO `t_system_area` VALUES ('420981', ',420000,420900,', '420900', '2016-01-25 14:31:20', '应城市', '湖北省孝感市应城市');
INSERT INTO `t_system_area` VALUES ('420982', ',420000,420900,', '420900', '2016-01-25 14:31:20', '安陆市', '湖北省孝感市安陆市');
INSERT INTO `t_system_area` VALUES ('420984', ',420000,420900,', '420900', '2016-01-25 14:31:20', '汉川市', '湖北省孝感市汉川市');
INSERT INTO `t_system_area` VALUES ('420985', ',420000,420900,', '420900', '2016-01-25 14:31:20', '其它区', '湖北省孝感市其它区');
INSERT INTO `t_system_area` VALUES ('421000', ',420000,', '420000', '2016-01-25 14:31:20', '荆州市', '湖北省荆州市');
INSERT INTO `t_system_area` VALUES ('421002', ',420000,421000,', '421000', '2016-01-25 14:31:20', '沙市区', '湖北省荆州市沙市区');
INSERT INTO `t_system_area` VALUES ('421003', ',420000,421000,', '421000', '2016-01-25 14:31:20', '荆州区', '湖北省荆州市荆州区');
INSERT INTO `t_system_area` VALUES ('421022', ',420000,421000,', '421000', '2016-01-25 14:31:20', '公安县', '湖北省荆州市公安县');
INSERT INTO `t_system_area` VALUES ('421023', ',420000,421000,', '421000', '2016-01-25 14:31:20', '监利县', '湖北省荆州市监利县');
INSERT INTO `t_system_area` VALUES ('421024', ',420000,421000,', '421000', '2016-01-25 14:31:20', '江陵县', '湖北省荆州市江陵县');
INSERT INTO `t_system_area` VALUES ('421081', ',420000,421000,', '421000', '2016-01-25 14:31:20', '石首市', '湖北省荆州市石首市');
INSERT INTO `t_system_area` VALUES ('421083', ',420000,421000,', '421000', '2016-01-25 14:31:20', '洪湖市', '湖北省荆州市洪湖市');
INSERT INTO `t_system_area` VALUES ('421087', ',420000,421000,', '421000', '2016-01-25 14:31:20', '松滋市', '湖北省荆州市松滋市');
INSERT INTO `t_system_area` VALUES ('421088', ',420000,421000,', '421000', '2016-01-25 14:31:20', '其它区', '湖北省荆州市其它区');
INSERT INTO `t_system_area` VALUES ('421100', ',420000,', '420000', '2016-01-25 14:31:20', '黄冈市', '湖北省黄冈市');
INSERT INTO `t_system_area` VALUES ('421102', ',420000,421100,', '421100', '2016-01-25 14:31:20', '黄州区', '湖北省黄冈市黄州区');
INSERT INTO `t_system_area` VALUES ('421121', ',420000,421100,', '421100', '2016-01-25 14:31:20', '团风县', '湖北省黄冈市团风县');
INSERT INTO `t_system_area` VALUES ('421122', ',420000,421100,', '421100', '2016-01-25 14:31:20', '红安县', '湖北省黄冈市红安县');
INSERT INTO `t_system_area` VALUES ('421123', ',420000,421100,', '421100', '2016-01-25 14:31:20', '罗田县', '湖北省黄冈市罗田县');
INSERT INTO `t_system_area` VALUES ('421124', ',420000,421100,', '421100', '2016-01-25 14:31:20', '英山县', '湖北省黄冈市英山县');
INSERT INTO `t_system_area` VALUES ('421125', ',420000,421100,', '421100', '2016-01-25 14:31:20', '浠水县', '湖北省黄冈市浠水县');
INSERT INTO `t_system_area` VALUES ('421126', ',420000,421100,', '421100', '2016-01-25 14:31:20', '蕲春县', '湖北省黄冈市蕲春县');
INSERT INTO `t_system_area` VALUES ('421127', ',420000,421100,', '421100', '2016-01-25 14:31:20', '黄梅县', '湖北省黄冈市黄梅县');
INSERT INTO `t_system_area` VALUES ('421181', ',420000,421100,', '421100', '2016-01-25 14:31:20', '麻城市', '湖北省黄冈市麻城市');
INSERT INTO `t_system_area` VALUES ('421182', ',420000,421100,', '421100', '2016-01-25 14:31:20', '武穴市', '湖北省黄冈市武穴市');
INSERT INTO `t_system_area` VALUES ('421183', ',420000,421100,', '421100', '2016-01-25 14:31:20', '其它区', '湖北省黄冈市其它区');
INSERT INTO `t_system_area` VALUES ('421200', ',420000,', '420000', '2016-01-25 14:31:20', '咸宁市', '湖北省咸宁市');
INSERT INTO `t_system_area` VALUES ('421202', ',420000,421200,', '421200', '2016-01-25 14:31:20', '咸安区', '湖北省咸宁市咸安区');
INSERT INTO `t_system_area` VALUES ('421221', ',420000,421200,', '421200', '2016-01-25 14:31:20', '嘉鱼县', '湖北省咸宁市嘉鱼县');
INSERT INTO `t_system_area` VALUES ('421222', ',420000,421200,', '421200', '2016-01-25 14:31:20', '通城县', '湖北省咸宁市通城县');
INSERT INTO `t_system_area` VALUES ('421223', ',420000,421200,', '421200', '2016-01-25 14:31:20', '崇阳县', '湖北省咸宁市崇阳县');
INSERT INTO `t_system_area` VALUES ('421224', ',420000,421200,', '421200', '2016-01-25 14:31:20', '通山县', '湖北省咸宁市通山县');
INSERT INTO `t_system_area` VALUES ('421281', ',420000,421200,', '421200', '2016-01-25 14:31:20', '赤壁市', '湖北省咸宁市赤壁市');
INSERT INTO `t_system_area` VALUES ('421282', ',420000,421200,', '421200', '2016-01-25 14:31:20', '温泉城区', '湖北省咸宁市温泉城区');
INSERT INTO `t_system_area` VALUES ('421283', ',420000,421200,', '421200', '2016-01-25 14:31:20', '其它区', '湖北省咸宁市其它区');
INSERT INTO `t_system_area` VALUES ('421300', ',420000,', '420000', '2016-01-25 14:31:20', '随州市', '湖北省随州市');
INSERT INTO `t_system_area` VALUES ('421302', ',420000,421300,', '421300', '2016-01-25 14:31:20', '曾都区', '湖北省随州市曾都区');
INSERT INTO `t_system_area` VALUES ('421321', ',420000,421300,', '421300', '2016-01-25 14:31:20', '随县', '湖北省随州市随县');
INSERT INTO `t_system_area` VALUES ('421381', ',420000,421300,', '421300', '2016-01-25 14:31:20', '广水市', '湖北省随州市广水市');
INSERT INTO `t_system_area` VALUES ('421382', ',420000,421300,', '421300', '2016-01-25 14:31:20', '其它区', '湖北省随州市其它区');
INSERT INTO `t_system_area` VALUES ('422800', ',420000,', '420000', '2016-01-25 14:31:20', '恩施土家族苗族自治州', '湖北省恩施土家族苗族自治州');
INSERT INTO `t_system_area` VALUES ('422801', ',420000,422800,', '422800', '2016-01-25 14:31:21', '恩施市', '湖北省恩施土家族苗族自治州恩施市');
INSERT INTO `t_system_area` VALUES ('422802', ',420000,422800,', '422800', '2016-01-25 14:31:21', '利川市', '湖北省恩施土家族苗族自治州利川市');
INSERT INTO `t_system_area` VALUES ('422822', ',420000,422800,', '422800', '2016-01-25 14:31:21', '建始县', '湖北省恩施土家族苗族自治州建始县');
INSERT INTO `t_system_area` VALUES ('422823', ',420000,422800,', '422800', '2016-01-25 14:31:21', '巴东县', '湖北省恩施土家族苗族自治州巴东县');
INSERT INTO `t_system_area` VALUES ('422825', ',420000,422800,', '422800', '2016-01-25 14:31:21', '宣恩县', '湖北省恩施土家族苗族自治州宣恩县');
INSERT INTO `t_system_area` VALUES ('422826', ',420000,422800,', '422800', '2016-01-25 14:31:21', '咸丰县', '湖北省恩施土家族苗族自治州咸丰县');
INSERT INTO `t_system_area` VALUES ('422827', ',420000,422800,', '422800', '2016-01-25 14:31:21', '来凤县', '湖北省恩施土家族苗族自治州来凤县');
INSERT INTO `t_system_area` VALUES ('422828', ',420000,422800,', '422800', '2016-01-25 14:31:21', '鹤峰县', '湖北省恩施土家族苗族自治州鹤峰县');
INSERT INTO `t_system_area` VALUES ('422829', ',420000,422800,', '422800', '2016-01-25 14:31:21', '其它区', '湖北省恩施土家族苗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('429004', ',420000,', '420000', '2016-01-25 14:31:21', '仙桃市', '湖北省仙桃市');
INSERT INTO `t_system_area` VALUES ('429005', ',420000,', '420000', '2016-01-25 14:31:21', '潜江市', '湖北省潜江市');
INSERT INTO `t_system_area` VALUES ('429006', ',420000,', '420000', '2016-01-25 14:31:21', '天门市', '湖北省天门市');
INSERT INTO `t_system_area` VALUES ('429021', ',420000,', '420000', '2016-01-25 14:31:21', '神农架林区', '湖北省神农架林区');
INSERT INTO `t_system_area` VALUES ('430000', ',', null, '2016-01-25 14:31:21', '湖南省', '湖南省');
INSERT INTO `t_system_area` VALUES ('430100', ',430000,', '430000', '2016-01-25 14:31:21', '长沙市', '湖南省长沙市');
INSERT INTO `t_system_area` VALUES ('430102', ',430000,430100,', '430100', '2016-01-25 14:31:21', '芙蓉区', '湖南省长沙市芙蓉区');
INSERT INTO `t_system_area` VALUES ('430103', ',430000,430100,', '430100', '2016-01-25 14:31:21', '天心区', '湖南省长沙市天心区');
INSERT INTO `t_system_area` VALUES ('430104', ',430000,430100,', '430100', '2016-01-25 14:31:21', '岳麓区', '湖南省长沙市岳麓区');
INSERT INTO `t_system_area` VALUES ('430105', ',430000,430100,', '430100', '2016-01-25 14:31:21', '开福区', '湖南省长沙市开福区');
INSERT INTO `t_system_area` VALUES ('430111', ',430000,430100,', '430100', '2016-01-25 14:31:21', '雨花区', '湖南省长沙市雨花区');
INSERT INTO `t_system_area` VALUES ('430121', ',430000,430100,', '430100', '2016-01-25 14:31:21', '长沙县', '湖南省长沙市长沙县');
INSERT INTO `t_system_area` VALUES ('430122', ',430000,430100,', '430100', '2016-01-25 14:31:21', '望城区', '湖南省长沙市望城区');
INSERT INTO `t_system_area` VALUES ('430124', ',430000,430100,', '430100', '2016-01-25 14:31:21', '宁乡县', '湖南省长沙市宁乡县');
INSERT INTO `t_system_area` VALUES ('430181', ',430000,430100,', '430100', '2016-01-25 14:31:21', '浏阳市', '湖南省长沙市浏阳市');
INSERT INTO `t_system_area` VALUES ('430182', ',430000,430100,', '430100', '2016-01-25 14:31:21', '其它区', '湖南省长沙市其它区');
INSERT INTO `t_system_area` VALUES ('430200', ',430000,', '430000', '2016-01-25 14:31:21', '株洲市', '湖南省株洲市');
INSERT INTO `t_system_area` VALUES ('430202', ',430000,430200,', '430200', '2016-01-25 14:31:21', '荷塘区', '湖南省株洲市荷塘区');
INSERT INTO `t_system_area` VALUES ('430203', ',430000,430200,', '430200', '2016-01-25 14:31:21', '芦淞区', '湖南省株洲市芦淞区');
INSERT INTO `t_system_area` VALUES ('430204', ',430000,430200,', '430200', '2016-01-25 14:31:21', '石峰区', '湖南省株洲市石峰区');
INSERT INTO `t_system_area` VALUES ('430211', ',430000,430200,', '430200', '2016-01-25 14:31:21', '天元区', '湖南省株洲市天元区');
INSERT INTO `t_system_area` VALUES ('430221', ',430000,430200,', '430200', '2016-01-25 14:31:21', '株洲县', '湖南省株洲市株洲县');
INSERT INTO `t_system_area` VALUES ('430223', ',430000,430200,', '430200', '2016-01-25 14:31:21', '攸县', '湖南省株洲市攸县');
INSERT INTO `t_system_area` VALUES ('430224', ',430000,430200,', '430200', '2016-01-25 14:31:21', '茶陵县', '湖南省株洲市茶陵县');
INSERT INTO `t_system_area` VALUES ('430225', ',430000,430200,', '430200', '2016-01-25 14:31:21', '炎陵县', '湖南省株洲市炎陵县');
INSERT INTO `t_system_area` VALUES ('430281', ',430000,430200,', '430200', '2016-01-25 14:31:21', '醴陵市', '湖南省株洲市醴陵市');
INSERT INTO `t_system_area` VALUES ('430282', ',430000,430200,', '430200', '2016-01-25 14:31:21', '其它区', '湖南省株洲市其它区');
INSERT INTO `t_system_area` VALUES ('430300', ',430000,', '430000', '2016-01-25 14:31:21', '湘潭市', '湖南省湘潭市');
INSERT INTO `t_system_area` VALUES ('430302', ',430000,430300,', '430300', '2016-01-25 14:31:21', '雨湖区', '湖南省湘潭市雨湖区');
INSERT INTO `t_system_area` VALUES ('430304', ',430000,430300,', '430300', '2016-01-25 14:31:21', '岳塘区', '湖南省湘潭市岳塘区');
INSERT INTO `t_system_area` VALUES ('430321', ',430000,430300,', '430300', '2016-01-25 14:31:21', '湘潭县', '湖南省湘潭市湘潭县');
INSERT INTO `t_system_area` VALUES ('430381', ',430000,430300,', '430300', '2016-01-25 14:31:21', '湘乡市', '湖南省湘潭市湘乡市');
INSERT INTO `t_system_area` VALUES ('430382', ',430000,430300,', '430300', '2016-01-25 14:31:21', '韶山市', '湖南省湘潭市韶山市');
INSERT INTO `t_system_area` VALUES ('430383', ',430000,430300,', '430300', '2016-01-25 14:31:21', '其它区', '湖南省湘潭市其它区');
INSERT INTO `t_system_area` VALUES ('430400', ',430000,', '430000', '2016-01-25 14:31:21', '衡阳市', '湖南省衡阳市');
INSERT INTO `t_system_area` VALUES ('430405', ',430000,430400,', '430400', '2016-01-25 14:31:21', '珠晖区', '湖南省衡阳市珠晖区');
INSERT INTO `t_system_area` VALUES ('430406', ',430000,430400,', '430400', '2016-01-25 14:31:21', '雁峰区', '湖南省衡阳市雁峰区');
INSERT INTO `t_system_area` VALUES ('430407', ',430000,430400,', '430400', '2016-01-25 14:31:21', '石鼓区', '湖南省衡阳市石鼓区');
INSERT INTO `t_system_area` VALUES ('430408', ',430000,430400,', '430400', '2016-01-25 14:31:21', '蒸湘区', '湖南省衡阳市蒸湘区');
INSERT INTO `t_system_area` VALUES ('430412', ',430000,430400,', '430400', '2016-01-25 14:31:21', '南岳区', '湖南省衡阳市南岳区');
INSERT INTO `t_system_area` VALUES ('430421', ',430000,430400,', '430400', '2016-01-25 14:31:21', '衡阳县', '湖南省衡阳市衡阳县');
INSERT INTO `t_system_area` VALUES ('430422', ',430000,430400,', '430400', '2016-01-25 14:31:21', '衡南县', '湖南省衡阳市衡南县');
INSERT INTO `t_system_area` VALUES ('430423', ',430000,430400,', '430400', '2016-01-25 14:31:21', '衡山县', '湖南省衡阳市衡山县');
INSERT INTO `t_system_area` VALUES ('430424', ',430000,430400,', '430400', '2016-01-25 14:31:21', '衡东县', '湖南省衡阳市衡东县');
INSERT INTO `t_system_area` VALUES ('430426', ',430000,430400,', '430400', '2016-01-25 14:31:21', '祁东县', '湖南省衡阳市祁东县');
INSERT INTO `t_system_area` VALUES ('430481', ',430000,430400,', '430400', '2016-01-25 14:31:21', '耒阳市', '湖南省衡阳市耒阳市');
INSERT INTO `t_system_area` VALUES ('430482', ',430000,430400,', '430400', '2016-01-25 14:31:21', '常宁市', '湖南省衡阳市常宁市');
INSERT INTO `t_system_area` VALUES ('430483', ',430000,430400,', '430400', '2016-01-25 14:31:21', '其它区', '湖南省衡阳市其它区');
INSERT INTO `t_system_area` VALUES ('430500', ',430000,', '430000', '2016-01-25 14:31:21', '邵阳市', '湖南省邵阳市');
INSERT INTO `t_system_area` VALUES ('430502', ',430000,430500,', '430500', '2016-01-25 14:31:21', '双清区', '湖南省邵阳市双清区');
INSERT INTO `t_system_area` VALUES ('430503', ',430000,430500,', '430500', '2016-01-25 14:31:21', '大祥区', '湖南省邵阳市大祥区');
INSERT INTO `t_system_area` VALUES ('430511', ',430000,430500,', '430500', '2016-01-25 14:31:21', '北塔区', '湖南省邵阳市北塔区');
INSERT INTO `t_system_area` VALUES ('430521', ',430000,430500,', '430500', '2016-01-25 14:31:21', '邵东县', '湖南省邵阳市邵东县');
INSERT INTO `t_system_area` VALUES ('430522', ',430000,430500,', '430500', '2016-01-25 14:31:21', '新邵县', '湖南省邵阳市新邵县');
INSERT INTO `t_system_area` VALUES ('430523', ',430000,430500,', '430500', '2016-01-25 14:31:21', '邵阳县', '湖南省邵阳市邵阳县');
INSERT INTO `t_system_area` VALUES ('430524', ',430000,430500,', '430500', '2016-01-25 14:31:21', '隆回县', '湖南省邵阳市隆回县');
INSERT INTO `t_system_area` VALUES ('430525', ',430000,430500,', '430500', '2016-01-25 14:31:21', '洞口县', '湖南省邵阳市洞口县');
INSERT INTO `t_system_area` VALUES ('430527', ',430000,430500,', '430500', '2016-01-25 14:31:21', '绥宁县', '湖南省邵阳市绥宁县');
INSERT INTO `t_system_area` VALUES ('430528', ',430000,430500,', '430500', '2016-01-25 14:31:21', '新宁县', '湖南省邵阳市新宁县');
INSERT INTO `t_system_area` VALUES ('430529', ',430000,430500,', '430500', '2016-01-25 14:31:21', '城步苗族自治县', '湖南省邵阳市城步苗族自治县');
INSERT INTO `t_system_area` VALUES ('430581', ',430000,430500,', '430500', '2016-01-25 14:31:21', '武冈市', '湖南省邵阳市武冈市');
INSERT INTO `t_system_area` VALUES ('430582', ',430000,430500,', '430500', '2016-01-25 14:31:21', '其它区', '湖南省邵阳市其它区');
INSERT INTO `t_system_area` VALUES ('430600', ',430000,', '430000', '2016-01-25 14:31:21', '岳阳市', '湖南省岳阳市');
INSERT INTO `t_system_area` VALUES ('430602', ',430000,430600,', '430600', '2016-01-25 14:31:21', '岳阳楼区', '湖南省岳阳市岳阳楼区');
INSERT INTO `t_system_area` VALUES ('430603', ',430000,430600,', '430600', '2016-01-25 14:31:21', '云溪区', '湖南省岳阳市云溪区');
INSERT INTO `t_system_area` VALUES ('430611', ',430000,430600,', '430600', '2016-01-25 14:31:21', '君山区', '湖南省岳阳市君山区');
INSERT INTO `t_system_area` VALUES ('430621', ',430000,430600,', '430600', '2016-01-25 14:31:21', '岳阳县', '湖南省岳阳市岳阳县');
INSERT INTO `t_system_area` VALUES ('430623', ',430000,430600,', '430600', '2016-01-25 14:31:21', '华容县', '湖南省岳阳市华容县');
INSERT INTO `t_system_area` VALUES ('430624', ',430000,430600,', '430600', '2016-01-25 14:31:21', '湘阴县', '湖南省岳阳市湘阴县');
INSERT INTO `t_system_area` VALUES ('430626', ',430000,430600,', '430600', '2016-01-25 14:31:21', '平江县', '湖南省岳阳市平江县');
INSERT INTO `t_system_area` VALUES ('430681', ',430000,430600,', '430600', '2016-01-25 14:31:21', '汨罗市', '湖南省岳阳市汨罗市');
INSERT INTO `t_system_area` VALUES ('430682', ',430000,430600,', '430600', '2016-01-25 14:31:21', '临湘市', '湖南省岳阳市临湘市');
INSERT INTO `t_system_area` VALUES ('430683', ',430000,430600,', '430600', '2016-01-25 14:31:21', '其它区', '湖南省岳阳市其它区');
INSERT INTO `t_system_area` VALUES ('430700', ',430000,', '430000', '2016-01-25 14:31:21', '常德市', '湖南省常德市');
INSERT INTO `t_system_area` VALUES ('430702', ',430000,430700,', '430700', '2016-01-25 14:31:21', '武陵区', '湖南省常德市武陵区');
INSERT INTO `t_system_area` VALUES ('430703', ',430000,430700,', '430700', '2016-01-25 14:31:21', '鼎城区', '湖南省常德市鼎城区');
INSERT INTO `t_system_area` VALUES ('430721', ',430000,430700,', '430700', '2016-01-25 14:31:21', '安乡县', '湖南省常德市安乡县');
INSERT INTO `t_system_area` VALUES ('430722', ',430000,430700,', '430700', '2016-01-25 14:31:21', '汉寿县', '湖南省常德市汉寿县');
INSERT INTO `t_system_area` VALUES ('430723', ',430000,430700,', '430700', '2016-01-25 14:31:21', '澧县', '湖南省常德市澧县');
INSERT INTO `t_system_area` VALUES ('430724', ',430000,430700,', '430700', '2016-01-25 14:31:21', '临澧县', '湖南省常德市临澧县');
INSERT INTO `t_system_area` VALUES ('430725', ',430000,430700,', '430700', '2016-01-25 14:31:21', '桃源县', '湖南省常德市桃源县');
INSERT INTO `t_system_area` VALUES ('430726', ',430000,430700,', '430700', '2016-01-25 14:31:21', '石门县', '湖南省常德市石门县');
INSERT INTO `t_system_area` VALUES ('430781', ',430000,430700,', '430700', '2016-01-25 14:31:21', '津市市', '湖南省常德市津市市');
INSERT INTO `t_system_area` VALUES ('430782', ',430000,430700,', '430700', '2016-01-25 14:31:21', '其它区', '湖南省常德市其它区');
INSERT INTO `t_system_area` VALUES ('430800', ',430000,', '430000', '2016-01-25 14:31:21', '张家界市', '湖南省张家界市');
INSERT INTO `t_system_area` VALUES ('430802', ',430000,430800,', '430800', '2016-01-25 14:31:21', '永定区', '湖南省张家界市永定区');
INSERT INTO `t_system_area` VALUES ('430811', ',430000,430800,', '430800', '2016-01-25 14:31:21', '武陵源区', '湖南省张家界市武陵源区');
INSERT INTO `t_system_area` VALUES ('430821', ',430000,430800,', '430800', '2016-01-25 14:31:21', '慈利县', '湖南省张家界市慈利县');
INSERT INTO `t_system_area` VALUES ('430822', ',430000,430800,', '430800', '2016-01-25 14:31:21', '桑植县', '湖南省张家界市桑植县');
INSERT INTO `t_system_area` VALUES ('430823', ',430000,430800,', '430800', '2016-01-25 14:31:21', '其它区', '湖南省张家界市其它区');
INSERT INTO `t_system_area` VALUES ('430900', ',430000,', '430000', '2016-01-25 14:31:21', '益阳市', '湖南省益阳市');
INSERT INTO `t_system_area` VALUES ('430902', ',430000,430900,', '430900', '2016-01-25 14:31:21', '资阳区', '湖南省益阳市资阳区');
INSERT INTO `t_system_area` VALUES ('430903', ',430000,430900,', '430900', '2016-01-25 14:31:21', '赫山区', '湖南省益阳市赫山区');
INSERT INTO `t_system_area` VALUES ('430921', ',430000,430900,', '430900', '2016-01-25 14:31:21', '南县', '湖南省益阳市南县');
INSERT INTO `t_system_area` VALUES ('430922', ',430000,430900,', '430900', '2016-01-25 14:31:21', '桃江县', '湖南省益阳市桃江县');
INSERT INTO `t_system_area` VALUES ('430923', ',430000,430900,', '430900', '2016-01-25 14:31:21', '安化县', '湖南省益阳市安化县');
INSERT INTO `t_system_area` VALUES ('430981', ',430000,430900,', '430900', '2016-01-25 14:31:22', '沅江市', '湖南省益阳市沅江市');
INSERT INTO `t_system_area` VALUES ('430982', ',430000,430900,', '430900', '2016-01-25 14:31:22', '其它区', '湖南省益阳市其它区');
INSERT INTO `t_system_area` VALUES ('431000', ',430000,', '430000', '2016-01-25 14:31:22', '郴州市', '湖南省郴州市');
INSERT INTO `t_system_area` VALUES ('431002', ',430000,431000,', '431000', '2016-01-25 14:31:22', '北湖区', '湖南省郴州市北湖区');
INSERT INTO `t_system_area` VALUES ('431003', ',430000,431000,', '431000', '2016-01-25 14:31:22', '苏仙区', '湖南省郴州市苏仙区');
INSERT INTO `t_system_area` VALUES ('431021', ',430000,431000,', '431000', '2016-01-25 14:31:22', '桂阳县', '湖南省郴州市桂阳县');
INSERT INTO `t_system_area` VALUES ('431022', ',430000,431000,', '431000', '2016-01-25 14:31:22', '宜章县', '湖南省郴州市宜章县');
INSERT INTO `t_system_area` VALUES ('431023', ',430000,431000,', '431000', '2016-01-25 14:31:22', '永兴县', '湖南省郴州市永兴县');
INSERT INTO `t_system_area` VALUES ('431024', ',430000,431000,', '431000', '2016-01-25 14:31:22', '嘉禾县', '湖南省郴州市嘉禾县');
INSERT INTO `t_system_area` VALUES ('431025', ',430000,431000,', '431000', '2016-01-25 14:31:22', '临武县', '湖南省郴州市临武县');
INSERT INTO `t_system_area` VALUES ('431026', ',430000,431000,', '431000', '2016-01-25 14:31:22', '汝城县', '湖南省郴州市汝城县');
INSERT INTO `t_system_area` VALUES ('431027', ',430000,431000,', '431000', '2016-01-25 14:31:22', '桂东县', '湖南省郴州市桂东县');
INSERT INTO `t_system_area` VALUES ('431028', ',430000,431000,', '431000', '2016-01-25 14:31:22', '安仁县', '湖南省郴州市安仁县');
INSERT INTO `t_system_area` VALUES ('431081', ',430000,431000,', '431000', '2016-01-25 14:31:22', '资兴市', '湖南省郴州市资兴市');
INSERT INTO `t_system_area` VALUES ('431082', ',430000,431000,', '431000', '2016-01-25 14:31:22', '其它区', '湖南省郴州市其它区');
INSERT INTO `t_system_area` VALUES ('431100', ',430000,', '430000', '2016-01-25 14:31:22', '永州市', '湖南省永州市');
INSERT INTO `t_system_area` VALUES ('431102', ',430000,431100,', '431100', '2016-01-25 14:31:22', '零陵区', '湖南省永州市零陵区');
INSERT INTO `t_system_area` VALUES ('431103', ',430000,431100,', '431100', '2016-01-25 14:31:22', '冷水滩区', '湖南省永州市冷水滩区');
INSERT INTO `t_system_area` VALUES ('431121', ',430000,431100,', '431100', '2016-01-25 14:31:22', '祁阳县', '湖南省永州市祁阳县');
INSERT INTO `t_system_area` VALUES ('431122', ',430000,431100,', '431100', '2016-01-25 14:31:22', '东安县', '湖南省永州市东安县');
INSERT INTO `t_system_area` VALUES ('431123', ',430000,431100,', '431100', '2016-01-25 14:31:22', '双牌县', '湖南省永州市双牌县');
INSERT INTO `t_system_area` VALUES ('431124', ',430000,431100,', '431100', '2016-01-25 14:31:22', '道县', '湖南省永州市道县');
INSERT INTO `t_system_area` VALUES ('431125', ',430000,431100,', '431100', '2016-01-25 14:31:22', '江永县', '湖南省永州市江永县');
INSERT INTO `t_system_area` VALUES ('431126', ',430000,431100,', '431100', '2016-01-25 14:31:22', '宁远县', '湖南省永州市宁远县');
INSERT INTO `t_system_area` VALUES ('431127', ',430000,431100,', '431100', '2016-01-25 14:31:22', '蓝山县', '湖南省永州市蓝山县');
INSERT INTO `t_system_area` VALUES ('431128', ',430000,431100,', '431100', '2016-01-25 14:31:22', '新田县', '湖南省永州市新田县');
INSERT INTO `t_system_area` VALUES ('431129', ',430000,431100,', '431100', '2016-01-25 14:31:22', '江华瑶族自治县', '湖南省永州市江华瑶族自治县');
INSERT INTO `t_system_area` VALUES ('431130', ',430000,431100,', '431100', '2016-01-25 14:31:22', '其它区', '湖南省永州市其它区');
INSERT INTO `t_system_area` VALUES ('431200', ',430000,', '430000', '2016-01-25 14:31:22', '怀化市', '湖南省怀化市');
INSERT INTO `t_system_area` VALUES ('431202', ',430000,431200,', '431200', '2016-01-25 14:31:22', '鹤城区', '湖南省怀化市鹤城区');
INSERT INTO `t_system_area` VALUES ('431221', ',430000,431200,', '431200', '2016-01-25 14:31:22', '中方县', '湖南省怀化市中方县');
INSERT INTO `t_system_area` VALUES ('431222', ',430000,431200,', '431200', '2016-01-25 14:31:22', '沅陵县', '湖南省怀化市沅陵县');
INSERT INTO `t_system_area` VALUES ('431223', ',430000,431200,', '431200', '2016-01-25 14:31:22', '辰溪县', '湖南省怀化市辰溪县');
INSERT INTO `t_system_area` VALUES ('431224', ',430000,431200,', '431200', '2016-01-25 14:31:22', '溆浦县', '湖南省怀化市溆浦县');
INSERT INTO `t_system_area` VALUES ('431225', ',430000,431200,', '431200', '2016-01-25 14:31:22', '会同县', '湖南省怀化市会同县');
INSERT INTO `t_system_area` VALUES ('431226', ',430000,431200,', '431200', '2016-01-25 14:31:22', '麻阳苗族自治县', '湖南省怀化市麻阳苗族自治县');
INSERT INTO `t_system_area` VALUES ('431227', ',430000,431200,', '431200', '2016-01-25 14:31:22', '新晃侗族自治县', '湖南省怀化市新晃侗族自治县');
INSERT INTO `t_system_area` VALUES ('431228', ',430000,431200,', '431200', '2016-01-25 14:31:22', '芷江侗族自治县', '湖南省怀化市芷江侗族自治县');
INSERT INTO `t_system_area` VALUES ('431229', ',430000,431200,', '431200', '2016-01-25 14:31:22', '靖州苗族侗族自治县', '湖南省怀化市靖州苗族侗族自治县');
INSERT INTO `t_system_area` VALUES ('431230', ',430000,431200,', '431200', '2016-01-25 14:31:22', '通道侗族自治县', '湖南省怀化市通道侗族自治县');
INSERT INTO `t_system_area` VALUES ('431281', ',430000,431200,', '431200', '2016-01-25 14:31:22', '洪江市', '湖南省怀化市洪江市');
INSERT INTO `t_system_area` VALUES ('431282', ',430000,431200,', '431200', '2016-01-25 14:31:22', '其它区', '湖南省怀化市其它区');
INSERT INTO `t_system_area` VALUES ('431300', ',430000,', '430000', '2016-01-25 14:31:22', '娄底市', '湖南省娄底市');
INSERT INTO `t_system_area` VALUES ('431302', ',430000,431300,', '431300', '2016-01-25 14:31:22', '娄星区', '湖南省娄底市娄星区');
INSERT INTO `t_system_area` VALUES ('431321', ',430000,431300,', '431300', '2016-01-25 14:31:22', '双峰县', '湖南省娄底市双峰县');
INSERT INTO `t_system_area` VALUES ('431322', ',430000,431300,', '431300', '2016-01-25 14:31:22', '新化县', '湖南省娄底市新化县');
INSERT INTO `t_system_area` VALUES ('431381', ',430000,431300,', '431300', '2016-01-25 14:31:22', '冷水江市', '湖南省娄底市冷水江市');
INSERT INTO `t_system_area` VALUES ('431382', ',430000,431300,', '431300', '2016-01-25 14:31:22', '涟源市', '湖南省娄底市涟源市');
INSERT INTO `t_system_area` VALUES ('431383', ',430000,431300,', '431300', '2016-01-25 14:31:22', '其它区', '湖南省娄底市其它区');
INSERT INTO `t_system_area` VALUES ('433100', ',430000,', '430000', '2016-01-25 14:31:22', '湘西土家族苗族自治州', '湖南省湘西土家族苗族自治州');
INSERT INTO `t_system_area` VALUES ('433101', ',430000,433100,', '433100', '2016-01-25 14:31:22', '吉首市', '湖南省湘西土家族苗族自治州吉首市');
INSERT INTO `t_system_area` VALUES ('433122', ',430000,433100,', '433100', '2016-01-25 14:31:22', '泸溪县', '湖南省湘西土家族苗族自治州泸溪县');
INSERT INTO `t_system_area` VALUES ('433123', ',430000,433100,', '433100', '2016-01-25 14:31:22', '凤凰县', '湖南省湘西土家族苗族自治州凤凰县');
INSERT INTO `t_system_area` VALUES ('433124', ',430000,433100,', '433100', '2016-01-25 14:31:22', '花垣县', '湖南省湘西土家族苗族自治州花垣县');
INSERT INTO `t_system_area` VALUES ('433125', ',430000,433100,', '433100', '2016-01-25 14:31:22', '保靖县', '湖南省湘西土家族苗族自治州保靖县');
INSERT INTO `t_system_area` VALUES ('433126', ',430000,433100,', '433100', '2016-01-25 14:31:22', '古丈县', '湖南省湘西土家族苗族自治州古丈县');
INSERT INTO `t_system_area` VALUES ('433127', ',430000,433100,', '433100', '2016-01-25 14:31:22', '永顺县', '湖南省湘西土家族苗族自治州永顺县');
INSERT INTO `t_system_area` VALUES ('433130', ',430000,433100,', '433100', '2016-01-25 14:31:22', '龙山县', '湖南省湘西土家族苗族自治州龙山县');
INSERT INTO `t_system_area` VALUES ('433131', ',430000,433100,', '433100', '2016-01-25 14:31:22', '其它区', '湖南省湘西土家族苗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('440000', ',', null, '2016-01-25 14:31:22', '广东省', '广东省');
INSERT INTO `t_system_area` VALUES ('440100', ',440000,', '440000', '2016-01-25 14:31:22', '广州市', '广东省广州市');
INSERT INTO `t_system_area` VALUES ('440103', ',440000,440100,', '440100', '2016-01-25 14:31:22', '荔湾区', '广东省广州市荔湾区');
INSERT INTO `t_system_area` VALUES ('440104', ',440000,440100,', '440100', '2016-01-25 14:31:22', '越秀区', '广东省广州市越秀区');
INSERT INTO `t_system_area` VALUES ('440105', ',440000,440100,', '440100', '2016-01-25 14:31:22', '海珠区', '广东省广州市海珠区');
INSERT INTO `t_system_area` VALUES ('440106', ',440000,440100,', '440100', '2016-01-25 14:31:22', '天河区', '广东省广州市天河区');
INSERT INTO `t_system_area` VALUES ('440111', ',440000,440100,', '440100', '2016-01-25 14:31:22', '白云区', '广东省广州市白云区');
INSERT INTO `t_system_area` VALUES ('440112', ',440000,440100,', '440100', '2016-01-25 14:31:22', '黄埔区', '广东省广州市黄埔区');
INSERT INTO `t_system_area` VALUES ('440113', ',440000,440100,', '440100', '2016-01-25 14:31:22', '番禺区', '广东省广州市番禺区');
INSERT INTO `t_system_area` VALUES ('440114', ',440000,440100,', '440100', '2016-01-25 14:31:22', '花都区', '广东省广州市花都区');
INSERT INTO `t_system_area` VALUES ('440115', ',440000,440100,', '440100', '2016-01-25 14:31:22', '南沙区', '广东省广州市南沙区');
INSERT INTO `t_system_area` VALUES ('440116', ',440000,440100,', '440100', '2016-01-25 14:31:22', '萝岗区', '广东省广州市萝岗区');
INSERT INTO `t_system_area` VALUES ('440183', ',440000,440100,', '440100', '2016-01-25 14:31:22', '增城市', '广东省广州市增城市');
INSERT INTO `t_system_area` VALUES ('440184', ',440000,440100,', '440100', '2016-01-25 14:31:22', '从化市', '广东省广州市从化市');
INSERT INTO `t_system_area` VALUES ('440188', ',440000,440100,', '440100', '2016-01-25 14:31:22', '东山区', '广东省广州市东山区');
INSERT INTO `t_system_area` VALUES ('440189', ',440000,440100,', '440100', '2016-01-25 14:31:22', '其它区', '广东省广州市其它区');
INSERT INTO `t_system_area` VALUES ('440200', ',440000,', '440000', '2016-01-25 14:31:22', '韶关市', '广东省韶关市');
INSERT INTO `t_system_area` VALUES ('440203', ',440000,440200,', '440200', '2016-01-25 14:31:22', '武江区', '广东省韶关市武江区');
INSERT INTO `t_system_area` VALUES ('440204', ',440000,440200,', '440200', '2016-01-25 14:31:22', '浈江区', '广东省韶关市浈江区');
INSERT INTO `t_system_area` VALUES ('440205', ',440000,440200,', '440200', '2016-01-25 14:31:22', '曲江区', '广东省韶关市曲江区');
INSERT INTO `t_system_area` VALUES ('440222', ',440000,440200,', '440200', '2016-01-25 14:31:22', '始兴县', '广东省韶关市始兴县');
INSERT INTO `t_system_area` VALUES ('440224', ',440000,440200,', '440200', '2016-01-25 14:31:22', '仁化县', '广东省韶关市仁化县');
INSERT INTO `t_system_area` VALUES ('440229', ',440000,440200,', '440200', '2016-01-25 14:31:22', '翁源县', '广东省韶关市翁源县');
INSERT INTO `t_system_area` VALUES ('440232', ',440000,440200,', '440200', '2016-01-25 14:31:22', '乳源瑶族自治县', '广东省韶关市乳源瑶族自治县');
INSERT INTO `t_system_area` VALUES ('440233', ',440000,440200,', '440200', '2016-01-25 14:31:22', '新丰县', '广东省韶关市新丰县');
INSERT INTO `t_system_area` VALUES ('440281', ',440000,440200,', '440200', '2016-01-25 14:31:22', '乐昌市', '广东省韶关市乐昌市');
INSERT INTO `t_system_area` VALUES ('440282', ',440000,440200,', '440200', '2016-01-25 14:31:22', '南雄市', '广东省韶关市南雄市');
INSERT INTO `t_system_area` VALUES ('440283', ',440000,440200,', '440200', '2016-01-25 14:31:22', '其它区', '广东省韶关市其它区');
INSERT INTO `t_system_area` VALUES ('440300', ',440000,', '440000', '2016-01-25 14:31:22', '深圳市', '广东省深圳市');
INSERT INTO `t_system_area` VALUES ('440303', ',440000,440300,', '440300', '2016-01-25 14:31:22', '罗湖区', '广东省深圳市罗湖区');
INSERT INTO `t_system_area` VALUES ('440304', ',440000,440300,', '440300', '2016-01-25 14:31:22', '福田区', '广东省深圳市福田区');
INSERT INTO `t_system_area` VALUES ('440305', ',440000,440300,', '440300', '2016-01-25 14:31:22', '南山区', '广东省深圳市南山区');
INSERT INTO `t_system_area` VALUES ('440306', ',440000,440300,', '440300', '2016-01-25 14:31:22', '宝安区', '广东省深圳市宝安区');
INSERT INTO `t_system_area` VALUES ('440307', ',440000,440300,', '440300', '2016-01-25 14:31:22', '龙岗区', '广东省深圳市龙岗区');
INSERT INTO `t_system_area` VALUES ('440308', ',440000,440300,', '440300', '2016-01-25 14:31:22', '盐田区', '广东省深圳市盐田区');
INSERT INTO `t_system_area` VALUES ('440309', ',440000,440300,', '440300', '2016-01-25 14:31:22', '其它区', '广东省深圳市其它区');
INSERT INTO `t_system_area` VALUES ('440320', ',440000,440300,', '440300', '2016-01-25 14:31:22', '光明新区', '广东省深圳市光明新区');
INSERT INTO `t_system_area` VALUES ('440321', ',440000,440300,', '440300', '2016-01-25 14:31:22', '坪山新区', '广东省深圳市坪山新区');
INSERT INTO `t_system_area` VALUES ('440322', ',440000,440300,', '440300', '2016-01-25 14:31:22', '大鹏新区', '广东省深圳市大鹏新区');
INSERT INTO `t_system_area` VALUES ('440323', ',440000,440300,', '440300', '2016-01-25 14:31:22', '龙华新区', '广东省深圳市龙华新区');
INSERT INTO `t_system_area` VALUES ('440400', ',440000,', '440000', '2016-01-25 14:31:22', '珠海市', '广东省珠海市');
INSERT INTO `t_system_area` VALUES ('440402', ',440000,440400,', '440400', '2016-01-25 14:31:22', '香洲区', '广东省珠海市香洲区');
INSERT INTO `t_system_area` VALUES ('440403', ',440000,440400,', '440400', '2016-01-25 14:31:22', '斗门区', '广东省珠海市斗门区');
INSERT INTO `t_system_area` VALUES ('440404', ',440000,440400,', '440400', '2016-01-25 14:31:22', '金湾区', '广东省珠海市金湾区');
INSERT INTO `t_system_area` VALUES ('440486', ',440000,440400,', '440400', '2016-01-25 14:31:22', '金唐区', '广东省珠海市金唐区');
INSERT INTO `t_system_area` VALUES ('440487', ',440000,440400,', '440400', '2016-01-25 14:31:22', '南湾区', '广东省珠海市南湾区');
INSERT INTO `t_system_area` VALUES ('440488', ',440000,440400,', '440400', '2016-01-25 14:31:23', '其它区', '广东省珠海市其它区');
INSERT INTO `t_system_area` VALUES ('440500', ',440000,', '440000', '2016-01-25 14:31:23', '汕头市', '广东省汕头市');
INSERT INTO `t_system_area` VALUES ('440507', ',440000,440500,', '440500', '2016-01-25 14:31:23', '龙湖区', '广东省汕头市龙湖区');
INSERT INTO `t_system_area` VALUES ('440511', ',440000,440500,', '440500', '2016-01-25 14:31:23', '金平区', '广东省汕头市金平区');
INSERT INTO `t_system_area` VALUES ('440512', ',440000,440500,', '440500', '2016-01-25 14:31:23', '濠江区', '广东省汕头市濠江区');
INSERT INTO `t_system_area` VALUES ('440513', ',440000,440500,', '440500', '2016-01-25 14:31:23', '潮阳区', '广东省汕头市潮阳区');
INSERT INTO `t_system_area` VALUES ('440514', ',440000,440500,', '440500', '2016-01-25 14:31:23', '潮南区', '广东省汕头市潮南区');
INSERT INTO `t_system_area` VALUES ('440515', ',440000,440500,', '440500', '2016-01-25 14:31:23', '澄海区', '广东省汕头市澄海区');
INSERT INTO `t_system_area` VALUES ('440523', ',440000,440500,', '440500', '2016-01-25 14:31:23', '南澳县', '广东省汕头市南澳县');
INSERT INTO `t_system_area` VALUES ('440524', ',440000,440500,', '440500', '2016-01-25 14:31:23', '其它区', '广东省汕头市其它区');
INSERT INTO `t_system_area` VALUES ('440600', ',440000,', '440000', '2016-01-25 14:31:23', '佛山市', '广东省佛山市');
INSERT INTO `t_system_area` VALUES ('440604', ',440000,440600,', '440600', '2016-01-25 14:31:23', '禅城区', '广东省佛山市禅城区');
INSERT INTO `t_system_area` VALUES ('440605', ',440000,440600,', '440600', '2016-01-25 14:31:23', '南海区', '广东省佛山市南海区');
INSERT INTO `t_system_area` VALUES ('440606', ',440000,440600,', '440600', '2016-01-25 14:31:23', '顺德区', '广东省佛山市顺德区');
INSERT INTO `t_system_area` VALUES ('440607', ',440000,440600,', '440600', '2016-01-25 14:31:23', '三水区', '广东省佛山市三水区');
INSERT INTO `t_system_area` VALUES ('440608', ',440000,440600,', '440600', '2016-01-25 14:31:23', '高明区', '广东省佛山市高明区');
INSERT INTO `t_system_area` VALUES ('440609', ',440000,440600,', '440600', '2016-01-25 14:31:23', '其它区', '广东省佛山市其它区');
INSERT INTO `t_system_area` VALUES ('440700', ',440000,', '440000', '2016-01-25 14:31:23', '江门市', '广东省江门市');
INSERT INTO `t_system_area` VALUES ('440703', ',440000,440700,', '440700', '2016-01-25 14:31:23', '蓬江区', '广东省江门市蓬江区');
INSERT INTO `t_system_area` VALUES ('440704', ',440000,440700,', '440700', '2016-01-25 14:31:23', '江海区', '广东省江门市江海区');
INSERT INTO `t_system_area` VALUES ('440705', ',440000,440700,', '440700', '2016-01-25 14:31:23', '新会区', '广东省江门市新会区');
INSERT INTO `t_system_area` VALUES ('440781', ',440000,440700,', '440700', '2016-01-25 14:31:23', '台山市', '广东省江门市台山市');
INSERT INTO `t_system_area` VALUES ('440783', ',440000,440700,', '440700', '2016-01-25 14:31:23', '开平市', '广东省江门市开平市');
INSERT INTO `t_system_area` VALUES ('440784', ',440000,440700,', '440700', '2016-01-25 14:31:23', '鹤山市', '广东省江门市鹤山市');
INSERT INTO `t_system_area` VALUES ('440785', ',440000,440700,', '440700', '2016-01-25 14:31:23', '恩平市', '广东省江门市恩平市');
INSERT INTO `t_system_area` VALUES ('440786', ',440000,440700,', '440700', '2016-01-25 14:31:23', '其它区', '广东省江门市其它区');
INSERT INTO `t_system_area` VALUES ('440800', ',440000,', '440000', '2016-01-25 14:31:23', '湛江市', '广东省湛江市');
INSERT INTO `t_system_area` VALUES ('440802', ',440000,440800,', '440800', '2016-01-25 14:31:23', '赤坎区', '广东省湛江市赤坎区');
INSERT INTO `t_system_area` VALUES ('440803', ',440000,440800,', '440800', '2016-01-25 14:31:23', '霞山区', '广东省湛江市霞山区');
INSERT INTO `t_system_area` VALUES ('440804', ',440000,440800,', '440800', '2016-01-25 14:31:23', '坡头区', '广东省湛江市坡头区');
INSERT INTO `t_system_area` VALUES ('440811', ',440000,440800,', '440800', '2016-01-25 14:31:23', '麻章区', '广东省湛江市麻章区');
INSERT INTO `t_system_area` VALUES ('440823', ',440000,440800,', '440800', '2016-01-25 14:31:23', '遂溪县', '广东省湛江市遂溪县');
INSERT INTO `t_system_area` VALUES ('440825', ',440000,440800,', '440800', '2016-01-25 14:31:23', '徐闻县', '广东省湛江市徐闻县');
INSERT INTO `t_system_area` VALUES ('440881', ',440000,440800,', '440800', '2016-01-25 14:31:23', '廉江市', '广东省湛江市廉江市');
INSERT INTO `t_system_area` VALUES ('440882', ',440000,440800,', '440800', '2016-01-25 14:31:23', '雷州市', '广东省湛江市雷州市');
INSERT INTO `t_system_area` VALUES ('440883', ',440000,440800,', '440800', '2016-01-25 14:31:23', '吴川市', '广东省湛江市吴川市');
INSERT INTO `t_system_area` VALUES ('440884', ',440000,440800,', '440800', '2016-01-25 14:31:23', '其它区', '广东省湛江市其它区');
INSERT INTO `t_system_area` VALUES ('440900', ',440000,', '440000', '2016-01-25 14:31:23', '茂名市', '广东省茂名市');
INSERT INTO `t_system_area` VALUES ('440902', ',440000,440900,', '440900', '2016-01-25 14:31:23', '茂南区', '广东省茂名市茂南区');
INSERT INTO `t_system_area` VALUES ('440903', ',440000,440900,', '440900', '2016-01-25 14:31:23', '茂港区', '广东省茂名市茂港区');
INSERT INTO `t_system_area` VALUES ('440923', ',440000,440900,', '440900', '2016-01-25 14:31:23', '电白县', '广东省茂名市电白县');
INSERT INTO `t_system_area` VALUES ('440981', ',440000,440900,', '440900', '2016-01-25 14:31:23', '高州市', '广东省茂名市高州市');
INSERT INTO `t_system_area` VALUES ('440982', ',440000,440900,', '440900', '2016-01-25 14:31:23', '化州市', '广东省茂名市化州市');
INSERT INTO `t_system_area` VALUES ('440983', ',440000,440900,', '440900', '2016-01-25 14:31:23', '信宜市', '广东省茂名市信宜市');
INSERT INTO `t_system_area` VALUES ('440984', ',440000,440900,', '440900', '2016-01-25 14:31:23', '其它区', '广东省茂名市其它区');
INSERT INTO `t_system_area` VALUES ('441200', ',440000,', '440000', '2016-01-25 14:31:23', '肇庆市', '广东省肇庆市');
INSERT INTO `t_system_area` VALUES ('441202', ',440000,441200,', '441200', '2016-01-25 14:31:23', '端州区', '广东省肇庆市端州区');
INSERT INTO `t_system_area` VALUES ('441203', ',440000,441200,', '441200', '2016-01-25 14:31:23', '鼎湖区', '广东省肇庆市鼎湖区');
INSERT INTO `t_system_area` VALUES ('441223', ',440000,441200,', '441200', '2016-01-25 14:31:23', '广宁县', '广东省肇庆市广宁县');
INSERT INTO `t_system_area` VALUES ('441224', ',440000,441200,', '441200', '2016-01-25 14:31:23', '怀集县', '广东省肇庆市怀集县');
INSERT INTO `t_system_area` VALUES ('441225', ',440000,441200,', '441200', '2016-01-25 14:31:23', '封开县', '广东省肇庆市封开县');
INSERT INTO `t_system_area` VALUES ('441226', ',440000,441200,', '441200', '2016-01-25 14:31:23', '德庆县', '广东省肇庆市德庆县');
INSERT INTO `t_system_area` VALUES ('441283', ',440000,441200,', '441200', '2016-01-25 14:31:23', '高要市', '广东省肇庆市高要市');
INSERT INTO `t_system_area` VALUES ('441284', ',440000,441200,', '441200', '2016-01-25 14:31:23', '四会市', '广东省肇庆市四会市');
INSERT INTO `t_system_area` VALUES ('441285', ',440000,441200,', '441200', '2016-01-25 14:31:23', '其它区', '广东省肇庆市其它区');
INSERT INTO `t_system_area` VALUES ('441300', ',440000,', '440000', '2016-01-25 14:31:23', '惠州市', '广东省惠州市');
INSERT INTO `t_system_area` VALUES ('441302', ',440000,441300,', '441300', '2016-01-25 14:31:23', '惠城区', '广东省惠州市惠城区');
INSERT INTO `t_system_area` VALUES ('441303', ',440000,441300,', '441300', '2016-01-25 14:31:23', '惠阳区', '广东省惠州市惠阳区');
INSERT INTO `t_system_area` VALUES ('441322', ',440000,441300,', '441300', '2016-01-25 14:31:23', '博罗县', '广东省惠州市博罗县');
INSERT INTO `t_system_area` VALUES ('441323', ',440000,441300,', '441300', '2016-01-25 14:31:23', '惠东县', '广东省惠州市惠东县');
INSERT INTO `t_system_area` VALUES ('441324', ',440000,441300,', '441300', '2016-01-25 14:31:23', '龙门县', '广东省惠州市龙门县');
INSERT INTO `t_system_area` VALUES ('441325', ',440000,441300,', '441300', '2016-01-25 14:31:23', '其它区', '广东省惠州市其它区');
INSERT INTO `t_system_area` VALUES ('441400', ',440000,', '440000', '2016-01-25 14:31:23', '梅州市', '广东省梅州市');
INSERT INTO `t_system_area` VALUES ('441402', ',440000,441400,', '441400', '2016-01-25 14:31:23', '梅江区', '广东省梅州市梅江区');
INSERT INTO `t_system_area` VALUES ('441421', ',440000,441400,', '441400', '2016-01-25 14:31:23', '梅县', '广东省梅州市梅县');
INSERT INTO `t_system_area` VALUES ('441422', ',440000,441400,', '441400', '2016-01-25 14:31:23', '大埔县', '广东省梅州市大埔县');
INSERT INTO `t_system_area` VALUES ('441423', ',440000,441400,', '441400', '2016-01-25 14:31:23', '丰顺县', '广东省梅州市丰顺县');
INSERT INTO `t_system_area` VALUES ('441424', ',440000,441400,', '441400', '2016-01-25 14:31:23', '五华县', '广东省梅州市五华县');
INSERT INTO `t_system_area` VALUES ('441426', ',440000,441400,', '441400', '2016-01-25 14:31:23', '平远县', '广东省梅州市平远县');
INSERT INTO `t_system_area` VALUES ('441427', ',440000,441400,', '441400', '2016-01-25 14:31:23', '蕉岭县', '广东省梅州市蕉岭县');
INSERT INTO `t_system_area` VALUES ('441481', ',440000,441400,', '441400', '2016-01-25 14:31:23', '兴宁市', '广东省梅州市兴宁市');
INSERT INTO `t_system_area` VALUES ('441482', ',440000,441400,', '441400', '2016-01-25 14:31:23', '其它区', '广东省梅州市其它区');
INSERT INTO `t_system_area` VALUES ('441500', ',440000,', '440000', '2016-01-25 14:31:23', '汕尾市', '广东省汕尾市');
INSERT INTO `t_system_area` VALUES ('441502', ',440000,441500,', '441500', '2016-01-25 14:31:23', '城区', '广东省汕尾市城区');
INSERT INTO `t_system_area` VALUES ('441521', ',440000,441500,', '441500', '2016-01-25 14:31:23', '海丰县', '广东省汕尾市海丰县');
INSERT INTO `t_system_area` VALUES ('441523', ',440000,441500,', '441500', '2016-01-25 14:31:23', '陆河县', '广东省汕尾市陆河县');
INSERT INTO `t_system_area` VALUES ('441581', ',440000,441500,', '441500', '2016-01-25 14:31:23', '陆丰市', '广东省汕尾市陆丰市');
INSERT INTO `t_system_area` VALUES ('441582', ',440000,441500,', '441500', '2016-01-25 14:31:23', '其它区', '广东省汕尾市其它区');
INSERT INTO `t_system_area` VALUES ('441600', ',440000,', '440000', '2016-01-25 14:31:23', '河源市', '广东省河源市');
INSERT INTO `t_system_area` VALUES ('441602', ',440000,441600,', '441600', '2016-01-25 14:31:23', '源城区', '广东省河源市源城区');
INSERT INTO `t_system_area` VALUES ('441621', ',440000,441600,', '441600', '2016-01-25 14:31:23', '紫金县', '广东省河源市紫金县');
INSERT INTO `t_system_area` VALUES ('441622', ',440000,441600,', '441600', '2016-01-25 14:31:23', '龙川县', '广东省河源市龙川县');
INSERT INTO `t_system_area` VALUES ('441623', ',440000,441600,', '441600', '2016-01-25 14:31:23', '连平县', '广东省河源市连平县');
INSERT INTO `t_system_area` VALUES ('441624', ',440000,441600,', '441600', '2016-01-25 14:31:23', '和平县', '广东省河源市和平县');
INSERT INTO `t_system_area` VALUES ('441625', ',440000,441600,', '441600', '2016-01-25 14:31:23', '东源县', '广东省河源市东源县');
INSERT INTO `t_system_area` VALUES ('441626', ',440000,441600,', '441600', '2016-01-25 14:31:23', '其它区', '广东省河源市其它区');
INSERT INTO `t_system_area` VALUES ('441700', ',440000,', '440000', '2016-01-25 14:31:23', '阳江市', '广东省阳江市');
INSERT INTO `t_system_area` VALUES ('441702', ',440000,441700,', '441700', '2016-01-25 14:31:23', '江城区', '广东省阳江市江城区');
INSERT INTO `t_system_area` VALUES ('441721', ',440000,441700,', '441700', '2016-01-25 14:31:23', '阳西县', '广东省阳江市阳西县');
INSERT INTO `t_system_area` VALUES ('441723', ',440000,441700,', '441700', '2016-01-25 14:31:23', '阳东县', '广东省阳江市阳东县');
INSERT INTO `t_system_area` VALUES ('441781', ',440000,441700,', '441700', '2016-01-25 14:31:23', '阳春市', '广东省阳江市阳春市');
INSERT INTO `t_system_area` VALUES ('441782', ',440000,441700,', '441700', '2016-01-25 14:31:23', '其它区', '广东省阳江市其它区');
INSERT INTO `t_system_area` VALUES ('441800', ',440000,', '440000', '2016-01-25 14:31:23', '清远市', '广东省清远市');
INSERT INTO `t_system_area` VALUES ('441802', ',440000,441800,', '441800', '2016-01-25 14:31:23', '清城区', '广东省清远市清城区');
INSERT INTO `t_system_area` VALUES ('441821', ',440000,441800,', '441800', '2016-01-25 14:31:23', '佛冈县', '广东省清远市佛冈县');
INSERT INTO `t_system_area` VALUES ('441823', ',440000,441800,', '441800', '2016-01-25 14:31:23', '阳山县', '广东省清远市阳山县');
INSERT INTO `t_system_area` VALUES ('441825', ',440000,441800,', '441800', '2016-01-25 14:31:23', '连山壮族瑶族自治县', '广东省清远市连山壮族瑶族自治县');
INSERT INTO `t_system_area` VALUES ('441826', ',440000,441800,', '441800', '2016-01-25 14:31:23', '连南瑶族自治县', '广东省清远市连南瑶族自治县');
INSERT INTO `t_system_area` VALUES ('441827', ',440000,441800,', '441800', '2016-01-25 14:31:23', '清新区', '广东省清远市清新区');
INSERT INTO `t_system_area` VALUES ('441881', ',440000,441800,', '441800', '2016-01-25 14:31:23', '英德市', '广东省清远市英德市');
INSERT INTO `t_system_area` VALUES ('441882', ',440000,441800,', '441800', '2016-01-25 14:31:23', '连州市', '广东省清远市连州市');
INSERT INTO `t_system_area` VALUES ('441883', ',440000,441800,', '441800', '2016-01-25 14:31:23', '其它区', '广东省清远市其它区');
INSERT INTO `t_system_area` VALUES ('441900', ',440000,', '440000', '2016-01-25 14:31:23', '东莞市', '广东省东莞市');
INSERT INTO `t_system_area` VALUES ('442000', ',440000,', '440000', '2016-01-25 14:31:23', '中山市', '广东省中山市');
INSERT INTO `t_system_area` VALUES ('442101', ',440000,', '440000', '2016-01-25 14:31:23', '东沙群岛', '广东省东沙群岛');
INSERT INTO `t_system_area` VALUES ('445100', ',440000,', '440000', '2016-01-25 14:31:23', '潮州市', '广东省潮州市');
INSERT INTO `t_system_area` VALUES ('445102', ',440000,445100,', '445100', '2016-01-25 14:31:23', '湘桥区', '广东省潮州市湘桥区');
INSERT INTO `t_system_area` VALUES ('445121', ',440000,445100,', '445100', '2016-01-25 14:31:24', '潮安区', '广东省潮州市潮安区');
INSERT INTO `t_system_area` VALUES ('445122', ',440000,445100,', '445100', '2016-01-25 14:31:24', '饶平县', '广东省潮州市饶平县');
INSERT INTO `t_system_area` VALUES ('445185', ',440000,445100,', '445100', '2016-01-25 14:31:24', '枫溪区', '广东省潮州市枫溪区');
INSERT INTO `t_system_area` VALUES ('445186', ',440000,445100,', '445100', '2016-01-25 14:31:24', '其它区', '广东省潮州市其它区');
INSERT INTO `t_system_area` VALUES ('445200', ',440000,', '440000', '2016-01-25 14:31:24', '揭阳市', '广东省揭阳市');
INSERT INTO `t_system_area` VALUES ('445202', ',440000,445200,', '445200', '2016-01-25 14:31:24', '榕城区', '广东省揭阳市榕城区');
INSERT INTO `t_system_area` VALUES ('445221', ',440000,445200,', '445200', '2016-01-25 14:31:24', '揭东区', '广东省揭阳市揭东区');
INSERT INTO `t_system_area` VALUES ('445222', ',440000,445200,', '445200', '2016-01-25 14:31:24', '揭西县', '广东省揭阳市揭西县');
INSERT INTO `t_system_area` VALUES ('445224', ',440000,445200,', '445200', '2016-01-25 14:31:24', '惠来县', '广东省揭阳市惠来县');
INSERT INTO `t_system_area` VALUES ('445281', ',440000,445200,', '445200', '2016-01-25 14:31:24', '普宁市', '广东省揭阳市普宁市');
INSERT INTO `t_system_area` VALUES ('445284', ',440000,445200,', '445200', '2016-01-25 14:31:24', '东山区', '广东省揭阳市东山区');
INSERT INTO `t_system_area` VALUES ('445285', ',440000,445200,', '445200', '2016-01-25 14:31:24', '其它区', '广东省揭阳市其它区');
INSERT INTO `t_system_area` VALUES ('445300', ',440000,', '440000', '2016-01-25 14:31:24', '云浮市', '广东省云浮市');
INSERT INTO `t_system_area` VALUES ('445302', ',440000,445300,', '445300', '2016-01-25 14:31:24', '云城区', '广东省云浮市云城区');
INSERT INTO `t_system_area` VALUES ('445321', ',440000,445300,', '445300', '2016-01-25 14:31:24', '新兴县', '广东省云浮市新兴县');
INSERT INTO `t_system_area` VALUES ('445322', ',440000,445300,', '445300', '2016-01-25 14:31:24', '郁南县', '广东省云浮市郁南县');
INSERT INTO `t_system_area` VALUES ('445323', ',440000,445300,', '445300', '2016-01-25 14:31:24', '云安县', '广东省云浮市云安县');
INSERT INTO `t_system_area` VALUES ('445381', ',440000,445300,', '445300', '2016-01-25 14:31:24', '罗定市', '广东省云浮市罗定市');
INSERT INTO `t_system_area` VALUES ('445382', ',440000,445300,', '445300', '2016-01-25 14:31:24', '其它区', '广东省云浮市其它区');
INSERT INTO `t_system_area` VALUES ('450000', ',', null, '2016-01-25 14:31:24', '广西', '广西');
INSERT INTO `t_system_area` VALUES ('450100', ',450000,', '450000', '2016-01-25 14:31:24', '南宁市', '广西南宁市');
INSERT INTO `t_system_area` VALUES ('450102', ',450000,450100,', '450100', '2016-01-25 14:31:24', '兴宁区', '广西南宁市兴宁区');
INSERT INTO `t_system_area` VALUES ('450103', ',450000,450100,', '450100', '2016-01-25 14:31:24', '青秀区', '广西南宁市青秀区');
INSERT INTO `t_system_area` VALUES ('450105', ',450000,450100,', '450100', '2016-01-25 14:31:24', '江南区', '广西南宁市江南区');
INSERT INTO `t_system_area` VALUES ('450107', ',450000,450100,', '450100', '2016-01-25 14:31:24', '西乡塘区', '广西南宁市西乡塘区');
INSERT INTO `t_system_area` VALUES ('450108', ',450000,450100,', '450100', '2016-01-25 14:31:24', '良庆区', '广西南宁市良庆区');
INSERT INTO `t_system_area` VALUES ('450109', ',450000,450100,', '450100', '2016-01-25 14:31:24', '邕宁区', '广西南宁市邕宁区');
INSERT INTO `t_system_area` VALUES ('450122', ',450000,450100,', '450100', '2016-01-25 14:31:24', '武鸣县', '广西南宁市武鸣县');
INSERT INTO `t_system_area` VALUES ('450123', ',450000,450100,', '450100', '2016-01-25 14:31:24', '隆安县', '广西南宁市隆安县');
INSERT INTO `t_system_area` VALUES ('450124', ',450000,450100,', '450100', '2016-01-25 14:31:24', '马山县', '广西南宁市马山县');
INSERT INTO `t_system_area` VALUES ('450125', ',450000,450100,', '450100', '2016-01-25 14:31:24', '上林县', '广西南宁市上林县');
INSERT INTO `t_system_area` VALUES ('450126', ',450000,450100,', '450100', '2016-01-25 14:31:24', '宾阳县', '广西南宁市宾阳县');
INSERT INTO `t_system_area` VALUES ('450127', ',450000,450100,', '450100', '2016-01-25 14:31:24', '横县', '广西南宁市横县');
INSERT INTO `t_system_area` VALUES ('450128', ',450000,450100,', '450100', '2016-01-25 14:31:24', '其它区', '广西南宁市其它区');
INSERT INTO `t_system_area` VALUES ('450200', ',450000,', '450000', '2016-01-25 14:31:24', '柳州市', '广西柳州市');
INSERT INTO `t_system_area` VALUES ('450202', ',450000,450200,', '450200', '2016-01-25 14:31:24', '城中区', '广西柳州市城中区');
INSERT INTO `t_system_area` VALUES ('450203', ',450000,450200,', '450200', '2016-01-25 14:31:24', '鱼峰区', '广西柳州市鱼峰区');
INSERT INTO `t_system_area` VALUES ('450204', ',450000,450200,', '450200', '2016-01-25 14:31:24', '柳南区', '广西柳州市柳南区');
INSERT INTO `t_system_area` VALUES ('450205', ',450000,450200,', '450200', '2016-01-25 14:31:24', '柳北区', '广西柳州市柳北区');
INSERT INTO `t_system_area` VALUES ('450221', ',450000,450200,', '450200', '2016-01-25 14:31:24', '柳江县', '广西柳州市柳江县');
INSERT INTO `t_system_area` VALUES ('450222', ',450000,450200,', '450200', '2016-01-25 14:31:24', '柳城县', '广西柳州市柳城县');
INSERT INTO `t_system_area` VALUES ('450223', ',450000,450200,', '450200', '2016-01-25 14:31:24', '鹿寨县', '广西柳州市鹿寨县');
INSERT INTO `t_system_area` VALUES ('450224', ',450000,450200,', '450200', '2016-01-25 14:31:24', '融安县', '广西柳州市融安县');
INSERT INTO `t_system_area` VALUES ('450225', ',450000,450200,', '450200', '2016-01-25 14:31:24', '融水苗族自治县', '广西柳州市融水苗族自治县');
INSERT INTO `t_system_area` VALUES ('450226', ',450000,450200,', '450200', '2016-01-25 14:31:24', '三江侗族自治县', '广西柳州市三江侗族自治县');
INSERT INTO `t_system_area` VALUES ('450227', ',450000,450200,', '450200', '2016-01-25 14:31:24', '其它区', '广西柳州市其它区');
INSERT INTO `t_system_area` VALUES ('450300', ',450000,', '450000', '2016-01-25 14:31:24', '桂林市', '广西桂林市');
INSERT INTO `t_system_area` VALUES ('450302', ',450000,450300,', '450300', '2016-01-25 14:31:24', '秀峰区', '广西桂林市秀峰区');
INSERT INTO `t_system_area` VALUES ('450303', ',450000,450300,', '450300', '2016-01-25 14:31:24', '叠彩区', '广西桂林市叠彩区');
INSERT INTO `t_system_area` VALUES ('450304', ',450000,450300,', '450300', '2016-01-25 14:31:24', '象山区', '广西桂林市象山区');
INSERT INTO `t_system_area` VALUES ('450305', ',450000,450300,', '450300', '2016-01-25 14:31:24', '七星区', '广西桂林市七星区');
INSERT INTO `t_system_area` VALUES ('450311', ',450000,450300,', '450300', '2016-01-25 14:31:24', '雁山区', '广西桂林市雁山区');
INSERT INTO `t_system_area` VALUES ('450321', ',450000,450300,', '450300', '2016-01-25 14:31:24', '阳朔县', '广西桂林市阳朔县');
INSERT INTO `t_system_area` VALUES ('450322', ',450000,450300,', '450300', '2016-01-25 14:31:24', '临桂区', '广西桂林市临桂区');
INSERT INTO `t_system_area` VALUES ('450323', ',450000,450300,', '450300', '2016-01-25 14:31:24', '灵川县', '广西桂林市灵川县');
INSERT INTO `t_system_area` VALUES ('450324', ',450000,450300,', '450300', '2016-01-25 14:31:24', '全州县', '广西桂林市全州县');
INSERT INTO `t_system_area` VALUES ('450325', ',450000,450300,', '450300', '2016-01-25 14:31:24', '兴安县', '广西桂林市兴安县');
INSERT INTO `t_system_area` VALUES ('450326', ',450000,450300,', '450300', '2016-01-25 14:31:24', '永福县', '广西桂林市永福县');
INSERT INTO `t_system_area` VALUES ('450327', ',450000,450300,', '450300', '2016-01-25 14:31:24', '灌阳县', '广西桂林市灌阳县');
INSERT INTO `t_system_area` VALUES ('450328', ',450000,450300,', '450300', '2016-01-25 14:31:24', '龙胜各族自治县', '广西桂林市龙胜各族自治县');
INSERT INTO `t_system_area` VALUES ('450329', ',450000,450300,', '450300', '2016-01-25 14:31:24', '资源县', '广西桂林市资源县');
INSERT INTO `t_system_area` VALUES ('450330', ',450000,450300,', '450300', '2016-01-25 14:31:24', '平乐县', '广西桂林市平乐县');
INSERT INTO `t_system_area` VALUES ('450331', ',450000,450300,', '450300', '2016-01-25 14:31:24', '荔浦县', '广西桂林市荔浦县');
INSERT INTO `t_system_area` VALUES ('450332', ',450000,450300,', '450300', '2016-01-25 14:31:24', '恭城瑶族自治县', '广西桂林市恭城瑶族自治县');
INSERT INTO `t_system_area` VALUES ('450333', ',450000,450300,', '450300', '2016-01-25 14:31:24', '其它区', '广西桂林市其它区');
INSERT INTO `t_system_area` VALUES ('450400', ',450000,', '450000', '2016-01-25 14:31:24', '梧州市', '广西梧州市');
INSERT INTO `t_system_area` VALUES ('450403', ',450000,450400,', '450400', '2016-01-25 14:31:24', '万秀区', '广西梧州市万秀区');
INSERT INTO `t_system_area` VALUES ('450404', ',450000,450400,', '450400', '2016-01-25 14:31:24', '蝶山区', '广西梧州市蝶山区');
INSERT INTO `t_system_area` VALUES ('450405', ',450000,450400,', '450400', '2016-01-25 14:31:24', '长洲区', '广西梧州市长洲区');
INSERT INTO `t_system_area` VALUES ('450406', ',450000,450400,', '450400', '2016-01-25 14:31:24', '龙圩区', '广西梧州市龙圩区');
INSERT INTO `t_system_area` VALUES ('450421', ',450000,450400,', '450400', '2016-01-25 14:31:24', '苍梧县', '广西梧州市苍梧县');
INSERT INTO `t_system_area` VALUES ('450422', ',450000,450400,', '450400', '2016-01-25 14:31:24', '藤县', '广西梧州市藤县');
INSERT INTO `t_system_area` VALUES ('450423', ',450000,450400,', '450400', '2016-01-25 14:31:24', '蒙山县', '广西梧州市蒙山县');
INSERT INTO `t_system_area` VALUES ('450481', ',450000,450400,', '450400', '2016-01-25 14:31:24', '岑溪市', '广西梧州市岑溪市');
INSERT INTO `t_system_area` VALUES ('450482', ',450000,450400,', '450400', '2016-01-25 14:31:24', '其它区', '广西梧州市其它区');
INSERT INTO `t_system_area` VALUES ('450500', ',450000,', '450000', '2016-01-25 14:31:24', '北海市', '广西北海市');
INSERT INTO `t_system_area` VALUES ('450502', ',450000,450500,', '450500', '2016-01-25 14:31:24', '海城区', '广西北海市海城区');
INSERT INTO `t_system_area` VALUES ('450503', ',450000,450500,', '450500', '2016-01-25 14:31:24', '银海区', '广西北海市银海区');
INSERT INTO `t_system_area` VALUES ('450512', ',450000,450500,', '450500', '2016-01-25 14:31:24', '铁山港区', '广西北海市铁山港区');
INSERT INTO `t_system_area` VALUES ('450521', ',450000,450500,', '450500', '2016-01-25 14:31:24', '合浦县', '广西北海市合浦县');
INSERT INTO `t_system_area` VALUES ('450522', ',450000,450500,', '450500', '2016-01-25 14:31:24', '其它区', '广西北海市其它区');
INSERT INTO `t_system_area` VALUES ('450600', ',450000,', '450000', '2016-01-25 14:31:24', '防城港市', '广西防城港市');
INSERT INTO `t_system_area` VALUES ('450602', ',450000,450600,', '450600', '2016-01-25 14:31:24', '港口区', '广西防城港市港口区');
INSERT INTO `t_system_area` VALUES ('450603', ',450000,450600,', '450600', '2016-01-25 14:31:24', '防城区', '广西防城港市防城区');
INSERT INTO `t_system_area` VALUES ('450621', ',450000,450600,', '450600', '2016-01-25 14:31:24', '上思县', '广西防城港市上思县');
INSERT INTO `t_system_area` VALUES ('450681', ',450000,450600,', '450600', '2016-01-25 14:31:24', '东兴市', '广西防城港市东兴市');
INSERT INTO `t_system_area` VALUES ('450682', ',450000,450600,', '450600', '2016-01-25 14:31:24', '其它区', '广西防城港市其它区');
INSERT INTO `t_system_area` VALUES ('450700', ',450000,', '450000', '2016-01-25 14:31:24', '钦州市', '广西钦州市');
INSERT INTO `t_system_area` VALUES ('450702', ',450000,450700,', '450700', '2016-01-25 14:31:24', '钦南区', '广西钦州市钦南区');
INSERT INTO `t_system_area` VALUES ('450703', ',450000,450700,', '450700', '2016-01-25 14:31:24', '钦北区', '广西钦州市钦北区');
INSERT INTO `t_system_area` VALUES ('450721', ',450000,450700,', '450700', '2016-01-25 14:31:24', '灵山县', '广西钦州市灵山县');
INSERT INTO `t_system_area` VALUES ('450722', ',450000,450700,', '450700', '2016-01-25 14:31:24', '浦北县', '广西钦州市浦北县');
INSERT INTO `t_system_area` VALUES ('450723', ',450000,450700,', '450700', '2016-01-25 14:31:24', '其它区', '广西钦州市其它区');
INSERT INTO `t_system_area` VALUES ('450800', ',450000,', '450000', '2016-01-25 14:31:24', '贵港市', '广西贵港市');
INSERT INTO `t_system_area` VALUES ('450802', ',450000,450800,', '450800', '2016-01-25 14:31:24', '港北区', '广西贵港市港北区');
INSERT INTO `t_system_area` VALUES ('450803', ',450000,450800,', '450800', '2016-01-25 14:31:24', '港南区', '广西贵港市港南区');
INSERT INTO `t_system_area` VALUES ('450804', ',450000,450800,', '450800', '2016-01-25 14:31:24', '覃塘区', '广西贵港市覃塘区');
INSERT INTO `t_system_area` VALUES ('450821', ',450000,450800,', '450800', '2016-01-25 14:31:24', '平南县', '广西贵港市平南县');
INSERT INTO `t_system_area` VALUES ('450881', ',450000,450800,', '450800', '2016-01-25 14:31:24', '桂平市', '广西贵港市桂平市');
INSERT INTO `t_system_area` VALUES ('450882', ',450000,450800,', '450800', '2016-01-25 14:31:24', '其它区', '广西贵港市其它区');
INSERT INTO `t_system_area` VALUES ('450900', ',450000,', '450000', '2016-01-25 14:31:24', '玉林市', '广西玉林市');
INSERT INTO `t_system_area` VALUES ('450902', ',450000,450900,', '450900', '2016-01-25 14:31:24', '玉州区', '广西玉林市玉州区');
INSERT INTO `t_system_area` VALUES ('450903', ',450000,450900,', '450900', '2016-01-25 14:31:24', '福绵区', '广西玉林市福绵区');
INSERT INTO `t_system_area` VALUES ('450921', ',450000,450900,', '450900', '2016-01-25 14:31:25', '容县', '广西玉林市容县');
INSERT INTO `t_system_area` VALUES ('450922', ',450000,450900,', '450900', '2016-01-25 14:31:25', '陆川县', '广西玉林市陆川县');
INSERT INTO `t_system_area` VALUES ('450923', ',450000,450900,', '450900', '2016-01-25 14:31:25', '博白县', '广西玉林市博白县');
INSERT INTO `t_system_area` VALUES ('450924', ',450000,450900,', '450900', '2016-01-25 14:31:25', '兴业县', '广西玉林市兴业县');
INSERT INTO `t_system_area` VALUES ('450981', ',450000,450900,', '450900', '2016-01-25 14:31:25', '北流市', '广西玉林市北流市');
INSERT INTO `t_system_area` VALUES ('450982', ',450000,450900,', '450900', '2016-01-25 14:31:25', '其它区', '广西玉林市其它区');
INSERT INTO `t_system_area` VALUES ('451000', ',450000,', '450000', '2016-01-25 14:31:25', '百色市', '广西百色市');
INSERT INTO `t_system_area` VALUES ('451002', ',450000,451000,', '451000', '2016-01-25 14:31:25', '右江区', '广西百色市右江区');
INSERT INTO `t_system_area` VALUES ('451021', ',450000,451000,', '451000', '2016-01-25 14:31:25', '田阳县', '广西百色市田阳县');
INSERT INTO `t_system_area` VALUES ('451022', ',450000,451000,', '451000', '2016-01-25 14:31:25', '田东县', '广西百色市田东县');
INSERT INTO `t_system_area` VALUES ('451023', ',450000,451000,', '451000', '2016-01-25 14:31:25', '平果县', '广西百色市平果县');
INSERT INTO `t_system_area` VALUES ('451024', ',450000,451000,', '451000', '2016-01-25 14:31:25', '德保县', '广西百色市德保县');
INSERT INTO `t_system_area` VALUES ('451025', ',450000,451000,', '451000', '2016-01-25 14:31:25', '靖西县', '广西百色市靖西县');
INSERT INTO `t_system_area` VALUES ('451026', ',450000,451000,', '451000', '2016-01-25 14:31:25', '那坡县', '广西百色市那坡县');
INSERT INTO `t_system_area` VALUES ('451027', ',450000,451000,', '451000', '2016-01-25 14:31:25', '凌云县', '广西百色市凌云县');
INSERT INTO `t_system_area` VALUES ('451028', ',450000,451000,', '451000', '2016-01-25 14:31:25', '乐业县', '广西百色市乐业县');
INSERT INTO `t_system_area` VALUES ('451029', ',450000,451000,', '451000', '2016-01-25 14:31:25', '田林县', '广西百色市田林县');
INSERT INTO `t_system_area` VALUES ('451030', ',450000,451000,', '451000', '2016-01-25 14:31:25', '西林县', '广西百色市西林县');
INSERT INTO `t_system_area` VALUES ('451031', ',450000,451000,', '451000', '2016-01-25 14:31:25', '隆林各族自治县', '广西百色市隆林各族自治县');
INSERT INTO `t_system_area` VALUES ('451032', ',450000,451000,', '451000', '2016-01-25 14:31:25', '其它区', '广西百色市其它区');
INSERT INTO `t_system_area` VALUES ('451100', ',450000,', '450000', '2016-01-25 14:31:25', '贺州市', '广西贺州市');
INSERT INTO `t_system_area` VALUES ('451102', ',450000,451100,', '451100', '2016-01-25 14:31:25', '八步区', '广西贺州市八步区');
INSERT INTO `t_system_area` VALUES ('451119', ',450000,451100,', '451100', '2016-01-25 14:31:25', '平桂管理区', '广西贺州市平桂管理区');
INSERT INTO `t_system_area` VALUES ('451121', ',450000,451100,', '451100', '2016-01-25 14:31:25', '昭平县', '广西贺州市昭平县');
INSERT INTO `t_system_area` VALUES ('451122', ',450000,451100,', '451100', '2016-01-25 14:31:25', '钟山县', '广西贺州市钟山县');
INSERT INTO `t_system_area` VALUES ('451123', ',450000,451100,', '451100', '2016-01-25 14:31:25', '富川瑶族自治县', '广西贺州市富川瑶族自治县');
INSERT INTO `t_system_area` VALUES ('451124', ',450000,451100,', '451100', '2016-01-25 14:31:25', '其它区', '广西贺州市其它区');
INSERT INTO `t_system_area` VALUES ('451200', ',450000,', '450000', '2016-01-25 14:31:25', '河池市', '广西河池市');
INSERT INTO `t_system_area` VALUES ('451202', ',450000,451200,', '451200', '2016-01-25 14:31:25', '金城江区', '广西河池市金城江区');
INSERT INTO `t_system_area` VALUES ('451221', ',450000,451200,', '451200', '2016-01-25 14:31:25', '南丹县', '广西河池市南丹县');
INSERT INTO `t_system_area` VALUES ('451222', ',450000,451200,', '451200', '2016-01-25 14:31:25', '天峨县', '广西河池市天峨县');
INSERT INTO `t_system_area` VALUES ('451223', ',450000,451200,', '451200', '2016-01-25 14:31:25', '凤山县', '广西河池市凤山县');
INSERT INTO `t_system_area` VALUES ('451224', ',450000,451200,', '451200', '2016-01-25 14:31:25', '东兰县', '广西河池市东兰县');
INSERT INTO `t_system_area` VALUES ('451225', ',450000,451200,', '451200', '2016-01-25 14:31:25', '罗城仫佬族自治县', '广西河池市罗城仫佬族自治县');
INSERT INTO `t_system_area` VALUES ('451226', ',450000,451200,', '451200', '2016-01-25 14:31:25', '环江毛南族自治县', '广西河池市环江毛南族自治县');
INSERT INTO `t_system_area` VALUES ('451227', ',450000,451200,', '451200', '2016-01-25 14:31:25', '巴马瑶族自治县', '广西河池市巴马瑶族自治县');
INSERT INTO `t_system_area` VALUES ('451228', ',450000,451200,', '451200', '2016-01-25 14:31:25', '都安瑶族自治县', '广西河池市都安瑶族自治县');
INSERT INTO `t_system_area` VALUES ('451229', ',450000,451200,', '451200', '2016-01-25 14:31:25', '大化瑶族自治县', '广西河池市大化瑶族自治县');
INSERT INTO `t_system_area` VALUES ('451281', ',450000,451200,', '451200', '2016-01-25 14:31:25', '宜州市', '广西河池市宜州市');
INSERT INTO `t_system_area` VALUES ('451282', ',450000,451200,', '451200', '2016-01-25 14:31:25', '其它区', '广西河池市其它区');
INSERT INTO `t_system_area` VALUES ('451300', ',450000,', '450000', '2016-01-25 14:31:25', '来宾市', '广西来宾市');
INSERT INTO `t_system_area` VALUES ('451302', ',450000,451300,', '451300', '2016-01-25 14:31:25', '兴宾区', '广西来宾市兴宾区');
INSERT INTO `t_system_area` VALUES ('451321', ',450000,451300,', '451300', '2016-01-25 14:31:25', '忻城县', '广西来宾市忻城县');
INSERT INTO `t_system_area` VALUES ('451322', ',450000,451300,', '451300', '2016-01-25 14:31:25', '象州县', '广西来宾市象州县');
INSERT INTO `t_system_area` VALUES ('451323', ',450000,451300,', '451300', '2016-01-25 14:31:25', '武宣县', '广西来宾市武宣县');
INSERT INTO `t_system_area` VALUES ('451324', ',450000,451300,', '451300', '2016-01-25 14:31:25', '金秀瑶族自治县', '广西来宾市金秀瑶族自治县');
INSERT INTO `t_system_area` VALUES ('451381', ',450000,451300,', '451300', '2016-01-25 14:31:25', '合山市', '广西来宾市合山市');
INSERT INTO `t_system_area` VALUES ('451382', ',450000,451300,', '451300', '2016-01-25 14:31:25', '其它区', '广西来宾市其它区');
INSERT INTO `t_system_area` VALUES ('451400', ',450000,', '450000', '2016-01-25 14:31:25', '崇左市', '广西崇左市');
INSERT INTO `t_system_area` VALUES ('451402', ',450000,451400,', '451400', '2016-01-25 14:31:25', '江州区', '广西崇左市江州区');
INSERT INTO `t_system_area` VALUES ('451421', ',450000,451400,', '451400', '2016-01-25 14:31:25', '扶绥县', '广西崇左市扶绥县');
INSERT INTO `t_system_area` VALUES ('451422', ',450000,451400,', '451400', '2016-01-25 14:31:25', '宁明县', '广西崇左市宁明县');
INSERT INTO `t_system_area` VALUES ('451423', ',450000,451400,', '451400', '2016-01-25 14:31:25', '龙州县', '广西崇左市龙州县');
INSERT INTO `t_system_area` VALUES ('451424', ',450000,451400,', '451400', '2016-01-25 14:31:25', '大新县', '广西崇左市大新县');
INSERT INTO `t_system_area` VALUES ('451425', ',450000,451400,', '451400', '2016-01-25 14:31:25', '天等县', '广西崇左市天等县');
INSERT INTO `t_system_area` VALUES ('451481', ',450000,451400,', '451400', '2016-01-25 14:31:25', '凭祥市', '广西崇左市凭祥市');
INSERT INTO `t_system_area` VALUES ('451482', ',450000,451400,', '451400', '2016-01-25 14:31:25', '其它区', '广西崇左市其它区');
INSERT INTO `t_system_area` VALUES ('460000', ',', null, '2016-01-25 14:31:25', '海南省', '海南省');
INSERT INTO `t_system_area` VALUES ('460100', ',460000,', '460000', '2016-01-25 14:31:25', '海口市', '海南省海口市');
INSERT INTO `t_system_area` VALUES ('460105', ',460000,460100,', '460100', '2016-01-25 14:31:25', '秀英区', '海南省海口市秀英区');
INSERT INTO `t_system_area` VALUES ('460106', ',460000,460100,', '460100', '2016-01-25 14:31:25', '龙华区', '海南省海口市龙华区');
INSERT INTO `t_system_area` VALUES ('460107', ',460000,460100,', '460100', '2016-01-25 14:31:25', '琼山区', '海南省海口市琼山区');
INSERT INTO `t_system_area` VALUES ('460108', ',460000,460100,', '460100', '2016-01-25 14:31:25', '美兰区', '海南省海口市美兰区');
INSERT INTO `t_system_area` VALUES ('460109', ',460000,460100,', '460100', '2016-01-25 14:31:25', '其它区', '海南省海口市其它区');
INSERT INTO `t_system_area` VALUES ('460200', ',460000,', '460000', '2016-01-25 14:31:25', '三亚市', '海南省三亚市');
INSERT INTO `t_system_area` VALUES ('460300', ',460000,', '460000', '2016-01-25 14:31:25', '三沙市', '海南省三沙市');
INSERT INTO `t_system_area` VALUES ('460321', ',460000,460300,', '460300', '2016-01-25 14:31:25', '西沙群岛', '海南省三沙市西沙群岛');
INSERT INTO `t_system_area` VALUES ('460322', ',460000,460300,', '460300', '2016-01-25 14:31:25', '南沙群岛', '海南省三沙市南沙群岛');
INSERT INTO `t_system_area` VALUES ('460323', ',460000,460300,', '460300', '2016-01-25 14:31:25', '中沙群岛的岛礁及其海域', '海南省三沙市中沙群岛的岛礁及其海域');
INSERT INTO `t_system_area` VALUES ('469001', ',460000,', '460000', '2016-01-25 14:31:25', '五指山市', '海南省五指山市');
INSERT INTO `t_system_area` VALUES ('469002', ',460000,', '460000', '2016-01-25 14:31:25', '琼海市', '海南省琼海市');
INSERT INTO `t_system_area` VALUES ('469003', ',460000,', '460000', '2016-01-25 14:31:25', '儋州市', '海南省儋州市');
INSERT INTO `t_system_area` VALUES ('469005', ',460000,', '460000', '2016-01-25 14:31:25', '文昌市', '海南省文昌市');
INSERT INTO `t_system_area` VALUES ('469006', ',460000,', '460000', '2016-01-25 14:31:25', '万宁市', '海南省万宁市');
INSERT INTO `t_system_area` VALUES ('469007', ',460000,', '460000', '2016-01-25 14:31:25', '东方市', '海南省东方市');
INSERT INTO `t_system_area` VALUES ('469025', ',460000,', '460000', '2016-01-25 14:31:25', '定安县', '海南省定安县');
INSERT INTO `t_system_area` VALUES ('469026', ',460000,', '460000', '2016-01-25 14:31:25', '屯昌县', '海南省屯昌县');
INSERT INTO `t_system_area` VALUES ('469027', ',460000,', '460000', '2016-01-25 14:31:25', '澄迈县', '海南省澄迈县');
INSERT INTO `t_system_area` VALUES ('469028', ',460000,', '460000', '2016-01-25 14:31:25', '临高县', '海南省临高县');
INSERT INTO `t_system_area` VALUES ('469030', ',460000,', '460000', '2016-01-25 14:31:25', '白沙黎族自治县', '海南省白沙黎族自治县');
INSERT INTO `t_system_area` VALUES ('469031', ',460000,', '460000', '2016-01-25 14:31:25', '昌江黎族自治县', '海南省昌江黎族自治县');
INSERT INTO `t_system_area` VALUES ('469033', ',460000,', '460000', '2016-01-25 14:31:25', '乐东黎族自治县', '海南省乐东黎族自治县');
INSERT INTO `t_system_area` VALUES ('469034', ',460000,', '460000', '2016-01-25 14:31:25', '陵水黎族自治县', '海南省陵水黎族自治县');
INSERT INTO `t_system_area` VALUES ('469035', ',460000,', '460000', '2016-01-25 14:31:25', '保亭黎族苗族自治县', '海南省保亭黎族苗族自治县');
INSERT INTO `t_system_area` VALUES ('469036', ',460000,', '460000', '2016-01-25 14:31:25', '琼中黎族苗族自治县', '海南省琼中黎族苗族自治县');
INSERT INTO `t_system_area` VALUES ('469037', ',460000,', '460000', '2016-01-25 14:31:25', '西沙群岛', '海南省西沙群岛');
INSERT INTO `t_system_area` VALUES ('469038', ',460000,', '460000', '2016-01-25 14:31:25', '南沙群岛', '海南省南沙群岛');
INSERT INTO `t_system_area` VALUES ('469039', ',460000,', '460000', '2016-01-25 14:31:25', '中沙群岛的岛礁及其海域', '海南省中沙群岛的岛礁及其海域');
INSERT INTO `t_system_area` VALUES ('471004', ',410000,410300,', '410300', '2016-01-25 14:31:18', '高新区', '河南省洛阳市高新区');
INSERT INTO `t_system_area` VALUES ('471005', ',410000,410300,', '410300', '2016-01-25 14:31:18', '其它区', '河南省洛阳市其它区');
INSERT INTO `t_system_area` VALUES ('500100', ',', null, '2016-01-25 14:31:01', '重庆市', '重庆市');
INSERT INTO `t_system_area` VALUES ('500101', ',500100,', '500100', '2016-01-25 14:31:01', '万州区', '重庆市万州区');
INSERT INTO `t_system_area` VALUES ('500102', ',500100,', '500100', '2016-01-25 14:31:01', '涪陵区', '重庆市涪陵区');
INSERT INTO `t_system_area` VALUES ('500103', ',500100,', '500100', '2016-01-25 14:31:01', '渝中区', '重庆市渝中区');
INSERT INTO `t_system_area` VALUES ('500104', ',500100,', '500100', '2016-01-25 14:31:01', '大渡口区', '重庆市大渡口区');
INSERT INTO `t_system_area` VALUES ('500105', ',500100,', '500100', '2016-01-25 14:31:01', '江北区', '重庆市江北区');
INSERT INTO `t_system_area` VALUES ('500106', ',500100,', '500100', '2016-01-25 14:31:01', '沙坪坝区', '重庆市沙坪坝区');
INSERT INTO `t_system_area` VALUES ('500107', ',500100,', '500100', '2016-01-25 14:31:01', '九龙坡区', '重庆市九龙坡区');
INSERT INTO `t_system_area` VALUES ('500108', ',500100,', '500100', '2016-01-25 14:31:01', '南岸区', '重庆市南岸区');
INSERT INTO `t_system_area` VALUES ('500109', ',500100,', '500100', '2016-01-25 14:31:01', '北碚区', '重庆市北碚区');
INSERT INTO `t_system_area` VALUES ('500110', ',500100,', '500100', '2016-01-25 14:31:01', '万盛区', '重庆市万盛区');
INSERT INTO `t_system_area` VALUES ('500111', ',500100,', '500100', '2016-01-25 14:31:01', '双桥区', '重庆市双桥区');
INSERT INTO `t_system_area` VALUES ('500112', ',500100,', '500100', '2016-01-25 14:31:01', '渝北区', '重庆市渝北区');
INSERT INTO `t_system_area` VALUES ('500113', ',500100,', '500100', '2016-01-25 14:31:01', '巴南区', '重庆市巴南区');
INSERT INTO `t_system_area` VALUES ('500114', ',500100,', '500100', '2016-01-25 14:31:01', '黔江区', '重庆市黔江区');
INSERT INTO `t_system_area` VALUES ('500115', ',500100,', '500100', '2016-01-25 14:31:01', '长寿区', '重庆市长寿区');
INSERT INTO `t_system_area` VALUES ('500222', ',500100,', '500100', '2016-01-25 14:31:01', '綦江区', '重庆市綦江区');
INSERT INTO `t_system_area` VALUES ('500223', ',500100,', '500100', '2016-01-25 14:31:01', '潼南县', '重庆市潼南县');
INSERT INTO `t_system_area` VALUES ('500224', ',500100,', '500100', '2016-01-25 14:31:01', '铜梁县', '重庆市铜梁县');
INSERT INTO `t_system_area` VALUES ('500225', ',500100,', '500100', '2016-01-25 14:31:01', '大足区', '重庆市大足区');
INSERT INTO `t_system_area` VALUES ('500226', ',500100,', '500100', '2016-01-25 14:31:01', '荣昌县', '重庆市荣昌县');
INSERT INTO `t_system_area` VALUES ('500227', ',500100,', '500100', '2016-01-25 14:31:01', '璧山县', '重庆市璧山县');
INSERT INTO `t_system_area` VALUES ('500228', ',500100,', '500100', '2016-01-25 14:31:01', '梁平县', '重庆市梁平县');
INSERT INTO `t_system_area` VALUES ('500229', ',500100,', '500100', '2016-01-25 14:31:01', '城口县', '重庆市城口县');
INSERT INTO `t_system_area` VALUES ('500230', ',500100,', '500100', '2016-01-25 14:31:01', '丰都县', '重庆市丰都县');
INSERT INTO `t_system_area` VALUES ('500231', ',500100,', '500100', '2016-01-25 14:31:01', '垫江县', '重庆市垫江县');
INSERT INTO `t_system_area` VALUES ('500232', ',500100,', '500100', '2016-01-25 14:31:01', '武隆县', '重庆市武隆县');
INSERT INTO `t_system_area` VALUES ('500233', ',500100,', '500100', '2016-01-25 14:31:01', '忠县', '重庆市忠县');
INSERT INTO `t_system_area` VALUES ('500234', ',500100,', '500100', '2016-01-25 14:31:01', '开县', '重庆市开县');
INSERT INTO `t_system_area` VALUES ('500235', ',500100,', '500100', '2016-01-25 14:31:01', '云阳县', '重庆市云阳县');
INSERT INTO `t_system_area` VALUES ('500236', ',500100,', '500100', '2016-01-25 14:31:01', '奉节县', '重庆市奉节县');
INSERT INTO `t_system_area` VALUES ('500237', ',500100,', '500100', '2016-01-25 14:31:01', '巫山县', '重庆市巫山县');
INSERT INTO `t_system_area` VALUES ('500238', ',500100,', '500100', '2016-01-25 14:31:01', '巫溪县', '重庆市巫溪县');
INSERT INTO `t_system_area` VALUES ('500240', ',500100,', '500100', '2016-01-25 14:31:01', '石柱土家族自治县', '重庆市石柱土家族自治县');
INSERT INTO `t_system_area` VALUES ('500241', ',500100,', '500100', '2016-01-25 14:31:01', '秀山土家族苗族自治县', '重庆市秀山土家族苗族自治县');
INSERT INTO `t_system_area` VALUES ('500242', ',500100,', '500100', '2016-01-25 14:31:01', '酉阳土家族苗族自治县', '重庆市酉阳土家族苗族自治县');
INSERT INTO `t_system_area` VALUES ('500243', ',500100,', '500100', '2016-01-25 14:31:01', '彭水苗族土家族自治县', '重庆市彭水苗族土家族自治县');
INSERT INTO `t_system_area` VALUES ('500381', ',500100,', '500100', '2016-01-25 14:31:01', '江津区', '重庆市江津区');
INSERT INTO `t_system_area` VALUES ('500382', ',500100,', '500100', '2016-01-25 14:31:01', '合川区', '重庆市合川区');
INSERT INTO `t_system_area` VALUES ('500383', ',500100,', '500100', '2016-01-25 14:31:01', '永川区', '重庆市永川区');
INSERT INTO `t_system_area` VALUES ('500384', ',500100,', '500100', '2016-01-25 14:31:01', '南川区', '重庆市南川区');
INSERT INTO `t_system_area` VALUES ('500385', ',500100,', '500100', '2016-01-25 14:31:02', '其它区', '重庆市其它区');
INSERT INTO `t_system_area` VALUES ('510000', ',', null, '2016-01-25 14:31:25', '四川省', '四川省');
INSERT INTO `t_system_area` VALUES ('510100', ',510000,', '510000', '2016-01-25 14:31:25', '成都市', '四川省成都市');
INSERT INTO `t_system_area` VALUES ('510104', ',510000,510100,', '510100', '2016-01-25 14:31:25', '锦江区', '四川省成都市锦江区');
INSERT INTO `t_system_area` VALUES ('510105', ',510000,510100,', '510100', '2016-01-25 14:31:25', '青羊区', '四川省成都市青羊区');
INSERT INTO `t_system_area` VALUES ('510106', ',510000,510100,', '510100', '2016-01-25 14:31:25', '金牛区', '四川省成都市金牛区');
INSERT INTO `t_system_area` VALUES ('510107', ',510000,510100,', '510100', '2016-01-25 14:31:25', '武侯区', '四川省成都市武侯区');
INSERT INTO `t_system_area` VALUES ('510108', ',510000,510100,', '510100', '2016-01-25 14:31:25', '成华区', '四川省成都市成华区');
INSERT INTO `t_system_area` VALUES ('510112', ',510000,510100,', '510100', '2016-01-25 14:31:25', '龙泉驿区', '四川省成都市龙泉驿区');
INSERT INTO `t_system_area` VALUES ('510113', ',510000,510100,', '510100', '2016-01-25 14:31:25', '青白江区', '四川省成都市青白江区');
INSERT INTO `t_system_area` VALUES ('510114', ',510000,510100,', '510100', '2016-01-25 14:31:25', '新都区', '四川省成都市新都区');
INSERT INTO `t_system_area` VALUES ('510115', ',510000,510100,', '510100', '2016-01-25 14:31:25', '温江区', '四川省成都市温江区');
INSERT INTO `t_system_area` VALUES ('510121', ',510000,510100,', '510100', '2016-01-25 14:31:25', '金堂县', '四川省成都市金堂县');
INSERT INTO `t_system_area` VALUES ('510122', ',510000,510100,', '510100', '2016-01-25 14:31:25', '双流县', '四川省成都市双流县');
INSERT INTO `t_system_area` VALUES ('510124', ',510000,510100,', '510100', '2016-01-25 14:31:25', '郫县', '四川省成都市郫县');
INSERT INTO `t_system_area` VALUES ('510129', ',510000,510100,', '510100', '2016-01-25 14:31:25', '大邑县', '四川省成都市大邑县');
INSERT INTO `t_system_area` VALUES ('510131', ',510000,510100,', '510100', '2016-01-25 14:31:25', '蒲江县', '四川省成都市蒲江县');
INSERT INTO `t_system_area` VALUES ('510132', ',510000,510100,', '510100', '2016-01-25 14:31:25', '新津县', '四川省成都市新津县');
INSERT INTO `t_system_area` VALUES ('510181', ',510000,510100,', '510100', '2016-01-25 14:31:25', '都江堰市', '四川省成都市都江堰市');
INSERT INTO `t_system_area` VALUES ('510182', ',510000,510100,', '510100', '2016-01-25 14:31:26', '彭州市', '四川省成都市彭州市');
INSERT INTO `t_system_area` VALUES ('510183', ',510000,510100,', '510100', '2016-01-25 14:31:26', '邛崃市', '四川省成都市邛崃市');
INSERT INTO `t_system_area` VALUES ('510184', ',510000,510100,', '510100', '2016-01-25 14:31:26', '崇州市', '四川省成都市崇州市');
INSERT INTO `t_system_area` VALUES ('510185', ',510000,510100,', '510100', '2016-01-25 14:31:26', '其它区', '四川省成都市其它区');
INSERT INTO `t_system_area` VALUES ('510300', ',510000,', '510000', '2016-01-25 14:31:26', '自贡市', '四川省自贡市');
INSERT INTO `t_system_area` VALUES ('510302', ',510000,510300,', '510300', '2016-01-25 14:31:26', '自流井区', '四川省自贡市自流井区');
INSERT INTO `t_system_area` VALUES ('510303', ',510000,510300,', '510300', '2016-01-25 14:31:26', '贡井区', '四川省自贡市贡井区');
INSERT INTO `t_system_area` VALUES ('510304', ',510000,510300,', '510300', '2016-01-25 14:31:26', '大安区', '四川省自贡市大安区');
INSERT INTO `t_system_area` VALUES ('510311', ',510000,510300,', '510300', '2016-01-25 14:31:26', '沿滩区', '四川省自贡市沿滩区');
INSERT INTO `t_system_area` VALUES ('510321', ',510000,510300,', '510300', '2016-01-25 14:31:26', '荣县', '四川省自贡市荣县');
INSERT INTO `t_system_area` VALUES ('510322', ',510000,510300,', '510300', '2016-01-25 14:31:26', '富顺县', '四川省自贡市富顺县');
INSERT INTO `t_system_area` VALUES ('510323', ',510000,510300,', '510300', '2016-01-25 14:31:26', '其它区', '四川省自贡市其它区');
INSERT INTO `t_system_area` VALUES ('510400', ',510000,', '510000', '2016-01-25 14:31:26', '攀枝花市', '四川省攀枝花市');
INSERT INTO `t_system_area` VALUES ('510402', ',510000,510400,', '510400', '2016-01-25 14:31:26', '东区', '四川省攀枝花市东区');
INSERT INTO `t_system_area` VALUES ('510403', ',510000,510400,', '510400', '2016-01-25 14:31:26', '西区', '四川省攀枝花市西区');
INSERT INTO `t_system_area` VALUES ('510411', ',510000,510400,', '510400', '2016-01-25 14:31:26', '仁和区', '四川省攀枝花市仁和区');
INSERT INTO `t_system_area` VALUES ('510421', ',510000,510400,', '510400', '2016-01-25 14:31:26', '米易县', '四川省攀枝花市米易县');
INSERT INTO `t_system_area` VALUES ('510422', ',510000,510400,', '510400', '2016-01-25 14:31:26', '盐边县', '四川省攀枝花市盐边县');
INSERT INTO `t_system_area` VALUES ('510423', ',510000,510400,', '510400', '2016-01-25 14:31:26', '其它区', '四川省攀枝花市其它区');
INSERT INTO `t_system_area` VALUES ('510500', ',510000,', '510000', '2016-01-25 14:31:26', '泸州市', '四川省泸州市');
INSERT INTO `t_system_area` VALUES ('510502', ',510000,510500,', '510500', '2016-01-25 14:31:26', '江阳区', '四川省泸州市江阳区');
INSERT INTO `t_system_area` VALUES ('510503', ',510000,510500,', '510500', '2016-01-25 14:31:26', '纳溪区', '四川省泸州市纳溪区');
INSERT INTO `t_system_area` VALUES ('510504', ',510000,510500,', '510500', '2016-01-25 14:31:26', '龙马潭区', '四川省泸州市龙马潭区');
INSERT INTO `t_system_area` VALUES ('510521', ',510000,510500,', '510500', '2016-01-25 14:31:26', '泸县', '四川省泸州市泸县');
INSERT INTO `t_system_area` VALUES ('510522', ',510000,510500,', '510500', '2016-01-25 14:31:26', '合江县', '四川省泸州市合江县');
INSERT INTO `t_system_area` VALUES ('510524', ',510000,510500,', '510500', '2016-01-25 14:31:26', '叙永县', '四川省泸州市叙永县');
INSERT INTO `t_system_area` VALUES ('510525', ',510000,510500,', '510500', '2016-01-25 14:31:26', '古蔺县', '四川省泸州市古蔺县');
INSERT INTO `t_system_area` VALUES ('510526', ',510000,510500,', '510500', '2016-01-25 14:31:26', '其它区', '四川省泸州市其它区');
INSERT INTO `t_system_area` VALUES ('510600', ',510000,', '510000', '2016-01-25 14:31:26', '德阳市', '四川省德阳市');
INSERT INTO `t_system_area` VALUES ('510603', ',510000,510600,', '510600', '2016-01-25 14:31:26', '旌阳区', '四川省德阳市旌阳区');
INSERT INTO `t_system_area` VALUES ('510623', ',510000,510600,', '510600', '2016-01-25 14:31:26', '中江县', '四川省德阳市中江县');
INSERT INTO `t_system_area` VALUES ('510626', ',510000,510600,', '510600', '2016-01-25 14:31:26', '罗江县', '四川省德阳市罗江县');
INSERT INTO `t_system_area` VALUES ('510681', ',510000,510600,', '510600', '2016-01-25 14:31:26', '广汉市', '四川省德阳市广汉市');
INSERT INTO `t_system_area` VALUES ('510682', ',510000,510600,', '510600', '2016-01-25 14:31:26', '什邡市', '四川省德阳市什邡市');
INSERT INTO `t_system_area` VALUES ('510683', ',510000,510600,', '510600', '2016-01-25 14:31:26', '绵竹市', '四川省德阳市绵竹市');
INSERT INTO `t_system_area` VALUES ('510684', ',510000,510600,', '510600', '2016-01-25 14:31:26', '其它区', '四川省德阳市其它区');
INSERT INTO `t_system_area` VALUES ('510700', ',510000,', '510000', '2016-01-25 14:31:26', '绵阳市', '四川省绵阳市');
INSERT INTO `t_system_area` VALUES ('510703', ',510000,510700,', '510700', '2016-01-25 14:31:26', '涪城区', '四川省绵阳市涪城区');
INSERT INTO `t_system_area` VALUES ('510704', ',510000,510700,', '510700', '2016-01-25 14:31:26', '游仙区', '四川省绵阳市游仙区');
INSERT INTO `t_system_area` VALUES ('510722', ',510000,510700,', '510700', '2016-01-25 14:31:26', '三台县', '四川省绵阳市三台县');
INSERT INTO `t_system_area` VALUES ('510723', ',510000,510700,', '510700', '2016-01-25 14:31:26', '盐亭县', '四川省绵阳市盐亭县');
INSERT INTO `t_system_area` VALUES ('510724', ',510000,510700,', '510700', '2016-01-25 14:31:26', '安县', '四川省绵阳市安县');
INSERT INTO `t_system_area` VALUES ('510725', ',510000,510700,', '510700', '2016-01-25 14:31:26', '梓潼县', '四川省绵阳市梓潼县');
INSERT INTO `t_system_area` VALUES ('510726', ',510000,510700,', '510700', '2016-01-25 14:31:26', '北川羌族自治县', '四川省绵阳市北川羌族自治县');
INSERT INTO `t_system_area` VALUES ('510727', ',510000,510700,', '510700', '2016-01-25 14:31:26', '平武县', '四川省绵阳市平武县');
INSERT INTO `t_system_area` VALUES ('510751', ',510000,510700,', '510700', '2016-01-25 14:31:26', '高新区', '四川省绵阳市高新区');
INSERT INTO `t_system_area` VALUES ('510781', ',510000,510700,', '510700', '2016-01-25 14:31:26', '江油市', '四川省绵阳市江油市');
INSERT INTO `t_system_area` VALUES ('510782', ',510000,510700,', '510700', '2016-01-25 14:31:26', '其它区', '四川省绵阳市其它区');
INSERT INTO `t_system_area` VALUES ('510800', ',510000,', '510000', '2016-01-25 14:31:26', '广元市', '四川省广元市');
INSERT INTO `t_system_area` VALUES ('510802', ',510000,510800,', '510800', '2016-01-25 14:31:26', '利州区', '四川省广元市利州区');
INSERT INTO `t_system_area` VALUES ('510811', ',510000,510800,', '510800', '2016-01-25 14:31:26', '昭化区', '四川省广元市昭化区');
INSERT INTO `t_system_area` VALUES ('510812', ',510000,510800,', '510800', '2016-01-25 14:31:26', '朝天区', '四川省广元市朝天区');
INSERT INTO `t_system_area` VALUES ('510821', ',510000,510800,', '510800', '2016-01-25 14:31:26', '旺苍县', '四川省广元市旺苍县');
INSERT INTO `t_system_area` VALUES ('510822', ',510000,510800,', '510800', '2016-01-25 14:31:26', '青川县', '四川省广元市青川县');
INSERT INTO `t_system_area` VALUES ('510823', ',510000,510800,', '510800', '2016-01-25 14:31:26', '剑阁县', '四川省广元市剑阁县');
INSERT INTO `t_system_area` VALUES ('510824', ',510000,510800,', '510800', '2016-01-25 14:31:26', '苍溪县', '四川省广元市苍溪县');
INSERT INTO `t_system_area` VALUES ('510825', ',510000,510800,', '510800', '2016-01-25 14:31:26', '其它区', '四川省广元市其它区');
INSERT INTO `t_system_area` VALUES ('510900', ',510000,', '510000', '2016-01-25 14:31:26', '遂宁市', '四川省遂宁市');
INSERT INTO `t_system_area` VALUES ('510903', ',510000,510900,', '510900', '2016-01-25 14:31:26', '船山区', '四川省遂宁市船山区');
INSERT INTO `t_system_area` VALUES ('510904', ',510000,510900,', '510900', '2016-01-25 14:31:26', '安居区', '四川省遂宁市安居区');
INSERT INTO `t_system_area` VALUES ('510921', ',510000,510900,', '510900', '2016-01-25 14:31:26', '蓬溪县', '四川省遂宁市蓬溪县');
INSERT INTO `t_system_area` VALUES ('510922', ',510000,510900,', '510900', '2016-01-25 14:31:26', '射洪县', '四川省遂宁市射洪县');
INSERT INTO `t_system_area` VALUES ('510923', ',510000,510900,', '510900', '2016-01-25 14:31:26', '大英县', '四川省遂宁市大英县');
INSERT INTO `t_system_area` VALUES ('510924', ',510000,510900,', '510900', '2016-01-25 14:31:26', '其它区', '四川省遂宁市其它区');
INSERT INTO `t_system_area` VALUES ('511000', ',510000,', '510000', '2016-01-25 14:31:26', '内江市', '四川省内江市');
INSERT INTO `t_system_area` VALUES ('511002', ',510000,511000,', '511000', '2016-01-25 14:31:26', '市中区', '四川省内江市市中区');
INSERT INTO `t_system_area` VALUES ('511011', ',510000,511000,', '511000', '2016-01-25 14:31:26', '东兴区', '四川省内江市东兴区');
INSERT INTO `t_system_area` VALUES ('511024', ',510000,511000,', '511000', '2016-01-25 14:31:26', '威远县', '四川省内江市威远县');
INSERT INTO `t_system_area` VALUES ('511025', ',510000,511000,', '511000', '2016-01-25 14:31:26', '资中县', '四川省内江市资中县');
INSERT INTO `t_system_area` VALUES ('511028', ',510000,511000,', '511000', '2016-01-25 14:31:26', '隆昌县', '四川省内江市隆昌县');
INSERT INTO `t_system_area` VALUES ('511029', ',510000,511000,', '511000', '2016-01-25 14:31:26', '其它区', '四川省内江市其它区');
INSERT INTO `t_system_area` VALUES ('511100', ',510000,', '510000', '2016-01-25 14:31:26', '乐山市', '四川省乐山市');
INSERT INTO `t_system_area` VALUES ('511102', ',510000,511100,', '511100', '2016-01-25 14:31:26', '市中区', '四川省乐山市市中区');
INSERT INTO `t_system_area` VALUES ('511111', ',510000,511100,', '511100', '2016-01-25 14:31:26', '沙湾区', '四川省乐山市沙湾区');
INSERT INTO `t_system_area` VALUES ('511112', ',510000,511100,', '511100', '2016-01-25 14:31:26', '五通桥区', '四川省乐山市五通桥区');
INSERT INTO `t_system_area` VALUES ('511113', ',510000,511100,', '511100', '2016-01-25 14:31:26', '金口河区', '四川省乐山市金口河区');
INSERT INTO `t_system_area` VALUES ('511123', ',510000,511100,', '511100', '2016-01-25 14:31:26', '犍为县', '四川省乐山市犍为县');
INSERT INTO `t_system_area` VALUES ('511124', ',510000,511100,', '511100', '2016-01-25 14:31:26', '井研县', '四川省乐山市井研县');
INSERT INTO `t_system_area` VALUES ('511126', ',510000,511100,', '511100', '2016-01-25 14:31:26', '夹江县', '四川省乐山市夹江县');
INSERT INTO `t_system_area` VALUES ('511129', ',510000,511100,', '511100', '2016-01-25 14:31:26', '沐川县', '四川省乐山市沐川县');
INSERT INTO `t_system_area` VALUES ('511132', ',510000,511100,', '511100', '2016-01-25 14:31:26', '峨边彝族自治县', '四川省乐山市峨边彝族自治县');
INSERT INTO `t_system_area` VALUES ('511133', ',510000,511100,', '511100', '2016-01-25 14:31:26', '马边彝族自治县', '四川省乐山市马边彝族自治县');
INSERT INTO `t_system_area` VALUES ('511181', ',510000,511100,', '511100', '2016-01-25 14:31:26', '峨眉山市', '四川省乐山市峨眉山市');
INSERT INTO `t_system_area` VALUES ('511182', ',510000,511100,', '511100', '2016-01-25 14:31:26', '其它区', '四川省乐山市其它区');
INSERT INTO `t_system_area` VALUES ('511300', ',510000,', '510000', '2016-01-25 14:31:26', '南充市', '四川省南充市');
INSERT INTO `t_system_area` VALUES ('511302', ',510000,511300,', '511300', '2016-01-25 14:31:26', '顺庆区', '四川省南充市顺庆区');
INSERT INTO `t_system_area` VALUES ('511303', ',510000,511300,', '511300', '2016-01-25 14:31:26', '高坪区', '四川省南充市高坪区');
INSERT INTO `t_system_area` VALUES ('511304', ',510000,511300,', '511300', '2016-01-25 14:31:26', '嘉陵区', '四川省南充市嘉陵区');
INSERT INTO `t_system_area` VALUES ('511321', ',510000,511300,', '511300', '2016-01-25 14:31:26', '南部县', '四川省南充市南部县');
INSERT INTO `t_system_area` VALUES ('511322', ',510000,511300,', '511300', '2016-01-25 14:31:26', '营山县', '四川省南充市营山县');
INSERT INTO `t_system_area` VALUES ('511323', ',510000,511300,', '511300', '2016-01-25 14:31:26', '蓬安县', '四川省南充市蓬安县');
INSERT INTO `t_system_area` VALUES ('511324', ',510000,511300,', '511300', '2016-01-25 14:31:26', '仪陇县', '四川省南充市仪陇县');
INSERT INTO `t_system_area` VALUES ('511325', ',510000,511300,', '511300', '2016-01-25 14:31:26', '西充县', '四川省南充市西充县');
INSERT INTO `t_system_area` VALUES ('511381', ',510000,511300,', '511300', '2016-01-25 14:31:26', '阆中市', '四川省南充市阆中市');
INSERT INTO `t_system_area` VALUES ('511382', ',510000,511300,', '511300', '2016-01-25 14:31:26', '其它区', '四川省南充市其它区');
INSERT INTO `t_system_area` VALUES ('511400', ',510000,', '510000', '2016-01-25 14:31:26', '眉山市', '四川省眉山市');
INSERT INTO `t_system_area` VALUES ('511402', ',510000,511400,', '511400', '2016-01-25 14:31:26', '东坡区', '四川省眉山市东坡区');
INSERT INTO `t_system_area` VALUES ('511421', ',510000,511400,', '511400', '2016-01-25 14:31:26', '仁寿县', '四川省眉山市仁寿县');
INSERT INTO `t_system_area` VALUES ('511422', ',510000,511400,', '511400', '2016-01-25 14:31:26', '彭山县', '四川省眉山市彭山县');
INSERT INTO `t_system_area` VALUES ('511423', ',510000,511400,', '511400', '2016-01-25 14:31:26', '洪雅县', '四川省眉山市洪雅县');
INSERT INTO `t_system_area` VALUES ('511424', ',510000,511400,', '511400', '2016-01-25 14:31:26', '丹棱县', '四川省眉山市丹棱县');
INSERT INTO `t_system_area` VALUES ('511425', ',510000,511400,', '511400', '2016-01-25 14:31:26', '青神县', '四川省眉山市青神县');
INSERT INTO `t_system_area` VALUES ('511426', ',510000,511400,', '511400', '2016-01-25 14:31:26', '其它区', '四川省眉山市其它区');
INSERT INTO `t_system_area` VALUES ('511500', ',510000,', '510000', '2016-01-25 14:31:26', '宜宾市', '四川省宜宾市');
INSERT INTO `t_system_area` VALUES ('511502', ',510000,511500,', '511500', '2016-01-25 14:31:26', '翠屏区', '四川省宜宾市翠屏区');
INSERT INTO `t_system_area` VALUES ('511521', ',510000,511500,', '511500', '2016-01-25 14:31:26', '宜宾县', '四川省宜宾市宜宾县');
INSERT INTO `t_system_area` VALUES ('511522', ',510000,511500,', '511500', '2016-01-25 14:31:26', '南溪区', '四川省宜宾市南溪区');
INSERT INTO `t_system_area` VALUES ('511523', ',510000,511500,', '511500', '2016-01-25 14:31:26', '江安县', '四川省宜宾市江安县');
INSERT INTO `t_system_area` VALUES ('511524', ',510000,511500,', '511500', '2016-01-25 14:31:26', '长宁县', '四川省宜宾市长宁县');
INSERT INTO `t_system_area` VALUES ('511525', ',510000,511500,', '511500', '2016-01-25 14:31:26', '高县', '四川省宜宾市高县');
INSERT INTO `t_system_area` VALUES ('511526', ',510000,511500,', '511500', '2016-01-25 14:31:27', '珙县', '四川省宜宾市珙县');
INSERT INTO `t_system_area` VALUES ('511527', ',510000,511500,', '511500', '2016-01-25 14:31:27', '筠连县', '四川省宜宾市筠连县');
INSERT INTO `t_system_area` VALUES ('511528', ',510000,511500,', '511500', '2016-01-25 14:31:27', '兴文县', '四川省宜宾市兴文县');
INSERT INTO `t_system_area` VALUES ('511529', ',510000,511500,', '511500', '2016-01-25 14:31:27', '屏山县', '四川省宜宾市屏山县');
INSERT INTO `t_system_area` VALUES ('511530', ',510000,511500,', '511500', '2016-01-25 14:31:27', '其它区', '四川省宜宾市其它区');
INSERT INTO `t_system_area` VALUES ('511600', ',510000,', '510000', '2016-01-25 14:31:27', '广安市', '四川省广安市');
INSERT INTO `t_system_area` VALUES ('511602', ',510000,511600,', '511600', '2016-01-25 14:31:27', '广安区', '四川省广安市广安区');
INSERT INTO `t_system_area` VALUES ('511603', ',510000,511600,', '511600', '2016-01-25 14:31:27', '前锋区', '四川省广安市前锋区');
INSERT INTO `t_system_area` VALUES ('511621', ',510000,511600,', '511600', '2016-01-25 14:31:27', '岳池县', '四川省广安市岳池县');
INSERT INTO `t_system_area` VALUES ('511622', ',510000,511600,', '511600', '2016-01-25 14:31:27', '武胜县', '四川省广安市武胜县');
INSERT INTO `t_system_area` VALUES ('511623', ',510000,511600,', '511600', '2016-01-25 14:31:27', '邻水县', '四川省广安市邻水县');
INSERT INTO `t_system_area` VALUES ('511681', ',510000,511600,', '511600', '2016-01-25 14:31:27', '华蓥市', '四川省广安市华蓥市');
INSERT INTO `t_system_area` VALUES ('511682', ',510000,511600,', '511600', '2016-01-25 14:31:27', '市辖区', '四川省广安市市辖区');
INSERT INTO `t_system_area` VALUES ('511683', ',510000,511600,', '511600', '2016-01-25 14:31:27', '其它区', '四川省广安市其它区');
INSERT INTO `t_system_area` VALUES ('511700', ',510000,', '510000', '2016-01-25 14:31:27', '达州市', '四川省达州市');
INSERT INTO `t_system_area` VALUES ('511702', ',510000,511700,', '511700', '2016-01-25 14:31:27', '通川区', '四川省达州市通川区');
INSERT INTO `t_system_area` VALUES ('511721', ',510000,511700,', '511700', '2016-01-25 14:31:27', '达川区', '四川省达州市达川区');
INSERT INTO `t_system_area` VALUES ('511722', ',510000,511700,', '511700', '2016-01-25 14:31:27', '宣汉县', '四川省达州市宣汉县');
INSERT INTO `t_system_area` VALUES ('511723', ',510000,511700,', '511700', '2016-01-25 14:31:27', '开江县', '四川省达州市开江县');
INSERT INTO `t_system_area` VALUES ('511724', ',510000,511700,', '511700', '2016-01-25 14:31:27', '大竹县', '四川省达州市大竹县');
INSERT INTO `t_system_area` VALUES ('511725', ',510000,511700,', '511700', '2016-01-25 14:31:27', '渠县', '四川省达州市渠县');
INSERT INTO `t_system_area` VALUES ('511781', ',510000,511700,', '511700', '2016-01-25 14:31:27', '万源市', '四川省达州市万源市');
INSERT INTO `t_system_area` VALUES ('511782', ',510000,511700,', '511700', '2016-01-25 14:31:27', '其它区', '四川省达州市其它区');
INSERT INTO `t_system_area` VALUES ('511800', ',510000,', '510000', '2016-01-25 14:31:27', '雅安市', '四川省雅安市');
INSERT INTO `t_system_area` VALUES ('511802', ',510000,511800,', '511800', '2016-01-25 14:31:27', '雨城区', '四川省雅安市雨城区');
INSERT INTO `t_system_area` VALUES ('511821', ',510000,511800,', '511800', '2016-01-25 14:31:27', '名山区', '四川省雅安市名山区');
INSERT INTO `t_system_area` VALUES ('511822', ',510000,511800,', '511800', '2016-01-25 14:31:27', '荥经县', '四川省雅安市荥经县');
INSERT INTO `t_system_area` VALUES ('511823', ',510000,511800,', '511800', '2016-01-25 14:31:27', '汉源县', '四川省雅安市汉源县');
INSERT INTO `t_system_area` VALUES ('511824', ',510000,511800,', '511800', '2016-01-25 14:31:27', '石棉县', '四川省雅安市石棉县');
INSERT INTO `t_system_area` VALUES ('511825', ',510000,511800,', '511800', '2016-01-25 14:31:27', '天全县', '四川省雅安市天全县');
INSERT INTO `t_system_area` VALUES ('511826', ',510000,511800,', '511800', '2016-01-25 14:31:27', '芦山县', '四川省雅安市芦山县');
INSERT INTO `t_system_area` VALUES ('511827', ',510000,511800,', '511800', '2016-01-25 14:31:27', '宝兴县', '四川省雅安市宝兴县');
INSERT INTO `t_system_area` VALUES ('511828', ',510000,511800,', '511800', '2016-01-25 14:31:27', '其它区', '四川省雅安市其它区');
INSERT INTO `t_system_area` VALUES ('511900', ',510000,', '510000', '2016-01-25 14:31:27', '巴中市', '四川省巴中市');
INSERT INTO `t_system_area` VALUES ('511902', ',510000,511900,', '511900', '2016-01-25 14:31:27', '巴州区', '四川省巴中市巴州区');
INSERT INTO `t_system_area` VALUES ('511903', ',510000,511900,', '511900', '2016-01-25 14:31:27', '恩阳区', '四川省巴中市恩阳区');
INSERT INTO `t_system_area` VALUES ('511921', ',510000,511900,', '511900', '2016-01-25 14:31:27', '通江县', '四川省巴中市通江县');
INSERT INTO `t_system_area` VALUES ('511922', ',510000,511900,', '511900', '2016-01-25 14:31:27', '南江县', '四川省巴中市南江县');
INSERT INTO `t_system_area` VALUES ('511923', ',510000,511900,', '511900', '2016-01-25 14:31:27', '平昌县', '四川省巴中市平昌县');
INSERT INTO `t_system_area` VALUES ('511924', ',510000,511900,', '511900', '2016-01-25 14:31:27', '其它区', '四川省巴中市其它区');
INSERT INTO `t_system_area` VALUES ('512000', ',510000,', '510000', '2016-01-25 14:31:27', '资阳市', '四川省资阳市');
INSERT INTO `t_system_area` VALUES ('512002', ',510000,512000,', '512000', '2016-01-25 14:31:27', '雁江区', '四川省资阳市雁江区');
INSERT INTO `t_system_area` VALUES ('512021', ',510000,512000,', '512000', '2016-01-25 14:31:27', '安岳县', '四川省资阳市安岳县');
INSERT INTO `t_system_area` VALUES ('512022', ',510000,512000,', '512000', '2016-01-25 14:31:27', '乐至县', '四川省资阳市乐至县');
INSERT INTO `t_system_area` VALUES ('512081', ',510000,512000,', '512000', '2016-01-25 14:31:27', '简阳市', '四川省资阳市简阳市');
INSERT INTO `t_system_area` VALUES ('512082', ',510000,512000,', '512000', '2016-01-25 14:31:27', '其它区', '四川省资阳市其它区');
INSERT INTO `t_system_area` VALUES ('513200', ',510000,', '510000', '2016-01-25 14:31:27', '阿坝藏族羌族自治州', '四川省阿坝藏族羌族自治州');
INSERT INTO `t_system_area` VALUES ('513221', ',510000,513200,', '513200', '2016-01-25 14:31:27', '汶川县', '四川省阿坝藏族羌族自治州汶川县');
INSERT INTO `t_system_area` VALUES ('513222', ',510000,513200,', '513200', '2016-01-25 14:31:27', '理县', '四川省阿坝藏族羌族自治州理县');
INSERT INTO `t_system_area` VALUES ('513223', ',510000,513200,', '513200', '2016-01-25 14:31:27', '茂县', '四川省阿坝藏族羌族自治州茂县');
INSERT INTO `t_system_area` VALUES ('513224', ',510000,513200,', '513200', '2016-01-25 14:31:27', '松潘县', '四川省阿坝藏族羌族自治州松潘县');
INSERT INTO `t_system_area` VALUES ('513225', ',510000,513200,', '513200', '2016-01-25 14:31:27', '九寨沟县', '四川省阿坝藏族羌族自治州九寨沟县');
INSERT INTO `t_system_area` VALUES ('513226', ',510000,513200,', '513200', '2016-01-25 14:31:27', '金川县', '四川省阿坝藏族羌族自治州金川县');
INSERT INTO `t_system_area` VALUES ('513227', ',510000,513200,', '513200', '2016-01-25 14:31:27', '小金县', '四川省阿坝藏族羌族自治州小金县');
INSERT INTO `t_system_area` VALUES ('513228', ',510000,513200,', '513200', '2016-01-25 14:31:27', '黑水县', '四川省阿坝藏族羌族自治州黑水县');
INSERT INTO `t_system_area` VALUES ('513229', ',510000,513200,', '513200', '2016-01-25 14:31:27', '马尔康县', '四川省阿坝藏族羌族自治州马尔康县');
INSERT INTO `t_system_area` VALUES ('513230', ',510000,513200,', '513200', '2016-01-25 14:31:27', '壤塘县', '四川省阿坝藏族羌族自治州壤塘县');
INSERT INTO `t_system_area` VALUES ('513231', ',510000,513200,', '513200', '2016-01-25 14:31:27', '阿坝县', '四川省阿坝藏族羌族自治州阿坝县');
INSERT INTO `t_system_area` VALUES ('513232', ',510000,513200,', '513200', '2016-01-25 14:31:27', '若尔盖县', '四川省阿坝藏族羌族自治州若尔盖县');
INSERT INTO `t_system_area` VALUES ('513233', ',510000,513200,', '513200', '2016-01-25 14:31:27', '红原县', '四川省阿坝藏族羌族自治州红原县');
INSERT INTO `t_system_area` VALUES ('513234', ',510000,513200,', '513200', '2016-01-25 14:31:27', '其它区', '四川省阿坝藏族羌族自治州其它区');
INSERT INTO `t_system_area` VALUES ('513300', ',510000,', '510000', '2016-01-25 14:31:27', '甘孜藏族自治州', '四川省甘孜藏族自治州');
INSERT INTO `t_system_area` VALUES ('513321', ',510000,513300,', '513300', '2016-01-25 14:31:27', '康定县', '四川省甘孜藏族自治州康定县');
INSERT INTO `t_system_area` VALUES ('513322', ',510000,513300,', '513300', '2016-01-25 14:31:27', '泸定县', '四川省甘孜藏族自治州泸定县');
INSERT INTO `t_system_area` VALUES ('513323', ',510000,513300,', '513300', '2016-01-25 14:31:27', '丹巴县', '四川省甘孜藏族自治州丹巴县');
INSERT INTO `t_system_area` VALUES ('513324', ',510000,513300,', '513300', '2016-01-25 14:31:27', '九龙县', '四川省甘孜藏族自治州九龙县');
INSERT INTO `t_system_area` VALUES ('513325', ',510000,513300,', '513300', '2016-01-25 14:31:27', '雅江县', '四川省甘孜藏族自治州雅江县');
INSERT INTO `t_system_area` VALUES ('513326', ',510000,513300,', '513300', '2016-01-25 14:31:27', '道孚县', '四川省甘孜藏族自治州道孚县');
INSERT INTO `t_system_area` VALUES ('513327', ',510000,513300,', '513300', '2016-01-25 14:31:27', '炉霍县', '四川省甘孜藏族自治州炉霍县');
INSERT INTO `t_system_area` VALUES ('513328', ',510000,513300,', '513300', '2016-01-25 14:31:27', '甘孜县', '四川省甘孜藏族自治州甘孜县');
INSERT INTO `t_system_area` VALUES ('513329', ',510000,513300,', '513300', '2016-01-25 14:31:27', '新龙县', '四川省甘孜藏族自治州新龙县');
INSERT INTO `t_system_area` VALUES ('513330', ',510000,513300,', '513300', '2016-01-25 14:31:27', '德格县', '四川省甘孜藏族自治州德格县');
INSERT INTO `t_system_area` VALUES ('513331', ',510000,513300,', '513300', '2016-01-25 14:31:27', '白玉县', '四川省甘孜藏族自治州白玉县');
INSERT INTO `t_system_area` VALUES ('513332', ',510000,513300,', '513300', '2016-01-25 14:31:27', '石渠县', '四川省甘孜藏族自治州石渠县');
INSERT INTO `t_system_area` VALUES ('513333', ',510000,513300,', '513300', '2016-01-25 14:31:27', '色达县', '四川省甘孜藏族自治州色达县');
INSERT INTO `t_system_area` VALUES ('513334', ',510000,513300,', '513300', '2016-01-25 14:31:27', '理塘县', '四川省甘孜藏族自治州理塘县');
INSERT INTO `t_system_area` VALUES ('513335', ',510000,513300,', '513300', '2016-01-25 14:31:27', '巴塘县', '四川省甘孜藏族自治州巴塘县');
INSERT INTO `t_system_area` VALUES ('513336', ',510000,513300,', '513300', '2016-01-25 14:31:27', '乡城县', '四川省甘孜藏族自治州乡城县');
INSERT INTO `t_system_area` VALUES ('513337', ',510000,513300,', '513300', '2016-01-25 14:31:27', '稻城县', '四川省甘孜藏族自治州稻城县');
INSERT INTO `t_system_area` VALUES ('513338', ',510000,513300,', '513300', '2016-01-25 14:31:27', '得荣县', '四川省甘孜藏族自治州得荣县');
INSERT INTO `t_system_area` VALUES ('513339', ',510000,513300,', '513300', '2016-01-25 14:31:27', '其它区', '四川省甘孜藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('513400', ',510000,', '510000', '2016-01-25 14:31:27', '凉山彝族自治州', '四川省凉山彝族自治州');
INSERT INTO `t_system_area` VALUES ('513401', ',510000,513400,', '513400', '2016-01-25 14:31:27', '西昌市', '四川省凉山彝族自治州西昌市');
INSERT INTO `t_system_area` VALUES ('513422', ',510000,513400,', '513400', '2016-01-25 14:31:27', '木里藏族自治县', '四川省凉山彝族自治州木里藏族自治县');
INSERT INTO `t_system_area` VALUES ('513423', ',510000,513400,', '513400', '2016-01-25 14:31:27', '盐源县', '四川省凉山彝族自治州盐源县');
INSERT INTO `t_system_area` VALUES ('513424', ',510000,513400,', '513400', '2016-01-25 14:31:27', '德昌县', '四川省凉山彝族自治州德昌县');
INSERT INTO `t_system_area` VALUES ('513425', ',510000,513400,', '513400', '2016-01-25 14:31:27', '会理县', '四川省凉山彝族自治州会理县');
INSERT INTO `t_system_area` VALUES ('513426', ',510000,513400,', '513400', '2016-01-25 14:31:27', '会东县', '四川省凉山彝族自治州会东县');
INSERT INTO `t_system_area` VALUES ('513427', ',510000,513400,', '513400', '2016-01-25 14:31:27', '宁南县', '四川省凉山彝族自治州宁南县');
INSERT INTO `t_system_area` VALUES ('513428', ',510000,513400,', '513400', '2016-01-25 14:31:27', '普格县', '四川省凉山彝族自治州普格县');
INSERT INTO `t_system_area` VALUES ('513429', ',510000,513400,', '513400', '2016-01-25 14:31:27', '布拖县', '四川省凉山彝族自治州布拖县');
INSERT INTO `t_system_area` VALUES ('513430', ',510000,513400,', '513400', '2016-01-25 14:31:27', '金阳县', '四川省凉山彝族自治州金阳县');
INSERT INTO `t_system_area` VALUES ('513431', ',510000,513400,', '513400', '2016-01-25 14:31:27', '昭觉县', '四川省凉山彝族自治州昭觉县');
INSERT INTO `t_system_area` VALUES ('513432', ',510000,513400,', '513400', '2016-01-25 14:31:27', '喜德县', '四川省凉山彝族自治州喜德县');
INSERT INTO `t_system_area` VALUES ('513433', ',510000,513400,', '513400', '2016-01-25 14:31:27', '冕宁县', '四川省凉山彝族自治州冕宁县');
INSERT INTO `t_system_area` VALUES ('513434', ',510000,513400,', '513400', '2016-01-25 14:31:27', '越西县', '四川省凉山彝族自治州越西县');
INSERT INTO `t_system_area` VALUES ('513435', ',510000,513400,', '513400', '2016-01-25 14:31:27', '甘洛县', '四川省凉山彝族自治州甘洛县');
INSERT INTO `t_system_area` VALUES ('513436', ',510000,513400,', '513400', '2016-01-25 14:31:27', '美姑县', '四川省凉山彝族自治州美姑县');
INSERT INTO `t_system_area` VALUES ('513437', ',510000,513400,', '513400', '2016-01-25 14:31:27', '雷波县', '四川省凉山彝族自治州雷波县');
INSERT INTO `t_system_area` VALUES ('513438', ',510000,513400,', '513400', '2016-01-25 14:31:27', '其它区', '四川省凉山彝族自治州其它区');
INSERT INTO `t_system_area` VALUES ('520000', ',', null, '2016-01-25 14:31:27', '贵州省', '贵州省');
INSERT INTO `t_system_area` VALUES ('520100', ',520000,', '520000', '2016-01-25 14:31:27', '贵阳市', '贵州省贵阳市');
INSERT INTO `t_system_area` VALUES ('520102', ',520000,520100,', '520100', '2016-01-25 14:31:27', '南明区', '贵州省贵阳市南明区');
INSERT INTO `t_system_area` VALUES ('520103', ',520000,520100,', '520100', '2016-01-25 14:31:27', '云岩区', '贵州省贵阳市云岩区');
INSERT INTO `t_system_area` VALUES ('520111', ',520000,520100,', '520100', '2016-01-25 14:31:27', '花溪区', '贵州省贵阳市花溪区');
INSERT INTO `t_system_area` VALUES ('520112', ',520000,520100,', '520100', '2016-01-25 14:31:27', '乌当区', '贵州省贵阳市乌当区');
INSERT INTO `t_system_area` VALUES ('520113', ',520000,520100,', '520100', '2016-01-25 14:31:27', '白云区', '贵州省贵阳市白云区');
INSERT INTO `t_system_area` VALUES ('520114', ',520000,520100,', '520100', '2016-01-25 14:31:28', '小河区', '贵州省贵阳市小河区');
INSERT INTO `t_system_area` VALUES ('520121', ',520000,520100,', '520100', '2016-01-25 14:31:28', '开阳县', '贵州省贵阳市开阳县');
INSERT INTO `t_system_area` VALUES ('520122', ',520000,520100,', '520100', '2016-01-25 14:31:28', '息烽县', '贵州省贵阳市息烽县');
INSERT INTO `t_system_area` VALUES ('520123', ',520000,520100,', '520100', '2016-01-25 14:31:28', '修文县', '贵州省贵阳市修文县');
INSERT INTO `t_system_area` VALUES ('520151', ',520000,520100,', '520100', '2016-01-25 14:31:28', '观山湖区', '贵州省贵阳市观山湖区');
INSERT INTO `t_system_area` VALUES ('520181', ',520000,520100,', '520100', '2016-01-25 14:31:28', '清镇市', '贵州省贵阳市清镇市');
INSERT INTO `t_system_area` VALUES ('520182', ',520000,520100,', '520100', '2016-01-25 14:31:28', '其它区', '贵州省贵阳市其它区');
INSERT INTO `t_system_area` VALUES ('520200', ',520000,', '520000', '2016-01-25 14:31:28', '六盘水市', '贵州省六盘水市');
INSERT INTO `t_system_area` VALUES ('520201', ',520000,520200,', '520200', '2016-01-25 14:31:28', '钟山区', '贵州省六盘水市钟山区');
INSERT INTO `t_system_area` VALUES ('520203', ',520000,520200,', '520200', '2016-01-25 14:31:28', '六枝特区', '贵州省六盘水市六枝特区');
INSERT INTO `t_system_area` VALUES ('520221', ',520000,520200,', '520200', '2016-01-25 14:31:28', '水城县', '贵州省六盘水市水城县');
INSERT INTO `t_system_area` VALUES ('520222', ',520000,520200,', '520200', '2016-01-25 14:31:28', '盘县', '贵州省六盘水市盘县');
INSERT INTO `t_system_area` VALUES ('520223', ',520000,520200,', '520200', '2016-01-25 14:31:28', '其它区', '贵州省六盘水市其它区');
INSERT INTO `t_system_area` VALUES ('520300', ',520000,', '520000', '2016-01-25 14:31:28', '遵义市', '贵州省遵义市');
INSERT INTO `t_system_area` VALUES ('520302', ',520000,520300,', '520300', '2016-01-25 14:31:28', '红花岗区', '贵州省遵义市红花岗区');
INSERT INTO `t_system_area` VALUES ('520303', ',520000,520300,', '520300', '2016-01-25 14:31:28', '汇川区', '贵州省遵义市汇川区');
INSERT INTO `t_system_area` VALUES ('520321', ',520000,520300,', '520300', '2016-01-25 14:31:28', '遵义县', '贵州省遵义市遵义县');
INSERT INTO `t_system_area` VALUES ('520322', ',520000,520300,', '520300', '2016-01-25 14:31:28', '桐梓县', '贵州省遵义市桐梓县');
INSERT INTO `t_system_area` VALUES ('520323', ',520000,520300,', '520300', '2016-01-25 14:31:28', '绥阳县', '贵州省遵义市绥阳县');
INSERT INTO `t_system_area` VALUES ('520324', ',520000,520300,', '520300', '2016-01-25 14:31:28', '正安县', '贵州省遵义市正安县');
INSERT INTO `t_system_area` VALUES ('520325', ',520000,520300,', '520300', '2016-01-25 14:31:28', '道真仡佬族苗族自治县', '贵州省遵义市道真仡佬族苗族自治县');
INSERT INTO `t_system_area` VALUES ('520326', ',520000,520300,', '520300', '2016-01-25 14:31:28', '务川仡佬族苗族自治县', '贵州省遵义市务川仡佬族苗族自治县');
INSERT INTO `t_system_area` VALUES ('520327', ',520000,520300,', '520300', '2016-01-25 14:31:28', '凤冈县', '贵州省遵义市凤冈县');
INSERT INTO `t_system_area` VALUES ('520328', ',520000,520300,', '520300', '2016-01-25 14:31:28', '湄潭县', '贵州省遵义市湄潭县');
INSERT INTO `t_system_area` VALUES ('520329', ',520000,520300,', '520300', '2016-01-25 14:31:28', '余庆县', '贵州省遵义市余庆县');
INSERT INTO `t_system_area` VALUES ('520330', ',520000,520300,', '520300', '2016-01-25 14:31:28', '习水县', '贵州省遵义市习水县');
INSERT INTO `t_system_area` VALUES ('520381', ',520000,520300,', '520300', '2016-01-25 14:31:28', '赤水市', '贵州省遵义市赤水市');
INSERT INTO `t_system_area` VALUES ('520382', ',520000,520300,', '520300', '2016-01-25 14:31:28', '仁怀市', '贵州省遵义市仁怀市');
INSERT INTO `t_system_area` VALUES ('520383', ',520000,520300,', '520300', '2016-01-25 14:31:28', '其它区', '贵州省遵义市其它区');
INSERT INTO `t_system_area` VALUES ('520400', ',520000,', '520000', '2016-01-25 14:31:28', '安顺市', '贵州省安顺市');
INSERT INTO `t_system_area` VALUES ('520402', ',520000,520400,', '520400', '2016-01-25 14:31:28', '西秀区', '贵州省安顺市西秀区');
INSERT INTO `t_system_area` VALUES ('520421', ',520000,520400,', '520400', '2016-01-25 14:31:28', '平坝县', '贵州省安顺市平坝县');
INSERT INTO `t_system_area` VALUES ('520422', ',520000,520400,', '520400', '2016-01-25 14:31:28', '普定县', '贵州省安顺市普定县');
INSERT INTO `t_system_area` VALUES ('520423', ',520000,520400,', '520400', '2016-01-25 14:31:28', '镇宁布依族苗族自治县', '贵州省安顺市镇宁布依族苗族自治县');
INSERT INTO `t_system_area` VALUES ('520424', ',520000,520400,', '520400', '2016-01-25 14:31:28', '关岭布依族苗族自治县', '贵州省安顺市关岭布依族苗族自治县');
INSERT INTO `t_system_area` VALUES ('520425', ',520000,520400,', '520400', '2016-01-25 14:31:28', '紫云苗族布依族自治县', '贵州省安顺市紫云苗族布依族自治县');
INSERT INTO `t_system_area` VALUES ('520426', ',520000,520400,', '520400', '2016-01-25 14:31:28', '其它区', '贵州省安顺市其它区');
INSERT INTO `t_system_area` VALUES ('522200', ',520000,', '520000', '2016-01-25 14:31:28', '铜仁市', '贵州省铜仁市');
INSERT INTO `t_system_area` VALUES ('522201', ',520000,522200,', '522200', '2016-01-25 14:31:28', '碧江区', '贵州省铜仁市碧江区');
INSERT INTO `t_system_area` VALUES ('522222', ',520000,522200,', '522200', '2016-01-25 14:31:28', '江口县', '贵州省铜仁市江口县');
INSERT INTO `t_system_area` VALUES ('522223', ',520000,522200,', '522200', '2016-01-25 14:31:28', '玉屏侗族自治县', '贵州省铜仁市玉屏侗族自治县');
INSERT INTO `t_system_area` VALUES ('522224', ',520000,522200,', '522200', '2016-01-25 14:31:28', '石阡县', '贵州省铜仁市石阡县');
INSERT INTO `t_system_area` VALUES ('522225', ',520000,522200,', '522200', '2016-01-25 14:31:28', '思南县', '贵州省铜仁市思南县');
INSERT INTO `t_system_area` VALUES ('522226', ',520000,522200,', '522200', '2016-01-25 14:31:28', '印江土家族苗族自治县', '贵州省铜仁市印江土家族苗族自治县');
INSERT INTO `t_system_area` VALUES ('522227', ',520000,522200,', '522200', '2016-01-25 14:31:28', '德江县', '贵州省铜仁市德江县');
INSERT INTO `t_system_area` VALUES ('522228', ',520000,522200,', '522200', '2016-01-25 14:31:28', '沿河土家族自治县', '贵州省铜仁市沿河土家族自治县');
INSERT INTO `t_system_area` VALUES ('522229', ',520000,522200,', '522200', '2016-01-25 14:31:28', '松桃苗族自治县', '贵州省铜仁市松桃苗族自治县');
INSERT INTO `t_system_area` VALUES ('522230', ',520000,522200,', '522200', '2016-01-25 14:31:28', '万山区', '贵州省铜仁市万山区');
INSERT INTO `t_system_area` VALUES ('522231', ',520000,522200,', '522200', '2016-01-25 14:31:28', '其它区', '贵州省铜仁市其它区');
INSERT INTO `t_system_area` VALUES ('522300', ',520000,', '520000', '2016-01-25 14:31:28', '黔西南布依族苗族自治州', '贵州省黔西南布依族苗族自治州');
INSERT INTO `t_system_area` VALUES ('522301', ',520000,522300,', '522300', '2016-01-25 14:31:28', '兴义市', '贵州省黔西南布依族苗族自治州兴义市');
INSERT INTO `t_system_area` VALUES ('522322', ',520000,522300,', '522300', '2016-01-25 14:31:28', '兴仁县', '贵州省黔西南布依族苗族自治州兴仁县');
INSERT INTO `t_system_area` VALUES ('522323', ',520000,522300,', '522300', '2016-01-25 14:31:28', '普安县', '贵州省黔西南布依族苗族自治州普安县');
INSERT INTO `t_system_area` VALUES ('522324', ',520000,522300,', '522300', '2016-01-25 14:31:28', '晴隆县', '贵州省黔西南布依族苗族自治州晴隆县');
INSERT INTO `t_system_area` VALUES ('522325', ',520000,522300,', '522300', '2016-01-25 14:31:28', '贞丰县', '贵州省黔西南布依族苗族自治州贞丰县');
INSERT INTO `t_system_area` VALUES ('522326', ',520000,522300,', '522300', '2016-01-25 14:31:28', '望谟县', '贵州省黔西南布依族苗族自治州望谟县');
INSERT INTO `t_system_area` VALUES ('522327', ',520000,522300,', '522300', '2016-01-25 14:31:28', '册亨县', '贵州省黔西南布依族苗族自治州册亨县');
INSERT INTO `t_system_area` VALUES ('522328', ',520000,522300,', '522300', '2016-01-25 14:31:28', '安龙县', '贵州省黔西南布依族苗族自治州安龙县');
INSERT INTO `t_system_area` VALUES ('522329', ',520000,522300,', '522300', '2016-01-25 14:31:28', '其它区', '贵州省黔西南布依族苗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('522400', ',520000,', '520000', '2016-01-25 14:31:28', '毕节市', '贵州省毕节市');
INSERT INTO `t_system_area` VALUES ('522401', ',520000,522400,', '522400', '2016-01-25 14:31:28', '七星关区', '贵州省毕节市七星关区');
INSERT INTO `t_system_area` VALUES ('522422', ',520000,522400,', '522400', '2016-01-25 14:31:28', '大方县', '贵州省毕节市大方县');
INSERT INTO `t_system_area` VALUES ('522423', ',520000,522400,', '522400', '2016-01-25 14:31:28', '黔西县', '贵州省毕节市黔西县');
INSERT INTO `t_system_area` VALUES ('522424', ',520000,522400,', '522400', '2016-01-25 14:31:28', '金沙县', '贵州省毕节市金沙县');
INSERT INTO `t_system_area` VALUES ('522425', ',520000,522400,', '522400', '2016-01-25 14:31:28', '织金县', '贵州省毕节市织金县');
INSERT INTO `t_system_area` VALUES ('522426', ',520000,522400,', '522400', '2016-01-25 14:31:28', '纳雍县', '贵州省毕节市纳雍县');
INSERT INTO `t_system_area` VALUES ('522427', ',520000,522400,', '522400', '2016-01-25 14:31:28', '威宁彝族回族苗族自治县', '贵州省毕节市威宁彝族回族苗族自治县');
INSERT INTO `t_system_area` VALUES ('522428', ',520000,522400,', '522400', '2016-01-25 14:31:28', '赫章县', '贵州省毕节市赫章县');
INSERT INTO `t_system_area` VALUES ('522429', ',520000,522400,', '522400', '2016-01-25 14:31:28', '其它区', '贵州省毕节市其它区');
INSERT INTO `t_system_area` VALUES ('522600', ',520000,', '520000', '2016-01-25 14:31:28', '黔东南苗族侗族自治州', '贵州省黔东南苗族侗族自治州');
INSERT INTO `t_system_area` VALUES ('522601', ',520000,522600,', '522600', '2016-01-25 14:31:28', '凯里市', '贵州省黔东南苗族侗族自治州凯里市');
INSERT INTO `t_system_area` VALUES ('522622', ',520000,522600,', '522600', '2016-01-25 14:31:28', '黄平县', '贵州省黔东南苗族侗族自治州黄平县');
INSERT INTO `t_system_area` VALUES ('522623', ',520000,522600,', '522600', '2016-01-25 14:31:28', '施秉县', '贵州省黔东南苗族侗族自治州施秉县');
INSERT INTO `t_system_area` VALUES ('522624', ',520000,522600,', '522600', '2016-01-25 14:31:28', '三穗县', '贵州省黔东南苗族侗族自治州三穗县');
INSERT INTO `t_system_area` VALUES ('522625', ',520000,522600,', '522600', '2016-01-25 14:31:28', '镇远县', '贵州省黔东南苗族侗族自治州镇远县');
INSERT INTO `t_system_area` VALUES ('522626', ',520000,522600,', '522600', '2016-01-25 14:31:28', '岑巩县', '贵州省黔东南苗族侗族自治州岑巩县');
INSERT INTO `t_system_area` VALUES ('522627', ',520000,522600,', '522600', '2016-01-25 14:31:28', '天柱县', '贵州省黔东南苗族侗族自治州天柱县');
INSERT INTO `t_system_area` VALUES ('522628', ',520000,522600,', '522600', '2016-01-25 14:31:28', '锦屏县', '贵州省黔东南苗族侗族自治州锦屏县');
INSERT INTO `t_system_area` VALUES ('522629', ',520000,522600,', '522600', '2016-01-25 14:31:28', '剑河县', '贵州省黔东南苗族侗族自治州剑河县');
INSERT INTO `t_system_area` VALUES ('522630', ',520000,522600,', '522600', '2016-01-25 14:31:28', '台江县', '贵州省黔东南苗族侗族自治州台江县');
INSERT INTO `t_system_area` VALUES ('522631', ',520000,522600,', '522600', '2016-01-25 14:31:28', '黎平县', '贵州省黔东南苗族侗族自治州黎平县');
INSERT INTO `t_system_area` VALUES ('522632', ',520000,522600,', '522600', '2016-01-25 14:31:28', '榕江县', '贵州省黔东南苗族侗族自治州榕江县');
INSERT INTO `t_system_area` VALUES ('522633', ',520000,522600,', '522600', '2016-01-25 14:31:28', '从江县', '贵州省黔东南苗族侗族自治州从江县');
INSERT INTO `t_system_area` VALUES ('522634', ',520000,522600,', '522600', '2016-01-25 14:31:28', '雷山县', '贵州省黔东南苗族侗族自治州雷山县');
INSERT INTO `t_system_area` VALUES ('522635', ',520000,522600,', '522600', '2016-01-25 14:31:29', '麻江县', '贵州省黔东南苗族侗族自治州麻江县');
INSERT INTO `t_system_area` VALUES ('522636', ',520000,522600,', '522600', '2016-01-25 14:31:29', '丹寨县', '贵州省黔东南苗族侗族自治州丹寨县');
INSERT INTO `t_system_area` VALUES ('522637', ',520000,522600,', '522600', '2016-01-25 14:31:29', '其它区', '贵州省黔东南苗族侗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('522700', ',520000,', '520000', '2016-01-25 14:31:29', '黔南布依族苗族自治州', '贵州省黔南布依族苗族自治州');
INSERT INTO `t_system_area` VALUES ('522701', ',520000,522700,', '522700', '2016-01-25 14:31:29', '都匀市', '贵州省黔南布依族苗族自治州都匀市');
INSERT INTO `t_system_area` VALUES ('522702', ',520000,522700,', '522700', '2016-01-25 14:31:29', '福泉市', '贵州省黔南布依族苗族自治州福泉市');
INSERT INTO `t_system_area` VALUES ('522722', ',520000,522700,', '522700', '2016-01-25 14:31:29', '荔波县', '贵州省黔南布依族苗族自治州荔波县');
INSERT INTO `t_system_area` VALUES ('522723', ',520000,522700,', '522700', '2016-01-25 14:31:29', '贵定县', '贵州省黔南布依族苗族自治州贵定县');
INSERT INTO `t_system_area` VALUES ('522725', ',520000,522700,', '522700', '2016-01-25 14:31:29', '瓮安县', '贵州省黔南布依族苗族自治州瓮安县');
INSERT INTO `t_system_area` VALUES ('522726', ',520000,522700,', '522700', '2016-01-25 14:31:29', '独山县', '贵州省黔南布依族苗族自治州独山县');
INSERT INTO `t_system_area` VALUES ('522727', ',520000,522700,', '522700', '2016-01-25 14:31:29', '平塘县', '贵州省黔南布依族苗族自治州平塘县');
INSERT INTO `t_system_area` VALUES ('522728', ',520000,522700,', '522700', '2016-01-25 14:31:29', '罗甸县', '贵州省黔南布依族苗族自治州罗甸县');
INSERT INTO `t_system_area` VALUES ('522729', ',520000,522700,', '522700', '2016-01-25 14:31:29', '长顺县', '贵州省黔南布依族苗族自治州长顺县');
INSERT INTO `t_system_area` VALUES ('522730', ',520000,522700,', '522700', '2016-01-25 14:31:29', '龙里县', '贵州省黔南布依族苗族自治州龙里县');
INSERT INTO `t_system_area` VALUES ('522731', ',520000,522700,', '522700', '2016-01-25 14:31:29', '惠水县', '贵州省黔南布依族苗族自治州惠水县');
INSERT INTO `t_system_area` VALUES ('522732', ',520000,522700,', '522700', '2016-01-25 14:31:29', '三都水族自治县', '贵州省黔南布依族苗族自治州三都水族自治县');
INSERT INTO `t_system_area` VALUES ('522733', ',520000,522700,', '522700', '2016-01-25 14:31:29', '其它区', '贵州省黔南布依族苗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('530000', ',', null, '2016-01-25 14:31:29', '云南省', '云南省');
INSERT INTO `t_system_area` VALUES ('530100', ',530000,', '530000', '2016-01-25 14:31:29', '昆明市', '云南省昆明市');
INSERT INTO `t_system_area` VALUES ('530102', ',530000,530100,', '530100', '2016-01-25 14:31:29', '五华区', '云南省昆明市五华区');
INSERT INTO `t_system_area` VALUES ('530103', ',530000,530100,', '530100', '2016-01-25 14:31:29', '盘龙区', '云南省昆明市盘龙区');
INSERT INTO `t_system_area` VALUES ('530111', ',530000,530100,', '530100', '2016-01-25 14:31:29', '官渡区', '云南省昆明市官渡区');
INSERT INTO `t_system_area` VALUES ('530112', ',530000,530100,', '530100', '2016-01-25 14:31:29', '西山区', '云南省昆明市西山区');
INSERT INTO `t_system_area` VALUES ('530113', ',530000,530100,', '530100', '2016-01-25 14:31:29', '东川区', '云南省昆明市东川区');
INSERT INTO `t_system_area` VALUES ('530121', ',530000,530100,', '530100', '2016-01-25 14:31:29', '呈贡区', '云南省昆明市呈贡区');
INSERT INTO `t_system_area` VALUES ('530122', ',530000,530100,', '530100', '2016-01-25 14:31:29', '晋宁县', '云南省昆明市晋宁县');
INSERT INTO `t_system_area` VALUES ('530124', ',530000,530100,', '530100', '2016-01-25 14:31:29', '富民县', '云南省昆明市富民县');
INSERT INTO `t_system_area` VALUES ('530125', ',530000,530100,', '530100', '2016-01-25 14:31:29', '宜良县', '云南省昆明市宜良县');
INSERT INTO `t_system_area` VALUES ('530126', ',530000,530100,', '530100', '2016-01-25 14:31:29', '石林彝族自治县', '云南省昆明市石林彝族自治县');
INSERT INTO `t_system_area` VALUES ('530127', ',530000,530100,', '530100', '2016-01-25 14:31:29', '嵩明县', '云南省昆明市嵩明县');
INSERT INTO `t_system_area` VALUES ('530128', ',530000,530100,', '530100', '2016-01-25 14:31:29', '禄劝彝族苗族自治县', '云南省昆明市禄劝彝族苗族自治县');
INSERT INTO `t_system_area` VALUES ('530129', ',530000,530100,', '530100', '2016-01-25 14:31:29', '寻甸回族彝族自治县', '云南省昆明市寻甸回族彝族自治县');
INSERT INTO `t_system_area` VALUES ('530181', ',530000,530100,', '530100', '2016-01-25 14:31:29', '安宁市', '云南省昆明市安宁市');
INSERT INTO `t_system_area` VALUES ('530182', ',530000,530100,', '530100', '2016-01-25 14:31:29', '其它区', '云南省昆明市其它区');
INSERT INTO `t_system_area` VALUES ('530300', ',530000,', '530000', '2016-01-25 14:31:29', '曲靖市', '云南省曲靖市');
INSERT INTO `t_system_area` VALUES ('530302', ',530000,530300,', '530300', '2016-01-25 14:31:29', '麒麟区', '云南省曲靖市麒麟区');
INSERT INTO `t_system_area` VALUES ('530321', ',530000,530300,', '530300', '2016-01-25 14:31:29', '马龙县', '云南省曲靖市马龙县');
INSERT INTO `t_system_area` VALUES ('530322', ',530000,530300,', '530300', '2016-01-25 14:31:29', '陆良县', '云南省曲靖市陆良县');
INSERT INTO `t_system_area` VALUES ('530323', ',530000,530300,', '530300', '2016-01-25 14:31:29', '师宗县', '云南省曲靖市师宗县');
INSERT INTO `t_system_area` VALUES ('530324', ',530000,530300,', '530300', '2016-01-25 14:31:29', '罗平县', '云南省曲靖市罗平县');
INSERT INTO `t_system_area` VALUES ('530325', ',530000,530300,', '530300', '2016-01-25 14:31:29', '富源县', '云南省曲靖市富源县');
INSERT INTO `t_system_area` VALUES ('530326', ',530000,530300,', '530300', '2016-01-25 14:31:29', '会泽县', '云南省曲靖市会泽县');
INSERT INTO `t_system_area` VALUES ('530328', ',530000,530300,', '530300', '2016-01-25 14:31:29', '沾益县', '云南省曲靖市沾益县');
INSERT INTO `t_system_area` VALUES ('530381', ',530000,530300,', '530300', '2016-01-25 14:31:29', '宣威市', '云南省曲靖市宣威市');
INSERT INTO `t_system_area` VALUES ('530382', ',530000,530300,', '530300', '2016-01-25 14:31:29', '其它区', '云南省曲靖市其它区');
INSERT INTO `t_system_area` VALUES ('530400', ',530000,', '530000', '2016-01-25 14:31:29', '玉溪市', '云南省玉溪市');
INSERT INTO `t_system_area` VALUES ('530402', ',530000,530400,', '530400', '2016-01-25 14:31:29', '红塔区', '云南省玉溪市红塔区');
INSERT INTO `t_system_area` VALUES ('530421', ',530000,530400,', '530400', '2016-01-25 14:31:29', '江川县', '云南省玉溪市江川县');
INSERT INTO `t_system_area` VALUES ('530422', ',530000,530400,', '530400', '2016-01-25 14:31:29', '澄江县', '云南省玉溪市澄江县');
INSERT INTO `t_system_area` VALUES ('530423', ',530000,530400,', '530400', '2016-01-25 14:31:29', '通海县', '云南省玉溪市通海县');
INSERT INTO `t_system_area` VALUES ('530424', ',530000,530400,', '530400', '2016-01-25 14:31:29', '华宁县', '云南省玉溪市华宁县');
INSERT INTO `t_system_area` VALUES ('530425', ',530000,530400,', '530400', '2016-01-25 14:31:29', '易门县', '云南省玉溪市易门县');
INSERT INTO `t_system_area` VALUES ('530426', ',530000,530400,', '530400', '2016-01-25 14:31:29', '峨山彝族自治县', '云南省玉溪市峨山彝族自治县');
INSERT INTO `t_system_area` VALUES ('530427', ',530000,530400,', '530400', '2016-01-25 14:31:29', '新平彝族傣族自治县', '云南省玉溪市新平彝族傣族自治县');
INSERT INTO `t_system_area` VALUES ('530428', ',530000,530400,', '530400', '2016-01-25 14:31:29', '元江哈尼族彝族傣族自治县', '云南省玉溪市元江哈尼族彝族傣族自治县');
INSERT INTO `t_system_area` VALUES ('530429', ',530000,530400,', '530400', '2016-01-25 14:31:29', '其它区', '云南省玉溪市其它区');
INSERT INTO `t_system_area` VALUES ('530500', ',530000,', '530000', '2016-01-25 14:31:29', '保山市', '云南省保山市');
INSERT INTO `t_system_area` VALUES ('530502', ',530000,530500,', '530500', '2016-01-25 14:31:29', '隆阳区', '云南省保山市隆阳区');
INSERT INTO `t_system_area` VALUES ('530521', ',530000,530500,', '530500', '2016-01-25 14:31:29', '施甸县', '云南省保山市施甸县');
INSERT INTO `t_system_area` VALUES ('530522', ',530000,530500,', '530500', '2016-01-25 14:31:29', '腾冲县', '云南省保山市腾冲县');
INSERT INTO `t_system_area` VALUES ('530523', ',530000,530500,', '530500', '2016-01-25 14:31:29', '龙陵县', '云南省保山市龙陵县');
INSERT INTO `t_system_area` VALUES ('530524', ',530000,530500,', '530500', '2016-01-25 14:31:29', '昌宁县', '云南省保山市昌宁县');
INSERT INTO `t_system_area` VALUES ('530525', ',530000,530500,', '530500', '2016-01-25 14:31:29', '其它区', '云南省保山市其它区');
INSERT INTO `t_system_area` VALUES ('530600', ',530000,', '530000', '2016-01-25 14:31:29', '昭通市', '云南省昭通市');
INSERT INTO `t_system_area` VALUES ('530602', ',530000,530600,', '530600', '2016-01-25 14:31:29', '昭阳区', '云南省昭通市昭阳区');
INSERT INTO `t_system_area` VALUES ('530621', ',530000,530600,', '530600', '2016-01-25 14:31:29', '鲁甸县', '云南省昭通市鲁甸县');
INSERT INTO `t_system_area` VALUES ('530622', ',530000,530600,', '530600', '2016-01-25 14:31:29', '巧家县', '云南省昭通市巧家县');
INSERT INTO `t_system_area` VALUES ('530623', ',530000,530600,', '530600', '2016-01-25 14:31:29', '盐津县', '云南省昭通市盐津县');
INSERT INTO `t_system_area` VALUES ('530624', ',530000,530600,', '530600', '2016-01-25 14:31:29', '大关县', '云南省昭通市大关县');
INSERT INTO `t_system_area` VALUES ('530625', ',530000,530600,', '530600', '2016-01-25 14:31:29', '永善县', '云南省昭通市永善县');
INSERT INTO `t_system_area` VALUES ('530626', ',530000,530600,', '530600', '2016-01-25 14:31:29', '绥江县', '云南省昭通市绥江县');
INSERT INTO `t_system_area` VALUES ('530627', ',530000,530600,', '530600', '2016-01-25 14:31:29', '镇雄县', '云南省昭通市镇雄县');
INSERT INTO `t_system_area` VALUES ('530628', ',530000,530600,', '530600', '2016-01-25 14:31:29', '彝良县', '云南省昭通市彝良县');
INSERT INTO `t_system_area` VALUES ('530629', ',530000,530600,', '530600', '2016-01-25 14:31:29', '威信县', '云南省昭通市威信县');
INSERT INTO `t_system_area` VALUES ('530630', ',530000,530600,', '530600', '2016-01-25 14:31:29', '水富县', '云南省昭通市水富县');
INSERT INTO `t_system_area` VALUES ('530631', ',530000,530600,', '530600', '2016-01-25 14:31:29', '其它区', '云南省昭通市其它区');
INSERT INTO `t_system_area` VALUES ('530700', ',530000,', '530000', '2016-01-25 14:31:29', '丽江市', '云南省丽江市');
INSERT INTO `t_system_area` VALUES ('530702', ',530000,530700,', '530700', '2016-01-25 14:31:29', '古城区', '云南省丽江市古城区');
INSERT INTO `t_system_area` VALUES ('530721', ',530000,530700,', '530700', '2016-01-25 14:31:29', '玉龙纳西族自治县', '云南省丽江市玉龙纳西族自治县');
INSERT INTO `t_system_area` VALUES ('530722', ',530000,530700,', '530700', '2016-01-25 14:31:29', '永胜县', '云南省丽江市永胜县');
INSERT INTO `t_system_area` VALUES ('530723', ',530000,530700,', '530700', '2016-01-25 14:31:29', '华坪县', '云南省丽江市华坪县');
INSERT INTO `t_system_area` VALUES ('530724', ',530000,530700,', '530700', '2016-01-25 14:31:29', '宁蒗彝族自治县', '云南省丽江市宁蒗彝族自治县');
INSERT INTO `t_system_area` VALUES ('530725', ',530000,530700,', '530700', '2016-01-25 14:31:29', '其它区', '云南省丽江市其它区');
INSERT INTO `t_system_area` VALUES ('530800', ',530000,', '530000', '2016-01-25 14:31:29', '普洱市', '云南省普洱市');
INSERT INTO `t_system_area` VALUES ('530802', ',530000,530800,', '530800', '2016-01-25 14:31:29', '思茅区', '云南省普洱市思茅区');
INSERT INTO `t_system_area` VALUES ('530821', ',530000,530800,', '530800', '2016-01-25 14:31:29', '宁洱哈尼族彝族自治县', '云南省普洱市宁洱哈尼族彝族自治县');
INSERT INTO `t_system_area` VALUES ('530822', ',530000,530800,', '530800', '2016-01-25 14:31:29', '墨江哈尼族自治县', '云南省普洱市墨江哈尼族自治县');
INSERT INTO `t_system_area` VALUES ('530823', ',530000,530800,', '530800', '2016-01-25 14:31:29', '景东彝族自治县', '云南省普洱市景东彝族自治县');
INSERT INTO `t_system_area` VALUES ('530824', ',530000,530800,', '530800', '2016-01-25 14:31:29', '景谷傣族彝族自治县', '云南省普洱市景谷傣族彝族自治县');
INSERT INTO `t_system_area` VALUES ('530825', ',530000,530800,', '530800', '2016-01-25 14:31:29', '镇沅彝族哈尼族拉祜族自治县', '云南省普洱市镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `t_system_area` VALUES ('530826', ',530000,530800,', '530800', '2016-01-25 14:31:29', '江城哈尼族彝族自治县', '云南省普洱市江城哈尼族彝族自治县');
INSERT INTO `t_system_area` VALUES ('530827', ',530000,530800,', '530800', '2016-01-25 14:31:29', '孟连傣族拉祜族佤族自治县', '云南省普洱市孟连傣族拉祜族佤族自治县');
INSERT INTO `t_system_area` VALUES ('530828', ',530000,530800,', '530800', '2016-01-25 14:31:29', '澜沧拉祜族自治县', '云南省普洱市澜沧拉祜族自治县');
INSERT INTO `t_system_area` VALUES ('530829', ',530000,530800,', '530800', '2016-01-25 14:31:29', '西盟佤族自治县', '云南省普洱市西盟佤族自治县');
INSERT INTO `t_system_area` VALUES ('530830', ',530000,530800,', '530800', '2016-01-25 14:31:29', '其它区', '云南省普洱市其它区');
INSERT INTO `t_system_area` VALUES ('530900', ',530000,', '530000', '2016-01-25 14:31:29', '临沧市', '云南省临沧市');
INSERT INTO `t_system_area` VALUES ('530902', ',530000,530900,', '530900', '2016-01-25 14:31:29', '临翔区', '云南省临沧市临翔区');
INSERT INTO `t_system_area` VALUES ('530921', ',530000,530900,', '530900', '2016-01-25 14:31:29', '凤庆县', '云南省临沧市凤庆县');
INSERT INTO `t_system_area` VALUES ('530922', ',530000,530900,', '530900', '2016-01-25 14:31:29', '云县', '云南省临沧市云县');
INSERT INTO `t_system_area` VALUES ('530923', ',530000,530900,', '530900', '2016-01-25 14:31:29', '永德县', '云南省临沧市永德县');
INSERT INTO `t_system_area` VALUES ('530924', ',530000,530900,', '530900', '2016-01-25 14:31:29', '镇康县', '云南省临沧市镇康县');
INSERT INTO `t_system_area` VALUES ('530925', ',530000,530900,', '530900', '2016-01-25 14:31:29', '双江拉祜族佤族布朗族傣族自治县', '云南省临沧市双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `t_system_area` VALUES ('530926', ',530000,530900,', '530900', '2016-01-25 14:31:29', '耿马傣族佤族自治县', '云南省临沧市耿马傣族佤族自治县');
INSERT INTO `t_system_area` VALUES ('530927', ',530000,530900,', '530900', '2016-01-25 14:31:29', '沧源佤族自治县', '云南省临沧市沧源佤族自治县');
INSERT INTO `t_system_area` VALUES ('530928', ',530000,530900,', '530900', '2016-01-25 14:31:30', '其它区', '云南省临沧市其它区');
INSERT INTO `t_system_area` VALUES ('532300', ',530000,', '530000', '2016-01-25 14:31:30', '楚雄彝族自治州', '云南省楚雄彝族自治州');
INSERT INTO `t_system_area` VALUES ('532301', ',530000,532300,', '532300', '2016-01-25 14:31:30', '楚雄市', '云南省楚雄彝族自治州楚雄市');
INSERT INTO `t_system_area` VALUES ('532322', ',530000,532300,', '532300', '2016-01-25 14:31:30', '双柏县', '云南省楚雄彝族自治州双柏县');
INSERT INTO `t_system_area` VALUES ('532323', ',530000,532300,', '532300', '2016-01-25 14:31:30', '牟定县', '云南省楚雄彝族自治州牟定县');
INSERT INTO `t_system_area` VALUES ('532324', ',530000,532300,', '532300', '2016-01-25 14:31:30', '南华县', '云南省楚雄彝族自治州南华县');
INSERT INTO `t_system_area` VALUES ('532325', ',530000,532300,', '532300', '2016-01-25 14:31:30', '姚安县', '云南省楚雄彝族自治州姚安县');
INSERT INTO `t_system_area` VALUES ('532326', ',530000,532300,', '532300', '2016-01-25 14:31:30', '大姚县', '云南省楚雄彝族自治州大姚县');
INSERT INTO `t_system_area` VALUES ('532327', ',530000,532300,', '532300', '2016-01-25 14:31:30', '永仁县', '云南省楚雄彝族自治州永仁县');
INSERT INTO `t_system_area` VALUES ('532328', ',530000,532300,', '532300', '2016-01-25 14:31:30', '元谋县', '云南省楚雄彝族自治州元谋县');
INSERT INTO `t_system_area` VALUES ('532329', ',530000,532300,', '532300', '2016-01-25 14:31:30', '武定县', '云南省楚雄彝族自治州武定县');
INSERT INTO `t_system_area` VALUES ('532331', ',530000,532300,', '532300', '2016-01-25 14:31:30', '禄丰县', '云南省楚雄彝族自治州禄丰县');
INSERT INTO `t_system_area` VALUES ('532332', ',530000,532300,', '532300', '2016-01-25 14:31:30', '其它区', '云南省楚雄彝族自治州其它区');
INSERT INTO `t_system_area` VALUES ('532500', ',530000,', '530000', '2016-01-25 14:31:30', '红河哈尼族彝族自治州', '云南省红河哈尼族彝族自治州');
INSERT INTO `t_system_area` VALUES ('532501', ',530000,532500,', '532500', '2016-01-25 14:31:30', '个旧市', '云南省红河哈尼族彝族自治州个旧市');
INSERT INTO `t_system_area` VALUES ('532502', ',530000,532500,', '532500', '2016-01-25 14:31:30', '开远市', '云南省红河哈尼族彝族自治州开远市');
INSERT INTO `t_system_area` VALUES ('532522', ',530000,532500,', '532500', '2016-01-25 14:31:30', '蒙自市', '云南省红河哈尼族彝族自治州蒙自市');
INSERT INTO `t_system_area` VALUES ('532523', ',530000,532500,', '532500', '2016-01-25 14:31:30', '屏边苗族自治县', '云南省红河哈尼族彝族自治州屏边苗族自治县');
INSERT INTO `t_system_area` VALUES ('532524', ',530000,532500,', '532500', '2016-01-25 14:31:30', '建水县', '云南省红河哈尼族彝族自治州建水县');
INSERT INTO `t_system_area` VALUES ('532525', ',530000,532500,', '532500', '2016-01-25 14:31:30', '石屏县', '云南省红河哈尼族彝族自治州石屏县');
INSERT INTO `t_system_area` VALUES ('532526', ',530000,532500,', '532500', '2016-01-25 14:31:30', '弥勒市', '云南省红河哈尼族彝族自治州弥勒市');
INSERT INTO `t_system_area` VALUES ('532527', ',530000,532500,', '532500', '2016-01-25 14:31:30', '泸西县', '云南省红河哈尼族彝族自治州泸西县');
INSERT INTO `t_system_area` VALUES ('532528', ',530000,532500,', '532500', '2016-01-25 14:31:30', '元阳县', '云南省红河哈尼族彝族自治州元阳县');
INSERT INTO `t_system_area` VALUES ('532529', ',530000,532500,', '532500', '2016-01-25 14:31:30', '红河县', '云南省红河哈尼族彝族自治州红河县');
INSERT INTO `t_system_area` VALUES ('532530', ',530000,532500,', '532500', '2016-01-25 14:31:30', '金平苗族瑶族傣族自治县', '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县');
INSERT INTO `t_system_area` VALUES ('532531', ',530000,532500,', '532500', '2016-01-25 14:31:30', '绿春县', '云南省红河哈尼族彝族自治州绿春县');
INSERT INTO `t_system_area` VALUES ('532532', ',530000,532500,', '532500', '2016-01-25 14:31:30', '河口瑶族自治县', '云南省红河哈尼族彝族自治州河口瑶族自治县');
INSERT INTO `t_system_area` VALUES ('532533', ',530000,532500,', '532500', '2016-01-25 14:31:30', '其它区', '云南省红河哈尼族彝族自治州其它区');
INSERT INTO `t_system_area` VALUES ('532600', ',530000,', '530000', '2016-01-25 14:31:30', '文山壮族苗族自治州', '云南省文山壮族苗族自治州');
INSERT INTO `t_system_area` VALUES ('532621', ',530000,532600,', '532600', '2016-01-25 14:31:30', '文山市', '云南省文山壮族苗族自治州文山市');
INSERT INTO `t_system_area` VALUES ('532622', ',530000,532600,', '532600', '2016-01-25 14:31:30', '砚山县', '云南省文山壮族苗族自治州砚山县');
INSERT INTO `t_system_area` VALUES ('532623', ',530000,532600,', '532600', '2016-01-25 14:31:30', '西畴县', '云南省文山壮族苗族自治州西畴县');
INSERT INTO `t_system_area` VALUES ('532624', ',530000,532600,', '532600', '2016-01-25 14:31:30', '麻栗坡县', '云南省文山壮族苗族自治州麻栗坡县');
INSERT INTO `t_system_area` VALUES ('532625', ',530000,532600,', '532600', '2016-01-25 14:31:30', '马关县', '云南省文山壮族苗族自治州马关县');
INSERT INTO `t_system_area` VALUES ('532626', ',530000,532600,', '532600', '2016-01-25 14:31:30', '丘北县', '云南省文山壮族苗族自治州丘北县');
INSERT INTO `t_system_area` VALUES ('532627', ',530000,532600,', '532600', '2016-01-25 14:31:30', '广南县', '云南省文山壮族苗族自治州广南县');
INSERT INTO `t_system_area` VALUES ('532628', ',530000,532600,', '532600', '2016-01-25 14:31:30', '富宁县', '云南省文山壮族苗族自治州富宁县');
INSERT INTO `t_system_area` VALUES ('532629', ',530000,532600,', '532600', '2016-01-25 14:31:30', '其它区', '云南省文山壮族苗族自治州其它区');
INSERT INTO `t_system_area` VALUES ('532800', ',530000,', '530000', '2016-01-25 14:31:30', '西双版纳傣族自治州', '云南省西双版纳傣族自治州');
INSERT INTO `t_system_area` VALUES ('532801', ',530000,532800,', '532800', '2016-01-25 14:31:30', '景洪市', '云南省西双版纳傣族自治州景洪市');
INSERT INTO `t_system_area` VALUES ('532822', ',530000,532800,', '532800', '2016-01-25 14:31:30', '勐海县', '云南省西双版纳傣族自治州勐海县');
INSERT INTO `t_system_area` VALUES ('532823', ',530000,532800,', '532800', '2016-01-25 14:31:30', '勐腊县', '云南省西双版纳傣族自治州勐腊县');
INSERT INTO `t_system_area` VALUES ('532824', ',530000,532800,', '532800', '2016-01-25 14:31:30', '其它区', '云南省西双版纳傣族自治州其它区');
INSERT INTO `t_system_area` VALUES ('532900', ',530000,', '530000', '2016-01-25 14:31:30', '大理白族自治州', '云南省大理白族自治州');
INSERT INTO `t_system_area` VALUES ('532901', ',530000,532900,', '532900', '2016-01-25 14:31:30', '大理市', '云南省大理白族自治州大理市');
INSERT INTO `t_system_area` VALUES ('532922', ',530000,532900,', '532900', '2016-01-25 14:31:30', '漾濞彝族自治县', '云南省大理白族自治州漾濞彝族自治县');
INSERT INTO `t_system_area` VALUES ('532923', ',530000,532900,', '532900', '2016-01-25 14:31:30', '祥云县', '云南省大理白族自治州祥云县');
INSERT INTO `t_system_area` VALUES ('532924', ',530000,532900,', '532900', '2016-01-25 14:31:30', '宾川县', '云南省大理白族自治州宾川县');
INSERT INTO `t_system_area` VALUES ('532925', ',530000,532900,', '532900', '2016-01-25 14:31:30', '弥渡县', '云南省大理白族自治州弥渡县');
INSERT INTO `t_system_area` VALUES ('532926', ',530000,532900,', '532900', '2016-01-25 14:31:30', '南涧彝族自治县', '云南省大理白族自治州南涧彝族自治县');
INSERT INTO `t_system_area` VALUES ('532927', ',530000,532900,', '532900', '2016-01-25 14:31:30', '巍山彝族回族自治县', '云南省大理白族自治州巍山彝族回族自治县');
INSERT INTO `t_system_area` VALUES ('532928', ',530000,532900,', '532900', '2016-01-25 14:31:30', '永平县', '云南省大理白族自治州永平县');
INSERT INTO `t_system_area` VALUES ('532929', ',530000,532900,', '532900', '2016-01-25 14:31:30', '云龙县', '云南省大理白族自治州云龙县');
INSERT INTO `t_system_area` VALUES ('532930', ',530000,532900,', '532900', '2016-01-25 14:31:30', '洱源县', '云南省大理白族自治州洱源县');
INSERT INTO `t_system_area` VALUES ('532931', ',530000,532900,', '532900', '2016-01-25 14:31:30', '剑川县', '云南省大理白族自治州剑川县');
INSERT INTO `t_system_area` VALUES ('532932', ',530000,532900,', '532900', '2016-01-25 14:31:30', '鹤庆县', '云南省大理白族自治州鹤庆县');
INSERT INTO `t_system_area` VALUES ('532933', ',530000,532900,', '532900', '2016-01-25 14:31:30', '其它区', '云南省大理白族自治州其它区');
INSERT INTO `t_system_area` VALUES ('533100', ',530000,', '530000', '2016-01-25 14:31:30', '德宏傣族景颇族自治州', '云南省德宏傣族景颇族自治州');
INSERT INTO `t_system_area` VALUES ('533102', ',530000,533100,', '533100', '2016-01-25 14:31:30', '瑞丽市', '云南省德宏傣族景颇族自治州瑞丽市');
INSERT INTO `t_system_area` VALUES ('533103', ',530000,533100,', '533100', '2016-01-25 14:31:30', '芒市', '云南省德宏傣族景颇族自治州芒市');
INSERT INTO `t_system_area` VALUES ('533122', ',530000,533100,', '533100', '2016-01-25 14:31:30', '梁河县', '云南省德宏傣族景颇族自治州梁河县');
INSERT INTO `t_system_area` VALUES ('533123', ',530000,533100,', '533100', '2016-01-25 14:31:30', '盈江县', '云南省德宏傣族景颇族自治州盈江县');
INSERT INTO `t_system_area` VALUES ('533124', ',530000,533100,', '533100', '2016-01-25 14:31:30', '陇川县', '云南省德宏傣族景颇族自治州陇川县');
INSERT INTO `t_system_area` VALUES ('533125', ',530000,533100,', '533100', '2016-01-25 14:31:30', '其它区', '云南省德宏傣族景颇族自治州其它区');
INSERT INTO `t_system_area` VALUES ('533300', ',530000,', '530000', '2016-01-25 14:31:30', '怒江傈僳族自治州', '云南省怒江傈僳族自治州');
INSERT INTO `t_system_area` VALUES ('533321', ',530000,533300,', '533300', '2016-01-25 14:31:30', '泸水县', '云南省怒江傈僳族自治州泸水县');
INSERT INTO `t_system_area` VALUES ('533323', ',530000,533300,', '533300', '2016-01-25 14:31:30', '福贡县', '云南省怒江傈僳族自治州福贡县');
INSERT INTO `t_system_area` VALUES ('533324', ',530000,533300,', '533300', '2016-01-25 14:31:30', '贡山独龙族怒族自治县', '云南省怒江傈僳族自治州贡山独龙族怒族自治县');
INSERT INTO `t_system_area` VALUES ('533325', ',530000,533300,', '533300', '2016-01-25 14:31:30', '兰坪白族普米族自治县', '云南省怒江傈僳族自治州兰坪白族普米族自治县');
INSERT INTO `t_system_area` VALUES ('533326', ',530000,533300,', '533300', '2016-01-25 14:31:30', '其它区', '云南省怒江傈僳族自治州其它区');
INSERT INTO `t_system_area` VALUES ('533400', ',530000,', '530000', '2016-01-25 14:31:30', '迪庆藏族自治州', '云南省迪庆藏族自治州');
INSERT INTO `t_system_area` VALUES ('533421', ',530000,533400,', '533400', '2016-01-25 14:31:30', '香格里拉县', '云南省迪庆藏族自治州香格里拉县');
INSERT INTO `t_system_area` VALUES ('533422', ',530000,533400,', '533400', '2016-01-25 14:31:30', '德钦县', '云南省迪庆藏族自治州德钦县');
INSERT INTO `t_system_area` VALUES ('533423', ',530000,533400,', '533400', '2016-01-25 14:31:30', '维西傈僳族自治县', '云南省迪庆藏族自治州维西傈僳族自治县');
INSERT INTO `t_system_area` VALUES ('533424', ',530000,533400,', '533400', '2016-01-25 14:31:30', '其它区', '云南省迪庆藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('540000', ',', null, '2016-01-25 14:31:30', '西藏', '西藏');
INSERT INTO `t_system_area` VALUES ('540100', ',540000,', '540000', '2016-01-25 14:31:30', '拉萨市', '西藏拉萨市');
INSERT INTO `t_system_area` VALUES ('540102', ',540000,540100,', '540100', '2016-01-25 14:31:30', '城关区', '西藏拉萨市城关区');
INSERT INTO `t_system_area` VALUES ('540121', ',540000,540100,', '540100', '2016-01-25 14:31:30', '林周县', '西藏拉萨市林周县');
INSERT INTO `t_system_area` VALUES ('540122', ',540000,540100,', '540100', '2016-01-25 14:31:30', '当雄县', '西藏拉萨市当雄县');
INSERT INTO `t_system_area` VALUES ('540123', ',540000,540100,', '540100', '2016-01-25 14:31:30', '尼木县', '西藏拉萨市尼木县');
INSERT INTO `t_system_area` VALUES ('540124', ',540000,540100,', '540100', '2016-01-25 14:31:30', '曲水县', '西藏拉萨市曲水县');
INSERT INTO `t_system_area` VALUES ('540125', ',540000,540100,', '540100', '2016-01-25 14:31:30', '堆龙德庆县', '西藏拉萨市堆龙德庆县');
INSERT INTO `t_system_area` VALUES ('540126', ',540000,540100,', '540100', '2016-01-25 14:31:30', '达孜县', '西藏拉萨市达孜县');
INSERT INTO `t_system_area` VALUES ('540127', ',540000,540100,', '540100', '2016-01-25 14:31:30', '墨竹工卡县', '西藏拉萨市墨竹工卡县');
INSERT INTO `t_system_area` VALUES ('540128', ',540000,540100,', '540100', '2016-01-25 14:31:30', '其它区', '西藏拉萨市其它区');
INSERT INTO `t_system_area` VALUES ('542100', ',540000,', '540000', '2016-01-25 14:31:30', '昌都地区', '西藏昌都地区');
INSERT INTO `t_system_area` VALUES ('542121', ',540000,542100,', '542100', '2016-01-25 14:31:30', '昌都县', '西藏昌都地区昌都县');
INSERT INTO `t_system_area` VALUES ('542122', ',540000,542100,', '542100', '2016-01-25 14:31:30', '江达县', '西藏昌都地区江达县');
INSERT INTO `t_system_area` VALUES ('542123', ',540000,542100,', '542100', '2016-01-25 14:31:30', '贡觉县', '西藏昌都地区贡觉县');
INSERT INTO `t_system_area` VALUES ('542124', ',540000,542100,', '542100', '2016-01-25 14:31:30', '类乌齐县', '西藏昌都地区类乌齐县');
INSERT INTO `t_system_area` VALUES ('542125', ',540000,542100,', '542100', '2016-01-25 14:31:30', '丁青县', '西藏昌都地区丁青县');
INSERT INTO `t_system_area` VALUES ('542126', ',540000,542100,', '542100', '2016-01-25 14:31:30', '察雅县', '西藏昌都地区察雅县');
INSERT INTO `t_system_area` VALUES ('542127', ',540000,542100,', '542100', '2016-01-25 14:31:30', '八宿县', '西藏昌都地区八宿县');
INSERT INTO `t_system_area` VALUES ('542128', ',540000,542100,', '542100', '2016-01-25 14:31:30', '左贡县', '西藏昌都地区左贡县');
INSERT INTO `t_system_area` VALUES ('542129', ',540000,542100,', '542100', '2016-01-25 14:31:30', '芒康县', '西藏昌都地区芒康县');
INSERT INTO `t_system_area` VALUES ('542132', ',540000,542100,', '542100', '2016-01-25 14:31:30', '洛隆县', '西藏昌都地区洛隆县');
INSERT INTO `t_system_area` VALUES ('542133', ',540000,542100,', '542100', '2016-01-25 14:31:30', '边坝县', '西藏昌都地区边坝县');
INSERT INTO `t_system_area` VALUES ('542134', ',540000,542100,', '542100', '2016-01-25 14:31:30', '其它区', '西藏昌都地区其它区');
INSERT INTO `t_system_area` VALUES ('542200', ',540000,', '540000', '2016-01-25 14:31:30', '山南地区', '西藏山南地区');
INSERT INTO `t_system_area` VALUES ('542221', ',540000,542200,', '542200', '2016-01-25 14:31:30', '乃东县', '西藏山南地区乃东县');
INSERT INTO `t_system_area` VALUES ('542222', ',540000,542200,', '542200', '2016-01-25 14:31:30', '扎囊县', '西藏山南地区扎囊县');
INSERT INTO `t_system_area` VALUES ('542223', ',540000,542200,', '542200', '2016-01-25 14:31:30', '贡嘎县', '西藏山南地区贡嘎县');
INSERT INTO `t_system_area` VALUES ('542224', ',540000,542200,', '542200', '2016-01-25 14:31:30', '桑日县', '西藏山南地区桑日县');
INSERT INTO `t_system_area` VALUES ('542225', ',540000,542200,', '542200', '2016-01-25 14:31:30', '琼结县', '西藏山南地区琼结县');
INSERT INTO `t_system_area` VALUES ('542226', ',540000,542200,', '542200', '2016-01-25 14:31:30', '曲松县', '西藏山南地区曲松县');
INSERT INTO `t_system_area` VALUES ('542227', ',540000,542200,', '542200', '2016-01-25 14:31:30', '措美县', '西藏山南地区措美县');
INSERT INTO `t_system_area` VALUES ('542228', ',540000,542200,', '542200', '2016-01-25 14:31:30', '洛扎县', '西藏山南地区洛扎县');
INSERT INTO `t_system_area` VALUES ('542229', ',540000,542200,', '542200', '2016-01-25 14:31:30', '加查县', '西藏山南地区加查县');
INSERT INTO `t_system_area` VALUES ('542231', ',540000,542200,', '542200', '2016-01-25 14:31:31', '隆子县', '西藏山南地区隆子县');
INSERT INTO `t_system_area` VALUES ('542232', ',540000,542200,', '542200', '2016-01-25 14:31:31', '错那县', '西藏山南地区错那县');
INSERT INTO `t_system_area` VALUES ('542233', ',540000,542200,', '542200', '2016-01-25 14:31:31', '浪卡子县', '西藏山南地区浪卡子县');
INSERT INTO `t_system_area` VALUES ('542234', ',540000,542200,', '542200', '2016-01-25 14:31:31', '其它区', '西藏山南地区其它区');
INSERT INTO `t_system_area` VALUES ('542300', ',540000,', '540000', '2016-01-25 14:31:31', '日喀则地区', '西藏日喀则地区');
INSERT INTO `t_system_area` VALUES ('542301', ',540000,542300,', '542300', '2016-01-25 14:31:31', '日喀则市', '西藏日喀则地区日喀则市');
INSERT INTO `t_system_area` VALUES ('542322', ',540000,542300,', '542300', '2016-01-25 14:31:31', '南木林县', '西藏日喀则地区南木林县');
INSERT INTO `t_system_area` VALUES ('542323', ',540000,542300,', '542300', '2016-01-25 14:31:31', '江孜县', '西藏日喀则地区江孜县');
INSERT INTO `t_system_area` VALUES ('542324', ',540000,542300,', '542300', '2016-01-25 14:31:31', '定日县', '西藏日喀则地区定日县');
INSERT INTO `t_system_area` VALUES ('542325', ',540000,542300,', '542300', '2016-01-25 14:31:31', '萨迦县', '西藏日喀则地区萨迦县');
INSERT INTO `t_system_area` VALUES ('542326', ',540000,542300,', '542300', '2016-01-25 14:31:31', '拉孜县', '西藏日喀则地区拉孜县');
INSERT INTO `t_system_area` VALUES ('542327', ',540000,542300,', '542300', '2016-01-25 14:31:31', '昂仁县', '西藏日喀则地区昂仁县');
INSERT INTO `t_system_area` VALUES ('542328', ',540000,542300,', '542300', '2016-01-25 14:31:31', '谢通门县', '西藏日喀则地区谢通门县');
INSERT INTO `t_system_area` VALUES ('542329', ',540000,542300,', '542300', '2016-01-25 14:31:31', '白朗县', '西藏日喀则地区白朗县');
INSERT INTO `t_system_area` VALUES ('542330', ',540000,542300,', '542300', '2016-01-25 14:31:31', '仁布县', '西藏日喀则地区仁布县');
INSERT INTO `t_system_area` VALUES ('542331', ',540000,542300,', '542300', '2016-01-25 14:31:31', '康马县', '西藏日喀则地区康马县');
INSERT INTO `t_system_area` VALUES ('542332', ',540000,542300,', '542300', '2016-01-25 14:31:31', '定结县', '西藏日喀则地区定结县');
INSERT INTO `t_system_area` VALUES ('542333', ',540000,542300,', '542300', '2016-01-25 14:31:31', '仲巴县', '西藏日喀则地区仲巴县');
INSERT INTO `t_system_area` VALUES ('542334', ',540000,542300,', '542300', '2016-01-25 14:31:31', '亚东县', '西藏日喀则地区亚东县');
INSERT INTO `t_system_area` VALUES ('542335', ',540000,542300,', '542300', '2016-01-25 14:31:31', '吉隆县', '西藏日喀则地区吉隆县');
INSERT INTO `t_system_area` VALUES ('542336', ',540000,542300,', '542300', '2016-01-25 14:31:31', '聂拉木县', '西藏日喀则地区聂拉木县');
INSERT INTO `t_system_area` VALUES ('542337', ',540000,542300,', '542300', '2016-01-25 14:31:31', '萨嘎县', '西藏日喀则地区萨嘎县');
INSERT INTO `t_system_area` VALUES ('542338', ',540000,542300,', '542300', '2016-01-25 14:31:31', '岗巴县', '西藏日喀则地区岗巴县');
INSERT INTO `t_system_area` VALUES ('542339', ',540000,542300,', '542300', '2016-01-25 14:31:31', '其它区', '西藏日喀则地区其它区');
INSERT INTO `t_system_area` VALUES ('542400', ',540000,', '540000', '2016-01-25 14:31:31', '那曲地区', '西藏那曲地区');
INSERT INTO `t_system_area` VALUES ('542421', ',540000,542400,', '542400', '2016-01-25 14:31:31', '那曲县', '西藏那曲地区那曲县');
INSERT INTO `t_system_area` VALUES ('542422', ',540000,542400,', '542400', '2016-01-25 14:31:31', '嘉黎县', '西藏那曲地区嘉黎县');
INSERT INTO `t_system_area` VALUES ('542423', ',540000,542400,', '542400', '2016-01-25 14:31:31', '比如县', '西藏那曲地区比如县');
INSERT INTO `t_system_area` VALUES ('542424', ',540000,542400,', '542400', '2016-01-25 14:31:31', '聂荣县', '西藏那曲地区聂荣县');
INSERT INTO `t_system_area` VALUES ('542425', ',540000,542400,', '542400', '2016-01-25 14:31:31', '安多县', '西藏那曲地区安多县');
INSERT INTO `t_system_area` VALUES ('542426', ',540000,542400,', '542400', '2016-01-25 14:31:31', '申扎县', '西藏那曲地区申扎县');
INSERT INTO `t_system_area` VALUES ('542427', ',540000,542400,', '542400', '2016-01-25 14:31:31', '索县', '西藏那曲地区索县');
INSERT INTO `t_system_area` VALUES ('542428', ',540000,542400,', '542400', '2016-01-25 14:31:31', '班戈县', '西藏那曲地区班戈县');
INSERT INTO `t_system_area` VALUES ('542429', ',540000,542400,', '542400', '2016-01-25 14:31:31', '巴青县', '西藏那曲地区巴青县');
INSERT INTO `t_system_area` VALUES ('542430', ',540000,542400,', '542400', '2016-01-25 14:31:31', '尼玛县', '西藏那曲地区尼玛县');
INSERT INTO `t_system_area` VALUES ('542431', ',540000,542400,', '542400', '2016-01-25 14:31:31', '其它区', '西藏那曲地区其它区');
INSERT INTO `t_system_area` VALUES ('542432', ',540000,542400,', '542400', '2016-01-25 14:31:31', '双湖县', '西藏那曲地区双湖县');
INSERT INTO `t_system_area` VALUES ('542500', ',540000,', '540000', '2016-01-25 14:31:31', '阿里地区', '西藏阿里地区');
INSERT INTO `t_system_area` VALUES ('542521', ',540000,542500,', '542500', '2016-01-25 14:31:31', '普兰县', '西藏阿里地区普兰县');
INSERT INTO `t_system_area` VALUES ('542522', ',540000,542500,', '542500', '2016-01-25 14:31:31', '札达县', '西藏阿里地区札达县');
INSERT INTO `t_system_area` VALUES ('542523', ',540000,542500,', '542500', '2016-01-25 14:31:31', '噶尔县', '西藏阿里地区噶尔县');
INSERT INTO `t_system_area` VALUES ('542524', ',540000,542500,', '542500', '2016-01-25 14:31:31', '日土县', '西藏阿里地区日土县');
INSERT INTO `t_system_area` VALUES ('542525', ',540000,542500,', '542500', '2016-01-25 14:31:31', '革吉县', '西藏阿里地区革吉县');
INSERT INTO `t_system_area` VALUES ('542526', ',540000,542500,', '542500', '2016-01-25 14:31:31', '改则县', '西藏阿里地区改则县');
INSERT INTO `t_system_area` VALUES ('542527', ',540000,542500,', '542500', '2016-01-25 14:31:31', '措勤县', '西藏阿里地区措勤县');
INSERT INTO `t_system_area` VALUES ('542528', ',540000,542500,', '542500', '2016-01-25 14:31:31', '其它区', '西藏阿里地区其它区');
INSERT INTO `t_system_area` VALUES ('542600', ',540000,', '540000', '2016-01-25 14:31:31', '林芝地区', '西藏林芝地区');
INSERT INTO `t_system_area` VALUES ('542621', ',540000,542600,', '542600', '2016-01-25 14:31:31', '林芝县', '西藏林芝地区林芝县');
INSERT INTO `t_system_area` VALUES ('542622', ',540000,542600,', '542600', '2016-01-25 14:31:31', '工布江达县', '西藏林芝地区工布江达县');
INSERT INTO `t_system_area` VALUES ('542623', ',540000,542600,', '542600', '2016-01-25 14:31:31', '米林县', '西藏林芝地区米林县');
INSERT INTO `t_system_area` VALUES ('542624', ',540000,542600,', '542600', '2016-01-25 14:31:31', '墨脱县', '西藏林芝地区墨脱县');
INSERT INTO `t_system_area` VALUES ('542625', ',540000,542600,', '542600', '2016-01-25 14:31:31', '波密县', '西藏林芝地区波密县');
INSERT INTO `t_system_area` VALUES ('542626', ',540000,542600,', '542600', '2016-01-25 14:31:31', '察隅县', '西藏林芝地区察隅县');
INSERT INTO `t_system_area` VALUES ('542627', ',540000,542600,', '542600', '2016-01-25 14:31:31', '朗县', '西藏林芝地区朗县');
INSERT INTO `t_system_area` VALUES ('542628', ',540000,542600,', '542600', '2016-01-25 14:31:31', '其它区', '西藏林芝地区其它区');
INSERT INTO `t_system_area` VALUES ('610000', ',', null, '2016-01-25 14:31:31', '陕西省', '陕西省');
INSERT INTO `t_system_area` VALUES ('610100', ',610000,', '610000', '2016-01-25 14:31:31', '西安市', '陕西省西安市');
INSERT INTO `t_system_area` VALUES ('610102', ',610000,610100,', '610100', '2016-01-25 14:31:31', '新城区', '陕西省西安市新城区');
INSERT INTO `t_system_area` VALUES ('610103', ',610000,610100,', '610100', '2016-01-25 14:31:31', '碑林区', '陕西省西安市碑林区');
INSERT INTO `t_system_area` VALUES ('610104', ',610000,610100,', '610100', '2016-01-25 14:31:31', '莲湖区', '陕西省西安市莲湖区');
INSERT INTO `t_system_area` VALUES ('610111', ',610000,610100,', '610100', '2016-01-25 14:31:31', '灞桥区', '陕西省西安市灞桥区');
INSERT INTO `t_system_area` VALUES ('610112', ',610000,610100,', '610100', '2016-01-25 14:31:31', '未央区', '陕西省西安市未央区');
INSERT INTO `t_system_area` VALUES ('610113', ',610000,610100,', '610100', '2016-01-25 14:31:31', '雁塔区', '陕西省西安市雁塔区');
INSERT INTO `t_system_area` VALUES ('610114', ',610000,610100,', '610100', '2016-01-25 14:31:31', '阎良区', '陕西省西安市阎良区');
INSERT INTO `t_system_area` VALUES ('610115', ',610000,610100,', '610100', '2016-01-25 14:31:31', '临潼区', '陕西省西安市临潼区');
INSERT INTO `t_system_area` VALUES ('610116', ',610000,610100,', '610100', '2016-01-25 14:31:31', '长安区', '陕西省西安市长安区');
INSERT INTO `t_system_area` VALUES ('610122', ',610000,610100,', '610100', '2016-01-25 14:31:31', '蓝田县', '陕西省西安市蓝田县');
INSERT INTO `t_system_area` VALUES ('610124', ',610000,610100,', '610100', '2016-01-25 14:31:31', '周至县', '陕西省西安市周至县');
INSERT INTO `t_system_area` VALUES ('610125', ',610000,610100,', '610100', '2016-01-25 14:31:31', '户县', '陕西省西安市户县');
INSERT INTO `t_system_area` VALUES ('610126', ',610000,610100,', '610100', '2016-01-25 14:31:31', '高陵县', '陕西省西安市高陵县');
INSERT INTO `t_system_area` VALUES ('610127', ',610000,610100,', '610100', '2016-01-25 14:31:31', '其它区', '陕西省西安市其它区');
INSERT INTO `t_system_area` VALUES ('610200', ',610000,', '610000', '2016-01-25 14:31:31', '铜川市', '陕西省铜川市');
INSERT INTO `t_system_area` VALUES ('610202', ',610000,610200,', '610200', '2016-01-25 14:31:31', '王益区', '陕西省铜川市王益区');
INSERT INTO `t_system_area` VALUES ('610203', ',610000,610200,', '610200', '2016-01-25 14:31:31', '印台区', '陕西省铜川市印台区');
INSERT INTO `t_system_area` VALUES ('610204', ',610000,610200,', '610200', '2016-01-25 14:31:31', '耀州区', '陕西省铜川市耀州区');
INSERT INTO `t_system_area` VALUES ('610222', ',610000,610200,', '610200', '2016-01-25 14:31:31', '宜君县', '陕西省铜川市宜君县');
INSERT INTO `t_system_area` VALUES ('610223', ',610000,610200,', '610200', '2016-01-25 14:31:31', '其它区', '陕西省铜川市其它区');
INSERT INTO `t_system_area` VALUES ('610300', ',610000,', '610000', '2016-01-25 14:31:31', '宝鸡市', '陕西省宝鸡市');
INSERT INTO `t_system_area` VALUES ('610302', ',610000,610300,', '610300', '2016-01-25 14:31:31', '渭滨区', '陕西省宝鸡市渭滨区');
INSERT INTO `t_system_area` VALUES ('610303', ',610000,610300,', '610300', '2016-01-25 14:31:31', '金台区', '陕西省宝鸡市金台区');
INSERT INTO `t_system_area` VALUES ('610304', ',610000,610300,', '610300', '2016-01-25 14:31:31', '陈仓区', '陕西省宝鸡市陈仓区');
INSERT INTO `t_system_area` VALUES ('610322', ',610000,610300,', '610300', '2016-01-25 14:31:31', '凤翔县', '陕西省宝鸡市凤翔县');
INSERT INTO `t_system_area` VALUES ('610323', ',610000,610300,', '610300', '2016-01-25 14:31:31', '岐山县', '陕西省宝鸡市岐山县');
INSERT INTO `t_system_area` VALUES ('610324', ',610000,610300,', '610300', '2016-01-25 14:31:31', '扶风县', '陕西省宝鸡市扶风县');
INSERT INTO `t_system_area` VALUES ('610326', ',610000,610300,', '610300', '2016-01-25 14:31:31', '眉县', '陕西省宝鸡市眉县');
INSERT INTO `t_system_area` VALUES ('610327', ',610000,610300,', '610300', '2016-01-25 14:31:31', '陇县', '陕西省宝鸡市陇县');
INSERT INTO `t_system_area` VALUES ('610328', ',610000,610300,', '610300', '2016-01-25 14:31:31', '千阳县', '陕西省宝鸡市千阳县');
INSERT INTO `t_system_area` VALUES ('610329', ',610000,610300,', '610300', '2016-01-25 14:31:31', '麟游县', '陕西省宝鸡市麟游县');
INSERT INTO `t_system_area` VALUES ('610330', ',610000,610300,', '610300', '2016-01-25 14:31:31', '凤县', '陕西省宝鸡市凤县');
INSERT INTO `t_system_area` VALUES ('610331', ',610000,610300,', '610300', '2016-01-25 14:31:31', '太白县', '陕西省宝鸡市太白县');
INSERT INTO `t_system_area` VALUES ('610332', ',610000,610300,', '610300', '2016-01-25 14:31:31', '其它区', '陕西省宝鸡市其它区');
INSERT INTO `t_system_area` VALUES ('610400', ',610000,', '610000', '2016-01-25 14:31:31', '咸阳市', '陕西省咸阳市');
INSERT INTO `t_system_area` VALUES ('610402', ',610000,610400,', '610400', '2016-01-25 14:31:31', '秦都区', '陕西省咸阳市秦都区');
INSERT INTO `t_system_area` VALUES ('610403', ',610000,610400,', '610400', '2016-01-25 14:31:31', '杨陵区', '陕西省咸阳市杨陵区');
INSERT INTO `t_system_area` VALUES ('610404', ',610000,610400,', '610400', '2016-01-25 14:31:31', '渭城区', '陕西省咸阳市渭城区');
INSERT INTO `t_system_area` VALUES ('610422', ',610000,610400,', '610400', '2016-01-25 14:31:31', '三原县', '陕西省咸阳市三原县');
INSERT INTO `t_system_area` VALUES ('610423', ',610000,610400,', '610400', '2016-01-25 14:31:31', '泾阳县', '陕西省咸阳市泾阳县');
INSERT INTO `t_system_area` VALUES ('610424', ',610000,610400,', '610400', '2016-01-25 14:31:31', '乾县', '陕西省咸阳市乾县');
INSERT INTO `t_system_area` VALUES ('610425', ',610000,610400,', '610400', '2016-01-25 14:31:31', '礼泉县', '陕西省咸阳市礼泉县');
INSERT INTO `t_system_area` VALUES ('610426', ',610000,610400,', '610400', '2016-01-25 14:31:31', '永寿县', '陕西省咸阳市永寿县');
INSERT INTO `t_system_area` VALUES ('610427', ',610000,610400,', '610400', '2016-01-25 14:31:32', '彬县', '陕西省咸阳市彬县');
INSERT INTO `t_system_area` VALUES ('610428', ',610000,610400,', '610400', '2016-01-25 14:31:32', '长武县', '陕西省咸阳市长武县');
INSERT INTO `t_system_area` VALUES ('610429', ',610000,610400,', '610400', '2016-01-25 14:31:32', '旬邑县', '陕西省咸阳市旬邑县');
INSERT INTO `t_system_area` VALUES ('610430', ',610000,610400,', '610400', '2016-01-25 14:31:32', '淳化县', '陕西省咸阳市淳化县');
INSERT INTO `t_system_area` VALUES ('610431', ',610000,610400,', '610400', '2016-01-25 14:31:32', '武功县', '陕西省咸阳市武功县');
INSERT INTO `t_system_area` VALUES ('610481', ',610000,610400,', '610400', '2016-01-25 14:31:32', '兴平市', '陕西省咸阳市兴平市');
INSERT INTO `t_system_area` VALUES ('610482', ',610000,610400,', '610400', '2016-01-25 14:31:32', '其它区', '陕西省咸阳市其它区');
INSERT INTO `t_system_area` VALUES ('610500', ',610000,', '610000', '2016-01-25 14:31:32', '渭南市', '陕西省渭南市');
INSERT INTO `t_system_area` VALUES ('610502', ',610000,610500,', '610500', '2016-01-25 14:31:32', '临渭区', '陕西省渭南市临渭区');
INSERT INTO `t_system_area` VALUES ('610521', ',610000,610500,', '610500', '2016-01-25 14:31:32', '华县', '陕西省渭南市华县');
INSERT INTO `t_system_area` VALUES ('610522', ',610000,610500,', '610500', '2016-01-25 14:31:32', '潼关县', '陕西省渭南市潼关县');
INSERT INTO `t_system_area` VALUES ('610523', ',610000,610500,', '610500', '2016-01-25 14:31:32', '大荔县', '陕西省渭南市大荔县');
INSERT INTO `t_system_area` VALUES ('610524', ',610000,610500,', '610500', '2016-01-25 14:31:32', '合阳县', '陕西省渭南市合阳县');
INSERT INTO `t_system_area` VALUES ('610525', ',610000,610500,', '610500', '2016-01-25 14:31:32', '澄城县', '陕西省渭南市澄城县');
INSERT INTO `t_system_area` VALUES ('610526', ',610000,610500,', '610500', '2016-01-25 14:31:32', '蒲城县', '陕西省渭南市蒲城县');
INSERT INTO `t_system_area` VALUES ('610527', ',610000,610500,', '610500', '2016-01-25 14:31:32', '白水县', '陕西省渭南市白水县');
INSERT INTO `t_system_area` VALUES ('610528', ',610000,610500,', '610500', '2016-01-25 14:31:32', '富平县', '陕西省渭南市富平县');
INSERT INTO `t_system_area` VALUES ('610581', ',610000,610500,', '610500', '2016-01-25 14:31:32', '韩城市', '陕西省渭南市韩城市');
INSERT INTO `t_system_area` VALUES ('610582', ',610000,610500,', '610500', '2016-01-25 14:31:32', '华阴市', '陕西省渭南市华阴市');
INSERT INTO `t_system_area` VALUES ('610583', ',610000,610500,', '610500', '2016-01-25 14:31:32', '其它区', '陕西省渭南市其它区');
INSERT INTO `t_system_area` VALUES ('610600', ',610000,', '610000', '2016-01-25 14:31:32', '延安市', '陕西省延安市');
INSERT INTO `t_system_area` VALUES ('610602', ',610000,610600,', '610600', '2016-01-25 14:31:32', '宝塔区', '陕西省延安市宝塔区');
INSERT INTO `t_system_area` VALUES ('610621', ',610000,610600,', '610600', '2016-01-25 14:31:32', '延长县', '陕西省延安市延长县');
INSERT INTO `t_system_area` VALUES ('610622', ',610000,610600,', '610600', '2016-01-25 14:31:32', '延川县', '陕西省延安市延川县');
INSERT INTO `t_system_area` VALUES ('610623', ',610000,610600,', '610600', '2016-01-25 14:31:32', '子长县', '陕西省延安市子长县');
INSERT INTO `t_system_area` VALUES ('610624', ',610000,610600,', '610600', '2016-01-25 14:31:32', '安塞县', '陕西省延安市安塞县');
INSERT INTO `t_system_area` VALUES ('610625', ',610000,610600,', '610600', '2016-01-25 14:31:32', '志丹县', '陕西省延安市志丹县');
INSERT INTO `t_system_area` VALUES ('610626', ',610000,610600,', '610600', '2016-01-25 14:31:32', '吴起县', '陕西省延安市吴起县');
INSERT INTO `t_system_area` VALUES ('610627', ',610000,610600,', '610600', '2016-01-25 14:31:32', '甘泉县', '陕西省延安市甘泉县');
INSERT INTO `t_system_area` VALUES ('610628', ',610000,610600,', '610600', '2016-01-25 14:31:32', '富县', '陕西省延安市富县');
INSERT INTO `t_system_area` VALUES ('610629', ',610000,610600,', '610600', '2016-01-25 14:31:32', '洛川县', '陕西省延安市洛川县');
INSERT INTO `t_system_area` VALUES ('610630', ',610000,610600,', '610600', '2016-01-25 14:31:32', '宜川县', '陕西省延安市宜川县');
INSERT INTO `t_system_area` VALUES ('610631', ',610000,610600,', '610600', '2016-01-25 14:31:32', '黄龙县', '陕西省延安市黄龙县');
INSERT INTO `t_system_area` VALUES ('610632', ',610000,610600,', '610600', '2016-01-25 14:31:32', '黄陵县', '陕西省延安市黄陵县');
INSERT INTO `t_system_area` VALUES ('610633', ',610000,610600,', '610600', '2016-01-25 14:31:32', '其它区', '陕西省延安市其它区');
INSERT INTO `t_system_area` VALUES ('610700', ',610000,', '610000', '2016-01-25 14:31:32', '汉中市', '陕西省汉中市');
INSERT INTO `t_system_area` VALUES ('610702', ',610000,610700,', '610700', '2016-01-25 14:31:32', '汉台区', '陕西省汉中市汉台区');
INSERT INTO `t_system_area` VALUES ('610721', ',610000,610700,', '610700', '2016-01-25 14:31:32', '南郑县', '陕西省汉中市南郑县');
INSERT INTO `t_system_area` VALUES ('610722', ',610000,610700,', '610700', '2016-01-25 14:31:32', '城固县', '陕西省汉中市城固县');
INSERT INTO `t_system_area` VALUES ('610723', ',610000,610700,', '610700', '2016-01-25 14:31:32', '洋县', '陕西省汉中市洋县');
INSERT INTO `t_system_area` VALUES ('610724', ',610000,610700,', '610700', '2016-01-25 14:31:32', '西乡县', '陕西省汉中市西乡县');
INSERT INTO `t_system_area` VALUES ('610725', ',610000,610700,', '610700', '2016-01-25 14:31:32', '勉县', '陕西省汉中市勉县');
INSERT INTO `t_system_area` VALUES ('610726', ',610000,610700,', '610700', '2016-01-25 14:31:32', '宁强县', '陕西省汉中市宁强县');
INSERT INTO `t_system_area` VALUES ('610727', ',610000,610700,', '610700', '2016-01-25 14:31:32', '略阳县', '陕西省汉中市略阳县');
INSERT INTO `t_system_area` VALUES ('610728', ',610000,610700,', '610700', '2016-01-25 14:31:32', '镇巴县', '陕西省汉中市镇巴县');
INSERT INTO `t_system_area` VALUES ('610729', ',610000,610700,', '610700', '2016-01-25 14:31:32', '留坝县', '陕西省汉中市留坝县');
INSERT INTO `t_system_area` VALUES ('610730', ',610000,610700,', '610700', '2016-01-25 14:31:32', '佛坪县', '陕西省汉中市佛坪县');
INSERT INTO `t_system_area` VALUES ('610731', ',610000,610700,', '610700', '2016-01-25 14:31:32', '其它区', '陕西省汉中市其它区');
INSERT INTO `t_system_area` VALUES ('610800', ',610000,', '610000', '2016-01-25 14:31:32', '榆林市', '陕西省榆林市');
INSERT INTO `t_system_area` VALUES ('610802', ',610000,610800,', '610800', '2016-01-25 14:31:32', '榆阳区', '陕西省榆林市榆阳区');
INSERT INTO `t_system_area` VALUES ('610821', ',610000,610800,', '610800', '2016-01-25 14:31:32', '神木县', '陕西省榆林市神木县');
INSERT INTO `t_system_area` VALUES ('610822', ',610000,610800,', '610800', '2016-01-25 14:31:32', '府谷县', '陕西省榆林市府谷县');
INSERT INTO `t_system_area` VALUES ('610823', ',610000,610800,', '610800', '2016-01-25 14:31:32', '横山县', '陕西省榆林市横山县');
INSERT INTO `t_system_area` VALUES ('610824', ',610000,610800,', '610800', '2016-01-25 14:31:32', '靖边县', '陕西省榆林市靖边县');
INSERT INTO `t_system_area` VALUES ('610825', ',610000,610800,', '610800', '2016-01-25 14:31:32', '定边县', '陕西省榆林市定边县');
INSERT INTO `t_system_area` VALUES ('610826', ',610000,610800,', '610800', '2016-01-25 14:31:32', '绥德县', '陕西省榆林市绥德县');
INSERT INTO `t_system_area` VALUES ('610827', ',610000,610800,', '610800', '2016-01-25 14:31:32', '米脂县', '陕西省榆林市米脂县');
INSERT INTO `t_system_area` VALUES ('610828', ',610000,610800,', '610800', '2016-01-25 14:31:32', '佳县', '陕西省榆林市佳县');
INSERT INTO `t_system_area` VALUES ('610829', ',610000,610800,', '610800', '2016-01-25 14:31:32', '吴堡县', '陕西省榆林市吴堡县');
INSERT INTO `t_system_area` VALUES ('610830', ',610000,610800,', '610800', '2016-01-25 14:31:32', '清涧县', '陕西省榆林市清涧县');
INSERT INTO `t_system_area` VALUES ('610831', ',610000,610800,', '610800', '2016-01-25 14:31:32', '子洲县', '陕西省榆林市子洲县');
INSERT INTO `t_system_area` VALUES ('610832', ',610000,610800,', '610800', '2016-01-25 14:31:32', '其它区', '陕西省榆林市其它区');
INSERT INTO `t_system_area` VALUES ('610900', ',610000,', '610000', '2016-01-25 14:31:32', '安康市', '陕西省安康市');
INSERT INTO `t_system_area` VALUES ('610902', ',610000,610900,', '610900', '2016-01-25 14:31:32', '汉滨区', '陕西省安康市汉滨区');
INSERT INTO `t_system_area` VALUES ('610921', ',610000,610900,', '610900', '2016-01-25 14:31:32', '汉阴县', '陕西省安康市汉阴县');
INSERT INTO `t_system_area` VALUES ('610922', ',610000,610900,', '610900', '2016-01-25 14:31:32', '石泉县', '陕西省安康市石泉县');
INSERT INTO `t_system_area` VALUES ('610923', ',610000,610900,', '610900', '2016-01-25 14:31:32', '宁陕县', '陕西省安康市宁陕县');
INSERT INTO `t_system_area` VALUES ('610924', ',610000,610900,', '610900', '2016-01-25 14:31:32', '紫阳县', '陕西省安康市紫阳县');
INSERT INTO `t_system_area` VALUES ('610925', ',610000,610900,', '610900', '2016-01-25 14:31:32', '岚皋县', '陕西省安康市岚皋县');
INSERT INTO `t_system_area` VALUES ('610926', ',610000,610900,', '610900', '2016-01-25 14:31:32', '平利县', '陕西省安康市平利县');
INSERT INTO `t_system_area` VALUES ('610927', ',610000,610900,', '610900', '2016-01-25 14:31:32', '镇坪县', '陕西省安康市镇坪县');
INSERT INTO `t_system_area` VALUES ('610928', ',610000,610900,', '610900', '2016-01-25 14:31:32', '旬阳县', '陕西省安康市旬阳县');
INSERT INTO `t_system_area` VALUES ('610929', ',610000,610900,', '610900', '2016-01-25 14:31:32', '白河县', '陕西省安康市白河县');
INSERT INTO `t_system_area` VALUES ('610930', ',610000,610900,', '610900', '2016-01-25 14:31:32', '其它区', '陕西省安康市其它区');
INSERT INTO `t_system_area` VALUES ('611000', ',610000,', '610000', '2016-01-25 14:31:32', '商洛市', '陕西省商洛市');
INSERT INTO `t_system_area` VALUES ('611002', ',610000,611000,', '611000', '2016-01-25 14:31:32', '商州区', '陕西省商洛市商州区');
INSERT INTO `t_system_area` VALUES ('611021', ',610000,611000,', '611000', '2016-01-25 14:31:32', '洛南县', '陕西省商洛市洛南县');
INSERT INTO `t_system_area` VALUES ('611022', ',610000,611000,', '611000', '2016-01-25 14:31:32', '丹凤县', '陕西省商洛市丹凤县');
INSERT INTO `t_system_area` VALUES ('611023', ',610000,611000,', '611000', '2016-01-25 14:31:32', '商南县', '陕西省商洛市商南县');
INSERT INTO `t_system_area` VALUES ('611024', ',610000,611000,', '611000', '2016-01-25 14:31:32', '山阳县', '陕西省商洛市山阳县');
INSERT INTO `t_system_area` VALUES ('611025', ',610000,611000,', '611000', '2016-01-25 14:31:32', '镇安县', '陕西省商洛市镇安县');
INSERT INTO `t_system_area` VALUES ('611026', ',610000,611000,', '611000', '2016-01-25 14:31:32', '柞水县', '陕西省商洛市柞水县');
INSERT INTO `t_system_area` VALUES ('611027', ',610000,611000,', '611000', '2016-01-25 14:31:32', '其它区', '陕西省商洛市其它区');
INSERT INTO `t_system_area` VALUES ('620000', ',', null, '2016-01-25 14:31:32', '甘肃省', '甘肃省');
INSERT INTO `t_system_area` VALUES ('620100', ',620000,', '620000', '2016-01-25 14:31:32', '兰州市', '甘肃省兰州市');
INSERT INTO `t_system_area` VALUES ('620102', ',620000,620100,', '620100', '2016-01-25 14:31:32', '城关区', '甘肃省兰州市城关区');
INSERT INTO `t_system_area` VALUES ('620103', ',620000,620100,', '620100', '2016-01-25 14:31:32', '七里河区', '甘肃省兰州市七里河区');
INSERT INTO `t_system_area` VALUES ('620104', ',620000,620100,', '620100', '2016-01-25 14:31:32', '西固区', '甘肃省兰州市西固区');
INSERT INTO `t_system_area` VALUES ('620105', ',620000,620100,', '620100', '2016-01-25 14:31:32', '安宁区', '甘肃省兰州市安宁区');
INSERT INTO `t_system_area` VALUES ('620111', ',620000,620100,', '620100', '2016-01-25 14:31:32', '红古区', '甘肃省兰州市红古区');
INSERT INTO `t_system_area` VALUES ('620121', ',620000,620100,', '620100', '2016-01-25 14:31:32', '永登县', '甘肃省兰州市永登县');
INSERT INTO `t_system_area` VALUES ('620122', ',620000,620100,', '620100', '2016-01-25 14:31:32', '皋兰县', '甘肃省兰州市皋兰县');
INSERT INTO `t_system_area` VALUES ('620123', ',620000,620100,', '620100', '2016-01-25 14:31:32', '榆中县', '甘肃省兰州市榆中县');
INSERT INTO `t_system_area` VALUES ('620124', ',620000,620100,', '620100', '2016-01-25 14:31:32', '其它区', '甘肃省兰州市其它区');
INSERT INTO `t_system_area` VALUES ('620200', ',620000,', '620000', '2016-01-25 14:31:32', '嘉峪关市', '甘肃省嘉峪关市');
INSERT INTO `t_system_area` VALUES ('620300', ',620000,', '620000', '2016-01-25 14:31:32', '金昌市', '甘肃省金昌市');
INSERT INTO `t_system_area` VALUES ('620302', ',620000,620300,', '620300', '2016-01-25 14:31:32', '金川区', '甘肃省金昌市金川区');
INSERT INTO `t_system_area` VALUES ('620321', ',620000,620300,', '620300', '2016-01-25 14:31:32', '永昌县', '甘肃省金昌市永昌县');
INSERT INTO `t_system_area` VALUES ('620322', ',620000,620300,', '620300', '2016-01-25 14:31:32', '其它区', '甘肃省金昌市其它区');
INSERT INTO `t_system_area` VALUES ('620400', ',620000,', '620000', '2016-01-25 14:31:32', '白银市', '甘肃省白银市');
INSERT INTO `t_system_area` VALUES ('620402', ',620000,620400,', '620400', '2016-01-25 14:31:32', '白银区', '甘肃省白银市白银区');
INSERT INTO `t_system_area` VALUES ('620403', ',620000,620400,', '620400', '2016-01-25 14:31:32', '平川区', '甘肃省白银市平川区');
INSERT INTO `t_system_area` VALUES ('620421', ',620000,620400,', '620400', '2016-01-25 14:31:32', '靖远县', '甘肃省白银市靖远县');
INSERT INTO `t_system_area` VALUES ('620422', ',620000,620400,', '620400', '2016-01-25 14:31:32', '会宁县', '甘肃省白银市会宁县');
INSERT INTO `t_system_area` VALUES ('620423', ',620000,620400,', '620400', '2016-01-25 14:31:32', '景泰县', '甘肃省白银市景泰县');
INSERT INTO `t_system_area` VALUES ('620424', ',620000,620400,', '620400', '2016-01-25 14:31:33', '其它区', '甘肃省白银市其它区');
INSERT INTO `t_system_area` VALUES ('620500', ',620000,', '620000', '2016-01-25 14:31:33', '天水市', '甘肃省天水市');
INSERT INTO `t_system_area` VALUES ('620502', ',620000,620500,', '620500', '2016-01-25 14:31:33', '秦州区', '甘肃省天水市秦州区');
INSERT INTO `t_system_area` VALUES ('620503', ',620000,620500,', '620500', '2016-01-25 14:31:33', '麦积区', '甘肃省天水市麦积区');
INSERT INTO `t_system_area` VALUES ('620521', ',620000,620500,', '620500', '2016-01-25 14:31:33', '清水县', '甘肃省天水市清水县');
INSERT INTO `t_system_area` VALUES ('620522', ',620000,620500,', '620500', '2016-01-25 14:31:33', '秦安县', '甘肃省天水市秦安县');
INSERT INTO `t_system_area` VALUES ('620523', ',620000,620500,', '620500', '2016-01-25 14:31:33', '甘谷县', '甘肃省天水市甘谷县');
INSERT INTO `t_system_area` VALUES ('620524', ',620000,620500,', '620500', '2016-01-25 14:31:33', '武山县', '甘肃省天水市武山县');
INSERT INTO `t_system_area` VALUES ('620525', ',620000,620500,', '620500', '2016-01-25 14:31:33', '张家川回族自治县', '甘肃省天水市张家川回族自治县');
INSERT INTO `t_system_area` VALUES ('620526', ',620000,620500,', '620500', '2016-01-25 14:31:33', '其它区', '甘肃省天水市其它区');
INSERT INTO `t_system_area` VALUES ('620600', ',620000,', '620000', '2016-01-25 14:31:33', '武威市', '甘肃省武威市');
INSERT INTO `t_system_area` VALUES ('620602', ',620000,620600,', '620600', '2016-01-25 14:31:33', '凉州区', '甘肃省武威市凉州区');
INSERT INTO `t_system_area` VALUES ('620621', ',620000,620600,', '620600', '2016-01-25 14:31:33', '民勤县', '甘肃省武威市民勤县');
INSERT INTO `t_system_area` VALUES ('620622', ',620000,620600,', '620600', '2016-01-25 14:31:33', '古浪县', '甘肃省武威市古浪县');
INSERT INTO `t_system_area` VALUES ('620623', ',620000,620600,', '620600', '2016-01-25 14:31:33', '天祝藏族自治县', '甘肃省武威市天祝藏族自治县');
INSERT INTO `t_system_area` VALUES ('620624', ',620000,620600,', '620600', '2016-01-25 14:31:33', '其它区', '甘肃省武威市其它区');
INSERT INTO `t_system_area` VALUES ('620700', ',620000,', '620000', '2016-01-25 14:31:33', '张掖市', '甘肃省张掖市');
INSERT INTO `t_system_area` VALUES ('620702', ',620000,620700,', '620700', '2016-01-25 14:31:33', '甘州区', '甘肃省张掖市甘州区');
INSERT INTO `t_system_area` VALUES ('620721', ',620000,620700,', '620700', '2016-01-25 14:31:33', '肃南裕固族自治县', '甘肃省张掖市肃南裕固族自治县');
INSERT INTO `t_system_area` VALUES ('620722', ',620000,620700,', '620700', '2016-01-25 14:31:33', '民乐县', '甘肃省张掖市民乐县');
INSERT INTO `t_system_area` VALUES ('620723', ',620000,620700,', '620700', '2016-01-25 14:31:33', '临泽县', '甘肃省张掖市临泽县');
INSERT INTO `t_system_area` VALUES ('620724', ',620000,620700,', '620700', '2016-01-25 14:31:33', '高台县', '甘肃省张掖市高台县');
INSERT INTO `t_system_area` VALUES ('620725', ',620000,620700,', '620700', '2016-01-25 14:31:33', '山丹县', '甘肃省张掖市山丹县');
INSERT INTO `t_system_area` VALUES ('620726', ',620000,620700,', '620700', '2016-01-25 14:31:33', '其它区', '甘肃省张掖市其它区');
INSERT INTO `t_system_area` VALUES ('620800', ',620000,', '620000', '2016-01-25 14:31:33', '平凉市', '甘肃省平凉市');
INSERT INTO `t_system_area` VALUES ('620802', ',620000,620800,', '620800', '2016-01-25 14:31:33', '崆峒区', '甘肃省平凉市崆峒区');
INSERT INTO `t_system_area` VALUES ('620821', ',620000,620800,', '620800', '2016-01-25 14:31:33', '泾川县', '甘肃省平凉市泾川县');
INSERT INTO `t_system_area` VALUES ('620822', ',620000,620800,', '620800', '2016-01-25 14:31:33', '灵台县', '甘肃省平凉市灵台县');
INSERT INTO `t_system_area` VALUES ('620823', ',620000,620800,', '620800', '2016-01-25 14:31:33', '崇信县', '甘肃省平凉市崇信县');
INSERT INTO `t_system_area` VALUES ('620824', ',620000,620800,', '620800', '2016-01-25 14:31:33', '华亭县', '甘肃省平凉市华亭县');
INSERT INTO `t_system_area` VALUES ('620825', ',620000,620800,', '620800', '2016-01-25 14:31:33', '庄浪县', '甘肃省平凉市庄浪县');
INSERT INTO `t_system_area` VALUES ('620826', ',620000,620800,', '620800', '2016-01-25 14:31:33', '静宁县', '甘肃省平凉市静宁县');
INSERT INTO `t_system_area` VALUES ('620827', ',620000,620800,', '620800', '2016-01-25 14:31:33', '其它区', '甘肃省平凉市其它区');
INSERT INTO `t_system_area` VALUES ('620900', ',620000,', '620000', '2016-01-25 14:31:33', '酒泉市', '甘肃省酒泉市');
INSERT INTO `t_system_area` VALUES ('620902', ',620000,620900,', '620900', '2016-01-25 14:31:33', '肃州区', '甘肃省酒泉市肃州区');
INSERT INTO `t_system_area` VALUES ('620921', ',620000,620900,', '620900', '2016-01-25 14:31:33', '金塔县', '甘肃省酒泉市金塔县');
INSERT INTO `t_system_area` VALUES ('620922', ',620000,620900,', '620900', '2016-01-25 14:31:33', '瓜州县', '甘肃省酒泉市瓜州县');
INSERT INTO `t_system_area` VALUES ('620923', ',620000,620900,', '620900', '2016-01-25 14:31:33', '肃北蒙古族自治县', '甘肃省酒泉市肃北蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('620924', ',620000,620900,', '620900', '2016-01-25 14:31:33', '阿克塞哈萨克族自治县', '甘肃省酒泉市阿克塞哈萨克族自治县');
INSERT INTO `t_system_area` VALUES ('620981', ',620000,620900,', '620900', '2016-01-25 14:31:33', '玉门市', '甘肃省酒泉市玉门市');
INSERT INTO `t_system_area` VALUES ('620982', ',620000,620900,', '620900', '2016-01-25 14:31:33', '敦煌市', '甘肃省酒泉市敦煌市');
INSERT INTO `t_system_area` VALUES ('620983', ',620000,620900,', '620900', '2016-01-25 14:31:33', '其它区', '甘肃省酒泉市其它区');
INSERT INTO `t_system_area` VALUES ('621000', ',620000,', '620000', '2016-01-25 14:31:33', '庆阳市', '甘肃省庆阳市');
INSERT INTO `t_system_area` VALUES ('621002', ',620000,621000,', '621000', '2016-01-25 14:31:33', '西峰区', '甘肃省庆阳市西峰区');
INSERT INTO `t_system_area` VALUES ('621021', ',620000,621000,', '621000', '2016-01-25 14:31:33', '庆城县', '甘肃省庆阳市庆城县');
INSERT INTO `t_system_area` VALUES ('621022', ',620000,621000,', '621000', '2016-01-25 14:31:33', '环县', '甘肃省庆阳市环县');
INSERT INTO `t_system_area` VALUES ('621023', ',620000,621000,', '621000', '2016-01-25 14:31:33', '华池县', '甘肃省庆阳市华池县');
INSERT INTO `t_system_area` VALUES ('621024', ',620000,621000,', '621000', '2016-01-25 14:31:33', '合水县', '甘肃省庆阳市合水县');
INSERT INTO `t_system_area` VALUES ('621025', ',620000,621000,', '621000', '2016-01-25 14:31:33', '正宁县', '甘肃省庆阳市正宁县');
INSERT INTO `t_system_area` VALUES ('621026', ',620000,621000,', '621000', '2016-01-25 14:31:33', '宁县', '甘肃省庆阳市宁县');
INSERT INTO `t_system_area` VALUES ('621027', ',620000,621000,', '621000', '2016-01-25 14:31:33', '镇原县', '甘肃省庆阳市镇原县');
INSERT INTO `t_system_area` VALUES ('621028', ',620000,621000,', '621000', '2016-01-25 14:31:33', '其它区', '甘肃省庆阳市其它区');
INSERT INTO `t_system_area` VALUES ('621100', ',620000,', '620000', '2016-01-25 14:31:33', '定西市', '甘肃省定西市');
INSERT INTO `t_system_area` VALUES ('621102', ',620000,621100,', '621100', '2016-01-25 14:31:33', '安定区', '甘肃省定西市安定区');
INSERT INTO `t_system_area` VALUES ('621121', ',620000,621100,', '621100', '2016-01-25 14:31:33', '通渭县', '甘肃省定西市通渭县');
INSERT INTO `t_system_area` VALUES ('621122', ',620000,621100,', '621100', '2016-01-25 14:31:33', '陇西县', '甘肃省定西市陇西县');
INSERT INTO `t_system_area` VALUES ('621123', ',620000,621100,', '621100', '2016-01-25 14:31:33', '渭源县', '甘肃省定西市渭源县');
INSERT INTO `t_system_area` VALUES ('621124', ',620000,621100,', '621100', '2016-01-25 14:31:33', '临洮县', '甘肃省定西市临洮县');
INSERT INTO `t_system_area` VALUES ('621125', ',620000,621100,', '621100', '2016-01-25 14:31:33', '漳县', '甘肃省定西市漳县');
INSERT INTO `t_system_area` VALUES ('621126', ',620000,621100,', '621100', '2016-01-25 14:31:33', '岷县', '甘肃省定西市岷县');
INSERT INTO `t_system_area` VALUES ('621127', ',620000,621100,', '621100', '2016-01-25 14:31:33', '其它区', '甘肃省定西市其它区');
INSERT INTO `t_system_area` VALUES ('621200', ',620000,', '620000', '2016-01-25 14:31:33', '陇南市', '甘肃省陇南市');
INSERT INTO `t_system_area` VALUES ('621202', ',620000,621200,', '621200', '2016-01-25 14:31:33', '武都区', '甘肃省陇南市武都区');
INSERT INTO `t_system_area` VALUES ('621221', ',620000,621200,', '621200', '2016-01-25 14:31:33', '成县', '甘肃省陇南市成县');
INSERT INTO `t_system_area` VALUES ('621222', ',620000,621200,', '621200', '2016-01-25 14:31:33', '文县', '甘肃省陇南市文县');
INSERT INTO `t_system_area` VALUES ('621223', ',620000,621200,', '621200', '2016-01-25 14:31:33', '宕昌县', '甘肃省陇南市宕昌县');
INSERT INTO `t_system_area` VALUES ('621224', ',620000,621200,', '621200', '2016-01-25 14:31:33', '康县', '甘肃省陇南市康县');
INSERT INTO `t_system_area` VALUES ('621225', ',620000,621200,', '621200', '2016-01-25 14:31:33', '西和县', '甘肃省陇南市西和县');
INSERT INTO `t_system_area` VALUES ('621226', ',620000,621200,', '621200', '2016-01-25 14:31:33', '礼县', '甘肃省陇南市礼县');
INSERT INTO `t_system_area` VALUES ('621227', ',620000,621200,', '621200', '2016-01-25 14:31:33', '徽县', '甘肃省陇南市徽县');
INSERT INTO `t_system_area` VALUES ('621228', ',620000,621200,', '621200', '2016-01-25 14:31:33', '两当县', '甘肃省陇南市两当县');
INSERT INTO `t_system_area` VALUES ('621229', ',620000,621200,', '621200', '2016-01-25 14:31:33', '其它区', '甘肃省陇南市其它区');
INSERT INTO `t_system_area` VALUES ('622900', ',620000,', '620000', '2016-01-25 14:31:33', '临夏回族自治州', '甘肃省临夏回族自治州');
INSERT INTO `t_system_area` VALUES ('622901', ',620000,622900,', '622900', '2016-01-25 14:31:33', '临夏市', '甘肃省临夏回族自治州临夏市');
INSERT INTO `t_system_area` VALUES ('622921', ',620000,622900,', '622900', '2016-01-25 14:31:33', '临夏县', '甘肃省临夏回族自治州临夏县');
INSERT INTO `t_system_area` VALUES ('622922', ',620000,622900,', '622900', '2016-01-25 14:31:33', '康乐县', '甘肃省临夏回族自治州康乐县');
INSERT INTO `t_system_area` VALUES ('622923', ',620000,622900,', '622900', '2016-01-25 14:31:33', '永靖县', '甘肃省临夏回族自治州永靖县');
INSERT INTO `t_system_area` VALUES ('622924', ',620000,622900,', '622900', '2016-01-25 14:31:33', '广河县', '甘肃省临夏回族自治州广河县');
INSERT INTO `t_system_area` VALUES ('622925', ',620000,622900,', '622900', '2016-01-25 14:31:33', '和政县', '甘肃省临夏回族自治州和政县');
INSERT INTO `t_system_area` VALUES ('622926', ',620000,622900,', '622900', '2016-01-25 14:31:33', '东乡族自治县', '甘肃省临夏回族自治州东乡族自治县');
INSERT INTO `t_system_area` VALUES ('622927', ',620000,622900,', '622900', '2016-01-25 14:31:33', '积石山保安族东乡族撒拉族自治县', '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县');
INSERT INTO `t_system_area` VALUES ('622928', ',620000,622900,', '622900', '2016-01-25 14:31:33', '其它区', '甘肃省临夏回族自治州其它区');
INSERT INTO `t_system_area` VALUES ('623000', ',620000,', '620000', '2016-01-25 14:31:33', '甘南藏族自治州', '甘肃省甘南藏族自治州');
INSERT INTO `t_system_area` VALUES ('623001', ',620000,623000,', '623000', '2016-01-25 14:31:33', '合作市', '甘肃省甘南藏族自治州合作市');
INSERT INTO `t_system_area` VALUES ('623021', ',620000,623000,', '623000', '2016-01-25 14:31:33', '临潭县', '甘肃省甘南藏族自治州临潭县');
INSERT INTO `t_system_area` VALUES ('623022', ',620000,623000,', '623000', '2016-01-25 14:31:33', '卓尼县', '甘肃省甘南藏族自治州卓尼县');
INSERT INTO `t_system_area` VALUES ('623023', ',620000,623000,', '623000', '2016-01-25 14:31:33', '舟曲县', '甘肃省甘南藏族自治州舟曲县');
INSERT INTO `t_system_area` VALUES ('623024', ',620000,623000,', '623000', '2016-01-25 14:31:33', '迭部县', '甘肃省甘南藏族自治州迭部县');
INSERT INTO `t_system_area` VALUES ('623025', ',620000,623000,', '623000', '2016-01-25 14:31:33', '玛曲县', '甘肃省甘南藏族自治州玛曲县');
INSERT INTO `t_system_area` VALUES ('623026', ',620000,623000,', '623000', '2016-01-25 14:31:33', '碌曲县', '甘肃省甘南藏族自治州碌曲县');
INSERT INTO `t_system_area` VALUES ('623027', ',620000,623000,', '623000', '2016-01-25 14:31:33', '夏河县', '甘肃省甘南藏族自治州夏河县');
INSERT INTO `t_system_area` VALUES ('623028', ',620000,623000,', '623000', '2016-01-25 14:31:33', '其它区', '甘肃省甘南藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('630000', ',', null, '2016-01-25 14:31:33', '青海省', '青海省');
INSERT INTO `t_system_area` VALUES ('630100', ',630000,', '630000', '2016-01-25 14:31:33', '西宁市', '青海省西宁市');
INSERT INTO `t_system_area` VALUES ('630102', ',630000,630100,', '630100', '2016-01-25 14:31:33', '城东区', '青海省西宁市城东区');
INSERT INTO `t_system_area` VALUES ('630103', ',630000,630100,', '630100', '2016-01-25 14:31:33', '城中区', '青海省西宁市城中区');
INSERT INTO `t_system_area` VALUES ('630104', ',630000,630100,', '630100', '2016-01-25 14:31:33', '城西区', '青海省西宁市城西区');
INSERT INTO `t_system_area` VALUES ('630105', ',630000,630100,', '630100', '2016-01-25 14:31:33', '城北区', '青海省西宁市城北区');
INSERT INTO `t_system_area` VALUES ('630121', ',630000,630100,', '630100', '2016-01-25 14:31:33', '大通回族土族自治县', '青海省西宁市大通回族土族自治县');
INSERT INTO `t_system_area` VALUES ('630122', ',630000,630100,', '630100', '2016-01-25 14:31:33', '湟中县', '青海省西宁市湟中县');
INSERT INTO `t_system_area` VALUES ('630123', ',630000,630100,', '630100', '2016-01-25 14:31:33', '湟源县', '青海省西宁市湟源县');
INSERT INTO `t_system_area` VALUES ('630124', ',630000,630100,', '630100', '2016-01-25 14:31:33', '其它区', '青海省西宁市其它区');
INSERT INTO `t_system_area` VALUES ('632100', ',630000,', '630000', '2016-01-25 14:31:33', '海东市', '青海省海东市');
INSERT INTO `t_system_area` VALUES ('632121', ',630000,632100,', '632100', '2016-01-25 14:31:33', '平安县', '青海省海东市平安县');
INSERT INTO `t_system_area` VALUES ('632122', ',630000,632100,', '632100', '2016-01-25 14:31:33', '民和回族土族自治县', '青海省海东市民和回族土族自治县');
INSERT INTO `t_system_area` VALUES ('632123', ',630000,632100,', '632100', '2016-01-25 14:31:33', '乐都区', '青海省海东市乐都区');
INSERT INTO `t_system_area` VALUES ('632126', ',630000,632100,', '632100', '2016-01-25 14:31:33', '互助土族自治县', '青海省海东市互助土族自治县');
INSERT INTO `t_system_area` VALUES ('632127', ',630000,632100,', '632100', '2016-01-25 14:31:34', '化隆回族自治县', '青海省海东市化隆回族自治县');
INSERT INTO `t_system_area` VALUES ('632128', ',630000,632100,', '632100', '2016-01-25 14:31:34', '循化撒拉族自治县', '青海省海东市循化撒拉族自治县');
INSERT INTO `t_system_area` VALUES ('632129', ',630000,632100,', '632100', '2016-01-25 14:31:34', '其它区', '青海省海东市其它区');
INSERT INTO `t_system_area` VALUES ('632200', ',630000,', '630000', '2016-01-25 14:31:34', '海北藏族自治州', '青海省海北藏族自治州');
INSERT INTO `t_system_area` VALUES ('632221', ',630000,632200,', '632200', '2016-01-25 14:31:34', '门源回族自治县', '青海省海北藏族自治州门源回族自治县');
INSERT INTO `t_system_area` VALUES ('632222', ',630000,632200,', '632200', '2016-01-25 14:31:34', '祁连县', '青海省海北藏族自治州祁连县');
INSERT INTO `t_system_area` VALUES ('632223', ',630000,632200,', '632200', '2016-01-25 14:31:34', '海晏县', '青海省海北藏族自治州海晏县');
INSERT INTO `t_system_area` VALUES ('632224', ',630000,632200,', '632200', '2016-01-25 14:31:34', '刚察县', '青海省海北藏族自治州刚察县');
INSERT INTO `t_system_area` VALUES ('632225', ',630000,632200,', '632200', '2016-01-25 14:31:34', '其它区', '青海省海北藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('632300', ',630000,', '630000', '2016-01-25 14:31:34', '黄南藏族自治州', '青海省黄南藏族自治州');
INSERT INTO `t_system_area` VALUES ('632321', ',630000,632300,', '632300', '2016-01-25 14:31:34', '同仁县', '青海省黄南藏族自治州同仁县');
INSERT INTO `t_system_area` VALUES ('632322', ',630000,632300,', '632300', '2016-01-25 14:31:34', '尖扎县', '青海省黄南藏族自治州尖扎县');
INSERT INTO `t_system_area` VALUES ('632323', ',630000,632300,', '632300', '2016-01-25 14:31:34', '泽库县', '青海省黄南藏族自治州泽库县');
INSERT INTO `t_system_area` VALUES ('632324', ',630000,632300,', '632300', '2016-01-25 14:31:34', '河南蒙古族自治县', '青海省黄南藏族自治州河南蒙古族自治县');
INSERT INTO `t_system_area` VALUES ('632325', ',630000,632300,', '632300', '2016-01-25 14:31:34', '其它区', '青海省黄南藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('632500', ',630000,', '630000', '2016-01-25 14:31:34', '海南藏族自治州', '青海省海南藏族自治州');
INSERT INTO `t_system_area` VALUES ('632521', ',630000,632500,', '632500', '2016-01-25 14:31:34', '共和县', '青海省海南藏族自治州共和县');
INSERT INTO `t_system_area` VALUES ('632522', ',630000,632500,', '632500', '2016-01-25 14:31:34', '同德县', '青海省海南藏族自治州同德县');
INSERT INTO `t_system_area` VALUES ('632523', ',630000,632500,', '632500', '2016-01-25 14:31:34', '贵德县', '青海省海南藏族自治州贵德县');
INSERT INTO `t_system_area` VALUES ('632524', ',630000,632500,', '632500', '2016-01-25 14:31:34', '兴海县', '青海省海南藏族自治州兴海县');
INSERT INTO `t_system_area` VALUES ('632525', ',630000,632500,', '632500', '2016-01-25 14:31:34', '贵南县', '青海省海南藏族自治州贵南县');
INSERT INTO `t_system_area` VALUES ('632526', ',630000,632500,', '632500', '2016-01-25 14:31:34', '其它区', '青海省海南藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('632600', ',630000,', '630000', '2016-01-25 14:31:34', '果洛藏族自治州', '青海省果洛藏族自治州');
INSERT INTO `t_system_area` VALUES ('632621', ',630000,632600,', '632600', '2016-01-25 14:31:34', '玛沁县', '青海省果洛藏族自治州玛沁县');
INSERT INTO `t_system_area` VALUES ('632622', ',630000,632600,', '632600', '2016-01-25 14:31:34', '班玛县', '青海省果洛藏族自治州班玛县');
INSERT INTO `t_system_area` VALUES ('632623', ',630000,632600,', '632600', '2016-01-25 14:31:34', '甘德县', '青海省果洛藏族自治州甘德县');
INSERT INTO `t_system_area` VALUES ('632624', ',630000,632600,', '632600', '2016-01-25 14:31:34', '达日县', '青海省果洛藏族自治州达日县');
INSERT INTO `t_system_area` VALUES ('632625', ',630000,632600,', '632600', '2016-01-25 14:31:34', '久治县', '青海省果洛藏族自治州久治县');
INSERT INTO `t_system_area` VALUES ('632626', ',630000,632600,', '632600', '2016-01-25 14:31:34', '玛多县', '青海省果洛藏族自治州玛多县');
INSERT INTO `t_system_area` VALUES ('632627', ',630000,632600,', '632600', '2016-01-25 14:31:34', '其它区', '青海省果洛藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('632700', ',630000,', '630000', '2016-01-25 14:31:34', '玉树藏族自治州', '青海省玉树藏族自治州');
INSERT INTO `t_system_area` VALUES ('632721', ',630000,632700,', '632700', '2016-01-25 14:31:34', '玉树市', '青海省玉树藏族自治州玉树市');
INSERT INTO `t_system_area` VALUES ('632722', ',630000,632700,', '632700', '2016-01-25 14:31:34', '杂多县', '青海省玉树藏族自治州杂多县');
INSERT INTO `t_system_area` VALUES ('632723', ',630000,632700,', '632700', '2016-01-25 14:31:34', '称多县', '青海省玉树藏族自治州称多县');
INSERT INTO `t_system_area` VALUES ('632724', ',630000,632700,', '632700', '2016-01-25 14:31:34', '治多县', '青海省玉树藏族自治州治多县');
INSERT INTO `t_system_area` VALUES ('632725', ',630000,632700,', '632700', '2016-01-25 14:31:34', '囊谦县', '青海省玉树藏族自治州囊谦县');
INSERT INTO `t_system_area` VALUES ('632726', ',630000,632700,', '632700', '2016-01-25 14:31:34', '曲麻莱县', '青海省玉树藏族自治州曲麻莱县');
INSERT INTO `t_system_area` VALUES ('632727', ',630000,632700,', '632700', '2016-01-25 14:31:34', '其它区', '青海省玉树藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('632800', ',630000,', '630000', '2016-01-25 14:31:34', '海西蒙古族藏族自治州', '青海省海西蒙古族藏族自治州');
INSERT INTO `t_system_area` VALUES ('632801', ',630000,632800,', '632800', '2016-01-25 14:31:34', '格尔木市', '青海省海西蒙古族藏族自治州格尔木市');
INSERT INTO `t_system_area` VALUES ('632802', ',630000,632800,', '632800', '2016-01-25 14:31:34', '德令哈市', '青海省海西蒙古族藏族自治州德令哈市');
INSERT INTO `t_system_area` VALUES ('632821', ',630000,632800,', '632800', '2016-01-25 14:31:34', '乌兰县', '青海省海西蒙古族藏族自治州乌兰县');
INSERT INTO `t_system_area` VALUES ('632822', ',630000,632800,', '632800', '2016-01-25 14:31:34', '都兰县', '青海省海西蒙古族藏族自治州都兰县');
INSERT INTO `t_system_area` VALUES ('632823', ',630000,632800,', '632800', '2016-01-25 14:31:34', '天峻县', '青海省海西蒙古族藏族自治州天峻县');
INSERT INTO `t_system_area` VALUES ('632824', ',630000,632800,', '632800', '2016-01-25 14:31:34', '其它区', '青海省海西蒙古族藏族自治州其它区');
INSERT INTO `t_system_area` VALUES ('640000', ',', null, '2016-01-25 14:31:34', '宁夏', '宁夏');
INSERT INTO `t_system_area` VALUES ('640100', ',640000,', '640000', '2016-01-25 14:31:34', '银川市', '宁夏银川市');
INSERT INTO `t_system_area` VALUES ('640104', ',640000,640100,', '640100', '2016-01-25 14:31:34', '兴庆区', '宁夏银川市兴庆区');
INSERT INTO `t_system_area` VALUES ('640105', ',640000,640100,', '640100', '2016-01-25 14:31:34', '西夏区', '宁夏银川市西夏区');
INSERT INTO `t_system_area` VALUES ('640106', ',640000,640100,', '640100', '2016-01-25 14:31:34', '金凤区', '宁夏银川市金凤区');
INSERT INTO `t_system_area` VALUES ('640121', ',640000,640100,', '640100', '2016-01-25 14:31:34', '永宁县', '宁夏银川市永宁县');
INSERT INTO `t_system_area` VALUES ('640122', ',640000,640100,', '640100', '2016-01-25 14:31:34', '贺兰县', '宁夏银川市贺兰县');
INSERT INTO `t_system_area` VALUES ('640181', ',640000,640100,', '640100', '2016-01-25 14:31:34', '灵武市', '宁夏银川市灵武市');
INSERT INTO `t_system_area` VALUES ('640182', ',640000,640100,', '640100', '2016-01-25 14:31:34', '其它区', '宁夏银川市其它区');
INSERT INTO `t_system_area` VALUES ('640200', ',640000,', '640000', '2016-01-25 14:31:34', '石嘴山市', '宁夏石嘴山市');
INSERT INTO `t_system_area` VALUES ('640202', ',640000,640200,', '640200', '2016-01-25 14:31:34', '大武口区', '宁夏石嘴山市大武口区');
INSERT INTO `t_system_area` VALUES ('640205', ',640000,640200,', '640200', '2016-01-25 14:31:34', '惠农区', '宁夏石嘴山市惠农区');
INSERT INTO `t_system_area` VALUES ('640221', ',640000,640200,', '640200', '2016-01-25 14:31:34', '平罗县', '宁夏石嘴山市平罗县');
INSERT INTO `t_system_area` VALUES ('640222', ',640000,640200,', '640200', '2016-01-25 14:31:34', '其它区', '宁夏石嘴山市其它区');
INSERT INTO `t_system_area` VALUES ('640300', ',640000,', '640000', '2016-01-25 14:31:34', '吴忠市', '宁夏吴忠市');
INSERT INTO `t_system_area` VALUES ('640302', ',640000,640300,', '640300', '2016-01-25 14:31:34', '利通区', '宁夏吴忠市利通区');
INSERT INTO `t_system_area` VALUES ('640303', ',640000,640300,', '640300', '2016-01-25 14:31:34', '红寺堡区', '宁夏吴忠市红寺堡区');
INSERT INTO `t_system_area` VALUES ('640323', ',640000,640300,', '640300', '2016-01-25 14:31:34', '盐池县', '宁夏吴忠市盐池县');
INSERT INTO `t_system_area` VALUES ('640324', ',640000,640300,', '640300', '2016-01-25 14:31:34', '同心县', '宁夏吴忠市同心县');
INSERT INTO `t_system_area` VALUES ('640381', ',640000,640300,', '640300', '2016-01-25 14:31:34', '青铜峡市', '宁夏吴忠市青铜峡市');
INSERT INTO `t_system_area` VALUES ('640382', ',640000,640300,', '640300', '2016-01-25 14:31:34', '其它区', '宁夏吴忠市其它区');
INSERT INTO `t_system_area` VALUES ('640400', ',640000,', '640000', '2016-01-25 14:31:34', '固原市', '宁夏固原市');
INSERT INTO `t_system_area` VALUES ('640402', ',640000,640400,', '640400', '2016-01-25 14:31:34', '原州区', '宁夏固原市原州区');
INSERT INTO `t_system_area` VALUES ('640422', ',640000,640400,', '640400', '2016-01-25 14:31:34', '西吉县', '宁夏固原市西吉县');
INSERT INTO `t_system_area` VALUES ('640423', ',640000,640400,', '640400', '2016-01-25 14:31:34', '隆德县', '宁夏固原市隆德县');
INSERT INTO `t_system_area` VALUES ('640424', ',640000,640400,', '640400', '2016-01-25 14:31:34', '泾源县', '宁夏固原市泾源县');
INSERT INTO `t_system_area` VALUES ('640425', ',640000,640400,', '640400', '2016-01-25 14:31:34', '彭阳县', '宁夏固原市彭阳县');
INSERT INTO `t_system_area` VALUES ('640426', ',640000,640400,', '640400', '2016-01-25 14:31:34', '其它区', '宁夏固原市其它区');
INSERT INTO `t_system_area` VALUES ('640500', ',640000,', '640000', '2016-01-25 14:31:34', '中卫市', '宁夏中卫市');
INSERT INTO `t_system_area` VALUES ('640502', ',640000,640500,', '640500', '2016-01-25 14:31:34', '沙坡头区', '宁夏中卫市沙坡头区');
INSERT INTO `t_system_area` VALUES ('640521', ',640000,640500,', '640500', '2016-01-25 14:31:34', '中宁县', '宁夏中卫市中宁县');
INSERT INTO `t_system_area` VALUES ('640522', ',640000,640500,', '640500', '2016-01-25 14:31:34', '海原县', '宁夏中卫市海原县');
INSERT INTO `t_system_area` VALUES ('640523', ',640000,640500,', '640500', '2016-01-25 14:31:34', '其它区', '宁夏中卫市其它区');
INSERT INTO `t_system_area` VALUES ('650000', ',', null, '2016-01-25 14:31:34', '新疆', '新疆');
INSERT INTO `t_system_area` VALUES ('650100', ',650000,', '650000', '2016-01-25 14:31:34', '乌鲁木齐市', '新疆乌鲁木齐市');
INSERT INTO `t_system_area` VALUES ('650102', ',650000,650100,', '650100', '2016-01-25 14:31:34', '天山区', '新疆乌鲁木齐市天山区');
INSERT INTO `t_system_area` VALUES ('650103', ',650000,650100,', '650100', '2016-01-25 14:31:34', '沙依巴克区', '新疆乌鲁木齐市沙依巴克区');
INSERT INTO `t_system_area` VALUES ('650104', ',650000,650100,', '650100', '2016-01-25 14:31:34', '新市区', '新疆乌鲁木齐市新市区');
INSERT INTO `t_system_area` VALUES ('650105', ',650000,650100,', '650100', '2016-01-25 14:31:34', '水磨沟区', '新疆乌鲁木齐市水磨沟区');
INSERT INTO `t_system_area` VALUES ('650106', ',650000,650100,', '650100', '2016-01-25 14:31:34', '头屯河区', '新疆乌鲁木齐市头屯河区');
INSERT INTO `t_system_area` VALUES ('650107', ',650000,650100,', '650100', '2016-01-25 14:31:34', '达坂城区', '新疆乌鲁木齐市达坂城区');
INSERT INTO `t_system_area` VALUES ('650108', ',650000,650100,', '650100', '2016-01-25 14:31:34', '东山区', '新疆乌鲁木齐市东山区');
INSERT INTO `t_system_area` VALUES ('650109', ',650000,650100,', '650100', '2016-01-25 14:31:34', '米东区', '新疆乌鲁木齐市米东区');
INSERT INTO `t_system_area` VALUES ('650121', ',650000,650100,', '650100', '2016-01-25 14:31:34', '乌鲁木齐县', '新疆乌鲁木齐市乌鲁木齐县');
INSERT INTO `t_system_area` VALUES ('650122', ',650000,650100,', '650100', '2016-01-25 14:31:34', '其它区', '新疆乌鲁木齐市其它区');
INSERT INTO `t_system_area` VALUES ('650200', ',650000,', '650000', '2016-01-25 14:31:34', '克拉玛依市', '新疆克拉玛依市');
INSERT INTO `t_system_area` VALUES ('650202', ',650000,650200,', '650200', '2016-01-25 14:31:34', '独山子区', '新疆克拉玛依市独山子区');
INSERT INTO `t_system_area` VALUES ('650203', ',650000,650200,', '650200', '2016-01-25 14:31:34', '克拉玛依区', '新疆克拉玛依市克拉玛依区');
INSERT INTO `t_system_area` VALUES ('650204', ',650000,650200,', '650200', '2016-01-25 14:31:34', '白碱滩区', '新疆克拉玛依市白碱滩区');
INSERT INTO `t_system_area` VALUES ('650205', ',650000,650200,', '650200', '2016-01-25 14:31:34', '乌尔禾区', '新疆克拉玛依市乌尔禾区');
INSERT INTO `t_system_area` VALUES ('650206', ',650000,650200,', '650200', '2016-01-25 14:31:34', '其它区', '新疆克拉玛依市其它区');
INSERT INTO `t_system_area` VALUES ('652100', ',650000,', '650000', '2016-01-25 14:31:34', '吐鲁番地区', '新疆吐鲁番地区');
INSERT INTO `t_system_area` VALUES ('652101', ',650000,652100,', '652100', '2016-01-25 14:31:34', '吐鲁番市', '新疆吐鲁番地区吐鲁番市');
INSERT INTO `t_system_area` VALUES ('652122', ',650000,652100,', '652100', '2016-01-25 14:31:34', '鄯善县', '新疆吐鲁番地区鄯善县');
INSERT INTO `t_system_area` VALUES ('652123', ',650000,652100,', '652100', '2016-01-25 14:31:34', '托克逊县', '新疆吐鲁番地区托克逊县');
INSERT INTO `t_system_area` VALUES ('652124', ',650000,652100,', '652100', '2016-01-25 14:31:34', '其它区', '新疆吐鲁番地区其它区');
INSERT INTO `t_system_area` VALUES ('652200', ',650000,', '650000', '2016-01-25 14:31:34', '哈密地区', '新疆哈密地区');
INSERT INTO `t_system_area` VALUES ('652201', ',650000,652200,', '652200', '2016-01-25 14:31:34', '哈密市', '新疆哈密地区哈密市');
INSERT INTO `t_system_area` VALUES ('652222', ',650000,652200,', '652200', '2016-01-25 14:31:34', '巴里坤哈萨克自治县', '新疆哈密地区巴里坤哈萨克自治县');
INSERT INTO `t_system_area` VALUES ('652223', ',650000,652200,', '652200', '2016-01-25 14:31:34', '伊吾县', '新疆哈密地区伊吾县');
INSERT INTO `t_system_area` VALUES ('652224', ',650000,652200,', '652200', '2016-01-25 14:31:34', '其它区', '新疆哈密地区其它区');
INSERT INTO `t_system_area` VALUES ('652300', ',650000,', '650000', '2016-01-25 14:31:34', '昌吉回族自治州', '新疆昌吉回族自治州');
INSERT INTO `t_system_area` VALUES ('652301', ',650000,652300,', '652300', '2016-01-25 14:31:34', '昌吉市', '新疆昌吉回族自治州昌吉市');
INSERT INTO `t_system_area` VALUES ('652302', ',650000,652300,', '652300', '2016-01-25 14:31:34', '阜康市', '新疆昌吉回族自治州阜康市');
INSERT INTO `t_system_area` VALUES ('652303', ',650000,652300,', '652300', '2016-01-25 14:31:35', '米泉市', '新疆昌吉回族自治州米泉市');
INSERT INTO `t_system_area` VALUES ('652323', ',650000,652300,', '652300', '2016-01-25 14:31:35', '呼图壁县', '新疆昌吉回族自治州呼图壁县');
INSERT INTO `t_system_area` VALUES ('652324', ',650000,652300,', '652300', '2016-01-25 14:31:35', '玛纳斯县', '新疆昌吉回族自治州玛纳斯县');
INSERT INTO `t_system_area` VALUES ('652325', ',650000,652300,', '652300', '2016-01-25 14:31:35', '奇台县', '新疆昌吉回族自治州奇台县');
INSERT INTO `t_system_area` VALUES ('652327', ',650000,652300,', '652300', '2016-01-25 14:31:35', '吉木萨尔县', '新疆昌吉回族自治州吉木萨尔县');
INSERT INTO `t_system_area` VALUES ('652328', ',650000,652300,', '652300', '2016-01-25 14:31:35', '木垒哈萨克自治县', '新疆昌吉回族自治州木垒哈萨克自治县');
INSERT INTO `t_system_area` VALUES ('652329', ',650000,652300,', '652300', '2016-01-25 14:31:35', '其它区', '新疆昌吉回族自治州其它区');
INSERT INTO `t_system_area` VALUES ('652700', ',650000,', '650000', '2016-01-25 14:31:35', '博尔塔拉蒙古自治州', '新疆博尔塔拉蒙古自治州');
INSERT INTO `t_system_area` VALUES ('652701', ',650000,652700,', '652700', '2016-01-25 14:31:35', '博乐市', '新疆博尔塔拉蒙古自治州博乐市');
INSERT INTO `t_system_area` VALUES ('652702', ',650000,652700,', '652700', '2016-01-25 14:31:35', '阿拉山口市', '新疆博尔塔拉蒙古自治州阿拉山口市');
INSERT INTO `t_system_area` VALUES ('652722', ',650000,652700,', '652700', '2016-01-25 14:31:35', '精河县', '新疆博尔塔拉蒙古自治州精河县');
INSERT INTO `t_system_area` VALUES ('652723', ',650000,652700,', '652700', '2016-01-25 14:31:35', '温泉县', '新疆博尔塔拉蒙古自治州温泉县');
INSERT INTO `t_system_area` VALUES ('652724', ',650000,652700,', '652700', '2016-01-25 14:31:35', '其它区', '新疆博尔塔拉蒙古自治州其它区');
INSERT INTO `t_system_area` VALUES ('652800', ',650000,', '650000', '2016-01-25 14:31:35', '巴音郭楞蒙古自治州', '新疆巴音郭楞蒙古自治州');
INSERT INTO `t_system_area` VALUES ('652801', ',650000,652800,', '652800', '2016-01-25 14:31:35', '库尔勒市', '新疆巴音郭楞蒙古自治州库尔勒市');
INSERT INTO `t_system_area` VALUES ('652822', ',650000,652800,', '652800', '2016-01-25 14:31:35', '轮台县', '新疆巴音郭楞蒙古自治州轮台县');
INSERT INTO `t_system_area` VALUES ('652823', ',650000,652800,', '652800', '2016-01-25 14:31:35', '尉犁县', '新疆巴音郭楞蒙古自治州尉犁县');
INSERT INTO `t_system_area` VALUES ('652824', ',650000,652800,', '652800', '2016-01-25 14:31:35', '若羌县', '新疆巴音郭楞蒙古自治州若羌县');
INSERT INTO `t_system_area` VALUES ('652825', ',650000,652800,', '652800', '2016-01-25 14:31:35', '且末县', '新疆巴音郭楞蒙古自治州且末县');
INSERT INTO `t_system_area` VALUES ('652826', ',650000,652800,', '652800', '2016-01-25 14:31:35', '焉耆回族自治县', '新疆巴音郭楞蒙古自治州焉耆回族自治县');
INSERT INTO `t_system_area` VALUES ('652827', ',650000,652800,', '652800', '2016-01-25 14:31:35', '和静县', '新疆巴音郭楞蒙古自治州和静县');
INSERT INTO `t_system_area` VALUES ('652828', ',650000,652800,', '652800', '2016-01-25 14:31:35', '和硕县', '新疆巴音郭楞蒙古自治州和硕县');
INSERT INTO `t_system_area` VALUES ('652829', ',650000,652800,', '652800', '2016-01-25 14:31:35', '博湖县', '新疆巴音郭楞蒙古自治州博湖县');
INSERT INTO `t_system_area` VALUES ('652830', ',650000,652800,', '652800', '2016-01-25 14:31:35', '其它区', '新疆巴音郭楞蒙古自治州其它区');
INSERT INTO `t_system_area` VALUES ('652900', ',650000,', '650000', '2016-01-25 14:31:35', '阿克苏地区', '新疆阿克苏地区');
INSERT INTO `t_system_area` VALUES ('652901', ',650000,652900,', '652900', '2016-01-25 14:31:35', '阿克苏市', '新疆阿克苏地区阿克苏市');
INSERT INTO `t_system_area` VALUES ('652922', ',650000,652900,', '652900', '2016-01-25 14:31:35', '温宿县', '新疆阿克苏地区温宿县');
INSERT INTO `t_system_area` VALUES ('652923', ',650000,652900,', '652900', '2016-01-25 14:31:35', '库车县', '新疆阿克苏地区库车县');
INSERT INTO `t_system_area` VALUES ('652924', ',650000,652900,', '652900', '2016-01-25 14:31:35', '沙雅县', '新疆阿克苏地区沙雅县');
INSERT INTO `t_system_area` VALUES ('652925', ',650000,652900,', '652900', '2016-01-25 14:31:35', '新和县', '新疆阿克苏地区新和县');
INSERT INTO `t_system_area` VALUES ('652926', ',650000,652900,', '652900', '2016-01-25 14:31:35', '拜城县', '新疆阿克苏地区拜城县');
INSERT INTO `t_system_area` VALUES ('652927', ',650000,652900,', '652900', '2016-01-25 14:31:35', '乌什县', '新疆阿克苏地区乌什县');
INSERT INTO `t_system_area` VALUES ('652928', ',650000,652900,', '652900', '2016-01-25 14:31:35', '阿瓦提县', '新疆阿克苏地区阿瓦提县');
INSERT INTO `t_system_area` VALUES ('652929', ',650000,652900,', '652900', '2016-01-25 14:31:35', '柯坪县', '新疆阿克苏地区柯坪县');
INSERT INTO `t_system_area` VALUES ('652930', ',650000,652900,', '652900', '2016-01-25 14:31:35', '其它区', '新疆阿克苏地区其它区');
INSERT INTO `t_system_area` VALUES ('653000', ',650000,', '650000', '2016-01-25 14:31:35', '克孜勒苏柯尔克孜自治州', '新疆克孜勒苏柯尔克孜自治州');
INSERT INTO `t_system_area` VALUES ('653001', ',650000,653000,', '653000', '2016-01-25 14:31:35', '阿图什市', '新疆克孜勒苏柯尔克孜自治州阿图什市');
INSERT INTO `t_system_area` VALUES ('653022', ',650000,653000,', '653000', '2016-01-25 14:31:35', '阿克陶县', '新疆克孜勒苏柯尔克孜自治州阿克陶县');
INSERT INTO `t_system_area` VALUES ('653023', ',650000,653000,', '653000', '2016-01-25 14:31:35', '阿合奇县', '新疆克孜勒苏柯尔克孜自治州阿合奇县');
INSERT INTO `t_system_area` VALUES ('653024', ',650000,653000,', '653000', '2016-01-25 14:31:35', '乌恰县', '新疆克孜勒苏柯尔克孜自治州乌恰县');
INSERT INTO `t_system_area` VALUES ('653025', ',650000,653000,', '653000', '2016-01-25 14:31:35', '其它区', '新疆克孜勒苏柯尔克孜自治州其它区');
INSERT INTO `t_system_area` VALUES ('653100', ',650000,', '650000', '2016-01-25 14:31:35', '喀什地区', '新疆喀什地区');
INSERT INTO `t_system_area` VALUES ('653101', ',650000,653100,', '653100', '2016-01-25 14:31:35', '喀什市', '新疆喀什地区喀什市');
INSERT INTO `t_system_area` VALUES ('653121', ',650000,653100,', '653100', '2016-01-25 14:31:35', '疏附县', '新疆喀什地区疏附县');
INSERT INTO `t_system_area` VALUES ('653122', ',650000,653100,', '653100', '2016-01-25 14:31:35', '疏勒县', '新疆喀什地区疏勒县');
INSERT INTO `t_system_area` VALUES ('653123', ',650000,653100,', '653100', '2016-01-25 14:31:35', '英吉沙县', '新疆喀什地区英吉沙县');
INSERT INTO `t_system_area` VALUES ('653124', ',650000,653100,', '653100', '2016-01-25 14:31:35', '泽普县', '新疆喀什地区泽普县');
INSERT INTO `t_system_area` VALUES ('653125', ',650000,653100,', '653100', '2016-01-25 14:31:35', '莎车县', '新疆喀什地区莎车县');
INSERT INTO `t_system_area` VALUES ('653126', ',650000,653100,', '653100', '2016-01-25 14:31:35', '叶城县', '新疆喀什地区叶城县');
INSERT INTO `t_system_area` VALUES ('653127', ',650000,653100,', '653100', '2016-01-25 14:31:35', '麦盖提县', '新疆喀什地区麦盖提县');
INSERT INTO `t_system_area` VALUES ('653128', ',650000,653100,', '653100', '2016-01-25 14:31:35', '岳普湖县', '新疆喀什地区岳普湖县');
INSERT INTO `t_system_area` VALUES ('653129', ',650000,653100,', '653100', '2016-01-25 14:31:35', '伽师县', '新疆喀什地区伽师县');
INSERT INTO `t_system_area` VALUES ('653130', ',650000,653100,', '653100', '2016-01-25 14:31:35', '巴楚县', '新疆喀什地区巴楚县');
INSERT INTO `t_system_area` VALUES ('653131', ',650000,653100,', '653100', '2016-01-25 14:31:35', '塔什库尔干塔吉克自治县', '新疆喀什地区塔什库尔干塔吉克自治县');
INSERT INTO `t_system_area` VALUES ('653132', ',650000,653100,', '653100', '2016-01-25 14:31:35', '其它区', '新疆喀什地区其它区');
INSERT INTO `t_system_area` VALUES ('653200', ',650000,', '650000', '2016-01-25 14:31:35', '和田地区', '新疆和田地区');
INSERT INTO `t_system_area` VALUES ('653201', ',650000,653200,', '653200', '2016-01-25 14:31:35', '和田市', '新疆和田地区和田市');
INSERT INTO `t_system_area` VALUES ('653221', ',650000,653200,', '653200', '2016-01-25 14:31:35', '和田县', '新疆和田地区和田县');
INSERT INTO `t_system_area` VALUES ('653222', ',650000,653200,', '653200', '2016-01-25 14:31:35', '墨玉县', '新疆和田地区墨玉县');
INSERT INTO `t_system_area` VALUES ('653223', ',650000,653200,', '653200', '2016-01-25 14:31:35', '皮山县', '新疆和田地区皮山县');
INSERT INTO `t_system_area` VALUES ('653224', ',650000,653200,', '653200', '2016-01-25 14:31:35', '洛浦县', '新疆和田地区洛浦县');
INSERT INTO `t_system_area` VALUES ('653225', ',650000,653200,', '653200', '2016-01-25 14:31:35', '策勒县', '新疆和田地区策勒县');
INSERT INTO `t_system_area` VALUES ('653226', ',650000,653200,', '653200', '2016-01-25 14:31:35', '于田县', '新疆和田地区于田县');
INSERT INTO `t_system_area` VALUES ('653227', ',650000,653200,', '653200', '2016-01-25 14:31:35', '民丰县', '新疆和田地区民丰县');
INSERT INTO `t_system_area` VALUES ('653228', ',650000,653200,', '653200', '2016-01-25 14:31:35', '其它区', '新疆和田地区其它区');
INSERT INTO `t_system_area` VALUES ('654000', ',650000,', '650000', '2016-01-25 14:31:35', '伊犁哈萨克自治州', '新疆伊犁哈萨克自治州');
INSERT INTO `t_system_area` VALUES ('654002', ',650000,654000,', '654000', '2016-01-25 14:31:35', '伊宁市', '新疆伊犁哈萨克自治州伊宁市');
INSERT INTO `t_system_area` VALUES ('654003', ',650000,654000,', '654000', '2016-01-25 14:31:35', '奎屯市', '新疆伊犁哈萨克自治州奎屯市');
INSERT INTO `t_system_area` VALUES ('654021', ',650000,654000,', '654000', '2016-01-25 14:31:35', '伊宁县', '新疆伊犁哈萨克自治州伊宁县');
INSERT INTO `t_system_area` VALUES ('654022', ',650000,654000,', '654000', '2016-01-25 14:31:35', '察布查尔锡伯自治县', '新疆伊犁哈萨克自治州察布查尔锡伯自治县');
INSERT INTO `t_system_area` VALUES ('654023', ',650000,654000,', '654000', '2016-01-25 14:31:35', '霍城县', '新疆伊犁哈萨克自治州霍城县');
INSERT INTO `t_system_area` VALUES ('654024', ',650000,654000,', '654000', '2016-01-25 14:31:35', '巩留县', '新疆伊犁哈萨克自治州巩留县');
INSERT INTO `t_system_area` VALUES ('654025', ',650000,654000,', '654000', '2016-01-25 14:31:35', '新源县', '新疆伊犁哈萨克自治州新源县');
INSERT INTO `t_system_area` VALUES ('654026', ',650000,654000,', '654000', '2016-01-25 14:31:35', '昭苏县', '新疆伊犁哈萨克自治州昭苏县');
INSERT INTO `t_system_area` VALUES ('654027', ',650000,654000,', '654000', '2016-01-25 14:31:35', '特克斯县', '新疆伊犁哈萨克自治州特克斯县');
INSERT INTO `t_system_area` VALUES ('654028', ',650000,654000,', '654000', '2016-01-25 14:31:35', '尼勒克县', '新疆伊犁哈萨克自治州尼勒克县');
INSERT INTO `t_system_area` VALUES ('654029', ',650000,654000,', '654000', '2016-01-25 14:31:35', '其它区', '新疆伊犁哈萨克自治州其它区');
INSERT INTO `t_system_area` VALUES ('654200', ',650000,', '650000', '2016-01-25 14:31:35', '塔城地区', '新疆塔城地区');
INSERT INTO `t_system_area` VALUES ('654201', ',650000,654200,', '654200', '2016-01-25 14:31:35', '塔城市', '新疆塔城地区塔城市');
INSERT INTO `t_system_area` VALUES ('654202', ',650000,654200,', '654200', '2016-01-25 14:31:35', '乌苏市', '新疆塔城地区乌苏市');
INSERT INTO `t_system_area` VALUES ('654221', ',650000,654200,', '654200', '2016-01-25 14:31:35', '额敏县', '新疆塔城地区额敏县');
INSERT INTO `t_system_area` VALUES ('654223', ',650000,654200,', '654200', '2016-01-25 14:31:35', '沙湾县', '新疆塔城地区沙湾县');
INSERT INTO `t_system_area` VALUES ('654224', ',650000,654200,', '654200', '2016-01-25 14:31:35', '托里县', '新疆塔城地区托里县');
INSERT INTO `t_system_area` VALUES ('654225', ',650000,654200,', '654200', '2016-01-25 14:31:35', '裕民县', '新疆塔城地区裕民县');
INSERT INTO `t_system_area` VALUES ('654226', ',650000,654200,', '654200', '2016-01-25 14:31:35', '和布克赛尔蒙古自治县', '新疆塔城地区和布克赛尔蒙古自治县');
INSERT INTO `t_system_area` VALUES ('654227', ',650000,654200,', '654200', '2016-01-25 14:31:35', '其它区', '新疆塔城地区其它区');
INSERT INTO `t_system_area` VALUES ('654300', ',650000,', '650000', '2016-01-25 14:31:35', '阿勒泰地区', '新疆阿勒泰地区');
INSERT INTO `t_system_area` VALUES ('654301', ',650000,654300,', '654300', '2016-01-25 14:31:35', '阿勒泰市', '新疆阿勒泰地区阿勒泰市');
INSERT INTO `t_system_area` VALUES ('654321', ',650000,654300,', '654300', '2016-01-25 14:31:35', '布尔津县', '新疆阿勒泰地区布尔津县');
INSERT INTO `t_system_area` VALUES ('654322', ',650000,654300,', '654300', '2016-01-25 14:31:35', '富蕴县', '新疆阿勒泰地区富蕴县');
INSERT INTO `t_system_area` VALUES ('654323', ',650000,654300,', '654300', '2016-01-25 14:31:35', '福海县', '新疆阿勒泰地区福海县');
INSERT INTO `t_system_area` VALUES ('654324', ',650000,654300,', '654300', '2016-01-25 14:31:35', '哈巴河县', '新疆阿勒泰地区哈巴河县');
INSERT INTO `t_system_area` VALUES ('654325', ',650000,654300,', '654300', '2016-01-25 14:31:35', '青河县', '新疆阿勒泰地区青河县');
INSERT INTO `t_system_area` VALUES ('654326', ',650000,654300,', '654300', '2016-01-25 14:31:35', '吉木乃县', '新疆阿勒泰地区吉木乃县');
INSERT INTO `t_system_area` VALUES ('654327', ',650000,654300,', '654300', '2016-01-25 14:31:35', '其它区', '新疆阿勒泰地区其它区');
INSERT INTO `t_system_area` VALUES ('659001', ',650000,', '650000', '2016-01-25 14:31:35', '石河子市', '新疆石河子市');
INSERT INTO `t_system_area` VALUES ('659002', ',650000,', '650000', '2016-01-25 14:31:35', '阿拉尔市', '新疆阿拉尔市');
INSERT INTO `t_system_area` VALUES ('659003', ',650000,', '650000', '2016-01-25 14:31:35', '图木舒克市', '新疆图木舒克市');
INSERT INTO `t_system_area` VALUES ('659004', ',650000,', '650000', '2016-01-25 14:31:35', '五家渠市', '新疆五家渠市');
INSERT INTO `t_system_area` VALUES ('710000', ',', null, '2016-01-25 14:31:35', '台湾', '台湾');
INSERT INTO `t_system_area` VALUES ('710100', ',710000,', '710000', '2016-01-25 14:31:35', '台北市', '台湾台北市');
INSERT INTO `t_system_area` VALUES ('710101', ',710000,710100,', '710100', '2016-01-25 14:31:35', '中正区', '台湾台北市中正区');
INSERT INTO `t_system_area` VALUES ('710102', ',710000,710100,', '710100', '2016-01-25 14:31:35', '大同区', '台湾台北市大同区');
INSERT INTO `t_system_area` VALUES ('710103', ',710000,710100,', '710100', '2016-01-25 14:31:35', '中山区', '台湾台北市中山区');
INSERT INTO `t_system_area` VALUES ('710104', ',710000,710100,', '710100', '2016-01-25 14:31:35', '松山区', '台湾台北市松山区');
INSERT INTO `t_system_area` VALUES ('710105', ',710000,710100,', '710100', '2016-01-25 14:31:35', '大安区', '台湾台北市大安区');
INSERT INTO `t_system_area` VALUES ('710106', ',710000,710100,', '710100', '2016-01-25 14:31:35', '万华区', '台湾台北市万华区');
INSERT INTO `t_system_area` VALUES ('710107', ',710000,710100,', '710100', '2016-01-25 14:31:35', '信义区', '台湾台北市信义区');
INSERT INTO `t_system_area` VALUES ('710108', ',710000,710100,', '710100', '2016-01-25 14:31:35', '士林区', '台湾台北市士林区');
INSERT INTO `t_system_area` VALUES ('710109', ',710000,710100,', '710100', '2016-01-25 14:31:35', '北投区', '台湾台北市北投区');
INSERT INTO `t_system_area` VALUES ('710110', ',710000,710100,', '710100', '2016-01-25 14:31:36', '内湖区', '台湾台北市内湖区');
INSERT INTO `t_system_area` VALUES ('710111', ',710000,710100,', '710100', '2016-01-25 14:31:36', '南港区', '台湾台北市南港区');
INSERT INTO `t_system_area` VALUES ('710112', ',710000,710100,', '710100', '2016-01-25 14:31:36', '文山区', '台湾台北市文山区');
INSERT INTO `t_system_area` VALUES ('710113', ',710000,710100,', '710100', '2016-01-25 14:31:36', '其它区', '台湾台北市其它区');
INSERT INTO `t_system_area` VALUES ('710200', ',710000,', '710000', '2016-01-25 14:31:36', '高雄市', '台湾高雄市');
INSERT INTO `t_system_area` VALUES ('710201', ',710000,710200,', '710200', '2016-01-25 14:31:36', '新兴区', '台湾高雄市新兴区');
INSERT INTO `t_system_area` VALUES ('710202', ',710000,710200,', '710200', '2016-01-25 14:31:36', '前金区', '台湾高雄市前金区');
INSERT INTO `t_system_area` VALUES ('710203', ',710000,710200,', '710200', '2016-01-25 14:31:36', '芩雅区', '台湾高雄市芩雅区');
INSERT INTO `t_system_area` VALUES ('710204', ',710000,710200,', '710200', '2016-01-25 14:31:36', '盐埕区', '台湾高雄市盐埕区');
INSERT INTO `t_system_area` VALUES ('710205', ',710000,710200,', '710200', '2016-01-25 14:31:36', '鼓山区', '台湾高雄市鼓山区');
INSERT INTO `t_system_area` VALUES ('710206', ',710000,710200,', '710200', '2016-01-25 14:31:36', '旗津区', '台湾高雄市旗津区');
INSERT INTO `t_system_area` VALUES ('710207', ',710000,710200,', '710200', '2016-01-25 14:31:36', '前镇区', '台湾高雄市前镇区');
INSERT INTO `t_system_area` VALUES ('710208', ',710000,710200,', '710200', '2016-01-25 14:31:36', '三民区', '台湾高雄市三民区');
INSERT INTO `t_system_area` VALUES ('710209', ',710000,710200,', '710200', '2016-01-25 14:31:36', '左营区', '台湾高雄市左营区');
INSERT INTO `t_system_area` VALUES ('710210', ',710000,710200,', '710200', '2016-01-25 14:31:36', '楠梓区', '台湾高雄市楠梓区');
INSERT INTO `t_system_area` VALUES ('710211', ',710000,710200,', '710200', '2016-01-25 14:31:36', '小港区', '台湾高雄市小港区');
INSERT INTO `t_system_area` VALUES ('710212', ',710000,710200,', '710200', '2016-01-25 14:31:36', '其它区', '台湾高雄市其它区');
INSERT INTO `t_system_area` VALUES ('710241', ',710000,710200,', '710200', '2016-01-25 14:31:36', '苓雅区', '台湾高雄市苓雅区');
INSERT INTO `t_system_area` VALUES ('710242', ',710000,710200,', '710200', '2016-01-25 14:31:36', '仁武区', '台湾高雄市仁武区');
INSERT INTO `t_system_area` VALUES ('710243', ',710000,710200,', '710200', '2016-01-25 14:31:36', '大社区', '台湾高雄市大社区');
INSERT INTO `t_system_area` VALUES ('710244', ',710000,710200,', '710200', '2016-01-25 14:31:36', '冈山区', '台湾高雄市冈山区');
INSERT INTO `t_system_area` VALUES ('710245', ',710000,710200,', '710200', '2016-01-25 14:31:36', '路竹区', '台湾高雄市路竹区');
INSERT INTO `t_system_area` VALUES ('710246', ',710000,710200,', '710200', '2016-01-25 14:31:36', '阿莲区', '台湾高雄市阿莲区');
INSERT INTO `t_system_area` VALUES ('710247', ',710000,710200,', '710200', '2016-01-25 14:31:36', '田寮区', '台湾高雄市田寮区');
INSERT INTO `t_system_area` VALUES ('710248', ',710000,710200,', '710200', '2016-01-25 14:31:36', '燕巢区', '台湾高雄市燕巢区');
INSERT INTO `t_system_area` VALUES ('710249', ',710000,710200,', '710200', '2016-01-25 14:31:36', '桥头区', '台湾高雄市桥头区');
INSERT INTO `t_system_area` VALUES ('710250', ',710000,710200,', '710200', '2016-01-25 14:31:36', '梓官区', '台湾高雄市梓官区');
INSERT INTO `t_system_area` VALUES ('710251', ',710000,710200,', '710200', '2016-01-25 14:31:36', '弥陀区', '台湾高雄市弥陀区');
INSERT INTO `t_system_area` VALUES ('710252', ',710000,710200,', '710200', '2016-01-25 14:31:36', '永安区', '台湾高雄市永安区');
INSERT INTO `t_system_area` VALUES ('710253', ',710000,710200,', '710200', '2016-01-25 14:31:36', '湖内区', '台湾高雄市湖内区');
INSERT INTO `t_system_area` VALUES ('710254', ',710000,710200,', '710200', '2016-01-25 14:31:36', '凤山区', '台湾高雄市凤山区');
INSERT INTO `t_system_area` VALUES ('710255', ',710000,710200,', '710200', '2016-01-25 14:31:36', '大寮区', '台湾高雄市大寮区');
INSERT INTO `t_system_area` VALUES ('710256', ',710000,710200,', '710200', '2016-01-25 14:31:36', '林园区', '台湾高雄市林园区');
INSERT INTO `t_system_area` VALUES ('710257', ',710000,710200,', '710200', '2016-01-25 14:31:36', '鸟松区', '台湾高雄市鸟松区');
INSERT INTO `t_system_area` VALUES ('710258', ',710000,710200,', '710200', '2016-01-25 14:31:36', '大树区', '台湾高雄市大树区');
INSERT INTO `t_system_area` VALUES ('710259', ',710000,710200,', '710200', '2016-01-25 14:31:36', '旗山区', '台湾高雄市旗山区');
INSERT INTO `t_system_area` VALUES ('710260', ',710000,710200,', '710200', '2016-01-25 14:31:36', '美浓区', '台湾高雄市美浓区');
INSERT INTO `t_system_area` VALUES ('710261', ',710000,710200,', '710200', '2016-01-25 14:31:36', '六龟区', '台湾高雄市六龟区');
INSERT INTO `t_system_area` VALUES ('710262', ',710000,710200,', '710200', '2016-01-25 14:31:36', '内门区', '台湾高雄市内门区');
INSERT INTO `t_system_area` VALUES ('710263', ',710000,710200,', '710200', '2016-01-25 14:31:36', '杉林区', '台湾高雄市杉林区');
INSERT INTO `t_system_area` VALUES ('710264', ',710000,710200,', '710200', '2016-01-25 14:31:36', '甲仙区', '台湾高雄市甲仙区');
INSERT INTO `t_system_area` VALUES ('710265', ',710000,710200,', '710200', '2016-01-25 14:31:36', '桃源区', '台湾高雄市桃源区');
INSERT INTO `t_system_area` VALUES ('710266', ',710000,710200,', '710200', '2016-01-25 14:31:36', '那玛夏区', '台湾高雄市那玛夏区');
INSERT INTO `t_system_area` VALUES ('710267', ',710000,710200,', '710200', '2016-01-25 14:31:36', '茂林区', '台湾高雄市茂林区');
INSERT INTO `t_system_area` VALUES ('710268', ',710000,710200,', '710200', '2016-01-25 14:31:36', '茄萣区', '台湾高雄市茄萣区');
INSERT INTO `t_system_area` VALUES ('710300', ',710000,', '710000', '2016-01-25 14:31:36', '台南市', '台湾台南市');
INSERT INTO `t_system_area` VALUES ('710301', ',710000,710300,', '710300', '2016-01-25 14:31:36', '中西区', '台湾台南市中西区');
INSERT INTO `t_system_area` VALUES ('710302', ',710000,710300,', '710300', '2016-01-25 14:31:36', '东区', '台湾台南市东区');
INSERT INTO `t_system_area` VALUES ('710303', ',710000,710300,', '710300', '2016-01-25 14:31:36', '南区', '台湾台南市南区');
INSERT INTO `t_system_area` VALUES ('710304', ',710000,710300,', '710300', '2016-01-25 14:31:36', '北区', '台湾台南市北区');
INSERT INTO `t_system_area` VALUES ('710305', ',710000,710300,', '710300', '2016-01-25 14:31:36', '安平区', '台湾台南市安平区');
INSERT INTO `t_system_area` VALUES ('710306', ',710000,710300,', '710300', '2016-01-25 14:31:36', '安南区', '台湾台南市安南区');
INSERT INTO `t_system_area` VALUES ('710307', ',710000,710300,', '710300', '2016-01-25 14:31:36', '其它区', '台湾台南市其它区');
INSERT INTO `t_system_area` VALUES ('710339', ',710000,710300,', '710300', '2016-01-25 14:31:36', '永康区', '台湾台南市永康区');
INSERT INTO `t_system_area` VALUES ('710340', ',710000,710300,', '710300', '2016-01-25 14:31:36', '归仁区', '台湾台南市归仁区');
INSERT INTO `t_system_area` VALUES ('710341', ',710000,710300,', '710300', '2016-01-25 14:31:36', '新化区', '台湾台南市新化区');
INSERT INTO `t_system_area` VALUES ('710342', ',710000,710300,', '710300', '2016-01-25 14:31:36', '左镇区', '台湾台南市左镇区');
INSERT INTO `t_system_area` VALUES ('710343', ',710000,710300,', '710300', '2016-01-25 14:31:36', '玉井区', '台湾台南市玉井区');
INSERT INTO `t_system_area` VALUES ('710344', ',710000,710300,', '710300', '2016-01-25 14:31:36', '楠西区', '台湾台南市楠西区');
INSERT INTO `t_system_area` VALUES ('710345', ',710000,710300,', '710300', '2016-01-25 14:31:36', '南化区', '台湾台南市南化区');
INSERT INTO `t_system_area` VALUES ('710346', ',710000,710300,', '710300', '2016-01-25 14:31:36', '仁德区', '台湾台南市仁德区');
INSERT INTO `t_system_area` VALUES ('710347', ',710000,710300,', '710300', '2016-01-25 14:31:36', '关庙区', '台湾台南市关庙区');
INSERT INTO `t_system_area` VALUES ('710348', ',710000,710300,', '710300', '2016-01-25 14:31:36', '龙崎区', '台湾台南市龙崎区');
INSERT INTO `t_system_area` VALUES ('710349', ',710000,710300,', '710300', '2016-01-25 14:31:36', '官田区', '台湾台南市官田区');
INSERT INTO `t_system_area` VALUES ('710350', ',710000,710300,', '710300', '2016-01-25 14:31:36', '麻豆区', '台湾台南市麻豆区');
INSERT INTO `t_system_area` VALUES ('710351', ',710000,710300,', '710300', '2016-01-25 14:31:36', '佳里区', '台湾台南市佳里区');
INSERT INTO `t_system_area` VALUES ('710352', ',710000,710300,', '710300', '2016-01-25 14:31:36', '西港区', '台湾台南市西港区');
INSERT INTO `t_system_area` VALUES ('710353', ',710000,710300,', '710300', '2016-01-25 14:31:36', '七股区', '台湾台南市七股区');
INSERT INTO `t_system_area` VALUES ('710354', ',710000,710300,', '710300', '2016-01-25 14:31:36', '将军区', '台湾台南市将军区');
INSERT INTO `t_system_area` VALUES ('710355', ',710000,710300,', '710300', '2016-01-25 14:31:36', '学甲区', '台湾台南市学甲区');
INSERT INTO `t_system_area` VALUES ('710356', ',710000,710300,', '710300', '2016-01-25 14:31:36', '北门区', '台湾台南市北门区');
INSERT INTO `t_system_area` VALUES ('710357', ',710000,710300,', '710300', '2016-01-25 14:31:36', '新营区', '台湾台南市新营区');
INSERT INTO `t_system_area` VALUES ('710358', ',710000,710300,', '710300', '2016-01-25 14:31:36', '后壁区', '台湾台南市后壁区');
INSERT INTO `t_system_area` VALUES ('710359', ',710000,710300,', '710300', '2016-01-25 14:31:36', '白河区', '台湾台南市白河区');
INSERT INTO `t_system_area` VALUES ('710360', ',710000,710300,', '710300', '2016-01-25 14:31:36', '东山区', '台湾台南市东山区');
INSERT INTO `t_system_area` VALUES ('710361', ',710000,710300,', '710300', '2016-01-25 14:31:36', '六甲区', '台湾台南市六甲区');
INSERT INTO `t_system_area` VALUES ('710362', ',710000,710300,', '710300', '2016-01-25 14:31:36', '下营区', '台湾台南市下营区');
INSERT INTO `t_system_area` VALUES ('710363', ',710000,710300,', '710300', '2016-01-25 14:31:36', '柳营区', '台湾台南市柳营区');
INSERT INTO `t_system_area` VALUES ('710364', ',710000,710300,', '710300', '2016-01-25 14:31:36', '盐水区', '台湾台南市盐水区');
INSERT INTO `t_system_area` VALUES ('710365', ',710000,710300,', '710300', '2016-01-25 14:31:36', '善化区', '台湾台南市善化区');
INSERT INTO `t_system_area` VALUES ('710366', ',710000,710300,', '710300', '2016-01-25 14:31:36', '大内区', '台湾台南市大内区');
INSERT INTO `t_system_area` VALUES ('710367', ',710000,710300,', '710300', '2016-01-25 14:31:36', '山上区', '台湾台南市山上区');
INSERT INTO `t_system_area` VALUES ('710368', ',710000,710300,', '710300', '2016-01-25 14:31:36', '新市区', '台湾台南市新市区');
INSERT INTO `t_system_area` VALUES ('710369', ',710000,710300,', '710300', '2016-01-25 14:31:36', '安定区', '台湾台南市安定区');
INSERT INTO `t_system_area` VALUES ('710400', ',710000,', '710000', '2016-01-25 14:31:36', '台中市', '台湾台中市');
INSERT INTO `t_system_area` VALUES ('710401', ',710000,710400,', '710400', '2016-01-25 14:31:36', '中区', '台湾台中市中区');
INSERT INTO `t_system_area` VALUES ('710402', ',710000,710400,', '710400', '2016-01-25 14:31:36', '东区', '台湾台中市东区');
INSERT INTO `t_system_area` VALUES ('710403', ',710000,710400,', '710400', '2016-01-25 14:31:36', '南区', '台湾台中市南区');
INSERT INTO `t_system_area` VALUES ('710404', ',710000,710400,', '710400', '2016-01-25 14:31:36', '西区', '台湾台中市西区');
INSERT INTO `t_system_area` VALUES ('710405', ',710000,710400,', '710400', '2016-01-25 14:31:36', '北区', '台湾台中市北区');
INSERT INTO `t_system_area` VALUES ('710406', ',710000,710400,', '710400', '2016-01-25 14:31:36', '北屯区', '台湾台中市北屯区');
INSERT INTO `t_system_area` VALUES ('710407', ',710000,710400,', '710400', '2016-01-25 14:31:36', '西屯区', '台湾台中市西屯区');
INSERT INTO `t_system_area` VALUES ('710408', ',710000,710400,', '710400', '2016-01-25 14:31:36', '南屯区', '台湾台中市南屯区');
INSERT INTO `t_system_area` VALUES ('710409', ',710000,710400,', '710400', '2016-01-25 14:31:36', '其它区', '台湾台中市其它区');
INSERT INTO `t_system_area` VALUES ('710431', ',710000,710400,', '710400', '2016-01-25 14:31:36', '太平区', '台湾台中市太平区');
INSERT INTO `t_system_area` VALUES ('710432', ',710000,710400,', '710400', '2016-01-25 14:31:36', '大里区', '台湾台中市大里区');
INSERT INTO `t_system_area` VALUES ('710433', ',710000,710400,', '710400', '2016-01-25 14:31:36', '雾峰区', '台湾台中市雾峰区');
INSERT INTO `t_system_area` VALUES ('710434', ',710000,710400,', '710400', '2016-01-25 14:31:36', '乌日区', '台湾台中市乌日区');
INSERT INTO `t_system_area` VALUES ('710435', ',710000,710400,', '710400', '2016-01-25 14:31:36', '丰原区', '台湾台中市丰原区');
INSERT INTO `t_system_area` VALUES ('710436', ',710000,710400,', '710400', '2016-01-25 14:31:36', '后里区', '台湾台中市后里区');
INSERT INTO `t_system_area` VALUES ('710437', ',710000,710400,', '710400', '2016-01-25 14:31:36', '石冈区', '台湾台中市石冈区');
INSERT INTO `t_system_area` VALUES ('710438', ',710000,710400,', '710400', '2016-01-25 14:31:36', '东势区', '台湾台中市东势区');
INSERT INTO `t_system_area` VALUES ('710439', ',710000,710400,', '710400', '2016-01-25 14:31:36', '和平区', '台湾台中市和平区');
INSERT INTO `t_system_area` VALUES ('710440', ',710000,710400,', '710400', '2016-01-25 14:31:36', '新社区', '台湾台中市新社区');
INSERT INTO `t_system_area` VALUES ('710441', ',710000,710400,', '710400', '2016-01-25 14:31:36', '潭子区', '台湾台中市潭子区');
INSERT INTO `t_system_area` VALUES ('710442', ',710000,710400,', '710400', '2016-01-25 14:31:36', '大雅区', '台湾台中市大雅区');
INSERT INTO `t_system_area` VALUES ('710443', ',710000,710400,', '710400', '2016-01-25 14:31:36', '神冈区', '台湾台中市神冈区');
INSERT INTO `t_system_area` VALUES ('710444', ',710000,710400,', '710400', '2016-01-25 14:31:36', '大肚区', '台湾台中市大肚区');
INSERT INTO `t_system_area` VALUES ('710445', ',710000,710400,', '710400', '2016-01-25 14:31:36', '沙鹿区', '台湾台中市沙鹿区');
INSERT INTO `t_system_area` VALUES ('710446', ',710000,710400,', '710400', '2016-01-25 14:31:37', '龙井区', '台湾台中市龙井区');
INSERT INTO `t_system_area` VALUES ('710447', ',710000,710400,', '710400', '2016-01-25 14:31:37', '梧栖区', '台湾台中市梧栖区');
INSERT INTO `t_system_area` VALUES ('710448', ',710000,710400,', '710400', '2016-01-25 14:31:37', '清水区', '台湾台中市清水区');
INSERT INTO `t_system_area` VALUES ('710449', ',710000,710400,', '710400', '2016-01-25 14:31:37', '大甲区', '台湾台中市大甲区');
INSERT INTO `t_system_area` VALUES ('710450', ',710000,710400,', '710400', '2016-01-25 14:31:37', '外埔区', '台湾台中市外埔区');
INSERT INTO `t_system_area` VALUES ('710451', ',710000,710400,', '710400', '2016-01-25 14:31:37', '大安区', '台湾台中市大安区');
INSERT INTO `t_system_area` VALUES ('710500', ',710000,', '710000', '2016-01-25 14:31:37', '金门县', '台湾金门县');
INSERT INTO `t_system_area` VALUES ('710507', ',710000,710500,', '710500', '2016-01-25 14:31:37', '金沙镇', '台湾金门县金沙镇');
INSERT INTO `t_system_area` VALUES ('710508', ',710000,710500,', '710500', '2016-01-25 14:31:37', '金湖镇', '台湾金门县金湖镇');
INSERT INTO `t_system_area` VALUES ('710509', ',710000,710500,', '710500', '2016-01-25 14:31:37', '金宁乡', '台湾金门县金宁乡');
INSERT INTO `t_system_area` VALUES ('710510', ',710000,710500,', '710500', '2016-01-25 14:31:37', '金城镇', '台湾金门县金城镇');
INSERT INTO `t_system_area` VALUES ('710511', ',710000,710500,', '710500', '2016-01-25 14:31:37', '烈屿乡', '台湾金门县烈屿乡');
INSERT INTO `t_system_area` VALUES ('710512', ',710000,710500,', '710500', '2016-01-25 14:31:37', '乌坵乡', '台湾金门县乌坵乡');
INSERT INTO `t_system_area` VALUES ('710600', ',710000,', '710000', '2016-01-25 14:31:37', '南投县', '台湾南投县');
INSERT INTO `t_system_area` VALUES ('710614', ',710000,710600,', '710600', '2016-01-25 14:31:37', '南投市', '台湾南投县南投市');
INSERT INTO `t_system_area` VALUES ('710615', ',710000,710600,', '710600', '2016-01-25 14:31:37', '中寮乡', '台湾南投县中寮乡');
INSERT INTO `t_system_area` VALUES ('710616', ',710000,710600,', '710600', '2016-01-25 14:31:37', '草屯镇', '台湾南投县草屯镇');
INSERT INTO `t_system_area` VALUES ('710617', ',710000,710600,', '710600', '2016-01-25 14:31:37', '国姓乡', '台湾南投县国姓乡');
INSERT INTO `t_system_area` VALUES ('710618', ',710000,710600,', '710600', '2016-01-25 14:31:37', '埔里镇', '台湾南投县埔里镇');
INSERT INTO `t_system_area` VALUES ('710619', ',710000,710600,', '710600', '2016-01-25 14:31:37', '仁爱乡', '台湾南投县仁爱乡');
INSERT INTO `t_system_area` VALUES ('710620', ',710000,710600,', '710600', '2016-01-25 14:31:37', '名间乡', '台湾南投县名间乡');
INSERT INTO `t_system_area` VALUES ('710621', ',710000,710600,', '710600', '2016-01-25 14:31:37', '集集镇', '台湾南投县集集镇');
INSERT INTO `t_system_area` VALUES ('710622', ',710000,710600,', '710600', '2016-01-25 14:31:37', '水里乡', '台湾南投县水里乡');
INSERT INTO `t_system_area` VALUES ('710623', ',710000,710600,', '710600', '2016-01-25 14:31:37', '鱼池乡', '台湾南投县鱼池乡');
INSERT INTO `t_system_area` VALUES ('710624', ',710000,710600,', '710600', '2016-01-25 14:31:37', '信义乡', '台湾南投县信义乡');
INSERT INTO `t_system_area` VALUES ('710625', ',710000,710600,', '710600', '2016-01-25 14:31:37', '竹山镇', '台湾南投县竹山镇');
INSERT INTO `t_system_area` VALUES ('710626', ',710000,710600,', '710600', '2016-01-25 14:31:37', '鹿谷乡', '台湾南投县鹿谷乡');
INSERT INTO `t_system_area` VALUES ('710700', ',710000,', '710000', '2016-01-25 14:31:37', '基隆市', '台湾基隆市');
INSERT INTO `t_system_area` VALUES ('710701', ',710000,710700,', '710700', '2016-01-25 14:31:37', '仁爱区', '台湾基隆市仁爱区');
INSERT INTO `t_system_area` VALUES ('710702', ',710000,710700,', '710700', '2016-01-25 14:31:37', '信义区', '台湾基隆市信义区');
INSERT INTO `t_system_area` VALUES ('710703', ',710000,710700,', '710700', '2016-01-25 14:31:37', '中正区', '台湾基隆市中正区');
INSERT INTO `t_system_area` VALUES ('710704', ',710000,710700,', '710700', '2016-01-25 14:31:37', '中山区', '台湾基隆市中山区');
INSERT INTO `t_system_area` VALUES ('710705', ',710000,710700,', '710700', '2016-01-25 14:31:37', '安乐区', '台湾基隆市安乐区');
INSERT INTO `t_system_area` VALUES ('710706', ',710000,710700,', '710700', '2016-01-25 14:31:37', '暖暖区', '台湾基隆市暖暖区');
INSERT INTO `t_system_area` VALUES ('710707', ',710000,710700,', '710700', '2016-01-25 14:31:37', '七堵区', '台湾基隆市七堵区');
INSERT INTO `t_system_area` VALUES ('710708', ',710000,710700,', '710700', '2016-01-25 14:31:37', '其它区', '台湾基隆市其它区');
INSERT INTO `t_system_area` VALUES ('710800', ',710000,', '710000', '2016-01-25 14:31:37', '新竹市', '台湾新竹市');
INSERT INTO `t_system_area` VALUES ('710801', ',710000,710800,', '710800', '2016-01-25 14:31:37', '东区', '台湾新竹市东区');
INSERT INTO `t_system_area` VALUES ('710802', ',710000,710800,', '710800', '2016-01-25 14:31:37', '北区', '台湾新竹市北区');
INSERT INTO `t_system_area` VALUES ('710803', ',710000,710800,', '710800', '2016-01-25 14:31:37', '香山区', '台湾新竹市香山区');
INSERT INTO `t_system_area` VALUES ('710804', ',710000,710800,', '710800', '2016-01-25 14:31:37', '其它区', '台湾新竹市其它区');
INSERT INTO `t_system_area` VALUES ('710900', ',710000,', '710000', '2016-01-25 14:31:37', '嘉义市', '台湾嘉义市');
INSERT INTO `t_system_area` VALUES ('710901', ',710000,710900,', '710900', '2016-01-25 14:31:37', '东区', '台湾嘉义市东区');
INSERT INTO `t_system_area` VALUES ('710902', ',710000,710900,', '710900', '2016-01-25 14:31:37', '西区', '台湾嘉义市西区');
INSERT INTO `t_system_area` VALUES ('710903', ',710000,710900,', '710900', '2016-01-25 14:31:37', '其它区', '台湾嘉义市其它区');
INSERT INTO `t_system_area` VALUES ('711100', ',710000,', '710000', '2016-01-25 14:31:37', '新北市', '台湾新北市');
INSERT INTO `t_system_area` VALUES ('711130', ',710000,711100,', '711100', '2016-01-25 14:31:37', '万里区', '台湾新北市万里区');
INSERT INTO `t_system_area` VALUES ('711131', ',710000,711100,', '711100', '2016-01-25 14:31:37', '金山区', '台湾新北市金山区');
INSERT INTO `t_system_area` VALUES ('711132', ',710000,711100,', '711100', '2016-01-25 14:31:37', '板桥区', '台湾新北市板桥区');
INSERT INTO `t_system_area` VALUES ('711133', ',710000,711100,', '711100', '2016-01-25 14:31:37', '汐止区', '台湾新北市汐止区');
INSERT INTO `t_system_area` VALUES ('711134', ',710000,711100,', '711100', '2016-01-25 14:31:37', '深坑区', '台湾新北市深坑区');
INSERT INTO `t_system_area` VALUES ('711135', ',710000,711100,', '711100', '2016-01-25 14:31:37', '石碇区', '台湾新北市石碇区');
INSERT INTO `t_system_area` VALUES ('711136', ',710000,711100,', '711100', '2016-01-25 14:31:37', '瑞芳区', '台湾新北市瑞芳区');
INSERT INTO `t_system_area` VALUES ('711137', ',710000,711100,', '711100', '2016-01-25 14:31:37', '平溪区', '台湾新北市平溪区');
INSERT INTO `t_system_area` VALUES ('711138', ',710000,711100,', '711100', '2016-01-25 14:31:37', '双溪区', '台湾新北市双溪区');
INSERT INTO `t_system_area` VALUES ('711139', ',710000,711100,', '711100', '2016-01-25 14:31:37', '贡寮区', '台湾新北市贡寮区');
INSERT INTO `t_system_area` VALUES ('711140', ',710000,711100,', '711100', '2016-01-25 14:31:37', '新店区', '台湾新北市新店区');
INSERT INTO `t_system_area` VALUES ('711141', ',710000,711100,', '711100', '2016-01-25 14:31:37', '坪林区', '台湾新北市坪林区');
INSERT INTO `t_system_area` VALUES ('711142', ',710000,711100,', '711100', '2016-01-25 14:31:37', '乌来区', '台湾新北市乌来区');
INSERT INTO `t_system_area` VALUES ('711143', ',710000,711100,', '711100', '2016-01-25 14:31:37', '永和区', '台湾新北市永和区');
INSERT INTO `t_system_area` VALUES ('711144', ',710000,711100,', '711100', '2016-01-25 14:31:37', '中和区', '台湾新北市中和区');
INSERT INTO `t_system_area` VALUES ('711145', ',710000,711100,', '711100', '2016-01-25 14:31:37', '土城区', '台湾新北市土城区');
INSERT INTO `t_system_area` VALUES ('711146', ',710000,711100,', '711100', '2016-01-25 14:31:37', '三峡区', '台湾新北市三峡区');
INSERT INTO `t_system_area` VALUES ('711147', ',710000,711100,', '711100', '2016-01-25 14:31:37', '树林区', '台湾新北市树林区');
INSERT INTO `t_system_area` VALUES ('711148', ',710000,711100,', '711100', '2016-01-25 14:31:37', '莺歌区', '台湾新北市莺歌区');
INSERT INTO `t_system_area` VALUES ('711149', ',710000,711100,', '711100', '2016-01-25 14:31:37', '三重区', '台湾新北市三重区');
INSERT INTO `t_system_area` VALUES ('711150', ',710000,711100,', '711100', '2016-01-25 14:31:37', '新庄区', '台湾新北市新庄区');
INSERT INTO `t_system_area` VALUES ('711151', ',710000,711100,', '711100', '2016-01-25 14:31:37', '泰山区', '台湾新北市泰山区');
INSERT INTO `t_system_area` VALUES ('711152', ',710000,711100,', '711100', '2016-01-25 14:31:37', '林口区', '台湾新北市林口区');
INSERT INTO `t_system_area` VALUES ('711153', ',710000,711100,', '711100', '2016-01-25 14:31:37', '芦洲区', '台湾新北市芦洲区');
INSERT INTO `t_system_area` VALUES ('711154', ',710000,711100,', '711100', '2016-01-25 14:31:37', '五股区', '台湾新北市五股区');
INSERT INTO `t_system_area` VALUES ('711155', ',710000,711100,', '711100', '2016-01-25 14:31:37', '八里区', '台湾新北市八里区');
INSERT INTO `t_system_area` VALUES ('711156', ',710000,711100,', '711100', '2016-01-25 14:31:37', '淡水区', '台湾新北市淡水区');
INSERT INTO `t_system_area` VALUES ('711157', ',710000,711100,', '711100', '2016-01-25 14:31:37', '三芝区', '台湾新北市三芝区');
INSERT INTO `t_system_area` VALUES ('711158', ',710000,711100,', '711100', '2016-01-25 14:31:37', '石门区', '台湾新北市石门区');
INSERT INTO `t_system_area` VALUES ('711200', ',710000,', '710000', '2016-01-25 14:31:37', '宜兰县', '台湾宜兰县');
INSERT INTO `t_system_area` VALUES ('711214', ',710000,711200,', '711200', '2016-01-25 14:31:37', '宜兰市', '台湾宜兰县宜兰市');
INSERT INTO `t_system_area` VALUES ('711215', ',710000,711200,', '711200', '2016-01-25 14:31:37', '头城镇', '台湾宜兰县头城镇');
INSERT INTO `t_system_area` VALUES ('711216', ',710000,711200,', '711200', '2016-01-25 14:31:37', '礁溪乡', '台湾宜兰县礁溪乡');
INSERT INTO `t_system_area` VALUES ('711217', ',710000,711200,', '711200', '2016-01-25 14:31:37', '壮围乡', '台湾宜兰县壮围乡');
INSERT INTO `t_system_area` VALUES ('711218', ',710000,711200,', '711200', '2016-01-25 14:31:37', '员山乡', '台湾宜兰县员山乡');
INSERT INTO `t_system_area` VALUES ('711219', ',710000,711200,', '711200', '2016-01-25 14:31:37', '罗东镇', '台湾宜兰县罗东镇');
INSERT INTO `t_system_area` VALUES ('711220', ',710000,711200,', '711200', '2016-01-25 14:31:37', '三星乡', '台湾宜兰县三星乡');
INSERT INTO `t_system_area` VALUES ('711221', ',710000,711200,', '711200', '2016-01-25 14:31:37', '大同乡', '台湾宜兰县大同乡');
INSERT INTO `t_system_area` VALUES ('711222', ',710000,711200,', '711200', '2016-01-25 14:31:37', '五结乡', '台湾宜兰县五结乡');
INSERT INTO `t_system_area` VALUES ('711223', ',710000,711200,', '711200', '2016-01-25 14:31:37', '冬山乡', '台湾宜兰县冬山乡');
INSERT INTO `t_system_area` VALUES ('711224', ',710000,711200,', '711200', '2016-01-25 14:31:37', '苏澳镇', '台湾宜兰县苏澳镇');
INSERT INTO `t_system_area` VALUES ('711225', ',710000,711200,', '711200', '2016-01-25 14:31:37', '南澳乡', '台湾宜兰县南澳乡');
INSERT INTO `t_system_area` VALUES ('711226', ',710000,711200,', '711200', '2016-01-25 14:31:37', '钓鱼台', '台湾宜兰县钓鱼台');
INSERT INTO `t_system_area` VALUES ('711300', ',710000,', '710000', '2016-01-25 14:31:37', '新竹县', '台湾新竹县');
INSERT INTO `t_system_area` VALUES ('711314', ',710000,711300,', '711300', '2016-01-25 14:31:37', '竹北市', '台湾新竹县竹北市');
INSERT INTO `t_system_area` VALUES ('711315', ',710000,711300,', '711300', '2016-01-25 14:31:37', '湖口乡', '台湾新竹县湖口乡');
INSERT INTO `t_system_area` VALUES ('711316', ',710000,711300,', '711300', '2016-01-25 14:31:37', '新丰乡', '台湾新竹县新丰乡');
INSERT INTO `t_system_area` VALUES ('711317', ',710000,711300,', '711300', '2016-01-25 14:31:37', '新埔镇', '台湾新竹县新埔镇');
INSERT INTO `t_system_area` VALUES ('711318', ',710000,711300,', '711300', '2016-01-25 14:31:37', '关西镇', '台湾新竹县关西镇');
INSERT INTO `t_system_area` VALUES ('711319', ',710000,711300,', '711300', '2016-01-25 14:31:37', '芎林乡', '台湾新竹县芎林乡');
INSERT INTO `t_system_area` VALUES ('711320', ',710000,711300,', '711300', '2016-01-25 14:31:37', '宝山乡', '台湾新竹县宝山乡');
INSERT INTO `t_system_area` VALUES ('711321', ',710000,711300,', '711300', '2016-01-25 14:31:37', '竹东镇', '台湾新竹县竹东镇');
INSERT INTO `t_system_area` VALUES ('711322', ',710000,711300,', '711300', '2016-01-25 14:31:37', '五峰乡', '台湾新竹县五峰乡');
INSERT INTO `t_system_area` VALUES ('711323', ',710000,711300,', '711300', '2016-01-25 14:31:37', '横山乡', '台湾新竹县横山乡');
INSERT INTO `t_system_area` VALUES ('711324', ',710000,711300,', '711300', '2016-01-25 14:31:37', '尖石乡', '台湾新竹县尖石乡');
INSERT INTO `t_system_area` VALUES ('711325', ',710000,711300,', '711300', '2016-01-25 14:31:37', '北埔乡', '台湾新竹县北埔乡');
INSERT INTO `t_system_area` VALUES ('711326', ',710000,711300,', '711300', '2016-01-25 14:31:37', '峨眉乡', '台湾新竹县峨眉乡');
INSERT INTO `t_system_area` VALUES ('711400', ',710000,', '710000', '2016-01-25 14:31:37', '桃园县', '台湾桃园县');
INSERT INTO `t_system_area` VALUES ('711414', ',710000,711400,', '711400', '2016-01-25 14:31:37', '中坜市', '台湾桃园县中坜市');
INSERT INTO `t_system_area` VALUES ('711415', ',710000,711400,', '711400', '2016-01-25 14:31:37', '平镇市', '台湾桃园县平镇市');
INSERT INTO `t_system_area` VALUES ('711416', ',710000,711400,', '711400', '2016-01-25 14:31:37', '龙潭乡', '台湾桃园县龙潭乡');
INSERT INTO `t_system_area` VALUES ('711417', ',710000,711400,', '711400', '2016-01-25 14:31:37', '杨梅市', '台湾桃园县杨梅市');
INSERT INTO `t_system_area` VALUES ('711418', ',710000,711400,', '711400', '2016-01-25 14:31:38', '新屋乡', '台湾桃园县新屋乡');
INSERT INTO `t_system_area` VALUES ('711419', ',710000,711400,', '711400', '2016-01-25 14:31:38', '观音乡', '台湾桃园县观音乡');
INSERT INTO `t_system_area` VALUES ('711420', ',710000,711400,', '711400', '2016-01-25 14:31:38', '桃园市', '台湾桃园县桃园市');
INSERT INTO `t_system_area` VALUES ('711421', ',710000,711400,', '711400', '2016-01-25 14:31:38', '龟山乡', '台湾桃园县龟山乡');
INSERT INTO `t_system_area` VALUES ('711422', ',710000,711400,', '711400', '2016-01-25 14:31:38', '八德市', '台湾桃园县八德市');
INSERT INTO `t_system_area` VALUES ('711423', ',710000,711400,', '711400', '2016-01-25 14:31:38', '大溪镇', '台湾桃园县大溪镇');
INSERT INTO `t_system_area` VALUES ('711424', ',710000,711400,', '711400', '2016-01-25 14:31:38', '复兴乡', '台湾桃园县复兴乡');
INSERT INTO `t_system_area` VALUES ('711425', ',710000,711400,', '711400', '2016-01-25 14:31:38', '大园乡', '台湾桃园县大园乡');
INSERT INTO `t_system_area` VALUES ('711426', ',710000,711400,', '711400', '2016-01-25 14:31:38', '芦竹乡', '台湾桃园县芦竹乡');
INSERT INTO `t_system_area` VALUES ('711500', ',710000,', '710000', '2016-01-25 14:31:38', '苗栗县', '台湾苗栗县');
INSERT INTO `t_system_area` VALUES ('711519', ',710000,711500,', '711500', '2016-01-25 14:31:38', '竹南镇', '台湾苗栗县竹南镇');
INSERT INTO `t_system_area` VALUES ('711520', ',710000,711500,', '711500', '2016-01-25 14:31:38', '头份镇', '台湾苗栗县头份镇');
INSERT INTO `t_system_area` VALUES ('711521', ',710000,711500,', '711500', '2016-01-25 14:31:38', '三湾乡', '台湾苗栗县三湾乡');
INSERT INTO `t_system_area` VALUES ('711522', ',710000,711500,', '711500', '2016-01-25 14:31:38', '南庄乡', '台湾苗栗县南庄乡');
INSERT INTO `t_system_area` VALUES ('711523', ',710000,711500,', '711500', '2016-01-25 14:31:38', '狮潭乡', '台湾苗栗县狮潭乡');
INSERT INTO `t_system_area` VALUES ('711524', ',710000,711500,', '711500', '2016-01-25 14:31:38', '后龙镇', '台湾苗栗县后龙镇');
INSERT INTO `t_system_area` VALUES ('711525', ',710000,711500,', '711500', '2016-01-25 14:31:38', '通霄镇', '台湾苗栗县通霄镇');
INSERT INTO `t_system_area` VALUES ('711526', ',710000,711500,', '711500', '2016-01-25 14:31:38', '苑里镇', '台湾苗栗县苑里镇');
INSERT INTO `t_system_area` VALUES ('711527', ',710000,711500,', '711500', '2016-01-25 14:31:38', '苗栗市', '台湾苗栗县苗栗市');
INSERT INTO `t_system_area` VALUES ('711528', ',710000,711500,', '711500', '2016-01-25 14:31:38', '造桥乡', '台湾苗栗县造桥乡');
INSERT INTO `t_system_area` VALUES ('711529', ',710000,711500,', '711500', '2016-01-25 14:31:38', '头屋乡', '台湾苗栗县头屋乡');
INSERT INTO `t_system_area` VALUES ('711530', ',710000,711500,', '711500', '2016-01-25 14:31:38', '公馆乡', '台湾苗栗县公馆乡');
INSERT INTO `t_system_area` VALUES ('711531', ',710000,711500,', '711500', '2016-01-25 14:31:38', '大湖乡', '台湾苗栗县大湖乡');
INSERT INTO `t_system_area` VALUES ('711532', ',710000,711500,', '711500', '2016-01-25 14:31:38', '泰安乡', '台湾苗栗县泰安乡');
INSERT INTO `t_system_area` VALUES ('711533', ',710000,711500,', '711500', '2016-01-25 14:31:38', '铜锣乡', '台湾苗栗县铜锣乡');
INSERT INTO `t_system_area` VALUES ('711534', ',710000,711500,', '711500', '2016-01-25 14:31:38', '三义乡', '台湾苗栗县三义乡');
INSERT INTO `t_system_area` VALUES ('711535', ',710000,711500,', '711500', '2016-01-25 14:31:38', '西湖乡', '台湾苗栗县西湖乡');
INSERT INTO `t_system_area` VALUES ('711536', ',710000,711500,', '711500', '2016-01-25 14:31:38', '卓兰镇', '台湾苗栗县卓兰镇');
INSERT INTO `t_system_area` VALUES ('711700', ',710000,', '710000', '2016-01-25 14:31:38', '彰化县', '台湾彰化县');
INSERT INTO `t_system_area` VALUES ('711727', ',710000,711700,', '711700', '2016-01-25 14:31:38', '彰化市', '台湾彰化县彰化市');
INSERT INTO `t_system_area` VALUES ('711728', ',710000,711700,', '711700', '2016-01-25 14:31:38', '芬园乡', '台湾彰化县芬园乡');
INSERT INTO `t_system_area` VALUES ('711729', ',710000,711700,', '711700', '2016-01-25 14:31:38', '花坛乡', '台湾彰化县花坛乡');
INSERT INTO `t_system_area` VALUES ('711730', ',710000,711700,', '711700', '2016-01-25 14:31:38', '秀水乡', '台湾彰化县秀水乡');
INSERT INTO `t_system_area` VALUES ('711731', ',710000,711700,', '711700', '2016-01-25 14:31:38', '鹿港镇', '台湾彰化县鹿港镇');
INSERT INTO `t_system_area` VALUES ('711732', ',710000,711700,', '711700', '2016-01-25 14:31:38', '福兴乡', '台湾彰化县福兴乡');
INSERT INTO `t_system_area` VALUES ('711733', ',710000,711700,', '711700', '2016-01-25 14:31:38', '线西乡', '台湾彰化县线西乡');
INSERT INTO `t_system_area` VALUES ('711734', ',710000,711700,', '711700', '2016-01-25 14:31:38', '和美镇', '台湾彰化县和美镇');
INSERT INTO `t_system_area` VALUES ('711735', ',710000,711700,', '711700', '2016-01-25 14:31:38', '伸港乡', '台湾彰化县伸港乡');
INSERT INTO `t_system_area` VALUES ('711736', ',710000,711700,', '711700', '2016-01-25 14:31:38', '员林镇', '台湾彰化县员林镇');
INSERT INTO `t_system_area` VALUES ('711737', ',710000,711700,', '711700', '2016-01-25 14:31:38', '社头乡', '台湾彰化县社头乡');
INSERT INTO `t_system_area` VALUES ('711738', ',710000,711700,', '711700', '2016-01-25 14:31:38', '永靖乡', '台湾彰化县永靖乡');
INSERT INTO `t_system_area` VALUES ('711739', ',710000,711700,', '711700', '2016-01-25 14:31:38', '埔心乡', '台湾彰化县埔心乡');
INSERT INTO `t_system_area` VALUES ('711740', ',710000,711700,', '711700', '2016-01-25 14:31:38', '溪湖镇', '台湾彰化县溪湖镇');
INSERT INTO `t_system_area` VALUES ('711741', ',710000,711700,', '711700', '2016-01-25 14:31:38', '大村乡', '台湾彰化县大村乡');
INSERT INTO `t_system_area` VALUES ('711742', ',710000,711700,', '711700', '2016-01-25 14:31:38', '埔盐乡', '台湾彰化县埔盐乡');
INSERT INTO `t_system_area` VALUES ('711743', ',710000,711700,', '711700', '2016-01-25 14:31:38', '田中镇', '台湾彰化县田中镇');
INSERT INTO `t_system_area` VALUES ('711744', ',710000,711700,', '711700', '2016-01-25 14:31:38', '北斗镇', '台湾彰化县北斗镇');
INSERT INTO `t_system_area` VALUES ('711745', ',710000,711700,', '711700', '2016-01-25 14:31:38', '田尾乡', '台湾彰化县田尾乡');
INSERT INTO `t_system_area` VALUES ('711746', ',710000,711700,', '711700', '2016-01-25 14:31:38', '埤头乡', '台湾彰化县埤头乡');
INSERT INTO `t_system_area` VALUES ('711747', ',710000,711700,', '711700', '2016-01-25 14:31:38', '溪州乡', '台湾彰化县溪州乡');
INSERT INTO `t_system_area` VALUES ('711748', ',710000,711700,', '711700', '2016-01-25 14:31:38', '竹塘乡', '台湾彰化县竹塘乡');
INSERT INTO `t_system_area` VALUES ('711749', ',710000,711700,', '711700', '2016-01-25 14:31:38', '二林镇', '台湾彰化县二林镇');
INSERT INTO `t_system_area` VALUES ('711750', ',710000,711700,', '711700', '2016-01-25 14:31:38', '大城乡', '台湾彰化县大城乡');
INSERT INTO `t_system_area` VALUES ('711751', ',710000,711700,', '711700', '2016-01-25 14:31:38', '芳苑乡', '台湾彰化县芳苑乡');
INSERT INTO `t_system_area` VALUES ('711752', ',710000,711700,', '711700', '2016-01-25 14:31:38', '二水乡', '台湾彰化县二水乡');
INSERT INTO `t_system_area` VALUES ('711900', ',710000,', '710000', '2016-01-25 14:31:38', '嘉义县', '台湾嘉义县');
INSERT INTO `t_system_area` VALUES ('711919', ',710000,711900,', '711900', '2016-01-25 14:31:38', '番路乡', '台湾嘉义县番路乡');
INSERT INTO `t_system_area` VALUES ('711920', ',710000,711900,', '711900', '2016-01-25 14:31:38', '梅山乡', '台湾嘉义县梅山乡');
INSERT INTO `t_system_area` VALUES ('711921', ',710000,711900,', '711900', '2016-01-25 14:31:38', '竹崎乡', '台湾嘉义县竹崎乡');
INSERT INTO `t_system_area` VALUES ('711922', ',710000,711900,', '711900', '2016-01-25 14:31:38', '阿里山乡', '台湾嘉义县阿里山乡');
INSERT INTO `t_system_area` VALUES ('711923', ',710000,711900,', '711900', '2016-01-25 14:31:38', '中埔乡', '台湾嘉义县中埔乡');
INSERT INTO `t_system_area` VALUES ('711924', ',710000,711900,', '711900', '2016-01-25 14:31:38', '大埔乡', '台湾嘉义县大埔乡');
INSERT INTO `t_system_area` VALUES ('711925', ',710000,711900,', '711900', '2016-01-25 14:31:38', '水上乡', '台湾嘉义县水上乡');
INSERT INTO `t_system_area` VALUES ('711926', ',710000,711900,', '711900', '2016-01-25 14:31:38', '鹿草乡', '台湾嘉义县鹿草乡');
INSERT INTO `t_system_area` VALUES ('711927', ',710000,711900,', '711900', '2016-01-25 14:31:38', '太保市', '台湾嘉义县太保市');
INSERT INTO `t_system_area` VALUES ('711928', ',710000,711900,', '711900', '2016-01-25 14:31:38', '朴子市', '台湾嘉义县朴子市');
INSERT INTO `t_system_area` VALUES ('711929', ',710000,711900,', '711900', '2016-01-25 14:31:38', '东石乡', '台湾嘉义县东石乡');
INSERT INTO `t_system_area` VALUES ('711930', ',710000,711900,', '711900', '2016-01-25 14:31:38', '六脚乡', '台湾嘉义县六脚乡');
INSERT INTO `t_system_area` VALUES ('711931', ',710000,711900,', '711900', '2016-01-25 14:31:38', '新港乡', '台湾嘉义县新港乡');
INSERT INTO `t_system_area` VALUES ('711932', ',710000,711900,', '711900', '2016-01-25 14:31:38', '民雄乡', '台湾嘉义县民雄乡');
INSERT INTO `t_system_area` VALUES ('711933', ',710000,711900,', '711900', '2016-01-25 14:31:38', '大林镇', '台湾嘉义县大林镇');
INSERT INTO `t_system_area` VALUES ('711934', ',710000,711900,', '711900', '2016-01-25 14:31:38', '溪口乡', '台湾嘉义县溪口乡');
INSERT INTO `t_system_area` VALUES ('711935', ',710000,711900,', '711900', '2016-01-25 14:31:38', '义竹乡', '台湾嘉义县义竹乡');
INSERT INTO `t_system_area` VALUES ('711936', ',710000,711900,', '711900', '2016-01-25 14:31:38', '布袋镇', '台湾嘉义县布袋镇');
INSERT INTO `t_system_area` VALUES ('712100', ',710000,', '710000', '2016-01-25 14:31:38', '云林县', '台湾云林县');
INSERT INTO `t_system_area` VALUES ('712121', ',710000,712100,', '712100', '2016-01-25 14:31:38', '斗南镇', '台湾云林县斗南镇');
INSERT INTO `t_system_area` VALUES ('712122', ',710000,712100,', '712100', '2016-01-25 14:31:38', '大埤乡', '台湾云林县大埤乡');
INSERT INTO `t_system_area` VALUES ('712123', ',710000,712100,', '712100', '2016-01-25 14:31:38', '虎尾镇', '台湾云林县虎尾镇');
INSERT INTO `t_system_area` VALUES ('712124', ',710000,712100,', '712100', '2016-01-25 14:31:38', '土库镇', '台湾云林县土库镇');
INSERT INTO `t_system_area` VALUES ('712125', ',710000,712100,', '712100', '2016-01-25 14:31:38', '褒忠乡', '台湾云林县褒忠乡');
INSERT INTO `t_system_area` VALUES ('712126', ',710000,712100,', '712100', '2016-01-25 14:31:38', '东势乡', '台湾云林县东势乡');
INSERT INTO `t_system_area` VALUES ('712127', ',710000,712100,', '712100', '2016-01-25 14:31:38', '台西乡', '台湾云林县台西乡');
INSERT INTO `t_system_area` VALUES ('712128', ',710000,712100,', '712100', '2016-01-25 14:31:38', '仑背乡', '台湾云林县仑背乡');
INSERT INTO `t_system_area` VALUES ('712129', ',710000,712100,', '712100', '2016-01-25 14:31:38', '麦寮乡', '台湾云林县麦寮乡');
INSERT INTO `t_system_area` VALUES ('712130', ',710000,712100,', '712100', '2016-01-25 14:31:38', '斗六市', '台湾云林县斗六市');
INSERT INTO `t_system_area` VALUES ('712131', ',710000,712100,', '712100', '2016-01-25 14:31:38', '林内乡', '台湾云林县林内乡');
INSERT INTO `t_system_area` VALUES ('712132', ',710000,712100,', '712100', '2016-01-25 14:31:38', '古坑乡', '台湾云林县古坑乡');
INSERT INTO `t_system_area` VALUES ('712133', ',710000,712100,', '712100', '2016-01-25 14:31:38', '莿桐乡', '台湾云林县莿桐乡');
INSERT INTO `t_system_area` VALUES ('712134', ',710000,712100,', '712100', '2016-01-25 14:31:38', '西螺镇', '台湾云林县西螺镇');
INSERT INTO `t_system_area` VALUES ('712135', ',710000,712100,', '712100', '2016-01-25 14:31:38', '二仑乡', '台湾云林县二仑乡');
INSERT INTO `t_system_area` VALUES ('712136', ',710000,712100,', '712100', '2016-01-25 14:31:38', '北港镇', '台湾云林县北港镇');
INSERT INTO `t_system_area` VALUES ('712137', ',710000,712100,', '712100', '2016-01-25 14:31:38', '水林乡', '台湾云林县水林乡');
INSERT INTO `t_system_area` VALUES ('712138', ',710000,712100,', '712100', '2016-01-25 14:31:38', '口湖乡', '台湾云林县口湖乡');
INSERT INTO `t_system_area` VALUES ('712139', ',710000,712100,', '712100', '2016-01-25 14:31:38', '四湖乡', '台湾云林县四湖乡');
INSERT INTO `t_system_area` VALUES ('712140', ',710000,712100,', '712100', '2016-01-25 14:31:38', '元长乡', '台湾云林县元长乡');
INSERT INTO `t_system_area` VALUES ('712400', ',710000,', '710000', '2016-01-25 14:31:38', '屏东县', '台湾屏东县');
INSERT INTO `t_system_area` VALUES ('712434', ',710000,712400,', '712400', '2016-01-25 14:31:38', '屏东市', '台湾屏东县屏东市');
INSERT INTO `t_system_area` VALUES ('712435', ',710000,712400,', '712400', '2016-01-25 14:31:38', '三地门乡', '台湾屏东县三地门乡');
INSERT INTO `t_system_area` VALUES ('712436', ',710000,712400,', '712400', '2016-01-25 14:31:38', '雾台乡', '台湾屏东县雾台乡');
INSERT INTO `t_system_area` VALUES ('712437', ',710000,712400,', '712400', '2016-01-25 14:31:38', '玛家乡', '台湾屏东县玛家乡');
INSERT INTO `t_system_area` VALUES ('712438', ',710000,712400,', '712400', '2016-01-25 14:31:38', '九如乡', '台湾屏东县九如乡');
INSERT INTO `t_system_area` VALUES ('712439', ',710000,712400,', '712400', '2016-01-25 14:31:38', '里港乡', '台湾屏东县里港乡');
INSERT INTO `t_system_area` VALUES ('712440', ',710000,712400,', '712400', '2016-01-25 14:31:38', '高树乡', '台湾屏东县高树乡');
INSERT INTO `t_system_area` VALUES ('712441', ',710000,712400,', '712400', '2016-01-25 14:31:38', '盐埔乡', '台湾屏东县盐埔乡');
INSERT INTO `t_system_area` VALUES ('712442', ',710000,712400,', '712400', '2016-01-25 14:31:38', '长治乡', '台湾屏东县长治乡');
INSERT INTO `t_system_area` VALUES ('712443', ',710000,712400,', '712400', '2016-01-25 14:31:38', '麟洛乡', '台湾屏东县麟洛乡');
INSERT INTO `t_system_area` VALUES ('712444', ',710000,712400,', '712400', '2016-01-25 14:31:38', '竹田乡', '台湾屏东县竹田乡');
INSERT INTO `t_system_area` VALUES ('712445', ',710000,712400,', '712400', '2016-01-25 14:31:38', '内埔乡', '台湾屏东县内埔乡');
INSERT INTO `t_system_area` VALUES ('712446', ',710000,712400,', '712400', '2016-01-25 14:31:38', '万丹乡', '台湾屏东县万丹乡');
INSERT INTO `t_system_area` VALUES ('712447', ',710000,712400,', '712400', '2016-01-25 14:31:39', '潮州镇', '台湾屏东县潮州镇');
INSERT INTO `t_system_area` VALUES ('712448', ',710000,712400,', '712400', '2016-01-25 14:31:39', '泰武乡', '台湾屏东县泰武乡');
INSERT INTO `t_system_area` VALUES ('712449', ',710000,712400,', '712400', '2016-01-25 14:31:39', '来义乡', '台湾屏东县来义乡');
INSERT INTO `t_system_area` VALUES ('712450', ',710000,712400,', '712400', '2016-01-25 14:31:39', '万峦乡', '台湾屏东县万峦乡');
INSERT INTO `t_system_area` VALUES ('712451', ',710000,712400,', '712400', '2016-01-25 14:31:39', '崁顶乡', '台湾屏东县崁顶乡');
INSERT INTO `t_system_area` VALUES ('712452', ',710000,712400,', '712400', '2016-01-25 14:31:39', '新埤乡', '台湾屏东县新埤乡');
INSERT INTO `t_system_area` VALUES ('712453', ',710000,712400,', '712400', '2016-01-25 14:31:39', '南州乡', '台湾屏东县南州乡');
INSERT INTO `t_system_area` VALUES ('712454', ',710000,712400,', '712400', '2016-01-25 14:31:39', '林边乡', '台湾屏东县林边乡');
INSERT INTO `t_system_area` VALUES ('712455', ',710000,712400,', '712400', '2016-01-25 14:31:39', '东港镇', '台湾屏东县东港镇');
INSERT INTO `t_system_area` VALUES ('712456', ',710000,712400,', '712400', '2016-01-25 14:31:39', '琉球乡', '台湾屏东县琉球乡');
INSERT INTO `t_system_area` VALUES ('712457', ',710000,712400,', '712400', '2016-01-25 14:31:39', '佳冬乡', '台湾屏东县佳冬乡');
INSERT INTO `t_system_area` VALUES ('712458', ',710000,712400,', '712400', '2016-01-25 14:31:39', '新园乡', '台湾屏东县新园乡');
INSERT INTO `t_system_area` VALUES ('712459', ',710000,712400,', '712400', '2016-01-25 14:31:39', '枋寮乡', '台湾屏东县枋寮乡');
INSERT INTO `t_system_area` VALUES ('712460', ',710000,712400,', '712400', '2016-01-25 14:31:39', '枋山乡', '台湾屏东县枋山乡');
INSERT INTO `t_system_area` VALUES ('712461', ',710000,712400,', '712400', '2016-01-25 14:31:39', '春日乡', '台湾屏东县春日乡');
INSERT INTO `t_system_area` VALUES ('712462', ',710000,712400,', '712400', '2016-01-25 14:31:39', '狮子乡', '台湾屏东县狮子乡');
INSERT INTO `t_system_area` VALUES ('712463', ',710000,712400,', '712400', '2016-01-25 14:31:39', '车城乡', '台湾屏东县车城乡');
INSERT INTO `t_system_area` VALUES ('712464', ',710000,712400,', '712400', '2016-01-25 14:31:39', '牡丹乡', '台湾屏东县牡丹乡');
INSERT INTO `t_system_area` VALUES ('712465', ',710000,712400,', '712400', '2016-01-25 14:31:39', '恒春镇', '台湾屏东县恒春镇');
INSERT INTO `t_system_area` VALUES ('712466', ',710000,712400,', '712400', '2016-01-25 14:31:39', '满州乡', '台湾屏东县满州乡');
INSERT INTO `t_system_area` VALUES ('712500', ',710000,', '710000', '2016-01-25 14:31:39', '台东县', '台湾台东县');
INSERT INTO `t_system_area` VALUES ('712517', ',710000,712500,', '712500', '2016-01-25 14:31:39', '台东市', '台湾台东县台东市');
INSERT INTO `t_system_area` VALUES ('712518', ',710000,712500,', '712500', '2016-01-25 14:31:39', '绿岛乡', '台湾台东县绿岛乡');
INSERT INTO `t_system_area` VALUES ('712519', ',710000,712500,', '712500', '2016-01-25 14:31:39', '兰屿乡', '台湾台东县兰屿乡');
INSERT INTO `t_system_area` VALUES ('712520', ',710000,712500,', '712500', '2016-01-25 14:31:39', '延平乡', '台湾台东县延平乡');
INSERT INTO `t_system_area` VALUES ('712521', ',710000,712500,', '712500', '2016-01-25 14:31:39', '卑南乡', '台湾台东县卑南乡');
INSERT INTO `t_system_area` VALUES ('712522', ',710000,712500,', '712500', '2016-01-25 14:31:39', '鹿野乡', '台湾台东县鹿野乡');
INSERT INTO `t_system_area` VALUES ('712523', ',710000,712500,', '712500', '2016-01-25 14:31:39', '关山镇', '台湾台东县关山镇');
INSERT INTO `t_system_area` VALUES ('712524', ',710000,712500,', '712500', '2016-01-25 14:31:39', '海端乡', '台湾台东县海端乡');
INSERT INTO `t_system_area` VALUES ('712525', ',710000,712500,', '712500', '2016-01-25 14:31:39', '池上乡', '台湾台东县池上乡');
INSERT INTO `t_system_area` VALUES ('712526', ',710000,712500,', '712500', '2016-01-25 14:31:39', '东河乡', '台湾台东县东河乡');
INSERT INTO `t_system_area` VALUES ('712527', ',710000,712500,', '712500', '2016-01-25 14:31:39', '成功镇', '台湾台东县成功镇');
INSERT INTO `t_system_area` VALUES ('712528', ',710000,712500,', '712500', '2016-01-25 14:31:39', '长滨乡', '台湾台东县长滨乡');
INSERT INTO `t_system_area` VALUES ('712529', ',710000,712500,', '712500', '2016-01-25 14:31:39', '金峰乡', '台湾台东县金峰乡');
INSERT INTO `t_system_area` VALUES ('712530', ',710000,712500,', '712500', '2016-01-25 14:31:39', '大武乡', '台湾台东县大武乡');
INSERT INTO `t_system_area` VALUES ('712531', ',710000,712500,', '712500', '2016-01-25 14:31:39', '达仁乡', '台湾台东县达仁乡');
INSERT INTO `t_system_area` VALUES ('712532', ',710000,712500,', '712500', '2016-01-25 14:31:39', '太麻里乡', '台湾台东县太麻里乡');
INSERT INTO `t_system_area` VALUES ('712600', ',710000,', '710000', '2016-01-25 14:31:39', '花莲县', '台湾花莲县');
INSERT INTO `t_system_area` VALUES ('712615', ',710000,712600,', '712600', '2016-01-25 14:31:39', '花莲市', '台湾花莲县花莲市');
INSERT INTO `t_system_area` VALUES ('712616', ',710000,712600,', '712600', '2016-01-25 14:31:39', '新城乡', '台湾花莲县新城乡');
INSERT INTO `t_system_area` VALUES ('712617', ',710000,712600,', '712600', '2016-01-25 14:31:39', '太鲁阁', '台湾花莲县太鲁阁');
INSERT INTO `t_system_area` VALUES ('712618', ',710000,712600,', '712600', '2016-01-25 14:31:39', '秀林乡', '台湾花莲县秀林乡');
INSERT INTO `t_system_area` VALUES ('712619', ',710000,712600,', '712600', '2016-01-25 14:31:39', '吉安乡', '台湾花莲县吉安乡');
INSERT INTO `t_system_area` VALUES ('712620', ',710000,712600,', '712600', '2016-01-25 14:31:39', '寿丰乡', '台湾花莲县寿丰乡');
INSERT INTO `t_system_area` VALUES ('712621', ',710000,712600,', '712600', '2016-01-25 14:31:39', '凤林镇', '台湾花莲县凤林镇');
INSERT INTO `t_system_area` VALUES ('712622', ',710000,712600,', '712600', '2016-01-25 14:31:39', '光复乡', '台湾花莲县光复乡');
INSERT INTO `t_system_area` VALUES ('712623', ',710000,712600,', '712600', '2016-01-25 14:31:39', '丰滨乡', '台湾花莲县丰滨乡');
INSERT INTO `t_system_area` VALUES ('712624', ',710000,712600,', '712600', '2016-01-25 14:31:39', '瑞穗乡', '台湾花莲县瑞穗乡');
INSERT INTO `t_system_area` VALUES ('712625', ',710000,712600,', '712600', '2016-01-25 14:31:39', '万荣乡', '台湾花莲县万荣乡');
INSERT INTO `t_system_area` VALUES ('712626', ',710000,712600,', '712600', '2016-01-25 14:31:39', '玉里镇', '台湾花莲县玉里镇');
INSERT INTO `t_system_area` VALUES ('712627', ',710000,712600,', '712600', '2016-01-25 14:31:39', '卓溪乡', '台湾花莲县卓溪乡');
INSERT INTO `t_system_area` VALUES ('712628', ',710000,712600,', '712600', '2016-01-25 14:31:39', '富里乡', '台湾花莲县富里乡');
INSERT INTO `t_system_area` VALUES ('712700', ',710000,', '710000', '2016-01-25 14:31:39', '澎湖县', '台湾澎湖县');
INSERT INTO `t_system_area` VALUES ('712707', ',710000,712700,', '712700', '2016-01-25 14:31:39', '马公市', '台湾澎湖县马公市');
INSERT INTO `t_system_area` VALUES ('712708', ',710000,712700,', '712700', '2016-01-25 14:31:39', '西屿乡', '台湾澎湖县西屿乡');
INSERT INTO `t_system_area` VALUES ('712709', ',710000,712700,', '712700', '2016-01-25 14:31:39', '望安乡', '台湾澎湖县望安乡');
INSERT INTO `t_system_area` VALUES ('712710', ',710000,712700,', '712700', '2016-01-25 14:31:39', '七美乡', '台湾澎湖县七美乡');
INSERT INTO `t_system_area` VALUES ('712711', ',710000,712700,', '712700', '2016-01-25 14:31:39', '白沙乡', '台湾澎湖县白沙乡');
INSERT INTO `t_system_area` VALUES ('712712', ',710000,712700,', '712700', '2016-01-25 14:31:39', '湖西乡', '台湾澎湖县湖西乡');
INSERT INTO `t_system_area` VALUES ('712800', ',710000,', '710000', '2016-01-25 14:31:39', '连江县', '台湾连江县');
INSERT INTO `t_system_area` VALUES ('712805', ',710000,712800,', '712800', '2016-01-25 14:31:39', '南竿乡', '台湾连江县南竿乡');
INSERT INTO `t_system_area` VALUES ('712806', ',710000,712800,', '712800', '2016-01-25 14:31:39', '北竿乡', '台湾连江县北竿乡');
INSERT INTO `t_system_area` VALUES ('712807', ',710000,712800,', '712800', '2016-01-25 14:31:39', '莒光乡', '台湾连江县莒光乡');
INSERT INTO `t_system_area` VALUES ('712808', ',710000,712800,', '712800', '2016-01-25 14:31:39', '东引乡', '台湾连江县东引乡');
INSERT INTO `t_system_area` VALUES ('810000', ',', null, '2016-01-25 14:31:39', '香港', '香港');
INSERT INTO `t_system_area` VALUES ('810100', ',810000,', '810000', '2016-01-25 14:31:39', '香港岛', '香港香港岛');
INSERT INTO `t_system_area` VALUES ('810101', ',810000,810100,', '810100', '2016-01-25 14:31:39', '中西区', '香港香港岛中西区');
INSERT INTO `t_system_area` VALUES ('810102', ',810000,810100,', '810100', '2016-01-25 14:31:39', '湾仔', '香港香港岛湾仔');
INSERT INTO `t_system_area` VALUES ('810103', ',810000,810100,', '810100', '2016-01-25 14:31:39', '东区', '香港香港岛东区');
INSERT INTO `t_system_area` VALUES ('810104', ',810000,810100,', '810100', '2016-01-25 14:31:39', '南区', '香港香港岛南区');
INSERT INTO `t_system_area` VALUES ('810200', ',810000,', '810000', '2016-01-25 14:31:39', '九龙', '香港九龙');
INSERT INTO `t_system_area` VALUES ('810201', ',810000,810200,', '810200', '2016-01-25 14:31:39', '九龙城区', '香港九龙九龙城区');
INSERT INTO `t_system_area` VALUES ('810202', ',810000,810200,', '810200', '2016-01-25 14:31:39', '油尖旺区', '香港九龙油尖旺区');
INSERT INTO `t_system_area` VALUES ('810203', ',810000,810200,', '810200', '2016-01-25 14:31:39', '深水埗区', '香港九龙深水埗区');
INSERT INTO `t_system_area` VALUES ('810204', ',810000,810200,', '810200', '2016-01-25 14:31:39', '黄大仙区', '香港九龙黄大仙区');
INSERT INTO `t_system_area` VALUES ('810205', ',810000,810200,', '810200', '2016-01-25 14:31:39', '观塘区', '香港九龙观塘区');
INSERT INTO `t_system_area` VALUES ('810300', ',810000,', '810000', '2016-01-25 14:31:39', '新界', '香港新界');
INSERT INTO `t_system_area` VALUES ('810301', ',810000,810300,', '810300', '2016-01-25 14:31:39', '北区', '香港新界北区');
INSERT INTO `t_system_area` VALUES ('810302', ',810000,810300,', '810300', '2016-01-25 14:31:39', '大埔区', '香港新界大埔区');
INSERT INTO `t_system_area` VALUES ('810303', ',810000,810300,', '810300', '2016-01-25 14:31:39', '沙田区', '香港新界沙田区');
INSERT INTO `t_system_area` VALUES ('810304', ',810000,810300,', '810300', '2016-01-25 14:31:39', '西贡区', '香港新界西贡区');
INSERT INTO `t_system_area` VALUES ('810305', ',810000,810300,', '810300', '2016-01-25 14:31:39', '元朗区', '香港新界元朗区');
INSERT INTO `t_system_area` VALUES ('810306', ',810000,810300,', '810300', '2016-01-25 14:31:39', '屯门区', '香港新界屯门区');
INSERT INTO `t_system_area` VALUES ('810307', ',810000,810300,', '810300', '2016-01-25 14:31:39', '荃湾区', '香港新界荃湾区');
INSERT INTO `t_system_area` VALUES ('810308', ',810000,810300,', '810300', '2016-01-25 14:31:39', '葵青区', '香港新界葵青区');
INSERT INTO `t_system_area` VALUES ('810309', ',810000,810300,', '810300', '2016-01-25 14:31:39', '离岛区', '香港新界离岛区');
INSERT INTO `t_system_area` VALUES ('820000', ',', null, '2016-01-25 14:31:39', '澳门', '澳门');
INSERT INTO `t_system_area` VALUES ('820100', ',820000,', '820000', '2016-01-25 14:31:39', '澳门半岛', '澳门澳门半岛');
INSERT INTO `t_system_area` VALUES ('820200', ',820000,', '820000', '2016-01-25 14:31:39', '离岛', '澳门离岛');

-- ----------------------------
-- Table structure for `t_system_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_article`;
CREATE TABLE `t_system_article` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` mediumtext COMMENT '内容',
  `IMAGE` varchar(255) DEFAULT NULL COMMENT '图片',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '时间',
  `ARTICLE_CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `PUBLISH_DATE` datetime DEFAULT NULL COMMENT '发布时间',
  `IS_SHOW` bit(1) DEFAULT b'1' COMMENT '是否显示',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of t_system_article
-- ----------------------------
INSERT INTO `t_system_article` VALUES ('14', 'Mars悬浮Hi-Fi音响', 'dsddddddddddddddddddd', 'http://127.0.0.1:10081/loippi/upload/image/201605/7031fa05-3e52-49c0-9e9f-6d9a9fad9a54.gif', '2016-05-26 17:25:58', '1', null, null, '');
INSERT INTO `t_system_article` VALUES ('15', '我爱你', 'ert', 'http://127.0.0.1:10081/loippi/upload/image/201605/7031fa05-3e52-49c0-9e9f-6d9a9fad9a54.gif', '2016-05-26 17:29:29', '1', null, null, '');

-- ----------------------------
-- Table structure for `t_system_article_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_article_category`;
CREATE TABLE `t_system_article_category` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `IMAGE` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of t_system_article_category
-- ----------------------------
INSERT INTO `t_system_article_category` VALUES ('1', 'Dubbo监控', 'Dubbo监控', 'http://127.0.0.1:10081/manage/upload/image/201605/7031fa05-3e52-49c0-9e9f-6d9a9fad9a54.gif');

-- ----------------------------
-- Table structure for `t_system_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_feedback`;
CREATE TABLE `t_system_feedback` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '手机',
  `CONTENT` varchar(200) DEFAULT NULL COMMENT '内容',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of t_system_feedback
-- ----------------------------
INSERT INTO `t_system_feedback` VALUES ('2', '2016-04-20 11:03:09', '2', '2', '2');

-- ----------------------------
-- Table structure for `t_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `OPERATIONS` varchar(255) DEFAULT NULL COMMENT '操作',
  `OPERATOR` varchar(255) DEFAULT NULL COMMENT '操作人',
  `CONTENT` text COMMENT '内容',
  `PARAMETER` text COMMENT '参数',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of t_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_payment`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_payment`;
CREATE TABLE `t_system_payment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `SN` varchar(50) DEFAULT NULL COMMENT '支付流水号',
  `PAYEE` varchar(20) DEFAULT NULL COMMENT '支付人',
  `ACCOUNT` varchar(20) DEFAULT NULL COMMENT '银行账户',
  `AMOUNT` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `PAY_DATE` datetime DEFAULT NULL COMMENT '支付时间',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `PAYMENT_PLUGIN_ID` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `PAYMENT_PLUGIN_NAME` varchar(100) DEFAULT NULL COMMENT '支付方式-中文',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `BIZ_ID` bigint(20) DEFAULT NULL COMMENT '业务编号',
  `BIZ_TYPE` int(11) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='交易流水';

-- ----------------------------
-- Records of t_system_payment
-- ----------------------------
INSERT INTO `t_system_payment` VALUES ('1', '2016052014637254192410001', null, '测试账户', '1', '0', null, '2016-05-20 14:23:38', 'alipayMobilePaymentPlugin', '支付宝手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('2', '2016052014637255746440001', null, '测试账户', '1', '0', null, '2016-05-20 14:26:14', 'unionpayMobilePaymentPlugin', '银联手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('3', '2016052014637256197280001', null, '测试账户', '1', '0', null, '2016-05-20 14:26:59', 'unionpayMobilePaymentPlugin', '银联手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('4', '2016052014637256827560001', null, '测试账户', '1', '0', null, '2016-05-20 14:28:02', 'unionpayMobilePaymentPlugin', '银联手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('5', '2016052014637257265010001', null, '测试账户', '1', '0', null, '2016-05-20 14:28:46', 'unionpayMobilePaymentPlugin', '银联手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('6', '2016052014637259337830001', null, '测试账户', '1', '0', null, '2016-05-20 14:32:13', 'unionpayMobilePaymentPlugin', '银联手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('7', '2016052014637262787660001', null, '测试账户', '1', '0', null, '2016-05-20 14:37:58', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('8', '2016052014637262876530001', null, '测试账户', '1', '0', null, '2016-05-20 14:38:07', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('9', '2016052014637263377620001', null, '测试账户', '1', '0', null, '2016-05-20 14:38:57', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('10', '2016052014637264750020001', null, '测试账户', '1', '0', null, '2016-05-20 14:41:15', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('11', '2016052014637265544730001', null, '测试账户', '1', '0', null, '2016-05-20 14:42:34', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('12', '2016052014637269904920001', null, '测试账户', '1', '0', null, '2016-05-20 14:49:50', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');
INSERT INTO `t_system_payment` VALUES ('13', '2016052414640752061370001', null, '测试账户', '1', '0', null, '2016-05-24 15:33:26', 'weixinMobilePaymentPlugin', '微信手机支付', null, '1', '1');

-- ----------------------------
-- Table structure for `t_system_plugin_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_plugin_config`;
CREATE TABLE `t_system_plugin_config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `PLUGIN_ID` varchar(100) NOT NULL COMMENT '插件编号',
  `IS_ENABLED` int(11) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='插件配置';

-- ----------------------------
-- Records of t_system_plugin_config
-- ----------------------------
INSERT INTO `t_system_plugin_config` VALUES ('1', 'filePlugin', '1');
INSERT INTO `t_system_plugin_config` VALUES ('8', 'alipayMobilePaymentPlugin', '0');

-- ----------------------------
-- Table structure for `t_system_plugin_config_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_plugin_config_attribute`;
CREATE TABLE `t_system_plugin_config_attribute` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `PLUGIN_ID` varchar(100) NOT NULL COMMENT '关联插件编号',
  `NAME` varchar(100) NOT NULL COMMENT '属性名',
  `ATTRIBUTE` varchar(255) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件属性';

-- ----------------------------
-- Records of t_system_plugin_config_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `t_system_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role`;
CREATE TABLE `t_system_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `ROLE_NAME` varchar(255) NOT NULL COMMENT '角色名称',
  `IS_SYSTEM` bit(1) DEFAULT b'0' COMMENT '是否内置',
  `DESCRIPTIONS` varchar(255) DEFAULT NULL COMMENT '描述',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATOR` bigint(20) DEFAULT NULL COMMENT '创建者',
  `UPDATOR` bigint(20) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of t_system_role
-- ----------------------------
INSERT INTO `t_system_role` VALUES ('1', '2015-10-28 10:14:47', '超级系统管理员', '', '超级系统管理员', null, '1', null);

-- ----------------------------
-- Table structure for `t_system_role_acls`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_acls`;
CREATE TABLE `t_system_role_acls` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色编号',
  `ACL_ID` bigint(20) NOT NULL COMMENT '资源编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色权限表';

-- ----------------------------
-- Records of t_system_role_acls
-- ----------------------------
INSERT INTO `t_system_role_acls` VALUES ('1', '1');
INSERT INTO `t_system_role_acls` VALUES ('1', '2');
INSERT INTO `t_system_role_acls` VALUES ('1', '3');
INSERT INTO `t_system_role_acls` VALUES ('1', '4');
INSERT INTO `t_system_role_acls` VALUES ('1', '5');
INSERT INTO `t_system_role_acls` VALUES ('1', '6');
INSERT INTO `t_system_role_acls` VALUES ('1', '7');
INSERT INTO `t_system_role_acls` VALUES ('1', '8');
INSERT INTO `t_system_role_acls` VALUES ('1', '9');
INSERT INTO `t_system_role_acls` VALUES ('1', '11');
INSERT INTO `t_system_role_acls` VALUES ('1', '12');
INSERT INTO `t_system_role_acls` VALUES ('1', '15');
INSERT INTO `t_system_role_acls` VALUES ('1', '16');
INSERT INTO `t_system_role_acls` VALUES ('1', '17');
INSERT INTO `t_system_role_acls` VALUES ('1', '18');
INSERT INTO `t_system_role_acls` VALUES ('1', '19');
INSERT INTO `t_system_role_acls` VALUES ('1', '20');
INSERT INTO `t_system_role_acls` VALUES ('1', '21');
INSERT INTO `t_system_role_acls` VALUES ('1', '24');
INSERT INTO `t_system_role_acls` VALUES ('1', '25');
INSERT INTO `t_system_role_acls` VALUES ('1', '26');
INSERT INTO `t_system_role_acls` VALUES ('1', '30');
INSERT INTO `t_system_role_acls` VALUES ('1', '27');
INSERT INTO `t_system_role_acls` VALUES ('1', '1');
INSERT INTO `t_system_role_acls` VALUES ('1', '16');
INSERT INTO `t_system_role_acls` VALUES ('1', '17');
INSERT INTO `t_system_role_acls` VALUES ('1', '18');
INSERT INTO `t_system_role_acls` VALUES ('1', '19');
INSERT INTO `t_system_role_acls` VALUES ('1', '20');
INSERT INTO `t_system_role_acls` VALUES ('1', '31');
INSERT INTO `t_system_role_acls` VALUES ('1', '32');
INSERT INTO `t_system_role_acls` VALUES ('1', '33');
INSERT INTO `t_system_role_acls` VALUES ('1', '34');
INSERT INTO `t_system_role_acls` VALUES ('1', '35');
INSERT INTO `t_system_role_acls` VALUES ('1', '36');
INSERT INTO `t_system_role_acls` VALUES ('1', '37');
INSERT INTO `t_system_role_acls` VALUES ('1', '38');
INSERT INTO `t_system_role_acls` VALUES ('1', '39');

-- ----------------------------
-- Table structure for `t_system_sn`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_sn`;
CREATE TABLE `t_system_sn` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TYPE` int(11) NOT NULL COMMENT '类型',
  `LAST_VALUE` bigint(20) NOT NULL COMMENT '末值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='序列号';

-- ----------------------------
-- Records of t_system_sn
-- ----------------------------
INSERT INTO `t_system_sn` VALUES ('1', '0', '1');
INSERT INTO `t_system_sn` VALUES ('2', '1', '1');
INSERT INTO `t_system_sn` VALUES ('3', '2', '1');
INSERT INTO `t_system_sn` VALUES ('4', '3', '1');

-- ----------------------------
-- Table structure for `t_system_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user`;
CREATE TABLE `t_system_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `USER_NAME` varchar(20) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(100) NOT NULL COMMENT '密码',
  `NICKNAME` varchar(20) DEFAULT NULL COMMENT '昵称',
  `IS_ENABLED` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `IS_LOCKED` bit(1) DEFAULT b'0' COMMENT '是否锁定',
  `LOGIN_FAILURE_COUNT` int(11) DEFAULT NULL COMMENT '登录失败次数',
  `LOCKED_DATE` datetime DEFAULT NULL COMMENT '锁定时间',
  `LOGIN_DATE` datetime DEFAULT NULL COMMENT '登录时间',
  `LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色',
  `AVATAR` varchar(200) DEFAULT NULL COMMENT '头像',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `THEME` int(11) DEFAULT '1' COMMENT '主题默认1，2为Classic',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统管理员表';

-- ----------------------------
-- Records of t_system_user
-- ----------------------------
INSERT INTO `t_system_user` VALUES ('1', '2015-10-19 16:44:51', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '', '', '0', null, '2015-10-19 16:45:21', '127.0.0.1', 'yanxianshenghr@qq.com', '1', 'http://127.0.0.1:10081/loippi/upload/image/201605/7031fa05-3e52-49c0-9e9f-6d9a9fad9a54.gif', null, '2');
