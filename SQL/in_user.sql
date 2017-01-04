/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : innerspace

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-27 15:46:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `in_user`
-- ----------------------------
DROP TABLE IF EXISTS `in_user`;
CREATE TABLE `in_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(33) NOT NULL,
  `password` varchar(34) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_user
-- ----------------------------
INSERT INTO `in_user` VALUES ('1', 'k', '111', '0');
INSERT INTO `in_user` VALUES ('2', 'admin', '123', '0');
INSERT INTO `in_user` VALUES ('3', 's', '222', '0');
