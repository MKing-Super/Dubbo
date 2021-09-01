/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50703
Source Host           : 127.0.0.1:3306
Source Database       : dubbo_learn

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2021-09-01 19:59:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dubbo_user
-- ----------------------------
DROP TABLE IF EXISTS `dubbo_user`;
CREATE TABLE `dubbo_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(10) DEFAULT NULL COMMENT '账号',
  `password` varchar(10) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创造时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dubbo_user
-- ----------------------------
INSERT INTO `dubbo_user` VALUES ('1', 'MK', '123456', '2021-09-01 14:53:44');
