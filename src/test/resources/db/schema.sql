DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `NAME` VARCHAR(32) NOT NULL UNIQUE,
    `EMAIL` VARCHAR(32) NOT NULL UNIQUE,
    `PASSWORD` VARCHAR(64) NOT NULL,
    `PHONE_NUMBER` VARCHAR(15) NOT NULL UNIQUE,
    `STATUS` VARCHAR(32) NOT NULL,
    `AVATAR` VARCHAR(255),
    `CREATE_TIME` DATETIME NOT NULL DEFAULT NOW(),
    `LAST_LOGIN_TIME` DATETIME NOT NULL,
    `LAST_UPDATE_TIME` DATETIME NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
	`CODE` VARCHAR(32) NOT NULL,
    `NAME` VARCHAR(32) NOT NULL,
    `DESCRIPTION` VARCHAR(255),
);


DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `USER_ID` BIGINT(20) NOT NULL,
    `ROLE_ID` BIGINT(20) NOT NULL,
    UNIQUE (`USER_ID`,`ROLE_ID`)
);


DROP TABLE IF EXISTS `sys_code_b`;
CREATE TABLE `sys_code_b`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `CODE` VARCHAR(32) NOT NULL,
    `DESCRIPTION` VARCHAR(255),
    `ENABLED_FLAG` VARCHAR(1),
    `CREATE_TIME` DATETIME NOT NULL,
	`LAST_UPDATE_TIME` DATETIME NOT NULL
);


DROP TABLE IF EXISTS `sys_code_tl`;
CREATE TABLE `sys_code_tl`(
	`ID` BIGINT(20) NOT NULL,
    `LANG` VARCHAR(20) NOT NULL,
    `DESCRIPTION` VARCHAR(255),
    `CREATE_TIME` DATETIME NOT NULL,
	`LAST_UPDATE_TIME` DATETIME NOT NULL,
    PRIMARY KEY (`ID`, `LANG`)
);


DROP TABLE IF EXISTS `sys_code_value_b`;
CREATE TABLE `sys_code_value_b`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `CODE_ID` BIGINT(20) NOT NULL,
    `VALUE` VARCHAR(150) NOT NULL,
    `MEANING` VARCHAR(150),
    `DESCRIPTION` VARCHAR(255),
    `TAG` VARCHAR(255),
    `ENABLED_FLAG` VARCHAR(1) NOT NULL,
    `CREATE_TIME` DATETIME NOT NULL,
	`LAST_UPDATE_TIME` DATETIME NOT NULL
);


DROP TABLE IF EXISTS `sys_code_value_tl`;
CREATE TABLE `sys_code_value_tl`(
	`ID` BIGINT(20) NOT NULL,
    `LANG` VARCHAR(20) NOT NULL,
    `DESCRIPTION` VARCHAR(255),
    `CREATE_TIME` DATETIME NOT NULL,
	`LAST_UPDATE_TIME` DATETIME NOT NULL,
    PRIMARY KEY (`ID`, `LANG`)
);


DROP TABLE IF EXISTS `fs_cars`;
CREATE TABLE `fs_cars`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `TITLE` VARCHAR(32) NOT NULL,
    `BRAND_ID` BIGINT(20) NOT NULL,
    `SERIES_ID` BIGINT(20) NOT NULL,
    `DEPLOYEE_ID` BIGINT(20) NOT NULL,
    `PRICE` DECIMAL NOT NULL,
    `SEATS` INT(2) NOT NULL,
    `DISPLACEMENT` DOUBLE NOT NULL,
    `MILEAGE` DOUBLE NOT NULL,
    `AGE` INT(3) NOT NULL,
    `GEAR_BOX` VARCHAR(150) NOT NULL,
    `COLOR` VARCHAR(150) NOT NULL,
    `DRIVE_TYPE` VARCHAR(150) NOT NULL,
    `EMISSION_STANDARD` VARCHAR(150) NOT NULL,
    `STYLE` VARCHAR(150) NOT NULL,
    `FUEL_TYPE` VARCHAR(150) NOT NULL,
    `WATCH_TIMES` INT(20),
    `CITY_ID` BIGINT(20) NOT NULL,
	`REGION_ID` BIGINT(20) NOT NULL,
    `ADDRESS` VARCHAR(32) NOT NULL,
	`COVER` VARCHAR(32),
    `STATUS` VARCHAR(32) NOT NULL,
    `DESCRIPTION` VARCHAR(512),
    `CREATE_TIME` DATETIME NOT NULL DEFAULT NOW(),
    `LAST_UPDATE_TIME` DATETIME NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS `fs_car_brands`;
CREATE TABLE `fs_car_brands`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
	`CODE` VARCHAR(32) NOT NULL,
    `NAME` VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS `fs_car_series`;
CREATE TABLE `fs_car_series`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `BRAND_ID` BIGINT(20) NOT NULL,
    `CODE` VARCHAR(32) NOT NULL,
    `NAME` VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS `fs_car_pictures`;
CREATE TABLE `fs_car_pictures`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `CAR_ID` BIGINT(20) NOT NULL,
    `CDN_PREFIX` VARCHAR(255) NOT NULL,
    `WIDTH` INT(11),
    `HEIGHT` INT(11),
    `LOCATION` VARCHAR(32),
    `PATH` VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS `fs_car_tags`;
CREATE TABLE `fs_car_tags`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `NAME` VARCHAR(32) NOT NULL
);


DROP TABLE IF EXISTS `fs_car_tag_ass`;
CREATE TABLE `fs_car_tag_ass`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `CAR_ID` BIGINT(20) NOT NULL,
    `CAR_TAG_ID` BIGINT(20) NOT NULL,
    UNIQUE (`CAR_ID`, `CAR_TAG_ID`)
);


DROP TABLE IF EXISTS `fs_car_subscribes`;
CREATE TABLE `fs_car_subscribes`(
	`ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
    `CAR_ID` BIGINT(20) NOT NULL,
    `USER_ID` BIGINT(20) NOT NULL,
    `STATUS` VARCHAR(32) NOT NULL,
    `ORDER_TIME` DATETIME,
    `PHONE_NUMBER` VARCHAR(15),
    `DESCRIPTION` VARCHAR(512),
    `CREATE_TIME` DATETIME NOT NULL,
	`LAST_UPDATE_TIME` DATETIME NOT NULL,
    UNIQUE (`CAR_ID`, `USER_ID`)
);


DROP TABLE IF EXISTS `fs_support_address`;
CREATE TABLE `fs_support_address` (
  `ID` BIGINT(20) NOT NULL IDENTITY PRIMARY KEY,
  `BELONG_TO` BIGINT(20) NOT NULL,
  `EN_NAME` VARCHAR(32) NOT NULL,
  `CN_NAME` VARCHAR(32) NOT NULL,
  `LEVEL` VARCHAR(16) NOT NULL,
  `BAIDU_MAP_LNG` DOUBLE NOT NULL,
  `BAIDU_MAP_LAT` DOUBLE NOT NULL,
  UNIQUE (`EN_NAME`,`LEVEL`,`BELONG_TO`)
);












