-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.45-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 liblibero.user 구조 내보내기
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `gender_code` char(1) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(14) NOT NULL,
  `phone_code` smallint(6) NOT NULL DEFAULT '0',
  `user_code` smallint(6) NOT NULL DEFAULT '1',
  `role` char(1) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `factory_no` varchar(20) DEFAULT NULL,
  `cash_code` char(2) NOT NULL DEFAULT 'bf',
  `a5_price` int(11) DEFAULT NULL,
  `b5_price` int(11) DEFAULT NULL,
  `a4_price` int(11) DEFAULT NULL,
  `color_price` int(11) DEFAULT NULL,
  `black_price` int(11) DEFAULT NULL,
  `snow_price` int(11) DEFAULT NULL,
  `mont_price` int(11) DEFAULT NULL,
  `arte_price` int(11) DEFAULT NULL,
  `white_price` int(11) DEFAULT NULL,
  `ivory_price` int(11) DEFAULT NULL,
  `rough_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `인덱스 2` (`nickname`) USING BTREE,
  UNIQUE KEY `인덱스 3` (`phone`),
  UNIQUE KEY `factory_no` (`factory_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.user:~11 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `password`, `nickname`, `gender_code`, `name`, `address`, `phone`, `phone_code`, `user_code`, `role`, `reg_date`, `factory_no`, `cash_code`, `a5_price`, `profile`, `b5_price`, `a4_price`, `color_price`, `black_price`, `snow_price`, `mont_price`, `arte_price`, `white_price`, `ivory_price`, `rough_price`) VALUES
	('admin1', '1234', '관리자1', 'm', '관리자', '서울시 강남구', '000-0000-1111', 1, 1, 'a', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin2', '1234', '관리자2', 'm', '관리자', NULL, '000-1111-2222', 1, 1, 'a', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin3', '1234', '관리자3', 'f', '관리자', NULL, '000-2222-3333', 1, 1, 'a', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('admin4', '1234', '관리자4', 'f', '관리자', NULL, '000-3333-2222', 1, 1, 'a', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('choije9410@gmail.com', '1111', '유저유저', 'f', '최지은', '경기도 수원시', '010-3593-9410', 0, 1, 'u', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('factory01@naver.com', '0101', '인쇄소01', 'f', '인쇄소', '경기도', '000-1234-2222', 0, 1, 'f', '2020-07-16 00:00:00', '1234', 'bf', 100, NULL, 200, 150, 100, 50, 3500, 4000, 4500, 100, 50, 20),
	('factory02@hanmail.net', '0202', '인쇄소02', 'f', '인쇄소', '경기도', '000-1313-2222', 0, 1, 'f', '2020-07-16 00:00:00', '1424132', 'bf', 200, NULL, 300, 200, 100, 100, 2000, 3000, 3500, 10, 10, 10),
	('user01', '0101', '유저01', 'f', '유저01', NULL, '010-0101-0101', 0, 1, 'u', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('user02', '0202', '유저02', 'f', '유저02', NULL, '010-0202-0202', 0, 1, 'u', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('wjddbstp95@gmail.com', '1111', '윤세', 'm', '정윤세', NULL, '010-0011-1100', 0, 1, 'u', '2020-07-16 17:10:50', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('xodnr097@naver.com', '1111', '유저유저1', 'f', '김태욱', '충정도', '010-9430-3757', 0, 1, 'u', '2020-07-16 00:00:00', NULL, 'bf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 liblibero.product 구조 내보내기
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prod_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_type` varchar(10) NOT NULL,
  `prod_name` varchar(50) DEFAULT NULL,
  `prod_detail` text,
  `retail_price` int(11) DEFAULT NULL,
  `print_price` int(11) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `blind_code` char(1) NOT NULL DEFAULT 'o',
  `prod_thumbnail` varchar(50) DEFAULT NULL,
  `cover_file` varchar(50) DEFAULT NULL,
  `purpose_code` char(4) DEFAULT NULL,
  `manu_file` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount_code` char(1) DEFAULT 'o',
  `temp_code` smallint(6) DEFAULT '1',
  `book_page` int(3) DEFAULT NULL,
  `size_type` char(2) DEFAULT NULL,
  `color_type` char(5) DEFAULT NULL,
  `cover_type` char(4) DEFAULT NULL,
  `inner_type` char(5) DEFAULT NULL,
  `factory_id` varchar(30) DEFAULT NULL,
  `creator` varchar(30) NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `book_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prod_no`),
  KEY `FK_product_user` (`factory_id`),
  KEY `FK_product_user_2` (`creator`),
  CONSTRAINT `FK_product_user` FOREIGN KEY (`factory_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_product_user_2` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10037 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.product:~37 rows (대략적) 내보내기
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`prod_no`, `prod_type`, `prod_name`, `prod_detail`, `retail_price`, `print_price`, `author`, `blind_code`, `prod_thumbnail`, `cover_file`, `purpose_code`, `manu_file`, `reg_date`, `discount_code`, `temp_code`, `book_page`, `size_type`, `color_type`, `cover_type`, `inner_type`, `factory_id`, `creator`, `like_count`, `book_category`) VALUES
	(10000, 'paper', '정윤세 연대기1', NULL, 10000, 5000, '김태욱', 'o', 't1.png', NULL, 'have', NULL, '2020-07-15 16:50:59', 'x', 1, 100, 'a5', 'color', 'snow', 'rough', 'factory01@naver.com', 'admin2', 0, '소설'),
	(10001, 'paper', '이윤경간첩1', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 300, 'a4', 'color', 'snow', 'white', 'factory02@hanmail.net', 'admin2', 0, '비문학'),
	(10002, 'paper', '이윤경간첩2', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 300, 'a4', 'black', 'snow', 'ivory', 'factory01@naver.com', 'admin2', 0, '비문학'),
	(10003, 'paper', '이윤경간첩3', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 300, 'a4', 'color', 'arte', 'rough', 'factory02@hanmail.net', 'admin2', 0, '비문학'),
	(10004, 'paper', '이윤경간첩4', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 300, 'a5', 'black', 'arte', 'white', 'factory01@naver.com', 'admin2', 0, '비문학'),
	(10005, 'paper', '이윤경간첩5', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'a5', 'color', 'mont', 'ivory', 'factory02@hanmail.net', 'admin2', 0, '비문학'),
	(10006, 'paper', '이윤경간첩6', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'mont', 'rough', 'factory01@naver.com', 'admin2', 0, '비문학'),
	(10007, 'paper', '이윤경간첩7', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'color', 'arte', 'white', 'factory01@naver.com', 'admin2', 0, '비문학'),
	(10008, 'paper', '이윤경간첩8', NULL, 13000, 3000, '이윤경', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '비문학'),
	(10009, 'ebook', '전자책1', NULL, 7000, NULL, 'ktw', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 500, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '교육'),
	(10010, 'ebook', '전자책2', NULL, 7000, NULL, 'ktw', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 250, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '교육'),
	(10011, 'ebook', '전자책3', NULL, 7000, NULL, 'ktw', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 300, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '교육'),
	(10012, 'ebook', '전자책4', NULL, 7000, NULL, 'ktw', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '교육'),
	(10013, 'ebook', '전자책5', NULL, 7000, NULL, 'ktw', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 350, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '소설'),
	(10014, 'design', '표지디자인1', NULL, 40000, NULL, 'cje', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '3'),
	(10015, 'design', '표지디자인2', NULL, 40000, NULL, 'cje', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin1', 0, '4'),
	(10016, 'design', '표지디자인3', NULL, 40000, NULL, 'cje', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '4'),
	(10017, 'design', '표지디자인4', NULL, 40000, NULL, 'cje', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '4'),
	(10018, 'design', '표지디자인5', NULL, 40000, NULL, 'cje', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10019, 'target', '맞춤형표지1', NULL, 80000, NULL, 'jys', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10020, 'target', '맞춤형표지2', NULL, 80000, NULL, 'jys', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10021, 'target', '맞춤형표지3', NULL, 80000, NULL, 'jys', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10022, 'target', '맞춤형표지4', NULL, 80000, NULL, 'jys', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10023, 'target', '맞춤형표지5', NULL, 80000, NULL, 'jys', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'admin2', 0, '5'),
	(10024, 'paper', '개발학개론1', NULL, 50000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '교육'),
	(10025, 'paper', '개발학개론2', NULL, 50000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '교육'),
	(10026, 'paper', '개발학개론3', NULL, 40000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '교육'),
	(10027, 'paper', '개발학개론4', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '교육'),
	(10028, 'paper', '개발학개론5', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '교육'),
	(10029, 'paper', '정윤세 연대기2', NULL, 10000, 5000, '김태욱', 'o', 't1.png', NULL, 'have', NULL, '2020-07-15 16:50:59', 'x', 1, 100, 'a5', 'color', 'snow', 'rough', 'factory01@naver.com', 'admin2', 0, '소설'),
	(10030, 'paper', '최지은 시집1', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '시'),
	(10031, 'paper', '최지은 시집2', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '시'),
	(10032, 'paper', '최지은 시집3', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '시'),
	(10033, 'paper', '수필', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '수필'),
	(10034, 'paper', '수필', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '수필'),
	(10035, 'paper', '수필', NULL, 30000, 3000, '김태욱', 'o', 'no', NULL, 'sale', NULL, '2020-07-15 00:00:00', 'o', 1, 400, 'b5', 'black', 'snow', 'rough', 'factory02@hanmail.net', 'admin2', 0, '수필'),
	(10036, 'paper', NULL, NULL, NULL, 29050, NULL, 'x', NULL, NULL, NULL, NULL, '2020-07-24 09:24:30', 'o', 1, 100, 'b5', 'black', 'mont', 'ivory', 'factory01@naver.com', 'admin3', 0, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 liblibero.buy 구조 내보내기
CREATE TABLE IF NOT EXISTS `buy` (
  `buy_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `buy_amount` int(11) NOT NULL DEFAULT '1',
  `buy_code` smallint(6) NOT NULL DEFAULT '0',
  `pay_no` int(11) NOT NULL,
  PRIMARY KEY (`buy_no`),
  KEY `FK_buy_product` (`prod_no`),
  KEY `FK_buy_user` (`user_id`),
  KEY `FK_buy_pay` (`pay_no`),
  CONSTRAINT `FK_buy_pay` FOREIGN KEY (`pay_no`) REFERENCES `pay` (`pay_no`),
  CONSTRAINT `FK_buy_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_buy_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.buy:~5 rows (대략적) 내보내기
DELETE FROM `buy`;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`buy_no`, `prod_no`, `user_id`, `buy_amount`, `buy_code`) VALUES
	(10000, 10000, 'user01', 1, 0),
	(10001, 10001, 'user01', 2, 0),
	(10002, 10000, 'user01', 3, 0),
	(10003, 10000, 'user02', 10, 0),
	(10004, 10005, 'wjddbstp95@gmail.com', 1000, 0);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;

-- 테이블 liblibero.pay 구조 내보내기
DROP TABLE IF EXISTS `pay`;
CREATE TABLE IF NOT EXISTS `pay` (
  `pay_no` varchar(50) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `actual_price` int(11) NOT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_addr` varchar(100) NOT NULL,
  `receiver_phone` varchar(14) NOT NULL,
  `delivery_req` varchar(50) DEFAULT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_code` smallint(6) NOT NULL DEFAULT '1',
  `pay_code` varchar(50) DEFAULT NULL,
  `cancel_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`pay_no`),
  KEY `FK_pay_user` (`user_id`),
  CONSTRAINT `FK_pay_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.pay:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` (`pay_no`, `user_id`, `payment_type`, `actual_price`, `receiver_name`, `receiver_addr`, `receiver_phone`, `delivery_req`, `pay_date`, `delivery_code`, `pay_code`, `cancel_type`) VALUES
	('10000', 'user01', 'c', 10000, '정윤세', '경기도 용인시 수지구 풍덕 고등 학교', '010-0000-1100', '으', '2020-07-16 17:12:47', 2, '1', NULL),
	('10001', 'user02', 'c', 100000, '유저01', '집', '123-1234-1234', '힘들다', '2020-07-16 17:12:47', 1, '1', NULL),
	('10002', 'wjddbstp95@gmail.com', 'c', 13000000, '수령자이름', '문앞', '123-1234-1234', 'ㅇㅇ', '2020-07-16 17:12:47', 1, '1', NULL),
	('10003', 'user01', 'c', 56000, '정윤세', '경기도 용인시', '010-0000-0011', '빠른 배송', '2020-07-16 17:16:24', 1, '1', NULL);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;


-- 테이블 liblibero.cash 구조 내보내기
DROP TABLE IF EXISTS `cash`;
CREATE TABLE IF NOT EXISTS `cash` (
  `cash_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `cash_amount` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cash_no`),
  KEY `FK_cash_user` (`user_id`),
  CONSTRAINT `FK_cash_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.cash:~5 rows (대략적) 내보내기
DELETE FROM `cash`;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
INSERT INTO `cash` (`cash_no`, `user_id`, `cash_amount`, `reg_date`) VALUES
	(10000, 'choije9410@gmail.com', 3000, '2020-07-15 17:33:10'),
	(10001, 'choije9410@gmail.com', 20000, '2020-07-15 17:33:33'),
	(10002, 'choije9410@gmail.com', 10000, '2020-07-15 17:33:45'),
	(10003, 'choije9410@gmail.com', 15000, '2020-07-15 17:33:45'),
	(10004, 'choije9410@gmail.com', -10000, '2020-07-15 17:33:45');
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;

-- 테이블 liblibero.chat_message 구조 내보내기
DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE IF NOT EXISTS `chat_message` (
  `message_no` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` int(11) NOT NULL,
  `sender_id` varchar(30) NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_content` varchar(100) NOT NULL,
  `message_image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`message_no`),
  KEY `FK_chat_message_chat_room` (`room_no`),
  KEY `FK_chat_message_user` (`sender_id`),
  CONSTRAINT `FK_chat_message_chat_room` FOREIGN KEY (`room_no`) REFERENCES `chat_room` (`room_no`),
  CONSTRAINT `FK_chat_message_user` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.chat_message:~0 rows (대략적) 내보내기
DELETE FROM `chat_message`;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;

-- 테이블 liblibero.chat_room 구조 내보내기
DROP TABLE IF EXISTS `chat_room`;
CREATE TABLE IF NOT EXISTS `chat_room` (
  `room_no` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(30) NOT NULL,
  `guest` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`room_no`),
  KEY `FK_chat_room_user` (`host`),
  KEY `FK_chat_room_user_2` (`guest`),
  CONSTRAINT `FK_chat_room_user` FOREIGN KEY (`host`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_chat_room_user_2` FOREIGN KEY (`guest`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.chat_room:~0 rows (대략적) 내보내기
DELETE FROM `chat_room`;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;

-- 테이블 liblibero.comment 구조 내보내기
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `post_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `comment_content` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_comment_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_no`),
  KEY `FK_comment_user` (`user_id`),
  KEY `FK_comment_post` (`post_no`),
  KEY `FK_comment_comment` (`parent_comment_no`),
  CONSTRAINT `FK_comment_comment` FOREIGN KEY (`parent_comment_no`) REFERENCES `comment` (`comment_no`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.comment:~6 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`comment_no`, `post_no`, `user_id`, `comment_content`, `reg_date`, `parent_comment_no`) VALUES
	(10000, 10003, 'user01', '이해합니다', '2020-07-15 17:53:01', NULL),
	(10001, 10003, 'user02', '앞으로 factory01 이용하겠습니다.', '2020-07-15 17:52:54', NULL),
	(10002, 10004, 'user02', '헐 6시 좋아하세요? 저도요', '2020-07-15 17:53:53', NULL),
	(10003, 10006, 'admin3', '안녕하세요 user02님, 리브리베로입니다.\r\n\r\n현재 당사 시스템상으로는 저자 수익금이 0원이 되도록 변경하는 설정은 존재하지 않습니다.\r\n일반판매용으로 등록시 수익금이 발생하므로,\r\n "소장용"으로 제출하여 필요하신만큼 구매하여 제작만 진행해주시면 좋을 것 같습니다.', '2020-07-15 17:58:27', NULL),
	(10004, 10005, 'user01', '안녕', '2020-07-15 17:59:10', NULL),
	(10005, 10005, 'user02', 'ㅎ2', '2020-07-15 18:00:02', 10004);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 liblibero.hashtag 구조 내보내기
DROP TABLE IF EXISTS `hashtag`;
CREATE TABLE IF NOT EXISTS `hashtag` (
  `hashtag_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) DEFAULT NULL,
  `hashtag_name` varchar(50) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`hashtag_no`),
  KEY `FK_hashtag_user` (`user_id`),
  KEY `FK_hashtag_product` (`prod_no`),
  CONSTRAINT `FK_hashtag_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_hashtag_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.hashtag:~11 rows (대략적) 내보내기
DELETE FROM `hashtag`;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` (`hashtag_no`, `prod_no`, `hashtag_name`, `user_id`) VALUES
	(10000, 10000, '판타지', NULL),
	(10001, NULL, '로맨스', NULL),
	(10002, NULL, '무협', 'choije9410@gmail.com'),
	(10003, NULL, '경제', NULL),
	(10004, NULL, '추리', NULL),
	(10005, NULL, 'sf', 'choije9410@gmail.com'),
	(10006, NULL, '인문학', NULL),
	(10007, NULL, '종교', NULL),
	(10008, NULL, '교육', NULL),
	(10009, NULL, '연애', NULL),
	(10010, NULL, '판타지', 'choije9410@gmail.com');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;

-- 테이블 liblibero.post 구조 내보내기
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_no` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` char(1) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `post_name` varchar(50) NOT NULL,
  `post_content` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blind_code` char(1) NOT NULL DEFAULT 'o',
  `report_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `qna_reg_type` char(1) DEFAULT NULL,
  `qna_code` char(1) DEFAULT NULL,
  PRIMARY KEY (`post_no`),
  KEY `FK_post_user` (`user_id`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.post:~10 rows (대략적) 내보내기
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`post_no`, `post_type`, `user_id`, `post_name`, `post_content`, `reg_date`, `blind_code`, `report_count`, `view_count`, `comment_count`, `qna_reg_type`, `qna_code`) VALUES
	(10000, 'N', 'admin3', '공지1', '첫번째 공지입니다', '2020-07-15 17:37:11', 'o', 0, 0, 0, NULL, NULL),
	(10001, 'N', 'admin3', '서버 증설 안내', '리브리베로 서버점검 및 서버 증설 안내\r\n\r\n\r\n\r\n안녕하세요, 자가출판 플랫폼 리브리베로 개발팀입니다.\r\n\r\n\r\n\r\n리브리베로 웹사이트의 서버 점검이 이루어집니다. \r\n\r\n하기 내용을 양지하시어 이용에 불편이 없도록 유의하시기 바랍니다.\r\n\r\n\r\n\r\n\r\n작업내용\r\n\r\n\r\n\r\n  리브리베로 서버 증설 및 안정화 작업\r\n\r\n\r\n\r\n일정안내\r\n\r\n\r\n\r\n  작업시작 : 2020년 06월 27일 오전 1시부터 (AM 01:00)\r\n\r\n  작업종료 : 2020년 06월 27일 오전 2시까지 (AM 02:00)\r\n\r\n\r\n\r\n보다 쾌적한 환경과 서비스를 제공하기 위해서 노력하겠습니다. \r\n\r\n항상 감사합니다.\r\n', '2020-07-15 17:38:25', 'o', 0, 0, 0, NULL, NULL),
	(10002, 'N', 'admin3', '7월 공지', '7월 15일 구현 시작', '2020-07-15 17:40:48', 'o', 0, 0, 0, NULL, NULL),
	(10003, 'F', 'factory02@hanmail.net', '저희 인쇄소 가격 인상했습니다', '그렇다구요', '2020-07-15 17:42:21', 'o', 0, 0, 0, NULL, NULL),
	(10004, 'F', 'user01', '6시 어떻게 생각하세요', '전 좋게 생각해요', '2020-07-15 17:42:54', 'o', 0, 0, 0, NULL, NULL),
	(10005, 'F', 'user01', '제가 쓴 글 좀 보세요', '제가 쓴 댓글을 보세요', '2020-07-15 17:43:31', 'o', 0, 0, 0, NULL, NULL),
	(10006, 'Q', 'user02', '저자 수익을 0으로 하고 책값을 낮추고 싶습니다.', '현재 최대로 낮추어도 1500원 정도의 수익이 나고 있는데, 아예 0으로 낮추고 책값을 낮추는 방법이 있을까요?\r\n\r\n(계좌로 입금되는 금액 없도록)\r\n\r\n\r\n\r\n정부연구비로 출판을 하게되어 수익이 발생할 경우 문제 소지가 있어 질문드립니다.', '2020-07-15 17:46:04', 'o', 0, 0, 0, 'P', 'O'),
	(10007, 'Q', 'user01', 'A5 사이즈 컬러내지 책 최소 페이지', '문의드립니다.\r\n\r\n\r\n\r\nA5 판형 컬러내지 책의 최소 페이지는 어느 정도인지 알고 싶습니다.\r\n\r\n제본에 무리가 없으려면 어느 정도 페이지여야 할까요?\r\n\r\n\r\n\r\n수고에 감사드립니다.', '2020-07-15 17:49:08', 'o', 0, 0, 0, 'P', 'X'),
	(10025, '0', 'admin1', '얘는 쿼카에요', '<p>&nbsp;<img src="/libero/resources/images/community/fileUpload/d2afcd45-ada2-4312-98d0-d685adf38297.jpg" style="width: 400px;"></p><p>ㅎㅎ 웃어</p>', '2020-07-27 15:03:09', 'o', 0, 0, 0, NULL, NULL),
	(10026, '0', 'admin1', '얘는 부엉이', '<p>올빼미? 부엉이</p><p><img src="/libero/resources/images/community/fileUpload/0dc24b96-4ffb-4ca6-8142-832042faf250.jpeg" style="width: 1088px;"><br></p>', '2020-07-27 15:08:45', 'o', 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- 테이블 liblibero.report 구조 내보내기
DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) DEFAULT NULL,
  `post_no` int(11) DEFAULT NULL,
  `report_type` smallint(6) NOT NULL,
  `reporter_id` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_no`),
  KEY `FK_report_product` (`prod_no`),
  KEY `FK_report_post` (`post_no`),
  KEY `FK_report_user` (`reporter_id`),
  CONSTRAINT `FK_report_post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK_report_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_report_user` FOREIGN KEY (`reporter_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.report:~2 rows (대략적) 내보내기
DELETE FROM `report`;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`report_no`, `prod_no`, `post_no`, `report_type`, `reporter_id`, `reg_date`) VALUES
	(10000, 10000, NULL, 3, 'user02', '2020-07-15 18:01:54'),
	(10001, NULL, 10005, 6, 'factory02@hanmail.net', '2020-07-15 18:03:45');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- 테이블 liblibero.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `buy_no` int(11) NOT NULL,
  `review_name` varchar(40) NOT NULL,
  `review_content` text NOT NULL,
  `review_image` varchar(50) DEFAULT NULL,
  `star_rate` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_no`),
  KEY `FK__user` (`user_id`),
  KEY `FK_review_order` (`buy_no`) USING BTREE,
  CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_review_buy` FOREIGN KEY (`buy_no`) REFERENCES `buy` (`buy_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 liblibero.upload_file 구조 내보내기
DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE IF NOT EXISTS `upload_file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT,
  `review_no` int(11) DEFAULT NULL,
  `post_no` int(11) DEFAULT NULL,
  `prod_no` int(11) DEFAULT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  PRIMARY KEY (`file_no`),
  KEY `FK__post` (`post_no`),
  KEY `FK__product` (`prod_no`),
  KEY `FK_upload_file_review` (`review_no`),
  CONSTRAINT `FK__post` FOREIGN KEY (`post_no`) REFERENCES `post` (`post_no`),
  CONSTRAINT `FK__product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_upload_file_review` FOREIGN KEY (`review_no`) REFERENCES `review` (`review_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.upload_file:~0 rows (대략적) 내보내기
DELETE FROM `upload_file`;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;


-- 테이블 liblibero.wish 구조 내보내기
DROP TABLE IF EXISTS `wish`;
CREATE TABLE IF NOT EXISTS `wish` (
  `wish_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`wish_no`) USING BTREE,
  KEY `FK_like_product` (`prod_no`),
  KEY `FK_like_user` (`user_id`),
  CONSTRAINT `FK_like_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_like_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- 테이블 liblibero.wish 구조 내보내기
DROP TABLE IF EXISTS `wish`;
CREATE TABLE IF NOT EXISTS `wish` (
  `wish_no` int(11) NOT NULL AUTO_INCREMENT,
  `prod_no` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`wish_no`) USING BTREE,
  KEY `FK_like_product` (`prod_no`),
  KEY `FK_like_user` (`user_id`),
  CONSTRAINT `FK_like_product` FOREIGN KEY (`prod_no`) REFERENCES `product` (`prod_no`),
  CONSTRAINT `FK_like_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10143 DEFAULT CHARSET=utf8;

-- 테이블 데이터 liblibero.wish:~11 rows (대략적) 내보내기
DELETE FROM `wish`;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
INSERT INTO `wish` (`wish_no`, `prod_no`, `user_id`) VALUES
	(10000, 10001, 'choije9410@gmail.com'),
	(10002, 10002, 'admin2'),
	(10004, 10004, 'admin2'),
	(10006, 10006, 'admin2'),
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
