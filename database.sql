-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.57 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ecommercedb
CREATE DATABASE IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecommercedb`;

-- Dumping structure for table ecommercedb.address_information
CREATE TABLE IF NOT EXISTS `address_information` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `add_address` varchar(255) DEFAULT NULL,
  `add_city` varchar(55) DEFAULT NULL,
  `add_zip` varchar(55) DEFAULT NULL,
  `add_state` varchar(255) DEFAULT NULL,
  `add_country` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`add_id`),
  KEY `address_information` (`cust_id`),
  CONSTRAINT `address_information_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer_information` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.address_information: ~4 rows (approximately)
/*!40000 ALTER TABLE `address_information` DISABLE KEYS */;
INSERT INTO `address_information` (`add_id`, `cust_id`, `add_address`, `add_city`, `add_zip`, `add_state`, `add_country`) VALUES
	(11, 1, '57-28-1/40', 'Visakhapatnam', 'India', 'Andhra Pradesh', '530007'),
	(12, 8, 'hinjawadi', 'Pune', '522566', 'Andhra Pradesh', 'India'),
	(13, 15, 'hinjawadi', 'Pune', 'India', 'Andhra Pradesh', '522566'),
	(14, 7, '1-60/30/241/136,Chinmayi Sree Mens PG,\r\nNear Delhi Wala Sweet House, Anjaiah Nagar, Gachibowli', 'HYDERABAD', '500032', 'Andhra Pradesh', 'India');
/*!40000 ALTER TABLE `address_information` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.contact_information
CREATE TABLE IF NOT EXISTS `contact_information` (
  `cont_id` int(11) NOT NULL AUTO_INCREMENT,
  `cont_fname` varchar(55) DEFAULT NULL,
  `cont_lname` varchar(55) DEFAULT NULL,
  `cont_email` varchar(55) DEFAULT NULL,
  `cont_subject` varchar(55) DEFAULT NULL,
  `cont_message` varchar(255) DEFAULT NULL,
  `cont_status` varchar(55) DEFAULT NULL,
  `cont_remarks` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`cont_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.contact_information: ~4 rows (approximately)
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
INSERT INTO `contact_information` (`cont_id`, `cont_fname`, `cont_lname`, `cont_email`, `cont_subject`, `cont_message`, `cont_status`, `cont_remarks`) VALUES
	(1, 'kishan', 'kumar', 'kishan@test.com', 'sbsdbsbsdg', 'akjbvajbajgbag', NULL, NULL),
	(2, 'aa', 'bb', 'aa@aa.com', 'hello', 'hello all', NULL, NULL),
	(3, 'Priya', 'Kolluru', 'priya@test.com', 'iodshv', 'edoahagvoihagv', NULL, NULL),
	(4, 'zjc', 'jvd', 'jfxn', 'jdv', 'jvd', NULL, NULL);
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.customer_information
CREATE TABLE IF NOT EXISTS `customer_information` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_fname` varchar(55) DEFAULT NULL,
  `cust_lname` varchar(55) DEFAULT NULL,
  `cust_dob` varchar(55) DEFAULT NULL,
  `cust_gender` varchar(10) DEFAULT NULL,
  `cust_email` varchar(55) DEFAULT NULL,
  `cust_contact` varchar(55) DEFAULT NULL,
  `cust_password` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.customer_information: ~5 rows (approximately)
/*!40000 ALTER TABLE `customer_information` DISABLE KEYS */;
INSERT INTO `customer_information` (`cust_id`, `cust_fname`, `cust_lname`, `cust_dob`, `cust_gender`, `cust_email`, `cust_contact`, `cust_password`) VALUES
	(1, 'Kishan', 'Kumar', NULL, 'Female', 'kishan@test.com', '7675868145', '12345'),
	(7, 'Kishan', 'Kumar', NULL, 'Male', 'k@gmail.com', '7675868145', '456789'),
	(8, 'Priya', 'Kolluru ', NULL, 'Female', 'priya@test.com', '7675868145', '12345'),
	(15, 'Dinesh', '', NULL, 'Male', 'din@test.com', '5446494944', 'din'),
	(21, 'Priya', 'Kolluru ', NULL, NULL, 'priyakolluru8@gmail.com', NULL, '999999');
/*!40000 ALTER TABLE `customer_information` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.product_description
CREATE TABLE IF NOT EXISTS `product_description` (
  `descp_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `descp_1_title` varchar(50) DEFAULT NULL,
  `descp_1_content` varchar(500) DEFAULT NULL,
  `descp_2_title` varchar(50) DEFAULT NULL,
  `descp_2_content` varchar(500) DEFAULT NULL,
  `descp_3_title` varchar(50) DEFAULT NULL,
  `descp_3_content` varchar(500) DEFAULT NULL,
  `descp_4_title` varchar(50) DEFAULT NULL,
  `descp_4_content` varchar(500) DEFAULT NULL,
  `descp_5_title` varchar(50) DEFAULT NULL,
  `descp_5_content` varchar(500) DEFAULT NULL,
  `descp_6_title` varchar(50) DEFAULT NULL,
  `descp_6_content` varchar(500) DEFAULT NULL,
  `descp_7_title` varchar(50) DEFAULT NULL,
  `descp_7_content` varchar(500) DEFAULT NULL,
  `descp_8_title` varchar(50) DEFAULT NULL,
  `descp_8_content` varchar(500) DEFAULT NULL,
  `descp_9_title` varchar(50) DEFAULT NULL,
  `descp_9_content` varchar(500) DEFAULT NULL,
  `descp_10_title` varchar(50) DEFAULT NULL,
  `descp_10_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`descp_id`),
  KEY `fkey1` (`pro_id`),
  CONSTRAINT `fkey1` FOREIGN KEY (`pro_id`) REFERENCES `product_information` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.product_description: ~5 rows (approximately)
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` (`descp_id`, `pro_id`, `descp_1_title`, `descp_1_content`, `descp_2_title`, `descp_2_content`, `descp_3_title`, `descp_3_content`, `descp_4_title`, `descp_4_content`, `descp_5_title`, `descp_5_content`, `descp_6_title`, `descp_6_content`, `descp_7_title`, `descp_7_content`, `descp_8_title`, `descp_8_content`, `descp_9_title`, `descp_9_content`, `descp_10_title`, `descp_10_content`) VALUES
	(2, 110, 'jkbjkb', 'ujbuj', 'buj', 'biuib', 'uib', 'buib', 'bui', 'gu', 'ig', 'iugi', 'ug', 'ug', 'iug', 'gu', 'g', 'iug', 'uig', 'guigu', 'gu', 'giuug'),
	(3, 113, 'bdvzb', 'uib', 'ub', 'iugyig', 'ygy', 'gyug', 'yu', 'gy', 'gugyguyug', 'uyg', 'kjbb', 'ygyg', 'yug', 'yvy', 'yvygv', 'ygy', 'gyg', 'yugy', 'iugiug', 'igg'),
	(4, 114, 'hjbbiu', 'buiiub', 'uybuyb', 'bubu', 'buybuyb', 'uybuyb', 'ubuybuy', 'uybbuyb', 'uybubyuy', 'byubyyu', 'byuyy', 'ubuybyyu', 'yuyuv', 'uvyuhy', 'yuuyyu', 'uyyuy', 'yuyubyu', 'yuyuyu', 'yuyu', 'vyuyuv'),
	(5, 115, 'iuhuib', 'ubub', 'uyb', 'uybub', 'yyuby', 'ub', 'uyb', 'yub', 'yub', 'yu', 'buyb', 'yub', 'yu', 'byub', 'yub', 'u', 'b', 'uyb', 'yub', 'uyb'),
	(6, 116, 'hgvujv', 'vu', 'vv', 'vv', 'jkb', 'vyu', 'uy', 'uyuy', 'yuvuyg', 'uyvy', 'uvuv', 'uvy', 'uy', 'vuv', 'yv', 'uy', 'gy', 'gyu', 'ygu', 'y');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.product_information
CREATE TABLE IF NOT EXISTS `product_information` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `ven_id` int(11) DEFAULT NULL,
  `prod_name` varchar(55) DEFAULT NULL,
  `prod_price` varchar(10) DEFAULT NULL,
  `prod_quantity` varchar(10) DEFAULT NULL,
  `prod_category` varchar(55) DEFAULT NULL,
  `prod_sub_category` varchar(55) DEFAULT NULL,
  `prod_desc` varchar(500) DEFAULT NULL,
  `prod_img1` varchar(55) DEFAULT NULL,
  `prod_img2` varchar(55) DEFAULT NULL,
  `prod_img3` varchar(55) DEFAULT NULL,
  `prod_img4` varchar(55) DEFAULT NULL,
  `prod_img5` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `ven_id` (`ven_id`),
  CONSTRAINT `product_information_ibfk_1` FOREIGN KEY (`ven_id`) REFERENCES `vendor_information` (`ven_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.product_information: ~5 rows (approximately)
/*!40000 ALTER TABLE `product_information` DISABLE KEYS */;
INSERT INTO `product_information` (`prod_id`, `ven_id`, `prod_name`, `prod_price`, `prod_quantity`, `prod_category`, `prod_sub_category`, `prod_desc`, `prod_img1`, `prod_img2`, `prod_img3`, `prod_img4`, `prod_img5`) VALUES
	(110, 1, 'Razer', '35000', '1', 'Electronics', 'Mobiles', 'Gaming phone', '', '', 'v1razer350003.jpg', '', ''),
	(113, 1, 'Oneplus 6T', '39999', '3', 'Electronics', 'Mobiles', 'This is a leaked product', '', 'v1Oneplus 6T399992.jpg', '', '', ''),
	(114, 1, 'Asus Rog Phone', '59000', '2', 'Electronics', 'Mobiles', 'gaming phone', '', '', '', 'v1Asus Rog Phone590004.jpg', ''),
	(115, 1, 'Red Smartphone', '70000', '1', 'Electronics', 'Mobiles', 'Camera Smartphone', '', '', '', '', 'v1Red Smartphone700005.png'),
	(116, 1, 'Samsung Galaxy Note 9', '67000', '1', 'Electronics', 'Gaming Accessories', 'Note series', '', '', 'v1Samsung Galaxy Note 9650003.jpg', '', '');
/*!40000 ALTER TABLE `product_information` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.product_specification
CREATE TABLE IF NOT EXISTS `product_specification` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `spec_in_the_box` varchar(50) DEFAULT NULL,
  `spec_model_number` varchar(50) DEFAULT NULL,
  `spec_model_name` varchar(50) DEFAULT NULL,
  `spec_color` varchar(50) DEFAULT NULL,
  `spec_browse_type` varchar(50) DEFAULT NULL,
  `spec_sim_type` varchar(50) DEFAULT NULL,
  `spec_touch_screen` varchar(50) DEFAULT NULL,
  `spec_display_size` varchar(50) DEFAULT NULL,
  `spec_resolution` varchar(50) DEFAULT NULL,
  `spec_resolution_type` varchar(50) DEFAULT NULL,
  `spec_display_type` varchar(50) DEFAULT NULL,
  `spec_display_colors` varchar(50) DEFAULT NULL,
  `spec_operating_system` varchar(50) DEFAULT NULL,
  `spec_processor_type` varchar(50) DEFAULT NULL,
  `spec_processor_core` varchar(50) DEFAULT NULL,
  `spec_primary_clockspeed` varchar(50) DEFAULT NULL,
  `spec_secondary_clockspeed` varchar(50) DEFAULT NULL,
  `spec_operating_frequency` varchar(50) DEFAULT NULL,
  `spec_internal_storage` varchar(50) DEFAULT NULL,
  `spec_ram` varchar(50) DEFAULT NULL,
  `spec_expandable_storage` varchar(50) DEFAULT NULL,
  `spec_supported_memorycardtype` varchar(50) DEFAULT NULL,
  `spec_calllog_memory` varchar(50) DEFAULT NULL,
  `spec_primarycamera_available` varchar(50) DEFAULT NULL,
  `spec_primarycamera` varchar(50) DEFAULT NULL,
  `spec_primarycamera_features` varchar(50) DEFAULT NULL,
  `spec_secondarycamera_available` varchar(50) DEFAULT NULL,
  `spec_secondarycamera` varchar(50) DEFAULT NULL,
  `spec_secondarycamera_features` varchar(50) DEFAULT NULL,
  `spec_flash` varchar(50) DEFAULT NULL,
  `spec_hdrecording` varchar(50) DEFAULT NULL,
  `spec_full_hdrecording` varchar(50) DEFAULT NULL,
  `spec_video_recording` varchar(50) DEFAULT NULL,
  `spec_videorecording_resolution` varchar(50) DEFAULT NULL,
  `spec_frame_rate` varchar(50) DEFAULT NULL,
  `spec_phonebook` varchar(50) DEFAULT NULL,
  `spec_network_type` varchar(50) DEFAULT NULL,
  `spec_supported_networks` varchar(50) DEFAULT NULL,
  `spec_internet_connectivity` varchar(50) DEFAULT NULL,
  `spec_3g` varchar(50) DEFAULT NULL,
  `spec_gprs` varchar(50) DEFAULT NULL,
  `spec_preinstalled_browser` varchar(50) DEFAULT NULL,
  `spec_bluetooth_support` varchar(50) DEFAULT NULL,
  `spec_bluetooth_version` varchar(50) DEFAULT NULL,
  `spec_wifi` varchar(50) DEFAULT NULL,
  `spec_wifi_version` varchar(50) DEFAULT NULL,
  `spec_nfc` varchar(50) DEFAULT NULL,
  `spec_usb_connectivity` varchar(50) DEFAULT NULL,
  `spec_audio_jack` varchar(50) DEFAULT NULL,
  `spec_smart_phone` varchar(50) DEFAULT NULL,
  `spec_sim_size` varchar(50) DEFAULT NULL,
  `spec_removable_battery` varchar(50) DEFAULT NULL,
  `spec_sms` varchar(50) DEFAULT NULL,
  `spec_sensors` varchar(50) DEFAULT NULL,
  `spec_other_features` varchar(50) DEFAULT NULL,
  `spec_important_apps` varchar(50) DEFAULT NULL,
  `spec_audio_formats` varchar(50) DEFAULT NULL,
  `sped_video_formats` varchar(50) DEFAULT NULL,
  `spec_battery_capacity` varchar(50) DEFAULT NULL,
  `spec_battery_type` varchar(50) DEFAULT NULL,
  `spec_width` varchar(50) DEFAULT NULL,
  `spec_height` varchar(50) DEFAULT NULL,
  `spec_depth` varchar(50) DEFAULT NULL,
  `spec_weight` varchar(50) DEFAULT NULL,
  `spec_warranty_summary` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `fkey` (`pro_id`),
  CONSTRAINT `fkey` FOREIGN KEY (`pro_id`) REFERENCES `product_information` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.product_specification: ~5 rows (approximately)
/*!40000 ALTER TABLE `product_specification` DISABLE KEYS */;
INSERT INTO `product_specification` (`spec_id`, `pro_id`, `spec_in_the_box`, `spec_model_number`, `spec_model_name`, `spec_color`, `spec_browse_type`, `spec_sim_type`, `spec_touch_screen`, `spec_display_size`, `spec_resolution`, `spec_resolution_type`, `spec_display_type`, `spec_display_colors`, `spec_operating_system`, `spec_processor_type`, `spec_processor_core`, `spec_primary_clockspeed`, `spec_secondary_clockspeed`, `spec_operating_frequency`, `spec_internal_storage`, `spec_ram`, `spec_expandable_storage`, `spec_supported_memorycardtype`, `spec_calllog_memory`, `spec_primarycamera_available`, `spec_primarycamera`, `spec_primarycamera_features`, `spec_secondarycamera_available`, `spec_secondarycamera`, `spec_secondarycamera_features`, `spec_flash`, `spec_hdrecording`, `spec_full_hdrecording`, `spec_video_recording`, `spec_videorecording_resolution`, `spec_frame_rate`, `spec_phonebook`, `spec_network_type`, `spec_supported_networks`, `spec_internet_connectivity`, `spec_3g`, `spec_gprs`, `spec_preinstalled_browser`, `spec_bluetooth_support`, `spec_bluetooth_version`, `spec_wifi`, `spec_wifi_version`, `spec_nfc`, `spec_usb_connectivity`, `spec_audio_jack`, `spec_smart_phone`, `spec_sim_size`, `spec_removable_battery`, `spec_sms`, `spec_sensors`, `spec_other_features`, `spec_important_apps`, `spec_audio_formats`, `sped_video_formats`, `spec_battery_capacity`, `spec_battery_type`, `spec_width`, `spec_height`, `spec_depth`, `spec_weight`, `spec_warranty_summary`) VALUES
	(3, 110, 'gu', 'uggu', 'giu', 'ugigui', 'hj ', 'ugug', 'ugi', 'g', '1080p', 'uigu', 'uiu', 'ui', 'viuyygg', 'g', 'gyigg', 'y', 'igg', 'ugugui', 'guigi', 'giu', 'guig', 'giuug', 'ug', 'guiigu', 'gu', 'ugi', 'igugu', 'igu', 'gugu', 'gu', 'iug', 'giug', 'iuugi', 'gu', 'ugiui', 'gug', 'ug', 'gu', 'ugu', 'gu', 'igugiu', 'uig', 'ugi', 'gug', 'uiuig', 'ug', 'giu', 'uig', 'igugu', 'gui', 'igu', 'guigu', 'gu', 'gui', 'iuggu', 'iug', 'ug', 'gugui', 'ugi', 'ug', 'uguig', 'giuu', 'gug', 'g', 'giugu'),
	(4, 113, 'uigyy', 'gyug', 'Oneplus 6T', 'Red', 'yug', 'y', 'gugyug', '6.4 inch', '1080p', 'gyuuyg', 'Amoled', '16M', 'g', 'guy', 'yu', 'g', 'yugy', 'ug', 'gyuyu', 'yy', 'ygu', 'yguyg', 'yg', 'gyuyg', 'y', 'yyuyg', 'yggy', 'yguygu', 'gugu', 'ygugy', 'gyuugy', 'gyuugy', 'ygu', 'ygu', 'gyu', 'gygyu', 'yg', 'gy', 'gyu', 'gy', 'uyygu', 'gy', 'gyg', 'ugy', 'gy', 'gyu', 'gy', 'gygyu', 'gy', 'ygy', 'gugyu', 'guy', 'gyuyg', 'yu', 'ygy', 'gyu', 'gyug', 'ygyu', 'gyu', 'gy', 'gyyug', 'gyu', 'gy', 'gy', 'gy'),
	(5, 114, 'uybyubu', 'uyyv', 'Rog phone', 'black and grey', 'jbi', 'uibiubu', 'buiubu', '6.0', '2160p', '4K', 'Amoled', '16M', 'buyy', 'uyg', 'uygy', 'uyvuy', 'uyguyguy', 'gyuguyy', 'uygyug', 'uyguy', 'yuguy', 'gyguguy', 'uygyu', 'uuy', 'gyugyu', 'guyy', 'ggyu', 'yguyggyugy', 'gyugy', 'yg', 'gygyu', 'yggyygu', 'gyu', 'gygyu', 'gy', 'gygy', 'uugy', 'yuyygu', 'gyu', 'gyygu', 'gyu', 'yggy', 'gyug', 'yug', 'gy', 'gygyu', 'gyg', 'gy', 'gyuyg', 'ygu', 'gygy', 'yug', 'gyu', 'gygy', 'gy', 'yg', 'guyguy', 'gyu', 'g', 'gygyu', 'guguy', 'ggyu', 'gy', 'gy', 'ugyu'),
	(6, 115, 'yu', 'bu', 'y', 'bu', 'hbuhy', 'bb', 'uy', 'bu', 'y', 'uby', 'bu', 'vyuvuu', 'uyuy', 'yuuy', 'v', 'yuvvyu', 'yvu', 'vyvyu', 'uvy', 'uvyvyu', 'vyu', 'yvuvyu', 'vuyvuv', 'uvuy', 'vuyvu', 'vuy', 'vuyy', 'vvyu', 'vuy', 'vyuv', 'uvyu', 'vyuvuy', 'vuy', 'vyu', 'vuvyu', 'vuy', 'vyu', 'vy', 'uvyu', 'vyu', 'yvu', 'vyu', 'vyu', 'vyu', 'uvy', 'vuyv', 'yu', 'uvv', 'uvu', 'vy', 'u', 'vu', 'v', 'uvuy', 'yuv', 'vyvyu', 'vyvy', 'vyu', 'vyvy', 'uvy', 'yv', 'uvyu', 'vy', 'vyu', 'vyu'),
	(7, 116, 'gy', 'gyg', 'Galaxy Note 9', 'Black', 'gyuyug', 'yu', 'vy', 'yygy', '2160p', 'vu', 'Super AMOLED', '16M', 'uvv', 'vu', 'v', 'vuuv', 'vyu', 'vuy', 'vyu', 'vyuvu', 'vuy', 'uyvuyv', 'u', 'u', 'vygy', 'yyugy', 'yuyu', 'yu', 'yug', 'gygy', 'v', 'v', 'vvj', 'v', 'v', 'vjh', 'vhjvh', 'hvj', 'vh', 'vhvhvhj', 'vhjvjh', 'vhj', 'vhjv', 'hjvjhhv', 'vhjjv', 'vh', 'vhjv', 'hjvhj', 'vhj', 'vhj', 'vhj', 'vhjvhj', 'vhj', 'jvh', 'vjh', 'vjh', 'vvh', 'vjh', 'vj', 'vjhvh', 'vh', 'jvhvh', 'vhj', 'vhj', 'vhjvhj');
/*!40000 ALTER TABLE `product_specification` ENABLE KEYS */;

-- Dumping structure for table ecommercedb.vendor_information
CREATE TABLE IF NOT EXISTS `vendor_information` (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT,
  `ven_fname` varchar(55) DEFAULT NULL,
  `ven_lname` varchar(55) DEFAULT NULL,
  `ven_dob` varchar(55) DEFAULT NULL,
  `ven_email` varchar(55) DEFAULT NULL,
  `ven_password` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ven_id`),
  UNIQUE KEY `ven_email` (`ven_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommercedb.vendor_information: ~2 rows (approximately)
/*!40000 ALTER TABLE `vendor_information` DISABLE KEYS */;
INSERT INTO `vendor_information` (`ven_id`, `ven_fname`, `ven_lname`, `ven_dob`, `ven_email`, `ven_password`) VALUES
	(1, 'kishan', 'kumar', '1997-03-30', 'kishan@test.com', '12345'),
	(2, 'priya', 'kolluru', '1997-04-19', 'priya@test.com', '4142');
/*!40000 ALTER TABLE `vendor_information` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
