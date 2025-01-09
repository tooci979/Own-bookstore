/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 26/12/2023 16:49:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `author` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publisher` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '湖北工业大学',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/img/jianai.jpg',
  `price` int NULL DEFAULT 0,
  `classificationId` int NULL DEFAULT NULL,
  PRIMARY KEY (`bookID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (75, '活着', '余华', '工程技术学院', '/img/f10edc8b-dcd7-400a-8ed0-13a7e2122d41QQ图片20231225212937.png', 78, 2);
INSERT INTO `book` VALUES (76, '鲁滨逊漂流记', '丹尼尔·笛福', '工程技术学院', '/img/4d39aa3d-eb4f-4793-983d-31cbee194687QQ图片20231225213030.png', 88, 2);
INSERT INTO `book` VALUES (77, '简爱', '夏洛蒂·勃朗特', '工程技术学院', '/img/d09d8bf5-77e2-4b2e-abcc-6f15d2afc7b0QQ图片20231225212751.png', 100, 4);
INSERT INTO `book` VALUES (78, '红楼梦', '曹雪芹', '工程技术学院', '/img/5f1a325d-bbdb-4617-b09d-826328d479f6QQ图片20231225212818.png', 120, 15);

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `classificationId` int NOT NULL AUTO_INCREMENT,
  `classificationName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classificationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1, '喜剧');
INSERT INTO `classification` VALUES (2, '哲学');
INSERT INTO `classification` VALUES (3, '社会科学');
INSERT INTO `classification` VALUES (4, '政治学');
INSERT INTO `classification` VALUES (15, '文学');

-- ----------------------------
-- Table structure for consignee
-- ----------------------------
DROP TABLE IF EXISTS `consignee`;
CREATE TABLE `consignee`  (
  `cneeId` int NOT NULL AUTO_INCREMENT,
  `cneeName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cneeAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '湖北省',
  `cneePhone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cneeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consignee
-- ----------------------------
INSERT INTO `consignee` VALUES (30, '张三', '湖北省武汉市', '1234444', '11');
INSERT INTO `consignee` VALUES (31, '李四', '湖北省武汉市洪山区', '123456', '37');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roles` int NULL DEFAULT NULL,
  `roleName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '普通用户');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `commodityName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `total_money` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `orderTime` date NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES (60, '活着', 78, 1, 78, '/img/f10edc8b-dcd7-400a-8ed0-13a7e2122d41QQ图片20231225212937.png', '余华', '2023-12-25', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (61, '鲁滨逊漂流记', 88, 1, 88, '/img/4d39aa3d-eb4f-4793-983d-31cbee194687QQ图片20231225213030.png', '丹尼尔·笛福', '2023-12-25', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (62, '活着', 78, 1, 78, '/img/f10edc8b-dcd7-400a-8ed0-13a7e2122d41QQ图片20231225212937.png', '余华', '2023-12-26', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (63, '简爱', 100, 1, 100, '/img/d09d8bf5-77e2-4b2e-abcc-6f15d2afc7b0QQ图片20231225212751.png', '夏洛蒂·勃朗特', '2023-12-26', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (65, '红楼梦', 120, 1, 120, '/img/5f1a325d-bbdb-4617-b09d-826328d479f6QQ图片20231225212818.png', '曹雪芹', '2023-12-26', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (66, '活着', 78, 1, 78, '/img/f10edc8b-dcd7-400a-8ed0-13a7e2122d41QQ图片20231225212937.png', '余华', '2023-12-26', '工程技术学院', 11);
INSERT INTO `shopcart` VALUES (68, '鲁滨逊漂流记', 88, 20, 1760, '/img/4d39aa3d-eb4f-4793-983d-31cbee194687QQ图片20231225213030.png', '丹尼尔·笛福', '2023-12-26', '工程技术学院', 37);
INSERT INTO `shopcart` VALUES (70, '红楼梦', 120, 1, 120, '/img/5f1a325d-bbdb-4617-b09d-826328d479f6QQ图片20231225212818.png', '曹雪芹', '2023-12-26', '工程技术学院', 37);
INSERT INTO `shopcart` VALUES (71, '简爱', 100, 1, 100, '/img/d09d8bf5-77e2-4b2e-abcc-6f15d2afc7b0QQ图片20231225212751.png', '夏洛蒂·勃朗特', '2023-12-26', '工程技术学院', 37);
INSERT INTO `shopcart` VALUES (72, '简爱', 100, 1, 100, '/img/d09d8bf5-77e2-4b2e-abcc-6f15d2afc7b0QQ图片20231225212751.png', '夏洛蒂·勃朗特', '2023-12-26', '工程技术学院', 37);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `orderTime` date NULL DEFAULT NULL,
  `shipStatus` int NULL DEFAULT 0,
  `acceptStatus` int NULL DEFAULT 0,
  `payStatus` int NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT 18,
  `birthday` date NULL DEFAULT NULL,
  `roles` int NULL DEFAULT 2,
  `money` int NULL DEFAULT 0,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 2200, '2023-11-14', 1, 66, '123456789');
INSERT INTO `user` VALUES (11, '张三', '123456', 20, '2023-12-23', 2, 18, '123444444');
INSERT INTO `user` VALUES (37, '李四123', '123456', 22, '2024-01-10', 2, 45, '123456556');
INSERT INTO `user` VALUES (39, 'admin2', '123456', 20, '2023-12-24', 1, 0, '123456');

SET FOREIGN_KEY_CHECKS = 1;
