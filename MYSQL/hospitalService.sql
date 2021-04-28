/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.24 : Database - hospitalService
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospitalService` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospitalService`;

/*Table structure for table `_order` */

DROP TABLE IF EXISTS `_order`;

CREATE TABLE `_order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderName` varchar(255) NOT NULL,
  `orderCreatTime` date NOT NULL COMMENT '创建时间',
  `orderEndTime` date NOT NULL COMMENT '配送结束时间',
  `oederAddress` varchar(255) NOT NULL COMMENT '目标地址',
  `orderUserTel` varchar(11) NOT NULL COMMENT '配送目标号码',
  `orderBusinessTel` varchar(11) NOT NULL COMMENT '商家号码',
  `orderStatus` int NOT NULL COMMENT '实时更新物流状态',
  `userId` varchar(11) NOT NULL,
  PRIMARY KEY (`orderId`,`orderUserTel`,`orderStatus`,`userId`),
  KEY `userId` (`userId`),
  KEY `orderBusinessTel` (`orderBusinessTel`),
  KEY `orderStatus` (`orderStatus`),
  CONSTRAINT `_order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `_user` (`userIdTel`),
  CONSTRAINT `_order_ibfk_2` FOREIGN KEY (`orderBusinessTel`) REFERENCES `doctor` (`doctorIdTel`),
  CONSTRAINT `_order_ibfk_3` FOREIGN KEY (`orderStatus`) REFERENCES `orderStatus` (`orderStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `_order` */

insert  into `_order`(`orderId`,`orderName`,`orderCreatTime`,`orderEndTime`,`oederAddress`,`orderUserTel`,`orderBusinessTel`,`orderStatus`,`userId`) values (20,'懒癌防治医疗单','2021-04-15','2021-04-23','天堂神阿拉神灯市脑残区精神病院11撞','123456','0003',3,'00012'),(21,'花里胡哨专项治理单','2021-04-23','2021-04-26','咪国省花生炖市救景山区51号公路12撞','125000','0002',6,'10086');

/*Table structure for table `_user` */

DROP TABLE IF EXISTS `_user`;

CREATE TABLE `_user` (
  `userIdTel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话作为Id作为主键',
  `userName` varchar(32) NOT NULL,
  `userGender` varchar(2) NOT NULL,
  `user` varchar(16) NOT NULL COMMENT '用户名',
  `userPassword` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `userBirthDate` date NOT NULL COMMENT '出生日期',
  PRIMARY KEY (`userIdTel`,`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `_user` */

insert  into `_user`(`userIdTel`,`userName`,`userGender`,`user`,`userPassword`,`userBirthDate`) values ('00012','mary','女','mary_com','000112','2021-04-24'),('10086','10086','男','xiaochen_jia','123456','2021-04-17'),('123','coder','男','coder_com','000112','2021-04-09'),('123456','jerry','男','jerry_com','123466789','2021-04-24');

/*Table structure for table `adviser` */

DROP TABLE IF EXISTS `adviser`;

CREATE TABLE `adviser` (
  `adviserId` int NOT NULL AUTO_INCREMENT,
  `adviseUserID` varchar(11) NOT NULL,
  `adviserDoctorID` varchar(11) NOT NULL,
  `adviseTitle` varchar(256) DEFAULT NULL,
  `adviseContent` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`adviserId`,`adviseUserID`,`adviserDoctorID`),
  KEY `adviseUserID` (`adviseUserID`),
  KEY `adviserDoctorID` (`adviserDoctorID`),
  CONSTRAINT `adviser_ibfk_1` FOREIGN KEY (`adviseUserID`) REFERENCES `_user` (`userIdTel`),
  CONSTRAINT `adviser_ibfk_2` FOREIGN KEY (`adviserDoctorID`) REFERENCES `doctor` (`doctorIdTel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `adviser` */

insert  into `adviser`(`adviserId`,`adviseUserID`,`adviserDoctorID`,`adviseTitle`,`adviseContent`) values (1,'123','123456','医疗问诊过程的评价','这是一个超级好的医生，会唱会跳'),(2,'123456','0002','医疗评价','这老师非常活泼聪明，是小有名气的医生，服务非常到位');

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `answerID` int NOT NULL AUTO_INCREMENT,
  `answerTitle` int NOT NULL,
  `answere1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer2` varchar(128) DEFAULT NULL,
  `answer3` varchar(64) DEFAULT NULL,
  `answer4` varchar(32) DEFAULT NULL,
  `answer5` varchar(32) DEFAULT NULL,
  `answer6` varchar(32) DEFAULT NULL,
  `answer7` varchar(32) DEFAULT NULL,
  `answer8` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`answerID`,`answerTitle`),
  KEY `title` (`answerTitle`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`answerTitle`) REFERENCES `title` (`titleId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `answer` */

insert  into `answer`(`answerID`,`answerTitle`,`answere1`,`answer2`,`answer3`,`answer4`,`answer5`,`answer6`,`answer7`,`answer8`) values (4,4,'1~2周','1个月','半年','一年',NULL,NULL,NULL,NULL),(5,5,'1公里','2~5公里','10公里以上',NULL,NULL,NULL,NULL,NULL),(6,6,'是','否',NULL,NULL,NULL,NULL,NULL,NULL),(7,7,'有','没有','妈妈','爸爸','奶奶','爷爷','外婆','外公'),(8,8,'好','一班','糟糕','很糟糕',NULL,NULL,NULL,NULL);

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctorIdTel` varchar(11) NOT NULL,
  `doctorName` varchar(32) NOT NULL,
  `doctorGender` varchar(4) NOT NULL,
  `doctor` varchar(16) NOT NULL,
  `doctorPassword` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `doctorBirtheDate` date NOT NULL,
  `doctorOrder` int DEFAULT NULL,
  `doctorClassify` int NOT NULL,
  `doctorTest` int DEFAULT NULL,
  PRIMARY KEY (`doctorIdTel`),
  KEY `doctorOrder` (`doctorOrder`),
  KEY `doctor_ibfk_3` (`doctorTest`),
  KEY `doctor_ibfk_2` (`doctorClassify`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctorOrder`) REFERENCES `_order` (`orderId`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`doctorClassify`) REFERENCES `doctorDepartment` (`classifyId`),
  CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`doctorTest`) REFERENCES `test` (`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`doctorIdTel`,`doctorName`,`doctorGender`,`doctor`,`doctorPassword`,`doctorBirtheDate`,`doctorOrder`,`doctorClassify`,`doctorTest`) values ('0001','王保国','男','wan_com','124xx','2021-04-01',21,8,8),('0002','赵离影','女','zhao_com','xiao123','2021-04-15',21,9,8),('0003','化成雨','男','hua_com','2156','2021-04-08',21,10,8),('123456','菜食鲲','男','cai_com','1234','2021-04-25',21,7,8);

/*Table structure for table `doctorDepartment` */

DROP TABLE IF EXISTS `doctorDepartment`;

CREATE TABLE `doctorDepartment` (
  `classifyId` int NOT NULL AUTO_INCREMENT,
  `className` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `classFunction` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`classifyId`,`className`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctorDepartment` */

insert  into `doctorDepartment`(`classifyId`,`className`,`classFunction`) values (7,'脑科','大脑'),(8,'妇科',NULL),(9,'儿科',NULL),(10,'眼科',NULL);

/*Table structure for table `mutlOrder` */

DROP TABLE IF EXISTS `mutlOrder`;

CREATE TABLE `mutlOrder` (
  `multOrdreID` int NOT NULL AUTO_INCREMENT,
  `multUserId` varchar(11) NOT NULL,
  `multOrderId` int NOT NULL,
  PRIMARY KEY (`multOrdreID`,`multUserId`,`multOrderId`),
  KEY `multUserId` (`multUserId`),
  KEY `multOrderId` (`multOrderId`),
  CONSTRAINT `mutlOrder_ibfk_1` FOREIGN KEY (`multUserId`) REFERENCES `_user` (`userIdTel`),
  CONSTRAINT `mutlOrder_ibfk_2` FOREIGN KEY (`multOrderId`) REFERENCES `_order` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mutlOrder` */

insert  into `mutlOrder`(`multOrdreID`,`multUserId`,`multOrderId`) values (6,'00012',20),(7,'10086',21);

/*Table structure for table `orderStatus` */

DROP TABLE IF EXISTS `orderStatus`;

CREATE TABLE `orderStatus` (
  `orderStatusID` int NOT NULL AUTO_INCREMENT,
  `orderSrarusName` varchar(32) NOT NULL,
  PRIMARY KEY (`orderStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderStatus` */

insert  into `orderStatus`(`orderStatusID`,`orderSrarusName`) values (1,'订单初始化状态'),(2,'订单已创建状态'),(3,'订单已支付状态'),(4,'商品出库状态'),(5,'商品运输状态'),(6,'商品已抵达状态'),(7,'商品待签收状态'),(8,'商品已签收状态'),(10,'商品已经评价状态'),(11,'heello');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `testId` int NOT NULL AUTO_INCREMENT,
  `testName` varchar(255) NOT NULL,
  `testClassify` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `testDoctor` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`testId`,`testClassify`,`testDoctor`),
  KEY `doctor` (`testDoctor`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`testDoctor`) REFERENCES `doctor` (`doctorIdTel`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `test` */

insert  into `test`(`testId`,`testName`,`testClassify`,`testDoctor`) values (5,'脑智障病情测试','脑补测试','0001'),(8,'沈金冰测试','身体测试','0003');

/*Table structure for table `title` */

DROP TABLE IF EXISTS `title`;

CREATE TABLE `title` (
  `titleId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `test` int NOT NULL,
  PRIMARY KEY (`titleId`,`test`),
  KEY `test` (`test`),
  CONSTRAINT `title_ibfk_1` FOREIGN KEY (`test`) REFERENCES `test` (`testId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `title` */

insert  into `title`(`titleId`,`title`,`test`) values (4,'持续多长时间？',5),(5,'一次能跑多少公里？',5),(6,'是否发烧？',5),(7,'有家族病史吗？',8),(8,'身体现在如何？',8);

/* Trigger structure for table `_order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_order` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `insert_order` AFTER INSERT ON `_order` FOR EACH ROW BEGIN
    /*if((select userIdTel from _user where userIdTel=123)){ };*/
  /*  update mutlOrder set multUserID=new.orderId where userIdTel=new.userId;*/
   iNSERT INTO mutlOrder(multUserId,multOrderId)values(new.userId,new.orderId);
   update doctor set doctorOrder=new.orderId;
    END */$$


DELIMITER ;

/* Trigger structure for table `_user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `delete_user` BEFORE DELETE ON `_user` FOR EACH ROW BEGIN
	/*DELETE FROM _order WHERE orderId=
	(
	select userOrder from _user
	);*/
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM mutlOrder WHERE multUserID=old.userIdTel;
	SET FOREIGN_KEY_CHECKS=1;
    END */$$


DELIMITER ;

/* Trigger structure for table `doctor` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_doctor` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `delete_doctor` AFTER DELETE ON `doctor` FOR EACH ROW BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM test WHERE doctor=old.doctorIdTel;
	SET FOREIGN_KEY_CHECKS=1;
    END */$$


DELIMITER ;

/* Trigger structure for table `mutlOrder` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delet_mult_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `delet_mult_user` AFTER DELETE ON `mutlOrder` FOR EACH ROW BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM  _order WHERE orderId=old.multOrderId;
	SET FOREIGN_KEY_CHECKS=1;
    END */$$


DELIMITER ;

/* Trigger structure for table `test` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_test` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `insert_test` AFTER INSERT ON `test` FOR EACH ROW BEGIN
	update doctor set doctorTest=new.testId;
    END */$$


DELIMITER ;

/* Trigger structure for table `test` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_test` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `delete_test` AFTER DELETE ON `test` FOR EACH ROW BEGIN
		SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM title WHERE test=old.testId;
	SET FOREIGN_KEY_CHECKS=1;
    END */$$


DELIMITER ;

/* Trigger structure for table `title` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_title` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `delete_title` AFTER DELETE ON `title` FOR EACH ROW BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM answer WHERE title=old.titleId;
	SET FOREIGN_KEY_CHECKS=1;
    END */$$


DELIMITER ;

/*Table structure for table `doctor_dept` */

DROP TABLE IF EXISTS `doctor_dept`;

/*!50001 DROP VIEW IF EXISTS `doctor_dept` */;
/*!50001 DROP TABLE IF EXISTS `doctor_dept` */;

/*!50001 CREATE TABLE  `doctor_dept`(
 `doctorIdTel` varchar(11) ,
 `doctorName` varchar(32) ,
 `doctorGender` varchar(4) ,
 `doctor` varchar(16) ,
 `doctorPassword` varchar(16) ,
 `doctorBirtheDate` date ,
 `doctorOrder` int ,
 `doctorClassify` int ,
 `doctorTest` int ,
 `classifyId` int ,
 `className` varchar(32) ,
 `classFunction` varchar(512) 
)*/;

/*Table structure for table `selectDoctor_test` */

DROP TABLE IF EXISTS `selectDoctor_test`;

/*!50001 DROP VIEW IF EXISTS `selectDoctor_test` */;
/*!50001 DROP TABLE IF EXISTS `selectDoctor_test` */;

/*!50001 CREATE TABLE  `selectDoctor_test`(
 `testId` int ,
 `testName` varchar(255) ,
 `testClassify` varchar(32) ,
 `testDoctor` varchar(22) ,
 `doctorIdTel` varchar(11) ,
 `doctorName` varchar(32) ,
 `doctorGender` varchar(4) ,
 `doctor` varchar(16) ,
 `doctorPassword` varchar(16) ,
 `doctorBirtheDate` date ,
 `doctorOrder` int ,
 `doctorClassify` int ,
 `doctorTest` int 
)*/;

/*Table structure for table `selectTest_title_Anser` */

DROP TABLE IF EXISTS `selectTest_title_Anser`;

/*!50001 DROP VIEW IF EXISTS `selectTest_title_Anser` */;
/*!50001 DROP TABLE IF EXISTS `selectTest_title_Anser` */;

/*!50001 CREATE TABLE  `selectTest_title_Anser`(
 `testId` int ,
 `testName` varchar(255) ,
 `testClassify` varchar(32) ,
 `testDoctor` varchar(22) ,
 `titleId` int ,
 `title` varchar(512) ,
 `test` int ,
 `answerID` int ,
 `answerTitle` int ,
 `answere1` varchar(512) ,
 `answer2` varchar(128) ,
 `answer3` varchar(64) ,
 `answer4` varchar(32) ,
 `answer5` varchar(32) ,
 `answer6` varchar(32) ,
 `answer7` varchar(32) ,
 `answer8` varchar(32) 
)*/;

/*Table structure for table `select_user_order` */

DROP TABLE IF EXISTS `select_user_order`;

/*!50001 DROP VIEW IF EXISTS `select_user_order` */;
/*!50001 DROP TABLE IF EXISTS `select_user_order` */;

/*!50001 CREATE TABLE  `select_user_order`(
 `userIdTel` varchar(11) ,
 `userName` varchar(32) ,
 `userGender` varchar(2) ,
 `user` varchar(16) ,
 `userPassword` varchar(16) ,
 `userBirthDate` date ,
 `orderId` int ,
 `orderName` varchar(255) ,
 `orderCreatTime` date ,
 `orderEndTime` date ,
 `oederAddress` varchar(255) ,
 `orderUserTel` varchar(11) ,
 `orderBusinessTel` varchar(11) ,
 `orderStatus` int ,
 `userId` varchar(11) 
)*/;

/*Table structure for table `seltorder_seletDoctor` */

DROP TABLE IF EXISTS `seltorder_seletDoctor`;

/*!50001 DROP VIEW IF EXISTS `seltorder_seletDoctor` */;
/*!50001 DROP TABLE IF EXISTS `seltorder_seletDoctor` */;

/*!50001 CREATE TABLE  `seltorder_seletDoctor`(
 `orderId` int ,
 `orderName` varchar(255) ,
 `orderCreatTime` date ,
 `orderEndTime` date ,
 `oederAddress` varchar(255) ,
 `orderUserTel` varchar(11) ,
 `orderBusinessTel` varchar(11) ,
 `orderStatus` int ,
 `userId` varchar(11) ,
 `doctorIdTel` varchar(11) ,
 `doctorName` varchar(32) ,
 `doctorGender` varchar(4) ,
 `doctor` varchar(16) ,
 `doctorPassword` varchar(16) ,
 `doctorBirtheDate` date ,
 `doctorOrder` int ,
 `doctorClassify` int ,
 `doctorTest` int 
)*/;

/*View structure for view doctor_dept */

/*!50001 DROP TABLE IF EXISTS `doctor_dept` */;
/*!50001 DROP VIEW IF EXISTS `doctor_dept` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `doctor_dept` AS select `doctor`.`doctorIdTel` AS `doctorIdTel`,`doctor`.`doctorName` AS `doctorName`,`doctor`.`doctorGender` AS `doctorGender`,`doctor`.`doctor` AS `doctor`,`doctor`.`doctorPassword` AS `doctorPassword`,`doctor`.`doctorBirtheDate` AS `doctorBirtheDate`,`doctor`.`doctorOrder` AS `doctorOrder`,`doctor`.`doctorClassify` AS `doctorClassify`,`doctor`.`doctorTest` AS `doctorTest`,`doctorDepartment`.`classifyId` AS `classifyId`,`doctorDepartment`.`className` AS `className`,`doctorDepartment`.`classFunction` AS `classFunction` from (`doctorDepartment` left join `doctor` on((`doctor`.`doctorClassify` = `doctorDepartment`.`classifyId`))) */;

/*View structure for view selectDoctor_test */

/*!50001 DROP TABLE IF EXISTS `selectDoctor_test` */;
/*!50001 DROP VIEW IF EXISTS `selectDoctor_test` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `selectDoctor_test` AS select `test`.`testId` AS `testId`,`test`.`testName` AS `testName`,`test`.`testClassify` AS `testClassify`,`test`.`testDoctor` AS `testDoctor`,`doctor`.`doctorIdTel` AS `doctorIdTel`,`doctor`.`doctorName` AS `doctorName`,`doctor`.`doctorGender` AS `doctorGender`,`doctor`.`doctor` AS `doctor`,`doctor`.`doctorPassword` AS `doctorPassword`,`doctor`.`doctorBirtheDate` AS `doctorBirtheDate`,`doctor`.`doctorOrder` AS `doctorOrder`,`doctor`.`doctorClassify` AS `doctorClassify`,`doctor`.`doctorTest` AS `doctorTest` from (`test` left join `doctor` on((`doctor`.`doctorIdTel` = `test`.`testDoctor`))) */;

/*View structure for view selectTest_title_Anser */

/*!50001 DROP TABLE IF EXISTS `selectTest_title_Anser` */;
/*!50001 DROP VIEW IF EXISTS `selectTest_title_Anser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `selectTest_title_Anser` AS select `test`.`testId` AS `testId`,`test`.`testName` AS `testName`,`test`.`testClassify` AS `testClassify`,`test`.`testDoctor` AS `testDoctor`,`title`.`titleId` AS `titleId`,`title`.`title` AS `title`,`title`.`test` AS `test`,`answer`.`answerID` AS `answerID`,`answer`.`answerTitle` AS `answerTitle`,`answer`.`answere1` AS `answere1`,`answer`.`answer2` AS `answer2`,`answer`.`answer3` AS `answer3`,`answer`.`answer4` AS `answer4`,`answer`.`answer5` AS `answer5`,`answer`.`answer6` AS `answer6`,`answer`.`answer7` AS `answer7`,`answer`.`answer8` AS `answer8` from (`answer` left join (`title` left join `test` on((`test`.`testId` = `title`.`test`))) on((`title`.`titleId` = `answer`.`answerTitle`))) */;

/*View structure for view select_user_order */

/*!50001 DROP TABLE IF EXISTS `select_user_order` */;
/*!50001 DROP VIEW IF EXISTS `select_user_order` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `select_user_order` AS select `_user`.`userIdTel` AS `userIdTel`,`_user`.`userName` AS `userName`,`_user`.`userGender` AS `userGender`,`_user`.`user` AS `user`,`_user`.`userPassword` AS `userPassword`,`_user`.`userBirthDate` AS `userBirthDate`,`_order`.`orderId` AS `orderId`,`_order`.`orderName` AS `orderName`,`_order`.`orderCreatTime` AS `orderCreatTime`,`_order`.`orderEndTime` AS `orderEndTime`,`_order`.`oederAddress` AS `oederAddress`,`_order`.`orderUserTel` AS `orderUserTel`,`_order`.`orderBusinessTel` AS `orderBusinessTel`,`_order`.`orderStatus` AS `orderStatus`,`_order`.`userId` AS `userId` from (`_order` left join `_user` on((`_user`.`userIdTel` = `_order`.`userId`))) */;

/*View structure for view seltorder_seletDoctor */

/*!50001 DROP TABLE IF EXISTS `seltorder_seletDoctor` */;
/*!50001 DROP VIEW IF EXISTS `seltorder_seletDoctor` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `seltorder_seletDoctor` AS select `_order`.`orderId` AS `orderId`,`_order`.`orderName` AS `orderName`,`_order`.`orderCreatTime` AS `orderCreatTime`,`_order`.`orderEndTime` AS `orderEndTime`,`_order`.`oederAddress` AS `oederAddress`,`_order`.`orderUserTel` AS `orderUserTel`,`_order`.`orderBusinessTel` AS `orderBusinessTel`,`_order`.`orderStatus` AS `orderStatus`,`_order`.`userId` AS `userId`,`doctor`.`doctorIdTel` AS `doctorIdTel`,`doctor`.`doctorName` AS `doctorName`,`doctor`.`doctorGender` AS `doctorGender`,`doctor`.`doctor` AS `doctor`,`doctor`.`doctorPassword` AS `doctorPassword`,`doctor`.`doctorBirtheDate` AS `doctorBirtheDate`,`doctor`.`doctorOrder` AS `doctorOrder`,`doctor`.`doctorClassify` AS `doctorClassify`,`doctor`.`doctorTest` AS `doctorTest` from (`doctor` left join `_order` on((`_order`.`orderBusinessTel` = `doctor`.`doctorIdTel`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
