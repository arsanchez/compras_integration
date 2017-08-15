/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.6.25 : Database - compras
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`compras` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `compras`;

/*Table structure for table `articulos` */

DROP TABLE IF EXISTS `articulos`;

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `marca` varchar(12) NOT NULL,
  `id_medida` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_MEDIDA` (`id_medida`),
  CONSTRAINT `FK_MEDIDA` FOREIGN KEY (`id_medida`) REFERENCES `medidas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `articulos` */

insert  into `articulos`(`id`,`desc`,`marca`,`id_medida`,`existencia`,`status`) values (1,'Articulo 1','TOSHIBA',1,12,1);

/*Table structure for table `cms_apicustom` */

DROP TABLE IF EXISTS `cms_apicustom`;

CREATE TABLE `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apicustom` */

/*Table structure for table `cms_apikey` */

DROP TABLE IF EXISTS `cms_apikey`;

CREATE TABLE `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apikey` */

/*Table structure for table `cms_dashboard` */

DROP TABLE IF EXISTS `cms_dashboard`;

CREATE TABLE `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_dashboard` */

/*Table structure for table `cms_email_queues` */

DROP TABLE IF EXISTS `cms_email_queues`;

CREATE TABLE `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_queues` */

/*Table structure for table `cms_email_templates` */

DROP TABLE IF EXISTS `cms_email_templates`;

CREATE TABLE `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_templates` */

insert  into `cms_email_templates`(`id`,`name`,`slug`,`subject`,`content`,`description`,`from_name`,`from_email`,`cc_email`,`created_at`,`updated_at`) values (1,'Email Template Forgot Password Backend','forgot_password_backend',NULL,'<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>','[password]','System','system@crudbooster.com',NULL,'2017-06-30 13:53:12',NULL);

/*Table structure for table `cms_logs` */

DROP TABLE IF EXISTS `cms_logs`;

CREATE TABLE `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_logs` */

insert  into `cms_logs`(`id`,`ipaddress`,`useragent`,`url`,`description`,`id_cms_users`,`created_at`,`updated_at`) values (1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36','http://127.0.0.1:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1',1,'2017-06-30 13:54:29',NULL),(2,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36','http://127.0.0.1:8000/admin/departamentos/add-save','Add New Data 1 at Departamentos',1,'2017-06-30 14:02:47',NULL),(3,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1',1,'2017-07-04 23:10:39',NULL),(4,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1',1,'2017-07-06 13:49:38',NULL),(5,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/users/edit-save/1','Update data Argenis Sánchez at Users',1,'2017-07-06 13:50:21',NULL),(6,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','argenisphp@gmail.com logout',1,'2017-07-06 13:50:28',NULL),(7,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 13:50:31',NULL),(8,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','argenisphp@gmail.com logout',1,'2017-07-06 13:52:30',NULL),(9,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 13:52:45',NULL),(10,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout',' logout',NULL,'2017-07-06 14:02:03',NULL),(11,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 14:02:46',NULL),(12,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/departamentos/edit-save/1','Update data  at Departamentos',1,'2017-07-06 14:06:42',NULL),(13,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/add-save','Add New Data 1 at Unidades de medida',1,'2017-07-06 14:09:44',NULL),(14,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/departamentos/edit-save/1','Update data  at Departamentos',1,'2017-07-06 14:10:59',NULL),(15,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/proveedores/add-save','Add New Data 1 at Proveedores',1,'2017-07-06 14:22:10',NULL),(16,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/articulos/add-save','Add New Data 1 at Articulos',1,'2017-07-06 14:30:07',NULL),(17,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/statistic_builder/add-save','Add New Data Productos en existencia at Statistic Builder',1,'2017-07-06 14:32:47',NULL),(18,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/menu_management/add-save','Add New Data Existencia at Menu Management',1,'2017-07-06 14:43:34',NULL),(19,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/statistic_builder/add-save','Add New Data Test stats at Statistic Builder',1,'2017-07-06 14:49:37',NULL),(20,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 15:09:33',NULL),(21,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 15:15:40',NULL),(22,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 17:50:17',NULL),(23,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/articulos/delete/1','Delete data 1 at Articulos',1,'2017-07-06 17:50:24',NULL),(24,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/articulos/add-save','Add New Data 1 at Articulos',1,'2017-07-06 17:51:39',NULL),(25,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 17:51:49',NULL),(26,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 17:55:44',NULL),(27,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 18:00:45',NULL),(28,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 18:01:17',NULL),(29,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 18:06:34',NULL),(30,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 18:07:18',NULL),(31,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/1','Delete data 1 at Unidades de medida',1,'2017-07-06 18:07:39',NULL),(32,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/add-save','Add New Data 2 at Unidades de medida',1,'2017-07-06 18:07:51',NULL),(33,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/medidas/delete/2','Delete data 2 at Unidades de medida',1,'2017-07-06 18:07:55',NULL),(34,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/compras/add-save','Add New Data 1 at Ordenes de compra',1,'2017-07-06 18:21:55',NULL),(35,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/compras/add-save','Add New Data 2 at Ordenes de compra',1,'2017-07-06 18:33:10',NULL),(36,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','argenisphp@gmail.com logout',1,'2017-07-06 21:10:44',NULL),(37,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 21:12:33',NULL),(38,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/test/add-save','Add New Data 1 at test',1,'2017-07-06 21:16:21',NULL),(39,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/test/edit-save/1','Update data  at test',1,'2017-07-06 21:16:27',NULL),(40,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/module_generator/delete/17','Delete data test at Module Generator',1,'2017-07-06 21:19:21',NULL),(41,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','argenisphp@gmail.com logout',1,'2017-07-06 21:54:24',NULL),(42,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-07-06 21:54:33',NULL),(43,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/compras/add-save','Add New Data 1 at Ordenes de compra',1,'2017-07-06 22:03:32',NULL),(44,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data Admin at Users',1,'2017-07-06 22:06:39',NULL),(45,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','argenisphp@gmail.com logout',1,'2017-07-06 22:06:47',NULL),(46,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','admin@mail.com login with IP Address 127.0.0.1',2,'2017-07-06 22:06:55',NULL),(47,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/logout','admin@mail.com logout',2,'2017-07-06 22:30:35',NULL),(48,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','admin@mail.com login with IP Address 127.0.0.1',2,'2017-07-06 22:31:14',NULL),(49,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/compras/add-save','Add New Data 2 at Ordenes de compra',2,'2017-07-06 22:32:25',NULL),(50,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36','http://localhost:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-08-03 22:32:01',NULL),(51,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36','http://127.0.0.1:8000/admin/login','argenisphp@gmail.com login with IP Address 127.0.0.1',1,'2017-08-15 03:44:02',NULL);

/*Table structure for table `cms_menus` */

DROP TABLE IF EXISTS `cms_menus`;

CREATE TABLE `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_menus` */

insert  into `cms_menus`(`id`,`name`,`type`,`path`,`color`,`icon`,`parent_id`,`is_active`,`is_dashboard`,`id_cms_privileges`,`sorting`,`created_at`,`updated_at`) values (1,'Departamentos','Route','AdminDepartamentosControllerGetIndex',NULL,'fa fa-desktop',0,1,0,1,1,'2017-06-30 13:58:31',NULL),(2,'Unidades de medida','Route','AdminMedidasControllerGetIndex',NULL,'fa fa-tachometer',0,1,0,1,2,'2017-07-04 23:14:17',NULL),(3,'Proveedores','Route','AdminProveedoresControllerGetIndex',NULL,'fa fa-truck',0,1,0,1,3,'2017-07-06 14:18:16',NULL),(4,'Articulos','Route','AdminArticulosControllerGetIndex',NULL,'fa fa-shopping-bag',0,1,0,1,4,'2017-07-06 14:26:01',NULL),(5,'Existencia','Statistic','statistic_builder/show/productos-en-existencia','normal','fa fa-pie-chart',0,1,1,1,NULL,'2017-07-06 14:43:34',NULL),(6,'Ordenes de compra','Route','AdminComprasControllerGetIndex',NULL,'fa fa-th-list',0,1,0,1,5,'2017-07-06 14:59:05',NULL),(7,'Articulos','Route','AdminArticulosControllerGetIndex','normal','fa fa-shopping-bag',0,1,0,2,1,'2017-07-06 22:06:00',NULL),(8,'Departamentos','Route','AdminDepartamentosControllerGetIndex','normal','fa fa-desktop',0,1,0,2,2,'2017-07-06 22:06:00',NULL),(9,'Ordenes de compra','Route','AdminComprasControllerGetIndex','normal','fa fa-th-list',0,1,0,2,3,'2017-07-06 22:06:00',NULL),(10,'Proveedores','Route','AdminProveedoresControllerGetIndex','normal','fa fa-truck',0,1,0,2,4,'2017-07-06 22:06:00',NULL),(11,'Unidades de medida','Route','AdminMedidasControllerGetIndex','normal','fa fa-tachometer',0,1,0,2,5,'2017-07-06 22:06:00',NULL);

/*Table structure for table `cms_moduls` */

DROP TABLE IF EXISTS `cms_moduls`;

CREATE TABLE `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_moduls` */

insert  into `cms_moduls`(`id`,`name`,`icon`,`path`,`table_name`,`controller`,`is_protected`,`is_active`,`created_at`,`updated_at`) values (1,'Notifications','fa fa-cog','notifications','cms_notifications','NotificationsController',1,1,'2017-06-30 13:53:12',NULL),(2,'Privileges','fa fa-cog','privileges','cms_privileges','PrivilegesController',1,1,'2017-06-30 13:53:12',NULL),(3,'Privileges Roles','fa fa-cog','privileges_roles','cms_privileges_roles','PrivilegesRolesController',1,1,'2017-06-30 13:53:12',NULL),(4,'Users','fa fa-users','users','cms_users','AdminCmsUsersController',0,1,'2017-06-30 13:53:12',NULL),(5,'Settings','fa fa-cog','settings','cms_settings','SettingsController',1,1,'2017-06-30 13:53:12',NULL),(6,'Module Generator','fa fa-database','module_generator','cms_moduls','ModulsController',1,1,'2017-06-30 13:53:12',NULL),(7,'Menu Management','fa fa-bars','menu_management','cms_menus','MenusController',1,1,'2017-06-30 13:53:12',NULL),(8,'Email Template','fa fa-envelope-o','email_templates','cms_email_templates','EmailTemplatesController',1,1,'2017-06-30 13:53:12',NULL),(9,'Statistic Builder','fa fa-dashboard','statistic_builder','cms_statistics','StatisticBuilderController',1,1,'2017-06-30 13:53:12',NULL),(10,'API Generator','fa fa-cloud-download','api_generator','','ApiCustomController',1,1,'2017-06-30 13:53:12',NULL),(11,'Logs','fa fa-flag-o','logs','cms_logs','LogsController',1,1,'2017-06-30 13:53:12',NULL),(12,'Departamentos','fa fa-desktop','departamentos','departamentos','AdminDepartamentosController',0,0,'2017-06-30 13:58:31',NULL),(13,'Unidades de medida','fa fa-tachometer','medidas','medidas','AdminMedidasController',0,0,'2017-07-04 23:14:17',NULL),(14,'Proveedores','fa fa-truck','proveedores','proveedores','AdminProveedoresController',0,0,'2017-07-06 14:18:16',NULL),(15,'Articulos','fa fa-shopping-bag','articulos','articulos','AdminArticulosController',0,0,'2017-07-06 14:26:01',NULL),(16,'Ordenes de compra','fa fa-th-list','compras','compras','AdminComprasController',0,0,'2017-07-06 14:59:05',NULL);

/*Table structure for table `cms_notifications` */

DROP TABLE IF EXISTS `cms_notifications`;

CREATE TABLE `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_notifications` */

/*Table structure for table `cms_privileges` */

DROP TABLE IF EXISTS `cms_privileges`;

CREATE TABLE `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges` */

insert  into `cms_privileges`(`id`,`name`,`is_superadmin`,`theme_color`,`created_at`,`updated_at`) values (1,'Super Administrator',1,'skin-red','2017-06-30 13:53:12',NULL),(2,'Admin',0,'skin-purple',NULL,NULL);

/*Table structure for table `cms_privileges_roles` */

DROP TABLE IF EXISTS `cms_privileges_roles`;

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges_roles` */

insert  into `cms_privileges_roles`(`id`,`is_visible`,`is_create`,`is_read`,`is_edit`,`is_delete`,`id_cms_privileges`,`id_cms_moduls`,`created_at`,`updated_at`) values (1,1,0,0,0,0,1,1,'2017-06-30 13:53:12',NULL),(2,1,1,1,1,1,1,2,'2017-06-30 13:53:12',NULL),(3,0,1,1,1,1,1,3,'2017-06-30 13:53:12',NULL),(4,1,1,1,1,1,1,4,'2017-06-30 13:53:12',NULL),(5,1,1,1,1,1,1,5,'2017-06-30 13:53:12',NULL),(6,1,1,1,1,1,1,6,'2017-06-30 13:53:12',NULL),(7,1,1,1,1,1,1,7,'2017-06-30 13:53:12',NULL),(8,1,1,1,1,1,1,8,'2017-06-30 13:53:12',NULL),(9,1,1,1,1,1,1,9,'2017-06-30 13:53:12',NULL),(10,1,1,1,1,1,1,10,'2017-06-30 13:53:12',NULL),(11,1,0,1,0,1,1,11,'2017-06-30 13:53:12',NULL),(12,1,1,1,1,1,1,12,NULL,NULL),(13,1,1,1,1,1,1,13,NULL,NULL),(14,1,1,1,1,1,1,14,NULL,NULL),(15,1,1,1,1,1,1,15,NULL,NULL),(16,1,1,1,1,1,1,16,NULL,NULL),(17,1,1,1,1,1,1,17,NULL,NULL),(18,1,1,1,1,0,2,15,NULL,NULL),(19,1,1,1,1,0,2,12,NULL,NULL),(20,1,1,1,1,0,2,16,NULL,NULL),(21,1,1,1,1,0,2,14,NULL,NULL),(22,1,1,1,1,0,2,13,NULL,NULL);

/*Table structure for table `cms_settings` */

DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_settings` */

insert  into `cms_settings`(`id`,`name`,`content`,`content_input_type`,`dataenum`,`helper`,`created_at`,`updated_at`,`group_setting`,`label`) values (1,'login_background_color',NULL,'text',NULL,'Input hexacode','2017-06-30 13:53:12',NULL,'Login Register Style','Login Background Color'),(2,'login_font_color',NULL,'text',NULL,'Input hexacode','2017-06-30 13:53:12',NULL,'Login Register Style','Login Font Color'),(3,'login_background_image',NULL,'upload_image',NULL,NULL,'2017-06-30 13:53:12',NULL,'Login Register Style','Login Background Image'),(4,'email_sender','support@crudbooster.com','text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Email Setting','Email Sender'),(5,'smtp_driver','mail','select','smtp,mail,sendmail',NULL,'2017-06-30 13:53:12',NULL,'Email Setting','Mail Driver'),(6,'smtp_host','','text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Email Setting','SMTP Host'),(7,'smtp_port','25','text',NULL,'default 25','2017-06-30 13:53:12',NULL,'Email Setting','SMTP Port'),(8,'smtp_username','','text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Email Setting','SMTP Username'),(9,'smtp_password','','text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Email Setting','SMTP Password'),(10,'appname','Manejador de compras','text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Application Setting','Application Name'),(11,'default_paper_size','Legal','text',NULL,'Paper size, ex : A4, Legal, etc','2017-06-30 13:53:12',NULL,'Application Setting','Default Paper Print Size'),(12,'logo','uploads/2017-07/e62ba4ece7ec0bd252a1b20a609ec14e.png','upload_image',NULL,NULL,'2017-06-30 13:53:12',NULL,'Application Setting','Logo'),(13,'favicon',NULL,'upload_image',NULL,NULL,'2017-06-30 13:53:12',NULL,'Application Setting','Favicon'),(14,'api_debug_mode','true','select','true,false',NULL,'2017-06-30 13:53:12',NULL,'Application Setting','API Debug Mode'),(15,'google_api_key',NULL,'text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Application Setting','Google API Key'),(16,'google_fcm_key',NULL,'text',NULL,NULL,'2017-06-30 13:53:12',NULL,'Application Setting','Google FCM Key');

/*Table structure for table `cms_statistic_components` */

DROP TABLE IF EXISTS `cms_statistic_components`;

CREATE TABLE `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistic_components` */

insert  into `cms_statistic_components`(`id`,`id_cms_statistics`,`componentID`,`component_name`,`area_name`,`sorting`,`name`,`config`,`created_at`,`updated_at`) values (1,1,'5c4bccef2da0d88179780a4b027261c4','smallbox','area1',0,NULL,'{\"name\":\"Articulos en existencia\",\"icon\":\"ion-clipboard\",\"color\":\"bg-green\",\"link\":\"#\",\"sql\":\"SELECT COUNT(*) FROM `articulos`\"}','2017-07-06 14:33:07',NULL);

/*Table structure for table `cms_statistics` */

DROP TABLE IF EXISTS `cms_statistics`;

CREATE TABLE `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistics` */

insert  into `cms_statistics`(`id`,`name`,`slug`,`created_at`,`updated_at`) values (1,'Productos en existencia','productos-en-existencia','2017-07-06 14:32:47',NULL),(2,'Test stats','test-stats','2017-07-06 14:49:37',NULL);

/*Table structure for table `cms_users` */

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_users` */

insert  into `cms_users`(`id`,`name`,`photo`,`email`,`password`,`id_cms_privileges`,`created_at`,`updated_at`,`status`) values (1,'Argenis Sánchez','uploads/2017-07/777402-cool-star-wars-wallpaper.jpg','argenisphp@gmail.com','$2y$10$6gIdDlME4e8Yxsc/.Gd6guURTF/scyOxhzYyZkcISDTIVCK5rgMue',1,'2017-06-30 13:53:12','2017-07-06 13:50:21','Active'),(2,'Admin','uploads/2017-07/xbqm5o.jpg','admin@mail.com','$2y$10$9q163FwHstxLi7aAV7FslulNvbLlQ4kRmq2gP2UGCxPBSJb6TxIqK',2,'2017-07-06 22:06:39',NULL,NULL);

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `id_articulo` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo_unidad` double(11,2) NOT NULL,
  `total` double(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ARTICULO` (`id_articulo`),
  KEY `FK_DEPARTAMENTO` (`id_departamento`),
  CONSTRAINT `FK_ARTICULO` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id`),
  CONSTRAINT `FK_DEPARTAMENTO` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `compras` */

insert  into `compras`(`id`,`fecha`,`status`,`id_articulo`,`id_departamento`,`cantidad`,`costo_unidad`,`total`) values (1,'2017-07-14',1,1,1,1,12.00,12.00),(2,'2017-06-30',1,1,1,12,82.00,984.00),(3,'2017-08-01',0,1,1,12,100.00,1200.00);

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`nombre`,`estado`) values (1,'Test department',1);

/*Table structure for table `medidas` */

DROP TABLE IF EXISTS `medidas`;

CREATE TABLE `medidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `medidas` */

insert  into `medidas`(`id`,`desc`,`status`) values (1,'LB(Libras)',1);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2016_08_07_145904_add_table_cms_apicustom',1),(2,'2016_08_07_150834_add_table_cms_dashboard',1),(3,'2016_08_07_151210_add_table_cms_logs',1),(4,'2016_08_07_152014_add_table_cms_privileges',1),(5,'2016_08_07_152214_add_table_cms_privileges_roles',1),(6,'2016_08_07_152320_add_table_cms_settings',1),(7,'2016_08_07_152421_add_table_cms_users',1),(8,'2016_08_07_154624_add_table_cms_moduls',1),(9,'2016_08_17_225409_add_status_cms_users',1),(10,'2016_08_20_125418_add_table_cms_notifications',1),(11,'2016_09_04_033706_add_table_cms_email_queues',1),(12,'2016_09_16_035347_add_group_setting',1),(13,'2016_09_16_045425_add_label_setting',1),(14,'2016_09_17_104728_create_nullable_cms_apicustom',1),(15,'2016_10_01_141740_add_method_type_apicustom',1),(16,'2016_10_01_141846_add_parameters_apicustom',1),(17,'2016_10_01_141934_add_responses_apicustom',1),(18,'2016_10_01_144826_add_table_apikey',1),(19,'2016_11_14_141657_create_cms_menus',1),(20,'2016_11_15_132350_create_cms_email_templates',1),(21,'2016_11_15_190410_create_cms_statistics',1),(22,'2016_11_17_102740_create_cms_statistic_components',1);

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificador` varchar(11) NOT NULL,
  `nombre_comercial` varchar(70) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

insert  into `proveedores`(`id`,`identificador`,`nombre_comercial`,`status`) values (1,'Proveedor1','402-181905-6',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
