/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : apolloportaldb

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2021-08-29 15:16:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES ('1', 'learn-provider', 'learn-provider项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `app` VALUES ('2', 'learn-consumer', 'learn-consumer项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `app` VALUES ('3', 'learn-consumer-apollo', 'learn-consumer项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `app` VALUES ('4', 'learn-provider-apollo', 'learn-provider项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for appnamespace
-- ----------------------------
DROP TABLE IF EXISTS `appnamespace`;
CREATE TABLE `appnamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of appnamespace
-- ----------------------------
INSERT INTO `appnamespace` VALUES ('1', 'application', 'learn-provider', 'properties', '\0', 'default app namespace', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `appnamespace` VALUES ('2', 'application', 'learn-consumer', 'properties', '\0', 'default app namespace', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `appnamespace` VALUES ('3', 'application', 'learn-consumer-apollo', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `appnamespace` VALUES ('4', 'application', 'learn-provider-apollo', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('1', 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';

-- ----------------------------
-- Records of consumer
-- ----------------------------

-- ----------------------------
-- Table structure for consumeraudit
-- ----------------------------
DROP TABLE IF EXISTS `consumeraudit`;
CREATE TABLE `consumeraudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';

-- ----------------------------
-- Records of consumeraudit
-- ----------------------------

-- ----------------------------
-- Table structure for consumerrole
-- ----------------------------
DROP TABLE IF EXISTS `consumerrole`;
CREATE TABLE `consumerrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';

-- ----------------------------
-- Records of consumerrole
-- ----------------------------

-- ----------------------------
-- Table structure for consumertoken
-- ----------------------------
DROP TABLE IF EXISTS `consumertoken`;
CREATE TABLE `consumertoken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';

-- ----------------------------
-- Records of consumertoken
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'CreateApplication', 'SystemRole', '\0', 'apollo', '2021-08-29 11:23:22', 'apollo', '2021-08-29 11:23:22');
INSERT INTO `permission` VALUES ('2', 'CreateNamespace', 'learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('3', 'AssignRole', 'learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('4', 'CreateCluster', 'learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('5', 'ManageAppMaster', 'learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('6', 'ModifyNamespace', 'learn-provider+application', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('7', 'ReleaseNamespace', 'learn-provider+application', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('8', 'ModifyNamespace', 'learn-provider+application+DEV', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('9', 'ReleaseNamespace', 'learn-provider+application+DEV', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `permission` VALUES ('10', 'CreateNamespace', 'learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('11', 'AssignRole', 'learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('12', 'CreateCluster', 'learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('13', 'ManageAppMaster', 'learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('14', 'ModifyNamespace', 'learn-consumer+application', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('15', 'ReleaseNamespace', 'learn-consumer+application', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('16', 'ModifyNamespace', 'learn-consumer+application+DEV', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('17', 'ReleaseNamespace', 'learn-consumer+application+DEV', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `permission` VALUES ('18', 'CreateCluster', 'learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('19', 'CreateNamespace', 'learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('20', 'AssignRole', 'learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('21', 'ManageAppMaster', 'learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('22', 'ModifyNamespace', 'learn-consumer-apollo+application', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('23', 'ReleaseNamespace', 'learn-consumer-apollo+application', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('24', 'ModifyNamespace', 'learn-consumer-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('25', 'ReleaseNamespace', 'learn-consumer-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `permission` VALUES ('26', 'CreateNamespace', 'learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('27', 'CreateCluster', 'learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('28', 'AssignRole', 'learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('29', 'ManageAppMaster', 'learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('30', 'ModifyNamespace', 'learn-provider-apollo+application', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('31', 'ReleaseNamespace', 'learn-provider-apollo+application', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('32', 'ModifyNamespace', 'learn-provider-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `permission` VALUES ('33', 'ReleaseNamespace', 'learn-provider-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'CreateApplication+SystemRole', '\0', 'apollo', '2021-08-29 11:23:22', 'apollo', '2021-08-29 11:23:22');
INSERT INTO `role` VALUES ('2', 'Master+learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('3', 'ManageAppMaster+learn-provider', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('4', 'ModifyNamespace+learn-provider+application', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('5', 'ReleaseNamespace+learn-provider+application', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('6', 'ModifyNamespace+learn-provider+application+DEV', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('7', 'ReleaseNamespace+learn-provider+application+DEV', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `role` VALUES ('8', 'Master+learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('9', 'ManageAppMaster+learn-consumer', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('10', 'ModifyNamespace+learn-consumer+application', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('11', 'ReleaseNamespace+learn-consumer+application', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('12', 'ModifyNamespace+learn-consumer+application+DEV', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('13', 'ReleaseNamespace+learn-consumer+application+DEV', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `role` VALUES ('14', 'Master+learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('15', 'ManageAppMaster+learn-consumer-apollo', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('16', 'ModifyNamespace+learn-consumer-apollo+application', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('17', 'ReleaseNamespace+learn-consumer-apollo+application', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('18', 'ModifyNamespace+learn-consumer-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('19', 'ReleaseNamespace+learn-consumer-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `role` VALUES ('20', 'Master+learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `role` VALUES ('21', 'ManageAppMaster+learn-provider-apollo', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `role` VALUES ('22', 'ModifyNamespace+learn-provider-apollo+application', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `role` VALUES ('23', 'ReleaseNamespace+learn-provider-apollo+application', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `role` VALUES ('24', 'ModifyNamespace+learn-provider-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `role` VALUES ('25', 'ReleaseNamespace+learn-provider-apollo+application+DEV', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('1', '1', '1', '\0', 'apollo', '2021-08-29 11:23:22', 'apollo', '2021-08-29 11:23:22');
INSERT INTO `rolepermission` VALUES ('2', '2', '2', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('3', '2', '3', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('4', '2', '4', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('5', '3', '5', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('6', '4', '6', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('7', '5', '7', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('8', '6', '8', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('9', '7', '9', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `rolepermission` VALUES ('10', '8', '10', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('11', '8', '11', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('12', '8', '12', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('13', '9', '13', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('14', '10', '14', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('15', '11', '15', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('16', '12', '16', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('17', '13', '17', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `rolepermission` VALUES ('18', '14', '18', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('19', '14', '19', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('20', '14', '20', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('21', '15', '21', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('22', '16', '22', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('23', '17', '23', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('24', '18', '24', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('25', '19', '25', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `rolepermission` VALUES ('26', '20', '26', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('27', '20', '27', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('28', '20', '28', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('29', '21', '29', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('30', '22', '30', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('31', '23', '31', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('32', '24', '32', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `rolepermission` VALUES ('33', '25', '33', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES ('1', 'apollo.portal.envs', 'dev', '可支持的环境列表', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('2', 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('3', 'superAdmin', 'apollo', 'Portal超级管理员', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('4', 'api.readTimeout', '10000', 'http接口read timeout', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('5', 'consumer.token.salt', 'someSalt', 'consumer token salt', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('6', 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('7', 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');
INSERT INTO `serverconfig` VALUES ('8', 'apollo.portal.meta.servers', '{}', '各环境Meta Service列表', '\0', 'default', '2021-08-29 11:21:50', '', '2021-08-29 11:21:50');

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spring_session
-- ----------------------------
INSERT INTO `spring_session` VALUES ('b376248a-249b-4bd9-8396-fda31c28af43', '342f6173-f19e-472c-81e0-0b74963ceb7d', '1630219756130', '1630221350912', '1800', '1630223150912', 'apollo');

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------
INSERT INTO `spring_session_attributes` VALUES ('b376248a-249b-4bd9-8396-fda31c28af43', 'SPRING_SECURITY_CONTEXT', 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C000000000000021C0200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E000000000000021C0200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F72697479000000000000021C0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F757365727871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C73000000000000021C0200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F78707400093132372E302E302E3174002432663964643435662D316639632D343130382D393236662D30643433666431663065633470737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E55736572000000000000021C0200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657374000F4C6A6176612F7574696C2F5365743B4C000870617373776F726471007E000F4C0008757365726E616D6571007E000F787001010101737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E000A737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F72000000000000021C020000787077040000000171007E0010787074000661706F6C6C6F);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('1', 'apollo', '2', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `userrole` VALUES ('2', 'apollo', '4', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `userrole` VALUES ('3', 'apollo', '5', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `userrole` VALUES ('4', 'apollo', '8', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `userrole` VALUES ('5', 'apollo', '10', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `userrole` VALUES ('6', 'apollo', '11', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:24');
INSERT INTO `userrole` VALUES ('7', 'apollo', '14', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `userrole` VALUES ('8', 'apollo', '16', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `userrole` VALUES ('9', 'apollo', '17', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `userrole` VALUES ('10', 'apollo', '20', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `userrole` VALUES ('11', 'apollo', '22', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');
INSERT INTO `userrole` VALUES ('12', 'apollo', '23', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户登录账户',
  `Password` varchar(512) NOT NULL DEFAULT 'default' COMMENT '密码',
  `UserDisplayName` varchar(512) NOT NULL DEFAULT 'default' COMMENT '用户名称',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', '1');
