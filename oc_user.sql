/*
Navicat MySQL Data Transfer

Source Server         : DATA
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cnvang_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-03 23:28:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oc_user
-- ----------------------------
DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user
-- ----------------------------
INSERT INTO `oc_user` VALUES ('1', '1', 'admin', '2a7b49f506167ba1d4b3cacc287a288a51a4a20f', '06a4b3fa0', 'le van', 'hung', 'info@attvietnam.vn', '', '127.0.0.1', '1', '2015-09-16 08:43:00');
INSERT INTO `oc_user` VALUES ('2', '1', 'quantri', '0eef7d44663bc763670d86eff13ac767e1c27d9f', '5f6a38667', 'Trần', 'Kiên', 'kientran886@gmail.com', '', '123.16.4.112', '1', '2014-01-27 23:47:21');
