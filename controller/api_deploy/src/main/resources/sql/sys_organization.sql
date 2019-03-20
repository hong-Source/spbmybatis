/*
 Navicat Premium Data Transfer

 Source Server         : 本机Mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : demodb

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 20/03/2019 18:40:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organizationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `englishName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chineseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` bigint(20) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `inCharge` bigint(20) NULL DEFAULT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` bigint(20) NULL DEFAULT NULL,
  `zipCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `officialWebsite` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scopeOfBusiness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu`(`organizationName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, '组织', NULL, NULL, NULL, NULL, '2018-06-22 15:53:40', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `common` tinyint(1) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('82e2db43f27242d990ad48bc0c5295d6', '', '超级管理员', '', 0, 1, '系统自动生成的超级管理员角色');
INSERT INTO `sys_role` VALUES ('aa3e06521311472681f90a28e10e668b', '', '领导', '', 0, 1, '系统自动生成的领导角色');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weChat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthDay` date NULL DEFAULT NULL,
  `manager` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('22', 'admin', '123', '刘', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('23', 'wangxuefu', 'YgEvrofrPh8=', '王学福', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '');
INSERT INTO `sys_user` VALUES ('24', 'dingguomin', 'YgEvrofrPh8=', '丁国民', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('25', 'xubaoyuan', 'YgEvrofrPh8=', '胥宝苑', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('26', 'chezongcai', 'YgEvrofrPh8=', '车宗彩', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('27', 'wangxiaofang', 'YgEvrofrPh8=', '王小芳', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('28', 'zhangyongming', 'YgEvrofrPh8=', '张永明', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('29', 'qianjuxiu', 'YgEvrofrPh8=', '钱菊秀', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('30', 'chenyan', 'YgEvrofrPh8=', '陈岩', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('31', 'cuidonglong', 'YgEvrofrPh8=', '崔冬龙', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('32', 'dongyongjun', 'YgEvrofrPh8=', '董永骏', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('33', 'fankexin', 'YgEvrofrPh8=', '范可心', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('34', 'luoyumei', 'YgEvrofrPh8=', '罗玉梅', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('35', 'nizhaorui', 'YgEvrofrPh8=', '倪兆睿', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('36', 'wanghaiyun', 'YgEvrofrPh8=', '王海云', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('37', 'liuxiqin', 'YgEvrofrPh8=', '刘希芹', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('38', 'guoshengxiang', 'YgEvrofrPh8=', '郭生祥', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('39', 'haohu', 'YgEvrofrPh8=', '郝虎', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('40', 'zhaojianhu', 'YgEvrofrPh8=', '赵建虎', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('41', 'zhangjianqi', 'YgEvrofrPh8=', '张建奇', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('42', 'wangling', 'YgEvrofrPh8=', '王零', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('43', 'songcaifu', 'YgEvrofrPh8=', '宋采福', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('44', 'guanxiaoying', 'YgEvrofrPh8=', '管小英', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('45', 'liuhaihong', 'YgEvrofrPh8=', '刘海红', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('46', 'maduifang', 'YgEvrofrPh8=', '马堆芳', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('47', 'jiangzhicheng', 'YgEvrofrPh8=', '蒋志成', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('48', 'majun', 'YgEvrofrPh8=', '马俊', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '');
INSERT INTO `sys_user` VALUES ('49', 'liulili', 'YgEvrofrPh8=', '刘丽丽', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('50', 'zhangjuntao', 'YgEvrofrPh8=', '张俊涛', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('51', 'shangjinrong', 'YgEvrofrPh8=', '尚金荣', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('52', 'dihua', 'YgEvrofrPh8=', '邸华', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('53', 'chezongxi', 'YgEvrofrPh8=', '车宗玺', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('54', 'liyuanhong', 'YgEvrofrPh8=', '李元鸿', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('55', 'maozhiming', 'YgEvrofrPh8=', '毛志明', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('56', 'lishuojun', 'YgEvrofrPh8=', '李硕军', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('57', 'jiadecheng', 'YgEvrofrPh8=', '贾德成', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('58', 'lijinwen', 'YgEvrofrPh8=', '李金文', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('59', 'panxin', 'YgEvrofrPh8=', '潘欣', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '');
INSERT INTO `sys_user` VALUES ('60', 'lishixia', 'YgEvrofrPh8=', '李世霞', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('61', 'jinminyan', 'YgEvrofrPh8=', '金敏艳', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('62', 'liguiqin', 'YgEvrofrPh8=', '李贵琴', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('63', 'lizejia', 'YgEvrofrPh8=', '李泽嘉', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('64', 'wangminghai', 'YgEvrofrPh8=', '王明海', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('65', 'sunxiaoxia', 'YgEvrofrPh8=', '孙小霞', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('66', 'yuanhong', 'YgEvrofrPh8=', '袁虹', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('67', 'fengweidong', 'YgEvrofrPh8=', '冯炜东', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('68', 'gaosong', 'YgEvrofrPh8=', '高松', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('69', 'luobianjiang', 'YgEvrofrPh8=', '罗边疆', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('70', 'lixiaoming', 'YgEvrofrPh8=', '李晓明', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('71', 'peiwen', 'YgEvrofrPh8=', '裴雯', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '');
INSERT INTO `sys_user` VALUES ('72', '汪局长', 'YgEvrofrPh8=', '汪局长', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('73', '李局长', 'YgEvrofrPh8=', '李局长', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '祁连山用户');
INSERT INTO `sys_user` VALUES ('74', 'username51', 'password51', 'nickname51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES ('75', 'usernamenew', 'passwordnew', 'nicknamenew', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
