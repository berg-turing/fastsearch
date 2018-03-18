/*
 Source Server         : fastsearch
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : 127.0.0.1
 Source Database       : fast_search

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : utf-8

 Date: 3/17/2018 23:38:56 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `fast_search`;
CREATE DATABASE `fast_search`;
USE `fast_search`;

-- ----------------------------
--  Table structure for `car`
-- ----------------------------

#用户基本信息表
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户的主键',
    `NAME` VARCHAR(32) DEFAULT NULL COMMENT '用户名称',
    `EMAIL` VARCHAR(32) DEFAULT NULL COMMENT '用户邮箱',
    `PASSWORD` VARCHAR(32) DEFAULT NULL COMMENT '用户密码',
    `PHONE_NUMBER` VARCHAR(15) NOT NULL COMMENT '用户的手机号',
    `STATUS` VARCHAR(32) NOT NULL DEFAULT 'NORMAL' COMMENT '用户的状态:NORMAL-正常,BAN-封禁',
    `AVATAR` VARCHAR(255) DEFAULT NULL COMMENT '用户头像',
    `CREATE_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
    `LAST_LOGIN_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
    `LAST_UPDATE_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新记录时间',
    PRIMARY KEY (`ID`),
	UNIQUE KEY `INDEX_ON_PHONE` (`PHONE_NUMBER`) USING BTREE COMMENT '用户手机号',
	UNIQUE KEY `INDEX_ON_USERNAME` (`NAME`) USING BTREE COMMENT '用户名索引',
	UNIQUE KEY `INDEX_ON_EMAIL` (`EMAIL`) USING BTREE COMMENT '电子邮箱索引'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户基本信息表';

BEGIN;
INSERT INTO `sys_users` (`ID`, `NAME`, `EMAIL`, `PASSWORD`, `PHONE_NUMBER`, `STATUS`, `AVATAR`, `CREATE_TIME`, `LAST_LOGIN_TIME`, `LAST_UPDATE_TIME`)
VALUES 
('1', 'admin1', 'admin1@qq.com', '917cce88e0510b78bb2d11286af982b9', '1536956231', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('2', 'admin2', 'admin2@qq.com', 'a6b70a461e32d67b1e514fa96383c95e', '1536956232', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('3', 'admin3', 'admin3@qq.com', 'cc4e16a60f35a2c184f4aebf039d4a4a', '1536956233', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('4', 'admin4', 'admin4@qq.com', '13ea5ecd1df5cd4884a699c98c50d1f8', '1536956234', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('5', 'admin5', 'admin5@qq.com', '97ef97925e25187d4fe89700888e57ca', '1536956235', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('6', 'admin6', 'admin6@qq.com', 'bf63d91aabfa4b26a2937beb59531484', '1536956236', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('7', 'admin7', 'admin7@qq.com', '17ef38f3bcca11b2ee19230600f85641', '1536956237', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('8', 'admin8', 'admin8@qq.com', '0192a0ea76efdbfe3063b9bdb1f4d0fb', '1536956238', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02'), 
('9', 'admin9', 'admin9@qq.com', '8d23faed1a1748968904498b476410f5', '1536956239', 'NORMAL', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png', '2018-02-25 15:18:20', '2018-03-15 12:00:00', '2018-03-12 10:29:02');
COMMIT;


#角色表
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色的主键',
    `NAME` VARCHAR(32) NOT NULL COMMENT '角色名',
    `DESCRIPTION` VARCHAR(255) DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

BEGIN;
INSERT INTO `sys_roles` (`ID`, `NAME`, `DESCRIPTION`)
VALUES
('1', 'ADMIN', '管理员'),
('2', 'USER', '用户');
COMMIT;

#角色分派表
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色分派的主键',
    `USER_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '用户id,用户表(sys_users)的主键',
    `ROLE_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '角色的id,角色表(sys_roles)的主键',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `USER_ID_AND_ROLE_ID` (`USER_ID`,`ROLE_ID`) USING BTREE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='角色分派表';

BEGIN;
INSERT INTO `sys_user_role` (`ID`, `USER_ID`, `ROLE_ID`)
VALUES
('1', '1', '1'),
('2', '2', '2'),
('3', '3', '2'),
('4', '4', '2'),
('5', '5', '2'),
('6', '6', '2'),
('7', '7', '2'),
('8', '8', '2'),
('9', '9', '2');
COMMIT;


#代码维护头表
DROP TABLE IF EXISTS `sys_code_b`;
CREATE TABLE `sys_code_b`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '代码维护头的主键',
    `CODE` VARCHAR(32) NOT NULL COMMENT '代码维护的编码',
    `DESCRIPTION` VARCHAR(255) DEFAULT NULL COMMENT '代码维护的描述',
    `ENABLED_FLAG` VARCHAR(1) DEFAULT 'N' COMMENT '禁用标识:Y-禁用,N-启用',
    `CREATE_TIME` DATETIME NOT NULL COMMENT '数据创建时间',
	`LAST_UPDATE_TIME` DATETIME NOT NULL COMMENT '最近更新时间',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='代码维护头表';

#代码维护头多语言表
DROP TABLE IF EXISTS `sys_code_tl`;
CREATE TABLE `sys_code_tl`(
	`ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '代码维护头多语言的主键',
    `LANG` VARCHAR(20) NOT NULL COMMENT '语言类型',
    `DESCRIPTION` VARCHAR(255) COMMENT '描述',
    `CREATE_TIME` DATETIME NOT NULL COMMENT '数据创建时间',
	`LAST_UPDATE_TIME` DATETIME NOT NULL COMMENT '最近更新时间',
    PRIMARY KEY (`ID`, `LANG`)
)ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8mb4 COMMENT='代码维护头的多语言表';

#代码维护值表
DROP TABLE IF EXISTS `sys_code_value_b`;
CREATE TABLE `sys_code_value_b`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '代码维护值的主键',
    `CODE_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '代码维护头表的id,代码维护头表(sys_code_b)的主键',
    `VALUE` VARCHAR(150) NOT NULL COMMENT '代码的值',
    `MEANING` VARCHAR(150) DEFAULT NULL COMMENT '代码的含义',
    `DESCRIPTION` VARCHAR(255) DEFAULT NULL COMMENT '描述',
    `TAG` VARCHAR(255) DEFAULT NULL COMMENT '标识',
    `ENABLED_FLAG` VARCHAR(1) NOT NULL DEFAULT 'N' COMMENT '禁用标识:Y-禁用,N-启用',
    `CREATE_TIME` DATETIME NOT NULL COMMENT '数据创建时间',
	`LAST_UPDATE_TIME` DATETIME NOT NULL COMMENT '最近更新时间',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8mb4 COMMENT='代码维护值表';


#代码维护值多语言表
DROP TABLE IF EXISTS `sys_code_value_tl`;
CREATE TABLE `sys_code_value_tl`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '代码维护值的主键',
    `LANG` VARCHAR(20) NOT NULL COMMENT '语言类型',
    `DESCRIPTION` VARCHAR(255) COMMENT '描述',
    `CREATE_TIME` DATETIME NOT NULL COMMENT '数据创建时间',
	`LAST_UPDATE_TIME` DATETIME NOT NULL COMMENT '最近更新时间',
    PRIMARY KEY (`ID`, `LANG`)
)ENGINE=InnoDB AUTO_INCREMENT=1 CHARSET=utf8mb4 COMMENT='代码维护值多语言表';


#汽车实体表
DROP TABLE IF EXISTS `fs_cars`;
CREATE TABLE `fs_cars`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车实体的主键',
    `TITLE` VARCHAR(32) NOT NULL,
    `DEPLOYEE_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '发布者的id,用户表(sys_users)的主键',
    `PRICE` DECIMAL NOT NULL COMMENT '汽车的价格',
    `SEATS` INT(2) NOT NULL COMMENT '汽车的座位数',
    `DISPLACEMENT` DECIMAL NOT NULL COMMENT '汽车的排量',
    `MILEAGE` DECIMAL NOT NULL COMMENT '汽车的里程',
    `AGE` INT(3) NOT NULL COMMENT '车龄',
    `GEAR_BOX` VARCHAR(150) NOT NULL COMMENT '汽车变速箱类型,代码维护code:FS.CAR_GEAR_BOXS',
    `COLOR` VARCHAR(150) NOT NULL COMMENT '汽车的颜色,代码维护code:FS.CAR_COLORS',
    `DRIVE_TYPE` VARCHAR(150) NOT NULL COMMENT '汽车的驱动类型,代码维护code:FS_CAR_DRIVE_TYPES',
    `EMISSION_STANDARD` VARCHAR(150) NOT NULL COMMENT '汽车的排放标准,代码维护code:FS_CAR_DMISSION_STANDARDS',
    `STYLE` VARCHAR(150) NOT NULL COMMENT '车型,代码维护code:FS_CAR_STYLES',
    `FUEL_TYPE` VARCHAR(150) NOT NULL COMMENT '燃油类型,代码维护code:FS_CAR_FUEL_TYPES',
    `WATCH_TIMES` BIGINT(20) unsigned DEFAULT '0' COMMENT '被看次数',
    `CITY_EN_NAME` VARCHAR(32) NOT NULL COMMENT '城市标记缩写 如 北京bj',
	`REGION_EN_NAME` VARCHAR(255) NOT NULL COMMENT '地区英文简写 如昌平区 cpq',
    `ADDRESS` VARCHAR(32) NOT NULL COMMENT '详细地址 ',
	`VOCER` VARCHAR(32) DEFAULT NULL COMMENT '封面',
    `STATUS` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '汽车的状态:',
    `DESCRIPTION` VARCHAR(512) DEFAULT NULL COMMENT '描述',
    `LAST_LOGIN_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
    `LAST_UPDATE_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新记录时间',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='汽车实体表';


#汽车品牌表
DROP TABLE IF EXISTS `fs_car_brands`;
CREATE TABLE `fs_car_brands`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车品牌的id',
    `NAME` VARCHAR(255) NOT NULL COMMENT '汽车品牌的名称',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='汽车品牌表';


#汽车系类表
DROP TABLE IF EXISTS `fs_car_series`;
CREATE TABLE `fs_car_series`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车系列的主键',
    `BRAND_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '汽车品牌id,汽车品牌表(fs_car_brands)的主键',
    `NAME` VARCHAR(255) NOT NULL COMMENT '汽车系列的名称',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='汽车系列表';


#汽车图片表
DROP TABLE IF EXISTS `fs_car_pictures`;
CREATE TABLE `fs_car_pictures`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车图片的主键',
    `CAR_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '汽车id,汽车表(fs_cars)的主键',
    `CDN_PREFIX` VARCHAR(255) NOT NULL COMMENT '图片路径',
    `WIDTH` INT(11) DEFAULT NULL COMMENT '图片的宽',
    `HEIGHT` INT(11) DEFAULT NULL COMMENT '图片的高',
    `LOCALTION` VARCHAR(32) DEFAULT NULL COMMENT '图片属于车辆的什么部位',
    `PATH` VARCHAR(255) NOT NULL COMMENT '文件名',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='汽车图片表';


#汽车标签表
DROP TABLE IF EXISTS `fs_car_tags`;
CREATE TABLE `fs_car_tags`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车标签的主键',
    `NAME` VARCHAR(32) NOT NULL COMMENT '汽车标签',
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='汽车标签表';


#汽车与汽车标签关联表
DROP TABLE IF EXISTS `fs_car_tag_ass`;
CREATE TABLE `fs_car_tag_ass`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车标签与汽车关联的主键',
    `CAR_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '汽车id,汽车表(fs_cars)的主键',
    `CAR_TAG_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '汽车标签id,汽车标签表(fs_car_tags)的主键',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `CAR_ID_AND_CAR_TAG_ID` (`CAR_ID`, `CAR_TAG_ID`) USING BTREE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='汽车与汽车标签关联表';


#车辆预约表
DROP TABLE IF EXISTS `fs_car_subscribes`;
CREATE TABLE `fs_car_subscribes`(
	`ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汽车预约表的主键',
    `CAR_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '汽车id,汽车表(fs_cars)的主键',
    `USER_ID` BIGINT(20) UNSIGNED NOT NULL COMMENT '用户id,用户表(sys_users)的主键',
    `STATUS` VARCHAR(32) NOT NULL DEFAULT 'FOLLOWED' COMMENT '预约状态:FOLLOWED-已关注,APPOINTED-已约定,FINISHED-已完成',
    `ORDER_TIME` DATETIME NOT NULL COMMENT '预约看车的时间',
    `PHONE_NUMBER` VARCHAR(15) DEFAULT NULL COMMENT '联系电话',
    `DESCRIPTION` VARCHAR(512) DEFAULT NULL COMMENT '用户的描述',
    `CREATE_TIME` DATETIME NOT NULL COMMENT '数据创建时间',
	`LAST_UPDATE_TIME` DATETIME NOT NULL COMMENT '记录更新时间',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `CAR_ID_AND_USER_ID` (`CAR_ID`, `USER_ID`) USING BTREE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='车辆预约表';


#城市表
DROP TABLE IF EXISTS `fs_support_address`;
CREATE TABLE `fs_support_address` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '城市的主键',
  `BELONG_TO` VARCHAR(32) NOT NULL DEFAULT '0' COMMENT '上一级行政单位名',
  `EN_NAME` VARCHAR(32) NOT NULL COMMENT '行政单位英文名缩写',
  `CN_NAME` VARCHAR(32) NOT NULL COMMENT '行政单位中文名',
  `LEVEL` VARCHAR(16) NOT NULL COMMENT '行政级别 市-CITY 地区-REGION',
  `BAIDU_MAP_LNG` DOUBLE NOT NULL COMMENT '百度地图经度',
  `BAIDU_MAP_LAT` DOUBLE NOT NULL COMMENT '百度地图纬度',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNIQUE_EN_NAME_AND_BELONG_TO` (`EN_NAME`,`LEVEL`,`BELONG_TO`) USING BTREE COMMENT '每个城市的英文名都是独一无二的'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT '城市表';












