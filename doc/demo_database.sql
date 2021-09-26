/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.14-log : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `fileattach` */

DROP TABLE IF EXISTS `fileattach`;

CREATE TABLE `fileattach` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILENAME` varchar(200) DEFAULT NULL,
  `FILEPATH` varchar(1024) DEFAULT NULL,
  `EXT` varchar(100) DEFAULT NULL,
  `FIELTYPE` varchar(200) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `fileattach` */

insert  into `fileattach`(`ID`,`FILENAME`,`FILEPATH`,`EXT`,`FIELTYPE`,`NOTE`) values (3,'result.jpg','/static/upload/1621224138668.jpg','.jpg',NULL,NULL),(4,'step1.jpg','/static/upload/1621224138846.jpg','.jpg',NULL,NULL),(5,'step2.jpg','/static/upload/1621224138855.jpg','.jpg',NULL,NULL),(6,'step3.jpg','/static/upload/1621224138881.jpg','.jpg',NULL,NULL),(7,'step4.jpg','/static/upload/1621224138889.jpg','.jpg',NULL,NULL),(8,'step5.jpg','/static/upload/1621224138896.jpg','.jpg',NULL,NULL),(9,'step6.jpg','/static/upload/1621224138903.jpg','.jpg',NULL,NULL),(10,'result.jpg','/static/upload/1621913283973.jpg','.jpg',NULL,NULL),(11,'step1.jpg','/static/upload/1621913284170.jpg','.jpg',NULL,NULL),(12,'step2.jpg','/static/upload/1621913284178.jpg','.jpg',NULL,NULL),(13,'step3.jpg','/static/upload/1621913284185.jpg','.jpg',NULL,NULL),(14,'step4.jpg','/static/upload/1621913284192.jpg','.jpg',NULL,NULL),(15,'step5.jpg','/static/upload/1621913284199.jpg','.jpg',NULL,NULL),(16,'step6.jpg','/static/upload/1621913284220.jpg','.jpg',NULL,NULL),(17,'step7.jpg','/static/upload/1621913284228.jpg','.jpg',NULL,NULL),(18,'step8.jpg','/static/upload/1621913284235.jpg','.jpg',NULL,NULL);

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  `FOOD_NAME` varchar(100) DEFAULT NULL,
  `DEPLOY_DATE` datetime DEFAULT NULL,
  `FOOD_MATERIAL` text,
  `STEPS` int(11) DEFAULT NULL,
  `LIKES` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_2` (`FILE_ID`),
  KEY `FK_RELATIONSHIP_4` (`USER_ID`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`FILE_ID`) REFERENCES `fileattach` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `food` */

insert  into `food`(`ID`,`USER_ID`,`FILE_ID`,`FOOD_NAME`,`DEPLOY_DATE`,`FOOD_MATERIAL`,`STEPS`,`LIKES`) values (3,12,3,'鸡蛋仔','2021-05-17 04:02:19','低粉140g，鸡蛋2个，无铝泡打粉7g，木薯粉28g，白砂糖140g，淡奶28g，水140ml，玉米油28g',6,0),(4,12,10,'蔬菜鸡蛋饼','2021-05-25 03:28:04','鸡蛋4个，胡萝卜1根，西葫芦1个，土豆1个，姜1小块，葱1根，盐一小勺，油一小勺',8,3);

/*Table structure for table `food_collect` */

DROP TABLE IF EXISTS `food_collect`;

CREATE TABLE `food_collect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOOD_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_8` (`FOOD_ID`),
  KEY `FK_RELATIONSHIP_9` (`USER_ID`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`FOOD_ID`) REFERENCES `food` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `food_collect` */

insert  into `food_collect`(`ID`,`FOOD_ID`,`USER_ID`) values (1,3,12),(2,4,12);

/*Table structure for table `food_steps` */

DROP TABLE IF EXISTS `food_steps`;

CREATE TABLE `food_steps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOOD_ID` int(11) DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  `STEP_NO` int(11) DEFAULT NULL,
  `STEP_DESC` text,
  PRIMARY KEY (`ID`),
  KEY `FK_RELATIONSHIP_1` (`FOOD_ID`),
  KEY `FK_RELATIONSHIP_3` (`FILE_ID`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`FOOD_ID`) REFERENCES `food` (`ID`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`FILE_ID`) REFERENCES `fileattach` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `food_steps` */

insert  into `food_steps`(`ID`,`FOOD_ID`,`FILE_ID`,`STEP_NO`,`STEP_DESC`) values (15,3,4,1,'粉类过筛。油，水，奶，鸡蛋混合打匀。全部材料混合，搅拌均匀'),(16,3,5,2,'面糊过滤，去除杂质后就是鸡蛋仔的基础面糊了。可以放置1小时后使用'),(17,3,6,3,' 模子烧热，一定要烧热。这样鸡蛋仔的外皮才会更脆。在模子里刷油，均匀的刷上一层即可'),(18,3,7,4,'挤入面糊，面糊的份量可以参考下图，就是刚刚好一半模子满。停留几秒钟，盖上鸡蛋仔的另一半盖子，马上翻面。'),(19,3,8,5,' 每面各烧1-2分钟，打开看看颜色差不多就可以出炉了'),(20,3,9,6,'用叉子之类的东西挑一些，鸡蛋仔就从模子中掉出来。 热的时候还会软，降温之后，就会外脆里嫩了'),(21,4,11,1,'西葫芦洗干净，胡萝卜和土豆去皮洗干净'),(22,4,12,2,'三者擦丝。土豆丝用水泡着，换三次水（可以去掉部分的淀粉，泡水主要是为了防止土豆氧化）'),(23,4,13,3,'葱切粒，姜拍扁后剁蓉'),(24,4,14,4,'所有材料除鸡蛋和油外混合在一起'),(25,4,15,5,'拌匀，不要加水，因为蔬菜会出水，西葫芦尤其给力'),(26,4,16,6,'不粘锅加一点油抹一下，调小火，放入蔬菜丝，在中间挖个口留给鸡蛋'),(27,4,17,7,'抖动平底锅可以轻松移动蔬菜蛋饼的话，将饼翻面继续煎至容易脱底，怕不熟可以加锅盖十秒'),(28,4,18,8,'上碟！漂亮、美味、健康');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SALT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `NOTE` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sys_user` */

insert  into `sys_user`(`ID`,`LOGIN_NAME`,`PASSWORD`,`SALT`,`NOTE`) values (12,'2031115154@qq.com','3535a51c67612ba09b0c914f756acf8c137be614','e566c0051b8c3a89',NULL),(13,'wang0330@qq.com','2edfe5d93d9de293c620aa151ae5b7911080b545','a981a78478b6aea7',NULL),(14,'a@qq.com','c4bdd5d7bde3a2bf58f55f9f0c8513cdfcf23ca2','3542b0a3d946e362',NULL),(15,'test12345@qq.com','98587fb63ad2923fd787c145b9bea4513f83d27e','99e4645ed684095f',NULL),(16,'test123@qq.com','70c067d020cad6054aaa1c239152051849b70e00','0156c8719d51b131',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
