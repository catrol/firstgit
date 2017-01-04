/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : innerspace

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-27 15:46:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `in_info`
-- ----------------------------
DROP TABLE IF EXISTS `in_info`;
CREATE TABLE `in_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `date` varchar(21) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_info
-- ----------------------------
INSERT INTO `in_info` VALUES ('1', '3', 'hello world', '2016/12/1', '1');
INSERT INTO `in_info` VALUES ('2', '3', 'today is a good day.', '2016/12/5', '1');
INSERT INTO `in_info` VALUES ('3', '3', 'the air is so terrible!', '2016/12/11', '1');
INSERT INTO `in_info` VALUES ('4', '2', 'It\'s a beginning.', '2016/12/1', '1');
INSERT INTO `in_info` VALUES ('5', '2', 'simple is the best.', '2016/12/2', '1');
INSERT INTO `in_info` VALUES ('6', '1', 'no pain,no gain.', '2016/12/7', '1');
INSERT INTO `in_info` VALUES ('7', '1', 'far one walk,wider the road.', '2016/12/17', '1');
INSERT INTO `in_info` VALUES ('8', '2', 'to-do list', '2016/12/4', '1');
