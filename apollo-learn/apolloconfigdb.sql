/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : apolloconfigdb

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2021-08-29 15:16:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accesskey
-- ----------------------------
DROP TABLE IF EXISTS `accesskey`;
CREATE TABLE `accesskey` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Secret` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secret',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: enabled, 0: disabled',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问密钥';

-- ----------------------------
-- Records of accesskey
-- ----------------------------

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
INSERT INTO `app` VALUES ('1', 'learn-provider', 'learn-provider项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '', 'apollo', '2021-08-29 12:19:51', 'apollo', '2021-08-29 14:12:11');
INSERT INTO `app` VALUES ('2', 'learn-consumer', 'learn-consumer项目的apollo配置', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '', 'apollo', '2021-08-29 13:24:47', 'apollo', '2021-08-29 14:07:26');
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
INSERT INTO `appnamespace` VALUES ('1', 'application', 'learn-provider', 'properties', '\0', 'default app namespace', '', 'apollo', '2021-08-29 12:19:52', 'apollo', '2021-08-29 14:12:11');
INSERT INTO `appnamespace` VALUES ('2', 'application', 'learn-consumer', 'properties', '\0', 'default app namespace', '', 'apollo', '2021-08-29 13:24:48', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `appnamespace` VALUES ('3', 'application', 'learn-consumer-apollo', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `appnamespace` VALUES ('4', 'application', 'learn-provider-apollo', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES ('1', 'App', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:19:52', null, '2021-08-29 12:19:52');
INSERT INTO `audit` VALUES ('2', 'AppNamespace', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:19:52', null, '2021-08-29 12:19:52');
INSERT INTO `audit` VALUES ('3', 'Cluster', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:19:52', null, '2021-08-29 12:19:52');
INSERT INTO `audit` VALUES ('4', 'Namespace', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:19:52', null, '2021-08-29 12:19:52');
INSERT INTO `audit` VALUES ('5', 'Item', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:20:41', null, '2021-08-29 12:20:41');
INSERT INTO `audit` VALUES ('6', 'Release', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:20:47', null, '2021-08-29 12:20:47');
INSERT INTO `audit` VALUES ('7', 'ReleaseHistory', '1', 'INSERT', null, '\0', 'apollo', '2021-08-29 12:20:49', null, '2021-08-29 12:20:49');
INSERT INTO `audit` VALUES ('8', 'Item', '1', 'UPDATE', null, '\0', 'apollo', '2021-08-29 13:07:46', null, '2021-08-29 13:07:46');
INSERT INTO `audit` VALUES ('9', 'Release', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:08:23', null, '2021-08-29 13:08:23');
INSERT INTO `audit` VALUES ('10', 'ReleaseHistory', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:08:23', null, '2021-08-29 13:08:23');
INSERT INTO `audit` VALUES ('11', 'Item', '1', 'UPDATE', null, '\0', 'apollo', '2021-08-29 13:18:41', null, '2021-08-29 13:18:41');
INSERT INTO `audit` VALUES ('12', 'Release', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:18:45', null, '2021-08-29 13:18:45');
INSERT INTO `audit` VALUES ('13', 'ReleaseHistory', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:18:45', null, '2021-08-29 13:18:45');
INSERT INTO `audit` VALUES ('14', 'App', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:24:47', null, '2021-08-29 13:24:47');
INSERT INTO `audit` VALUES ('15', 'AppNamespace', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:24:48', null, '2021-08-29 13:24:48');
INSERT INTO `audit` VALUES ('16', 'Cluster', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:24:48', null, '2021-08-29 13:24:48');
INSERT INTO `audit` VALUES ('17', 'Namespace', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:24:48', null, '2021-08-29 13:24:48');
INSERT INTO `audit` VALUES ('18', 'Item', '2', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:25:22', null, '2021-08-29 13:25:22');
INSERT INTO `audit` VALUES ('19', 'Release', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:25:27', null, '2021-08-29 13:25:27');
INSERT INTO `audit` VALUES ('20', 'ReleaseHistory', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:25:27', null, '2021-08-29 13:25:27');
INSERT INTO `audit` VALUES ('21', 'Item', '2', 'UPDATE', null, '\0', 'apollo', '2021-08-29 13:30:01', null, '2021-08-29 13:30:01');
INSERT INTO `audit` VALUES ('22', 'Release', '5', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:33:34', null, '2021-08-29 13:33:34');
INSERT INTO `audit` VALUES ('23', 'ReleaseHistory', '5', 'INSERT', null, '\0', 'apollo', '2021-08-29 13:33:34', null, '2021-08-29 13:33:34');
INSERT INTO `audit` VALUES ('24', 'Namespace', '2', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:07:25', null, '2021-08-29 14:07:25');
INSERT INTO `audit` VALUES ('25', 'Cluster', '2', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:07:26', null, '2021-08-29 14:07:26');
INSERT INTO `audit` VALUES ('26', 'App', '2', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:07:26', null, '2021-08-29 14:07:26');
INSERT INTO `audit` VALUES ('27', 'App', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:07:50', null, '2021-08-29 14:07:50');
INSERT INTO `audit` VALUES ('28', 'AppNamespace', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:07:50', null, '2021-08-29 14:07:50');
INSERT INTO `audit` VALUES ('29', 'Cluster', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:07:50', null, '2021-08-29 14:07:50');
INSERT INTO `audit` VALUES ('30', 'Namespace', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:07:50', null, '2021-08-29 14:07:50');
INSERT INTO `audit` VALUES ('31', 'Item', '3', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:08:12', null, '2021-08-29 14:08:12');
INSERT INTO `audit` VALUES ('32', 'Release', '6', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:08:17', null, '2021-08-29 14:08:17');
INSERT INTO `audit` VALUES ('33', 'ReleaseHistory', '6', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:08:17', null, '2021-08-29 14:08:17');
INSERT INTO `audit` VALUES ('34', 'Namespace', '1', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:12:11', null, '2021-08-29 14:12:11');
INSERT INTO `audit` VALUES ('35', 'Cluster', '1', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:12:11', null, '2021-08-29 14:12:11');
INSERT INTO `audit` VALUES ('36', 'App', '1', 'DELETE', null, '\0', 'apollo', '2021-08-29 14:12:11', null, '2021-08-29 14:12:11');
INSERT INTO `audit` VALUES ('37', 'App', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:35', null, '2021-08-29 14:12:35');
INSERT INTO `audit` VALUES ('38', 'AppNamespace', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:35', null, '2021-08-29 14:12:35');
INSERT INTO `audit` VALUES ('39', 'Cluster', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:35', null, '2021-08-29 14:12:35');
INSERT INTO `audit` VALUES ('40', 'Namespace', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:35', null, '2021-08-29 14:12:35');
INSERT INTO `audit` VALUES ('41', 'Item', '4', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:48', null, '2021-08-29 14:12:48');
INSERT INTO `audit` VALUES ('42', 'Release', '7', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:51', null, '2021-08-29 14:12:51');
INSERT INTO `audit` VALUES ('43', 'ReleaseHistory', '7', 'INSERT', null, '\0', 'apollo', '2021-08-29 14:12:51', null, '2021-08-29 14:12:51');

-- ----------------------------
-- Table structure for cluster
-- ----------------------------
DROP TABLE IF EXISTS `cluster`;
CREATE TABLE `cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- ----------------------------
-- Records of cluster
-- ----------------------------
INSERT INTO `cluster` VALUES ('1', 'default', 'learn-provider', '0', '', 'apollo', '2021-08-29 12:19:52', 'apollo', '2021-08-29 14:12:11');
INSERT INTO `cluster` VALUES ('2', 'default', 'learn-consumer', '0', '', 'apollo', '2021-08-29 13:24:48', 'apollo', '2021-08-29 14:07:26');
INSERT INTO `cluster` VALUES ('3', 'default', 'learn-consumer-apollo', '0', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `cluster` VALUES ('4', 'default', 'learn-provider-apollo', '0', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- ----------------------------
-- Records of commit
-- ----------------------------
INSERT INTO `commit` VALUES ('1', '{\"createItems\":[{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"apollo配置测试样例\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 12:20:40\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 12:20:40\"}],\"updateItems\":[],\"deleteItems\":[]}', 'learn-provider', 'default', 'application', null, '', 'apollo', '2021-08-29 12:20:41', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `commit` VALUES ('2', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"true\",\"comment\":\"apollo配置测试样例\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 12:20:40\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 12:20:40\"},\"newItem\":{\"namespaceId\":1,\"key\":\"sms.enable\",\"value\":\"false\",\"comment\":\"apollo配置测试样例\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 12:20:40\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 13:18:40\"}}],\"deleteItems\":[]}', 'learn-provider', 'default', 'application', null, '', 'apollo', '2021-08-29 13:18:41', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `commit` VALUES ('3', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"9999\",\"comment\":\"更改项目端口号\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 13:25:20\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 13:25:21\"}],\"updateItems\":[],\"deleteItems\":[]}', 'learn-consumer', 'default', 'application', null, '', 'apollo', '2021-08-29 13:25:22', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `commit` VALUES ('4', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"server.port\",\"value\":\"9999\",\"comment\":\"项目端口号\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 14:08:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 14:08:11\"}],\"updateItems\":[],\"deleteItems\":[]}', 'learn-consumer-apollo', 'default', 'application', null, '\0', 'apollo', '2021-08-29 14:08:12', 'apollo', '2021-08-29 14:08:12');
INSERT INTO `commit` VALUES ('5', '{\"createItems\":[{\"namespaceId\":4,\"key\":\"server.port\",\"value\":\"9022\",\"lineNum\":1,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-08-29 14:12:47\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-08-29 14:12:47\"}],\"updateItems\":[],\"deleteItems\":[]}', 'learn-provider-apollo', 'default', 'application', null, '\0', 'apollo', '2021-08-29 14:12:48', 'apollo', '2021-08-29 14:12:48');

-- ----------------------------
-- Table structure for grayreleaserule
-- ----------------------------
DROP TABLE IF EXISTS `grayreleaserule`;
CREATE TABLE `grayreleaserule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- ----------------------------
-- Records of grayreleaserule
-- ----------------------------

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES ('1', 'learn-provider', 'default', '', '192.168.1.6', '2021-08-29 13:18:07', '2021-08-29 13:18:07');
INSERT INTO `instance` VALUES ('2', 'learn-consumer', 'default', '', '192.168.1.6', '2021-08-29 13:42:58', '2021-08-29 13:42:58');
INSERT INTO `instance` VALUES ('3', 'learn-consumer-apollo', 'default', '', '192.168.1.6', '2021-08-29 14:09:39', '2021-08-29 14:09:39');
INSERT INTO `instance` VALUES ('4', 'learn-provider-apollo', 'default', '', '192.168.1.6', '2021-08-29 14:17:03', '2021-08-29 14:17:03');

-- ----------------------------
-- Table structure for instanceconfig
-- ----------------------------
DROP TABLE IF EXISTS `instanceconfig`;
CREATE TABLE `instanceconfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- ----------------------------
-- Records of instanceconfig
-- ----------------------------
INSERT INTO `instanceconfig` VALUES ('3', '3', 'learn-consumer-apollo', 'default', 'application', '20210829140816-814b3813cb90700c', '2021-08-29 14:09:39', '2021-08-29 14:09:39', '2021-08-29 14:52:28');
INSERT INTO `instanceconfig` VALUES ('4', '4', 'learn-provider-apollo', 'default', 'application', '20210829141250-09b03813cb90700d', '2021-08-29 14:17:03', '2021-08-29 14:17:03', '2021-08-29 14:52:03');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1', 'sms.enable', 'false', 'apollo配置测试样例', '1', '', 'apollo', '2021-08-29 12:20:40', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `item` VALUES ('2', '2', 'server.port', '9999', '更改项目端口号', '1', '', 'apollo', '2021-08-29 13:25:21', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `item` VALUES ('3', '3', 'server.port', '9999', '项目端口号', '1', '\0', 'apollo', '2021-08-29 14:08:12', 'apollo', '2021-08-29 14:08:12');
INSERT INTO `item` VALUES ('4', '4', 'server.port', '9022', null, '1', '\0', 'apollo', '2021-08-29 14:12:48', 'apollo', '2021-08-29 14:12:48');

-- ----------------------------
-- Table structure for namespace
-- ----------------------------
DROP TABLE IF EXISTS `namespace`;
CREATE TABLE `namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- ----------------------------
-- Records of namespace
-- ----------------------------
INSERT INTO `namespace` VALUES ('1', 'learn-provider', 'default', 'application', '', 'apollo', '2021-08-29 12:19:52', 'apollo', '2021-08-29 14:12:11');
INSERT INTO `namespace` VALUES ('2', 'learn-consumer', 'default', 'application', '', 'apollo', '2021-08-29 13:24:48', 'apollo', '2021-08-29 14:07:26');
INSERT INTO `namespace` VALUES ('3', 'learn-consumer-apollo', 'default', 'application', '\0', 'apollo', '2021-08-29 14:07:50', 'apollo', '2021-08-29 14:07:50');
INSERT INTO `namespace` VALUES ('4', 'learn-provider-apollo', 'default', 'application', '\0', 'apollo', '2021-08-29 14:12:35', 'apollo', '2021-08-29 14:12:35');

-- ----------------------------
-- Table structure for namespacelock
-- ----------------------------
DROP TABLE IF EXISTS `namespacelock`;
CREATE TABLE `namespacelock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- ----------------------------
-- Records of namespacelock
-- ----------------------------

-- ----------------------------
-- Table structure for release
-- ----------------------------
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- ----------------------------
-- Records of release
-- ----------------------------
INSERT INTO `release` VALUES ('1', '20210829122047-04683813cb907007', '20210829122043-release', '', 'learn-provider', 'default', 'application', '{\"sms.enable\":\"true\"}', '\0', '', 'apollo', '2021-08-29 12:20:47', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `release` VALUES ('2', '20210829130823-04683813cb907008', '20210829130817-release', '', 'learn-provider', 'default', 'application', '{\"sms.enable\":\"true\"}', '\0', '', 'apollo', '2021-08-29 13:08:23', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `release` VALUES ('3', '20210829131845-04683813cb907009', '20210829131842-release', '', 'learn-provider', 'default', 'application', '{\"sms.enable\":\"false\"}', '\0', '', 'apollo', '2021-08-29 13:18:45', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `release` VALUES ('4', '20210829132527-152d3813cb90700a', '20210829132524-release', '', 'learn-consumer', 'default', 'application', '{\"server.port\":\"9999\"}', '\0', '', 'apollo', '2021-08-29 13:25:27', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `release` VALUES ('5', '20210829133334-152d3813cb90700b', '20210829133332-release', '', 'learn-consumer', 'default', 'application', '{\"server.port\":\"9999\"}', '\0', '', 'apollo', '2021-08-29 13:33:34', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `release` VALUES ('6', '20210829140816-814b3813cb90700c', '20210829140814-release', '', 'learn-consumer-apollo', 'default', 'application', '{\"server.port\":\"9999\"}', '\0', '\0', 'apollo', '2021-08-29 14:08:17', 'apollo', '2021-08-29 14:08:17');
INSERT INTO `release` VALUES ('7', '20210829141250-09b03813cb90700d', '20210829141249-release', '', 'learn-provider-apollo', 'default', 'application', '{\"server.port\":\"9022\"}', '\0', '\0', 'apollo', '2021-08-29 14:12:51', 'apollo', '2021-08-29 14:12:51');

-- ----------------------------
-- Table structure for releasehistory
-- ----------------------------
DROP TABLE IF EXISTS `releasehistory`;
CREATE TABLE `releasehistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- ----------------------------
-- Records of releasehistory
-- ----------------------------
INSERT INTO `releasehistory` VALUES ('1', 'learn-provider', 'default', 'application', 'default', '1', '0', '0', '{\"isEmergencyPublish\":false}', '', 'apollo', '2021-08-29 12:20:47', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `releasehistory` VALUES ('2', 'learn-provider', 'default', 'application', 'default', '2', '1', '0', '{\"isEmergencyPublish\":false}', '', 'apollo', '2021-08-29 13:08:23', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `releasehistory` VALUES ('3', 'learn-provider', 'default', 'application', 'default', '3', '2', '0', '{\"isEmergencyPublish\":false}', '', 'apollo', '2021-08-29 13:18:45', 'apollo', '2021-08-29 14:12:10');
INSERT INTO `releasehistory` VALUES ('4', 'learn-consumer', 'default', 'application', 'default', '4', '0', '0', '{\"isEmergencyPublish\":false}', '', 'apollo', '2021-08-29 13:25:27', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `releasehistory` VALUES ('5', 'learn-consumer', 'default', 'application', 'default', '5', '4', '0', '{\"isEmergencyPublish\":false}', '', 'apollo', '2021-08-29 13:33:34', 'apollo', '2021-08-29 14:07:25');
INSERT INTO `releasehistory` VALUES ('6', 'learn-consumer-apollo', 'default', 'application', 'default', '6', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2021-08-29 14:08:17', 'apollo', '2021-08-29 14:08:17');
INSERT INTO `releasehistory` VALUES ('7', 'learn-provider-apollo', 'default', 'application', 'default', '7', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2021-08-29 14:12:51', 'apollo', '2021-08-29 14:12:51');

-- ----------------------------
-- Table structure for releasemessage
-- ----------------------------
DROP TABLE IF EXISTS `releasemessage`;
CREATE TABLE `releasemessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- ----------------------------
-- Records of releasemessage
-- ----------------------------
INSERT INTO `releasemessage` VALUES ('3', 'learn-provider+default+application', '2021-08-29 13:18:45');
INSERT INTO `releasemessage` VALUES ('6', 'learn-consumer+default+application', '2021-08-29 14:07:26');
INSERT INTO `releasemessage` VALUES ('7', 'learn-consumer-apollo+default+application', '2021-08-29 14:08:17');
INSERT INTO `releasemessage` VALUES ('8', 'learn-provider+default+application', '2021-08-29 14:12:11');
INSERT INTO `releasemessage` VALUES ('9', 'learn-provider-apollo+default+application', '2021-08-29 14:12:51');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES ('1', 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', '\0', 'default', '2021-08-29 11:07:38', '', '2021-08-29 11:07:38');
INSERT INTO `serverconfig` VALUES ('2', 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', '\0', 'default', '2021-08-29 11:07:38', '', '2021-08-29 11:07:38');
INSERT INTO `serverconfig` VALUES ('3', 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', '\0', 'default', '2021-08-29 11:07:38', '', '2021-08-29 11:07:38');
INSERT INTO `serverconfig` VALUES ('4', 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', '\0', 'default', '2021-08-29 11:07:38', '', '2021-08-29 11:07:38');
INSERT INTO `serverconfig` VALUES ('5', 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', '\0', 'default', '2021-08-29 11:07:38', '', '2021-08-29 11:07:38');
