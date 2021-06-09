/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : rental

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 09/06/2021 16:29:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('fan', 'fan');

-- ----------------------------
-- Table structure for college_department_class
-- ----------------------------
DROP TABLE IF EXISTS `college_department_class`;
CREATE TABLE `college_department_class`  (
  `college` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cclass` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`college`, `department`, `cclass`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of college_department_class
-- ----------------------------
INSERT INTO `college_department_class` VALUES ('应用数学学院', '数学', '数学1');
INSERT INTO `college_department_class` VALUES ('应用数学学院', '数学', '数学2');
INSERT INTO `college_department_class` VALUES ('应用数学学院', '数理基础科学', '数理基础1');
INSERT INTO `college_department_class` VALUES ('应用数学学院', '数理基础科学', '数理基础2');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '新媒体', '18新媒体1');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '新媒体', '18新媒体2');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '软件工程', '18软件(理软)1');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '软件工程', '18软件(理软)2');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '软件工程', '19软件(理软)1');
INSERT INTO `college_department_class` VALUES ('软件工程学院', '软件工程', '19软件(理软)2');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_info` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('c1111', 'java进阶', '19900000000', '关于java进阶的故事啊啊啊啊');
INSERT INTO `course` VALUES ('c1113', '软件测试', '19900000000', '软件测试课程');
INSERT INTO `course` VALUES ('cccc', 'as撒大大', '19900000000', '第三方爽肤水发顺丰所ddd');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `time` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('2021.5.1-2021.5.10');
INSERT INTO `schedule` VALUES ('2021.5.10-2021.5.15');
INSERT INTO `schedule` VALUES ('2021.5.3-2021.5.5');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('111111', '刘一', '123');
INSERT INTO `student` VALUES ('222222', '陈二', '123');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_education` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('张三', '13200000000', '广州', '100', '保洁员');
INSERT INTO `teacher` VALUES ('李四', '15800000000', '西安', '110', '家庭教师');
INSERT INTO `teacher` VALUES ('王五', '18600000000', '上海', '150', '快递员');
INSERT INTO `teacher` VALUES ('赵六', '19900000000', '北京', '200', '外卖员');

SET FOREIGN_KEY_CHECKS = 1;
