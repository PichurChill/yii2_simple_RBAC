/*
Navicat MySQL Data Transfer

Source Server         : MySQL1_copy
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : studenttask

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-10-08 09:00:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `st_id` varchar(15) NOT NULL COMMENT '学号',
  `st_name` varchar(15) NOT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `status` varchar(10) NOT NULL COMMENT '权限代码',
  `authKey` varchar(50) DEFAULT NULL,
  `accessToken` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `st_id` (`st_id`)
)  AUTO_INCREMENT=11;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '031513218', '金1', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'jin-auth', 'jin-access');
INSERT INTO `users` VALUES ('2', '031513221', '卢2', 'e10adc3949ba59abbe56e057f20f883e', '干部', 'lu-auth', 'lu-access');
INSERT INTO `users` VALUES ('4', '031513219', '葛3', 'e10adc3949ba59abbe56e057f20f883e', '物料管理员', null, null);
INSERT INTO `users` VALUES ('5', '031513204', '丁4', 'e10adc3949ba59abbe56e057f20f883e', '部员', null, null);
INSERT INTO `users` VALUES ('6', '031513203', '王5', 'e10adc3949ba59abbe56e057f20f883e', '部员', null, null);
INSERT INTO `users` VALUES ('7', '031513113', '沈6', 'e10adc3949ba59abbe56e057f20f883e', '干部', null, null);
INSERT INTO `users` VALUES ('8', '031513201', '张7', 'e10adc3949ba59abbe56e057f20f883e', '管理员', null, null);
INSERT INTO `users` VALUES ('9', '031513213', '蔡8', 'e10adc3949ba59abbe56e057f20f883e', '管理员', null, null);
INSERT INTO `users` VALUES ('10', '031513207', '王9', 'e10adc3949ba59abbe56e057f20f883e', '管理员', null, null);
SET FOREIGN_KEY_CHECKS=1;
