/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : house

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 13/03/2023 19:35:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋所在地',
  `area` double(255, 0) NULL DEFAULT NULL COMMENT '房屋面积',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋状态',
  `userlist_id` int(255) NOT NULL,
  PRIMARY KEY (`apply_id`, `house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (4, '1001', '远大理想城 4室 132 普装', 100, 200.00, '申请中', 1);
INSERT INTO `apply` VALUES (7, '1003', '远大理想城，三室两厅，住宅办公两用，面积大总价低，双气带地铁', 138, 14001.00, '申请中', 1);

-- ----------------------------
-- Table structure for applyout
-- ----------------------------
DROP TABLE IF EXISTS `applyout`;
CREATE TABLE `applyout`  (
  `aoid` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userlist_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`aoid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of applyout
-- ----------------------------
INSERT INTO `applyout` VALUES (1, '1007', '恒大绿洲 2室 86平 精装修 學区房 户型美 采光观景', '申请中', 1);

-- ----------------------------
-- Table structure for checkout
-- ----------------------------
DROP TABLE IF EXISTS `checkout`;
CREATE TABLE `checkout`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋地址',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋状态',
  `userlist_id` int(11) NULL DEFAULT NULL COMMENT '租客编号',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退租' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkout
-- ----------------------------
INSERT INTO `checkout` VALUES (1, '1009', '远大理想城大三房 首付仅需40万 采光好', '已退租', 2);

-- ----------------------------
-- Table structure for hetong
-- ----------------------------
DROP TABLE IF EXISTS `hetong`;
CREATE TABLE `hetong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chuzu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东姓名',
  `chuzu_idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房东身份证号码',
  `zuke` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客姓名',
  `zuke_idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客身份证号码',
  `fromdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起租时间',
  `todate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退租时间',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '每月租金',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋地址',
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋编号',
  `payday` int(11) NULL DEFAULT NULL COMMENT '交租日',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hetong
-- ----------------------------
INSERT INTO `hetong` VALUES (1, 'Faiz', '222', '王麻子', '111', '2019-03-23', '2022-03-23', 14088.00, '远大理想城大三房 首付仅需40万 采光好', '1005', 23);
INSERT INTO `hetong` VALUES (3, 'Faiz', '222', 'Amy', '333', '2000-06-15', '2022-06-15', 14088.00, '今新出）郑东房本 吉地澜花语 品质好房 双阳台', '1008', 16);
INSERT INTO `hetong` VALUES (4, '房东', 'X', '王麻子', '11010220000323601X', '2021-03-01', '2025-03-01', 14088.00, '恒大绿洲 2室 86平 精装修 學区房 户型美 采光观景', '1007', 1);

-- ----------------------------
-- Table structure for houselist
-- ----------------------------
DROP TABLE IF EXISTS `houselist`;
CREATE TABLE `houselist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `houseid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋所在地',
  `area` double NULL DEFAULT NULL COMMENT '房屋面积',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '房屋价格',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋状态',
  PRIMARY KEY (`id`, `houseid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房屋列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of houselist
-- ----------------------------
INSERT INTO `houselist` VALUES (22, '1001', '远大理想城 4室 132 普装', 132, 14622.00, '已租赁');
INSERT INTO `houselist` VALUES (23, '1002', '龙湖锦艺城 新出复试三层带院 送90平边院 有本 包税', 138, 13696.00, '未租赁');
INSERT INTO `houselist` VALUES (24, '1003', '远大理想城，三室两厅，住宅办公两用，面积大总价低，双气带地铁', 137.85, 14001.00, '已被申请');
INSERT INTO `houselist` VALUES (25, '1004', '精装两房，百米间距，中层急售，拎包入住随是看房五号线旁', 86, 16628.00, '未租赁');
INSERT INTO `houselist` VALUES (26, '1005', '远大理想城大三房 首付仅需40万 采光好', 137, 14088.00, '已租赁');
INSERT INTO `houselist` VALUES (27, '1006', '急售！！低于市场价恒大朝南两房只要140刚需改善 实验中学', 83, 16868.00, '未租赁');
INSERT INTO `houselist` VALUES (28, '1007', '恒大绿洲 2室 86平 精装修 學区房 户型美 采光观景', 86, 17442.00, '已租赁');
INSERT INTO `houselist` VALUES (29, '1008', '今新出）郑东房本 吉地澜花语 品质好房 双阳台', 137, 14088.00, '已租赁');

-- ----------------------------
-- Table structure for paid
-- ----------------------------
DROP TABLE IF EXISTS `paid`;
CREATE TABLE `paid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '租金',
  `date` date NULL DEFAULT NULL COMMENT '应缴日期',
  `paydate` date NULL DEFAULT NULL COMMENT '实际缴纳日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客姓名',
  `userlist_id` int(11) NULL DEFAULT NULL COMMENT '租客编号',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已缴租金表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of paid
-- ----------------------------
INSERT INTO `paid` VALUES (1, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-04-23', '2020-04-23', '王麻子', 1, '已缴纳');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, '2021-03-23', '收租');

-- ----------------------------
-- Table structure for solve
-- ----------------------------
DROP TABLE IF EXISTS `solve`;
CREATE TABLE `solve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userlist_id` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of solve
-- ----------------------------
INSERT INTO `solve` VALUES (1, '1005', '远大理想城大三房 首付仅需40万 采光好', '2021-03-23', '房门打不开', '王麻子', 1, '已处理');
INSERT INTO `solve` VALUES (2, '1005', '远大理想城大三房 首付仅需40万 采光好', '2021-03-23', '卫生间漏水！！！', '王麻子', 1, '已处理');
INSERT INTO `solve` VALUES (3, '1005', '远大理想城大三房 首付仅需40万 采光好', '2021-03-11', '厨房有老鼠！！！', '王麻子', 1, '已处理');

-- ----------------------------
-- Table structure for topaid
-- ----------------------------
DROP TABLE IF EXISTS `topaid`;
CREATE TABLE `topaid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋地址',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '房屋租金',
  `date` date NULL DEFAULT NULL COMMENT '租金缴纳日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客姓名',
  `userlist_id` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '待支付列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of topaid
-- ----------------------------
INSERT INTO `topaid` VALUES (1, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2021-04-23', '王麻子', 1, '租金未缴');
INSERT INTO `topaid` VALUES (2, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2021-03-23', '王麻子', 1, '租金未缴');
INSERT INTO `topaid` VALUES (3, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2021-02-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (4, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2021-01-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (5, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-12-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (6, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-11-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (7, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-10-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (8, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-09-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (9, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-08-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (10, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-07-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (11, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-06-23', '王麻子', 1, '租金未缴纳');
INSERT INTO `topaid` VALUES (12, '1005', '远大理想城大三房 首付仅需40万 采光好', 14088.00, '2020-05-23', '王麻子', 1, '租金未缴纳');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `user` VALUES (2, '123456', '123456', 'tenant');
INSERT INTO `user` VALUES (3, '555', '123456', 'zuke');
INSERT INTO `user` VALUES (4, 'Amy', '123456', 'zuke');
INSERT INTO `user` VALUES (5, '12', '12', '12');

-- ----------------------------
-- Table structure for userlist
-- ----------------------------
DROP TABLE IF EXISTS `userlist`;
CREATE TABLE `userlist`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客姓名',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租客身份证号码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租客联系电话',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`, `idcard`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租客列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userlist
-- ----------------------------
INSERT INTO `userlist` VALUES (1, '王麻子', '11010220000323601X', '15188888888', 2);
INSERT INTO `userlist` VALUES (2, 'Faiz', '222', '12345678901', 3);
INSERT INTO `userlist` VALUES (3, 'Amy', '333', '15876982457', 4);
INSERT INTO `userlist` VALUES (4, '12', '12', '12', 5);

-- ----------------------------
-- Table structure for wrong
-- ----------------------------
DROP TABLE IF EXISTS `wrong`;
CREATE TABLE `wrong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋地址',
  `date` date NULL DEFAULT NULL COMMENT '保障日期',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障内容',
  `userlist_id` int(11) NULL DEFAULT NULL COMMENT '租赁人编号',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wrong
-- ----------------------------
INSERT INTO `wrong` VALUES (4, '1005', '远大理想城大三房 首付仅需40万 采光好', '2021-03-13', '老婆饼里没老婆！！！', '王麻子', 1, '待处理');
INSERT INTO `wrong` VALUES (5, '1005', '远大理想城大三房 首付仅需40万 采光好', '2021-03-06', '鱼香肉丝没有鱼！！！', '王麻子', 1, '待处理');

-- ----------------------------
-- Table structure for zulist
-- ----------------------------
DROP TABLE IF EXISTS `zulist`;
CREATE TABLE `zulist`  (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userlist_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  PRIMARY KEY (`zid`, `house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zulist
-- ----------------------------
INSERT INTO `zulist` VALUES (1, '1005', 14088.00, '远大理想城大三房 首付仅需40万 采光好', 1, 1);
INSERT INTO `zulist` VALUES (3, '1008', 14088.00, '今新出）郑东房本 吉地澜花语 品质好房 双阳台', 3, 3);
INSERT INTO `zulist` VALUES (4, '1007', 14088.00, '恒大绿洲 2室 86平 精装修 學区房 户型美 采光观景', 1, 4);

SET FOREIGN_KEY_CHECKS = 1;
