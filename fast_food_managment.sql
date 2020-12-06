/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.21-MariaDB : Database - fast_food_managment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fast_food_managment` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fast_food_managment`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`name`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,'Fast Food',1,1,'2018-05-09',3,'2018-05-11'),(2,'Bar BQQ',1,2,'2018-05-07',4,'2018-05-09'),(4,'Handi',1,1,'2018-05-08',4,'2018-05-11'),(6,'Karahiii',1,1,'2018-05-01',2,'2018-05-02'),(7,'Fries',0,2,NULL,1,NULL),(8,'CHeck',0,3,NULL,1,NULL),(9,'fries',1,1,'2018-05-02',2,'2018-05-10'),(10,'pepsi',1,1,'2018-04-01',3,'2018-05-05'),(12,'Seven',0,0,'2018-05-01',0,'2018-05-01'),(13,'Slice',0,0,'2018-05-01',0,'2018-05-03'),(14,'StraBarry',1,1,'2018-05-11',2,'2018-05-11');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `Salary` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`name`,`contact_no`,`address`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`,`d_id`,`Salary`) values (1,'Anup ','0331-3834640','Hyderabad',1,1,'2018-04-30',4,'2018-05-11',1,'1000.0000'),(11,'Munwar','0312-3923259','Hyderabad',1,1,'2018-05-07',2,'2018-05-05',2,'20000.0000'),(12,'Shayan','0303-2312322','Sukkur',1,2,'2018-05-03',1,'2018-05-15',1,'5000.0000'),(13,'Avinash','0333-2595185','',0,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Awein','0333-2595187','',0,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Check','0333-2595697','',0,NULL,NULL,NULL,NULL,NULL,NULL),(16,'asd','0331-3834648','',0,NULL,NULL,NULL,NULL,NULL,NULL),(17,'bhatti','0331-8454454','',0,NULL,NULL,NULL,NULL,NULL,NULL),(18,'ghjh','0331-3454987','',0,NULL,NULL,NULL,NULL,NULL,NULL),(19,'aa','0453-3534672','',0,NULL,NULL,NULL,NULL,NULL,NULL),(20,'ss','0458-2595786','',0,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Abdullah','0331-3660470','',0,NULL,NULL,NULL,NULL,NULL,NULL),(22,'Sain','0336-0894543','',0,NULL,NULL,NULL,NULL,NULL,NULL),(23,'unknown','0331-3915482','',0,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Zakir Khoso','0305-2514978','Latif Hostel',1,1,'2018-05-01',2,'2018-05-05',2,'25000.0000'),(25,'Zohaib','0312-3233589','Latif Hostel',1,2,'2018-05-04',4,'2018-05-11',1,'3000.0000'),(26,'dgh','0331-3367590','',0,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Ramzan jamali','0331-3412290','Karachi',1,1,'2018-05-02',3,'2018-05-02',NULL,NULL),(28,'Sagar ','0303-2160201','TandoBago',1,1,'2018-05-11',2,'2018-05-11',NULL,NULL),(29,'Pooja Lohana','0331-3839038','Sujawal',1,1,'2018-05-27',1,'2018-05-27',NULL,NULL);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`d_id`,`dname`) values (1,'Software'),(2,'Hardware'),(3,'Electrical');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `Bill` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

/*Data for the table `order` */

insert  into `order`(`order_id`,`date`,`customer_id`,`order_no`,`discount_type`,`discount_amount`,`Bill`,`activity_id`) values (12,'2018-04-11',26,255,'Amount',200,2600,1),(15,'2018-03-04',11,914,NULL,NULL,1300,1),(16,'2018-07-01',NULL,351,NULL,NULL,800,1),(17,'2018-05-15',NULL,483,NULL,NULL,100,1),(18,'2018-06-04',NULL,582,NULL,NULL,0,1),(19,'2018-03-04',NULL,918,NULL,NULL,0,1),(20,'2018-03-04',NULL,800,NULL,NULL,0,1),(21,'2018-06-13',1,791,NULL,NULL,950,1),(22,'2018-07-10',1,541,NULL,NULL,100,1),(23,'2018-07-03',11,384,NULL,NULL,800,1),(24,'2018-03-04',1,451,NULL,NULL,800,1),(25,'2018-03-04',12,887,NULL,NULL,1700,1),(26,'2018-03-04',12,356,NULL,NULL,500,1),(27,'2018-03-04',12,555,NULL,NULL,300,1),(28,'2018-03-04',NULL,683,NULL,NULL,800,1),(29,'2018-03-04',12,161,NULL,NULL,800,1),(30,'2018-03-04',11,188,NULL,NULL,900,1),(31,'2018-03-04',12,667,NULL,NULL,800,1),(32,'2018-03-04',NULL,893,NULL,NULL,900,1),(33,'2018-03-04',NULL,788,NULL,NULL,800,1),(34,'2018-03-04',11,524,NULL,NULL,800,1),(35,'2018-03-04',12,106,NULL,NULL,800,1),(36,'2018-03-04',11,590,NULL,NULL,0,1),(37,'2018-03-04',11,457,NULL,NULL,0,1),(38,'2018-03-04',12,884,NULL,NULL,950,1),(39,'2018-03-04',11,696,NULL,NULL,1600,1),(40,'2018-03-21',14,949,NULL,NULL,3990,1),(41,'2018-03-21',21,236,NULL,NULL,2040,1),(42,'2018-03-21',12,428,NULL,NULL,480,1),(43,'2018-03-21',12,128,NULL,NULL,600,1),(44,'2018-03-21',22,983,NULL,NULL,700,1),(45,'2018-03-21',22,336,NULL,NULL,3680,1),(46,'2018-03-21',11,377,NULL,NULL,2390,1),(47,'2018-03-21',11,589,NULL,NULL,2580,1),(48,'2018-03-21',12,401,NULL,NULL,3500,1),(49,'2018-03-22',13,737,NULL,NULL,1790,1),(50,'2018-03-22',13,459,NULL,NULL,3600,1),(51,'2018-03-25',NULL,367,NULL,NULL,1980,1),(52,'2018-03-26',NULL,518,NULL,NULL,1600,1),(53,'2018-03-26',1,52,NULL,NULL,800,1),(54,'2018-03-26',NULL,618,NULL,NULL,590,1),(55,'2018-03-26',NULL,479,NULL,NULL,2800,1),(56,'2018-03-26',NULL,628,NULL,NULL,2380,1),(57,'2018-03-26',13,354,NULL,NULL,1980,1),(60,'2018-03-26',13,520,NULL,NULL,1790,1),(61,'2018-03-26',NULL,348,NULL,NULL,1180,1),(62,'2018-04-08',NULL,836,NULL,NULL,3000,1),(63,'2018-04-08',NULL,734,NULL,NULL,2300,1),(64,'2018-04-08',NULL,942,'Amount',300,2900,1),(65,'2018-04-08',13,115,'Percentage',10,170,1),(66,'2018-04-08',NULL,168,NULL,0,1360,1),(67,'2018-04-08',NULL,114,NULL,0,2590,1),(68,'2018-04-08',NULL,718,NULL,0,1960,1),(69,'2018-04-08',NULL,273,NULL,0,1770,1),(70,'2018-04-08',1,571,NULL,0,1600,1),(71,'2018-04-11',11,909,'Percentage',70,3360,1),(73,'2018-04-16',1,605,'Amount',200,1720,1),(74,'2018-04-16',NULL,672,'Percentage',80,2720,1),(75,'2018-04-17',21,171,'Amount',500,4210,1),(76,'2018-04-20',NULL,553,NULL,0,4970,1),(77,'2018-04-20',24,927,NULL,0,7700,1),(78,'2018-04-20',21,363,NULL,0,13100,1),(79,'2018-04-20',18,722,NULL,0,17200,1),(80,'2018-04-20',18,44,'Amount',1000,8950,1),(82,'2018-05-05',25,512,'Amount',1500,2180,1),(83,'2018-05-05',14,456,'Percentage',10,180,1),(84,'2018-05-05',18,16,'Amount',200,1400,1),(85,'2018-05-09',19,66,'Percentage',12,45,1),(86,'2018-05-09',NULL,743,'Percentage',10,120,1),(87,'2018-05-09',NULL,741,'Percentage',10,180,1),(88,'2018-05-09',NULL,562,'Percentage',10,260,1),(89,'2018-05-09',NULL,756,NULL,0,0,1),(90,'2018-05-09',NULL,603,NULL,0,700,1),(91,'2018-05-09',NULL,679,'Amount',50,650,1),(92,'2018-05-09',NULL,177,NULL,0,3000,1),(93,'2018-05-11',NULL,41,'Amount',100,3000,1),(94,'2018-05-11',11,463,'Percentage',123,6680,1),(95,'2018-05-15',NULL,573,'Percentage',10,373,1),(96,'2018-05-15',NULL,137,'Percentage',7,110,1),(97,'2018-05-15',NULL,979,'Percentage',14,3337,1),(98,'2018-05-15',28,802,'Percentage',15,1930,1),(99,'2018-05-15',28,27,NULL,0,0,1),(100,'2018-05-15',28,916,NULL,0,0,1),(101,'2018-05-16',25,84,'Percentage',9,2912,1),(102,'2018-05-16',27,143,'Percentage',3,1843,1),(103,'2018-05-16',27,885,'Amount',100,1100,1),(104,'2018-05-19',25,397,'Percentage',21,8532,1),(105,'2018-05-27',25,948,'Amount',310,5000,1),(106,'2018-05-27',29,500,'Percentage',15,3094,1),(107,'2018-05-28',24,534,'Percentage',10,2286,1),(108,'2018-05-28',27,238,'Amount',600,3000,1);

/*Table structure for table `order details` */

DROP TABLE IF EXISTS `order details`;

CREATE TABLE `order details` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  PRIMARY KEY (`order_detail_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `order details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

/*Data for the table `order details` */

insert  into `order details`(`order_detail_id`,`order_id`,`product_id`,`quantity`,`activity_id`) values (4,15,1,2,1),(5,15,5,2,1),(15,30,4,1,1),(16,30,5,1,1),(17,31,4,1,1),(18,34,4,1,1),(19,35,4,1,1),(20,38,1,0,1),(21,38,4,3,1),(22,39,4,3,1),(23,40,2,1,1),(24,40,7,2,1),(34,48,4,2,1),(35,48,5,1,1),(36,48,7,2,1),(37,48,7,1,1),(38,49,2,1,1),(39,49,4,3,1),(40,50,4,3,1),(41,50,7,2,1),(42,53,5,2,1),(43,53,6,3,1),(44,56,4,2,1),(45,56,6,2,1),(59,61,8,2,1),(60,62,4,3,1),(61,62,6,4,1),(62,63,4,2,1),(82,73,8,2,1),(89,75,10,23,1),(90,75,14,4,1),(91,76,4,2,1),(92,76,7,3,1),(93,76,8,2,1),(94,76,12,7,1),(95,77,4,6,1),(96,77,7,2,1),(97,77,10,10,1),(98,78,7,10,1),(99,78,12,10,1),(100,78,14,10,1),(101,78,12,20,1),(102,79,9,10,1),(103,79,12,60,1),(104,80,9,10,1),(105,80,8,5,1),(106,80,14,10,1),(107,82,7,5,1),(108,82,10,4,1),(109,83,4,2,1),(110,83,5,2,1),(111,84,6,2,1),(112,84,7,2,1),(113,85,8,2,1),(114,86,7,2,1),(115,87,7,3,1),(116,88,6,4,1),(117,88,7,3,1),(118,90,9,1,1),(119,91,5,1,1),(120,91,7,1,1),(121,92,7,5,1),(122,93,4,3,1),(123,93,9,1,1),(124,94,7,10,1),(125,94,12,4,1),(126,95,10,19,1),(127,95,5,5,1),(128,96,7,2,1),(129,96,8,2,1),(130,97,8,2,1),(131,97,9,5,1),(132,98,5,3,1),(133,98,9,2,1),(134,98,14,2,1),(135,98,10,1,1),(136,98,7,2,1),(137,98,16,2,1),(138,99,6,1,1),(139,99,8,2,1),(140,100,5,3,1),(141,100,9,2,1),(142,101,6,2,1),(143,101,9,4,1),(144,102,5,5,1),(145,102,9,2,1),(146,103,5,12,1),(147,104,16,12,1),(148,105,16,5,1),(149,105,5,3,1),(150,105,10,3,1),(151,106,7,1,1),(152,106,14,1,1),(153,106,16,1,1),(154,106,10,2,1),(155,106,4,2,1),(156,103,14,3,1),(157,103,9,2,1),(158,103,18,2,1),(159,103,5,4,1),(160,107,10,2,1),(161,107,16,2,1),(162,107,18,4,1),(163,108,14,3,1),(164,108,7,2,1),(165,108,16,2,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`permission_id`,`name`) values (1,'View User'),(2,'Update User'),(3,'Delete User'),(4,'Add User'),(5,'View Category'),(6,'Update Category'),(7,'Delete Category'),(8,'Add Category'),(9,'View Customer'),(10,'Update Customer'),(11,'Delete Customer'),(12,'Add Customer'),(13,'View UserType'),(14,'Update UserType'),(15,'Delete UserType'),(16,'Add UserType'),(17,'View Product'),(18,'Update Product'),(19,'Delete Product'),(20,'Add Product'),(21,'View Question'),(22,'Update Question'),(23,'Delete Question'),(24,'Add Question'),(25,'View Order'),(26,'View Sale');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`product_id`,`category_id`,`name`,`price`,`quantity`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,1,'Chicken Broast',150,1,0,1,NULL,NULL,NULL),(2,1,'Broast',170,200,0,1,NULL,NULL,NULL),(4,6,'Chicken Karahii',800,11,1,1,'2018-05-02',4,'2018-05-04'),(5,2,'Roll',100,163,1,2,'2018-05-07',1,'2018-05-15'),(6,2,'Zinger',200,52,0,3,'2018-04-16',1,'2018-05-12'),(7,1,'Pizza',600,12,1,4,'2018-04-03',2,'2018-05-11'),(8,2,'Tikka',190,494,1,2,'2018-05-01',4,'2018-05-15'),(9,4,'Mutton',700,483,1,3,'2018-03-06',1,'2018-05-15'),(10,1,'ClubSandwich',170,669,1,4,'2018-03-20',3,'2018-05-09'),(11,6,'Fish',200,NULL,0,4,NULL,NULL,NULL),(12,1,'Broast',170,106,0,NULL,NULL,NULL,NULL),(13,1,'Burger',100,1000,0,NULL,NULL,NULL,NULL),(14,2,'Malai tikka',200,469,1,1,'2018-04-03',3,'2018-05-09'),(15,12,'7up',40,500,0,0,'2018-05-02',1,'2018-05-02'),(16,4,'Malai Handi',900,476,1,2,'2018-05-05',3,'2018-05-05'),(17,2,'Zinger',100,52,0,1,'2018-05-18',1,'2018-05-18'),(18,1,'Zinger',100,494,1,1,'2018-05-18',1,'2018-05-18');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `question` */

insert  into `question`(`question_id`,`question`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,'Where are you born?',1,1,'2018-04-03',4,'2018-05-02'),(2,'What is you favourite dish?',1,4,'2018-03-29',2,'2018-04-30'),(3,'Where do u live?',0,NULL,NULL,NULL,NULL),(4,'where are you>',1,2,'2018-03-12',1,'2018-05-15'),(5,'What is your nickname?',1,1,'2018-05-02',3,'2018-05-02');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `salary` decimal(16,4) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_type_id` (`user_type_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `usertype` (`user_type_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_type_id`,`username`,`password`,`name`,`contact`,`salary`,`address`,`question_id`,`answer`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,1,'Admin','admin','Sadaquat','0331-3834640','20000.0000','Hyderabad',1,'karachi',1,'1','2018-03-20','1','2018-03-29'),(2,2,'anoop.klohana','123','Anoop','03313834640','16000.0000','Sujawal',1,'Hyderabad',1,'1','2018-04-24','4','2018-04-25'),(3,2,'shayan.chandio','234','Shayan Chandio','0331-3239259','17000.0000','Hyderabad',1,'Sukkur',1,'2','2018-05-01','4','2018-05-04'),(4,2,'muwar.pk','12345','Munwar','03361392394','12000.0000','Tharparker',2,'Chicken Karahi',1,'3','2018-05-06','1','2018-05-07'),(8,2,'sanjay.kumar','1234','Sanjay Kumar','03313432241','20000.0000','Karachi',2,'Daal',1,'1','2018-05-02','3','2018-05-05'),(9,2,'sagar.baloch','1234','Sagar Baloch','03033452201','10000.0000','TandoBago',1,'Badin',1,'2','2018-05-08','3','2018-05-10'),(10,2,'azhar.bhatti','1234','Azhar','0300-3417452','1200.5000','Naushero Feroz',1,'Bhiria city',0,NULL,NULL,NULL,NULL),(12,2,'dsadd','asad1','asddd','','1500.8000','',2,'Fish',0,NULL,NULL,NULL,NULL),(14,2,'Khoso','Khoso1','Zakir','0331-3834641',NULL,'Hyderabad',1,'Gotki',1,'2','2018-05-07','1','2018-05-09'),(15,2,'Malik','Maalik1','See','0331-3834642',NULL,'Over the word',1,'Dont know',0,NULL,NULL,NULL,NULL),(16,2,'Shahzeb SHah','Asad123','Arslan','0331-3834643',NULL,'',1,'Hyderabad',0,NULL,NULL,NULL,NULL),(17,1,'Sonu.kumar','Pakistan123','Manave','0333-2595188',NULL,'',2,'Chicken',0,NULL,NULL,NULL,NULL),(18,1,'dadadds','Sujawal1','sda','0333-2595285',NULL,'Sukkur',1,'Hyd',1,'1','2018-05-01','1','2018-05-28'),(19,2,'Baloch','Sagar123','Sagarr','0331-3435650',NULL,'Badin',2,'Chicken',0,NULL,NULL,NULL,NULL),(22,12,'anoop.klUhana','Anoop1','Anu','0331-3835641',NULL,'Suj',4,'Fine',1,'1','2018-05-04','3','2018-05-15');

/*Table structure for table `user_permission` */

DROP TABLE IF EXISTS `user_permission`;

CREATE TABLE `user_permission` (
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `user_permission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_permission` */

insert  into `user_permission`(`user_id`,`permission_id`) values (1,1),(3,4),(3,5),(3,7),(3,9),(3,10),(3,17),(2,5),(2,9),(2,13),(10,1),(10,9),(10,5),(10,13),(4,2),(4,8),(4,9),(1,2),(1,3),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(2,8),(3,18),(3,21),(3,22),(2,2),(2,1),(2,26),(2,25),(2,7),(2,12),(22,2),(2,6),(2,10),(1,4),(3,1),(3,2);

/*Table structure for table `usertype` */

DROP TABLE IF EXISTS `usertype`;

CREATE TABLE `usertype` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `usertype` */

insert  into `usertype`(`user_type_id`,`type`,`activity_id`,`created_by`,`created_date`,`modified_by`,`modified_date`) values (1,'Admin',1,1,'2018-03-21',1,'2018-04-18'),(2,'Managerr',1,2,'2018-03-26',4,'2018-04-20'),(3,'Malik',0,NULL,NULL,NULL,NULL),(4,'saen',0,NULL,NULL,NULL,NULL),(5,'Saeen',0,NULL,NULL,NULL,NULL),(6,'Saen',0,NULL,NULL,NULL,NULL),(7,'Saeen',0,NULL,NULL,NULL,NULL),(8,'Saeen',0,NULL,NULL,NULL,NULL),(9,'Staff',0,NULL,NULL,NULL,NULL),(10,'Test',0,NULL,NULL,NULL,NULL),(11,'zcjoz',0,NULL,NULL,NULL,NULL),(12,'know',1,1,'2018-04-03',4,'2018-05-03'),(13,'adads',0,NULL,NULL,NULL,NULL),(14,'adads',0,NULL,NULL,NULL,NULL),(15,'Staff',1,2,'2018-05-01',4,'2018-05-01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
