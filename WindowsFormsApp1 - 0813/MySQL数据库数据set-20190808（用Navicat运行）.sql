/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : set

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 08/08/2019 09:11:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kpi
-- ----------------------------
DROP TABLE IF EXISTS `kpi`;
CREATE TABLE `kpi`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `目标值` int(20) NULL DEFAULT NULL,
  `比重` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `达成数` int(20) NULL DEFAULT NULL,
  `目标数` int(20) NULL DEFAULT NULL,
  `达成率` int(20) NULL DEFAULT NULL,
  `項次` int(10) NULL DEFAULT NULL,
  `工号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `更新時間` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `第幾周` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `工号`) USING BTREE,
  INDEX `工号`(`工号`) USING BTREE,
  CONSTRAINT `job` FOREIGN KEY (`工号`) REFERENCES `user_info` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi
-- ----------------------------
INSERT INTO `kpi` VALUES (1, 100, '45', 1, 1, 100, 1, '18006122', '2019-07-09 14:30:09.031010', NULL);
INSERT INTO `kpi` VALUES (2, 100, '45', 1, 1, 100, NULL, '18006122', '2019-07-09 13:54:18.350010', NULL);

-- ----------------------------
-- Table structure for kpi_info
-- ----------------------------
DROP TABLE IF EXISTS `kpi_info`;
CREATE TABLE `kpi_info`  (
  `id` int(10) NOT NULL,
  `kpi` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi輔項` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kpi細項` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `審核方式` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `評核計算方式` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `項目` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `系統編號` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `細項` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新時間` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工號` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `工號`) USING BTREE,
  INDEX `job02`(`工號`) USING BTREE,
  CONSTRAINT `job02` FOREIGN KEY (`工號`) REFERENCES `user_info` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_info
-- ----------------------------
INSERT INTO `kpi_info` VALUES (1, '專案質量', '進度管理', '負責專案進度更新', 'jira留言', '量測達成數\\總量測數', '多點溫度監控系統', 'NHPD-456', '交接中', NULL, '18006122');
INSERT INTO `kpi_info` VALUES (2, '專案質量', '進度管理', '以專案進度排程表和測試進度時程表進行管控', '排程表每日更新', '量測達成數\\總量測數', '多點溫度監控系統', 'NHPD-456', '交接中', NULL, '18006122');

-- ----------------------------
-- Table structure for kpi_msg
-- ----------------------------
DROP TABLE IF EXISTS `kpi_msg`;
CREATE TABLE `kpi_msg`  (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `KPI` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KPI辅项` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KPI细项` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `审核方式` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `评核计算方式` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `目标值` int(10) NULL DEFAULT NULL,
  `比重` int(10) NULL DEFAULT NULL,
  `达成数` int(50) NULL DEFAULT NULL,
  `目标数` int(50) NULL DEFAULT NULL,
  `达成率` int(10) NULL DEFAULT NULL,
  `项次` int(10) NULL DEFAULT NULL,
  `项目` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `系统编号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `细项` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新时间` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `第几周` int(10) NULL DEFAULT NULL,
  `工号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_msg
-- ----------------------------
INSERT INTO `kpi_msg` VALUES (1, '专案质量', '进度管理', '测试1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1001, 88, 1, 1, 100, 1, 'EMI量测', 'ECH-1947', '低频量测完成，PASS。', '2019-08-08 08:50:12', 18, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (2, NULL, NULL, '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1002, 45, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-06 16:20:35', NULL, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (3, NULL, NULL, '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1003, 45, 3, 1, NULL, 1, 'EMI量测', 'ECH-1947', '低频量测完成，PASS。', '2019-08-06 16:20:32', NULL, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (4, '进度管理', '进度', '001', '002', '003', 1004, 45, 4, 1, 100, 1, '001', '001', '0001', '2019-08-06 16:20:30', NULL, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (5, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 5, 1, NULL, 1, '软件测试', '20190731', 'TEST01', '2019-08-06 16:20:26', NULL, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (6, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1006, 45, 6, 1, NULL, 1, '软件测试', '20190731-1', 'test02', '2019-08-06 16:20:36', NULL, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (7, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1007, 45, 7, 1, NULL, 1, '软件测试', '20190731-3', 'test03', '2019-08-06 16:20:39', NULL, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (8, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1008, 45, 8, 1, NULL, 1, '软件测试', '20190731-4', 'test4', '2019-08-06 16:20:47', NULL, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (9, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 10086, 45, 0, 0, NULL, 0, '输入项目名称', '输入系统编号', '请输入详细信息。', '2019-08-06 16:02:09', NULL, '00001', 'admin');
INSERT INTO `kpi_msg` VALUES (10, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 0, 0, NULL, 0, '输入项目名称', '输入系统编号', '请输入详细信息。', '2019-08-07 17:01:47', NULL, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (11, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 2, 2, NULL, 1, '输入项目名称', '输入系统编号', 'fdsfssf', '2019-08-07 17:34:37', NULL, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (12, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 100, 45, 4, 5, NULL, 5, '输入项目名称', '输入系统编号', '请输入详细信息。test~~', '2019-08-08 08:24:04', NULL, '00001', 'admin');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, '林靜忠', '18013950', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (2, '呂運鼎', '18006122', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (3, '何文廣', '17008224', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (4, '羅曉', '17015471', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (5, '林達', '14049595', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (6, '黃小如', '17022338', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (7, '陳遠宏', '18013030', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (8, '徐思怡', '17008226', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (9, '陳健麗', '17012332', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (10, '莫曉玲', '17015781', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (11, '覃家銘', '17016456', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (12, '楊春蘭', '18002496', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (13, '李元安', '18010811', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (14, '陸坤雄', '18014265', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (15, 'admin', 'admin', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (16, '李嘉俊', '19004113', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (17, '张超鹏', '19004113', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (18, '陈焕和', '19004470', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (19, '张三', '10086', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (20, '李四', '10010', '2019-07-31 09:57:49');
INSERT INTO `login` VALUES (21, '王五', '10000', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (22, '王五一', '10000', '0000-00-00 00:00:00');
INSERT INTO `login` VALUES (23, '陈六', '10000', '2019-07-31 10:16:50');
INSERT INTO `login` VALUES (24, '杨七', '10086', '2019-07-31 10:29:14');

-- ----------------------------
-- Table structure for login1
-- ----------------------------
DROP TABLE IF EXISTS `login1`;
CREATE TABLE `login1`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login1
-- ----------------------------
INSERT INTO `login1` VALUES (1, 'ewwe', 'ewewe', '2019-07-31 10:14:37');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`, `job_id`) USING BTREE,
  INDEX `工号`(`job_id`) USING BTREE,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `login` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '林靜忠', 'INNOLUX', '81823', 'set', NULL, '18013950', '18013950');
INSERT INTO `user_info` VALUES (2, '呂運鼎', 'INNOLUX', '87541', 'set', NULL, '18006122', '18006122');
INSERT INTO `user_info` VALUES (3, '何文廣', 'INNOLUX', '82112', 'set', NULL, '17008224', '17008224');
INSERT INTO `user_info` VALUES (4, '羅曉', 'INNOLUX', '87975', 'set', NULL, '17015471', '17015471');
INSERT INTO `user_info` VALUES (5, '林達', 'INNOLUX', '82134', 'set', NULL, '14049595', '14049595');
INSERT INTO `user_info` VALUES (6, '黃小如', 'INNOLUX', '80783', 'set', NULL, '17022338', '17022338');
INSERT INTO `user_info` VALUES (7, '陳遠宏', 'INNOLUX', '85165', 'set', NULL, '18013030', '18013030');
INSERT INTO `user_info` VALUES (8, '徐思怡', 'INNOLUX', '81707', 'set', NULL, '17008226', '17008226');
INSERT INTO `user_info` VALUES (9, '陳健麗', 'INNOLUX', '81822', 'set', NULL, '17012332', '17012332');
INSERT INTO `user_info` VALUES (10, '莫曉玲', 'INNOLUX', '80787', 'set', NULL, '17015781', '17015781');
INSERT INTO `user_info` VALUES (11, '覃家銘', 'INNOLUX', '87546', 'set', NULL, '17016456', '17016456');
INSERT INTO `user_info` VALUES (12, '楊春蘭', 'INNOLUX', '82125', 'set', NULL, '18002496', '18002496');
INSERT INTO `user_info` VALUES (13, '李元安', 'INNOLUX', '89150', 'set', NULL, '18010811', '18010811');
INSERT INTO `user_info` VALUES (14, '陸坤雄', 'INNOLUX', '82228', 'set', NULL, '18014265', '18014265');
INSERT INTO `user_info` VALUES (15, 'admin', 'INNOLUX', NULL, 'set', NULL, '88888888', '88888888');
INSERT INTO `user_info` VALUES (16, '李嘉俊', 'INNOLUX', '81864', 'set', NULL, '19001260', '19001260');
INSERT INTO `user_info` VALUES (17, '张超鹏', 'INNOLUX', '82104', 'set', NULL, '19004113', '19004113');
INSERT INTO `user_info` VALUES (18, '陈焕和', 'INNOLUX', '81705', 'set', NULL, '19004470', '19004470');

SET FOREIGN_KEY_CHECKS = 1;
