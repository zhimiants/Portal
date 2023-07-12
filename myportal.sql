/*
 Navicat Premium Data Transfer

 Source Server         : book_library
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : myportal

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 18/06/2023 13:24:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard
-- ----------------------------
INSERT INTO `dashboard` VALUES (1, '标题1', '内容1');
INSERT INTO `dashboard` VALUES (2, '标题2', '内容2');
INSERT INTO `dashboard` VALUES (3, '标题3', '内容3');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (14, 'John', '你好，我有一个问题。');
INSERT INTO `messages` VALUES (15, 'Alice', '太棒了，我喜欢这个产品。');
INSERT INTO `messages` VALUES (22, 'Lerbron', '垃圾公司');
INSERT INTO `messages` VALUES (36, '张三', '你好，我有一个问题。');
INSERT INTO `messages` VALUES (37, '李华', '太棒了，我喜欢这个产品。');
INSERT INTO `messages` VALUES (38, '王五', '我如何联系客服？');
INSERT INTO `messages` VALUES (39, '赵六', '这个产品的质量真是糟糕，我不推荐购买。');
INSERT INTO `messages` VALUES (40, '刘琳', '产品的外观设计非常时尚，我很喜欢。');
INSERT INTO `messages` VALUES (41, '陈明', '这个产品的性能非常出色，超出了我的期望。');
INSERT INTO `messages` VALUES (42, '杨洋', '我对产品的价格感到非常满意，物超所值。');
INSERT INTO `messages` VALUES (43, '吴秀', '我在使用这个产品时遇到了一些问题，希望能得到解决。');
INSERT INTO `messages` VALUES (44, '许宁', '这个产品的包装很精美，给人一种高端感。');
INSERT INTO `messages` VALUES (45, '刘辉', '售后服务非常糟糕，我遇到了很多麻烦。');
INSERT INTO `messages` VALUES (46, '朱莉', '这个产品的功能非常实用，对我的工作有很大帮助。');
INSERT INTO `messages` VALUES (47, '黄新', '我对产品的耐用性有些担心，希望能更持久一些。');
INSERT INTO `messages` VALUES (48, '曾媛', '产品的配送速度非常快，我很满意。');
INSERT INTO `messages` VALUES (49, '钱飞', '这个产品的价格有点高，不太符合我的预算。');
INSERT INTO `messages` VALUES (50, '周伟', '产品的材质质量很好，很结实耐用。');
INSERT INTO `messages` VALUES (51, '徐慧', '我对产品的售后保修政策不太了解，希望有更多的信息。');
INSERT INTO `messages` VALUES (52, '林婷', '这个产品的使用方法不太清楚，希望能有详细的说明书。');
INSERT INTO `messages` VALUES (53, '高洋', '我对产品的颜色选择有些失望，希望有更多的选项。');
INSERT INTO `messages` VALUES (54, '朱琳', '这个产品的用户界面设计很简洁，很容易上手。');
INSERT INTO `messages` VALUES (55, '赵宇', '我对产品的功耗有些担心，希望能更节能一些。');
INSERT INTO `messages` VALUES (56, '1', '2');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (3, '产品3', 29.99, 10, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26mt8di3j30fa08mmy7.jpg', '这是产品3的描述。');
INSERT INTO `products` VALUES (5, '1', 1.00, 1, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26oihyrhj30fa08mjsj.jpg', '1');
INSERT INTO `products` VALUES (8, '1', 0.00, 0, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26pbkleqj30fa08mmyd.jpg', '123');
INSERT INTO `products` VALUES (12, '31', 321.00, 3, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26rk2pzvj30fa08mmy8.jpg', '4');
INSERT INTO `products` VALUES (27, '1', 12.00, 12, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26r5pae6j30fa08m758.jpg', '1');
INSERT INTO `products` VALUES (28, '123', 123.00, 4214, 'http://tva1.sinaimg.cn/large/006W5DN5gy1hf26rvlgr5j30fa08m0tz.jpg', '23');

SET FOREIGN_KEY_CHECKS = 1;
