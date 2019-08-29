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

 Date: 22/08/2019 11:19:14
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
  `达成数` int(10) NULL DEFAULT NULL,
  `目标数` int(10) NULL DEFAULT NULL,
  `达成率` int(10) NOT NULL,
  `项次` int(10) NULL DEFAULT NULL,
  `项目` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `系统编号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `细项` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新时间` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `第几周` int(10) NULL DEFAULT NULL,
  `工号` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `姓名` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi_msg
-- ----------------------------
INSERT INTO `kpi_msg` VALUES (1, '專案質量', '進度管理', '测试1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1001, 88, 1, 1, 100, 1, 'EMI量测', 'ECH-1947', '低频量测完成，PASS。', '2019-08-20 11:39:55', 18, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (2, NULL, NULL, '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1002, 45, 2, NULL, 90, NULL, NULL, NULL, NULL, '2019-08-16 16:52:23', 9, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (3, NULL, NULL, '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1003, 45, 3, 1, 88, 1, 'EMI量测', 'ECH-1947', '低频量测完成，PASS。', '2019-08-16 16:52:27', 10, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (4, '进度管理', '进度', '001', '002', '003', 1004, 45, 4, 1, 100, 1, '001', '001', '0001', '2019-08-13 14:47:19', 11, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (5, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 5, 1, 99, 1, '软件测试', '20190731', 'TEST01', '2019-08-20 11:39:52', 12, NULL, '呂運鼎');
INSERT INTO `kpi_msg` VALUES (6, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1006, 45, 6, 1, 100, 1, '软件测试', '20190731-1', 'test02', '2019-08-20 11:39:57', 13, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (7, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1007, 45, 7, 1, 80, 1, '软件测试', '20190731-3', 'test03', '2019-08-20 11:39:59', 14, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (8, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1008, 45, 8, 1, 88, 1, '软件测试', '20190731-4', 'test4', '2019-08-20 11:40:02', 15, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (9, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 10086, 45, 0, 0, 66, 0, '输入项目名称', '输入系统编号', '请输入详细信息。', '2019-08-20 11:40:04', 16, '00001', 'admin');
INSERT INTO `kpi_msg` VALUES (10, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 0, 0, 78, 0, '输入项目名称', '输入系统编号', '请输入详细信息。', '2019-08-20 11:40:07', 17, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (11, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1005, 45, 2, 2, 100, 1, '输入项目名称', '输入系统编号', 'fdsfssf', '2019-08-20 11:40:08', 18, '00001', NULL);
INSERT INTO `kpi_msg` VALUES (12, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 100, 45, 4, 5, 100, 5, '输入项目名称', '输入系统编号', '请输入详细信息。test~~', '2019-08-20 11:40:11', 19, '00001', 'admin');
INSERT INTO `kpi_msg` VALUES (13, '專案質量', '準確度', '1.通過學習每個測項，及程序開發需求文檔，分析所開發的程序需要提供的數據和功能，不出現錯誤參數，和功能與需求報告不符的情況', '1.程序開發需求文檔審核 \r\n2.上級發出的需求信息', '量測達成數/總量測數', 10010, 50, 1, 1, 100, 1, NULL, NULL, NULL, '2019-08-13 14:57:24', 20, '00001', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (14, '專案質量', '準確度', '测试1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.程序开发需求文档\r\n审核；2.上级发出的\r\n需求信息。', '量测达成数/总量测数', 1001, 88, 0, 0, 100, 0, '输入项目名称', '输入系统编号', '请输入详细信息。', '2019-08-20 11:41:15', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (15, '專案質量', '進度管理', '测试1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 1001, 88, 555, 555, 555, 555, '555', '555', '555', '2019-08-20 11:40:15', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (16, '專案質量', '準確度', '1.通過學習每個測項，及程序開發需求文檔，分析所開發的程序需要提供的數據和功能，不出現錯誤參數，和功能與需求報告不符的情況', '1.程序開發需求文檔審核 \r\n2.上級發出的需求信息', '量測達成數/總量測數', 10010, 50, 666, 666, 666, 666, '666', '666', '666', '2019-08-20 11:41:17', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (17, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量測達成數/總量測數', 100, 45, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '當天有項目進度即通過JIRA 描述，附件上傳進行更新。', '2019-08-20 11:40:20', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (18, '專案質量', '進度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量測達成數/總量測數', 100, 45, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-20 11:40:22', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (19, '專案質量', '準確度', '1.通過學習每個測項，及程序開發需求文檔，分析所開發的程序需要提供的數據和功能，不出現錯誤參數，和功能與需求報告不符的情況', '1.程序開發需求文檔審核 \r\n2.上級發出的需求信息', '量測達成數/總量測數 ', 100, 45, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-20 11:41:50', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (20, '專案質量', '出錯率', '1.開發需求內容，在程序開發前前解讀準確，無出現開發項目不符合需求的情況。 ', '1.申請單項目審核 ；2.程序需求文擋審核。', '量測達成數/總量測數', 100, 45, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-20 11:40:27', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (21, '專案質量', '客戶滿意度', '1.每周報告程序開發工作進度，及時開發出程序功能，客戶的疑問立馬解析。', '1.客戶回饋(各個平台)', '客戶滿意數(無異常HL)/總測試數 ', 95, 45, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-20 11:40:31', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (22, '異常預防改善', 'DFX', '1.實驗室管理、儀器操作、設計改善等方向每個全新專案(不包含2nd source)要有5 point。DFQ,DFC,DFM(Design for quality,cost, manufactory)', '1.DFX文件審核 ', '每專案完成數/規定完成數 ', 100, 15, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-19 13:44:02', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (23, '異常預防改善', '偵錯能力', '1.學習他人的SOP及技術報告，找出其中的不足及錯誤，提出改善方案給工程師或對應人員進行修改，目標偵錯數為5個/月', '1.郵件及SOP修改記錄監控 \r\n2.資料搜集內容', '已完成數/目標數', 100, 15, 1, 1, 100, 1, '搜尋及閱讀C#，Mysql相關資料', NULL, '在軟件開發過程中搜集到的相關資料都已放在公共盤中', '2019-08-19 14:02:18', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (24, '異常預防改善', '有效性', '1.開發項目所涵蓋的需求內容能夠完整產出，無造成異常客訴。 \r\n2.軟件測試運行穩定性的提升。', '1.客訴內容 ', '測試項目/應測總項目 ', 100, 15, 0, 0, 100, 0, NULL, NULL, NULL, '2019-08-19 14:02:20', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (25, '效能改善', '效率', '1.優化操作手法和寫報告的效率 \r\n2.軟件運行速度的提升\r\n3.項目開發速度的提升', '1.負責項目測試時間縮短\r\n2.效率提升報告', '提升效率的項目數/總項目數', 100, 15, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-19 14:02:21', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (26, '效能改善', '精簡', '1.測試流程合理化-合併&精簡', '1.提案改善報告\r\n2.資產數據化&條理化', '精簡的項目數/總項目數', 90, 15, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467 ', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-19 14:02:23', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (27, '效能改善', '提案改善', '1.對效率提升和流程精簡做提案改善2份/月', '1.提案改善報告', '達成數/目標數', 100, 15, 1, 1, 100, 1, 'KPI管控系統的C#軟件開發', 'NHPD-467', '數據錄入的佈局基本完成，現在在進行數據錄入及匯總的程序編寫，待增加數據的圖表顯示。', '2019-08-19 14:02:24', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (28, '標準項目', '標准化', '建立教育資料文件', '1.工時拆分表\r\n2.測試SOP\r\n3.儀器使用登記表', '已完成數/目標數', 100, 5, 2, 2, 100, 2, '多點溫度監控系統的軟件開發、KPI管控系統的C#軟件開發', 'NHPD-456、467 ', '項目開發文件已上傳到JIRA', '2019-08-19 14:02:26', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (29, '教育訓練', '常規', '1.每周參加教育訓練 \r\n2.＞90%透過平台學習(教材學習)', '1.教育訓練登記表\r\n2.自主學習課程', '已完成數/目標數', 90, 10, 1, 1, 100, 1, '教育訓練學習', NULL, '《多點溫度監控系統講解》的學習', '2019-08-19 14:02:28', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (30, '教育訓練', '提案學習', '1.技術報告產出1份/月\r\n2.10% 偵錯能力以及異常處理能力學習-debug分析報告', '1.技術報告\r\n2.debug分析報告', '已完成數/目標數', 100, 10, 1, 1, 100, 1, 'C#編程', NULL, '《第1课   初识C#及其开发环境-20190614》上傳JIRA', '2019-08-19 14:02:29', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (31, '教育訓練', '新技術學習', '1.部門執掌範疇學習1項/季度\r\n2.行業內新技術學習1項/兩季度', '1.技術分享', '已完成數/目標數', 100, 10, 1, 1, 100, 1, '教育訓練', NULL, '《第1课   初识C#及其开发环境-20190614》', '2019-08-19 14:02:30', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (32, '大數據收集', '共享數據', 'guide line &checklist& lesson learn&技術報告 ', '1.平台化分享', '已完成數/目標數', 100, 10, 1, 1, 100, 1, '教育訓練', NULL, '課件，技術報告放入公共盤規定位置', '2019-08-19 14:02:32', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (33, '大數據收集', '文件管控', '1.嚴格按照部門規定存儲和定義管控文件 \r\n2.測試文件模板&測試SOP&大數據&測試報告 上JIRA系統管控', '1.JIRA系統', '已完成數/目標數', 100, 10, 1, 1, 100, 1, '教育訓練', NULL, '課件放入公共盤規定位置', '2019-08-19 14:02:34', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (34, '專案質量', '進度管理', '1.量測專案每日更新 \r\n2.以專案進度排程表和測試進度時程表進行管控 ', '1.JIRA留言 \r\n2.排程表每天更新', '已完成數/目標數', 100, 50, 1, 1, 100, 1, '小米40中國', NULL, '小米40中國項安規測試，正在進行中', '2019-08-20 13:32:01', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (35, '專案質量', '準確度', '1.通過學習每個測項，分析每份報告的合理性來達成量測報告的數據和內容，不出現錯誤參數', '1.測試報告審核 ', '已完成數/目標數', 100, 50, 1, 1, 100, 1, '小米40中國', NULL, '小米40中國項安規測試，正在進行中，暂无错误', '2019-08-20 13:32:12', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (36, '專案質量', '出錯率', '1.申請單的測試內容，在測試前解讀準確，無出現量測項目出錯。 \r\n2.每個測試都按標準sop執行，讓測試的出錯率低於5%', '1.申請單項目審核 ', '已完成數/目標數', 100, 50, 1, 1, 100, 1, '小米40中國', NULL, '小米40中國項安規測試，都按照sop测试', '2019-08-20 13:32:15', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (37, '專案質量', '客戶滿意度', '1.跟進測試工程師每天的工作進度，及時給出準確的報告，客戶的疑問立馬解析。', '1.客戶回饋(各個平台)', NULL, 100, 50, 1, 1, 100, 1, '小米40中國', '', '小米40中國項安規測試，正在進行中，暂无客诉', '2019-08-20 13:32:20', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (38, '異常預防改善', 'DFX', '1.實驗室管理、儀器操作、設計改善等方向每 季 度->每個全新專案(不包含2nd source)要有5 point。DFQ,DFC,DFM(Design for quality,cost, manufactory)', '1.DFX文件審核 ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2019-08-20 11:16:34', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (39, '異常預防改善', '偵錯能力', '1.學習他人的SOP及技術報告，找出其中的不足及錯誤，提出改善方案給工程師或對應人員進行修改，目標偵錯數為5個/月\r\n2.專案測試問題提出-每個專案要提出的數量-各專案 (A 1,B 3,C 5 Level)例\r\n3.對於產品量測出的issue進行debug分析。 ', NULL, NULL, NULL, NULL, NULL, NULL, 80, 1, '安規Sop', NULL, '安規殘留電荷SOP加入實物連接圖', '2019-08-20 11:16:35', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (40, '異常預防改善', '有效性', '1.測試項目所涵蓋的測試內容能夠有效檢出，無造成異常客訴。 \r\n2.測試涵蓋率、異常攔截率的提升', '1.客訴內容 ', NULL, NULL, NULL, NULL, NULL, 100, 2, '小米40中國', NULL, '小米40中國項安規測試，正在進行中，暂无客诉', '2019-08-20 11:16:36', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (41, '效能改善', '效率', '1.優化操作手法和寫報告的效率 ', '1.負責項目測試時間縮短\r\n2.效率提升報告', NULL, NULL, NULL, NULL, NULL, 100, 1, 'EMS SOP修改', NULL, 'EMS SOP版本修改，已修改到最新版本，已全部修改完場', '2019-08-20 11:16:38', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (42, '效能改善', '精簡', '1.測試流程合理化-合併&精簡', '1.提案改善報告\r\n2.資產數據化&條理化', NULL, NULL, NULL, NULL, NULL, 100, 2, '安規SOP修改', NULL, '安規 SOP版本修改，已修改到最新版本，已全部修改完場', '2019-08-20 11:16:39', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (43, '效能改善', '提案改善 ', '1.對效率提升和流程精簡做提案改善2份/月', '1.提案改善報告', NULL, NULL, NULL, NULL, NULL, 90, 3, '开关机测试自动化检测', NULL, '已测试电视关机到开机时的压差', '2019-08-20 11:16:40', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (44, '標準化', 'EMS', '1.工時標準化\r\n2.測試SOP標定\r\n3.儀器稼動率系統化', '1.工時拆分表\r\n2.測試SOP\r\n3.儀器使用登記表', NULL, NULL, NULL, NULL, NULL, 100, 1, 'EMS SOP修改', NULL, 'EMS SOP版本修改，已修改到最新版本，已全部修改完場', '2019-08-20 11:16:41', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (45, '標準化', 'Safety', '1.工時標準化\r\n2.測試SOP標定\r\n3.儀器稼動率系統化', '1.工時拆分表\r\n2.測試SOP\r\n3.儀器使用登記表', NULL, NULL, NULL, NULL, NULL, 100, 2, '安規SOP修改', NULL, '安規 SOP版本修改，已修改到最新版本，已全部修改完場', '2019-08-20 11:16:42', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (46, '標準化', '外包項目', '記錄出入庫時間，追蹤委外測試進度，跟進回程，確保機器的完整及數量。', '1.出庫與入庫達到100%吻合', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2019-08-20 11:16:44', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (47, '教育訓練', '常規', '1.每周參加教育訓練 \r\n2.＞90%透過平台學習(教材學習)', '1.教育訓練登記表\r\n2.自主學習課程', NULL, NULL, NULL, NULL, NULL, 100, 1, '部門教育訓練', NULL, '準時參加部門的教育訓練', '2019-08-20 11:16:45', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (48, '教育訓練', '提案學習', '1.技術報告產出1份/月\r\n2.10% 偵錯能力以及異常處理能力學習-debug分析報告', '1.技術報告\r\n2.debug分析報告', NULL, NULL, NULL, NULL, NULL, 100, 1, '技術報告', NULL, '技術報告已完成，已上傳JIRA', '2019-08-20 11:16:47', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (49, '教育訓練', '新技術學習 ', '1.部門執掌範疇學習1項/季度\r\n2.行業內新技術學習1項/兩季度', '1.技術分享', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2019-08-20 11:16:48', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (50, '大數據收集', '共享數據', 'guide line &checklist& lesson learn&技術報告 ', '1.平台化分享', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '2019-08-20 11:16:49', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (51, '大數據收集', '文件管控', '1.嚴格按照部門規定存儲和定義管控文件 \r\n2.測試文件模板&測試SOP&大數據&測試報告 上JIRA系統管控', '1.JIRA系統', NULL, NULL, NULL, NULL, NULL, 100, 1, '修改SOP', NULL, '修改的SOP已放到公共盤，供參考和學習', '2019-08-20 11:16:55', NULL, '18013030', '陳遠宏');
INSERT INTO `kpi_msg` VALUES (52, '專案質量', '出錯率', '1.開發需求內容，在程序開發前前解讀準確，無出現開發項目不符合需求的情況。', '1.申請單項目審核 ；2.程序需求文擋審核。', '量測達成數/總量測數', 100, 45, 666, 666, 666, 666, '666', '666', '666', '2019-08-20 14:06:16', NULL, '18006122', '呂運鼎');
INSERT INTO `kpi_msg` VALUES (53, '专案质量', '进度管理', '1.负责专案进度更新；\r\n2.以专案进度排程表和测试进度时程表进行管控。', '1.JIRA留言；\r\n2.排程表每日更新。', '量测达成数/总量测数', 100, 45, 0, 0, 0, 0, '', '', '121212212121', '2019-08-21 14:00:58', NULL, '00001', '呂運鼎');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login1
-- ----------------------------
INSERT INTO `login1` VALUES (1, 'ewwe', 'ewewe', '2019-07-31 10:14:37');

-- ----------------------------
-- Table structure for receive_data
-- ----------------------------
DROP TABLE IF EXISTS `receive_data`;
CREATE TABLE `receive_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Powers` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Value` int(20) NULL DEFAULT NULL,
  `timer` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Oil` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receive_data
-- ----------------------------
INSERT INTO `receive_data` VALUES (1, '20190816', '130', 5, '2019-08-16 10:43:06', '奥迪', '8.7', 50.24);
INSERT INTO `receive_data` VALUES (2, '20190817', '150', 6, '2019-08-16 10:43:09', '路虎', '7.8', 62.00);
INSERT INTO `receive_data` VALUES (3, '20190818', '160', 7, '2019-08-16 10:43:12', '捷豹', '5.9', 70.22);
INSERT INTO `receive_data` VALUES (4, '20190819', '180', 15, '2019-08-16 14:08:25', '标致', '7.7', 120.00);
INSERT INTO `receive_data` VALUES (5, '20190820', '225', 9, '2019-08-16 10:43:17', '莲花', '9.9', 130.00);
INSERT INTO `receive_data` VALUES (6, '20190821', '140', 10, '2019-08-16 10:43:24', '欧宝', '6.1', 30.00);

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
INSERT INTO `user_info` VALUES (15, 'admin', 'INNOLUX', NULL, 'set', NULL, '88888888', 'admin');
INSERT INTO `user_info` VALUES (16, '李嘉俊', 'INNOLUX', '81864', 'set', NULL, '19001260', '19001260');
INSERT INTO `user_info` VALUES (17, '张超鹏', 'INNOLUX', '82104', 'set', NULL, '19004113', '19004113');
INSERT INTO `user_info` VALUES (18, '陈焕和', 'INNOLUX', '81705', 'set', NULL, '19004470', '19004470');
INSERT INTO `user_info` VALUES (19, '0101', NULL, NULL, NULL, NULL, '', '0101');
INSERT INTO `user_info` VALUES (20, '0102', NULL, NULL, NULL, NULL, '', '0102');

SET FOREIGN_KEY_CHECKS = 1;
