/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.21-MariaDB : Database - crud_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crud_system` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `crud_system`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`user_id`,`username`,`password`) values (1,'Asad','asad'),(2,'Anoop','anoop');

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `batch` */

insert  into `batch`(`b_id`,`b_name`) values (1,'Java Begginers'),(2,'PHP batch'),(3,'Java Debuggers'),(5,'Java 10'),(6,'Java Basic'),(7,'PHP Basic'),(8,'Java Geeks');

/*Table structure for table `bridge` */

DROP TABLE IF EXISTS `bridge`;

CREATE TABLE `bridge` (
  `bridge_id` int(11) NOT NULL AUTO_INCREMENT,
  `fees_id` int(11) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bridge_id`),
  KEY `fees_id` (`fees_id`),
  KEY `st_id` (`st_id`),
  CONSTRAINT `bridge_ibfk_1` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`fees_id`),
  CONSTRAINT `bridge_ibfk_2` FOREIGN KEY (`st_id`) REFERENCES `student` (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `bridge` */

insert  into `bridge`(`bridge_id`,`fees_id`,`st_id`) values (1,15,19),(2,14,23),(3,19,24),(4,21,16),(5,22,13),(6,23,26),(7,24,26);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`d_id`,`d_name`) values (3,'EL'),(5,'ES'),(6,'CS'),(7,'EE'),(8,'Software'),(9,'Computer'),(10,'IT'),(11,'ME'),(12,'PG'),(13,'ELDC'),(14,'CE'),(15,'AR'),(16,'CE'),(17,'CRP'),(18,'MI'),(19,'Software');

/*Table structure for table `fees` */

DROP TABLE IF EXISTS `fees`;

CREATE TABLE `fees` (
  `fees_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) DEFAULT NULL,
  `fees_date` date DEFAULT NULL,
  PRIMARY KEY (`fees_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `batch` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `fees` */

insert  into `fees`(`fees_id`,`b_id`,`fees_date`) values (14,5,'2018-02-01'),(15,5,'2018-04-01'),(17,5,'2018-03-01'),(18,1,'2018-02-01'),(19,8,'2018-02-01'),(20,8,'2018-03-01'),(21,7,'2018-02-05'),(22,2,'2018-04-01'),(23,3,'2018-05-01'),(24,3,'2018-07-02'),(25,1,'2018-03-01'),(26,1,'2018-10-23');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(255) DEFAULT NULL,
  `st_rollno` varchar(255) DEFAULT NULL,
  `st_address` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `st_rollno` (`st_rollno`),
  KEY `d_id` (`d_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `batch` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`st_id`,`st_name`,`st_rollno`,`st_address`,`d_id`,`b_id`) values (1,'Anoop Lohana','16SW32','Chandni plasa',8,6),(2,'Shayan','16SW10','Naseem Nagar',8,3),(13,'Asad Ramzan','f16CS75','Karachi',6,2),(15,'Munwar','16SW40','Ali CNG',3,3),(16,'Sanjay Kumar','16SW161','Qasimabad',3,7),(17,'Sagar','16SW12','Gulstan Sajad',3,6),(18,'Zakir khoso','16Sw52','Latif hostek',6,5),(19,'Suraj','16SW18','Bhittai Nigar',6,5),(20,'Deepak Kumar','2k1639','Chandni plaza',7,3),(21,'Amrat punhani','16CS12','ALi Palace',6,5),(22,'Ali ZED','15SW12','MUET HOSTEL',12,7),(23,'Vinesh','17SW32','Mobile Market',8,5),(24,'Tariq','11','1123',3,8),(25,'Rajender','1511156','Energy',7,5),(26,'Wagena','f16cs09','mirpur',6,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
