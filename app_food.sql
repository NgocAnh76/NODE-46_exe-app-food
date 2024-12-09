-- -------------------------------------------------------------
-- TablePlus 6.2.0(576)
--
-- https://tableplus.com/
--
-- Database: app_food
-- Generation Time: 2024-12-10 01:33:46.2100
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `users_id` (`users_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `codes` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `users_id` (`users_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `users_id` (`users_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passwords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `descs`, `type_id`) VALUES
(1, 'Bùn Bò', 'https://bunbo.png', 50000, 'đặc sản sứ Huế', 1),
(2, 'Chè', 'https://che.png', 30000, 'làm mát cơ thể', 2),
(3, 'Hủ tiếu gõ', 'https://hutueu.png', 30000, 'món ăn nhanh tiện', 1),
(4, 'cơm mẹ nấu', 'https://com.png', 0, 'món ăn free', 1),
(5, 'cơm gà', 'https://com.png', 35000, 'món ăn ', 1),
(6, 'cơm sường', 'https://com.png', 35000, 'món ăn ', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'nóng'),
(2, 'lạnh');

INSERT INTO `like_res` (`like_id`, `users_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2024-01-01 00:00:00'),
(2, 2, 1, '2024-01-01 00:00:00'),
(3, 2, 3, '2024-01-01 00:00:00'),
(4, 4, 5, '2024-01-01 00:00:00'),
(5, 5, 1, '2024-01-01 00:00:00'),
(6, 3, 7, '2024-01-01 00:00:00'),
(7, 4, 2, '2024-01-01 00:00:00'),
(8, 1, 1, '2024-01-01 00:00:00'),
(9, 2, 1, '2024-01-01 00:00:00'),
(10, 6, 3, '2024-01-01 00:00:00'),
(11, 6, 3, '2024-01-01 00:00:00'),
(12, 6, 3, '2024-01-01 00:00:00'),
(13, 6, 3, '2024-01-01 00:00:00'),
(14, 3, 7, '2024-01-01 00:00:00'),
(15, 3, 3, '2024-01-01 00:00:00');

INSERT INTO `orders` (`order_id`, `users_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(15, 1, 2, 2, '221', '001'),
(16, 1, 3, 1, '223', '002'),
(17, 2, 4, 3, '224', '003'),
(18, 3, 5, 2, '225', '004'),
(19, 4, 1, 5, '226', '005'),
(20, 5, 6, 1, '227', '006'),
(21, 6, 1, 1, '228', '007');

INSERT INTO `rate_res` (`rate_id`, `users_id`, `res_id`, `amount`, `date_rate`) VALUES
(6, 1, 3, 1, '2024-12-12 00:00:00'),
(7, 2, 4, 2, '2024-12-12 00:00:00'),
(8, 1, 5, 4, '2024-12-12 00:00:00'),
(9, 4, 6, 3, '2024-12-12 00:00:00'),
(10, 6, 4, 5, '2024-12-12 00:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `descs`) VALUES
(1, 'restaurant_1', 'image_1', 'restaurant number one'),
(2, 'restaurant_2', 'image_1', 'restaurant number one'),
(3, 'restaurant_3', 'image_1', 'restaurant number one'),
(4, 'restaurant_4', 'image_1', 'restaurant number one'),
(5, 'restaurant_5', 'image_1', 'restaurant number one'),
(6, 'restaurant_6', 'image_1', 'restaurant number one'),
(7, 'restaurant_7', 'image_1', 'restaurant number one');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(13, 'khoai tây chiên', 10000, 1),
(14, 'rau sống', 10000, 2),
(15, 'mù tạc', 5000, 3),
(16, 'quẩy', 3000, 4);

INSERT INTO `users` (`users_id`, `full_name`, `email`, `passwords`) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com', NULL),
(2, 'Nguyễn Văn B', 'B@gmail.com', NULL),
(3, 'Nguyễn Văn C', 'c@gmail.com', NULL),
(4, 'Nguyễn Văn D', 'd@gmail.com', NULL),
(5, 'Nguyễn Văn E', 'e@gmail.com', NULL),
(6, 'Nguyễn Văn H', 'h@gmail.com', NULL),
(7, 'Nguyễn Văn G', 'g@gmail.com', NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;