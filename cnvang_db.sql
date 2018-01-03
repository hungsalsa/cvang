-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 09, 2016 at 10:07 AM
-- Server version: 5.5.31
-- PHP Version: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cnvang_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Pham', 'Duc Tai', 'Brainos', '0123456789', '0123456789', 'Me Tri - Tu Liem - Ha Noi', 'Me Tri - Tu Liem - Ha Noi', 'Ha Noi', '123456', 230, 3776),
(2, 2, 'admin', 'admin', 'ABC', 'ABC123', '', 'United States', 'United States', 'United States', '123456', 223, 3642),
(3, 3, 'anh', 'anh', '', '', '', 'hà nội', '', 'hà nội', '0000', 230, 3776),
(4, 4, 'ager', 'la', 'address1', 'address1', 'address1', 'address1', 'address1', 'USA', '5657', 218, 3415);

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(11, 6, 'test 8'),
(10, 6, 'test 7'),
(9, 6, 'test 6'),
(8, 6, 'test 5'),
(7, 6, 'test 4'),
(6, 6, 'test 3'),
(5, 6, 'test 2'),
(4, 6, 'test 1'),
(2, 6, 'No. of Cores'),
(1, 6, 'Description'),
(3, 6, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(6, 6, 'Processor'),
(5, 6, 'Motherboard'),
(4, 6, 'Technical'),
(3, 6, 'Memory');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(15, 'banner-buttom', 1),
(16, 'manufacture', 1),
(14, 'banner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=482 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(481, 16, '#', 'data/Banner/vantech.jpg'),
(480, 16, '#', 'data/Banner/logo9.jpg'),
(479, 16, '#', 'data/Banner/logo8.jpg'),
(143, 14, '#', 'data/banner/banner1.jpg'),
(144, 15, '#', 'data/banner/banner2.jpg'),
(477, 16, '#', 'data/Banner/logo6.jpg'),
(142, 14, '#', 'data/banner/banner1.1.jpg'),
(478, 16, '#', 'data/Banner/logo7.jpg'),
(476, 16, '#', 'data/Banner/Samsung.png'),
(474, 16, '#', 'data/Banner/144185510639.jpg_resize130x97.jpg'),
(475, 16, '#', 'data/Banner/144185515622.jpg_resize130x97.jpg'),
(473, 16, '#', 'data/Banner/144185478510.jpg_resize130x97.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(143, 6, 14, 'banner '),
(144, 6, 15, 'banner-bt'),
(142, 6, 14, 'banner '),
(481, 6, 16, 'logo'),
(480, 6, 16, 'logo'),
(479, 6, 16, 'logo'),
(478, 6, 16, 'logo'),
(477, 6, 16, 'logo'),
(476, 6, 16, 'logo'),
(475, 6, 16, 'logo'),
(474, 6, 16, 'logo'),
(473, 6, 16, 'logo');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(121, '', 0, 0, 1, 0, 1, '2016-04-19 09:34:48', '2016-04-19 09:34:48'),
(122, '', 121, 0, 1, 1, 1, '2016-04-19 09:35:57', '2016-05-26 10:30:55'),
(123, '', 121, 0, 1, 2, 1, '2016-04-19 09:36:57', '2016-05-26 10:45:20'),
(124, '', 121, 0, 1, 3, 1, '2016-04-19 09:37:33', '2016-04-30 20:50:51'),
(125, '', 121, 0, 1, 5, 1, '2016-04-19 09:38:04', '2016-05-26 10:45:09'),
(126, '', 121, 0, 1, 0, 1, '2016-04-19 09:38:35', '2016-05-26 10:44:37'),
(127, '', 121, 0, 1, 7, 1, '2016-04-19 09:38:50', '2016-04-30 20:52:55'),
(128, '', 121, 0, 1, 0, 1, '2016-04-19 09:39:10', '2016-05-26 10:11:33'),
(129, '', 121, 0, 1, 4, 1, '2016-04-19 09:39:31', '2016-04-30 20:51:15'),
(130, '', 121, 0, 1, 0, 1, '2016-04-19 09:39:56', '2016-04-23 10:25:32'),
(131, '', 121, 0, 1, 0, 1, '2016-04-19 09:40:19', '2016-04-23 10:24:47'),
(132, '', 121, 0, 1, 0, 1, '2016-04-19 09:40:36', '2016-06-14 18:06:23'),
(133, '', 121, 0, 1, 0, 1, '2016-04-19 09:40:57', '2016-05-26 10:44:50'),
(134, '', 121, 0, 1, 0, 1, '2016-04-19 09:41:17', '2016-04-23 10:23:17'),
(135, '', 121, 0, 1, 0, 1, '2016-04-19 09:41:37', '2016-04-23 10:24:03'),
(136, '', 0, 0, 1, 0, 1, '2016-04-19 09:42:49', '2016-04-23 10:39:40'),
(137, '', 136, 0, 1, 0, 1, '2016-04-19 09:43:28', '2016-04-23 10:41:05'),
(138, '', 136, 0, 1, 0, 1, '2016-04-19 09:43:50', '2016-04-23 10:40:55'),
(139, '', 136, 0, 1, 0, 1, '2016-04-19 09:44:09', '2016-04-23 10:40:23'),
(140, '', 136, 0, 1, 0, 1, '2016-04-19 09:44:31', '2016-04-23 10:39:03'),
(141, '', 136, 0, 1, 0, 1, '2016-04-19 09:44:54', '2016-04-23 10:39:55'),
(142, '', 136, 0, 1, 0, 1, '2016-04-19 09:45:12', '2016-04-23 10:42:23'),
(143, '', 136, 0, 1, 0, 1, '2016-04-19 09:45:38', '2016-05-26 10:44:16'),
(144, '', 136, 0, 1, 0, 1, '2016-04-19 09:45:56', '2016-04-23 10:41:42'),
(145, '', 136, 0, 1, 0, 1, '2016-04-19 09:46:12', '2016-04-23 10:41:31'),
(146, '', 136, 0, 1, 0, 1, '2016-04-19 09:46:28', '2016-04-23 10:42:07'),
(147, '', 0, 0, 1, 0, 1, '2016-04-19 09:46:44', '2016-04-23 10:18:49'),
(148, '', 147, 0, 1, 0, 1, '2016-04-19 09:47:06', '2016-04-23 10:21:22'),
(149, '', 147, 0, 1, 0, 1, '2016-04-19 09:47:35', '2016-04-23 10:19:38'),
(150, '', 147, 0, 1, 0, 1, '2016-04-19 09:47:58', '2016-04-23 10:19:16'),
(151, '', 0, 0, 1, 0, 1, '2016-04-19 09:48:15', '2016-04-23 10:27:13'),
(152, '', 151, 0, 1, 0, 1, '2016-04-19 09:48:37', '2016-04-23 10:31:14'),
(153, '', 151, 0, 1, 0, 1, '2016-04-19 09:49:47', '2016-04-23 10:31:33'),
(154, '', 151, 0, 1, 0, 1, '2016-04-19 09:50:06', '2016-04-23 10:27:54'),
(155, '', 151, 0, 1, 0, 1, '2016-04-19 09:55:39', '2016-04-23 10:32:46'),
(156, '', 0, 0, 1, 0, 1, '2016-04-19 09:55:53', '2016-04-23 10:33:35'),
(157, '', 156, 0, 1, 0, 1, '2016-04-19 09:56:31', '2016-04-23 10:34:35'),
(158, '', 156, 0, 1, 0, 1, '2016-04-19 09:56:46', '2016-05-25 15:20:41'),
(159, '', 0, 0, 1, 0, 1, '2016-04-19 09:57:01', '2016-04-23 10:42:55'),
(160, '', 0, 0, 1, 0, 1, '2016-04-19 09:57:15', '2016-04-23 10:38:34'),
(161, '', 0, 0, 1, 0, 1, '2016-04-19 09:57:28', '2016-04-23 10:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(121, 6, 'Camera quan sát', '', 'Camera quan sát', 'camera quan sát'),
(122, 6, 'Camera quan sát ICAM', '', '', 'Camera quan sat icam'),
(123, 6, 'Camera quan sát HIKVISION', '', 'Camera quan sát HIKVISION', 'Camera quan sát HIKVISION'),
(124, 6, 'Camera quan sát DAHUA', '', 'Camera quan sát DAHUA', 'Camera quan sát DAHUA'),
(125, 6, 'Camera quan sát  VANTECH', '', 'Camera quan sát  VANTECH', 'Camera quan sát  VANTECH'),
(126, 6, 'Camera quan sát  AVTECH', '', 'Camera quan sát  AVTECH', 'Camera quan sát  AVTECH'),
(127, 6, 'Camera quan sát SAMTECH', '', 'Camera quan sát SAMTECH', 'Camera quan sát SAMTECH'),
(128, 6, 'Camera quan sát GLTECH', '', 'Camera quan sát GLTECH', 'Camera quan sát GLTECH'),
(129, 6, 'Camera quan sát KCE', '', 'Camera quan sát KCE', 'Camera quan sát KCE'),
(130, 6, 'Camera quan sát KBVISION', '', 'Camera quan sát KBVISION', 'Camera quan sát KBVISION'),
(131, 6, 'Camera quan sát QUESTEK', '', 'Camera quan sát QUESTEK', 'Camera quan sát QUESTEK'),
(132, 6, 'Camera quan sát Wifi không dây', '', 'Camera wifi không dây', 'Camera quan sat khong day, camera wifi, camera wifi khong day'),
(133, 6, 'Camera ngụy trang', '', 'Camera ngụy trang', 'Camera ngụy trang'),
(134, 6, 'Camera quan sát chuyên dụng', '', 'Camera quan sát chuyên dụng', 'Camera quan sát chuyên dụng'),
(135, 6, 'Phụ kiện camera quan sát', '', 'Phụ kiện camera quan sát', 'Phụ kiện camera quan sát'),
(136, 6, 'Đầu Ghi Hình Camera', '', 'Đầu Ghi Hình Camera', 'Đầu Ghi Hình Camera'),
(137, 6, 'Đầu ghi hình ICAM', '', 'Đầu ghi hình ICAM', 'Đầu ghi hình ICAM'),
(138, 6, 'Đầu ghi hình HIKVISION', '', 'Đầu ghi hình HIKVISION', 'Đầu ghi hình HIKVISION'),
(139, 6, 'Đầu ghi hình DAHUA', '', 'Đầu ghi hình DAHUA', 'Đầu ghi hình DAHUA'),
(140, 6, 'Đầu ghi hình VANTECH', '', 'Đầu ghi hình VANTECH', 'Đầu ghi hình VANTECH'),
(141, 6, 'Đầu ghi hình AVTECH', '', 'Đầu ghi hình AVTECH', 'Đầu ghi hình AVTECH'),
(142, 6, 'Đầu ghi hình SAMTECH', '', 'Đầu ghi hình SAMTECH', 'Đầu ghi hình SAMTECH'),
(143, 6, 'Đầu ghi hình GLTECH', '', 'Đầu ghi hình GLTECH', 'Đầu ghi hình GLTECH'),
(144, 6, 'Đầu ghi hình KCE', '', 'Đầu ghi hình KCE', 'Đầu ghi hình KCE'),
(145, 6, 'Đầu ghi hình KBVISION', '', 'Đầu ghi hình KBVISION', 'Đầu ghi hình KBVISION'),
(146, 6, 'Đầu ghi hình QUESTEK', '', 'Đầu ghi hình QUESTEK', 'Đầu ghi hình QUESTEK'),
(147, 6, 'Báo Động Chống Trộm', '', 'Báo Động Chống Trộm', 'Báo Động Chống Trộm'),
(148, 6, 'Báo động SONIC SAFETY', '', 'Báo động SONIC SAFETY', 'Báo động SONIC SAFETY'),
(149, 6, 'Báo động KARASS', '', 'Báo động KARASS', 'Báo động KARASS'),
(150, 6, 'Báo động AMOS', '', 'Báo động AMOS', 'Báo động AMOS'),
(151, 6, 'Chuông Cửa Có Hình', '', 'Chuông Cửa Có Hình', 'Chuông Cửa Có Hình'),
(152, 6, 'Chuông hình COMMAX', '', 'Chuông hình COMMAX', 'Chuông hình COMMAX'),
(153, 6, 'Chuông hình ETE', '', 'Chuông hình ETE', 'Chuông hình ETE'),
(154, 6, 'Chuông hình AIPHONE', '', 'Chuông hình AIPHONE', 'Chuông hình AIPHONE'),
(155, 6, 'Chuông hình HYUNDAI', '', 'Chuông hình HYUNDAI', 'Chuông hình HYUNDAI'),
(156, 6, 'Kiểm Soát Vào Ra - Chấm Công', '', 'Kiểm Soát Vào Ra - Chấm Công', 'Kiểm Soát Vào Ra - Chấm Công'),
(157, 6, 'Máy Chấm Công RONALD JACK', '', 'Máy Chấm Công RONALD JACK', 'Máy Chấm Công RONALD JACK'),
(158, 6, 'Khóa cửa từ', '', 'Khóa cửa từ', 'Khóa cửa từ'),
(159, 6, 'Thiết Bị Nhà Thông Minh', '', 'Thiết Bị Nhà Thông Minh', 'Thiết Bị Nhà Thông Minh'),
(160, 6, 'Thiết Bị Mạng', '', 'Thiết Bị Mạng', 'Thiết Bị Mạng'),
(161, 6, 'Tivi Box Android', '', 'Tivi Box Android', 'Tivi Box Android');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(121, 121, 0),
(122, 121, 0),
(122, 122, 1),
(123, 121, 0),
(123, 123, 1),
(124, 121, 0),
(124, 124, 1),
(125, 121, 0),
(125, 125, 1),
(126, 121, 0),
(126, 126, 1),
(127, 121, 0),
(127, 127, 1),
(128, 121, 0),
(128, 128, 1),
(129, 121, 0),
(129, 129, 1),
(130, 121, 0),
(130, 130, 1),
(131, 121, 0),
(131, 131, 1),
(132, 121, 0),
(132, 132, 1),
(133, 121, 0),
(133, 133, 1),
(134, 121, 0),
(134, 134, 1),
(135, 121, 0),
(135, 135, 1),
(136, 136, 0),
(137, 136, 0),
(137, 137, 1),
(138, 136, 0),
(138, 138, 1),
(139, 136, 0),
(139, 139, 1),
(140, 136, 0),
(140, 140, 1),
(141, 136, 0),
(141, 141, 1),
(142, 136, 0),
(142, 142, 1),
(143, 136, 0),
(143, 143, 1),
(144, 136, 0),
(144, 144, 1),
(145, 136, 0),
(145, 145, 1),
(146, 136, 0),
(146, 146, 1),
(147, 147, 0),
(148, 148, 1),
(148, 147, 0),
(149, 149, 1),
(149, 147, 0),
(150, 150, 1),
(150, 147, 0),
(151, 151, 0),
(152, 152, 1),
(152, 151, 0),
(153, 153, 1),
(153, 151, 0),
(154, 154, 1),
(154, 151, 0),
(155, 155, 1),
(155, 151, 0),
(156, 156, 0),
(157, 157, 1),
(157, 156, 0),
(158, 158, 1),
(158, 156, 0),
(159, 159, 0),
(160, 160, 0),
(161, 161, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(240, 'Jersey', 'JE', 'JEY', '', 1, 1),
(241, 'Guernsey', 'GG', 'GGY', '', 1, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'VND', 'VND', '', 'đ', '', 1.00000000, 1, '2016-07-06 15:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Pham', 'Duc Tai', 'taip0422@gmail.com', '01672059552', '0123456', 'cf97bb2aef1a273758a3616e22707b1c963ee540', '270f99cc5', 'a:0:{}', 'a:0:{}', 1, 1, 1, '::1', 1, 1, '', '2014-01-27 23:28:55'),
(2, 0, 'admin', 'admin', 'admin@admin.com', '0123456789', '123456', 'aac12ef38dfd3af2bd025c8143bf3e7677ab1488', '789d98a74', 'a:0:{}', '', 1, 2, 1, '192.168.1.32', 1, 1, '', '2014-03-08 13:56:45'),
(3, 0, 'anh', 'anh', 'anh@gmail.com', '1234567890', '', '15a4dc930d4716235fb48b5d87549f9bae689ed7', '3e586efca', 'a:2:{s:4:"33::";i:1;s:4:"40::";i:1;}', 'a:7:{i:0;s:2:"42";i:1;s:2:"30";i:2;s:2:"36";i:3;s:2:"31";i:4;s:2:"34";i:5;s:2:"54";i:6;s:2:"53";}', 0, 3, 1, '::1', 1, 1, '', '2014-04-07 14:29:32'),
(4, 0, 'ager', 'la', 'admin@gmail.com', '4546577', '465765756', '1d39652dd62f8b4ade559948bb8ff81c0928e441', 'b067dc76c', 'a:2:{s:4:"53::";i:1;s:32:"30:YToxOntpOjIyNjtzOjI6IjE1Ijt9:";i:2002;}', 'a:2:{i:0;s:2:"42";i:1;s:2:"36";}', 1, 4, 1, '::1', 1, 1, '', '2014-05-06 16:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_field`
--

CREATE TABLE IF NOT EXISTS `oc_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 6, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2014-01-27 23:28:57'),
(2, 2, '192.168.1.32', '2014-03-08 13:56:47'),
(3, 3, '::1', '2014-04-07 14:29:33'),
(4, 4, '::1', '2014-05-06 16:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_customer_transaction`
--

INSERT INTO `oc_customer_transaction` (`customer_transaction_id`, `customer_id`, `order_id`, `description`, `amount`, `date_added`) VALUES
(1, 4, 0, '', 0.0000, '2014-05-06 16:08:12'),
(2, 4, 0, '2013 Artist Series dourney ', 900.0000, '2014-05-06 16:08:54'),
(3, 4, 0, '2013 Artist Series dourney ', 0.0000, '2014-05-06 16:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=471 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(419, 'module', 'slideshow'),
(428, 'module', 'pavverticalmenu'),
(429, 'module', 'themecontrol'),
(432, 'module', 'filter'),
(434, 'module', 'pavblog'),
(435, 'module', 'pavblogcategory'),
(436, 'module', 'pavblogcomment'),
(437, 'module', 'pavbloglatest'),
(439, 'module', 'pavcarousel'),
(441, 'module', 'pavsliderlayer'),
(442, 'module', 'pavmegamenu'),
(464, 'module', 'pavnewsletter'),
(445, 'module', 'pavproducts'),
(446, 'module', 'latest'),
(448, 'module', 'pavproductcarousel'),
(453, 'module', 'pavcustom'),
(466, 'module', 'zopim_live_chat'),
(467, 'module', 'special'),
(468, 'module', 'carousel'),
(469, 'module', 'visitor'),
(470, 'feed', 'google_sitemap');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(10, 1, 4),
(9, 1, 3),
(8, 1, 2),
(7, 1, 1),
(11, 1, 5),
(12, 1, 6),
(13, 2, 1),
(14, 2, 2),
(15, 2, 4),
(16, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(13, 6, 2, 'S'),
(12, 6, 1, '$600.00 - $3.000.00'),
(11, 6, 1, '$50.00 - $100.00'),
(7, 6, 1, '$0.00 - $50.00'),
(8, 6, 1, '$100.00 - $200.00'),
(9, 6, 1, '$200.00 - $400.00'),
(10, 6, 1, '$400.00 - $600.00'),
(14, 6, 2, 'M'),
(15, 6, 2, 'L'),
(16, 6, 2, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(2, 6, 'Filter by size'),
(1, 6, 'Filter by price');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1),
(7, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(7, 6, 'Khách hàng', '&lt;p&gt;Nội dung đang cập nhật&lt;/p&gt;\r\n'),
(5, 6, 'Terms &amp; Conditions', '&lt;p&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&lt;/p&gt;\r\n\r\n&lt;p&gt;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish.&lt;/p&gt;\r\n\r\n&lt;p&gt;In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&lt;/p&gt;\r\n'),
(6, 6, 'Bản giá tổng hợp', '&lt;p&gt;Xin quý khách gửi email tới: &lt;a href=&quot;mailto:kta@ktavietnam.vn&quot;&gt;kta@ktavietnam.vn&lt;/a&gt; để được nhận bảng giá tổng hợp.&lt;/p&gt;\r\n'),
(4, 6, 'Giới Thiệu', '&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:\r\n&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;GIỚI THIỆU VỀ CÔNG TY TNHH GOLDTECH&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:\r\n&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;Công Ty TNHH GOLDTECH&amp;nbsp;&amp;nbsp;là một trong những công ty hàng đầu Việt Nam chuyên nhập khẩu, cung cấp, thiết kế, lắp đặt và thi công&amp;nbsp;các hệ thống: Hệ thống camera quan sát, Hệ thống chống trộm, Hệ thống mạng LAN, &amp;nbsp;Hệ thống&amp;nbsp;nhà thông minh,&amp;nbsp;Giải pháp bãi đỗ xe thông minh. . . Trong đó thế mạnh đặc biệt của GOLDTECH &amp;nbsp;là lĩnh vực&amp;nbsp;Thiết bị giám sát an ninh và Lắp đặt hệ thống mạng LAN. Công Ty TNHH&amp;nbsp;GOLDTECH có thể cung cấp tất cả các&amp;nbsp;giải pháp, đáp ứng mọi bài toán tổng thể về các hệ thống An ninh, Giám sát mà khách hàng đặt ra.&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;Công Ty TNHH GOLDTECH được hình thành và phát triển bởi một đội ngũ kỹ sư nhiều kinh nghiệm và tâm huyết với nghề. Trải qua nhiều giai đoạn khó khăn đến nay công ty TNHH GOLDTECH đã hình thành một hệ thống các cửa hàng tại hai thành phố lớn là : Tp.Hà Nội và Tp.Hồ Chí Minh cùng với nhiều đại lý tại các tỉnh phía Bắc. Hướng tới tương lai sẽ thành lập các chi nhánh&amp;nbsp;phủ khắp 64 tỉnh thành phố trong cả nước.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp; Các cán bộ, nhân viên của công ty đều tốt nghiệp từ các trường đại từ các trường đại học uy tín ở Việt Nam như: Đại học Bách Khoa Hà Nội, Đại học Công nghiệp Hà Nội, Học viện Kỹ Thuật Quân Sự, Đại học Kinh tế Quốc Dân, …….&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Công Ty TNHH GOLDTECH&amp;nbsp; có đội ngũ kỹ sư và nhân viên có trình độ cao, có&amp;nbsp;nhiều năm kinh nghiệm thực tế, tận tình yêu nghề. Chúng tôi cam kết các sản phẩm do chúng tôi cung cấp đều được kiểm tra với qui trình nghiêm ngặt cùng với đội ngủ kỹ thuật &amp;amp; chăm sóc khách hàng được đào tạo bài bản chắc chắn sẽ làm hài lòng Quý khách hàng.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Trong quá trình phát triển chúng tôi luôn trân trọng và thấu hiểu giá trị của chữ &quot;&lt;strong&gt;Tín&lt;/strong&gt;&quot;. Vì vậy Công ty chúng tôi luôn lấy chất lượng dịch vụ và sự hài lòng của khách hàng làm mục tiêu và là tiêu chí hàng đầu của công ty chúng tôi&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:\r\n&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;Các dịch vụ mà chúng tôi mang lại cho khách hàng gồm:&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:\r\n&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;-Thiết kế, thi công hệ thống&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#006797&quot;&gt;Camera quan sát&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;với chất lượng và hậu mãi cũng như giá thành tốt nhất, mà quý khách hàng không thể có đối tác nào mang lại tốt hơn nữa.&amp;nbsp;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/span&gt;&lt;strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#006797&quot;&gt;lắp đặt hệ thống mạng LAN&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;hệ thống máy vi tính cho công ty với hệ thống hoặc động tốt, bảo mật, dể dàng chia sẻ.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế thi công hệ thống điện&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế thi công hệ thống chống trộm&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế thi công hệ thống nhà thông minh&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế thi công hệ thống bão đỗ xe thông minh&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;- Thiết kế thi công hệ thống kiểm soát vào ra và hệ thống máy chấm công&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Với mục tiêu trở thành một trong những nhà cung cấp các sản phầm &amp;amp; dịch vụ công nghệ hàng đầu tại Việt Nam. với tiêu chí: &quot;&amp;nbsp;&lt;strong&gt;UY TÍN- CHẤT LƯỢNG- TIN CẬY&lt;/strong&gt;&quot; làm nền tảng phát triển bền vững, công ty chúng tôi sẽ không ngừng phấn đấu mang lại quý khách hàng những dịch vụ hoàn hảo nhất.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;Chúng tôi luôn coi khách hàng như là những người trong gia đình, có nhu cầu được lắng nghe, chia sẻ, được đáp ứng, phục vụ một cách tốt nhất .Bởi vậy, chúng tôi luôn nỗ lực ở mức cao nhất để khách hàng luôn có được “&lt;strong&gt;lựa chọn tốt nhất&lt;/strong&gt;”. Đối với chúng tôi, sự hài lòng và tin cậy của Quý khách hàng chính là khởi nguồn cho sự thịnh vượng và phát triển bền vững!&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;Đến với các dịch vụ của&lt;span class=&quot;apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;Công Ty TNHH GOLDTECH&lt;/strong&gt;&lt;span class=&quot;apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;cam kết giá rẻ nhất thị trường&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;Dù quý bạn là doanh nghiệp hay cá nhân, khi quý khách cần hãy liên hệ ngay với chúng tôi để được tư vấn và sở hữu sản phẩm như ý!&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;&amp;nbsp;Mọi chi tiết xin vui lòng liên hệ:&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Công Ty TNHH GOLDTECH&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Địa chỉ: 1A – Ngõ 72 – Dịch Vọng – Cầu Giấy – Hà Nội&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Tel: 04.6328.6530&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Hotline: 0962.163.395 – 0983.027.948&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Email:&lt;span class=&quot;apple-converted-space&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;a href=&quot;mailto:goldtech.jsc@gmail.com&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:\r\n&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#006797;text-decoration:none;text-underline:none&quot;&gt;goldtech.jsc@gmail.com&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;color:#444444&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;font-size:9.0pt;font-family:&amp;quot;Tahoma&amp;quot;,&amp;quot;sans-serif&amp;quot;;\r\ncolor:#444444&quot;&gt;Website: Congnghevang.net&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(3, 6, 'Hotline 0962163395', '&lt;p&gt;Liên hệ : Hotline 0962163395 - 0983027948&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(6, 'Vietnamese', 'vi', 'vi_VN', 'vn.png', 'vietnamese', 'vietnamese', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Pav Blog'),
(13, 'Specials'),
(14, 'Search'),
(15, 'Pavdeal');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(33, 12, 0, 'pavblog/'),
(35, 13, 0, 'product/special'),
(36, 14, 0, 'product/search'),
(38, 15, 0, 'pavdeals/deals');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(2, 6, 'Millimeter', 'mm'),
(1, 6, 'Centimeter', 'cm'),
(3, 6, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(6, 'LENOVO', 'data/demo/palm_logo.jpg', 0),
(9, 'Canon', 'data/demo/canon_logo.jpg', 0),
(56, 'COMMAX', '', 0),
(13, 'hang-HP', '', 0),
(61, 'GLTECH', '', 0),
(58, 'HYUNDAI', '', 0),
(17, 'Cisco', '', 0),
(18, 'D-Link', '', 0),
(19, 'TP-LINK', '', 0),
(22, 'SONY', '', 0),
(23, 'EPSON', '', 0),
(57, 'ETE', '', 0),
(26, 'Kodak', '', 0),
(53, 'SONIC SAFETY', '', 0),
(28, 'Panasonic', '', 0),
(29, 'Hitachi', '', 0),
(62, 'KBVISION', '', 0),
(54, 'KARASS', '', 0),
(55, 'AMOS', '', 0),
(60, 'YLI', '', 0),
(38, 'Supreme', '', 0),
(59, 'TENDA', '', 0),
(43, 'ICAM', '', 0),
(44, 'HIKVISION', '', 0),
(45, 'DAHUA', '', 0),
(46, 'RONALD JACK', '', 0),
(47, 'VANTECH', '', 0),
(48, 'SAMTECH', '', 0),
(49, 'KCE', '', 0),
(50, 'QUESTEK', '', 0),
(51, 'BENCO', '', 0),
(52, 'AVTECH', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(6, 0),
(9, 0),
(13, 0),
(17, 0),
(18, 0),
(19, 0),
(22, 0),
(23, 0),
(26, 0),
(28, 0),
(29, 0),
(38, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu` (
  `megamenu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `type_submenu` varchar(10) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content` text,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `widget_id` int(11) DEFAULT '0',
  PRIMARY KEY (`megamenu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- Dumping data for table `oc_megamenu`
--

INSERT INTO `oc_megamenu` (`megamenu_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `type_submenu`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `content_text`, `submenu_content`, `level`, `left`, `right`, `widget_id`) VALUES
(1, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, -5, 34, 47, 0),
(40, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 1, 0, '/', NULL, 0, 'top', 'home', NULL, '', '', 0, 0, 0, 1),
(44, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 6, 0, 'lien-he', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(45, '', 1, 0, NULL, NULL, NULL, NULL, '25', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(46, '', 1, 0, NULL, NULL, NULL, NULL, '57', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(47, '', 1, 0, NULL, NULL, NULL, NULL, '34', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(48, '', 1, 0, NULL, NULL, NULL, NULL, '59', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(49, '', 1, 0, NULL, NULL, NULL, NULL, '17', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(50, '', 1, 0, NULL, NULL, NULL, NULL, '18', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(51, '', 1, 0, NULL, NULL, NULL, NULL, '20', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(52, '', 1, 0, NULL, NULL, NULL, NULL, '24', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(53, '', 50, 0, NULL, NULL, NULL, NULL, '46', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(54, '', 50, 0, NULL, NULL, NULL, NULL, '45', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(55, '', 51, 0, NULL, NULL, NULL, NULL, '27', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(56, '', 51, 0, NULL, NULL, NULL, NULL, '26', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(57, '', 45, 0, NULL, NULL, NULL, NULL, '32', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(58, '', 45, 0, NULL, NULL, NULL, NULL, '28', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(59, '', 45, 0, NULL, NULL, NULL, NULL, '29', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(60, '', 45, 0, NULL, NULL, NULL, NULL, '30', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(61, '', 45, 0, NULL, NULL, NULL, NULL, '31', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(62, '', 58, 0, NULL, NULL, NULL, NULL, '36', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(63, '', 58, 0, NULL, NULL, NULL, NULL, '35', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(64, '', 47, 0, NULL, NULL, NULL, NULL, '50', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(65, '', 47, 0, NULL, NULL, NULL, NULL, '51', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(66, '', 47, 0, NULL, NULL, NULL, NULL, '52', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(67, '', 47, 0, NULL, NULL, NULL, NULL, '53', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(68, '', 47, 0, NULL, NULL, NULL, NULL, '54', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(69, '', 47, 0, NULL, NULL, NULL, NULL, '55', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(70, '', 47, 0, NULL, NULL, NULL, NULL, '56', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(71, '', 47, 0, NULL, NULL, NULL, NULL, '49', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(72, '', 47, 0, NULL, NULL, NULL, NULL, '48', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(73, '', 47, 0, NULL, NULL, NULL, NULL, '47', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(74, '', 47, 0, NULL, NULL, NULL, NULL, '37', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(75, '', 47, 0, NULL, NULL, NULL, NULL, '38', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(76, '', 47, 0, NULL, NULL, NULL, NULL, '39', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(77, '', 47, 0, NULL, NULL, NULL, NULL, '40', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(78, '', 47, 0, NULL, NULL, NULL, NULL, '41', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(79, '', 47, 0, NULL, NULL, NULL, NULL, '42', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(80, '', 47, 0, NULL, NULL, NULL, NULL, '43', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(81, '', 47, 0, NULL, NULL, NULL, NULL, '44', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(82, '', 66, 0, NULL, NULL, NULL, NULL, '58', '1', 'category', 2, 1, 'menu', 0, 1, 1, 99, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(154, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 7, 0, '#', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(222, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 4, 0, 'tin-tuc', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(437, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 5, 0, 'dich-vu-giai-phap', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(438, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 3, 0, 'khuyen-mai', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1),
(439, '', 1, 0, NULL, NULL, NULL, '', '4', '1', 'information', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu_description`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_description` (
  `megamenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`megamenu_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_megamenu_description`
--

INSERT INTO `oc_megamenu_description` (`megamenu_id`, `language_id`, `title`, `description`) VALUES
(438, 6, 'Khuyến mại', ''),
(45, 1, 'Components', ''),
(45, 2, 'Components', ''),
(45, 3, 'Components', ''),
(45, 4, 'Components', ''),
(45, 5, 'Components', ''),
(46, 1, 'Tablets', ''),
(46, 2, 'Tablets', ''),
(46, 3, 'Tablets', ''),
(46, 4, 'Tablets', ''),
(46, 5, 'Tablets', ''),
(47, 1, 'MP3 Players', ''),
(47, 2, 'MP3 Players', ''),
(47, 3, 'MP3 Players', ''),
(47, 4, 'MP3 Players', ''),
(47, 5, 'MP3 Players', ''),
(48, 1, 'Camera', ''),
(48, 2, 'Camera', ''),
(48, 3, 'Camera', ''),
(48, 4, 'Camera', ''),
(48, 5, 'Camera', ''),
(49, 1, 'Software', ''),
(49, 2, 'Software', ''),
(49, 3, 'Software', ''),
(49, 4, 'Software', ''),
(49, 5, 'Software', ''),
(50, 1, 'Laptops &amp; Notebooks', ''),
(50, 2, 'Laptops &amp; Notebooks', ''),
(50, 3, 'Laptops &amp; Notebooks', ''),
(50, 4, 'Laptops &amp; Notebooks', ''),
(50, 5, 'Laptops &amp; Notebooks', ''),
(51, 1, 'Desktops', ''),
(51, 2, 'Desktops', ''),
(51, 3, 'Desktops', ''),
(51, 4, 'Desktops', ''),
(51, 5, 'Desktops', ''),
(52, 1, 'Phones &amp; PDAs', ''),
(52, 2, 'Phones &amp; PDAs', ''),
(52, 3, 'Phones &amp; PDAs', ''),
(52, 4, 'Phones &amp; PDAs', ''),
(52, 5, 'Phones &amp; PDAs', ''),
(53, 1, 'Macs', ''),
(53, 2, 'Macs', ''),
(53, 3, 'Macs', ''),
(53, 4, 'Macs', ''),
(53, 5, 'Macs', ''),
(54, 1, 'Windows', ''),
(54, 2, 'Windows', ''),
(54, 3, 'Windows', ''),
(54, 4, 'Windows', ''),
(54, 5, 'Windows', ''),
(55, 1, 'Mac', ''),
(55, 2, 'Mac', ''),
(55, 3, 'Mac', ''),
(55, 4, 'Mac', ''),
(55, 5, 'Mac', ''),
(56, 1, 'PC', ''),
(56, 2, 'PC', ''),
(56, 3, 'PC', ''),
(56, 4, 'PC', ''),
(56, 5, 'PC', ''),
(57, 1, 'Web Cameras', ''),
(57, 2, 'Web Cameras', ''),
(57, 3, 'Web Cameras', ''),
(57, 4, 'Web Cameras', ''),
(57, 5, 'Web Cameras', ''),
(58, 1, 'Monitors', ''),
(58, 2, 'Monitors', ''),
(58, 3, 'Monitors', ''),
(58, 4, 'Monitors', ''),
(58, 5, 'Monitors', ''),
(59, 1, 'Mice and Trackballs', ''),
(59, 2, 'Mice and Trackballs', ''),
(59, 3, 'Mice and Trackballs', ''),
(59, 4, 'Mice and Trackballs', ''),
(59, 5, 'Mice and Trackballs', ''),
(60, 1, 'Printers', ''),
(60, 2, 'Printers', ''),
(60, 3, 'Printers', ''),
(60, 4, 'Printers', ''),
(60, 5, 'Printers', ''),
(61, 1, 'Scanners', ''),
(61, 2, 'Scanners', ''),
(61, 3, 'Scanners', ''),
(61, 4, 'Scanners', ''),
(61, 5, 'Scanners', ''),
(62, 1, 'test 2', ''),
(62, 2, 'test 2', ''),
(62, 3, 'test 2', ''),
(62, 4, 'test 2', ''),
(62, 5, 'test 2', ''),
(63, 1, 'test 1', ''),
(63, 2, 'test 1', ''),
(63, 3, 'test 1', ''),
(63, 4, 'test 1', ''),
(63, 5, 'test 1', ''),
(64, 1, 'test 18', ''),
(64, 2, 'test 18', ''),
(64, 3, 'test 18', ''),
(64, 4, 'test 18', ''),
(64, 5, 'test 18', ''),
(65, 1, 'test 19', ''),
(65, 2, 'test 19', ''),
(65, 3, 'test 19', ''),
(65, 4, 'test 19', ''),
(65, 5, 'test 19', ''),
(66, 1, 'test 20', ''),
(66, 2, 'test 20', ''),
(66, 3, 'test 20', ''),
(66, 4, 'test 20', ''),
(66, 5, 'test 20', ''),
(67, 1, 'test 21', ''),
(67, 2, 'test 21', ''),
(67, 3, 'test 21', ''),
(67, 4, 'test 21', ''),
(67, 5, 'test 21', ''),
(68, 1, 'test 22', ''),
(68, 2, 'test 22', ''),
(68, 3, 'test 22', ''),
(68, 4, 'test 22', ''),
(68, 5, 'test 22', ''),
(69, 1, 'test 23', ''),
(69, 2, 'test 23', ''),
(69, 3, 'test 23', ''),
(69, 4, 'test 23', ''),
(69, 5, 'test 23', ''),
(70, 1, 'test 24', ''),
(70, 2, 'test 24', ''),
(70, 3, 'test 24', ''),
(70, 4, 'test 24', ''),
(70, 5, 'test 24', ''),
(71, 1, 'test 17', ''),
(71, 2, 'test 17', ''),
(71, 3, 'test 17', ''),
(71, 4, 'test 17', ''),
(71, 5, 'test 17', ''),
(72, 1, 'test 16', ''),
(72, 2, 'test 16', ''),
(72, 3, 'test 16', ''),
(72, 4, 'test 16', ''),
(72, 5, 'test 16', ''),
(73, 1, 'test 15', ''),
(73, 2, 'test 15', ''),
(73, 3, 'test 15', ''),
(73, 4, 'test 15', ''),
(73, 5, 'test 15', ''),
(74, 1, 'test 5', ''),
(74, 2, 'test 5', ''),
(74, 3, 'test 5', ''),
(74, 4, 'test 5', ''),
(74, 5, 'test 5', ''),
(75, 1, 'test 4', ''),
(75, 2, 'test 4', ''),
(75, 3, 'test 4', ''),
(75, 4, 'test 4', ''),
(75, 5, 'test 4', ''),
(76, 1, 'test 6', ''),
(76, 2, 'test 6', ''),
(76, 3, 'test 6', ''),
(76, 4, 'test 6', ''),
(76, 5, 'test 6', ''),
(77, 1, 'test 7', ''),
(77, 2, 'test 7', ''),
(77, 3, 'test 7', ''),
(77, 4, 'test 7', ''),
(77, 5, 'test 7', ''),
(78, 1, 'test 8', ''),
(78, 2, 'test 8', ''),
(78, 3, 'test 8', ''),
(78, 4, 'test 8', ''),
(78, 5, 'test 8', ''),
(79, 1, 'test 9', ''),
(79, 2, 'test 9', ''),
(79, 3, 'test 9', ''),
(79, 4, 'test 9', ''),
(79, 5, 'test 9', ''),
(80, 1, 'test 11', ''),
(80, 2, 'test 11', ''),
(80, 3, 'test 11', ''),
(80, 4, 'test 11', ''),
(80, 5, 'test 11', ''),
(81, 1, 'test 12', ''),
(81, 2, 'test 12', ''),
(81, 3, 'test 12', ''),
(81, 4, 'test 12', ''),
(81, 5, 'test 12', ''),
(82, 1, 'test 25', ''),
(82, 2, 'test 25', ''),
(82, 3, 'test 25', ''),
(82, 4, 'test 25', ''),
(82, 5, 'test 25', ''),
(40, 6, 'Trang chủ', ''),
(44, 6, 'Liên Hệ', ''),
(439, 6, 'Giới thiệu', ''),
(154, 6, 'Hotline 0962163395', ''),
(222, 6, 'Tin tức', ''),
(437, 6, 'Dịch vụ &amp; Giải pháp', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu_widgets`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_megamenu_widgets`
--

INSERT INTO `oc_megamenu_widgets` (`id`, `name`, `type`, `params`, `store_id`) VALUES
(1, 'Video Widget', 'video_code', 'a:1:{s:10:"video_code";s:168:"&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;//www.youtube.com/embed/-OPiCujrgbM&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;";}', 0),
(2, 'Last Tweets', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:399:"&lt;p&gt;MAKES UP PHOTOSHOP&lt;/p&gt;\r\n&lt;p&gt;\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet laboriosam provident at optio reiciendis culpa reprehenderit\r\n&lt;/p&gt; \r\n&lt;p&gt;MAKES UP PHOTOSHOP&lt;/p&gt;\r\n&lt;p&gt;\r\n	Voluptates, consectetur soluta laborum maiores alias autem velit deserunt quas quis repellendus beatae veniam omnis sequi expedita nobis debitis\r\n&lt;/p&gt;";i:2;s:593:"&lt;p&gt;تشكل فوتوشوب&lt;/p&gt;\r\n&lt;p&gt;\r\nأم كما وتردي الساحل, وحتّى اليها حين في, ثم يذكر تكتيكاً بوزيرها حول. وجزر تنفّس أفريقيا بلا لم, عل هامش الحربية كان. رئيس غرّة،\r\n&lt;/p&gt; \r\n&lt;p&gt;تشكل فوتوشوب&lt;/p&gt;\r\n&lt;p&gt;\r\nأم كما وتردي الساحل, وحتّى اليها حين في, ثم يذكر تكتيكاً بوزيرها حول. وجزر تنفّس أفريقيا بلا لم, عل هامش الحربية كان. رئيس غرّة،\r\n&lt;/p&gt;";}}', 0),
(3, 'Products Latest', 'product_list', 'a:4:{s:9:"list_type";s:6:"newest";s:5:"limit";s:1:"1";s:11:"image_width";s:3:"150";s:12:"image_height";s:3:"150";}', 0),
(4, 'Products In Cat 61', 'product_category', 'a:4:{s:11:"category_id";s:2:"61";s:5:"limit";s:1:"4";s:11:"image_width";s:3:"215";s:12:"image_height";s:3:"290";}', 0),
(5, 'Manufactures', 'banner', 'a:4:{s:8:"group_id";s:1:"8";s:11:"image_width";s:3:"170";s:12:"image_height";s:2:"58";s:5:"limit";s:2:"16";}', 0),
(6, 'PavoThemes Feed', 'feed', 'a:1:{s:8:"feed_url";s:55:"http://www.pavothemes.com/opencart-themes.feed?type=rss";}', 0),
(7, 'Clothing', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:741:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Dresses&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Jeans &amp; Trousers&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Blouses &amp; Shirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tops &amp; T-Shirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Jackets &amp; Coats&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Skirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tristique Turpis&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";i:2;s:741:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Dresses&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Jeans &amp; Trousers&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Blouses &amp; Shirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tops &amp; T-Shirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Jackets &amp; Coats&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Skirts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tristique Turpis&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";}}', 0),
(8, 'Accessories', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:694:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Formal Shoes&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Casual Shoes&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Sandals&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Boots&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Wide Fit&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Slippers&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Bibendum&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";i:2;s:694:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Formal Shoes&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Casual Shoes&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Sandals&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Boots&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Wide Fit&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Slippers&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Bibendum&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";}}', 0),
(9, 'Malesuada ', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:715:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Phasellus Purus&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Bags &amp; Purses&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Belts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Gloves&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Jewellery&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Sunglasses&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Hair Accessories&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tristique Turpis&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";i:2;s:715:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;path=28&quot;&gt;Phasellus Purus&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;		\r\n		&lt;a href=&quot;#&quot;&gt;Bags &amp; Purses&lt;/a&gt;\r\n	&lt;/li&gt;	\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Belts&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Gloves&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Jewellery&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Sunglasses&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Hair Accessories&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;#&quot;&gt;Tristique Turpis&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";}}', 0),
(10, 'Banner', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:227:"&lt;img src=&quot;image/data/banner/menu-banner.jpg&quot; alt=&quot;&quot;&gt;\r\n&lt;p style=&quot;padding-top:10px;&quot;&gt;This Photoshops consequat ipsum sagittis dccumsan consequat ipsum sagittis cusan psum velit.&lt;/p&gt;";i:2;s:227:"&lt;img src=&quot;image/data/banner/menu-banner.jpg&quot; alt=&quot;&quot;&gt;\r\n&lt;p style=&quot;padding-top:10px;&quot;&gt;This Photoshops consequat ipsum sagittis dccumsan consequat ipsum sagittis cusan psum velit.&lt;/p&gt;";}}', 0),
(11, 'Khuyến Mãi', 'product_list', 'a:4:{s:9:"list_type";s:7:"special";s:5:"limit";s:1:"8";s:11:"image_width";s:3:"100";s:12:"image_height";s:3:"100";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(10, 6, 'Date &amp; Time'),
(9, 6, 'Time'),
(5, 6, 'Select'),
(7, 6, 'File'),
(8, 6, 'Date'),
(6, 6, 'Textarea'),
(4, 6, 'Text'),
(2, 6, 'Checkbox'),
(1, 6, 'Radio'),
(12, 6, 'Delivery Date'),
(11, 6, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(24, 6, 2, 'Checkbox 2'),
(23, 6, 2, 'Checkbox 1'),
(40, 6, 5, 'Blue'),
(39, 6, 5, 'Red'),
(41, 6, 5, 'Green'),
(42, 6, 5, 'Yellow'),
(31, 6, 1, 'Medium'),
(44, 6, 2, 'Checkbox 3'),
(45, 6, 2, 'Checkbox 4'),
(32, 6, 1, 'Small'),
(43, 6, 1, 'Large'),
(48, 6, 11, 'Large'),
(47, 6, 11, 'Medium'),
(46, 6, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_download`
--

CREATE TABLE IF NOT EXISTS `oc_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(13, 6, 'Chargeback'),
(12, 6, 'Reversed'),
(11, 6, 'Refunded'),
(10, 6, 'Failed'),
(9, 6, 'Canceled Reversal'),
(8, 6, 'Denied'),
(5, 6, 'Complete'),
(7, 6, 'Canceled'),
(3, 6, 'Shipped'),
(2, 6, 'Processing'),
(1, 6, 'Pending'),
(16, 6, 'Voided'),
(15, 6, 'Processed'),
(14, 6, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavads_banner`
--

CREATE TABLE IF NOT EXISTS `oc_pavads_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `store_id` tinyint(4) DEFAULT '0',
  `params` text,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_pavads_banner`
--

INSERT INTO `oc_pavads_banner` (`banner_id`, `name`, `status`, `store_id`, `params`) VALUES
(1, 'banner1', 1, 0, 'a:4:{s:6:"action";s:9:"save_stay";s:4:"name";s:7:"banner1";s:6:"status";s:1:"1";s:7:"banners";a:4:{i:1;a:5:{s:5:"image";s:23:"data/banner/banner1.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"380";s:7:"caption";a:2:{i:1;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:2;a:5:{s:5:"image";s:23:"data/banner/banner2.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"380";s:7:"caption";a:2:{i:1;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:3;a:5:{s:5:"image";s:23:"data/banner/banner3.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"380";s:7:"caption";a:2:{i:1;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:4;a:5:{s:5:"image";s:23:"data/banner/banner4.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"380";s:7:"caption";a:2:{i:1;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}}}'),
(2, 'banner2', 1, 0, 'a:4:{s:6:"action";s:0:"";s:4:"name";s:7:"banner2";s:6:"status";s:1:"1";s:7:"banners";a:6:{i:1;a:5:{s:5:"image";s:23:"data/banner/banner6.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"196";s:7:"caption";a:2:{i:1;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:2;a:5:{s:5:"image";s:23:"data/banner/banner7.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"196";s:7:"caption";a:2:{i:1;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:3;a:5:{s:5:"image";s:23:"data/banner/banner8.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"410";s:7:"caption";a:2:{i:1;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:4;a:5:{s:5:"image";s:23:"data/banner/banner9.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"196";s:7:"caption";a:2:{i:1;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:210:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-left&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:5;a:5:{s:5:"image";s:24:"data/banner/banner10.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"196";s:7:"caption";a:2:{i:1;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}i:6;a:5:{s:5:"image";s:24:"data/banner/banner11.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"410";s:7:"caption";a:2:{i:1;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:211:"&lt;p&gt;&lt;a class=&quot;btn-shop-now btn-right&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}}}'),
(3, 'banner3', 1, 0, 'a:4:{s:6:"action";s:0:"";s:4:"name";s:7:"banner3";s:6:"status";s:1:"1";s:7:"banners";a:1:{i:1;a:5:{s:5:"image";s:23:"data/banner/banner5.png";s:4:"link";s:1:"#";s:5:"width";s:3:"279";s:6:"height";s:3:"464";s:7:"caption";a:2:{i:1;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";i:2;s:201:"&lt;p&gt;&lt;a class=&quot;btn-shop-now&quot; href=&quot;#&quot;&gt;&lt;span&gt;Shop now&lt;/span&gt;&lt;img all=&quot;icon&quot; src=&quot;image/data/banner/arrow.png&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavblog_blog`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `date_modified` date NOT NULL,
  `video_code` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `oc_pavblog_blog`
--

INSERT INTO `oc_pavblog_blog` (`blog_id`, `category_id`, `position`, `created`, `status`, `user_id`, `hits`, `image`, `meta_keyword`, `meta_description`, `meta_title`, `date_modified`, `video_code`, `params`, `tags`, `featured`, `keyword`) VALUES
(18, 28, 0, '2016-04-28', 1, 1, 125, 'data/lap dat camera giam sat nha may.jpg', 'lap dat camera quan sat, camera quan sat, lap dat camera quan sat nha may', 'Công ty TNHH GOLTECH chuyên cung cấp lắp đặt camera chính hãng cho nhà máy, nhà xưởng, xí nghiệp, văn phòng, trường học, cửa hàng', 'Lắp đặt camera quan sát nhà máy', '2016-05-01', '', '', 'lap dat camera quan sat, lap dat camera quan sat nha may', 1, 'lap-dat-camera-quan-sat-nha-may'),
(19, 28, 0, '2016-05-01', 1, 1, 34, '', 'camera hikvision, camera quan sat , camera quan sat hikvision', 'Hikvision Digital Technology Co, Ltd là một trong những nhà cung cấp hàng đầu thế giới về các sản phẩm giám sát video và các giải pháp giám sát thiết bị an ninh hàng đầu thế giới.', 'Tìm Hiểu Về Tính Năng Mới Nhất Của Camera HIKVISION 2016', '2016-05-01', '', '', 'Camera quan sat HIKVISION, camera quan sat, HIKVISION', 0, 'Tim-hieu-ve-tinh-nang-moi-nhat-cua-camera-hikvision-2016'),
(20, 28, 0, '2016-05-14', 1, 1, 51, '', 'camera hikvision, phan mem iVMS-4200, phần mềm xem camera, cai dat phan mem xem camera', 'Hikvision là hãng camera rất nổi tiếng và bán chạy nhất thế giới. Nếu quý khách hàng đã từng lắp đặt và sử dụng camera của hãng Camera Hikvision thì chắc chắn sẽ biết đến phần mềm hỗ trợ và quản lí camera iVMS 4500 xem trên smartphone và phần mềm iVMS 420', 'Hướng dẫn cài đặt và sử dụng phần mềm xem camera iVMS-4200 HIKVISION', '2016-05-14', '', '', 'camera hikvision, phan mem iVMS-4200, phần mềm xem camera, cai dat phan mem xem camera', 0, 'Huong-dan-cai-dat-va-su-dung-phan-mem-xem-camera-iVMS4200-Hikvision'),
(21, 28, 0, '2016-05-31', 1, 1, 56, '', 'camera quan sat, lap dat camera quan sat, camera giam sat, may cham cong, may cham cong van tay, lap dat may cham cong', 'GOLDTECH vừa hoàn thành dự án cung cấp lắp đặt hệ thống camera quan sát và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA', 'Cung cấp lắp đặt hệ thống camera quan sát và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA', '2016-05-31', '', '', 'camera quan sat, lap dat camera quan sat, camera giam sat, may cham cong, may cham cong van tay, lap dat may cham cong', 0, 'Cung-cap-lap-đat-he-thong-camera-quan-sat-va-he-thong-may-cham-cong-van-tay-cho-cong-ty-tnhh-now-vina'),
(22, 27, 0, '2016-05-31', 1, 1, 74, '', 'camera quan sat, camera giam sat, camera ban cau, camera than, camera hong ngoai, lap dat camera truong hoc', 'giải pháp camera quan sát dành cho các trường học của chúng tôi là một giải pháp toàn diện, tiết kiệm chi phí và mang lại hiệu quả rất cao. với hệ thống này hiệu trưởng có thể quan sát và theo dõi tình trạng dạy và học của bất cứ lớp học nào mà mình muốn,', 'Giải Pháp Camera Giám Sát Trường Học', '0000-00-00', '', '', 'camera quan sat, camera giam sat, camera ban cau, camera than, camera hong ngoai, lap dat camera truong hoc', 0, 'giai-phap-camera-giam-sat-truong-hoc'),
(23, 28, 0, '2016-06-09', 1, 1, 49, '', 'lap dat camera giam sat, lap dat camera quan sat, camera quan sat, camera quan sat nha may', 'Goldtech Camera. Chuyên Tư vấn - Thiết kế - Cung Cấp - Lắp Đặt - Sửa chữa Camera giám sát với chi phí rẻ nhất. LH: 0962163395', 'Lắp đặt camera giám sát ', '2016-06-09', '', '', 'lap dat camera giam sat, camera giam sat, camera quan sat, camera giam sat nha may', 0, 'Lap-dat-camera-giam-sat'),
(24, 27, 0, '2016-06-14', 1, 1, 65, '', 'camera quan sat, camera giam sat, lap dat camera giam sat, lap dat camera quan sat trang trai, dau ghi hinh camera', 'Công Ty TNHH GOLDTECH chuyên tư vấn - thiết kế - cung cấp - lắp đặt camera quan sát cho trang trại chăn nuôi, nhà vườn, quản lý giám sát vật nuôi từ xa', 'Lắp đặt camera quan sát trang trại chăn nuôi', '2016-06-14', '', '', 'camera quan sat, camera giam sat, lap dat camera giam sat, lap dat camera quan sat trang trai', 0, 'Lap-dat-camera-quan-sat-trang-trai-chan-nuoi'),
(25, 27, 0, '2016-06-14', 1, 1, 45, '', 'camera wifi, camera khong day, camera wifi khong day, camera quan sat khong day', 'Camera wifi không dây có khả năng xoay 4 chiều giúp bạn điều khiển và quan sát dễ dàng theo ý muốn, có thể di chuyển dễ dàng khi bạn muốn thay đổi các vị trí quan sát', 'Camera wifi không dây', '2016-06-14', '', '', 'camera wifi, camera khong day, camera wifi khong day, camera quan sat khong day', 0, 'Camera-wifi-khong-day');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavblog_blog_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_pavblog_blog_description`
--

INSERT INTO `oc_pavblog_blog_description` (`blog_id`, `language_id`, `title`, `description`, `content`) VALUES
(18, 6, 'Lắp đặt camera quan sát nhà máy', '&lt;p&gt;Công ty TNHH GOLTECH chuyên cung cấp lắp đặt camera chính hãng cho nhà máy, nhà xưởng, xí nghiệp, văn phòng, trường học, cửa hàng&lt;/p&gt;\r\n', '&lt;h1&gt;Lắp đặt camera quan sát nhà máy&lt;/h1&gt;\r\n\r\n&lt;p&gt;Công ty TNHH GOLTECH chuyên cung cấp lắp đặt camera chính hãng cho nhà máy, nhà xưởng, xí nghiệp. Những công trình lắp đặt camera quan sát nhà máy tiêu biểu mà công ty Goldtech đã thi công:&lt;/p&gt;\r\n\r\n&lt;p&gt;- &lt;strong&gt;CÔNG TY TNHH AAC TECHNOLOGIES VIỆT NAM&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: Lô K4-2F, KCN Quế Võ, phường Vân Dương, thành phố Bắc Ninh&lt;/p&gt;\r\n\r\n&lt;p&gt;-&amp;nbsp;&lt;strong&gt;CÔNG TY CỔ PHẦN PHÁT TRIỂN HẠ TẦNG VĨNH PHÚC&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: KCN Khai Quang - phường Khai Quang - TP. Vĩnh Yên - Tỉnh Vĩnh Phúc&lt;/p&gt;\r\n\r\n&lt;p&gt;- &lt;strong&gt;CÔNG TY CỔ PHẦN THƯƠNG MẠI VÀ XÂY DỰNG HPT&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: Số 45- Đường Đội Cấn – Phường Ngô Quyền – Tp.Vĩnh Yên – Tỉnh Vĩnh Phúc&lt;/p&gt;\r\n\r\n&lt;p&gt;- &lt;strong&gt;CÔNG TY CỔ PHẦN BÊ TÔNG VĨNH PHÚC&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: Khu Đồng Mố - Quất Lưu - Bình Xuyên - Vĩnh Phúc&lt;/p&gt;\r\n\r\n&lt;p&gt;- &lt;strong&gt;TRUNG TÂM LƯU TRỮ QUỐC GIA 3&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: số 34 Phan Kế Bính – Ba Đình – Hà Nội&lt;/p&gt;\r\n\r\n&lt;p&gt;-&amp;nbsp;&lt;strong&gt;CÔNG TY TNHH HỆ THỐNG CÔNG NGHIỆP VIỆT NAM&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: Lô D8, Khu Công Nghiệp Hà Nội – Đài Tư, 386 Nguyễn Văn Linh, Quận Long Biên, Hà Nội&lt;/p&gt;\r\n\r\n&lt;p&gt;- &lt;strong&gt;CÔNG TY TNHH HOÀNG DUY&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: Khu 10, Thị trấn Thanh Ba, Tỉnh Phú Thọ&lt;/p&gt;\r\n\r\n&lt;p&gt;- &amp;nbsp;&lt;strong&gt;CÔNG TY TNHH AR TECH VINA&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ&lt;strong&gt;:&lt;/strong&gt;&amp;nbsp;Khu công nghiệp Đại Đồng – phố Đồng Xép – xã Hoàn Sơn – huyện Tiên Du – tỉnh Bắc Ninh&lt;/p&gt;\r\n\r\n&lt;h2&gt;Ưu điểm khi lắp đặt camera quan sát cho nhà máy&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Việc&amp;nbsp;lắp đặt &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt; nhà xưởng nhà máy đem lại cho chủ doanh nghiệp 1 sự an tâm rất lớn về tình hình an ninh khi không có mặt ở đó. Sẽ không còn nỗi lo các vụ trộm cắp, công nhân viên lười biếng công việc, hoặc khi có vấn đề về hỏng hóc thiết bị, hoàn toàn có thể xác minh được người chịu trách nhiệm qua camera quan sát, cụ thể như sau:&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Quản lý công nhân viên: Làm việc tự giác không cần giám sát, nhắc nhở. Giúp người quản lý giám sát mọi hoạt động công nhân, nhân viên, vận hành máy móc.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tiết kiệm thời gian và chi phí: Giải pháp lắp đặt camera quan sát nhà xưởng giúp doanh nghiệp điều hành xử lý nhanh chóng, hiệu quả khi sự cố xảy ra. Tiết kiệm thời gian, chi phí cho nhà quản lý về việc quản lý nhân sự, hàng hóa nhưng vẫn đảm bảo được tính linh hoạt và hiệu quả.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Quan sát mọi lúc, mọi nơi: quan sát trực tiếp nhà xưởng hay nhân viên trên máy tính, điện thoại ở bất cứ nơi đâu nếu có kết nối 3G hay internet, giải pháp&amp;nbsp;camera quan sát từ xa qua mạng, điện thoại&lt;/p&gt;\r\n\r\n&lt;p&gt;- An ninh cho nhà xưởng: Phát hiện xử lý kịp thời nhiều tình huống như: kẻ lạ xâm nhập và nhà xường, hạn chế tình trạng mất cấp tài sản, đảm bảo hàng hóa không bị thất thoát.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Nếu quý khách có nhu cầu lắp đặt hệ thống camera quan sát nhà máy – nhà xưởng, văn phòng, cửa hàng, hộ gia đình…hãy liên hệ ngay với chúng tôi để được tư vấn miễn phí - hiệu quả - phù hợp với nhu cầu của quý khách.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong style=&quot;line-height: 1.6em;&quot;&gt;Mọi chi tiết xin liên hệ:&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Hotline hỗ trợ 24/7: 0962.16.3395&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 0983.027.948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Một số hình ảnh thi công lắp đặt Camera cho nhà xưởng:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/thi cong camera quan sat nha xuong.jpg&quot; style=&quot;width: 960px; height: 720px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap dat camera HD.jpg&quot; style=&quot;width: 960px; height: 720px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap dat camera giam sat nha may.jpg&quot; style=&quot;width: 960px; height: 720px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera quan sat hd gia re.jpg&quot; style=&quot;width: 960px; height: 720px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(19, 6, 'Tìm Hiểu Về Tính Năng Mới Nhất Của Camera HIKVISION 2016', '&lt;p&gt;Hikvision Digital Technology Co, Ltd là một trong những nhà cung cấp hàng đầu thế giới về các sản phẩm giám sát video và các giải pháp giám sát thiết bị an ninh hàng đầu thế giới.&amp;nbsp;&lt;/p&gt;\r\n', '&lt;h1&gt;Tìm Hiểu Về Tính Năng Mới Nhất Của Camera HIKVISION 2016&lt;/h1&gt;\r\n\r\n&lt;h2&gt;Giới Thiệu Về Thương Hiệu HIKVISION&lt;/h2&gt;\r\n\r\n&lt;p&gt;Hikvision Digital Technology Co, Ltd là một trong những nhà cung cấp hàng đầu thế giới về các sản phẩm giám sát video và các giải pháp giám sát thiết bị an ninh hàng đầu thế giới.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;HIKVISION - THƯƠNG HIỆU CAMERA BÁN CHẠY SỐ 1 THẾ GIỚI&quot; src=&quot;http://congnghevang.net/image/data/hikvision-thuong-hieu-camera-ban-chay-so-1.jpg&quot; style=&quot;width: 629px; height: 340px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Hikvision Digital Technology Co, Ltd &amp;nbsp;Được thành lập vào năm 2001,&amp;nbsp;HIKVISION&amp;nbsp;đã phát triển từ một công ty rất nhỏ với 28 người thành một doanh nghiệp toàn cầu thế giới với hơn 8.000 nhân viên được trải khắp các bộ phận và các nước trên thế giới – trong đó có 2.900 kỹ sư R &amp;amp; D. Với một đội ngũ R &amp;amp; D chuyên nghiệp được lựa chọn bởi những chuyên gia trong nghành công nghiệp và đặc biệt &amp;nbsp;khả năng đổi mới liên tục của Hikvision Digital Technology Co, Ltd tạo nên những sản phẩm giám sát hiện đại và luôn luôn được cải tiến và nâng cấp, các sản phẩm&amp;nbsp;HIKVISION&amp;nbsp;rất đa dạng và tiên tiến bao gồm bộ ghép DVR ,NVRs, DVR độc lập, máy chủ video kỹ thuật số, thẻ nén, camera IP độ nét cao, và speed dome…. Những sản phẩm này được sử dụng trong hơn 100 quốc gia, và đã được sử dụng để đảm bảo các ứng dụng bảo mật khác nhau trên thế giới.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Những tính năng mới nhất của Camera HIKVISION năm 2016&lt;/h2&gt;\r\n\r\n&lt;p&gt;- SMART DEFOG:&lt;/p&gt;\r\n\r\n&lt;p&gt;Một tính năng defog thông minh cũng được tích hợp để giúp cải thiện rõ nét của hình ảnh được chụp trong điều kiện thời tiết ko thuận lợi , chẳng hạn như mưa hoặc sương mù. Và công nghệ thông minh IR được thêm vào để giải quyết vấn đề ảnh quá sáng ở trung tâm hình ảnh ( với hồng ngoại thường, vùng giữa màn hình thường sáng hơn xung quanh khá nhiều )&lt;/p&gt;\r\n\r\n&lt;p&gt;- ROI codec :&lt;/p&gt;\r\n\r\n&lt;p&gt;ROI : Tăng chất lượng hình ảnh ở một số khu vực mong muốn hoặc cho phép chụp ảnh độ phân giải cao thông tin quan trọng như biển số xe và phát hiện trên khuôn mặt, và cũng làm giảm chất lượng hình ảnh những vùng ko quan trọng để tiết kiệm băng thông tổng thể.&lt;/p&gt;\r\n\r\n&lt;p&gt;3 Stream: 3 luồng dữ liệu&lt;/p&gt;\r\n\r\n&lt;p&gt;Smart tracking: truy bắt thông minh&lt;/p&gt;\r\n\r\n&lt;p&gt;3D intelligent possitioning: cho phép dễ dàng truy bắt và phóng to bất kỳ vật thể đáng ngờ nào trên màn hình&lt;/p&gt;\r\n\r\n&lt;h3&gt;- Ưu điểm hồng ngoại EXIR HIKVISION:&lt;/h3&gt;\r\n\r\n&lt;p&gt;So với camera hồng ngoại mạng thông thường, EXIR của &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-hikvision&quot;&gt;Camera quan sát Hikvision&lt;/a&gt; cung cấp khả năng giám sát về trong điều kiện ánh sáng yếu và đêm tối tốt hơn rất nhiều.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/DS-2CE56C2T-IT3.jpg&quot; style=&quot;width: 350px; height: 350px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;EXIR là một sự thay đổi trong thiết kế vấn đề chiếu sáng sử dụng LED hồng ngoại chứ ko phải là một công nghệ mới. Nhưng sự thay đổi này cũng đem lại nhiều ưu điểm so với led truyền thống.&lt;/p&gt;\r\n\r\n&lt;p&gt;Dưới đây là một số những lợi ích mà EXIR mang lại:&lt;/p&gt;\r\n\r\n&lt;p&gt;1. Nguồn sáng có hiệu quả cao và tăng cường sức mạnh ánh sáng LED: Bằng cách sử dụng các màng mỏng, công nghệ phát sáng tiên tiến nhất, EXIR Hikvision cho phép tăng một lên đến 30% trong hiệu quả soi sáng trên công nghệ đèn LED truyền thống&lt;/p&gt;\r\n\r\n&lt;p&gt;2.Sử dụng ánh sáng tốt hơn: Hikvision EXIR cho phép camera tạo ra ánh sáng LED dưới dạng một hình chữ nhật để phù hợp với kích thước bình thường của một màn hình (màn hình 4:3 hay 16:9). Điều này bổ sung giúp cải thiện hiệu quả sử dụng đèn LED và giảm ô nhiễm ánh sáng trong môi trường xung quanh.( nếu sử dụng bo mạch led thông thường , vùng hồng ngoại sẽ &amp;nbsp;dẫn đến 2 khả năng: bị lãng phí ánh sáng hồng ngoại (chiếu vào những vùng ngoài tầm nhìn của ống kính, hoặc bị chói ở giữa khung hình do hồng ngoại tập trung vào đó )&lt;/p&gt;\r\n\r\n&lt;p&gt;3. Độ sáng đồng đều: Công nghệ EXIR Hikvision cho ánh sáng IR đồng đều hơn. Điều này giúp loại bỏ các vấn đề ống kính LED truyền thống, chẳng hạn độ sáng ở trung tâm khung hình và các khu vực &amp;nbsp;tối hơn ở góc. Ngoài ra, tản nhiệt tốt, tuổi thọ dài hơn, và tiết kiệm năng lượng nhiều hơn chỉ là một vài trong số những lợi ích mà Hikvision EXIR mang lại.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(20, 6, 'Hướng dẫn cài đặt và sử dụng phần mềm xem camera iVMS-4200 HIKVISION', '&lt;p&gt;Hikvision là hãng camera rất nổi tiếng và bán chạy nhất thế giới. Nếu quý khách hàng đã từng lắp đặt và sử dụng camera của hãng Camera Hikvision thì chắc chắn sẽ biết đến phần mềm hỗ trợ và quản lí camera iVMS 4500 xem trên smartphone và phần mềm iVMS 4200 xem trên Laptop và PC&lt;/p&gt;\r\n', '&lt;h1&gt;Hướng dẫn cài đặt và sử dụng phần mềm xem camera iVMS-4200 HIKVISION&lt;/h1&gt;\r\n\r\n&lt;p&gt;Hikvision là hãng camera rất nổi tiếng và bán chạy nhất thế giới. Nếu quý khách hàng đã từng lắp đặt và sử dụng camera của hãng Camera Hikvision thì chắc chắn sẽ biết đến phần mềm hỗ trợ và quản lí camera iVMS 4500 xem trên smartphone và phần mềm iVMS 4200 xem trên Laptop và PC&lt;/p&gt;\r\n\r\n&lt;p&gt;Trên thực tế rất nhiều người sử dụng &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-hikvision&quot;&gt;Camera Hikvision&lt;/a&gt; nhưng chưa biết cách cài đặt phần mềm để quản lý camera. Hôm nay công ty Goldtech sẽ hướng dẫn quý khách hàng cách &lt;strong&gt;cài đặt và sử dụng phần mềm iVMS-4200 Hikvision.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Để tiến hành cài đặt và sử dụng phần mềm, quý khách hàng vui lòng tải về phần mềm tương thích với hệ điều hành mà mình đang sử dụng:&lt;/p&gt;\r\n\r\n&lt;p&gt;- Với máy tính hệ điều hành Windows: &lt;a href=&quot;http://www.mediafire.com/download/9yzod7k85jy5ycv/iVMS-4200%28v2.3.0.5%29.rar&quot;&gt;&lt;strong&gt;Phần mềm iVMS-4200 cho máy tính windows&lt;/strong&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Với máy tính hệ điều hành Mac OS: &lt;a href=&quot;http://www.mediafire.com/download/7ns1v4xnmazc5s5/v1.02.01.03-iVMS-4200%28Mac10.10%29.rar&quot;&gt;&lt;strong&gt;Phần mềm iVMS-4200 cho máy Mac OS&lt;/strong&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tải về tài liệu hướng dẫn chi tiết nhất: &lt;a href=&quot;http://www.mediafire.com/download/y0u3fya0lc3shcw/Huong+dan+su+dung+phan+mem+iVMS-4200+v2.0.pdf&quot;&gt;&lt;strong&gt;Sách hướng dẫn sử dụng&lt;/strong&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;h2&gt;Các bước cài đặt:&lt;/h2&gt;\r\n\r\n&lt;p&gt;– Đầu tiên các bạn tải phần mềm vài đặt về có tên là:&amp;nbsp;&lt;strong&gt;iVMS-4200 &lt;/strong&gt;các bạn giải nén và cài đặt như một phần mềm bình thường. ( Mở lên cứ next&amp;nbsp; đến khi nào cài đặt xong là ok)&lt;/p&gt;\r\n\r\n&lt;p&gt;– Cài đặt xong trên Desktop sẽ xuất hiện một phần mềm mang tên có biểu tượng như bên dưới. Các bạn kích vào đó để khởi chạy phần mềm.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/icon.png&quot; style=&quot;width: 83px; height: 87px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;– Khởi phần lần đầu tiên phần mềm sẽ có giao diện đăng kí tên và pass để sử dụng phần mềm (Mục đích là không cho nhiều người xem camera trên máy tính đã cài đặt. Nếu muốn xem phải biết password)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/14.png&quot; style=&quot;width: 380px; height: 240px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;– Bước này không quá quan trọng các bạn cứ tạo theo ý của các bạn, Đơn giản nhất tài khoản admin pass abc123 cho dễ nhớ&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Super User: Tên đăng nhập (admin)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Password: Đặt vừa chữ vừa số (abc123)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Confirm Password: gõ lại pass bên trên&lt;/p&gt;\r\n\r\n&lt;p&gt;+ tích vào ô Enble Auto-login (tự động đăng nhập khi kích vào phần mềm)&lt;/p&gt;\r\n\r\n&lt;p&gt;=&amp;gt; Xong hết thì nhấn&amp;nbsp;Register để đăng kí và đăng nhập vào bên trong phần mềm&lt;/p&gt;\r\n\r\n&lt;p&gt;Lưu ý: phải ghi nhớ pass này, không nhớ cài lại phần mềm là hơi mệt.&lt;/p&gt;\r\n\r\n&lt;p&gt;– Tiếp đến là giao diện chính của phần mềm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/controlpanel hikvision.png&quot; style=&quot;width: 1024px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Như các bạn đã thấy đây là giao diện chính của phần mềm, Sau đây mình sẽ liệt kê những tính năng quan trọng hay dùng trong phần mềm này để cho các bạn tiện sử dụng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/ivms4200.png&quot; style=&quot;width: 800px; height: 478px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;I, THÊM CAMERA (Device Management)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;– Trên giao diện chính của phần mềm bạn kích vào biểu tượng có chữ&amp;nbsp;&lt;strong&gt;Device Management&lt;/strong&gt;&amp;nbsp;đẻ thêm camera. Một hộp thoại mới xuất hiện giao diện như sau:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/ivms4200-1.png&quot; style=&quot;width: 800px; height: 566px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;– Chúng ta kích luôn vào biểu tượng&amp;nbsp;&lt;strong&gt;ADD DEVICE&lt;/strong&gt;&amp;nbsp;để thêm đầu ghi&amp;nbsp;hoặc camera vào phần mềm. Sau khi nhấn xuong một hộp thoại ADD DEVICE xuất hiện, các bạn điền thông tin của các bạn vào để kết nối camera với phần mềm này.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/ivms4200-2.png&quot; style=&quot;width: 500px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Lưu ý: Phần Adding Mode các bạn chọn chuẩn chế độ nhé&lt;/p&gt;\r\n\r\n&lt;p&gt;* Nếu tên miền hạng đuôi ***.dyndns.***, ***.homei.***. ***.ddns.*** thì chọn&amp;nbsp;Adding Mode là&amp;nbsp;&lt;strong&gt;IP/Domain&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Nếu các bạn đã sử dụng tên miền của Hikvision thì nó không có đuôi gì hết các bạn chọn&amp;nbsp;&lt;strong&gt;HiDDNS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;– Điền đầy đủ thông tin bên trên như sau:&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Nich Name:( các bạn có thể điền tên doanh nghiệp của các bạn)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Sever Address: giữ nguyên ko động chạm gì vào đó&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Device Domain Name: Đánh tên miền mà các bạn đã đăng ký trên đầu ghi.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Đánh Username và Pass của đầu ghi hình.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Nhớ tích vào ô&amp;nbsp;&lt;strong&gt;Export to Group&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;=&amp;gt; Nhấn Add&amp;nbsp;để hoàn tất quá trình lưu lại&lt;/p&gt;\r\n\r\n&lt;p&gt;Chúc các bạn thành công&lt;/p&gt;\r\n\r\n&lt;p&gt;Mọi thắc mắc hoặc cần tư vấn giải&amp;nbsp;đáp quý khách vui lòng gọi: &lt;strong&gt;04.6328.6530 - 0962.16.3395&lt;/strong&gt;&amp;nbsp;để&amp;nbsp;được trợ giúp&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(21, 6, 'Cung cấp lắp đặt hệ thống camera quan sát và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA', '&lt;p&gt;GOLDTECH vừa hoàn thành dự án cung cấp lắp đặt hệ thống camera quan sát và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA&lt;/p&gt;\r\n', '&lt;p&gt;GOLDTECH vừa hoàn thành dự án cung cấp lắp đặt hệ thống camera quan sát và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA&lt;/p&gt;\r\n\r\n&lt;p&gt;Công Ty TNHH NOW VINA hoạt động trong ngành may mặc trang phục xuất khẩu. Địa chỉ : Khu 6 – Xã Phú Lộc – Huyện Phù Ninh – tỉnh Phú Thọ&lt;/p&gt;\r\n\r\n&lt;p&gt;Do là trong ngành may mặc nên công ty TNHH Now Vina có rất đông công nhân và xưởng sản xuất rất rộng lớn. Yêu cầu kiểm soát hoạt động của công nhân và kiểm soát giờ ra vào của công nhân được đặt ra rất cấp thiết. Vì vậy ban lãnh đạo công ty Now Vina đã liên hệ với Công Ty GOLDTECH để đặt vấn đề cần tư vấn giải pháp và lắp đặt ngay hệ thống &lt;a href=&quot;http://congnghevang.net/lap-dat-camera-quan-sat-nha-may&quot;&gt;camera giám sát nhà máy&lt;/a&gt;&amp;nbsp;và hệ thống máy chấm công vân tay&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Qua khảo sát thực địa tại nhà máy các kĩ sư của GOLDTECH nhận thấy:&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hệ thống camera quan sát chủ yếu để quan sát các vị trí trong nhà xưởng rộng lớn và quan sát tất cả các hành lang xung quanh nhà xưởng&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hệ thống máy chấm công vân tay dùng để chấm công cho khoảng 3000 công nhân ở các cửa ra vào xưởng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;lap-camera-cong-ty-now-vina&quot; src=&quot;http://congnghevang.net/image/data/nowvina.jpg&quot; style=&quot;width: 600px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;nha may nowvina&quot; src=&quot;http://congnghevang.net/image/data/nha may nowvina.jpg&quot; style=&quot;width: 700px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Từ quá trình khảo sát thực địa GOLDTECH đã lên giải pháp cho Công Ty NOW Vina:&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hệ thống &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-dahua&quot;&gt;camera quan sát DAHUA&lt;/a&gt; công nghệ cao của hãng DAHUA với tiêu chuẩn sau:&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Độ phân giải hình ảnh Full HD&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Sử dụng chân đế quay quét để quan sát được nhiều hướng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Ống kính 6mm để quan sát được xa mà vẫn đảm bảo góc nhìn tương đối rộng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Trống chịu thời tiết khắc nghiệt, chống va đập và bụi bặm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hệ thống &lt;a href=&quot;http://congnghevang.net/may-cham-cong-ronald-jack&quot;&gt;máy chấm công vân tay&lt;/a&gt; RONALD JACK với tiêu chuẩn:&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Chấm công vân tay và thẻ cảm ứng ( dùng làm thẻ nhân viên )&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Mỗi máy lưu dữ tối đa 3000 dấu vân tay&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Các máy chấm công liên kết với nhau và chia khu vực chấm công để dễ kiểm soát việc chấm công của công nhân&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; * Xuất dữ liệu ra file excel tổng hợp&lt;/p&gt;\r\n\r\n&lt;p&gt;Một số hình ảnh trong quá trình thi công lắp đặt hệ thống giám sát và hệ thống máy chấm công vân tay công ty Now Vina:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap dat camera dahua.jpg&quot; style=&quot;width: 500px; height: 700px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap camera.jpg&quot; style=&quot;width: 600px; height: 700px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap may cham cong van tay.jpg&quot; style=&quot;width: 500px; height: 700px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap dat may cham cong.jpg&quot; style=&quot;width: 600px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Trên đây là dự án cung cấp lắp đặt &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;hệ thống camera quan sát&lt;/a&gt; và hệ thống máy chấm công vân tay cho công ty TNHH NOW VINA do Công Ty TNHH GOLDTECH lắp đặt hoàn thiện. Quý khách cần tư vấn về thiết bị an ninh hoặc giải pháp camera quan sát nhà máy xin vui lòng liên hệ tới GOLDTECH &amp;nbsp;để&amp;nbsp;quý khách hàng có một “&lt;em&gt;hệ thống thiết bị an ninh ”&lt;/em&gt;&amp;nbsp;chất lượng hoàn bảo nhất, mang lại sự an toàn nhất cho quý khách.&lt;/p&gt;\r\n\r\n&lt;p&gt;Mọi chi tiết xin vui lòng liên hệ:&lt;/p&gt;\r\n\r\n&lt;p&gt;Công Ty TNHH GOLDTECH&lt;/p&gt;\r\n\r\n&lt;p&gt;Email: &lt;a href=&quot;mailto:Goldtech.jsc@gmail.com&quot;&gt;Goldtech.jsc@gmail.com&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Website:&amp;nbsp;http://congnghevang.net&lt;/p&gt;\r\n\r\n&lt;p&gt;Hotline: 0962.16.3395&lt;/p&gt;\r\n'),
(22, 6, 'Giải Pháp Camera Giám Sát Trường Học', '&lt;p style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Ở các trường học hiện nay việc theo dõi chất lượng giáo viên dạy học hay học sinh, sinh viên học hành thi cử như thế nào là rất cần thiết. Việc quản lý tốt sẽ giúp tránh được gian lận thi cử, chất lượng giảng dạy được chuyên nghiệp, hiệu quả và giải quyết những sự cố một cách nhanh chóng, kịp thời.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Chính vì vậy giải pháp&amp;nbsp;&lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt;&amp;nbsp;dành cho các trường học của chúng tôi là một giải pháp toàn diện, tiết kiệm chi phí và mang lại hiệu quả rất cao. với hệ thống này hiệu trưởng có thể quan sát và theo dõi tình trạng dạy và học của bất cứ lớp học nào mà mình muốn, có tác dụng giúp cho việc dạy và học được tốt hơn.&lt;/p&gt;\r\n', '&lt;h1&gt;Giải Pháp Camera Giám Sát Trường Học&lt;/h1&gt;\r\n\r\n&lt;p&gt;Ở các trường học hiện nay việc theo dõi chất lượng giáo viên dạy học hay học sinh, sinh viên học hành thi cử như thế nào là rất cần thiết. Việc quản lý tốt sẽ giúp tránh được gian lận thi cử, chất lượng giảng dạy được chuyên nghiệp, hiệu quả và giải quyết những sự cố một cách nhanh chóng, kịp thời.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chính vì vậy giải pháp &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt; dành cho các trường học của chúng tôi là một giải pháp toàn diện, tiết kiệm chi phí và mang lại hiệu quả rất cao. với hệ thống này hiệu trưởng có thể quan sát và theo dõi tình trạng dạy và học của bất cứ lớp học nào mà mình muốn, có tác dụng giúp cho việc dạy và học được tốt hơn.&lt;/p&gt;\r\n\r\n&lt;p&gt;Ngoài ra, nếu những hình ảnh đó được đưa lên mạng Internet thông qua thiết bị đầu ghi thì các bậc phụ huynh cũng có thể trực tiếp theo dõi con em mình khi chúng ở trường mà không cần phải đến tận nơi tạo tâm lý yên tâm cho phụ huynh học sinh.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Sơ đồ giải pháp camera quan sát trường học:&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;lap-dat-he-thong-camera-quan-sat-cho-truong-hoc&quot; src=&quot;http://congnghevang.net/image/data/llap-dat-he-thong-camera-quan-sat-cho-truong-hoc.png&quot; style=&quot;width: 953px; height: 616px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;*&lt;/strong&gt;&lt;strong&gt; Khu vực phòng học&lt;/strong&gt;&lt;br /&gt;\r\n-&amp;nbsp; Sử dụng loại camera bán cầu hồng ngoại&amp;nbsp;cố định với độ góc nhìn rộng, cho hình ảnh rõ nét với độ phân giải HD, Full HD. Có thể tích hợp thêm mic thu âm thanh giúp việc giám sát cả hình ảnh lẫn âm thanh được tối ưu.&lt;br /&gt;\r\n&lt;strong&gt;*&amp;nbsp;&lt;/strong&gt;&lt;strong&gt;Khu vực thư viện&lt;/strong&gt;&amp;nbsp;&lt;br /&gt;\r\n-&amp;nbsp; Sử dụng dòng camera bán cầu hồng ngoại&amp;nbsp;cố định nhỏ gọn gắn tại các góc phòng hoặc sử dụng dòng camera quay quét liên tục 360 độ và có khả năng zoom hình gắn ở các vị trí trung tâm&amp;nbsp;&lt;br /&gt;\r\n&lt;strong&gt;*&amp;nbsp;&lt;/strong&gt;&lt;strong&gt;Khu vực hành lang phòng học&lt;/strong&gt;&amp;nbsp;&lt;br /&gt;\r\n-&amp;nbsp; Sử dụng camera thân&amp;nbsp;cố định có chức năng hồng ngoại nhìn ban đêm, gắn dọc hành lang sẽ giúp việc quan sát đi lại hiệu quả.&lt;/p&gt;\r\n\r\n&lt;p&gt;* &lt;strong&gt;Khu vực sân trường&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng dòng camera thân hồng ngoại giám sát cả ngày lẫn đêm đảm bảo an ninh 24/24&lt;br /&gt;\r\n&lt;strong&gt;* &lt;/strong&gt;&lt;strong&gt;Khu vực cổng trường&lt;/strong&gt;&amp;nbsp;&lt;br /&gt;\r\n- Sử dụng dòng camera thân hồng ngoại giám sát cả ngày lẫn đêm đảm bảo an ninh 24/24&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;• Phần mềm chuyên nghiệp của chúng tôi sẽ giúp bạn:&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Xem hình ảnh từ máy tính, smartphone, tablet.&lt;br /&gt;\r\n- Xử lý, phân tích tín hiệu hình ảnh nhanh chóng, sắc nét.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(23, 6, 'Lắp đặt camera giám sát ', '&lt;p&gt;Goldtech Camera. Chuyên Tư vấn -&amp;nbsp;Thiết kế - Cung Cấp - Lắp Đặt - Sửa chữa Camera giám sát với chi phí rẻ nhất.&amp;nbsp;&lt;/p&gt;\r\n', '&lt;p&gt;Camera giám sát hiện nay xuất hiện trên thị trường rất nhiều với rất nhiều mẫu sản phẩm đa dạng và phong phú . Các bạn có thể lựa chọn như các loại camera giám sát trẻ em, camera giám sát công trình , camera giám sát tòa nhà, &lt;a href=&quot;http://congnghevang.net/lap-dat-camera-quan-sat-nha-may&quot;&gt;camera giám sát nhà máy&lt;/a&gt;… mỗi loại camera giám sát lại có rất nhiều kiểu dáng với các thiết kế khác nhau để phù hợp với yêu cầu của khách hàng.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;lap dat camera giam sat&quot; src=&quot;http://congnghevang.net/image/data/lap dat camera giam sat.jpg&quot; style=&quot;width: 700px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Hiện nay trên thị trường có các dòng camera chính như sau: Camera Analog ( loại camera với công nghệ cũ nhưng vẫn được bán rất nhiều ), camera AHD, camera HD-CVI, camera HD-TVI, camera IP…&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Về cơ bản thì cách lắp đặt các loại camera là giống nhau, một số dòng camera mới ra thì cách lắp đặt có hơi khác đi một chút. Tuy nhiên bạn không phải lo về vấn đề lắp đặt vì khi bạn mua một gói sản phẩm thì sẽ được công ty hỗ trợ dịch vụ lắp đặt camera giám sát cho bạn&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Chủ yếu việc chuyên lắp đặt camera giám sát được thực hiện bởi một đội ngũ chuyên nghiệp có trình độ kĩ thuật nên các bạn có thể hoàn toàn yên tâm về chất lượng của việc lắp đặt&lt;/p&gt;\r\n\r\n&lt;p&gt;Công ty GOLDTECH chuyên cung cấp, lắp đặt, sửa chữa camera quan sát. Đến với GOLDTECH bạn sẽ rất hài lòng về dịch vụ của chúng tôi&lt;/p&gt;\r\n\r\n&lt;p&gt;Quý khách hàng đang có nhu cầu lắp đặt hệ thống&lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt; camera quan sát&lt;/a&gt; hãy liên hệ ngay với chúng tôi để được tư vấn hiệu quả nhất&lt;/p&gt;\r\n\r\n&lt;p&gt;Mọi chi tiết xin vui lòng liên hệ:&lt;/p&gt;\r\n\r\n&lt;p&gt;Công Ty TNHH GOLDTECH&lt;/p&gt;\r\n\r\n&lt;p&gt;Địa chỉ: 1A – Ngõ 72 – Dịch Vọng – Cầu Giấy – Hà Nội&lt;/p&gt;\r\n\r\n&lt;p&gt;Hotline: 0962.163.395 – 0983.027.948&lt;/p&gt;\r\n\r\n&lt;p&gt;Email:&amp;nbsp;&lt;a href=&quot;mailto:goldtech.jsc@gmail.com&quot;&gt;goldtech.jsc@gmail.com&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Website: Congnghevang.net&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(24, 6, 'Lắp đặt camera quan sát trang trại chăn nuôi', '&lt;p&gt;Công Ty TNHH GOLDTECH chuyên tư vấn - thiết kế - cung cấp - lắp đặt camera quan sát cho trang trại chăn nuôi, nhà vườn, quản lý giám sát vật nuôi từ xa&lt;/p&gt;\r\n', '&lt;h1&gt;Lắp đặt camera quan sát trang trại chăn nuôi&lt;/h1&gt;\r\n\r\n&lt;p&gt;Hiện nay ngành công nghiệp chăn nuôi đang rất phát triển, có rất nhiều nhà kinh doanh đầu tư vào trang trại chăn nuôi với rất nhiều mô hình từ trang trại nhỏ đến trang trại lớn. Tuy nhiều hiện nay việc quản lý mọi khu vực của trang trại là một vấn đề rất đau đầu của các chủ trang trại. Nắm bắt được vấn đề cần thiết làm sao để quản lý trang trại chăn nuôi một cách có hiệu quả của các chủ trang trại chăn nuôi, công ty GOLDTECH chúng tôi đưa ra giải pháp cực kì hiệu quả để kiểm soát trang trại chăn nuôi đó là giải pháp &lt;a href=&quot;http://congnghevang.net/Lap-dat-camera-giam-sat&quot;&gt;lắp đặt camera giám&amp;nbsp;sát&lt;/a&gt; trang trại chăn nuôi&lt;/p&gt;\r\n\r\n&lt;h2&gt;&lt;strong&gt;1. Lợi ích của việc lắp đặt camera quan sát trang trại&lt;/strong&gt;&lt;/h2&gt;\r\n\r\n&lt;p&gt;- Phát hiện được kẻ trộm xâm nhập vào trang trại của mình.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Đảm bảo tài sản hàng hóa không bị mất cắp.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Thấy được quá trình phát triển của vật nuôi.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ tìm hiểu các nguyên nhân bệnh của vật nuôi.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Quản lý quá trình chăm sóc, thời gian cho động vật ăn uống của nhân viên, hạn chế tình trạng sao nhãng công việc và đề phòng nguy cơ tiềm ẩn.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Những vị trí cần lắp đặt camera quan sát&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;a. Cổng ra vào trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;Kiểm soát được ai ra ai vào, quá trình nhập hàng, xuất hàng&lt;/p&gt;\r\n\r\n&lt;p&gt;b. Tường bao quanh trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;Kiểm soát phát hiện kẻ gian có ý định đột nhập hay đang đột nhập vào trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;c. Lối đi lại trong trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;Kiểm soát người đi lại trong khuôn viên trang trại, kiểm soát thái độ làm việc của nhân viên trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;d. Các khu vực chuồng trại&lt;/p&gt;\r\n\r\n&lt;p&gt;Kiểm soát theo dõi quá trình sinh trưởng của vật nuôi, các hoạt động chăn nuôi của nhân viên&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;3. Cách quan sát&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Chủ trang trại có thể quan sát mọi hoạt động của trang trại qua: điện thoại smartphone, máy tính bảng, laptop, máy tính để bàn có kết nối internet hoặc quan sát trực tiếp trên màn hình tivi&lt;/p&gt;\r\n\r\n&lt;p&gt;Hiện nay công ty Goldtech chúng tôi cung cấp dòng camera quan sát Full HD chất lượng hình ảnh cực kì sắc nét mà giá cả lại vô cùng tốt, đáp ứng nhu cầu quan sát rõ nét đến từng chi tiết của chủ trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;4.&amp;nbsp;&lt;span style=&quot;font-size: 12pt; line-height: 107%; font-family: Arial, sans-serif;&quot;&gt;Mô hình lắp đặt camera giám sát trang trại&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera_quan_sat_trang_trai.jpg&quot; style=&quot;width: 600px; height: 450px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;5. Hệ thống camera quan sát cơ bản cho 1 trang trại nhỏ&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;1 camera thân HD quan sát cổng ra vào trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;4 camera thân HD quan sát 4 góc tường bao quanh trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;4 camera thân HD quan sát khu vực chuồng nuôi ( tùy theo trang trại có bao nhiêu chuồng nuôi mà thêm hay bớt &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt; )&lt;/p&gt;\r\n\r\n&lt;p&gt;4 camera quan sát lối đi lại trong khuôn viên trang trại&lt;/p&gt;\r\n\r\n&lt;p&gt;1 &lt;a href=&quot;http://congnghevang.net/dau-ghi-hinh-camera&quot;&gt;đầu ghi hình camera&lt;/a&gt; kĩ thuật số 16 kênh&lt;/p&gt;\r\n\r\n&lt;p&gt;1 ổ cứng HDD 1TB hoặc 2 TB&lt;/p&gt;\r\n\r\n&lt;p&gt;1 Nguồn tổng&lt;/p&gt;\r\n\r\n&lt;p&gt;Hệ thống dây nguồn và dây tín hiệu cho camera&lt;/p&gt;\r\n\r\n&lt;p&gt;* Hình ảnh thực tế một số công trình lắp đặt camera quan sát trang trại mà công ty Goldtech đã làm:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap_camera_trang_trai_chan_nuoi.jpg&quot; style=&quot;width: 705px; height: 529px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera-giam-sat-trang-trai.jpg&quot; style=&quot;width: 700px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Mọi chi tiết xin vui lòng liên hệ:&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Công Ty TNHH GOLDTECH&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Địa chỉ: 1A – Ngõ 72 – Dịch Vọng – Cầu Giấy – Hà Nội&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Hotline: 0962.163.395 – 0983.027.948&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Email:&amp;nbsp;&lt;a href=&quot;mailto:goldtech.jsc@gmail.com&quot; style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); text-decoration: none; cursor: pointer; outline: none; background: transparent;&quot;&gt;goldtech.jsc@gmail.com&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: &amp;quot;Source Sans Pro&amp;quot;, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Website: Congnghevang.net&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n'),
(25, 6, 'Camera wifi không dây', '&lt;p&gt;&lt;font color=&quot;#000000&quot; face=&quot;Arial, sans-serif&quot;&gt;&lt;span style=&quot;font-size: 16px; line-height: 17.12px;&quot;&gt;Camera wifi không dây có khả năng xoay 4 chiều giúp bạn điều khiển và quan sát dễ dàng theo ý muốn, có thể di chuyển dễ dàng khi bạn muốn thay đổi các vị trí quan sát&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\r\n', '&lt;h1&gt;Camera quan sát wifi không dây&lt;/h1&gt;\r\n\r\n&lt;p&gt;Từ những năm đầu tiên &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt; du nhập vào Việt Nam đến nay, chúng ta thấy sự bùng nổ và thống lĩnh thị trường của các loại camera có dây. Tuy nhiên hiện nay do nhu cầu lắp đặt và nhu cầu tiện ích cũng như thẩm mỹ ngày càng cao của người dùng dẫn đến sự ra đời của dòng camera ip không dây. Sự ra đời của camera không dây đã đánh dấu sự mở đầu cho dòng sản phẩm nhanh, gọn, nhẹ, đáp ứng được những mong muốn mà người tiêu dùng đang hướng đến&lt;/p&gt;\r\n\r\n&lt;h2&gt;Ưu điểm của việc lắp đặt camera quan sát không dây&lt;/h2&gt;\r\n\r\n&lt;p&gt;Dễ dàng lắp đặt, cài đặt trong nhà bạn hơn so với các dòng camera có dây khác&lt;/p&gt;\r\n\r\n&lt;p&gt;Tiết kiệm chi phí khi lắp đặt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nếu bạn không muốn đi dây camera chạy khắp nhà bạn thì dây là giải pháp tuyệt với có tính thẩm mỹ cao.&lt;/p&gt;\r\n\r\n&lt;p&gt;Có thể di chuyển dễ dàng khi bạn muốn thay đổi các vị trí quan sát&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera có khả năng&amp;nbsp;xoay 4 chiều giúp bạn điều khiển và quan sát dễ dàng theo ý muốn. Chỉ với một số thao tác đơn giản =&amp;gt; &quot;cắm là chạy&quot; (Plug &amp;amp; Play),&lt;/p&gt;\r\n\r\n&lt;p&gt;Không cần: Cài đặt, cấu hình, mua tên miền, mua hosting ...&lt;/p&gt;\r\n\r\n&lt;p&gt;Không cần: Đi dây vướng víu, không cần đầu ghi&lt;/p&gt;\r\n\r\n&lt;p&gt;Tất cả đều TỰ ĐỘNG &amp;amp; MIỄN PHÍ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sơ đồ lắp camera quan sát wifi không dây:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/so_do_lap_camera_wifi_khong_day.jpg&quot; style=&quot;width: 609px; height: 453px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/xem-camera-wifi-qua-dien-thoai.jpg&quot; style=&quot;width: 720px; height: 960px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;► Chỉ cần: Đặt vào vị trí cần giám sát, Kết nối với modem WIFI (hoặc dây mạng)&lt;/p&gt;\r\n\r\n&lt;p&gt;► Xem qua mạng bằng: Laptop, PC, máy tính bảng, điện thoại iPhone, Android (Samsung, LG, HTC, Oppo,...) bạn đã hoàn toàn có thể sử dụng camera để quan sát nhà mình hoặc cửa hàng kinh doanh của bạn.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Những tính năng nổi bật của &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-wifi-khong-day&quot;&gt;Camera Wifi không dây&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải 720P cho hình ảnh cực kỳ sắc nét.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ khe cắm thẻ nhớ Micro SD, max 32GB.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Điều khiển camera xoay ngang 355 độ, lên xuống 120 độ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chức năng quan sát Ngày và Đêm cho hình ảnh cực đẹp.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ âm thanh hai chiều, báo động, phát hiện chuyển động...&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ xem camera trên điện thoại di động chạy hệ điều hành Android, IOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Được thiết kế hết sức tinh xảo, nhỏ gọn tích hợp nhiều chức năng tiện dụng,&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Do có nhưng ưu điểm trên nên Camera không dây rất thích hợp trong việc giám sát Văn phòng, nhà cửa, kho tàng, cửa hàng, con cái …&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavblog_category`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `meta_keyword` varchar(255) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `meta_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `oc_pavblog_category`
--

INSERT INTO `oc_pavblog_category` (`category_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `meta_keyword`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `meta_description`, `meta_title`, `level`, `left`, `right`, `keyword`) VALUES
(1, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, -5, 34, 47, ''),
(20, 'data/pavblog/pav-c3.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', 'test test', NULL, '', '', 0, 0, 0, ''),
(21, 'data/pavblog/pav-c1.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, ''),
(23, 'data/pavblog/pav-c2.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, ''),
(27, '', 1, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '', 0, 1, 0, 99, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 'dich-vu-giai-phap'),
(28, '', 1, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '', 0, 1, 0, 99, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, 'tin-tuc');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavblog_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_pavblog_category_description`
--

INSERT INTO `oc_pavblog_category_description` (`category_id`, `language_id`, `title`, `description`) VALUES
(1, 1, 'ROOT', 'Menu Root'),
(21, 6, 'Các trang &amp; template', ''),
(21, 1, 'Pages &amp; template', ''),
(23, 6, 'Các trang &amp; template', ''),
(23, 1, 'Pages &amp; template', ''),
(20, 6, 'Các trang &amp; template', ''),
(20, 1, 'Pages &amp; template', ''),
(28, 6, 'Tin tức', ''),
(27, 6, 'Dịch vụ &amp; Giải pháp', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavblog_comment`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_blog_comment` (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_pavblog_comment`
--

INSERT INTO `oc_pavblog_comment` (`comment_id`, `blog_id`, `comment`, `status`, `created`, `user`, `email`) VALUES
(1, 19, 'Co#n1l&amp;u82d7;t agree more! The only things I would add would be 1.) posting pictures of one&amp;#8217;s fertility medication regimen for all to see, and 2.) posting pictures of nasty rashes and other bodily ailments. Nobody wants to see that sh*t. Nobody.', 0, '2016-06-13 01:38:45', 'Co#n1l&amp;u82d7;t agree more! The only things I would add would be 1.) posting pictures of one&amp;#8217;s fertility medication regimen for all to see, and 2.) posting pictures of nasty rashes and other bodily ailments. Nobody wants to see that sh*t. Nob', '699avmpj7c@mail.com'),
(2, 21, 'Fell out of bed feeling down. This has breietgnhd my day!', 0, '2016-06-13 09:41:54', 'Fell out of bed feeling down. This has breietgnhd my day!', 'vf4d6c5nsnh@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavmap_group_location`
--

CREATE TABLE IF NOT EXISTS `oc_pavmap_group_location` (
  `group_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_pavmap_group_location`
--

INSERT INTO `oc_pavmap_group_location` (`group_location_id`, `name`, `store_id`, `status`) VALUES
(1, 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavmap_location`
--

CREATE TABLE IF NOT EXISTS `oc_pavmap_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_location_id` int(11) NOT NULL,
  `link` text,
  `address` varchar(225) DEFAULT '',
  `latitude` varchar(225) DEFAULT NULL,
  `longitude` varchar(225) DEFAULT NULL,
  `icon` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_pavmap_location`
--

INSERT INTO `oc_pavmap_location` (`location_id`, `group_location_id`, `link`, `address`, `latitude`, `longitude`, `icon`, `image`, `status`) VALUES
(1, 1, '#', '', '40.712262', '-73.960538', 'data/pavmap/icons/default.png', 'data/pavmap/address/1.jpg', 1),
(2, 1, '#', '', '40.703647', '-74.010822', 'data/pavmap/icons/automotive.png', 'data/pavmap/address/2.jpg', 1),
(3, 1, '#', '', '40.706071', '-74.004201', 'data/pavmap/icons/food.png', 'data/pavmap/address/3.jpg', 1),
(4, 1, '#', '', '40.714910', '-74.011423', 'data/pavmap/icons/education.png', 'data/pavmap/address/4.jpg', 1),
(5, 1, '#', '', '40.703223', '-73.994081', 'data/pavmap/icons/shopping.png', 'data/pavmap/address/5.jpg', 1),
(6, 1, '#', '', '40.695267', '-73.995166', 'data/pavmap/icons/sports.png', 'data/pavmap/address/6.jpg', 1),
(7, 1, '#', '', '40.719068', '-74.001530', 'data/pavmap/icons/tech.png', 'data/pavmap/address/7.jpg', 1),
(8, 1, '#', '', '40.693761', '-73.988656', 'data/pavmap/icons/automotive.png', 'data/pavmap/address/8.jpg', 1),
(9, 1, '#', '', '40.705423', '-74.008616', 'data/pavmap/icons/company.png', 'data/pavmap/address/9.jpg', 1),
(10, 1, '#', '', '40.703647', '-74.001530', 'data/pavmap/icons/tech.png', 'data/pavmap/address/8.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavmap_location_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavmap_location_description` (
  `location_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_pavmap_location_description`
--

INSERT INTO `oc_pavmap_location_description` (`location_id`, `language_id`, `title`, `content`) VALUES
(3, 1, 'title 3', 'content 3'),
(3, 2, 'title 3', 'content 3'),
(1, 1, 'title 1', 'content 1'),
(1, 2, 'title 1', 'content 1'),
(2, 1, 'title 2', 'content 2'),
(2, 2, 'title 2', 'content 2'),
(5, 1, 'title 5', 'content 5'),
(5, 2, 'title 5', 'content 5'),
(6, 2, 'title 6', 'content 6'),
(6, 1, 'title 6', 'content 6'),
(7, 2, 'title 7', 'content 7'),
(7, 1, 'title 7', 'content 7'),
(8, 2, 'title 8', 'content 8'),
(8, 1, 'title 8', 'content 8'),
(9, 1, 'title 9', 'content 9'),
(9, 2, 'title 9', 'content 9'),
(4, 1, 'title 4', 'content 4'),
(4, 2, 'title 4', 'content 4'),
(10, 1, 'title 10', 'content 10'),
(10, 2, 'title 10', 'content 10');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavnewsletter_email`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `attach` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `message` text,
  `customer_group_id` int(11) DEFAULT NULL,
  `affiliate` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `product` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `defined` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `special` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `latest` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `popular` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `defined_categories` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `defined_products` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `defined_products_more` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `only_selected_language` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `to` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavnewsletter_history`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `public_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` text,
  `message` text,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavnewsletter_subscribe`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_subscribe` (
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `action` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_pavnewsletter_subscribe`
--

INSERT INTO `oc_pavnewsletter_subscribe` (`subscribe_id`, `customer_id`, `store_id`, `email`, `action`) VALUES
(1, 0, 0, 'aaa', 1),
(2, 0, 0, 'tuantvb00678@gmail.com', 1),
(3, 0, 0, 'a@gmail.com', 1),
(4, 0, 0, 'Your email address', 1),
(5, 0, 0, 'tuantv@gmail.com', 1),
(6, 0, 0, 'taipd90@gmail.com', 1),
(7, 1, 0, 'taip0422@gmail.com', 1),
(8, 0, 0, 'admin@gmail.com', 1),
(9, 0, 0, 'vana@gmail.com', 1),
(10, 3, 0, 'anh@gmail.com', 1),
(11, 0, 0, 'k@gmail.com', 1),
(12, 0, 0, 'admind@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavnewsletter_template`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `hits` tinyint(4) DEFAULT '0',
  `template_file` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavnewsletter_template_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_template_description` (
  `template_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `template_message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavoslidergroups`
--

CREATE TABLE IF NOT EXISTS `oc_pavoslidergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_pavoslidergroups`
--

INSERT INTO `oc_pavoslidergroups` (`id`, `title`, `params`) VALUES
(3, 'slide anh', 'a:28:{s:5:"title";s:9:"slide anh";s:5:"delay";s:4:"9000";s:9:"fullwidth";s:9:"fullwidth";s:5:"width";s:4:"1170";s:6:"height";s:3:"700";s:12:"touch_mobile";s:1:"1";s:13:"stop_on_hover";s:1:"1";s:12:"shuffle_mode";s:1:"1";s:14:"image_cropping";s:1:"1";s:11:"shadow_type";s:1:"0";s:14:"show_time_line";s:1:"1";s:18:"time_line_position";s:6:"bottom";s:16:"background_color";s:7:"#d9d9d9";s:6:"margin";s:7:"0px 0px";s:7:"padding";s:7:"0px 0px";s:16:"background_image";s:1:"0";s:14:"background_url";s:0:"";s:14:"navigator_type";s:6:"bullet";s:16:"navigator_arrows";s:16:"verticalcentered";s:16:"navigation_style";s:5:"round";s:17:"offset_horizontal";s:1:"0";s:15:"offset_vertical";s:1:"0";s:14:"show_navigator";s:1:"1";s:20:"hide_navigator_after";s:3:"200";s:15:"thumbnail_width";s:3:"600";s:16:"thumbnail_height";s:3:"400";s:16:"thumbnail_amount";s:2:"10";s:17:"hide_screen_width";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavosliderlayers`
--

CREATE TABLE IF NOT EXISTS `oc_pavosliderlayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `oc_pavosliderlayers`
--

INSERT INTO `oc_pavosliderlayers` (`id`, `title`, `parent_id`, `group_id`, `params`, `layersparams`, `image`, `status`, `position`) VALUES
(81, '4', 0, 3, 'a:16:{s:2:"id";s:1:"0";s:15:"slider_group_id";s:1:"3";s:12:"slider_title";s:1:"4";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"0";s:12:"slider_image";s:23:"data/Banner/banner4.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:0:{}}', 'data/Banner/banner4.jpg', 1, 0),
(76, '1', 0, 3, 'a:16:{s:2:"id";s:1:"0";s:15:"slider_group_id";s:1:"3";s:12:"slider_title";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"0";s:12:"slider_image";s:23:"data/Banner/banner1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:0:{}}', 'data/Banner/banner1.jpg', 1, 0),
(77, '2', 0, 3, 'a:16:{s:2:"id";s:1:"0";s:15:"slider_group_id";s:1:"3";s:12:"slider_title";s:1:"2";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"0";s:12:"slider_image";s:23:"data/Banner/banner2.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:0:{}}', 'data/Banner/banner2.jpg', 1, 0),
(78, '3', 0, 3, 'a:16:{s:2:"id";s:1:"0";s:15:"slider_group_id";s:1:"3";s:12:"slider_title";s:1:"3";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"0";s:12:"slider_image";s:23:"data/Banner/banner3.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:0:{}}', 'data/Banner/banner3.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=336 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(252, ' ICAM-191HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/icam-191hd.jpg', 43, 1, 860000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 13:50:55', '2016-06-02 11:05:08', 790),
(253, 'ICAM-291HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/Camera ICAM 291HD.jpg', 43, 1, 1020000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 13:54:10', '2016-06-02 11:05:50', 748),
(254, 'ICAM-491HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/icam 391hd.jpg', 43, 1, 950000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:33:22', '2016-06-02 11:06:30', 742),
(255, 'ICAM-491HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/camera Icam 491hd.jpg', 43, 1, 1130000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:34:40', '2016-06-02 11:04:22', 708),
(256, 'ICAM-691HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/icam 603iq.jpg', 43, 1, 1300000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:36:35', '2016-06-02 11:08:00', 714),
(257, 'AM-3800G', '', '', '', '', '', '', '', 1, 5, 'data/Product/bao dong AM-3800G.jpg', 0, 1, 2400000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:43:30', '0000-00-00 00:00:00', 497),
(258, 'Báo động AMOS AM-GSM74', '', '', '', '', '', '', '', 1, 5, 'data/Product/bao dong AM-GSM74.jpg', 0, 1, 0.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:47:23', '0000-00-00 00:00:00', 457),
(259, 'AM-3500G', '', '', '', '', '', '', '', 1, 5, 'data/Product/bao dong GMS-3500.jpg', 0, 1, 3100000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:51:58', '2016-04-30 19:42:13', 633),
(260, 'DVR-AH 1041HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/icam-DVR-AH_1041HD.JPG', 0, 1, 2200000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:56:27', '0000-00-00 00:00:00', 411),
(261, 'DVR-AH1081HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/DVR-AH1081HD.jpg', 0, 1, 2700000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 14:58:43', '0000-00-00 00:00:00', 473),
(262, 'ICAM-AH 1016HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/ICAM-AH 1016HD.jpg', 0, 1, 4000000.0000, 0, 0, '2016-04-22', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-23 15:03:17', '0000-00-00 00:00:00', 412),
(263, 'Camera quan sát ICAM-992IP', '', '', '', '', '', '', '', 1, 5, 'data/camera quan sat ICAM-992IP.png', 0, 1, 1300000.0000, 0, 0, '2016-04-27', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-28 20:27:03', '2016-06-02 11:11:24', 328),
(264, 'COMMAX CDV-35A', '', '', '', '', '', '', '', 1, 5, 'data/Chuong Hinh_COMMAX-CDV-35A.jpg', 0, 1, 2600000.0000, 0, 0, '2016-04-29', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-30 19:23:49', '2016-04-30 20:22:35', 347),
(265, 'COMMAX CDV - 35U', '', '', '', '', '', '', '', 1, 5, 'data/chuong hinh COMMAX-CDV-35U.jpg', 0, 1, 3500000.0000, 0, 0, '2016-04-29', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-30 19:38:19', '2016-04-30 20:21:17', 391),
(266, 'RONALD JACK X628C', '', '', '', '', '', '', '', 1, 5, 'data/May cham cong RONALD-JACK-X628-C.jpg', 0, 1, 3400000.0000, 0, 0, '2016-04-29', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-30 19:59:28', '2016-04-30 20:23:33', 328),
(267, 'RONALD JACK X628C', '', '', '', '', '', '', '', 1, 5, 'data/Ronald-Jack-X628C-ID.jpg', 46, 1, 3800000.0000, 0, 0, '2016-04-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-04-30 20:40:21', '2016-04-30 20:44:32', 344),
(268, 'RONAL JACK 4000TID-C', '', '', '', '', '', '', '', 1, 5, 'data/Ronald jack 4000TID.PNG', 46, 1, 4250000.0000, 0, 0, '2016-04-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-01 13:19:07', '2016-05-01 13:21:11', 424),
(269, 'RONALD JACK 8000T', '', '', '', '', '', '', '', 1, 5, 'data/Máy chấm công Ronald Jack 8000T.JPG', 46, 1, 3650000.0000, 0, 0, '2016-04-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-01 13:35:01', '2016-05-01 13:36:06', 370),
(270, 'DS-2CE56C0T-IRP', '', '', '', '', '', '', '', 1, 5, 'data/camera quan sat DS-2CE56C0T-IRP.png', 44, 1, 850000.0000, 0, 0, '2016-05-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-02 10:32:03', '2016-05-02 10:34:07', 573),
(271, 'DS-2CE16C0T-IRP', '', '', '', '', '', '', '', 1, 5, 'data/camera DS-2CE16C0T-IR.png', 44, 1, 850000.0000, 0, 0, '2016-05-02', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-03 21:30:50', '2016-05-03 21:33:06', 526),
(272, 'DS-2CE16C0T-IT3', '', '', '', '', '', '', '', 1, 5, 'data/Camera DS-2CE16C0T-IT3.png', 44, 1, 1300000.0000, 0, 0, '2016-05-02', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-03 21:46:51', '2016-05-03 21:47:41', 460),
(273, 'DS-2CE56C0T-IT3', '', '', '', '', '', '', '', 1, 5, 'data/Camera DS-2CE56D1T-IT3.png', 44, 1, 1275000.0000, 0, 0, '2016-05-02', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-03 21:59:04', '0000-00-00 00:00:00', 506),
(274, 'Dahua HAC-HDW1000RP', '', '', '', '', '', '', '', 1, 5, 'data/Camera Dahua HAC-HDW1000RP.jpg', 45, 1, 840000.0000, 0, 0, '2016-05-04', 100.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-05 21:45:56', '0000-00-00 00:00:00', 604),
(275, 'Dahua HAC-HFW1000RP', '', '', '', '', '', '', '', 1, 5, 'data/Camera Dahua HAC-HFW1000RP.jpg', 45, 1, 850000.0000, 0, 0, '2016-05-04', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-05 21:55:30', '0000-00-00 00:00:00', 442),
(276, ' DAHUA HAC-HDW1000MP', '', '', '', '', '', '', '', 1, 5, 'data/Camera Dahua HAC-HDW1000RP.jpg', 45, 1, 1060000.0000, 0, 0, '2016-05-06', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-07 16:22:23', '0000-00-00 00:00:00', 330),
(277, 'Dahua HAC-HFW1000SP', '', '', '', '', '', '', '', 1, 5, 'data/Camera Dahua HAC-HFW1000SP.jpg', 45, 1, 1120000.0000, 0, 0, '2016-05-06', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-07 16:32:58', '0000-00-00 00:00:00', 576),
(278, 'Dahua HAC-HDBW2120EP', '', '', '', '', '', '', '', 1, 5, 'data/HAC-HDBW2120EP.jpg', 45, 1, 2800000.0000, 0, 0, '2016-05-06', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-07 16:48:52', '0000-00-00 00:00:00', 347),
(279, 'Hikvision DS-2CE16C0T-IT5', '', '', '', '', '', '', '', 1, 5, 'data/DS-2CE16C0T-IT5.png', 44, 1, 1400000.0000, 0, 0, '2016-05-07', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-08 16:04:10', '0000-00-00 00:00:00', 381),
(280, 'Hikvision DS-2CE56C2T-IT3', '', '', '', '', '', '', '', 1, 5, 'data/camera hikvision DS-2CE56C2T-IT3.jpg', 44, 1, 1500000.0000, 0, 0, '2016-05-07', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-08 16:18:49', '0000-00-00 00:00:00', 392),
(281, 'Hikvision DS-2CE16C2T-IT3', '', '', '', '', '', '', '', 1, 5, 'data/Camera DS-2CE16C2T-IT3.png', 44, 1, 1500000.0000, 0, 0, '2016-05-07', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-08 16:30:35', '2016-05-08 16:49:45', 343),
(282, 'HIKVISION DS-2CE56D1T-IR', '', '', '', '', '', '', '', 1, 5, 'data/Camera-HD-TVI-HIKVISION-DS-2CE56D1T-IR.png', 44, 1, 1300000.0000, 0, 0, '2016-05-07', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-08 16:44:57', '0000-00-00 00:00:00', 382),
(283, 'ICAM 371HD', '', '', '', '', '', '', '', 1, 5, 'data/camera ICAM 371HD.png', 43, 1, 850000.0000, 0, 0, '2016-05-19', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-20 15:19:29', '2016-06-02 10:43:20', 447),
(284, 'ICAM 381HD', '', '', '', '', '', '', '', 1, 5, 'data/Camera ICAM 381HD.png', 43, 1, 870000.0000, 0, 0, '2016-05-19', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-20 15:27:52', '2016-06-02 10:45:21', 425),
(285, 'AST 02S ', '', '', '', '', '', '', '', 1, 5, 'data/Cong tac cam bien chuyen dong AST 02S.png', 0, 1, 385000.0000, 0, 0, '2016-05-21', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-22 11:50:51', '2016-05-22 11:53:50', 193),
(286, 'HIKVISION DS-7104HGHI-E1', '', '', '', '', '', '', '', 1, 5, 'data/u Camera DS-7104HGHI-E1.png', 44, 1, 1800000.0000, 0, 0, '2016-05-23', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-24 20:20:05', '2016-05-24 20:41:33', 286),
(287, 'Hikvision DS-7216HGHI-E1', '', '', '', '', '', '', '', 1, 5, 'data/u ghi hình DS-7216HGHI-E1.jpg', 44, 1, 5200000.0000, 0, 0, '2016-05-23', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-24 20:39:35', '2016-05-24 20:42:15', 303),
(288, 'Hikvision DS-7204HGHI-SH', '', '', '', '', '', '', 'Hà Nội', 1, 5, 'data/u ghi Camera DS-7216HGHI-E1.png', 44, 1, 2850000.0000, 0, 0, '2016-05-23', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-24 20:58:20', '0000-00-00 00:00:00', 318),
(289, 'YLI YM-280LED', '', '', '', '', '', '', 'Hà nội', 1, 5, 'data/Khoa cua tu YM-280LED.jpg', 60, 1, 1150000.0000, 0, 0, '2016-05-24', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-25 15:44:07', '2016-05-25 16:08:09', 216),
(290, 'YM-280DLED', '', '', '', '', '', '', '', 1, 5, 'data/Yli-YM-280dled.jpg', 60, 1, 1980000.0000, 0, 0, '2016-05-24', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-25 16:05:53', '2016-05-25 16:08:21', 167),
(291, 'YM-750LED', '', '', '', '', '', '', '', 1, 5, 'data/khoa tu YM-750LED.jpg', 60, 1, 2650000.0000, 0, 0, '2016-05-24', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-25 16:34:44', '0000-00-00 00:00:00', 179),
(292, 'GLTECH GLP - HD12', '', '', '', '', '', '', '', 1, 5, 'data/camera GLP_HD12M.jpg', 61, 1, 850000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 10:50:38', '0000-00-00 00:00:00', 195),
(293, 'GLTECH GLP - HD12M', '', '', '', '', '', '', '', 1, 5, 'data/camera GLP_HD12M.jpg', 61, 1, 1050000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 10:58:14', '0000-00-00 00:00:00', 218),
(294, 'GLTECH GLP-HD1P ', '', '', '', '', '', '', '', 1, 5, 'data/GLP-HD1P.jpg', 61, 1, 1280000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 11:09:21', '0000-00-00 00:00:00', 199),
(295, 'GLTECH GLP-HD13', '', '', '', '', '', '', '', 1, 5, 'data/camera glp- hd13.jpg', 61, 1, 980000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 11:20:56', '0000-00-00 00:00:00', 201),
(296, 'GLP-HD13M ', '', '', '', '', '', '', '', 1, 5, 'data/camera glp- hd13.jpg', 61, 1, 1180000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 11:33:13', '0000-00-00 00:00:00', 198),
(297, 'RONALD JACK X88', '', '', '', '', '', '', '', 1, 5, 'data/Máy chấm công Ronald Jack X88.JPG', 46, 1, 3050000.0000, 0, 0, '2016-05-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-26 15:56:17', '0000-00-00 00:00:00', 251),
(298, 'Commax CDV-43N', '', '', '', '', '', '', '', 1, 5, 'data/COMMAX-CDV-43N.jpg', 56, 1, 3830000.0000, 0, 0, '2016-05-26', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-27 10:02:49', '2016-05-27 13:58:18', 244),
(299, 'Commax CDV-43Q', '', '', '', '', '', '', '', 1, 5, 'data/cdv 43q.png', 56, 1, 3850000.0000, 0, 0, '2016-05-26', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-27 13:57:43', '2016-05-27 14:10:54', 246),
(300, 'Commax CDV-70K', '', '', '', '', '', '', '', 1, 5, 'data/Chuong Hinh_COMMAX-CDV-70K.jpg', 56, 1, 4650000.0000, 0, 0, '2016-05-26', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-27 14:10:25', '0000-00-00 00:00:00', 253),
(301, 'KCE-SPTIA6024', '', '', '', '', '', '', '', 1, 5, 'data/kce-sptia6624-500x500.png', 49, 1, 2000000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 15:04:28', '2016-05-31 16:37:29', 254),
(302, 'KCE-DTIA6024', '', '', '', '', '', '', '', 1, 5, 'data/KCE-DSPTI6524.jpg', 49, 1, 2300000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 15:11:56', '2016-05-31 16:32:48', 249),
(303, 'KCE-SDTIA6030D', '', '', '', '', '', '', '', 1, 5, 'data/kce-sdtia6630v.jpg', 49, 1, 2700000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 15:19:07', '2016-05-31 16:38:59', 245),
(304, 'KCE-EBTIA6636CB', '', '', '', '', '', '', '', 1, 5, 'data/Camera-AHD-KCE-EBTIA6636CB.jpg', 49, 1, 2300000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 15:34:49', '0000-00-00 00:00:00', 249),
(305, 'KCE-SBTIA6054CB', '', '', '', '', '', '', '', 1, 5, 'data/Camera-AHD-KCE-EBTIA6054CB.jpg', 49, 1, 2700000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 16:19:56', '0000-00-00 00:00:00', 246),
(306, 'KCE-CBTIA6048D', '', '', '', '', '', '', '', 1, 5, 'data/kce-cbtia6048d.jpg', 0, 1, 4000000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 16:28:34', '2016-05-31 16:40:00', 236),
(307, 'ICAM-193HD', '', '', '', '', '', '', '', 1, 5, 'data/icam 191hd.jpg', 43, 1, 980000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 16:49:30', '2016-06-02 10:56:29', 427),
(308, ' ICAM-194HD', '', '', '', '', '', '', '', 1, 5, 'data/icam 191hd.jpg', 43, 1, 1200000.0000, 0, 0, '2016-05-30', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-05-31 16:57:45', '2016-06-02 11:00:51', 385),
(309, 'AM-323', '', '', '', '', '', '', '', 1, 5, 'data/en op tran cam ung hong ngoai.png', 55, 1, 450000.0000, 0, 0, '2016-05-31', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-01 08:34:54', '0000-00-00 00:00:00', 184),
(310, 'AM 326', '', '', '', '', '', '', '', 1, 5, 'data/den cam ung op tran AM326.png', 55, 1, 450000.0000, 0, 0, '2016-05-31', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-01 08:44:53', '0000-00-00 00:00:00', 195),
(311, 'AM-SS68', '', '', '', '', '', '', '', 1, 5, 'data/cong tac cam ung AM-SS68.png', 55, 1, 200000.0000, 0, 0, '2016-05-31', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-01 08:54:13', '0000-00-00 00:00:00', 176),
(312, 'AM-S37', '', '', '', '', '', '', '', 1, 5, 'data/cong-tac-den-cam-ung-gan-am-tuong-ams37.jpg', 55, 1, 300000.0000, 0, 0, '2016-05-31', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-01 09:20:30', '0000-00-00 00:00:00', 180),
(313, 'ICAM-293HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/Camera ICAM 291HD.jpg', 43, 1, 1200000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 10:20:32', '2016-06-02 10:58:29', 331),
(314, 'ICAM-294HD', '', '', '', '', '', '', '', 1, 5, 'data/Product/Camera ICAM 291HD.jpg', 43, 1, 1380000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 10:29:07', '2016-06-02 11:00:06', 227),
(315, 'ICAM-393HD', '', '', '', '', '', '', '', 1, 5, 'data/icam-393hd.jpg', 43, 1, 1060000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 10:40:56', '0000-00-00 00:00:00', 348),
(316, 'ICAM-493HD', '', '', '', '', '', '', '', 1, 5, 'data/icam 493hd.gif', 43, 1, 1100000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 11:20:39', '0000-00-00 00:00:00', 365),
(317, 'KBVISION KB-1001C', '', '', '', '', '', '', '', 1, 5, 'data/camera KBVISION-KB-1001C.jpg', 62, 1, 900000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:06:08', '2016-06-02 15:34:44', 238),
(318, 'KBVISION KB-1002C', '', '', '', '', '', '', '', 1, 5, 'data/camera KBVISION-KB-1002C.jpg', 62, 1, 850000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:14:11', '2016-06-02 15:36:15', 230),
(319, 'KBVISION KB-1003C', '', '', '', '', '', '', '', 1, 5, 'data/camera_kb_1003c.jpg', 62, 1, 800000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:24:42', '2016-06-02 15:37:11', 231),
(320, 'KBVISION KB-1301C', '', '', '', '', '', '', '', 1, 5, 'data/KBVISION-KB-1301C.jpg', 62, 1, 1200000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:32:58', '0000-00-00 00:00:00', 220),
(321, 'KBVISION KB-1303C', '', '', '', '', '', '', '', 1, 5, 'data/camera_KBVISION-KB-1303C.png', 62, 1, 1950000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:45:03', '2016-06-02 16:19:57', 221),
(322, 'KBVISION KB-1302C', '', '', '', '', '', '', '', 1, 5, 'data/camera KBVISION-KB-1302c.jpg', 62, 1, 1300000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 15:53:08', '2016-06-02 16:18:46', 231),
(323, 'KBVISION KB-1305C', '', '', '', '', '', '', '', 1, 5, 'data/camera_KBVISION-KB-1305C.jpg', 62, 1, 2590000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 16:00:13', '2016-06-02 16:20:43', 228),
(324, 'KBVISION KB-2001C', '', '', '', '', '', '', '', 1, 5, 'data/Camera_KBVISION-KB-2001C.jpg', 62, 1, 1800000.0000, 0, 0, '2016-06-01', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-02 16:08:40', '2016-06-02 16:11:04', 232),
(325, ' STC-3124 ', '', '', '', '', '', '', '', 1, 5, 'data/camera samtech STC-3124.gif', 48, 1, 700000.0000, 0, 0, '2016-06-12', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-13 10:27:26', '2016-06-13 10:39:12', 187),
(326, 'STC-5136  ', '', '', '', '', '', '', '', 1, 5, 'data/Camera STC-5136.gif', 48, 1, 800000.0000, 0, 0, '2016-06-12', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-13 10:37:59', '0000-00-00 00:00:00', 166),
(327, 'STC 3010', '', '', '', '', '', '', '', 1, 5, 'data/Samtech STC 3010.gif', 48, 1, 750000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 09:41:36', '0000-00-00 00:00:00', 179),
(328, 'STC-3110  ', '', '', '', '', '', '', '', 1, 5, 'data/samtech_stc_3110.gif', 48, 1, 950000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 09:51:30', '0000-00-00 00:00:00', 169),
(329, ' STC-6310 ', '', '', '', '', '', '', '', 1, 5, 'data/Samtech STC-6310.gif', 48, 1, 950000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 10:02:39', '0000-00-00 00:00:00', 159),
(330, 'STC-3610 ', '', '', '', '', '', '', '', 1, 5, 'data/samtech_stc_3610.jpg', 48, 1, 1050000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 10:12:13', '2016-06-14 10:13:19', 167),
(331, 'STC-304G  ', '', '', '', '', '', '', '', 1, 5, 'data/camera_samtech_304g.gif', 48, 1, 1150000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 10:44:14', '0000-00-00 00:00:00', 159),
(332, 'STC-312G ', '', '', '', '', '', '', '', 1, 5, 'data/camera_stc_312g.gif', 48, 1, 1150000.0000, 0, 0, '2016-06-13', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-06-14 10:55:34', '0000-00-00 00:00:00', 167),
(333, 'HAC-HDW1200M', '', '', '', '', '', '', '', 1, 5, 'data/HAC_HDW1200M.jpg', 45, 1, 0.0000, 0, 0, '2016-07-05', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-07-06 20:26:03', '2016-07-06 20:28:37', 13),
(334, 'Dahua HAC-HFW1200RMP', '', '', '', '', '', '', '', 1, 5, 'data/HAC-HFW1200RMP.jpg', 45, 1, 0.0000, 0, 0, '2016-07-05', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-07-06 20:49:18', '2016-07-06 20:50:54', 9),
(335, ' Dahua HAC-HFW1200S', '', '', '', '', '', '', '', 1, 5, 'data/HAC-HFW1200S.jpg', 45, 1, 0.0000, 0, 0, '2016-07-05', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2016-07-06 21:02:05', '0000-00-00 00:00:00', 14);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(257, 6, 'Báo động AMOS AM-3800G', '&lt;p&gt;Hệ thống báo trộm không dây dùng SIM điện thoại di động phiên bản nâng cấp của GSM 3500. Thiết kế nhỏ gọn với anten gắn trong, sang trọng, sơn tĩnh điện.&lt;br /&gt;\r\nHỗ trợ 6 zone không dây, 4 zone có dây. Mở rộng 150 cảm biến không dây&lt;br /&gt;\r\nKhi có trộm đột nhập vào vùng kiểm soát, bộ Kiểm Soát Trung Tâm sẽ kích hoạt hụ còi, đồng thời thực hiện 5 cuộc gọi &amp;amp; 3 tin nhắn tới só cài đặt trước. Điều khiển tắt mở từ xa bằng &amp;nbsp;điện thoại.&lt;br /&gt;\r\nthực hiện cuộc gọi khẩn cấp và gởi tin nhắn khi hệ thống bị kích hoạt báo động. Hổ trợ 3 băng tần 900 / 1800 / 1900MHz. &amp;nbsp;&lt;br /&gt;\r\n- Thay đổi được nội dung tin nhắn SMS thông báo ( VD: cua so tang 2)&lt;br /&gt;\r\n- Thông báo vào điện thoại khi bị cắt điện lưới&lt;br /&gt;\r\n&amp;nbsp;Hệ Thống Báo Trộm, gồm: 1 tủ trung tâm, 1 cảm biến hồng ngoại, 1 cảm biến gắn cửa, 2 remote, 01 Anten, tích hợp ắc quy cấp nguồn và tự động sạc lại khi mất điện, 1 còi 110 dB., adapter 12v&lt;br /&gt;\r\nCó hướng dẫn tiếng Việt. Cài đặt và sử dụng dễ dàng. Có phần mềm sử dụng tiếng Việt trên ĐTDĐ&lt;/p&gt;\r\n', '', '', ''),
(258, 6, 'Báo động chống trộm AM-GSM74', '&lt;p&gt;Màn hình LCD, kiểu dáng sang trọng, độ bền cao, cài đặt đơn giản&lt;br /&gt;\r\n- Hỗ trợ phần mềm tiếng Việt AMOS trên ĐTDĐ&lt;br /&gt;\r\n- Hỗ trợ đồng thời sử dụng SIM GSM và PSTN (SIM + ĐT bàn)&lt;br /&gt;\r\n- Thay đổi được nội dung tin nhắn SMS thông báo ( VD: cua so tang 2)&lt;br /&gt;\r\n- Mở rộng 99 khu vực không dây và 4 khu vực có dây&lt;br /&gt;\r\n- Cài đặt các vùng ở nhiều chế độ khác nhau ( At home, Away, intelligent, chuông báo khách...)&lt;br /&gt;\r\n- Các vùng &amp;nbsp;báo động có thể Cài đặt thời gian tự động kích hoạt và tự động hủy bỏ theo tuần, ngày với lịch đặt sẵn&lt;br /&gt;\r\n- Có thể tắt mở từ xa bằng di động thông qua cuộc gọi và tin nhắn&lt;br /&gt;\r\n- Có thể đối thoại 2 chiều, tắt mở còi thông qua cuộc gọi&amp;nbsp;&lt;br /&gt;\r\n- Cài đặt được 6 nhóm số điện thoại, 6 tin nhắn, 3 nhóm điện thoại khẩn cấp&lt;br /&gt;\r\n- Có Pin tự sạc dự phòng khi bị mất điện&lt;br /&gt;\r\n- &amp;nbsp;Khoảng cách không dây lên tới 100m&lt;br /&gt;\r\nHệ Thống Báo Trộm, gồm: 1 tủ trung tâm, 1 cảm biến hồng ngoại, 1 cảm biến gắn cửa, 2 remote, tích hợp ắc quy cấp nguồn và tự động sạc lại khi mất điện, 1 còi 110 dB, adapter 12V-1A&lt;br /&gt;\r\nCó hướng dẫn tiếng Việt. Cài đặt và sử dụng dễ dàng&amp;nbsp;&lt;/p&gt;\r\n', '', '', ''),
(259, 6, 'Báo động chống trộm AM-3500G', '&lt;p&gt;Hệ thống báo trộm không dây dùng SIM điện thoại di động.&lt;br /&gt;\r\n&amp;nbsp;Hỗ trợ 6 zone không dây, 4 zone có dây. Mở rộng 99 cảm biến không dây&lt;br /&gt;\r\nKhi có trộm đột nhập vào vùng kiểm soát, bộ Kiểm Soát Trung Tâm sẽ kích hoạt hụ còi, đồng thời thực hiện 5 cuộc gọi &amp;amp; 3 tin nhắn tới só cài đặt trước. Điều khiển tắt mở từ xa bằng &amp;nbsp;điện thoại.&lt;br /&gt;\r\nthực hiện cuộc gọi khẩn cấp và gởi tin nhắn khi hệ thống bị kích hoạt báo động. Hổ trợ 3 băng tần 900 / 1800 / 1900MHz. &amp;nbsp;&lt;br /&gt;\r\n- Thay đổi được nội dung tin nhắn SMS thông báo ( VD: cua so tang 2)&lt;br /&gt;\r\n- Thông báo vào điện thoại khi bị cắt điện lưới&lt;br /&gt;\r\n&amp;nbsp;Hệ Thống Báo Trộm, gồm: 1 tủ trung tâm, 1 cảm biến hồng ngoại, 1 cảm biến gắn cửa, 2 remote, 01 Anten, tích hợp ắc quy cấp nguồn và tự động sạc lại khi mất điện, 1 còi 110 dB., adapter 12v&lt;br /&gt;\r\nCó hướng dẫn tiếng Việt. Cài đặt và sử dụng dễ dàng. Có phần mềm sử dụng tiếng Việt trên ĐTDĐ&lt;/p&gt;\r\n', '', '', ''),
(260, 6, 'Đầu ghi hình ICAM DVR-AH 1041HD', '&lt;p&gt;&amp;nbsp;Ghi hình và hiển thị 4 kênh 720p AHD/960H video inputs (Hi3520D)&lt;br /&gt;\r\n* Video output : &amp;nbsp;1 ch VGA /1 ch HDMI (1920*1080) 1ch AV&lt;br /&gt;\r\n* Audio in/out : &amp;nbsp; 1ch/1ch RCA&lt;br /&gt;\r\n* Màn hình hiển thị độ phân giải :720p@ 25fps&lt;br /&gt;\r\n* Chuẩn ghi hình 4 kênh 720p@30fps &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;* Ghi hình chuẩn HD 720p@ 25fps &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br /&gt;\r\n* Playback: 1/4 ch playback, &amp;nbsp;1ch real time&amp;nbsp;&lt;br /&gt;\r\n* Hỗ trợ ổ cứng: 1x 4TB &quot;&amp;nbsp;&lt;br /&gt;\r\n* Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n', '', '', ''),
(261, 6, 'Đầu Ghi Hình ICAM DVR-AH1081HD', '&lt;p&gt;Ghi hình và hiển thị 8 kênh 720p AHD/960H video inputs (Hi3520D)&lt;br /&gt;\r\n* Video output : &amp;nbsp;1 ch VGA /1 ch HDMI (1920*1080) 1ch AV&lt;br /&gt;\r\n* Audio in/out : &amp;nbsp; 1ch/1ch RCA&lt;br /&gt;\r\n* Màn hình hiển thị độ phân giải :720p@ 25fps&lt;br /&gt;\r\n* Chuẩn ghi hình 8 kênh 720p@ 30fps &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; * Ghi hình chuẩn HD 720p@ 25fps &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br /&gt;\r\n* Playback: 1/4 ch playback, &amp;nbsp;1ch real time&amp;nbsp;&lt;br /&gt;\r\n* Hỗ trợ ổ cứng: 1x 4TB &quot;&amp;nbsp;&lt;br /&gt;\r\n* Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n', '', '', ''),
(262, 6, 'Đầu Ghi Hình ICAM-AH 1016HD', '&lt;p&gt;Ghi hình và hiển thị 16 kênh 720p AHD/960H video inputs (Hi3520D)&lt;br /&gt;\r\n* Video output : &amp;nbsp;1 ch VGA /1 ch HDMI (1920*1080) 1ch AV&lt;br /&gt;\r\n* Audio in/out : &amp;nbsp; 1ch/1ch RCA&lt;br /&gt;\r\n* Màn hình hiển thị độ phân giải :720p@ 25fps&lt;br /&gt;\r\n* Chuẩn ghi hình 16 kênh 720p@30fps&lt;/p&gt;\r\n\r\n&lt;p&gt;* Ghi hình chuẩn HD 720p@ 25fps&amp;nbsp;&lt;br /&gt;\r\n* Playback: 1/4 ch playback, &amp;nbsp;1ch real time&amp;nbsp;&lt;br /&gt;\r\n* Hỗ trợ 2 ổ cứng x 4TB&lt;br /&gt;\r\n* Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n', '', '', ''),
(263, 6, 'Camera Quan Sát ICAM-992IP', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;ICAM-992IP&lt;/strong&gt; là camera IP không dây thông minh theo tiêu chuẩn kỹ thuật tiên tiến.&lt;br /&gt;\r\nCamera ICAM-992IP có khả năng xoay 4 chiều giúp bạn điều khiển và quan sát dễ dàng theo ý muốn. Chỉ với một số thao tác đơn giản =&amp;gt; &quot;cắm là chạy&quot; (Plug &amp;amp; Play), bạn đã hoàn toàn có thể sử dụng camera để quan sát nhà mình hoặc cửa hàng kinh doanh của bạn.&amp;nbsp;&lt;br /&gt;\r\n&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera quan sat ICAM-992IP.png&quot; style=&quot;width: 500px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Những tính năng nổi bật của Camera ICAM-992IP :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải 720P cho hình ảnh cực kỳ sắc nét.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ khe cắm thẻ nhớ Micro SD, max 32GB.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Điều khiển camera xoay ngang 355 độ, lên xuống 120 độ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chức năng quan sát Ngày và Đêm cho hình ảnh cực đẹp.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Số đèn leds hồng ngoại 11 LEDs, tầm quan sát hồng ngoại 10m.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ âm thanh hai chiều, báo động, phát hiện chuyển động...&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hỗ trợ xem camera trên điện thoại di động chạy hệ điều hành Android, IOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tích hợp Wifi không dây chuẩn IEEE 802.11b/g&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lắp đặt dễ dàng, hỗ trợ bảo mật WEP &amp;amp; WPA &amp;amp; WPA2 Encryption&lt;/p&gt;\r\n\r\n&lt;p&gt;- Được thiết kế hết sức tinh xảo, nhỏ gọn tích hợp nhiều chức năng tiện dụng,&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-992IP là camera IP không dây thông minh theo tiêu chuẩn kỹ thuật tiên tiến.', 'camera quan sat, camera khong day, camera ip, camera wifi', 'Camera quan sat, camera ip, camera khong day, camera ICAM'),
(316, 6, 'Camera quan sát ICAM-493HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-493HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-quan-sat-icam-493hd&quot; src=&quot;http://congnghevang.net/image/data/icam 493hd.gif&quot; style=&quot;width: 800px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u style=&quot;line-height: 1.6em;&quot;&gt;&lt;strong&gt;Thông số kĩ thật&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;line-height: 20.8px;&quot;&gt;Camera quan sát ICAM-493HD:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera thân ngoài trời hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 4mm(6,8,12,16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-493HD Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P', 'camera quan sat, camera icam, camera icam 493hd, camera than, camera hong ngoai', 'camera quan sat, camera icam, camera icam 493hd, camera than, camera hong ngoai'),
(264, 6, 'Màn Hình Màu Chuông Cửa COMMAX CDV-35A', '&lt;p&gt;&lt;strong&gt;Màn Hình Màu Chuông Cửa COMMAX CDV - 35A&lt;/strong&gt;&lt;br /&gt;\r\nMàn hình màu 3.5&quot; LCD Digital, không tay nghe&lt;br /&gt;\r\n- Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét&lt;br /&gt;\r\n- Thiết kế đẹp hiện đại với mặt kính cường lực trong suốt chống va đập và&lt;br /&gt;\r\ntrầy xước tốt kết hợp với phím bấm cảm ứng có đèn nền khi chạm vào&lt;br /&gt;\r\n- Âm thanh to rõ trung thực,có các phím điều chỉnh âm lượng&lt;br /&gt;\r\n- Kết hợp với khóa điện từ để mở cửa&lt;br /&gt;\r\n- Kết nối 2 camera gọi cửa ở hai cổng khác nhau&lt;br /&gt;\r\n- Kết nối mở rộng thêm tay nghe phụ (DP-4VHP)&lt;br /&gt;\r\n- Kết nối 4 dây khoảng cách từ camera cửa đến màn hình là 50m(dây&lt;br /&gt;\r\nÆ0.65mm)&lt;br /&gt;\r\n- Nguồn 110~240 VAC.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kích thước 245x175x46mm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành : 12 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-indent: -24px; &quot;&gt;-&lt;/p&gt;\r\n', 'Màn Hình Màu Chuông Cửa COMMAX CDV-35A', 'chuong cua co hinh, chuông cửa có hình, màn hình chuong cua, chuong cua co hinh commax,    \r\nchuong hinh, commax', 'chuong cua co hinh, chuong cua co hinh commax, chuong hinh commax'),
(265, 6, 'Màn hình màu chuông cửa COMMAX CDV - 35U', '&lt;p&gt;- Màn hình màu chuông cửa COMMAX CDV-35U&lt;/p&gt;\r\n\r\n&lt;p&gt;-Màn hình màu 3.5&quot; LCD Digital, không tay nghe&lt;/p&gt;\r\n\r\n&lt;p&gt;- Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét&lt;br /&gt;\r\n- Thiết kế đẹp hiện đại với mặt kính cường lực trong suốt chống va đập và&lt;br /&gt;\r\ntrầy xước tốt kết hợp với phím bấm cảm ứng có đèn nền khi chạm vào&lt;br /&gt;\r\n- Âm thanh to rõ trung thực,có các phím điều chỉnh âm lượng&lt;br /&gt;\r\n- Kết hợp với khóa điện từ để mở cửa&lt;br /&gt;\r\n- Kết nối 2 camera gọi cửa ở hai cổng khác nhau&lt;br /&gt;\r\n- Kết nối mở rộng thêm tay nghe phụ (DP-4VHP)&lt;br /&gt;\r\n- Kết nối 4 dây khoảng cách từ camera cửa đến màn hình là 50m(dây&lt;br /&gt;\r\nÆ0.65mm)&lt;br /&gt;\r\n- Nguồn 110~240 VAC.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành: 12 tháng&lt;/p&gt;\r\n', '', 'chuong cua co hinh, chuong cua commax, chuong hinh', 'chuong cua co hinh, chuong cua co hinh commax'),
(266, 6, 'Máy Chấm Công RONALD JACK X628C', '&lt;p align=&quot;center&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- MÁY CHẤM CÔNG VÂN TAY RONALD JACK X628C&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tích hợp nhiều dấu vân tay.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Dung lượng lưu trữ &lt;u&gt;3000&lt;/u&gt; dấu vân tay.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Dung lượng bộ nhớ trong máy&lt;u&gt; 100.000&lt;/u&gt;&amp;nbsp;lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng Chip xử lý intel của mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốc độ xử lý rất nhanh&amp;lt;1 giây/1 lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phát ra giọng nói bằng ngôn ngữ: &lt;strong&gt;Tiếng anh &amp;amp; Tiếng việt.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Có Password bảo vệ máy, chế độ hẹn giờ tắt máy, Stand by&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối với máy tính qua cổng RS – 232/485, TCP/IP&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Lấy dữ liệu qua USB hoặc từ máy tính&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- DỮ LIỆU QUA MẠNG INTERNET&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hiển thị tên người sử dụng trên máy khi chấm công&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;em&gt;&lt;u&gt;Ưu điểm: &lt;/u&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Sử dụng vân tay &lt;/strong&gt;&lt;strong&gt;&lt;em&gt;à&lt;/em&gt;&lt;/strong&gt;&lt;strong&gt;&lt;em&gt;tiết kiệm chi phí đầu tư&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo mật cao: không chấm công dùm được.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Phần mềm quản lý nhân viên, số vân tay, giờ công, ....&lt;/strong&gt;&lt;strong&gt; được xuất ra file excel để tính lương.....&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Tặng phần mềm chấm công chuyên nghiệp&lt;/strong&gt;&lt;/p&gt;\r\n', '', 'may cham cong van tay, may cham cong, cham cong van tay , ronald jack', 'may cham cong, may cham cong van tay, may cham cong ronald jack x628c'),
(267, 6, 'Máy Chấm Công Vân Tay Và Thẻ Cảm Ứng RONALD JACK X628C', '&lt;p&gt;&lt;strong&gt;Máy Chấm Công Vân Tay &amp;amp; Thẻ​&amp;nbsp;Cảm Ứng RONALD JACK X628C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/May cham cong RONALD-JACK-X628-C.jpg&quot; style=&quot;width: 550px; height: 382px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;em&gt;&lt;u&gt;Tính năng:&lt;/u&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tích hợp nhiều dấu vân tay.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Dung lượng lưu trữ &lt;u&gt;3000&lt;/u&gt; dấu vân tay.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Dung lượng bộ nhớ trong máy &lt;u&gt;100.000&lt;/u&gt;&amp;nbsp;lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng Chip xử lý intel của Mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốc độ xử lý rất nhanh&amp;lt;1 giây/1 lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phát ra giọng nói bằng ngôn ngữ: &lt;strong&gt;Tiếng anh &amp;amp; Tiếng việt.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Có Password bảo vệ máy, chế độ hẹn giờ tắt máy, Stand by&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối với máy tính qua cổng RS – 232/485, TCP/IP&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Lấy dữ liệu qua USB hoặc từ máy tính&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- DỮ LIỆU QUA MẠNG INTERNET&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Hiển thị tên người sử dụng trên máy khi chấm công&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Pin lưu trữ dữ liệu khi mất&amp;nbsp;điện&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;em&gt;&lt;u&gt;Ưu điểm: &lt;/u&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Sử dụng vân tay &lt;/strong&gt;&lt;strong&gt;&lt;em&gt;à&lt;/em&gt;&lt;/strong&gt;&lt;strong&gt;&lt;em&gt;tiết kiệm chi phí đầu tư&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo mật cao: không chấm công dùm được.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Phần mềm quản lý nhân viên, số vân tay, giờ công, ....&lt;/strong&gt;&lt;strong&gt; được xuất ra file excel để tính lương......&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Tặng&amp;nbsp;phần mềm chấm công chuyên nghiệp&amp;nbsp;mới nhất&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Phần mềm chấm công thân thiện dễ sử dụng, giao diện Tiếng Việt&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Made in Malaysia&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo hành : 12 tháng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Máy Chấm Công Vân Tay Và Thẻ Cảm Ứng RONALD JACK X628C', 'may cham cong van tay, may cham cong ronald jack, cham cong van tay, may cham cong', 'may cham cong, may cham cong van tay, may cham cong Ronald Jack'),
(268, 6, 'Máy Chấm Công RONAL JACK 4000TID-C', '&lt;p&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background: transparent;&quot;&gt;Máy chấm công vân tay&lt;/strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: none; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background: transparent;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: none; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background: transparent;&quot;&gt;là&amp;nbsp;dạng máy chấm công thông qua phương pháp nhận diện dấu vân tay của người chấm. Phương pháp chấm công bằng vân tay có nhiều ưu điểm như hạn chế khả năng chấm công hộ hay việc phải tốn chi phí mua thẻ với số lượng lớn tạo cho nhân viên ý thức làm việc chuyên nghiệp hơn, coi trọng kỷ luật lao động&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial; line-height: 18px; text-align: justify; background: transparent;&quot;&gt;Máy chấm công Ronald Jack 4000TID-C&lt;/strong&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial; font-size: 13px; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;quản lý dung lượng lên đến 4000 dấu vân tay,kết hợp cả chấm công bằng thẻ cảm ứng và vân tay. Chấm công nhanh chóng, đầu đọc vân tay chính xác, mỗi người có thể lấy tối đa 10 dấu vân tay, giao diện tiếng Việt, dễ dàng sử dụng. Máy sử dụng phần mềm chấm công bằng tiếng Việt, giúp cho người quản lý dễ dàng thực hiện chấm công cho nhân viên, phần mềm cho phép xuất báo cáo băng dạng file excel theo nhiều mẫu khác nhau.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial; font-size: 13px; line-height: 18px; text-align: justify;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Ronald jack 4000TID.PNG&quot; style=&quot;width: 459px; height: 382px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; &quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; &quot;&gt;&lt;strong&gt;&lt;u&gt;&lt;font color=&quot;#000000&quot; face=&quot;Arial&quot;&gt;&lt;span style=&quot;line-height: 18px;&quot;&gt;Th&lt;/span&gt;&lt;/font&gt;ông số kĩ thuật của máy chấm công vân tay RONALD JACK 4000 TID-C :&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Chấm công bằng vân tay và thẻ cảm&amp;nbsp;ứng&lt;/p&gt;\r\n\r\n&lt;p&gt;- Quản lý&lt;strong&gt; &lt;u&gt;4000&lt;/u&gt;&lt;/strong&gt; dấu vân tay.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Một người có thể đăng ký từ 1 tới 10 dấu vân tay, 1 password, 1 thẻ cảm ứng,. Hiển thị tên người sử dụng trên máy khi chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng Chip xử lý intel của mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Dung lượng bộ nhớ: &lt;u&gt;&lt;strong&gt;100.000&lt;/strong&gt;&lt;/u&gt; IN/OUT .Khi không kết nối với máy tính.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Có Password bảo vệ máy, tích hợp âm thanh.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- DỮ LIỆU QUA MẠNG INTERNET&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hiển thị tên người sử dụng trên máy khi chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;-Có acquy dự phòng do đó&amp;nbsp;dữ liệu trong máy không bị mất khi xảy&amp;nbsp;ra cúp điện.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốc độ xử lý rất nhanh&amp;lt;1 giây/1 lần chấm công&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;em&gt;&lt;u&gt;Ưu điểm: &lt;/u&gt;&lt;/em&gt;- Kết hợp sử dụng vân tay , thẻ cảm ứng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo mật cao: không chấm công dùm được.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Phần mềm quản lý nhân viên, số vân tay, giờ công, ....&lt;/strong&gt;&lt;strong&gt; được xuất ra file excel để tính lương......&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Tặng phần mềm chấm công chuyên nghiệp, giao diện Tiếng Việt thân thiện dễ sử dụng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Made in Malaysia&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo hành &amp;nbsp;12 tháng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Máy chấm công vân tay là một dạng máy chấm công thông qua phương pháp nhận diện dấu vân tay của người chấm', 'máy chấm công, may cham cong van tay, cham cong , may cham cong ronald jack, may cham cong 4000 TID', 'may cham cong, may cham cong van tay, may cham cong RONALD JACK'),
(269, 6, 'Máy Chấm Công RONALD JACK 8000T', '&lt;p&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: baseline; text-align: justify; font-family: Arial; line-height: 18px; background: transparent;&quot;&gt;Máy chấm công Ronald Jack 8000T&lt;/strong&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: none; outline: 0px; font-size: small; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: none; outline: 0px; font-size: small; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Sử dụng Chip xử lý intel của mỹ tốc độ sử lý cao và nhanh &amp;lt;1-2 giây/1 lần chấm công, Một người có thể đăng ký từ 1 tới 10 dấu vân tay, 1 password, 1 thẻ cảm ứng,. Hiển thị tên người sử dụng trên máy khi chấm công. Máy phù hợp lắp cho văn phòng, mẫu mã đẹp, phần mềm dễ sử dụng, sử dụng trong môi trường sạch sẽ. Tiết kiệm&amp;nbsp;chi phí đầu tư.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: none; outline: 0px; font-size: small; vertical-align: baseline; color: rgb(0, 0, 0); text-align: justify; font-family: Arial; line-height: 18px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Máy chấm công Ronald Jack 8000T.JPG&quot; style=&quot;width: 829px; height: 643px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;Thông số kĩ thuật của máy chấm công vân tay RONALD JACK 8000T :&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tích hợp nhiều dấu vân tay.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Dung lượng lưu trữ 3000 dấu vân tay.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Dung lượng bộ nhớ trong máy &lt;u&gt;&lt;strong&gt;100.000&lt;/strong&gt;&lt;/u&gt; lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng Chip xử lý intel của mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tốc độ xử lý rất nhanh&amp;lt;1 giây/1 lần chấm công.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phát ra giọng nói bằng ngôn ngữ: &lt;strong&gt;Tiếng anh &amp;amp; Tiếng việt.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Có Password bảo vệ máy, chế độ hẹn giờ tắt máy, Stand by&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối với máy tính qua cổng RS – 232/485, TCP/IP&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Lấy dữ liệu qua USB hoặc từ máy tính&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- DỮ LIỆU QUA MẠNG INTERNET&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Hiển thị tên người sử dụng trên máy khi chấm công&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;em&gt;&lt;u&gt;Ưu điểm: &lt;/u&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Sử dụng vân tay &lt;/strong&gt;&lt;strong&gt;&lt;em&gt;tiết kiệm chi phí đầu tư&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo mật cao: không chấm công dùm được.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Phần mềm quản lý nhân viên, số vân tay, giờ công, ....&lt;/strong&gt;&lt;strong&gt; được xuất ra file excel để tính lương......&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Tặng phần mềm chấm công chuyên nghiệp, giao diện Tiếng Việt thân thiện dễ sử dụng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Made in Malaysia&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Bảo hành: 12 tháng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Máy chấm công Ronald Jack 8000T Sử dụng Chip xử lý intel của mỹ tốc độ sử lý cao và nhanh &lt;1-2 giây/1 lần chấm công, Một người có thể đăng ký từ 1 tới 10 dấu vân tay, 1 password, 1 thẻ cảm ứng', 'may cham cong van tay, may cham cong, cham cong, may cham cong Ronald Jack, may cham cong van tay 8000T', 'may cham cong, may cham cong van tay, may cham cong van tay RONALD JACK'),
(270, 6, 'Camera quan sát DS-2CE56C0T-IRP', '&lt;p&gt;Camera quan sát DS-2CE56C0T-IRP là dòng camera quan sát dome hồng ngoại công nghệ&amp;nbsp;HD-TVI với&amp;nbsp;độ phân giải HD, hình&amp;nbsp;ảnh sắc nét, chất lượng cao,&amp;nbsp;đèn hồng ngoại thông minh. Camera Hikvision&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;DS-2CE56C0T-IRP c&lt;/span&gt;ó vỏ nhựa chất lượng cao nên dễ dàng&amp;nbsp;điều chỉnh góc&amp;nbsp;độ khi lắp&amp;nbsp;đặt,&amp;nbsp;độ phân giải 1 Megapixel + hồng ngoại 20m, dùng&amp;nbsp;để lắp&amp;nbsp;đặt trong nhà&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát kikvision DS-2CE56C0T-IRP&quot; src=&quot;http://congnghevang.net/image/data/camera quan sat DS-2CE56C0T-IRP.png&quot; style=&quot;width: 600px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera Hikvision&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;DS-2CE56C0T-IRP :&lt;/span&gt;&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Camera HD-TVI &amp;nbsp;bán cầu ngoài trời hồng ngoại &amp;nbsp;20m 1 MP.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel. + &amp;nbsp;Hồng ngoại: 20m.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;+ Độ nhạy sáng 0.1 Lux@F1.2. + Ống kính: 3.6mm hoặc 6mm (Đặt hàng 2.8mm)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection).&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Nguồn vào 12 VDC. Dải nhiệt hoạt động rộng (-20°~45°).&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Màu trắng hình thức trang nhã dễ lắp đặt và điều chỉnh, lắp đặt trong nhà. Chưa có adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Bảo hành chính hãng : 24 tháng&lt;/p&gt;\r\n', 'camera quan sát DS-2CE56C0T-IRP', 'camera quan sat, camera giam sat, camera hikvision, camera HD-TVI, camera quan sát', 'camera quan sat, camera quan sat Hikvision, camera DS-2CE56C0T-IRP, camera HD-TVI'),
(271, 6, 'Camera quan sát DS-2CE16C0T-IRP', '&lt;p&gt;Camera quan sát&amp;nbsp;DS-2CE16C0T-IRP&amp;nbsp;là dòng camera quan sát&amp;nbsp;hồng ngoại công nghệ&amp;nbsp;HD-TVI với&amp;nbsp;độ phân giải HD, hình&amp;nbsp;ảnh sắc nét, chất lượng cao,&amp;nbsp;đèn hồng ngoại thông minh. Camera Hikvision&amp;nbsp;DS-2CE16C0T-IRP&amp;nbsp;sử dụng chân đế đa năng&amp;nbsp;dễ dàng&amp;nbsp;điều chỉnh góc&amp;nbsp;độ khi lắp&amp;nbsp;đặt,&amp;nbsp;độ phân giải 1 Megapixel + hồng ngoại 20m, dùng&amp;nbsp;để lắp&amp;nbsp;đặt ngoài trời hoặc trong nhà.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera DS-2CE16C0T-IR.png&quot; style=&quot;width: 500px; height: 600px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật của Camera quan sát&amp;nbsp;DS-2CE16C0T-IRP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera &amp;nbsp;HD-TVI &amp;nbsp;hình trụ hồng ngoại 20m ngoài trời 1 MP.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel .&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hồng ngoại: 20m.&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Độ nhạy sáng 0.1 Lux@F1.2.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;+ Ống kính: 3.6mm hoặc 6mm (Đặt hàng 2.8mm)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ:Giảm nhiễu DNR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC. Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, Chưa có adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Khuyên dùng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Để đạt hiệu suất cao nhất, tránh lắp đặt tại nơi có ánh sáng mạnh chiếu trực tiếp, tránh vị trí mưa bụi.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Không chạm tay trực tiếp vào ống kính và Cảm biến.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khi có hiện tượng mờ sử dụng vật liệu mềm có chứa một chút nước lau kính&amp;nbsp;để lau sạch bụi ống kính.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sử dụng bộ nguồn chuẩn, đủ công suất, chính hãng. Quá điện áp có thể làm hỏng&amp;nbsp;Camera.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát DS-2CE16C0T-IRP .Camera  HD-TVI  hình trụ hồng ngoại 20m ngoài trời 1 MP.\r\n+ Cảm biến: 1/3&quot; Progressive Scan CMOS.', 'camera quan sat, camera hikvision, camera quan sat DS-2CE16C0T-IRP', 'camera quan sat, camera hikvision, camera quan sat DS-2CE16C0T-IRP'),
(272, 6, 'Camera quan sát Hikvision DS-2CE16C0T-IT3', '&lt;p&gt;Camera quan sát&amp;nbsp;DS-2CE16C0T-IT3 là dòng camera quan sát&amp;nbsp;hồng ngoại ngoài trời công nghệ&amp;nbsp;HD-TVI với&amp;nbsp;độ phân giải HD, hình&amp;nbsp;ảnh sắc nét, chất lượng cao,&amp;nbsp;đèn hồng ngoại thông minh. &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-hikvision&quot;&gt;Camera Hikvision&lt;/a&gt;&amp;nbsp;DS-2CE16C0T-IT3 sử dụng chân đế đa năng&amp;nbsp;dễ dàng&amp;nbsp;điều chỉnh góc&amp;nbsp;độ khi lắp&amp;nbsp;đặt,&amp;nbsp;độ phân giải 1 Megapixel + hồng ngoại 40m ngoài trời, dùng&amp;nbsp;để lắp&amp;nbsp;đặt ngoài trời hoặc trong nhà.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera DS-2CE16C0T-IT3.png&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát Hikvision&amp;nbsp;DS-2CE16C0T-IT3:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera &amp;nbsp;HD-TVI &amp;nbsp;trụ hồng ngoại 40m ngoài trời 1 MP.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hồng ngoại: 40m.Độ nhạy sáng 0.01 Lux@F1.2.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính: 3.6mm hoặc 6mm (Đặt hàng 8mm,12mm, 16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, công nghệ EXIR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC. Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, Chưa có adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Khuyên dùng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Để đạt hiệu suất cao nhất, tránh lắp đặt tại nơi có ánh sáng mạnh chiếu trực tiếp, tránh vị trí mưa bụi.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Không chạm tay trực tiếp vào ống kính và Cảm biến.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;- Khi có hiện tượng mờ sử dụng vật liệu mềm thấm một chút nước lau kính để lau sạch bụi ống kính.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;- Sử dụng bộ nguồn chuẩn, đủ công suất, chính hãng. Quá điện áp có thể làm hỏng Camera.&lt;/p&gt;\r\n', 'Camera quan sát DS-2CE16C0T-IT3 . Camera  HD-TVI  trụ hồng ngoại 40m ngoài trời 1 MP.\r\n+ Cảm biến: 1/3&quot; Progressive Scan CMOS.', 'Camera quan sat, camera giam sat, camera Hikvision, Camera quan sát DS-2CE16C0T-IT3', 'Camera quan sat, camera giam sat, camera Hikvision, Camera quan sát DS-2CE16C0T-IT3'),
(273, 6, 'Camera quan sát Hikvision DS-2CE56C0T-IT3', '&lt;p&gt;Camera quan sát&amp;nbsp;Hikvision DS-2CE56C0T-IT3 &amp;nbsp;là dòng &lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;camera quan sát&lt;/a&gt; &amp;nbsp;bán cầu&amp;nbsp;hồng ngoại &amp;nbsp;công nghệ&amp;nbsp;HD-TVI với&amp;nbsp;độ phân giải HD, hình&amp;nbsp;ảnh sắc nét, chất lượng cao,&amp;nbsp;đèn hồng ngoại thông minh. Camera quan sát&amp;nbsp;Hikvision&amp;nbsp;DS-2CE56C0T-IT3 &amp;nbsp;độ phân giải 1 Megapixel + hồng ngoại 40m, dùng&amp;nbsp;để lắp&amp;nbsp;đặt trong nhà.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera DS-2CE56D1T-IT3.png&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;a href=&quot;http://congnghevang.net/camera-quan-sat/camera-quan-sat-hikvision&quot;&gt;Camera quan sát Hikvision&lt;/a&gt; DS-2CE56C0T-IT3:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera &amp;nbsp;HD-TVI &amp;nbsp;bán cầu ngoài trời hồng ngoại 1 MP (hồng ngoại 40m)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel.&lt;/p&gt;\r\n\r\n&lt;p&gt;+&amp;nbsp;Hồng ngoại: 40m.Độ nhạy sáng 0.1 Lux@F1.2.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính: 3.6mm &amp;nbsp; (Đặt hàng 2.8mm,6mm, 8mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC. Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, Chưa kèm adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Khuyên dùng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Để đạt hiệu suất cao nhất, tránh lắp đặt tại nơi có ánh sáng mạnh chiếu trực tiếp, tránh vị trí mưa bụi.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Không chạm tay trực tiếp vào ống kính và Cảm biến.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;- Khi có hiện tượng mờ sử dụng vật liệu mềm thấm một chút nước lau kính để lau sạch bụi ống kính.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;- Sử dụng bộ nguồn chuẩn, đủ công suất, chính hãng. Quá điện áp có thể làm hỏng Camera.&lt;/p&gt;\r\n', 'Camera quan sát Hikvision DS-2CE56C0T-IT3. Camera  HD-TVI  bán cầu ngoài trời hồng ngoại 1 MP (hồng ngoại 40m)\r\n+ Cảm biến: 1/3&quot; Progressive Scan CMOS.', 'Camera quan sat, camera giam sat, camera hikvision, Camera quan sát Hikvision DS-2CE56C0T-IT3', 'Camera quan sat, camera giam sat, camera hikvision, Camera quan sát Hikvision DS-2CE56C0T-IT3'),
(274, 6, 'Camera quan sát Dahua HAC-HDW1000RP', '&lt;p&gt;&lt;strong&gt;Camera quan sát Dahua HAC-HDW1000RP&lt;/strong&gt;&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;có độ phân giải HD720P, cho phân giải hình ảnh HD trên tín hiệu đường dây analog, hỗ trợ nhiều tính năng tốt như Chế độ ngày đêm (ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (3D-DNR), tiêu chuẩn IP67. Thích hợp lắp cho các công trình như gia đình, văn phòng, cửa hàng…..&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera Dahua HAC-HDW1000RP.jpg&quot; style=&quot;width: 370px; height: 370px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Th&lt;/span&gt;ông số kĩ thuật&amp;nbsp;Camera quan sát Dahua HAC-HDW1000RP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải &amp;nbsp;1 Megapixel CMOS 25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (3D-DNR)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại 20m với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính cố định 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Chuẩn ngâm nước IP67 đối với mã HAC-HFW1000RP&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Điện áp DC12V, công suất 3.5W Chất liệu vỏ plastic&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 800m với cáp 75-3 ôm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kích thước:&amp;nbsp;85mm×69mm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Trọng lượng :100g&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;u style=&quot;box-sizing: border-box; border: none;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192);&quot;&gt;Khuyên dùng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Để đạt hiệu suất cao nhất, tránh lắp đặt tại nơi có ánh sáng mạnh chiếu trực tiếp, tránh vị trí mưa bụi.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Không chạm tay trực tiếp vào ống kính và Cảm biến.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;- Khi có hiện tượng mờ sử dụng vật liệu mềm thấm một chút nước lau kính để lau sạch bụi ống kính.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;- Sử dụng bộ nguồn chuẩn, đủ công suất, chính hãng. Quá điện áp có thể làm hỏng Camera.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát Dahua HAC-HDW1000RP Độ phân giải  1 Megapixel CMOS ﻿25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog', 'Camera quan sat, camera quan sat dahua, camera dahua, camera Dahua HAC-HDW1000RP', 'Camera quan sat, camera quan sat dahua, camera Dahua HAC-HDW1000RP');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(275, 6, 'Camera quan sát Dahua HAC-HFW1000RP', '&lt;p&gt;Camera quan sát Dahua HAC-HFW1000RP&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;có độ phân giải HD720P, cho phân giải hình ảnh HD trên tín hiệu đường dây analog, hỗ trợ nhiều tính năng tốt như Chế độ ngày đêm (ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (3D-DNR), tiêu chuẩn IP67. Thích hợp lắp cho các công trình như gia đình, văn phòng, cửa hàng…..&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera Dahua HAC-HFW1000RP.jpg&quot; style=&quot;width: 370px; height: 370px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Th&lt;/span&gt;ông số kĩ thuật&amp;nbsp;Camera quan sát Dahua HAC-HFW1000RP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Độ phân giải &amp;nbsp;1 Megapixel CMOS 25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (3D-DNR)&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Tầm xa hồng ngoại 20m với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Ống kính cố định 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: none; line-height: 1.6em;&quot;&gt;- Chuẩn ngâm nước IP67 đối với mã HAC-HFW1000RP&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Điện áp DC12V, công suất 3.5W Chất liệu vỏ plastic&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 800m với cáp 75-3 ôm&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Kích thước:&amp;nbsp;70mm×154mm&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Trọng lượng :200g&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;u style=&quot;box-sizing: border-box; border: none;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192);&quot;&gt;Khuyên dùng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Để đạt hiệu suất cao nhất, tránh lắp đặt tại nơi có ánh sáng mạnh chiếu trực tiếp, tránh vị trí mưa bụi.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;- Không chạm tay trực tiếp vào ống kính và Cảm biến.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;- Khi có hiện tượng mờ sử dụng vật liệu mềm thấm một chút nước lau kính để lau sạch bụi ống kính.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;- Sử dụng bộ nguồn chuẩn, đủ công suất, chính hãng. Quá điện áp có thể làm hỏng Camera.&lt;/p&gt;\r\n', 'Camera quan sát Dahua HAC-HFW1000RP có độ phân giải HD720P, cho phân giải hình ảnh HD trên tín hiệu đường dây analog, hỗ trợ nhiều tính năng', 'Camera quan sát, camera quan sat dahua, Camera quan sát Dahua HAC-HFW1000RP, Dahua', 'Camera quan sát, camera quan sat dahua, Camera quan sát Dahua HAC-HFW1000RP'),
(252, 6, 'Camera ICAM-191HD', '&lt;p style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 23.4px; text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; border: 0px; border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Hàng &lt;/span&gt;&lt;span style=&quot;color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; border: 0px; border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;chất lượng cao, bảo hành 24&amp;nbsp;tháng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 17.55px; font-family: Arial, Helvetica, sans-serif; color: rgb(85, 85, 85); text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18pt; font-family: Bodoni; color: red; background: transparent;&quot;&gt;Luôn cam kết giá tốt nhất&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18pt; font-family: Bodoni; color: red; background: transparent;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/icam 191hd.jpg&quot; style=&quot;width: 269px; height: 278px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera ICAM-191HD:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera quan sát bán cầu&amp;nbsp;trong nhà hồng ngoại ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính&amp;nbsp;Lens 2.8mm(4,6mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM 191HD Dome trong nhà hồng ngoại  ngày và đêm', 'camera quan sat, camera HD, camera gia re, lap dat camera quan sat, Camera ICAM-191HD, camera icam', 'camera quan sat, camera HD, camera ICam, Camera ICAM-191HD'),
(255, 6, 'Camera ICAM-491HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;ICAM-491HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát ICAM 491HD&quot; src=&quot;http://congnghevang.net/image/data/Product/camera Icam 491hd.jpg&quot; style=&quot;width: 296px; height: 273px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật Camera quan sát ICAM 491 HD:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera thân ngoài trời hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 4mm&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-491HD Camera thân ngoài trời hồng ngoại  ngày và đêm\r\n- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera quan sat, camera ICAM, Camera ICAM-491HD', 'Camera quan sat, camera ICAM, Camera ICAM-491HD'),
(256, 6, 'Camera ICAM-691HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;ICAM-691HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera ICAM 691HD&quot; src=&quot;http://congnghevang.net/image/data/Product/icam 603iq.jpg&quot; style=&quot;width: 276px; height: 281px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát ICAM 691HD:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera Thân ngoài trời hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 4mm(6,8,12,16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera ICAM-691HD, Camera Thân ngoài trời hồng ngoại  ngày và đêm\r\n- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera quan sát, Camera ICAM, Camera ICAM-691HD', 'Camera quan sát, Camera ICAM, Camera ICAM-691HD'),
(276, 6, 'Camera quan sát DAHUA HAC-HDW1000MP', '&lt;p&gt;Camera quan sát DAHUA HAC-HDW1000MP là dòng camera HDCVI chất lượng cao , vỏ nhựa, được thiết kế hiện đại và chắc chắn cho chất lượng hình ảnh nổi bật với độ phân giải cao, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, phù hợp lắp đặt giám sát khu vực bên trong hoặc bên ngoài tại nhà ở, trường học, siêu thị, xí nghiệp, văn phòng, bệnh viện, trung tâm thương mại, v.v....&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát Dahua HAC-HDW1000MP&quot; src=&quot;http://congnghevang.net/image/data/Camera Dahua HAC-HDW1000RP.jpg&quot; style=&quot;width: 370px; height: 370px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát DAHUA HAC-HDW1000MP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải &amp;nbsp;1 Megapixel CMOS 25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB)&lt;/p&gt;\r\n\r\n&lt;p&gt;Tự động bù sáng (AGC), chống ngược sáng(BLC)&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhiễu (3D-DNR), tầm xa hồng ngoại 25m &amp;nbsp;với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính cố định 3.6mm , chuẩn ngâm nước IP67 &amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp DC12V, công suất 3.5W&lt;/p&gt;\r\n\r\n&lt;p&gt;Chất liệu vỏ kim loại&lt;/p&gt;\r\n\r\n&lt;p&gt;Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 800m&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước: &amp;nbsp;Φ93.4mm×79.7mm&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát DAHUA HAC-HDW1000MP Độ phân giải  1 Megapixel CMOS ﻿25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog', 'camera quan sat, camera dahua, Camera quan sát DAHUA HAC-HDW1000MP, camera giám sát', 'camera quan sat, camera dahua, Camera quan sát DAHUA HAC-HDW1000MP'),
(277, 6, 'Camera quan sát Dahua HAC-HFW1000SP', '&lt;p&gt;Camera quan sát Dahua HAC-HFW1000SP là dòng camera HDCVI chất lượng cao, dạng thân hồng ngoại , vỏ nhựa, được thiết kế hiện đại và chắc chắn cho chất lượng hình ảnh nổi bật với độ phân giải cao, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, phù hợp lắp đặt giám sát khu vực bên trong hoặc bên ngoài tại nhà ở, trường học, siêu thị, xí nghiệp, văn phòng, bệnh viện, trung tâm thương mại, v.v....&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát Dahua HAC-HFW1000SP &quot; src=&quot;http://congnghevang.net/image/data/Camera Dahua HAC-HFW1000SP.jpg&quot; style=&quot;width: 560px; height: 390px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát Dahua HAC-HFW1000SP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Độ phân giải &amp;nbsp;1 Megapixel CMOS 25fps@720P, Cho phân giải HD trên tín hiệu đường dây analog&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB)&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Tự động bù sáng (AGC), chống ngược sáng(BLC)&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Chống nhiễu (3D-DNR), tầm xa hồng ngoại 25m &amp;nbsp;với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Ống kính cố định 3.6mm , chuẩn ngâm nước IP67 &amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Điện áp DC12V, công suất 3.5W&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Chất liệu vỏ kim loại&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 800m&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px 0px 10px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Kích thước:&amp;nbsp;Φ93.4mm×79.7mm&lt;/p&gt;\r\n', 'Camera quan sát Dahua HAC-HFW1000SP là dòng camera HDCVI chất lượng cao, dạng thân hồng ngoại , vỏ nhựa, được thiết kế hiện đại và chắc chắn cho chất lượng hình ảnh nổi bật với độ phân giải cao', 'Camera quan sat, camera dahua, Camera quan sát Dahua HAC-HFW1000SP, camera giam sat', 'Camera quan sat, camera dahua, Camera quan sát Dahua HAC-HFW1000SP, camera giam sat'),
(278, 6, 'Camera quan sát Dahua HAC-HDBW2120EP', '&lt;p&gt;Camera quan sát Dahua HAC-HDBW2120EP Độ phân giải 1/3” Exmor CMOS&quot; 1.4 Megapixel&amp;nbsp; 25/30fps@720P(1305×1049), Cho phân giải HD trên đường truyền analog. thời gian thực không trễ hình .Là dòng camera HDCVI chất lượng cao, dạng thân hồng ngoại , vỏ kim loại, được thiết kế hiện đại và chắc chắn cho chất lượng hình ảnh nổi bật với độ phân giải cao, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, phù hợp lắp đặt giám sát khu vực bên trong hoặc bên ngoài tại nhà ở, trường học, siêu thị, xí nghiệp, văn phòng, bệnh viện, trung tâm thương mại, v.v....&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát Dahua HAC-HDBW2120EP &quot; src=&quot;http://congnghevang.net/image/data/HAC-HDBW2120EP.jpg&quot; style=&quot;width: 370px; height: 370px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát Dahua HAC-HDBW2120EP:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải 1/3” Exmor CMOS&quot; 1.4 Megapixel &amp;nbsp;25/30fps@720P(1305×1049)&lt;/p&gt;\r\n\r\n&lt;p&gt;Cho phân giải HD trên đường truyền analog. thời gian thực không trễ hình&lt;/p&gt;\r\n\r\n&lt;p&gt;Hỗ trợ điều kiển OSD trên cáp đồng trục&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on)&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống ngược sáng DWDR, chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB)&lt;/p&gt;\r\n\r\n&lt;p&gt;Tự động bù sáng (AGC), chống ngược sáng(BLC),&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Chống nhiễu (3D-DNR)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Tầm xa hồng ngoại 30m với công nghệ hồng ngoại thông minh&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Ố&lt;span style=&quot;line-height: 1.6em;&quot;&gt;ng kính cố định 3.6mm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Chuẩn ngâm nước IP67, chống va đập IK10 &lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Đ&lt;span style=&quot;line-height: 1.6em;&quot;&gt;iện áp DC12V,&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;công suất 3.5W&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;C&lt;/span&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;hất liệu vỏ kim loại&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 800m với cáp 75-3 ôm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Kích thước F109.9mm×81.0mm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát Dahua HAC-HDBW2120EP Độ phân giải 1/3” Exmor CMOS&quot; 1.4 Megapixel  25/30fps@720P(1305×1049), Cho phân giải HD trên đường truyền analog. ', 'Camera quan sat, camera dahua, camera giám sát, Camera quan sát Dahua HAC-HDBW2120EP', 'Camera quan sat, camera dahua, camera giám sát, Camera quan sát Dahua HAC-HDBW2120EP'),
(279, 6, 'Camera quan sát Hikvision DS-2CE16C0T-IT5', '&lt;p&gt;Camera quan sát&amp;nbsp;Hikvision DS-2CE16C0T-IT5 là dòng camera quan sát thân&amp;nbsp;hồng ngoại &amp;nbsp;công nghệ&amp;nbsp;HD-TVI với&amp;nbsp;độ phân giải HD, hình&amp;nbsp;ảnh sắc nét, chất lượng cao,&amp;nbsp;đèn hồng ngoại thông minh ban đêm 80m. Camera Hikvision&amp;nbsp;DS-2CE16C0T-IT5 độ phân giải 1 Megapixel + hồng ngoại 80m, thích hợp lắp đặt giám sát nhà riêng, giám sát cửa hàng, giám sát văn phòng, giám sát trường học, giám sát nhà xưởng…..&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/DS-2CE16C0T-IT5.png&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát Hikvision DS-2CE16C0T-IT5:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Camera HD-TVI &amp;nbsp;trụ hồng ngoại 80m ngoài trời 1 MP.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel. + &amp;nbsp;Hồng ngoại: 80m.Độ nhạy sáng 0.01 Lux@F1.2.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính: 3.6mm hoặc 6mm (Đặt hàng 8mm, 12mm, 16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, công nghệ EXIR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC. Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, Chưa có adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát Hikvision DS-2CE16C0T-IT5 công nghệ HD-TVI với độ phân giải HD, hình ảnh sắc nét, chất lượng cao, đèn hồng ngoại thông minh ban đêm 80m.', 'Camera quan sát, camera quan sat hikvision,  Hikvision DS-2CE16C0T-IT5, camera giam sat', 'Camera quan sát, camera quan sat Hikvision,  Hikvision DS-2CE16C0T-IT5, camera giam sat'),
(280, 6, 'Camera quan sát Hikvision DS-2CE56C2T-IT3', '&lt;p&gt;Camera quan sát&amp;nbsp;Hikvision DS-2CE56C2T-IT3 là dòng camera quan sát HD-TVI&amp;nbsp; bán cầu hồng ngoại 1 MP (hồng ngoại 40m). Cảm biến: 1/3&quot; Progressive Scan CMOS. Độ phân giải: 1 Megapixel. + Hồng ngoại: 40m. Độ nhạy sáng 0.01 Lux@F1.2., hình&amp;nbsp;ảnh sắc nét, chất lượng cao, thích hợp lắp đặt giám sát nhà riêng, giám sát cửa hàng, giám sát văn phòng, giám sát trường học, giám sát nhà xưởng…..&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera hikvision DS-2CE56C2T-IT3.jpg&quot; style=&quot;width: 560px; height: 452px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát Hikvision DS-2CE56C2T-IT3:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Camera &amp;nbsp;HD-TVI &amp;nbsp;bán cầu hồng ngoại 1 MP (hồng ngoại 40m)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải: 1 Megapixel.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hồng ngoại: 40m.Độ nhạy sáng 0.01 Lux@F1.2.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính: 3.6mm hoặc 6mm &amp;nbsp;(Đặt hàng 2.8mm, 8mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, Chưa kèm adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát Hikvision DS-2CE56C2T-IT3 là dòng camera quan sát HD-TVI  bán cầu hồng ngoại 1 MP (hồng ngoại 40m). Cảm biến: 1/3&quot; Progressive Scan CMOS. Độ phân giải: 1 Megapixel. + Hồng ngoại: 40m. Độ nhạy sáng 0.01 Lux@F1.2', 'Camera quan sat, camera Hikvision, Camera HD-TVI, Hikvision DS-2CE56C2T-IT3, camera giam sat', 'Camera quan sat, camera Hikvision, Camera HD-TVI, Hikvision DS-2CE56C2T-IT3, camera giam sat'),
(281, 6, 'Camera quan sát Hikvision DS-2CE16C2T-IT3', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;Hikvision DS-2CE16C2T-IT3&lt;/strong&gt; là dòng camera quan sát HD-TVI thân hồng ngoại 1 MP. Cảm biến: 1/3&quot; Progressive Scan CMOS. Độ phân giải: 1 Megapixel. + Hồng ngoại: 40m. Độ nhạy sáng 0.01 Lux@F1.2. Ống kính: 3.6mm hoặc 6mm , hình&amp;nbsp;ảnh sắc nét, chất lượng cao, thích hợp lắp đặt giám sát nhà riêng, giám sát cửa hàng, giám sát văn phòng, giám sát trường học, giám sát nhà xưởng…..&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera DS-2CE16C2T-IT3.png&quot; style=&quot;width: 500px; height: 400px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát Hikvision DS-2CE16C2T-IT3:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+Camera &amp;nbsp;HD-TVI &amp;nbsp;trụ hồng ngoại 40m ngoài trời 1 MP.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến: 1/3&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+Độ phân giải: 1 Megapixel.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ &amp;nbsp;Hồng ngoại: 40m.Độ nhạy sáng 0.01 Lux@F1.2.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính: 3.6mm hoặc 6mm (Đặt hàng 8mm,12mm, 16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: Bù ngược sáng BLC, Giảm nhiễu DNR, Hồng ngoại thông minh, Phát hiện chuyển động (Motion Detection). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+Tiêu chuẩn ngoài trời IP66. &amp;nbsp;Nguồn vào 12 VDC.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dải nhiệt hoạt động rộng (-40°~60°). Màu trắng, đã có chân đế .Chưa có adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát Hikvision DS-2CE16C2T-IT3 là dòng camera quan sát HD-TVI thân hồng ngoại 1 MP. Cảm biến: 1/3&quot; Progressive Scan CMOS. Độ phân giải: 1 Megapixel. + Hồng ngoại: 40m. Độ nhạy sáng 0.01 Lux@F1.2. Ống kính: 3.6mm hoặc 6mm ', 'Camera quan sat, camera hikvision, camera HD-TVI, Hikvision DS-2CE16C2T-IT3', 'Camera quan sat, camera hikvision, camera HD-TVI, Hikvision DS-2CE16C2T-IT3'),
(282, 6, 'Camera HD-TVI HIKVISION DS-2CE56D1T-IR', '&lt;p&gt;Camera quan sát&amp;nbsp;HD-TVI HIKVISION DS-2CE56D1T-IR là dòng camera quan sát HD-TVI bán cầu hồng ngoại 2 MP ( vỏ thép ). Cảm biến 1/2.7&quot; Progressive Scan CMOS. Độ phân giải 2MP:1930(H)*1088(V).Độ nhạy sáng &lt;a href=&quot;mailto:0.1Lux@F1.2&quot;&gt;0.1Lux@F1.2&lt;/a&gt;. Ống kính 3.6mm . Góc nhìn rộng (80° với ống kính 3.6mm, 55.4° với ống kính 6mm), hình&amp;nbsp;ảnh sắc nét, chất lượng cao, thích hợp lắp đặt giám sát nhà riêng, giám sát cửa hàng, giám sát văn phòng, giám sát trường học, giám sát nhà xưởng…..&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera-HD-TVI-HIKVISION-DS-2CE56D1T-IR.png&quot; style=&quot;width: 636px; height: 527px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera HD-TVI HIKVISION DS-2CE56D1T-IR:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Camera &amp;nbsp;HD-TVI &amp;nbsp;bán cầu hồng ngoại 2MP (lõi thép)&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Cảm biến 1/2.7&quot; Progressive Scan CMOS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải 2MP:1930(H)*1088(V).Độ nhạy sáng 0.1Lux@F1.2. &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Ống kính 3.6mm (Đặt hàng: 6mm). Góc trông rộng (80° với ống kính 3.6mm, 55.4° với ống kính 6mm).&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hồng ngoại thông minh Smart IR, tầm xa hồng ngoại 20m.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Có menu OSD có thể điều khiển từ &amp;nbsp;xa qua cáp đồng trục.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Tính năng: Bù ngược sáng (BLC), giảm nhiễu số (DNR), Bắt chuyển động (Motion detection), Mặt nạ che (Privacy Mask).&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Nguồn vào 12 VDC.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dải nhiệt hoạt động rộng (-40°~60°).&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Màu trắng vỏ lõi thép hình thức trang nhã dễ lắp đặt và điều chỉnh&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Chưa kèm adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HD-TVI HIKVISION DS-2CE56D1T-IR  là dòng camera quan sát HD-TVI bán cầu hồng ngoại 2 MP ( vỏ thép ). Cảm biến 1/2.7&quot; Progressive Scan CMOS. Độ phân giải 2MP:1930(H)*1088(V).Độ nhạy sáng 0.1Lux@F1.2. Ống kính 3.6mm', 'Camera quan sat, camera quan sat hikvision, camera HD-TVI, HIKVISION DS-2CE56D1T-IR', 'Camera quan sat, camera quan sat hikvision, camera HD-TVI, HIKVISION DS-2CE56D1T-IR'),
(283, 6, 'Camera ICAM 371HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;ICAM 371HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;&lt;img alt=&quot;Camera ICAM 371HD&quot; src=&quot;http://congnghevang.net/image/data/camera ICAM 371HD.png&quot; style=&quot;width: 420px; height: 320px;&quot; /&gt;&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;&lt;strong&gt;Thông số kĩ thuật camera ICAM 371HD :&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera ICAM 371HD là dạng camera thân ngoài trời hồng ngoại ngày&amp;nbsp;và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 3.6mm &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại 20m&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera ICAM 371HD  là dạng camera thân ngoài trời hồng ngoại ngày và đêm. Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera ICAM 371HD, Camera quan sat, Camera ICAM, camera than, camera hong ngoai', 'Camera ICAM 371HD, Camera quan sat, Camera ICAM, Camera AHD'),
(284, 6, 'Camera ICAM 381HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;Camera ICAM 381HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera ICAM 381HD.png&quot; style=&quot;width: 420px; height: 320px;&quot; /&gt;&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;&lt;u&gt;Thông số kĩ thuật Camera ICAM 381HD:&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera ICAM 381HD là dòng camera thân ngoài trời hồng ngoại ngày&amp;nbsp;và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh cho hình ảnh đẹp hơn và không bị lóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lens 3.6mm,Led Aray cho hình ảnh ban đêm rõ nét&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại 20m&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera ICAM 381HD Camera ICAM 381HD là dòng camera thân ngoài trời hồng ngoại ngày và đêm .Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera ICAM 381HD , camera quan sat, camera ICAM, Camera AHD', 'Camera ICAM 381HD , camera quan sat, camera ICAM, Camera AHD'),
(285, 6, 'Công tắc cảm biến chuyển động AST 02S ', '&lt;h1&gt;Công tắc cảm biến chuyển động AST 02S&amp;nbsp;&lt;/h1&gt;\r\n\r\n&lt;p&gt;Bạn rất hay phải mò mẫm trong tối để bật công tắc điện điều đó thật là bất tiện và có thể nguy hiểm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Có 1 giải pháp công nghệ thông minh dành cho bạn&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Đó là: công tắc cảm biến chuyển động &lt;strong&gt;AST 02S&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Cong tac cam bien chuyen dong AST 02S.png&quot; style=&quot;width: 620px; height: 480px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Được sản xuất từ công nghệ Đài loan.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Với tính năng thông minh hoàn toàn tự động: tự động bật những thiết bị điện khi có người và tự động tắt khi không có người đặc biệt&amp;nbsp;phù hợp lắp chung với những thiết bị chiếu sáng trong gia đình, cầu thang, ngoài sân, phòng vệ sinh, gara oto, hầm ...&lt;/p&gt;\r\n\r\n&lt;p&gt;Thiết bị hoạt động dựa trên nguyên lý cảm &amp;nbsp;biến chuyển động khi có người qua khu vực phạm vi cảm ứng công tắc tự động bật sáng những thiết bị.&amp;nbsp;Giúp bạn tiết kiệm thời gian, tiết kiệm điện ...&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật công tắc cảm biến chuyển động AST 02S:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Hồng ngoại cảm biến chuyển động&lt;br /&gt;\r\n- Khoảng cách phát hiện chuyển động: 6m&lt;br /&gt;\r\n- Sử dụng nguồn 200-240V/AC&lt;br /&gt;\r\n- Thời gian trễ: -Nhỏ nhất 5-7s(tùy chỉnh)&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; -Lớn nhất: 6-9p (tùy chỉnh)&lt;br /&gt;\r\n- Độ nhạy sáng: &amp;lt;10Lux (tùy chỉnh)&lt;br /&gt;\r\n- Công suất tải: 1200W&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Công tắc cảm biến chuyển động AST 02S : tự động bật những thiết bị điện khi có người và tự động tắt khi không có người đặc biệt phù hợp lắp chung với những thiết bị chiếu sáng trong gia đình, cầu thang, ngoài sân, phòng vệ sinh, gara oto, hầm ...', 'Công tắc cảm biến chuyển động AST 02S , thiết bị điện thông minh, công tắc cảm biến, nhà thông minh', 'Công tắc cảm biến chuyển động AST 02S , thiết bị điện thông minh, công tắc cảm biến, nhà thông minh');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(286, 6, 'Đầu ghi hình 4 kênh HIKVISION DS-7104HGHI-E1', '&lt;p&gt;&lt;strong&gt;Đầu ghi hình HIKVISION DS-7104HGHI-E1&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Đầu ghi hình Hikvision DS-7104&quot; src=&quot;http://congnghevang.net/image/data/u Camera DS-7104HGHI-E1.png&quot; style=&quot;width: 600px; height: 400px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông Số Kĩ Thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Đầu Ghi Hình HIKVISION DS-7104HGHI-E1 :&lt;/span&gt;&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Đầu ghi hình 4&amp;nbsp;kênh HDMI (Chỉ hỗ trợ camera HD-TVI 1MP và Camera Analog, Không hỗ trợ camera HD-TVI 2MP) &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Mới với thiết kế &amp;nbsp;trang nhã, nhỏ gọn. màu trắng .&lt;/p&gt;\r\n\r\n&lt;p&gt;Chuẩn nén video H.264.Độ phân giải ghi max: 1MP/ 25FPS&lt;/p&gt;\r\n\r\n&lt;p&gt;Cổng ra HDMI và VGA với Độ phân giải 1280x720P.&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách kết nối đến camera: &lt;strong&gt;tối đa 500m với cáp đồng trục&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Hai luồng dữ liệu độc lập Dual Stream (Cho phép đặt ở chế độ&amp;nbsp;ghi tại chỗ và xem qua mạng thông số tối ưu nhất)&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;1 kênh audio. 1 đầu ra VGA, 1 đầu ra HDMI&lt;/p&gt;\r\n\r\n&lt;p&gt;Hai cổng USB2.0. Tối đa 128 người truy cập cùng lúc.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải ghi: 1MP/ 25FPS Hỗ trợ 1 ổ HDD dung lượng tối đa 6TB.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn 12VDC. Kèm chuột. Miễn phí 1 host chính hãng trọn đời sản phẩm.&lt;/p&gt;\r\n\r\n&lt;p&gt;Lưu ý: Không hỗ trợ cổng RS485 và không hỗ trợ Ghi thêm IP camera.&lt;/p&gt;\r\n\r\n&lt;p&gt;Đầu ghi chưa bao gồm ổ cứng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box;&quot;&gt;Hikvision&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;là&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;thương hiệu&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;cung cấp lớn nhất thế giới các sản phẩm&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot;&gt;&lt;span style=&quot;color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Camera quan sát&lt;/span&gt;&lt;/a&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;. Công ty chuyên về công nghệ giám sát video,&amp;nbsp;thiết kế và sản xuất các sản phẩm CCTV&lt;/span&gt;&lt;span style=&quot;color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;,&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;giám sát video. Dòng sản phẩm của hãng bao gồm camera, đầu ghi hình, cho tới các phần mềm quản lý video. Từ khi thành lập vào năm 2001, Hikvision đã nhanh chóng nắm giữ vị trí dẫn đầu thị trường thế giới trong ngành công nghiệp an ninh.&amp;nbsp;Hiện nay Hikvision đã trở thành&amp;nbsp;một doanh nghiệp toàn cầu với hơn&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;20.&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box;&quot;&gt;000 nhân viên&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;, bao gồm&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;4&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box;&quot;&gt;.&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;2&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; color: rgb(106, 106, 106); font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box;&quot;&gt;00 kỹ sư chuyên nghiên cứu và phát triển sản phẩm&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n', 'Đầu ghi hình HIKVISION DS-7104HGHI-E1 Đầu ghi hình 4 kênh HDMI (Chỉ hỗ trợ camera HD-TVI 1MP và Camera Analog, Không hỗ trợ camera HD-TVI 2MP)  Mới với thiết kế  trang nhã, nhỏ gọn. màu trắng .', 'Đầu ghi hình HIKVISION DS-7104HGHI-E1, đầu ghi hình camera, đầu ghi hình Hikvision ', 'Đầu ghi hình HIKVISION DS-7104HGHI-E1, đầu ghi hình camera, đầu ghi hình Hikvision '),
(287, 6, 'Đầu Ghi Hình 16 kênh Hikvision DS-7216HGHI-E1', '&lt;p&gt;&lt;strong&gt;Đầu Ghi Hình Hikvision DS-7216HGHI-E1&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/u ghi hình DS-7216HGHI-E1.jpg&quot; style=&quot;width: 350px; height: 241px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Đầu Ghi Hình Hikvision DS-7216HGHI-E1:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Đầu ghi hình 16 kênhTurbo HD DVR &amp;nbsp;(Chỉ hỗ trợ camera HD-TVI 1MP và Camera Analog, Không hỗ trợ camera HD-TVI 2MP) &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Đầu ghi hỗ trợ 3 loại camera: HD-TVI camera , Analog camera và IP camera (tối đa 4/8/16 camera TVI hoặc analog, và thêm tối đa 1 IP camera 1MP đối với đầu 4 kênh, 2 IP camera 2MP đối với đầu 8/16 kênh ). &amp;nbsp;Lưu ý: Chỉ hỗ trợ Camera IP của Hãng HIKVISION.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải ghi hình: &amp;nbsp;(WD1: 25FPS), &amp;nbsp;1080P: 12FPS, 720P: 25FPS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+1 cổng ra HDMI, 1 cổng ra VGA, 1 cổng RS485. &amp;nbsp; &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Khoảng cách kết nối đến camera: &lt;strong&gt;tối đa 500m với cáp đồng trục&lt;/strong&gt;.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hiển thị ra HDMI/VGA: &lt;strong&gt;độ&amp;nbsp;phân&amp;nbsp;giải 1920x1080P&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ &lt;strong&gt;Tối đa 128 người truy cập cùng lúc&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hai luồng dữ liệu độc lập.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: 1 ổ cứng, tối đa 6TB. Audio: 1 ngõ vào và 1 ngõ ra&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;Hikvision&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;là&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;thương hiệu&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;cung cấp lớn nhất thế giới các sản phẩm&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot; style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); text-decoration: none; cursor: pointer; outline: none; font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;Camera quan sát&lt;/span&gt;&lt;/a&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;. Công ty chuyên về công nghệ giám sát video,&amp;nbsp;thiết kế và sản xuất các sản phẩm CCTV&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;,&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;giám sát video. Dòng sản phẩm của hãng bao gồm: &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-hikvision&quot;&gt;camera quan sát&amp;nbsp;Hikvision&lt;/a&gt;, đầu ghi hình Hikvision, cho tới các phần mềm quản lý video. Từ khi thành lập vào năm 2001, Hikvision đã nhanh chóng nắm giữ vị trí dẫn đầu thị trường thế giới trong ngành công nghiệp an ninh.&amp;nbsp;Hiện nay Hikvision đã trở thành&amp;nbsp;một doanh nghiệp toàn cầu với hơn&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;20.&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;000 nhân viên&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;, bao gồm&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;4&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;.&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;2&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;00 kỹ sư chuyên nghiên cứu và phát triển sản phẩm&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n', 'Đầu Ghi Hình Hikvision DS-7216HGHI-E1 16 kênhTurbo HD DVR. Đầu ghi hỗ trợ 3 loại camera: HD-TVI camera ,  Analog camera và IP camera', 'Đầu Ghi Hình Hikvision DS-7216HGHI-E1, đầu ghi hình camera, đầu ghi hình Hikvision, đầu ghi hình HD-TVI', 'Đầu Ghi Hình Hikvision DS-7216HGHI-E1, đầu ghi hình camera, đầu ghi hình Hikvision, đầu ghi hình HD-TVI'),
(288, 6, 'Đầu Ghi Hình 4 Kênh Hikvision DS-7204HGHI-SH', '&lt;p&gt;&lt;strong&gt;Đầu Ghi Hình 4 Kênh Hikvision DS-7204HGHI-SH&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;DS-7204HGHI-SH&quot; src=&quot;http://congnghevang.net/image/data/u ghi Camera DS-7216HGHI-E1.png&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Đầu Ghi Hình 4 Kênh Hikvision DS-7204HGHI-SH:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Đầu ghi hình 4&amp;nbsp;kênhTurbo HD DVR&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Đầu ghi hỗ trợ 3 loại camera: HD-TVI camera , &amp;nbsp;Analog camera và IP camera (tối đa 4/8/16 camera TVI hoặc analog, và thêm tối đa 1 IP camera 2MP đối với đầu 4 kênh, 2 IP camera 2MP đối với đầu 8/16 kênh ). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Độ phân giải ghi hình: &amp;nbsp;(WD1: 25FPS), &amp;nbsp;1080P: 12FPS, 720P: 25FPS.&lt;/p&gt;\r\n\r\n&lt;p&gt;+ 1 cổng ra HDMI, 1 cổng ra VGA, 1 cổng RS485. &amp;nbsp; &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Khoảng cách kết nối đến camera: &lt;strong&gt;tối đa 500m với cáp đồng trục&lt;/strong&gt;.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;+ Hiển thị ra HDMI/VGA: &lt;strong&gt;độ&amp;nbsp;phân&amp;nbsp;giải 1920x1080P&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;+ &lt;strong&gt;Tối đa 128 người truy cập cùng lúc&lt;/strong&gt;. &lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;+ Hai luồng dữ liệu độc lập.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Hỗ trợ: 1 ổ cứng, 7216HGHI-SH 2 ổ cứng, tối đa 4TB/ổ. Audio: 1 ngõ vào và 1 ngõ ra&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Giới thiệu về thương hiệu Hikvision:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;Hikvision&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;là&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;thương hiệu&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;cung cấp lớn nhất thế giới các sản phẩm&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://congnghevang.net/camera-quan-sat&quot; style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); text-decoration: none; cursor: pointer; outline: none; font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;Camera quan sát&lt;/span&gt;&lt;/a&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;. Công ty chuyên về công nghệ giám sát video,&amp;nbsp;thiết kế và sản xuất các sản phẩm CCTV&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;,&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;giám sát video. Dòng sản phẩm của hãng bao gồm: camera, &lt;a href=&quot;http://congnghevang.net/dau-ghi-hinh-camera&quot;&gt;đầu ghi hình&lt;/a&gt;, cho tới các phần mềm quản lý video. Từ khi thành lập vào năm 2001, Hikvision đã nhanh chóng nắm giữ vị trí dẫn đầu thị trường thế giới trong ngành công nghiệp an ninh.&amp;nbsp;Hiện nay Hikvision đã trở thành&amp;nbsp;một doanh nghiệp toàn cầu với hơn&amp;nbsp;&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;20.&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;000 nhân viên&lt;/span&gt;&lt;/strong&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none; font-size: 14px; line-height: 20px; color: rgb(106, 106, 106); font-family: Arial, sans-serif;&quot;&gt;, bao gồm&lt;/span&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;4&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;.&lt;/span&gt;&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;2&lt;/strong&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(106, 106, 106); font-size: 14px; line-height: 20px; font-family: Arial, sans-serif;&quot;&gt;&lt;span lang=&quot;vi-VN&quot; style=&quot;box-sizing: border-box; border: none;&quot;&gt;00 kỹ sư chuyên nghiên cứu và phát triển sản phẩm&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Đầu Ghi Hình 4 Kênh Hikvision DS-7204HGHI-SH Độ phân giải ghi hình:  (WD1: 25FPS),  1080P: 12FPS, 720P: 25FPS', 'Hikvision DS-7204HGHI-SH, đầu ghi hình camera, đầu ghi hình Hikvision, đầu ghi hình HD-TVI', 'Hikvision DS-7204HGHI-SH, đầu ghi hình camera, đầu ghi hình Hikvision, đầu ghi hình HD-TVI'),
(289, 6, 'Khóa điện từ YLI YM-280LED', '&lt;p&gt;&lt;strong&gt;Khóa điện từ YLI YM-280LED&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Khoa cua tu YM-280LED.jpg&quot; style=&quot;width: 600px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Khóa điện từ YLI YM-280LED:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khóa khi cấp điện, nhả khi mất điện (Fail safe)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lực giữ 280kg (600 lbs)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Có Sensor trạng thái cửa, đèn LED chỉ thị trạng thái cửa&lt;/p&gt;\r\n\r\n&lt;p&gt;- Điện áp 12V/500mA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kích thước 250Lx48.5Wx25H(mm); kích thước má từ:180Lx38Wx11H(mm&lt;span style=&quot;line-height: 1.6em;&quot;&gt;)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Lắp đặt cho các loại cửa gỗ, kim loại, cửa kính, cửa chống cháy&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Rơle 500mA/24VDC&lt;/p&gt;\r\n\r\n&lt;p&gt;- Trọng lượng xấp xỉ 2.5 Kg&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phụ kiện đi kèm:&amp;nbsp;Lắp được với các bộ gá khóa MBK-280L,MBK-280ZL, MBK-280UL, MBK-280GZ, MBK-280I&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Bản vẽ kích thước chuẩn:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/kich-thuoc-YM280.jpg&quot; style=&quot;width: 800px; height: 373px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;line-height: 1.6em;&quot;&gt;Sơ đồ lắp đặt&amp;nbsp;Khóa điện từ YLI YM-280LED :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/so-do-YM280.jpg&quot; style=&quot;width: 800px; height: 705px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Ảnh thực tế lắp đặt hoàn thiện&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;Khóa điện từ YLI YM-280LED :&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/lap khoa tu  YM-280LED.jpg&quot; style=&quot;width: 600px; height: 480px;&quot; /&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n', 'Khóa điện từ YLI YM-280LED', 'Khóa điện từ YLI YM-280LED, khóa điện từ, khóa cửa từ, khóa từ YLI', 'Khóa điện từ YLI YM-280LED, khóa điện từ, khóa cửa từ, khóa YLI'),
(290, 6, 'Khoá điện từ đôi YM-280DLED', '&lt;p&gt;&lt;strong&gt;Khoá điện từ đôi YM-280DLED&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Yli-YM-280dled.jpg&quot; style=&quot;width: 500px; height: 332px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Khoá điện từ đôi YM-280DLED :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khóa khi cấp điện, nhả khi mất điện (Fail safe&lt;span style=&quot;line-height: 1.6em;&quot;&gt;)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Lực giữ 280kg x2 (600 lbs x 2)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Có Sensor trạng thái cửa, đèn LED chỉ thị trạng thái cửa&lt;/p&gt;\r\n\r\n&lt;p&gt;- Điện áp 12V/500mA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kích thước 500Lx47Wx25H(mm); kích thước má từ:180Lx38Wx11H(mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lắp đặt cho các loại cửa gỗ, kim loại, cửa kính, cửa chống cháy&lt;/p&gt;\r\n\r\n&lt;p&gt;- Trọng lượng xấp xỉ 4.2 Kg&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phụ kiện:&amp;nbsp;Lắp được với các bộ gá khóa MBK-280L,MBK-280ZL, MBK-280UL, MBK-280GZ, MBK-280I&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Bản vẽ kích thước chuẩn:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/kich-thuoc-YM280d.jpg&quot; style=&quot;width: 852px; height: 401px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Sơ đồ mô phỏng&amp;nbsp;lắp đặt&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Khoá điện từ đôi YM-280DLED :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/so-do-YM280d.jpg&quot; style=&quot;width: 900px; height: 529px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Khoá điện từ đôi YM-280DLED', 'Khoá điện từ đôi YM-280DLED, khóa điện từ, khóa cửa từ, khóa YLI', 'Khoá điện từ đôi YM-280DLED, khóa điện từ, khóa cửa từ, khóa YLI'),
(291, 6, 'Khoá điện từ YM-750LED', '&lt;p&gt;&lt;strong&gt;Khoá điện từ YM-750LED&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/khoa tu YM-750LED.jpg&quot; style=&quot;width: 600px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Khoá điện từ YM-750LED:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khóa khi cấp điện, nhả khi mất điện (Fail safe)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lực giữ 750kg (1500lbs&lt;span style=&quot;line-height: 1.6em;&quot;&gt;)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Có Sensor trạng thái cửa, đèn LED chỉ thị trạng thái cửa&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Điện áp 12V/24VDC&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Kích thước khóa 280Lx81.6Wx46H(mm); kích thước má từ: 190Lx70Wx13H(mm)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Dòng: 12V/420mA or 24V/210mA&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Trọng lượng xấp xỉ 5.9 Kg&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;-&amp;nbsp;&lt;/span&gt;Phù hợp với cánh cửa có trọng lượng lớn, cửa sắt chống cháy&lt;/p&gt;\r\n\r\n&lt;p&gt;- Lắp được với các bộ gá khóa MBK-750ZL&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Bản vẽ kích thước chuẩn:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/so do ym750led.jpg&quot; style=&quot;width: 600px; height: 350px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;Sơ đồ mô phỏng&amp;nbsp;lắp đặt :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; line-height: 20px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/so-do-YM-750led.jpg&quot; style=&quot;width: 632px; height: 471px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Khoá điện từ YM-750LED', 'Khoá điện từ YM-750LED, khoa cua tu, khoa dien tu, khoa tu YLI', 'Khoá điện từ YM-750LED, khoa cua tu, khoa dien tu, khoa tu YLI'),
(292, 6, 'Camera quan sát GLTECH GLP - HD12', '&lt;p&gt;&lt;strong&gt;Camera quan sát GLTECH GLP - HD12&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera GLP_HD12M.jpg&quot; style=&quot;width: 519px; height: 537px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát GLTECH GLP - HD12:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cảm biến hình ảnh: 1/3” Sony Cmos Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải: 1.3 Megapixel (1500TVL)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khung hình: 25/30fps@960P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng: 0.001 lux, 0 lux(IR ON)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính: 3.6mm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại: 2pcs IR-III Array Leds 5~10M&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tiêu chuẩn: IP44&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc: &amp;nbsp;+10°C to +50°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn: DC 12V - 1500mA&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát GLTECH GLP - HD12 Cảm biến hình ảnh: 1/3” Sony Cmos Image Sensor, Độ phân giải: 1.3 Megapixel', 'Camera quan sát GLTECH, camera quan sat, camera AHD', 'Camera quan sát GLTECH, camera quan sat, camera AHD'),
(293, 6, 'Camera GLTECH GLP - HD12M Full 1080P', '&lt;p&gt;&lt;strong&gt;Camera GLTECH GLP - HD12M Full 1080P&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera GLP_HD12M.jpg&quot; style=&quot;width: 519px; height: 537px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật camera&amp;nbsp;GLTECH GLP - HD12M Full 1080P:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải: 2.0 Megapixel&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khung hình: 25/30fps@1080P&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Độ nhạy sáng: 0.001 lux, 0 lux(IR ON)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính: 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hông ngoại: 2pcs IR-III Array Leds 5~10M&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tiêu chuẩn: IP44&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc: &amp;nbsp;+10°C to +50°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn: DC 12V - 1500mA&lt;/p&gt;\r\n', 'Camera GLTECH GLP - HD12M  Full 1080P Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor, Độ phân giải: 2.0 Megapixel', 'Camera GLTECH GLP - HD12M, camera quan sat, camera AHD, camera GLTECH', 'Camera GLTECH GLP - HD12M, camera quan sat, camera AHD, camera GLTECH'),
(294, 6, 'Camera quan sát GLTECH GLP-HD1P ', '&lt;p&gt;&lt;strong&gt;Camera quan sát GLTECH GLP-HD1P&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/GLP-HD1P.jpg&quot; style=&quot;width: 225px; height: 225px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát GLTECH GLP-HD1P&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;-&amp;nbsp;Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải : &amp;nbsp;2.0 Mega-pixel&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khung hình: 25/30fps@960P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng: 0.001 lux, 0 lux(IR ON)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính: 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại: 1pcs IR-III Array Leds 15-20M&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn IP66&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc: &amp;nbsp;10°C to +50°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn: DC 12V - 1500mA&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát GLTECH GLP-HD1P  Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor, Độ phân giải :  2.0 Mega-pixel', 'Camera quan sát GLTECH GLP-HD1P , camera quan sat, camera AHD, camera GLTECH', 'Camera quan sát GLTECH GLP-HD1P , camera quan sat, camera AHD, camera GLTECH'),
(295, 6, 'Camera quan sát GLTECH GLP-HD13', '&lt;p&gt;Camera quan sát GLTECH GLP-HD13&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera glp- hd13.jpg&quot; style=&quot;width: 717px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Thông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera quan sát GLTECH GLP-HD13:&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải : &amp;nbsp;1.3 Mega-pixel &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khung hình: 25/30fps@960P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng: 0.001 lux, 0 lux(IR ON)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính: 3.6mm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại: 3pcs IR-III Array Leds 15M&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn IP66&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc: &amp;nbsp;10°C to +50°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn: DC 12V - 1500mA&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát GLTECH GLP-HD13 Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor, Độ phân giải :  1.3 Mega-pixel', 'Camera quan sát GLTECH GLP-HD13, camera quan sat, camera AHD, camera GLTECH', 'Camera quan sát GLTECH GLP-HD13, camera quan sat, camera AHD, camera GLTECH'),
(296, 6, 'Camera quan sát GLP-HD13M  Full 1080p', '&lt;p&gt;Camera quan sát GLP-HD13M Full&amp;nbsp;1080p&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera glp- hd13.jpg&quot; style=&quot;width: 717px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải : 2.0 Mega-pixel&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khung hình: 25/30fps@960P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng: 0.001 lux, 0 lux(IR ON)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính: 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại: 3pcs IR-III Array Leds 15M&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn IP66&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc: &amp;nbsp;10°C to +50°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn: DC 12V - 1500mA&lt;/p&gt;\r\n', 'Camera quan sát GLP-HD13M  Full 1080p Cảm biến hình ảnh: 1/2.8” Sony Cmos Image Sensor, Độ phân giải : 2.0 Mega-pixel', 'Camera quan sát GLP-HD13M, camera quan sat, camera AHD, camera GLTECH', 'Camera quan sát GLP-HD13M, camera quan sat, camera AHD, camera GLTECH'),
(297, 6, 'Máy Chấm Công Vân Tay RONALD JACK X88', '&lt;p&gt;&lt;strong&gt;MÁY CHẤM CÔNG BẰNG VÂN TAY &amp;nbsp;RONALD JACK X-88&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Máy chấm công Ronald Jack X88.JPG&quot; style=&quot;width: 810px; height: 604px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;Tính Năng:&lt;/u&gt;&lt;/strong&gt;&lt;br /&gt;\r\nChấm công bằng vân tay, password&lt;br /&gt;\r\nQuản lý được 1.500 vân tay ,&lt;br /&gt;\r\nBộ nhớ lưu 100,000 lần chấm công .&lt;br /&gt;\r\nThời gian quét vân tay : 1s.&lt;br /&gt;\r\nThông báo kết quả đọc vân tay đúng / sai bằng âm thanh.&lt;br /&gt;\r\nLấy dữ liệu trực tiếp từ máy chấm công bằng USB .&lt;br /&gt;\r\nXuất báo cáo trực tiếp ra tập tin Excel bằng tiếng việt.&lt;br /&gt;\r\nMàn hình màu sang trọng&lt;br /&gt;\r\n&lt;strong&gt;Không cần sử dụng phần mềm chấm công.&lt;/strong&gt;&lt;br /&gt;\r\nCông nghệ mới nhất&amp;nbsp;&lt;br /&gt;\r\n&lt;strong&gt;&lt;u&gt;Ưu điểm:&lt;/u&gt;&lt;/strong&gt;&lt;br /&gt;\r\n- Bảo mật cao: không chấm công dùm được.&lt;br /&gt;\r\n• Chấm công theo ca, giờ hành chánh…phù hợp với nhu cầu của các công ty, xưởng sản xuất, nhà hàng&lt;em&gt;,…&lt;/em&gt;&lt;/p&gt;\r\n', 'Máy Chấm Công Vân Tay RONALD JACK X88', 'May cham cong x88, may cham cong, may cham cong van tay, may cham cong ronald jack', 'May cham cong x88, may cham cong, may cham cong van tay, may cham cong ronald jack'),
(298, 6, 'Màn hình màu chuông hình Commax CDV-43N', '&lt;p&gt;&lt;strong&gt;Màn hình màu chuông hình Commax CDV-43N&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/COMMAX-CDV-43N.jpg&quot; style=&quot;width: 628px; height: 506px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&lt;/strong&gt;&amp;nbsp;&lt;strong&gt;m&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;àn hình màu chuông hình Commax CDV-43N&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Màn hình màu 4.3&quot; TFT Digital, có tay nghe&lt;/p&gt;\r\n\r\n&lt;p&gt;- Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét&lt;/p&gt;\r\n\r\n&lt;p&gt;- Âm thanh to rõ trung thực,có các phím điều chỉnh âm lượng to nhỏ&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết hợp với khóa điện từ để mở cửa&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối 2 camera gọi cửa ở hai cổng khác nhau&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối mở rộng thêm tay nghe phụ (DP-4VHP)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối 4 dây khoảng cách từ camera cửa đến màn hình là 50m(dây Æ0.65mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn 110~240 VAC.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Màn hình màu chuông hình Commax CDV-43N, Màn hình màu 4.3&quot; TFT Digital, có tay nghe, Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét', 'chuong hinh, chuong cua co hinh, chuong hinh commax, Commax CDV-43N', 'chuong hinh, chuong cua co hinh, chuong hinh commax, Commax CDV-43N'),
(299, 6, 'Màn hình chuông cửa Commax CDV-43Q', '&lt;p&gt;&lt;strong&gt;Màn hình chuông cửa Commax CDV-43Q&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/cdv 43q.png&quot; style=&quot;width: 646px; height: 428px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/668_cdv_43q_3_.png&quot; style=&quot;width: 646px; height: 428px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng màn hình màu chuông cửa&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Commax CDV-43Q&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Màn hình màu 4.3&quot; TFT Digital, không tay nghe&lt;/p&gt;\r\n\r\n&lt;p&gt;- Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét&lt;/p&gt;\r\n\r\n&lt;p&gt;- Phím bấm cảm ứng&lt;/p&gt;\r\n\r\n&lt;p&gt;- Âm thanh to rõ,có các phím điều chỉnh âm lượng&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết hợp với khóa điện từ để mở cửa&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối 2 camera gọi cửa ở hai cổng khác nhau&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối mở rộng thêm tay nghe phụ (DP-4VHP)&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kết nối 4 dây khoảng cách từ camera cửa đến màn hình là 50m(dây Æ0.65mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Nguồn 110~240 VAC.&lt;/p&gt;\r\n', 'Màn hình chuông cửa Commax CDV-43Q Màn hình màu 4.3&quot; TFT Digital, không tay nghe, Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét', 'chuong hinh, chuong cua co hinh, chuong hinh Commax, Commax CDV-43Q', 'chuong hinh, chuong cua co hinh, chuong hinh Commax, Commax CDV-43Q');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(300, 6, 'Màn hình màu chuông cửa Commax CDV-70K', '&lt;p&gt;&lt;strong&gt;Màn hình màu chuông cửa Commax CDV-70K&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;COMMAX là nhà sản xuất thiết bị an ninh tích hợp hàng đầu thế giới tại Hàn Quốc, Sản phẩm &lt;a href=&quot;http://congnghevang.net/chuong-cua-co-hinh&quot;&gt;chuông cửa có hình&lt;/a&gt;&amp;nbsp;của COMMAX được đánh giá là sản phẩm bán chạy nhất thế giới, chất lượng hình ảnh thật rõ nét cộng với độ bền bỉ khi sử dụng là 1 thế mạnh của sản phẩm này.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;COMMAX CDV-70K - Hệ thống chuông cửa kèm theo hình ảnh khách hiện lên sẽ giúp gia đình bạn thật chủ động hơn trong việc đón khách đến nhà bạn.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Bạn có thể nói chuyện và thấy hình ảnh của khách ngay chính hệ thống chuông cửa nhà mình.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Kết hợp với tính năng mở của từ xa trên màn hình, thật thuận tiện và tiết kiệm thời gian.&lt;br style=&quot;padding: 0px; margin: 0px;&quot; /&gt;\r\n- Phong cách hiện đại và thật sự tiện nghi cho ngôi nhà của bạn&lt;br style=&quot;padding: 0px; margin: 0px;&quot; /&gt;\r\n- Chuông cửa màn hình CDV 70K kết hợp với Camera DRC 4MC, 4CH, 4MC, 40K, 40CP .... hoặc các loại camera khác ..... là 1 sự lựa chọn lý tưởng cho ngôi nhà của bạn&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Chuong Hinh_COMMAX-CDV-70K.jpg&quot; style=&quot;width: 640px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&lt;strong&gt;Tính năng của&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Màn hình màu chuông cửa Commax CDV-70K&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;-&amp;nbsp;Màn hình màu 7&quot; TFT Digital, có tay nghe&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Thiết kế mới mỏng, dài, phím bấm cảm ứng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Âm thanh to rõ trung thực,có các phím điều chỉnh âm lượng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Kết hợp với khóa điện từ để mở cửa&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Kết nối 2 camera gọi cửa ở hai cổng khác nhau&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Kết nối mở rộng thêm tay nghe phụ (DP-4VHP)&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Kết nối 4 dây khoảng cách từ camera cửa đến màn hình là 50m(dây Æ0.65mm)&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;- Nguồn 110~240 VAC.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px; margin: 0px; color: rgb(5, 33, 43); font-family: Arial, Helvetica, sans-serif; line-height: 18px; text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Màn hình màu chuông cửa Commax CDV-70K Màn hình màu 7&quot; TFT Digital, có tay nghe, Công nghệ đèn Led chiếu hậu cho hình ảnh đẹp và sắc nét', 'chuong hinh, chuong cua co hinh, chuong hinh  commax, Commax CDV-70K', 'chuong hinh, chuong cua co hinh, chuong hinh  commax, Commax CDV-70K'),
(304, 6, 'Camera AHD thân hồng ngoại KCE-EBTIA6636CB', '&lt;p&gt;Camera AHD thân hồng ngoại KCE-EBTIA6636CB&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera-AHD-KCE-EBTIA6636CB-congnghevang.net&quot; src=&quot;http://congnghevang.net/image/data/Camera-AHD-KCE-EBTIA6636CB.jpg&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Tính năng&amp;nbsp;Camera AHD thân hồng ngoại KCE-EBTIA6636CB:&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;br /&gt;\r\n• Cảm biến hình ảnh 1/2.7&quot; 2Megapixel CMOS&amp;nbsp;&lt;br /&gt;\r\n• Độ phân giải: FULL HD 1920 x 1080 (1080P)&lt;br /&gt;\r\n• Độ nhạy sáng: &amp;nbsp;0.2Lux (F1.2)&lt;br /&gt;\r\n• Ống kính : 3.6mm&amp;nbsp;&lt;br /&gt;\r\n• Đèn hồng ngoại: 36 bóng&lt;br /&gt;\r\n• Điện áp đầu vào 12VDC&lt;br /&gt;\r\n* Cấp độ bảo vệ IP66&lt;/p&gt;\r\n\r\n&lt;p&gt;Thông số kĩ thuật:&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px; width: 485px;&quot; width=&quot;485&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;IMAGE SENSOR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;1/2.7″ 2Megapixel CMOS Image Sensor&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;EFFECTIVE PIXEL&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;1930 (H) × 1088 (V)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;SCANNING SYSTEM&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;Progressive&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;SYNCHRONIZATION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;HORIZONTAL RESOLUTION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;1080 30P / 25P&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;VIDEO OUTPUT&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;AHD 2.0&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;S/N (Y Signal)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;More than 50dB&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;Min. ILLUMINATION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;0.2Lux (F1.2)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;IRIS ADJUSTMENT&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;ESC&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;LENS&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;3.6mm VARIFOCAL LENS (ICR)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;ELECTRONIC SHUTTER&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;AUTO(1/30~1/10,000)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;OSD LANGUAGE&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;ENG / CHN&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;BACKLIGHT COMPENSATION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;OFF/HLC/BLC&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;Day &amp;amp; Night&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;COLOR / B&amp;amp;W / AUTO / EXT&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;D-WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;AUTO GAIN CONTROL&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;AUTO (1~5 Adj.)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;WHITE BALANCE&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;AUTO / HOLD / 3200K / 4200K / 6000K / 8000K&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;PRIVACY MASKING&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;ON/OFF&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;DNR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;SMART IR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;LSC&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;Gamma&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;DEFOG&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;DIGITAL ZOOM&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;DAEAD PIXEL COMPENSATION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;SENS-UP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;MOTION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;ON/OFF&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;DIGITAL EFFECT&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;MIRROR/ELIP&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;COMMUNICATION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;–&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;IR LED&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;36PCS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;INPUT VOLTAGE&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;DC 12V(±10%)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;POWER CONSUMPTION&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;IR OFF : 150mA (MAX) / IR ON : 400mA (MAX)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;OPERATING TEMP. / HUM.&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;-10℃ ~ +50℃ / MAX 90% RH&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;155&quot;&gt;STORAGE TEMP. / HUM.&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot;&gt;-20℃ ~ +60℃ / MAX 90% RH&lt;br /&gt;\r\n			&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc và được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giam sát của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp lắp đặt camera quan sát KCE chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm.&lt;/p&gt;\r\n', 'Camera AHD thân hồng ngoại KCE-EBTIA6636CB • Công nghệ AHD 2.0 MEGAPIXEL• Cảm biến hình ảnh 1/2.7&quot; 2Megapixel CMOS ', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai'),
(305, 6, 'Camera AHD thân hồng ngoại KCE-SBTIA6054CB', '&lt;p&gt;&lt;strong&gt;Camera AHD thân hồng ngoại KCE-SBTIA6054CB&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera-AHD-KCE-EBTIA6054CB&quot; src=&quot;http://congnghevang.net/image/data/Camera-AHD-KCE-EBTIA6054CB.jpg&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD thân hồng ngoại KCE-SBTIA6054CB:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;/p&gt;\r\n\r\n&lt;p&gt;• Cảm biến hình ảnh &amp;nbsp;1/2.9&quot; 2.1Megapixel Sony Exmor CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ phân giải: FULL HD 1920 x 1080 (1080P)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ nhạy sáng: 0.02Lux(Sens-UP X30)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Ống kính : 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Đèn hồng ngoại: 54 bóng&lt;/p&gt;\r\n\r\n&lt;p&gt;• Giảm nhiễu kỹ thuật số 3DNR&lt;/p&gt;\r\n\r\n&lt;p&gt;• Điện áp đầu vào 12VDC&lt;/p&gt;\r\n\r\n&lt;p&gt;* Cấp độ bảo vệ IP66. Vỏ hợp kim&lt;/p&gt;\r\n\r\n&lt;p&gt;* Bảo hành : 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;* Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px;&quot; width=&quot;525&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Mã sản phẩm&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE-SBTIA6054CB&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hãng sản xuất&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Chế độ bảo hành&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 tháng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cảm biến hình ảnh&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;1/2.9″ 2.1Megapixel Sony Exmor CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ phân giải&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;FULL HD 1920 x 1080 (1080P)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo số lượng đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;54 bóng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Công nghệ đèn hồng ngoại EXIR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại chip&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Chip CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ nhạy sáng tối thiểu&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;0.02Lux(Sens-UP X30)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tốc độ ghi hình&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;&amp;nbsp;25fps&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo ống kính&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;3.6mm&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Góc quan sát (độ)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;85°&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tầm quan sát xa&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;80m&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ khác&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Cắt lọc hồng ngoại ICR . Giảm nhiễu kỹ thuật số 3DNR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tiêu chuẩn IP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;IP66&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Thiết kế phù hợp&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Trong nhà và ngoài trời&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Khe cắm thẻ nhớ MicroSD&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tính năng Push Video&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Pan / Tilt / Zoom kỹ thuật số&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tương thích ONVIF&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cổng LAN&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nhiệt độ hoạt động&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;– 30℃~60℃&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Công suất tiêu thụ (±10%)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Max 10W (DC Adapter)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nguồn điện&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;DC 12V-1A&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc và được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giam sát của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp lắp đặt camera quan sát KCE chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm 24 tháng.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera AHD thân hồng ngoại KCE-SBTIA6054CB • Công nghệ AHD 2.0 MEGAPIXEL• Cảm biến hình ảnh  1/2.9&quot; 2.1Megapixel Sony Exmor CMOS', 'Camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai', 'Camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai'),
(306, 6, 'Camera AHD thân hồng ngoại KCE-CBTIA6048D', '&lt;p&gt;&lt;strong&gt;Camera AHD thân hồng ngoại KCE-CBTIA6048D&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-quan-sat-kce-cbtia6048d&quot; src=&quot;http://congnghevang.net/image/data/kce-cbtia6048d.jpg&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&amp;nbsp;Camera AHD thân hồng ngoại KCE-CBTIA6048D:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;/p&gt;\r\n\r\n&lt;p&gt;• Cảm biến hình ảnh 1/2.9&quot; 2.1Megapixel Sony Exmor CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ phân giải: FULL HD 1920 x 1080 (1080P)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ nhạy sáng: &amp;nbsp;0.02Lux(Sens-UP X30)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Ống kính : 3~11mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Đèn hồng ngoại: 48 bóng&lt;/p&gt;\r\n\r\n&lt;p&gt;• Điện áp đầu vào 12VDC&lt;/p&gt;\r\n\r\n&lt;p&gt;* Cấp độ bảo vệ IP66. Vỏ hợp kim&lt;/p&gt;\r\n\r\n&lt;p&gt;* Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;* Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px;&quot; width=&quot;525&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Mã sản phẩm&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE-CBTIA6048D&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hãng sản xuất&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Chế độ bảo hành&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 tháng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cảm biến hình ảnh&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;1/2.9″ 2.1Megapixel Sony Exmor CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ phân giải&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;FULL HD 1920 x 1080 (1080P)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo số lượng đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;48 bóng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Công nghệ đèn hồng ngoại EXIR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại chip&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Chip CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ nhạy sáng tối thiểu&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;0.02Lux(Sens-UP X30)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tốc độ ghi hình&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;&amp;nbsp;25fps&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo ống kính&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;3~11mm&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Góc quan sát (độ)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;85°&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tầm quan sát xa&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;80m&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ khác&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Cắt lọc hồng ngoại ICR . Giảm nhiễu kỹ thuật số 3DNR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tiêu chuẩn IP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;IP66&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Thiết kế phù hợp&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Trong nhà và ngoài trời&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Khe cắm thẻ nhớ MicroSD&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tính năng Push Video&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Pan / Tilt / Zoom kỹ thuật số&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tương thích ONVIF&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cổng LAN&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nhiệt độ hoạt động&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;– 30℃~60℃&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Công suất tiêu thụ (±10%)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Max 10W (DC Adapter)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nguồn điện&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;DC 12V-1A&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc và được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giam sát của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp lắp đặt camera quan sát KCE chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm 24 tháng.&lt;/span&gt;&lt;/p&gt;\r\n', 'Camera AHD thân hồng ngoại KCE-CBTIA6048D • Công nghệ AHD 2.0 MEGAPIXEL • Cảm biến hình ảnh 1/2.9&quot; 2.1Megapixel Sony Exmor CMOS', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera than hong ngoai'),
(302, 6, 'Camera AHD bán cầu KCE-DTIA6024', '&lt;p&gt;&lt;strong&gt;Camera AHD bán cầu KCE-DTIA6024&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-KCE-DTIA6024-congnghevang.net&quot; src=&quot;http://congnghevang.net/image/data/KCE-DSPTI6524.jpg&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&amp;nbsp;kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD bán cầu KCE-DTIA6024:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;/p&gt;\r\n\r\n&lt;p&gt;• Cảm biến hình ảnh 1/2.9&quot; 2.1Megapixel Sony Exmor CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ nhạy sáng: &amp;nbsp;0.02Lux(Sens-UP X30)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Ống kính : 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Đèn hồng ngoại: 24 bóng&lt;/p&gt;\r\n\r\n&lt;p&gt;• Giảm nhiễu kỹ thuật số 3DNR&lt;/p&gt;\r\n\r\n&lt;p&gt;• Điện áp đầu vào 12VDC. Vỏ hợp kim&lt;/p&gt;\r\n\r\n&lt;p&gt;* Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;* Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px;&quot; width=&quot;525&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Mã sản phẩm&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE DTIA6024&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hãng sản xuất&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Chế độ bảo hành&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 tháng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cảm biến hình ảnh&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;1/2.9″ 2.1Megapixel Sony Exmor CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ phân giải&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;FULL HD 1920 x 1080 (1080P)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo số lượng đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 bóng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Công nghệ đèn hồng ngoại EXIR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại chip&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Chip CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ nhạy sáng tối thiểu&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;0.02Lux(Sens-UP X30)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tốc độ ghi hình&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;&amp;nbsp;25fps&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo ống kính&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;3.6mm&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Góc quan sát (độ)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;85°&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tầm quan sát xa&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;80m&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ khác&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Cắt lọc hồng ngoại ICR . Giảm nhiễu kỹ thuật số 3DNR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tiêu chuẩn IP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;IP66&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Thiết kế phù hợp&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Trong nhà&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Khe cắm thẻ nhớ MicroSD&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tính năng Push Video&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Pan / Tilt / Zoom kỹ thuật số&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tương thích ONVIF&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cổng LAN&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nhiệt độ hoạt động&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;– 30℃~60℃&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Công suất tiêu thụ (±10%)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Max 10W (DC Adapter)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nguồn điện&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;DC 12V-1A&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc và được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giám sát của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp lắp đặt camera quan sát KCE chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm 24 tháng&lt;/p&gt;\r\n', 'Camera AHD bán cầu KCE-DTIA6024 Công nghệ AHD 2.0 MEGAPIXEL • Cảm biến hình ảnh 1/2.9&quot; 2.1Megapixel Sony Exmor CMOS • Độ phân giải: 1920 x 1080', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera ban cau ', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera ban cau ');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(303, 6, 'Camera AHD bán cầu KCE-SDTIA6030D', '&lt;p&gt;&lt;strong&gt;Camera AHD bán cầu KCE-SDTIA6030D&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera-ban-cau-KCE-SDTIA6030D-congnghevang.net&quot; src=&quot;http://congnghevang.net/image/data/kce-sdtia6630v.jpg&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&amp;nbsp;Camera AHD bán cầu KCE-SDTIA6030D:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;/p&gt;\r\n\r\n&lt;p&gt;• Cảm biến hình ảnh &amp;nbsp;1/2.9&quot; 2.1Megapixel Sony Exmor CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ phân giải: FULL HD 1920 x 1080 (1080P)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ nhạy sáng: 0.02Lux(Sens-UP X30)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Ống kính : 2.8~12mm DC IRIS LENS (ICR TYPE)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Đèn hồng ngoại: 30 bóng&lt;/p&gt;\r\n\r\n&lt;p&gt;• Giảm nhiễu kỹ thuật số 3DNR&lt;/p&gt;\r\n\r\n&lt;p&gt;• Điện áp đầu vào 12VDC. Vỏ nhựa&lt;/p&gt;\r\n\r\n&lt;p&gt;* Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;* Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px;&quot; width=&quot;525&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Mã sản phẩm&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE-SDTIA6030D&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hãng sản xuất&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Chế độ bảo hành&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 tháng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cảm biến hình ảnh&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;1/2.9″ 2.1Megapixel Sony Exmor CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ phân giải&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;FULL HD 1920 x 1080 (1080P)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo số lượng đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;30 bóng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Công nghệ đèn hồng ngoại EXIR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại chip&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Chip CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ nhạy sáng tối thiểu&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;0.02Lux(Sens-UP X30)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tốc độ ghi hình&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;&amp;nbsp;25fps&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo ống kính&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;2.8~12mm DC IRIS LENS (ICR TYPE)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Góc quan sát (độ)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;85°&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tầm quan sát xa&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;80m&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ khác&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Cắt lọc hồng ngoại ICR . Giảm nhiễu kỹ thuật số 3DNR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tiêu chuẩn IP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;IP66&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Thiết kế phù hợp&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Trong nhà&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Khe cắm thẻ nhớ MicroSD&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tính năng Push Video&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Pan / Tilt / Zoom kỹ thuật số&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tương thích ONVIF&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cổng LAN&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nhiệt độ hoạt động&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;– 30℃~60℃&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Công suất tiêu thụ (±10%)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Max 10W (DC Adapter)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nguồn điện&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;DC 12V-1A&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc và được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giám sát của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp lắp đặt camera quan sát KCE chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera AHD bán cầu KCE-SDTIA6030D • Công nghệ AHD 2.0 MEGAPIXEL • Cảm biến hình ảnh  1/2.9&quot; 2.1Megapixel Sony Exmor CMOS', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera ban cau', 'camera quan sat, camera giam sat, camera AHD, camera KCE, camera ban cau'),
(301, 6, 'Camera AHD bán cầu KCE-SPTIA6024', '&lt;p&gt;&lt;strong&gt;Camera AHD bán cầu KCE-SPTIA6024&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-KCE-SPTIA6024-congnghevang.net&quot; src=&quot;http://congnghevang.net/image/data/kce-sptia6624-500x500.png&quot; style=&quot;width: 500px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD bán cầu KCE-SPTIA6024&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Công nghệ AHD 2.0 MEGAPIXEL&lt;/p&gt;\r\n\r\n&lt;p&gt;• Cảm biến hình ảnh &amp;nbsp;1/2.9&quot; 2.1Megapixel Sony Exmor CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ phân giải: FULL HD 1920 x 1080 (1080P)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Độ nhạy sáng: &amp;nbsp;0.2(Sens-UP X30)&lt;/p&gt;\r\n\r\n&lt;p&gt;• Ống kính : 3.6mm&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;• Đèn hồng ngoại: 24 bóng&lt;/p&gt;\r\n\r\n&lt;p&gt;• Giảm nhiễu kỹ thuật số 3DNR&lt;/p&gt;\r\n\r\n&lt;p&gt;• Điện áp đầu vào 12VDC. Vỏ nhựa&lt;/p&gt;\r\n\r\n&lt;p&gt;* Made in Korea&lt;/p&gt;\r\n\r\n&lt;p&gt;* Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;table border=&quot;1&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(17, 17, 17); font-family: Arial, ''Helvetica Neue'', Helvetica, sans-serif; line-height: 18.852px;&quot; width=&quot;525&quot;&gt;\r\n	&lt;tbody style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Mã sản phẩm&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE SPTIA6024&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hãng sản xuất&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;KCE&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Chế độ bảo hành&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 tháng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cảm biến hình ảnh&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;1/2.9″ 2.1Megapixel Sony Exmor CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ phân giải&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;FULL HD 1920 x 1080 (1080P)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo số lượng đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;24 bóng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại đèn LEDs&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Công nghệ đèn hồng ngoại EXIR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo loại chip&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Chip CMOS&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Độ nhạy sáng tối thiểu&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;0.2(Sens-UP X30)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tốc độ ghi hình&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;&amp;nbsp;25fps&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Camera theo ống kính&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;3.6mm&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Góc quan sát (độ)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;85°&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tầm quan sát xa&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;80m&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ WDR&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Hỗ trợ khác&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Cắt lọc hồng ngoại ICR . Giảm nhiễu kỹ thuật số 3DNR&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tiêu chuẩn IP&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;IP66&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Thiết kế phù hợp&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Trong nhà&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Khe cắm thẻ nhớ MicroSD&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tính năng Push Video&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Pan / Tilt / Zoom kỹ thuật số&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Tương thích ONVIF&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;không&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Cổng LAN&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;có&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nhiệt độ hoạt động&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;– 30℃~60℃&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Công suất tiêu thụ (±10%)&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;Max 10W (DC Adapter)&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;padding: 0px; margin: 0px;&quot;&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;266&quot;&gt;Nguồn điện&lt;/td&gt;\r\n			&lt;td style=&quot;padding: 0px; margin: 0px;&quot; width=&quot;372&quot;&gt;DC 12V-1A&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;KCE là thương hiệu camera quan sát nổi tiếng của Hàn Quốc&amp;nbsp;được rất nhiều khách hàng tin dùng. Camera KCE luôn có mặt trong hệ thống an ninh giám sát&amp;nbsp;của các công trình lớn trên khắp các tỉnh thành. Công Ty GOLDTECH chuyên cung cấp &lt;a href=&quot;http://congnghevang.net/camera-quan-sat-kce&quot;&gt;lắp đặt camera quan sát KCE&lt;/a&gt; chính hãng, xuất xứ rõ ràng, đầy đủ CO – CQ , bảo hành chính hãng sản phẩm 24 tháng&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera AHD bán cầu KCE-SPTIA6024 Công nghệ AHD 2.0 MEGAPIXEL, Cảm biến hình ảnh  1/2.9&quot; 2.1Megapixel Sony Exmor CMOS, Độ phân giải: FULL HD 1920 x 1080', 'Camera quan sat, camera AHD, camera KCE, camera ban cau, camera giam sat', 'Camera quan sat, camera AHD, camera KCE, camera ban cau, camera giam sat'),
(307, 6, 'Camera quan sát ICAM-193HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-193HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;camera ICAM 193HD&quot; src=&quot;http://congnghevang.net/image/data/icam 191hd.jpg&quot; style=&quot;width: 269px; height: 278px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera quan sát ICAM-193HD:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera Dome trong nhà hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 3.6mm(4,6mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành: 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-193HD Chuẩn AHD độ phân giải1.3Megapixel(2431H+AP0130) HD720P. Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.', 'camera quan sat, camera giam sat, camera icam, camera AHD, camera ICAM-193HD', 'camera quan sat, camera giam sat, camera icam, camera AHD, camera ICAM-193HD'),
(308, 6, 'Camera quan sát ICAM-194HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-194HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;Camera-quan-sat-icam-194hd&quot; src=&quot;http://congnghevang.net/image/data/icam 191hd.jpg&quot; style=&quot;width: 269px; height: 278px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát ICAM-194HD:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera bán cầu&amp;nbsp;trong nhà hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 2.0 Megapixel , HD 1080P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 3.6mm(4,6mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành: 24 tháng&lt;/p&gt;\r\n', 'Camera quan sát ICAM-194HD Chuẩn AHD độ phân giải 2.0 Megapixel , HD 1080P', 'camera quan sat, camera giam sat, camera AHD, camera ICAM, camera ICAM-194HD, camera ban cau', 'camera quan sat, camera giam sat, camera AHD, camera ICAM, camera ICAM-194HD, camera ban cau'),
(309, 6, 'Đèn ốp trần cảm ứng AM-323', '&lt;p&gt;&lt;strong&gt;Đèn ốp trần cảm ứng AM-323&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Là thiết bị điện thông minh&amp;nbsp;dùng để bật tắt đèn chiếu sáng, hoạt động nhờ đầu cảm ứng hồng ngoại khi trời tối có người chuyển động trong vùng quét.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/en op tran cam ung hong ngoai.png&quot; style=&quot;width: 620px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Ứng dụng&lt;/strong&gt;: Dùng để tắt/ mở đèn hành lang, ban công , nhà bếp, sân vườn, phòng khách&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Đế thép sơn tĩnh điện, chụp thủy tinh siêu bền, không ố vàng&lt;/p&gt;\r\n\r\n&lt;p&gt;* Đường Kính: 300mm, có sẵn 2 đuôi đèn E27 để lắp bóng đèn,&lt;/p&gt;\r\n\r\n&lt;p&gt;* Khoảng cách bán kính 8~10m, 120x360o.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Độ cao lắp đặt 1.5 ~ 4m&lt;/p&gt;\r\n\r\n&lt;p&gt;* Độ sáng mở chức năng cảm ứng 2~2000 Lux (khi không đủ ánh sáng mới mở đèn, có thể điều chỉnh độ sáng), Thời gian trễ&amp;nbsp; điều chỉnh từ 10 ~480 giây (thời gian tắt đèn sau khi rời khỏi vùng cảm ứng, có thể điều chỉnh)&lt;/p&gt;\r\n\r\n&lt;p&gt;* Công suất tiêu thụ 0.5~0.9w/h. Công suất tải max 100W&lt;/p&gt;\r\n\r\n&lt;p&gt;* Điện áp: 220V ~ 240V / 50Hz ~ 60Hz&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Hướng dẫn sử dụng:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Nút Thời gian: vặn nút thời gian( TIME ) ở khoảng giữa là khoảng 3~4 phút sẽ tắt sau khi rời khỏi vùng cảm ứng.( thời gian điều chỉnh từ 8 giây đến 8 phút ). &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Nút Ánh Sáng: vặn nút LUX về phía mặt trăng thì chỉ cảm ứng khi không đủ ánh sáng (khi trời tối), chức năng này giúp tiết kiệm điện vì vào ban ngày thì có ánh sáng mặt trời nên sẽ không cảm ứng. Cấp nguồn vào cho thiết bị, chỉnh độ sáng và thời gian thích hợp để thiết bị cảm ứng.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Đèn ốp trần cảm ứng AM-323 là thiết bị dùng để bật tắt đèn chiếu sáng, hoạt động nhờ đầu cảm ứng hồng ngoại khi trời tối có người chuyển động trong vùng quét.', 'den cam ung, thiet bi cam ung, den cam ung hong ngoai, thiet bi dien thong minh, nha thong minh', 'den cam ung, thiet bi cam ung, den cam ung hong ngoai, thiet bi dien thong minh, nha thong minh'),
(310, 6, 'Đèn cảm ứng ốp trần AM 326', '&lt;p&gt;&lt;strong&gt;Đèn cảm ứng ốp trần AM 326&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Là thiết bị điện thông minh&amp;nbsp;dùng để bật tắt đèn chiếu sáng, hoạt động nhờ đầu cảm ứng hồng ngoại khi trời tối có người chuyển động trong vùng quét.&lt;/p&gt;\r\n\r\n&lt;p&gt;Ứng dụng: Dùng để tắt/ mở đèn hành lang, ban công , nhà bếp, sân vườn, phòng khách&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/den cam ung op tran AM326.png&quot; style=&quot;width: 668px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Chao đèn làm bằng nhựa độ bền cao&lt;/p&gt;\r\n\r\n&lt;p&gt;* Dường kính đèn 30cm, có sẵn 2 đui đẻ lắp bóng đèn&lt;/p&gt;\r\n\r\n&lt;p&gt;* Điều chỉnh được cảm biến ánh sáng 10-2000lux&lt;/p&gt;\r\n\r\n&lt;p&gt;* Điều chỉnh được thời gian tắt mở từ 10-360 giây.&lt;/p&gt;\r\n\r\n&lt;p&gt;* Khoảng cách cảm ứng 6-8m&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Lắp đặt:&lt;/strong&gt; Mở chóa đèn đánh dấu lỗ mâm lên trên trần nhà, khoan lỗ và gắn thiết bị lên nơi thích hợp để thiết bị cảm ứng, đấu dây nguồn vào 2 chân vít trên thiết bị. Lắp chóa đèn cấp điện cho thiết bị.&amp;nbsp;&lt;/p&gt;\r\n', 'Đèn cảm ứng ốp trần AM 326 là thiết bị điện thông minh dùng để bật tắt đèn chiếu sáng, hoạt động nhờ đầu cảm ứng hồng ngoại khi trời tối có người chuyển động trong vùng quét.', 'den cam ung, thiet bi cam ung, den cam ung hong ngoai, thiet bi dien thong minh, nha thong minh', 'den cam ung, thiet bi cam ung, den cam ung hong ngoai, thiet bi dien thong minh, nha thong minh'),
(311, 6, 'Công tắc mở đèn khi có người và trời tối AM-SS68', '&lt;p&gt;&lt;strong&gt;Công tắc mở đèn khi có người và trời tối AM-SS68&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Đây là thiết bị cảm biến nhận diện sự chuyển động của con người. Tự động mở đèn khi có người di chuyển và thiếu ánh sáng (dưới 10 lux – 6:30 tối).&lt;/p&gt;\r\n\r\n&lt;p&gt;Tự động mở đèn khi thiếu ánh sáng(dưới 10 lux – 6:30 tối) có người di chuyển trong vùng cảm ứng.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/cong tac cam ung AM-SS68.png&quot; style=&quot;width: 620px; height: 480px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;Ứng dụng thực tế:&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Lắp công tắc cảm ứng trong nhà vệ sinh, nhà kho, hành lang khách sạn, ban công, phòng làm việc, nhà bếp, chống trộm…&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Hướng dẫn sử dụng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Gắn thiết bị lên tường, trần nhà sau đó gắn bóng đèn xoáy chuẩn E27 vào cắm nguồn điện, lúc đầu đèn chớp 3 lần rồi tự tắt, khi trời tối, nếu có người di chuyển trong vùng quét của cảm ứng, lập tức đèn sẽ bật sáng và được duy trì liên tục. Khi không có người di chuyển trong vùng cảm ứng nữa, sau thời gian trễ từ 5&amp;nbsp;giây đến 300 giây đèn sẽ tự tắt, tùy thuộc vào nút chỉnh TIME. &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Lắp đặt: Khoan 2 lỗ trên vách tường, trần nhà trùng với kích thước trên thiết bị gắn thiết bị lên khách mặt đất khoảng 1m- 2,5 m, chiều mắt cảm ứng nằm xuống phía dưới.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Lưu ý : đèn chỉ sáng khi có người vào lúc trời tối ( Khoảng 18h30 đến 6 giờ sáng ).&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Công tắc mở đèn khi có người và trời tối AM-SS68 Thời gian tắt đèn cố định 40~60 giây khi không có người * Chỉ cảm ứng trong khu vực tối 5~10lux (độ tối khoảng 7h tối)', 'cong tac cam ung, cong tac mo den cam ung, den cam ung, thiet bi dien thong minh, nha thong minh', 'cong tac cam ung, cong tac mo den cam ung, den cam ung, thiet bi dien thong minh, nha thong minh'),
(312, 6, 'Công tắc đèn cảm ứng âm tường AM-S37', '&lt;p&gt;&lt;strong&gt;Công tắc đèn cảm ứng âm tường AM-S37&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Đây là thiết bị cảm biến nhận diện sự di chuyển của con người. Tự động mở đèn khi có người di chuyển trong&amp;nbsp; vùng quét, với đặc tính phát hiện chuyển động liên tục nên hạn chế tình trạng tắt đèn khi hết thời gian trễ, kết&amp;nbsp; hợp với chức năng điều chỉnh ánh sáng (độ Lux) để giúp tiết kiệm điện nếu ánh sáng ngoài trời đủ thì không cần&amp;nbsp; mở đèn. &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/cong-tac-den-cam-ung-gan-am-tuong-ams37.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Các ứng dụng thực tế :&amp;nbsp;&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Ứng dụng cơ bản nhất của thiết bị là dùng để tắt mở đèn cầu thang thay công tắc 2 chiều, có 3 chế độ tự chọn&amp;nbsp; On/Off/Auto, có thể dùng như công tắc tay nếu cần thiết.&amp;nbsp; Ví dụ dùng cho đèn cầu thang : Ta lắp đặt cảm ứng ngay chỗ cầu thang cao 1.5m, sau đó vặn nút điều chỉnh&amp;nbsp; độ sáng/tối thích hợp. Khi độ sáng trong khu vực hành lang/cầu thang giảm xuống thấp hơn mức điều chỉnh. Lúc&amp;nbsp; này nếu có người bước đến cầu thang lập tức đèn sẽ bật sáng. Sau khoảng thời gian ( từ 8 giây đến 20 phút tuỳ điều chỉnh ) đèn sẽ tự tắt khi không còn người nào chuyển động trong vùng cảm ứng.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;&amp;nbsp;Tương tự dùng để điều khiển mở đèn hành lang, đèn tolet, đèn văn phòng, Showroom... Vào lúc trời tối nếu&amp;nbsp; có người đi ngang sẽ tự mở đèn, một lúc sau sẽ tự tắt. &lt;/span&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Chú ý: Mở nắp dưới công tắc ra sẽ có 2 nút điều chỉnh thời gian trễ và độ sáng cảm ứng. Khi lắp đặt cho hoạt&amp;nbsp; động thử thì cần chỉnh cho thời gian về nhỏ nhất (vặn về phía dấu -), ánh sáng ở vị trí lớn nhất (vặn về phía hình&amp;nbsp; mặt trời), sau khi thử xong điều chỉnh lại theo ý muốn.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Thông số kĩ thuật:&lt;/span&gt;&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Khoảng cách 6~8m, 120 độ, độ sáng cảm ứng 10 ~ 1000lux&lt;/p&gt;\r\n\r\n&lt;p&gt;* Độ cao lắp đặt 1.0 ~ 1.6m&lt;/p&gt;\r\n\r\n&lt;p&gt;* Thời gian trễ điều chỉnh từ 5 giây ~ 20 phút&lt;/p&gt;\r\n\r\n&lt;p&gt;* Có công tắc chọn AUTO/ON/OFF bằng tay&lt;/p&gt;\r\n\r\n&lt;p&gt;* Công suất tải 600w, tiêu thụ khi không cảm ứng 0.1 ~ 0.4W/h,&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;* Thiết kế âm tường, hình chữ nhật, dễ dàng thay thế đế âm công tắc tay hiện tại&lt;/p&gt;\r\n\r\n&lt;p&gt;* Điện áp: 120V ~ 270V / 50Hz ~ 60Hz&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Hướng dẫn sử dụng:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sau khi đã gắn cố định hộp âm tường hoặc hộp gắn nổi vào vị trí. Đấu dây theo hình vẽ ở trên, sau đó dùng vít lắp cố định đầu cảm ứng vào hộp âm tường ( hoặc hộp nổi) đã được gắn từ trước. Sao cho thấu kính cảm ứng quay về hướng thường có người di chuyển qua lại. Điều chỉnh độ lux và thời gian trễ thích hợp, đậy nắp lại sau đó cấp điện cho cảm ứng khởi động trong vòng 1~3 phút, sau đó làm việc ổn định.&lt;/p&gt;\r\n\r\n&lt;p&gt;Lưu ý : Nếu có người di chuyển liên tục thì đèn sẽ luôn duy trì, không tắt, trừ khi không còn ai di chuyển thì sau thời gian trễ mới tắt, nếu muốn giảm khoảng cách cảm ứng để tránh&amp;nbsp; tình trạng người đi ngoài cầu thang cũng mở đèn thì chỉ cần dùng 1 miếng nhựa trong, dán lên mắt cảm ứng sao cho chỉ có 1 lỗ cảm ứng nhỏ sao cho khi bước tới cầu thang thì cảm ứng mới phát hiện và mở đèn. Nếu dùng để tắt mở đèn cầu thang nên lắp 1 cảm ứng ở đầu&amp;nbsp; cầu thang và 1 cảm ứng ở cuối cầu thang. Chỉnh độ lux 30% , thời gian trễ khoáng 1 phút&amp;nbsp;&lt;/p&gt;\r\n', 'Công tắc đèn cảm ứng âm tường AM-S37', 'cong tac cam ung, cong tac cam ung am tuong, cong tac den cam ung, thiet bi dien thong minh', 'cong tac cam ung, cong tac cam ung am tuong, cong tac den cam ung, thiet bi dien thong minh'),
(313, 6, 'Camera quan sát ICAM-293HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-293HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera quan sat ICAM 293HD&quot; src=&quot;http://congnghevang.net/image/data/Product/Camera ICAM 291HD.jpg&quot; style=&quot;width: 285px; height: 251px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera quan sát ICAM-293HD:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera bán cầu&amp;nbsp;trong nhà hồng ngoại ngày&amp;nbsp;và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh cho hình ảnh đẹp hơn và không bị lóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính&amp;nbsp;Lens 4mm(6,8,12,16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-293HD Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P', 'canera quan sat, camera giam sat, camera icam, camera ICAM-293HD, camera AHD, camera ban cau, camera hong ngoai', 'canera quan sat, camera giam sat, camera icam, camera ICAM-293HD, camera AHD'),
(314, 6, 'Camera quan sát ICAM-294HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-294HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera icam 294hd&quot; src=&quot;http://congnghevang.net/image/data/Product/Camera ICAM 291HD.jpg&quot; style=&quot;width: 285px; height: 251px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;/strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera quan sát ICAM-294HD:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera bán cầu&amp;nbsp;trong nhà hồng ngoại ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 2.0 Megapixel , HD 1080P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính&amp;nbsp;Lens 4mm(6,8,12,16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-294HD Chuẩn AHD độ phân giải 2.0 Megapixel , HD 1080P', 'camera quan sat, camera giam sat, camera icam, camera ICAM-294HD, camera ban cau, camera hong ngoai', 'camera quan sat, camera giam sat, camera icam, camera ICAM-294HD, camera ban cau'),
(315, 6, 'Camera quan sát ICAM-393HD', '&lt;p&gt;&lt;strong&gt;Camera quan sát ICAM-393HD&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-quan-sat-icam-393hd&quot; src=&quot;http://congnghevang.net/image/data/icam-393hd.jpg&quot; style=&quot;width: 300px; height: 242px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera quan sát ICAM-393HD:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera thân ngoài trời hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 4mm(6mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p&gt;- Bảo hành 24 tháng&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin: 0px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; line-height: 20px; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin: 0px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; line-height: 20px; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin: 0px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; line-height: 20px; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin: 0px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; line-height: 20px; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát ICAM-393HD Camera thân ngoài trời hồng ngoại  ngày và đêm Chuẩn AHD độ phân giải 1.3 Megapixel(2431H+AP0130) HD720P', 'camera quan sat, camera giam sat, camera icam, camera ICAM-393HD, camera than', 'camera quan sat, camera giam sat, camera icam, camera ICAM-393HD, camera than');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(253, 6, 'Camera ICAM-291HD', '&lt;p style=&quot;box-sizing: border-box; border: 0px; margin: 0px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; padding: 0px; outline: 0px; line-height: 23.4px; text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Hàng&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;chất lượng cao, bảo hành 24&amp;nbsp;tháng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;box-sizing: border-box; border: 0px; font-family: Arial, Helvetica, sans-serif; line-height: 31px; color: rgb(85, 85, 85); margin: 0px; font-size: 17.55px; padding: 0px; outline: 0px; text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; outline: 0px; font-size: 18pt; font-family: Bodoni; color: red; background: transparent;&quot;&gt;Luôn cam kết giá tốt nhất&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; outline: 0px; font-size: 18pt; font-family: Bodoni; color: red; background: transparent;&quot;&gt;&lt;img alt=&quot;Camera quan sat ICAM 291 HD&quot; src=&quot;http://congnghevang.net/image/data/Product/Camera ICAM 291HD.jpg&quot; style=&quot;width: 285px; height: 251px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera ICAM-291HD:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera quan sát&amp;nbsp;Dome trong nhà hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa. Lens 4mm(6.8.12.16mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera ICAM-291HD, Camera Dome trong nhà hồng ngoại  ngày và đêm\r\n- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera quan sat , camera icam, Camera ICAM-291HD, camera hd', 'Camera quan sat , camera ICAM, Camera ICAM-291HD, camera hd'),
(254, 6, 'Camera ICAM-391HD', '&lt;p style=&quot;box-sizing: border-box; border: 0px; margin: 0px; color: rgb(62, 71, 75); font-family: ''Source Sans Pro'', sans-serif; font-size: 14px; padding: 0px; outline: 0px; line-height: 23.4px; text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Hàng&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; color: red; font-family: Bodoni; font-size: 18pt; margin: 0px; padding: 0px; outline: 0px; background-image: initial; background-attachment: initial; background-color: transparent; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;chất lượng cao, bảo hành 24&amp;nbsp;tháng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;box-sizing: border-box; border: 0px; font-family: Arial, Helvetica, sans-serif; line-height: 31px; color: rgb(85, 85, 85); margin: 0px; font-size: 17.55px; padding: 0px; outline: 0px; text-align: center; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; outline: 0px; font-size: 18pt; font-family: Bodoni; color: red; background: transparent;&quot;&gt;Luôn cam kết giá tốt nhất&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera quan sát ICAM 391HD&quot; src=&quot;http://congnghevang.net/image/data/Product/icam 391hd.jpg&quot; style=&quot;width: 300px; height: 262px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;Thông số kĩ thuật&amp;nbsp;Camera ICAM-391HD:&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;-Camera Thân Ngoài Trời hồng ngoại &amp;nbsp;ngày và đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P&lt;/p&gt;\r\n\r\n&lt;p&gt;- Camera cảm biến màu tốc độ cao cho ảnh cực kỳ sắc nét ,hỗ trợ quan sát trong tình trạng ánh sáng yếu.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chế độ chuyển ngày đêm kết hợp hồng ngoại thông minh &amp;nbsp;cho hình ảnh đẹp hơn và không bị lóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính&amp;nbsp;Lens 4mm(6mm)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tự cân bằng ánh sáng trắng, &amp;nbsp;DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;- Made in Malaysia Công nghệ USA&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera quan sát ICAM 391HD , Camera Thân Ngoài Trời hồng ngoại  ngày và đêm\r\n- Chuẩn AHD độ phân giải 1.0 Megapixel(2431H+AP0130) HD720P', 'Camera quan sat, camera icam, Camera ICAM-391HD, camera ahd, camera than', 'Camera quan sat, camera ICAM, Camera ICAM-391HD'),
(317, 6, 'Camera HDCVI 1.0 megapixel KBVISION KB-1001C', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;HDCVI KBVISION KB-1001C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera KBVISION-KB-1001C.jpg&quot; style=&quot;width: 700px; height: 352px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;u&gt;Thông số kĩ thuật&amp;nbsp;camera quan sát&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;&amp;nbsp;HDCVI KBVISION KB-1001C:&lt;/strong&gt;&lt;/u&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.0 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.0 Mp(1280x720)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 70°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 20m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Chuẩn chống bụi và nước IP67&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI KBVISION KB-1001C Cảm biến hình ảnh: 1.0 Megapixel . Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m', 'Camera quan sat, camera kbvision, camera KBVISION KB-1001C, camera HDCVI', 'Camera quan sat, camera kbvision, camera KBVISION KB-1001C, camera HDCVI'),
(318, 6, 'Camera HDCVI 1.0 megapixel KBVISION KB-1002C', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;HDCVI KBVISION KB-1002C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera KBVISION-KB-1002C.jpg&quot; style=&quot;width: 700px; height: 305px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera HDCVI KBVISION KB-1002C:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.0 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.0 Mp(1280x720)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 70°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 20m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI KBVISION KB-1002C  Cảm biến hình ảnh: 1.0 Megapixel, Độ phân giải :25/30fps@1.0 Mp(1280x720)', 'camera quan sat, camera HDCVI, camera kbvision, camera  KBVISION KB-1002C', 'camera quan sat, camera HDCVI, camera kbvision, camera  KBVISION KB-1002C'),
(319, 6, 'Camera HDCVI 1.0 megapixel KBVISION KB-1003C', '&lt;p&gt;Camera HDCVI KBVISION KB-1003C&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera_kb_1003c.jpg&quot; style=&quot;width: 490px; height: 400px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát&amp;nbsp;HDCVI KBVISION KB-1003C:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.0 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.0 Mp(1280x720)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 60°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hồng ngoại 12led @5 ~20m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Chuẩn chống bụi và nước IP67 &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI KBVISION KB-1003C Cảm biến hình ảnh: 1.0 Megapixel Độ phân giải :25/30fps@1.0 Mp(1280x720)', 'camera quan sat, camera HDCVI, camera KBVISION, camera KBVISION KB-1003C', 'camera quan sat, camera HDCVI, camera KBVISION, camera KBVISION KB-1003C'),
(320, 6, 'Camera HDCVI 1.3megapixel KBVISION KB-1301C', '&lt;p&gt;&lt;strong&gt;Camera HDCVI 1.3megapixel KBVISION KB-1301C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-KBVISION-KB-1301C&quot; src=&quot;http://congnghevang.net/image/data/KBVISION-KB-1301C.jpg&quot; style=&quot;width: 700px; height: 304px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật camera HDCVI 1.3 Megapixel&amp;nbsp;KBVISION KB-1301C:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.3 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.3 Mp(1280x960)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 75°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 20m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Chuẩn chống bụi và nước IP67&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera HDCVI 1.3megapixel KBVISION KB-1301C Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1301C', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1301C'),
(321, 6, 'Camera HDCVI 1.3 megapixel KBVISION KB-1303C', '&lt;p&gt;&lt;strong&gt;Camera HDCVI 1.3 megapixel KBVISION KB-1303C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-kbvision-kb303c&quot; src=&quot;http://congnghevang.net/image/data/camera_KBVISION-KB-1303C.png&quot; style=&quot;width: 700px; height: 277px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;HDCVI 1.3 megapixel KBVISION KB-1303C:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.3 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.3 Mp(1280x960)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 75°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 80m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Chuẩn chống bụi và nước IP67&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;●Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI 1.3 megapixel KBVISION KB-1303C Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m', 'camera quan sat, camera HDCVI, camera KBVISION, camera KBVISION KB-1303C', 'camera quan sat, camera HDCVI, camera KBVISION, camera KBVISION KB-1303C'),
(322, 6, 'Camera HDCVI 1.3 megapixel KBVISION KB-1302C', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;HDCVI 1.3 megapixel KBVISION KB-1302C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-KBVISION-KB-1302c&quot; src=&quot;http://congnghevang.net/image/data/camera KBVISION-KB-1302c.jpg&quot; style=&quot;width: 700px; height: 375px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;HDCVI 1.3 megapixel KBVISION KB-1302C:&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.3 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.3 Mp(1280x960)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm( góc nhìn 75°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 20m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI 1.3 megapixel KBVISION KB-1302C Độ phân giải :25/30fps@1.3 Mp(1280x960)  Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1302C', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1302C'),
(323, 6, 'Camera HDCVI 1.3 megapixel KBVISION KB-1305C', '&lt;p&gt;&lt;strong style=&quot;line-height: 1.6em;&quot;&gt;Camera quan sát&amp;nbsp;HDCVI 1.3 megapixel KBVISION KB-1305C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera_KBVISION-KB-1305C&quot; src=&quot;http://congnghevang.net/image/data/camera_KBVISION-KB-1305C.jpg&quot; style=&quot;width: 491px; height: 284px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;u&gt;&lt;strong&gt;Thông số kĩ thuật camera quan sát&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;HDCVI 1.3 megapixel KBVISION KB-1305C :&lt;/strong&gt;&lt;/u&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 1.3 Megapixel&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@1.3 Mp(1280x960)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 2.7~12mm&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 60m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&lt;/p&gt;\r\n\r\n&lt;p&gt;●Chuẩn chống bụi và nước IP67&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;●Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt như khu vực băng giá hay bên trong kho lạnh ....&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera HDCVI 1.3 megapixel KBVISION KB-1305C Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất ', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1305C', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-1305C'),
(324, 6, 'Camera HDCVI 2.0 megapixel KBVISION KB-2001C', '&lt;p&gt;&lt;strong&gt;Camera quan sát&amp;nbsp;HDCVI 2.0 megapixel KBVISION KB-2001C&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;CAMERA THƯƠNG HIỆU MỸ - HÀNG NGUYÊN CHIẾC - GIÁ TỐT&lt;/p&gt;\r\n\r\n&lt;p&gt;KB-Series : dòng sản phẩm nhập khẩu (Đối tác sản phẩm : Pegatron, Sony China), dòng hàng phổ thông, giá thành hợp lý cho các công trình vừa và nhỏ như : gia đình , cửa hàng , nhà máy, siêu thị, tòa nhà, trường học…..&lt;/p&gt;\r\n\r\n&lt;p&gt;Không lo bảo hành/Camera thiết kế nhỏ gọn, chắc chắn. Chống bụi, chống nước hoàn toàn/ Camera nhìn đêm tốt , không bị muỗi / Tích hợp nhiều công nghệ: Chống ngược sáng, chống sương mù / Dễ dàng xem từ xa với tên miền miễn phí trọn đời sản phẩm /&amp;nbsp; Cloud.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Camera_KBVISION-KB-2001C&quot; src=&quot;http://congnghevang.net/image/data/Camera_KBVISION-KB-2001C.jpg&quot; style=&quot;width: 700px; height: 304px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera HDCVI 2.0 megapixel KBVISION KB-2001C :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Cảm biến hình ảnh: 2.0 Megapixel (full HD) cho hình ảnh sắc nét&lt;/p&gt;\r\n\r\n&lt;p&gt;● Độ phân giải :25/30fps@2.0Mp (1920x 1080)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Truyền tín hiệu , hình ảnh rõ nét với khoảng cách xa lên đến 500~700m&lt;/p&gt;\r\n\r\n&lt;p&gt;● Hỗ trợ cân bằng ánh sáng, bù sáng, chống ngược sáng, chống nhiễu 2D-DNR, cảm biến ngày/đêm giúp camera tự động điều chỉnh hình ảnh và màu sắc đẹp nhất phù hợp nhất với mọi môi trường ánh sáng&lt;/p&gt;\r\n\r\n&lt;p&gt;● Ống kính: 3.6mm ( góc nhìn 78°)&lt;/p&gt;\r\n\r\n&lt;p&gt;● Tầm xa hồng ngoại: 20m, hồng ngoại thông minh tự động điều chỉnh độ sáng chống lóa&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Chuẩn chống bụi và nước IP67&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nguồn: DC 12V&lt;/p&gt;\r\n\r\n&lt;p&gt;● Nhiệt độ hoạt động -30~+60°C :có thể hoạt động ở môi trường thời tiết khắc nghiệt&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera HDCVI 2.0 megapixel KBVISION KB-2001C Cảm biến hình ảnh: 2.0 Megapixel (full HD) cho hình ảnh sắc nét', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-2001C', 'camera quan sat, camera hdcvi, camera kbvision, camera KBVISION KB-2001C'),
(325, 6, 'Camera AHD Samtech STC-3124 ', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC-3124&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif; line-height: 15.6px;&quot;&gt;&amp;nbsp;Sử dụng cảm biến&amp;nbsp;thế hệ mới với độ nhạy sáng tốt cho hình ảnh HD ban ngày&amp;nbsp;sắc nét và ban đêm rõ ràng, màu sắc trung thực với độ phân giải 720P tương đương 1280x720 điểm ảnh. Đặc biệt xem đêm không bị nhiễu ( noise )&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif; line-height: 15.6px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/camera samtech STC-3124.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif; line-height: 15.6px;&quot;&gt;Th&lt;/span&gt;ông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC-3124&amp;nbsp;&lt;/span&gt;:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixels &amp;nbsp;&amp;nbsp;Dạng bán cầu vỏ thép có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải: HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính : f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát : 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại : 24 IR Leds ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs : IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10%): 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%): 95mAh ( IR OFF ) | 290mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 92 x 70(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;** Sản phẩm dùng trong nhà và ngoài, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC-3124  sử dụng cảm biến thế hệ mới với độ nhạy sáng tốt cho hình ảnh HD ban ngày sắc nét và ban đêm rõ ràng, màu sắc trung thực với độ phân giải 720P tương đương 1280x720 điểm ảnh. Đặc biệt xem đêm không bị nhiễu', 'camera quan sat, camera samtech, camera ahd samtech, camera Samtech STC-3124 ', 'camera quan sat, camera samtech, camera ahd samtech, camera Samtech STC-3124 ');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(326, 6, 'Camera AHD Samtech STC-5136  ', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC-5136 :&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px 0px 15px; margin: 0px 0px 8px; line-height: 1.3; font-family: arial, Arial, Helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Với phương châm không ngừng cập nhật công nghệ mới để đáp ứng nhu cầu của khách hàng,Goldtech g&lt;/span&gt;&lt;font color=&quot;#000000&quot;&gt;iới thiệu đến quý khách hàng Camera AHD Samtech&amp;nbsp;STC-5136&amp;nbsp; - một sản phẩm thuộc dòng Camera thân trụ mới của thương hiệu Samtech.&lt;/font&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px 0px 15px; margin: 0px 0px 8px; line-height: 1.3; color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif;&quot;&gt;&lt;strong&gt;Camera Samtech&amp;nbsp;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;STC-5136&lt;/strong&gt;&lt;/strong&gt;&amp;nbsp;được sản xuất theo công nghệ AHD với cảm biến&amp;nbsp;CMOS cho hình ảnh chất lượng HD 720P rõ nét , giá cực tốt&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px 0px 15px; margin: 0px 0px 8px; line-height: 1.3; color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif;&quot;&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC-5136 :&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;padding: 0px 0px 15px; margin: 0px 0px 8px; line-height: 1.3; color: rgb(0, 0, 0); font-family: arial, Arial, Helvetica, sans-serif;&quot;&gt;&lt;strong&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Camera STC-5136.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixel - Dạng thân ống chất liệu hợp kim có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải: HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính : f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát : 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại : 36 IR Leds ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs : IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10%): 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%): 95mAh ( IR OFF ) | 340mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 62 x 160(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;** Sản phẩm dùng trong nhà và ngoài trời đã bao gồm chân đế, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC-5136  được sản xuất theo công nghệ AHD với cảm biến CMOS cho hình ảnh chất lượng HD 720P rõ nét , giá cực tốt', 'camera quan sat, camera ahd samtech, camera samtech STC-5136  ', 'camera quan sat, camera ahd samtech, camera samtech STC-5136  '),
(327, 6, 'Camera AHD Samtech STC 3010', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC 3010&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC 3010&amp;nbsp;&lt;/strong&gt;sử dụng cảm biến&amp;nbsp;thế hệ mới với độ nhạy sáng tốt cho hình ảnh HD ban ngày&amp;nbsp;sắc nét và ban đêm rõ ràng, màu sắc trung thực với độ phân giải 720P tương đương 1280x720 điểm ảnh. Đặc biệt xem đêm không bị nhiễu ( noise ) .&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera-samtech-STC-3010&quot; src=&quot;http://congnghevang.net/image/data/Samtech STC 3010.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&lt;/strong&gt;&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC 3010&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixels dạng bán cầu chất liệu Plastic có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot;&amp;nbsp; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính: f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát: 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại: 03 IR Leds ARRAY ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs: IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 290mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 94 x 70(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Sản phẩm dùng trong nhà, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC 3010 sử dụng cảm biến thế hệ mới với độ nhạy sáng tốt cho hình ảnh HD ban ngày sắc nét và ban đêm rõ ràng, màu sắc trung thực với độ phân giải 720P tương đương 1280x720 điểm ảnh. Đặc biệt xem đêm không bị nhiễu ( noise ) .', 'camera quan sat, camera giam sat, camera ahd, camera samtech, camera Samtech STC 3010', 'camera quan sat, camera giam sat, camera ahd, camera samtech, camera Samtech STC 3010'),
(328, 6, 'Camera AHD Samtech STC-3110  ', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC-3110 &amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera dome quan sát hồng ngoại cảm biến CMOS Image Sensor Samtech STC-3110. Được sử dụng cảm biến của hãng Aptina USA , công nghệ AHD, 6 đèn hồng ngoại led Array , camera lắp trong nhà, quan sát ngày đêm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/samtech_stc_3110.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật Camera AHD Samtech STC-3110&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixels dạng bán cầu chất liệu vỏ thép có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot;&amp;nbsp; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính: f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát: 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại: 06&amp;nbsp;IR Leds ARRAY ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs: IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 290mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 94 x 70(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Sản phẩm dùng trong nhà, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC-3110  Độ phân giải : HD 720P ( 1280x720 ), Số lượng hồng ngoại: 03 IR Leds ARRAY ( Xem đêm từ 25 ~ 30m )', 'camera quan sat, camera hong ngoai, camera ahd, camera samtech, camera samtech STC-3110  ', 'camera quan sat, camera hong ngoai, camera ahd, camera samtech, camera samtech STC-3110  '),
(329, 6, 'Camera AHD Samtech STC-6310   ', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC -6310&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC -6310&amp;nbsp;&lt;/strong&gt;có độ phân giải 720P tương đương 1.0&amp;nbsp;MP cho hình ảnh chất lượng cao, rõ nét cả bạn ngày và ban đêm.&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Với&amp;nbsp;03 đèn hồng ngoại Array,&lt;a href=&quot;http://congnghevang.net/camera-quan-sat-samtech&quot;&gt;&amp;nbsp;&lt;/a&gt;&lt;/span&gt;&lt;a href=&quot;http://samtech.vn/camera-giam-sat/899405.html&quot; style=&quot;line-height: 1.6em;&quot; target=&quot;_blank&quot;&gt;Camera&amp;nbsp;&lt;/a&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;STC-6310&amp;nbsp;cho khả năng xem đêm lên&amp;nbsp;đến&amp;nbsp;30m. Công nghệ &amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://cctv.icamera.vn/camera-ahd/1425229.html&quot; style=&quot;line-height: 1.6em;&quot; target=&quot;_blank&quot;&gt;AHD&lt;/a&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;&amp;nbsp;cho phép truyền tín hiệu HD trong khoảng cách 500m. Sản phẩm rất phù hợp lắp trong nhà tại các hộ gia đình hay các văn phòng vừa và nhỏ.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/Samtech STC-6310.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Thông số kĩ thuật&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC -6310&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixels dạng thân ống chất liệu hợp kim có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot;&amp;nbsp; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính: f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát: 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại: 03 IR Leds ARRAY ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs: IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 290mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 60 x 100(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Sản phẩm dùng trong nhà và ngoài trời, có chân đế, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC-6310  có độ phân giải 720P tương đương 1.0 MP cho hình ảnh chất lượng cao, rõ nét cả bạn ngày và ban đêm.', 'camera quan sat, camera hong ngoai, camera ahd, camera samtech, camera samtech STC-6310', 'camera quan sat, camera hong ngoai, camera ahd, camera samtech, camera samtech STC-6310'),
(330, 6, 'Camera AHD Samtech STC-3610 ', '&lt;p&gt;&lt;strong&gt;Camera AHD Samtech STC-3610&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Camera giám sát thân ống trụ 36 đèn hồng ngoại Samtech STC-3610 . Được sử dụng cảm biến của hãng Aptina USA . Camera 720P, 1.0MP chất lượng cao, hình ảnh rõ nét, công nghệ AHD . Những chiếc Camera thân trụ thích hợp lắp cả trong nhà và ngoài trời đang được nhiều hộ gia đình, cơ quan hay doanh nghiệp lựa chọn.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/samtech_stc_3610.jpg&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD Samtech STC-3610&amp;nbsp;&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.0 Megapixels dạng thân ống chất liệu hợp kim có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 720P ( 1280x720 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh : 1/3&quot;&amp;nbsp; CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính: f2.8mm /&amp;nbsp; f3.6mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát: 90º /&amp;nbsp; 72º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại: 36 IR Led ( Xem đêm từ 25 ~ 30m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs: IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải : Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 290mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 60 x 160(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Sản phẩm đã bao gồm chân đế dùng trong nhà và ngoài trời, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD Samtech STC-3610 sử dụng cảm biến của hãng Aptina USA . Camera 720P, 1.0MP chất lượng cao, hình ảnh rõ nét, công nghệ AHD', 'Camera quan sat, camera than hong ngoai, camera ahd, camera samtech, camera  Samtech STC-3610 ', 'Camera quan sat, camera than hong ngoai, camera ahd, camera samtech, camera  Samtech STC-3610 '),
(331, 6, 'Camera AHD 1.3 megapixel Samtech STC-304G  ', '&lt;p&gt;&lt;strong&gt;Camera AHD 1.3 megapixel Samtech STC-304G &lt;/strong&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Được sử dụng cảm biến của hãng SONY - Nhật Bản . Dome ốp trần, dùng trong nhà, hình ảnh chất lượng cao, rõ nét, đêm lên tới 35m, 4 đèn hồng ngoại LED array, &amp;nbsp;có khả năng chống ngược sáng từng vùng tốt, và công nghệ AHD cho phép truyền tín hiệu ở khoảng cách xa lên tới 500m. Phiên bản mới có điều chỉnh bằng OSD.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD 1.3 megapixel Samtech STC-304G&amp;nbsp;&lt;/strong&gt;&amp;nbsp;là dòng sản phẩm Camera Dome chất lượng cao dành cho các hộ gia đinh, cơ quan, công ty, trường học, bệnh viện&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera_samtech_304g&quot; src=&quot;http://congnghevang.net/image/data/camera_samtech_304g.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD 1.3 megapixel Samtech STC-304G&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.3 Megapixel Dạng bán cầu chất liệu Plastic có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 960P ( 1280x960 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh: 1/3&quot; Sony ® Exmor IMX238 CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính : f3.6mm /&amp;nbsp; f6.0mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát : 92º /&amp;nbsp; 58º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại : 04 IR Leds ARRAY ( Xem đêm từ 30 ~ 35m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs : IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;OSD Menu : Có&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải: Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10%) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 350mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 94 x 70(L) mm&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'camera quan sát AHD 1.3 megapixel Samtech STC-304G  sử dụng cảm biến của hãng SONY - Nhật Bản . Dome ốp trần, dùng trong nhà, hình ảnh chất lượng cao, rõ nét, đêm lên tới 35m, 4 đèn hồng ngoại LED array', 'camera quan sat, camera op tran, camera ahd, camera samtech, camera Samtech STC-304G  ', 'camera quan sat, camera op tran, camera ahd, camera samtech, camera Samtech STC-304G '),
(332, 6, 'Camera AHD 1.3megapixel Samtech STC-312G ', '&lt;p&gt;&lt;strong&gt;Camera AHD 1.3megapixel Samtech STC-312G&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Áp dụng&amp;nbsp;công nghệ AHD tiên tiến nhất hiện nay,&amp;nbsp;STC-&amp;nbsp;312G&amp;nbsp;cho chất lượng hình ảnh với độ phân giải lên tới HD 960p&amp;nbsp;( 1280 x 960 ) rất rõ nét.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD 1.3megapixel Samtech STC-312G&amp;nbsp;&lt;/span&gt;&amp;nbsp;là dòng sản phẩm Camera Dome chất lượng cao dành cho các hộ gia đinh, cơ quan, công ty, trường học, bệnh viện&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;camera_stc_312g&quot; src=&quot;http://congnghevang.net/image/data/camera_stc_312g.gif&quot; style=&quot;width: 550px; height: 550px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;span style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera AHD 1.3megapixel Samtech STC-312G&amp;nbsp;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;AHD Camera 1.3 Megapixel Dạng bán cầu chất liệu hợp kim có hồng ngoại&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ phân giải : HD 960P ( 1280x960 )&lt;/p&gt;\r\n\r\n&lt;p&gt;Cảm biến hình ảnh: 1/3&quot; Sony ® Exmor IMX238 CMOS Image Sensor&lt;/p&gt;\r\n\r\n&lt;p&gt;Ống kính : f3.6mm /&amp;nbsp; f6.0mm | 0.01 Lux / F1.2 , 0 Lux (IR On)&lt;/p&gt;\r\n\r\n&lt;p&gt;Góc quan sát : 92º /&amp;nbsp; 58º&lt;/p&gt;\r\n\r\n&lt;p&gt;Số lượng hồng ngoại : 02 IR Leds ARRAY ( Xem đêm từ 20 ~ 25m )&lt;/p&gt;\r\n\r\n&lt;p&gt;Chế độ IRIs : IR Cut Filter&lt;/p&gt;\r\n\r\n&lt;p&gt;OSD Menu : Có&lt;/p&gt;\r\n\r\n&lt;p&gt;Khoảng cách truyền tải: Truyền tín hiệu HD lên tới 500m&lt;/p&gt;\r\n\r\n&lt;p&gt;Nguồn điện&amp;nbsp; (±10%) : 12v / 1A&lt;/p&gt;\r\n\r\n&lt;p&gt;Điện áp tiêu thụ (±10%) : 95mAh ( IR OFF ) | 350mAh ( IR ON )&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước sản phẩm : Ø 120 x 70(L) mm&lt;/p&gt;\r\n\r\n&lt;p&gt;** Sản phẩm dùng trong và ngoài nhà, không bao gồm Adaptor&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera AHD 1.3megapixel Samtech STC-312G sử dụng công nghệ AHD cho khả năng truyền tải tín hiệu HD ở khoảng cách lên đến 500m. khả nảng chống ngược sáng và hỗ trợ xem đêm lên tới 30m.', 'camera quan sat, camera ahd, camera ahd 1.3megapixel, camera samtech, camera  Samtech STC-312G ', 'camera quan sat, camera ahd, camera ahd 1.3megapixel, camera samtech, camera  Samtech STC-312G '),
(333, 6, 'Camera HDCVI 2.0 MP Dahua HAC-HDW1200M', '&lt;p&gt;&lt;strong&gt;Camera HDCVI 2.0 MP Dahua HAC-HDW1200M&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;img alt=&quot;camera hdcvi dahua HAC_HDW1200M&quot; src=&quot;http://congnghevang.net/image/data/HAC_HDW1200M.jpg&quot; style=&quot;width: 350px; height: 346px;&quot; /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật camera&amp;nbsp;HDCVI 2.0 MP Dahua HAC-HDW1200M:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải 1/2.7&quot; 2.0 Megapixel CMOS 25/30fps@1080P(1920×1080), Cho phân giải HD trên đường truyền analog.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Thời gian thực không trễ hình, Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB).&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tự động bù sáng (AGC), chống ngược sáng(BLC), chống nhiễu (2D-DNR)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại 30m với công nghệ hồng ngoại thông minh, ống kính cố định 3.6mm, chuẩn ngâm nước IP67, &amp;nbsp;điện áp DC12V, công suất 2.5W.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chất liệu vỏ kim loại.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc từ -30°C~+60°C, khoảng cách truyền tải trên cáp đồng trục lên đến 500m&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera quan sát HDCVI 2.0 MP Dahua HAC-HDW1200M Cho phân giải HD trên đường truyền analog. Thời gian thực không trễ hình. Hình ảnh siêu nét', 'camera quan sat, camera dahua, Dahua HAC-HDW1200M, camera hdcvi', 'camera quan sat, camera dahua, Dahua HAC-HDW1200M, camera hdcvi'),
(334, 6, 'Camera HDCVI 2.0 Megapixcel Dahua HAC-HFW1200RMP', '&lt;p&gt;&lt;strong&gt;Camera HDCVI 2.0 Megapixcel Dahua HAC-HFW1200RMP&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;là dòng camera&amp;nbsp;&lt;strong&gt;HDCVI DAHUA&lt;/strong&gt;&amp;nbsp;chất lượng, được thiết hiện đại và chắc chắn, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, chất lượng hình ảnh nổi bật với độ phân giải cao vượt trội hơn so với các thương hiệu khác hiện đang có trên thị trường, phù hợp với các dự án vừa và nhỏ. Đầu ghi hình HDCVI Dahua tương thích được với camera của các hãng khác như: Vantech, Avtech, Questek, Hikvision……&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/HAC-HFW1200RMP.jpg&quot; style=&quot;width: 600px; height: 500px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;&lt;strong style=&quot;font-size: 13px; line-height: 20.8px;&quot;&gt;Camera HDCVI 2.0 Megapixcel Dahua HAC-HFW1200RMP&amp;nbsp;&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải 1/2.7&quot; 2.0 Megapixel CMOS 25/30fps@1080P(1920×1080)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cho phân giải HD trên đường truyền analog.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Thời gian thực không trễ hình&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (2D-DNR)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tầm xa hồng ngoại 20m với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính cố định 3.6mm, chuẩn ngâm nước IP67, &amp;nbsp;điện áp DC12V, công suất 3.5W&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Chất liệu vỏ kim loại&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Môi trường làm việc từ -30°C~+60°C, &lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Khoảng cách truyền tải trên cáp đồng trục lên đến 500m với cáp 75-3 ôm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;- Kích thước F70mm×154mm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n', 'Camera HDCVI 2.0 Megapixcel Dahua HAC-HFW1200RMP được thiết kế hiện đại chắc chắn. Cho phân giải HD trên đường truyền analog. Thời gian thực không trễ hình, hình ảnh siêu nét', 'camera quan sát, camera dahua, camera dahua HAC-HFW1200RMP, camera HDCVI', 'camera quan sát, camera dahua, camera dahua HAC-HFW1200RMP, camera HDCVI'),
(335, 6, 'Camera HDCVI 2.0 MP Dahua HAC-HFW1200S', '&lt;p&gt;Camera HDCVI 2.0 MP Dahua HAC-HFW1200S&amp;nbsp;là dòng camera&amp;nbsp;&lt;strong&gt;HDCVI DAHUA&lt;/strong&gt;&amp;nbsp;chất lượng, được thiết hiện đại và chắc chắn, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, chất lượng hình ảnh nổi bật với độ phân giải cao vượt trội hơn so với các thương hiệu khác hiện đang có trên thị trường, phù hợp với các dự án vừa và nhỏ. Đầu ghi hình HDCVI Dahua tương thích được với camera của các hãng khác như: Vantech, Avtech, Questek, Hikvision……&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/HAC-HFW1200S.jpg&quot; style=&quot;width: 350px; height: 350px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Thông số kĩ thuật&amp;nbsp;Camera HDCVI 2.0 MP Dahua HAC-HFW1200S&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ phân giải 1/2.7&quot; 2.0 Megapixel CMOS 25/30fps@1080P(1920×1080),&amp;nbsp;&lt;span style=&quot;line-height: 1.6em;&quot;&gt;Cho phân giải HD trên đường truyền analog.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Thời gian thực không trễ hình&lt;/p&gt;\r\n\r\n&lt;p&gt;- Độ nhạy sáng tối thiểu 0.01Lux@F1.2(0Lux IR LED on), chế độ ngày đêm(ICR), tự động cân bằng trắng (AWB),Tự động bù sáng (AGC), chống ngược sáng(BLC), Chống nhiễu (2D-DNR)&lt;/p&gt;\r\n\r\n&lt;p&gt;-Tầm xa hồng ngoại 30m với công nghệ hồng ngoại thông minh&lt;/p&gt;\r\n\r\n&lt;p&gt;- Ống kính cố định 3.6mm, chuẩn ngâm nước IP67, &amp;nbsp;điện áp DC12V, công suất 3.6W&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chất liệu vỏ kim loại + Plastic&lt;/p&gt;\r\n\r\n&lt;p&gt;- Môi trường làm việc từ -30°C~+60°C&lt;/p&gt;\r\n\r\n&lt;p&gt;- Khoảng cách truyền tải trên cáp đồng trục lên đến 500m với cáp 75-3 ôm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Kích thước Φ70mm×165mm&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;Quý khách hãy gọi ngay cho chúng tôi để nhận được nhiều&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ưu đãi và hỗ trợ miễn phí&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;box-sizing: border-box; border: none; margin: 0px; line-height: 20px; padding: 0px; outline: none; font-size: 13px; font-family: Roboto, Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); text-align: center;&quot;&gt;&lt;strong style=&quot;box-sizing: border-box; border: none; color: rgb(0, 112, 192); margin: 0px; padding: 10px; outline: none; font-size: inherit; clear: both;&quot;&gt;ĐT: 0962 163 395 - 0983 027 948&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Camera HDCVI 2.0 MP Dahua HAC-HFW1200S là dòng camera HDCVI DAHUA chất lượng, được thiết hiện đại và chắc chắn, hỗ trợ chức năng chống chói sáng, hỗ trợ IP66 chống thời tiết xấu, bụi bẩn, quan sát ngày đêm tốt, chất lượng hình ảnh nổi bật với độ phân giải', 'camera quan sát, camera dahua, camera dahua HAC-HFW1200S, camera HDCVI', 'camera quan sát, camera dahua, camera dahua HAC-HFW1200S, camera HDCVI');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=510 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3973 ;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(3972, 263, 'data/camera quan sat ICAM-992IP.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_profile`
--

CREATE TABLE IF NOT EXISTS `oc_product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(252, 254),
(252, 255),
(252, 256),
(252, 283),
(252, 284),
(252, 307),
(252, 308),
(252, 314),
(253, 254),
(253, 255),
(253, 256),
(253, 283),
(253, 284),
(253, 307),
(253, 308),
(253, 313),
(253, 314),
(254, 252),
(254, 253),
(254, 255),
(254, 256),
(254, 283),
(254, 284),
(254, 307),
(254, 308),
(254, 313),
(254, 315),
(255, 252),
(255, 253),
(255, 254),
(255, 256),
(255, 283),
(255, 284),
(255, 307),
(255, 308),
(255, 314),
(255, 315),
(255, 316),
(256, 252),
(256, 253),
(256, 254),
(256, 255),
(256, 283),
(256, 284),
(256, 313),
(256, 315),
(256, 316),
(257, 258),
(257, 259),
(258, 257),
(258, 259),
(259, 257),
(259, 258),
(260, 261),
(260, 262),
(261, 260),
(261, 262),
(262, 260),
(262, 261),
(264, 298),
(264, 299),
(264, 300),
(265, 298),
(265, 299),
(265, 300),
(266, 267),
(266, 268),
(266, 269),
(266, 297),
(267, 266),
(267, 268),
(267, 269),
(267, 297),
(268, 266),
(268, 267),
(268, 269),
(268, 297),
(269, 266),
(269, 267),
(269, 268),
(269, 297),
(270, 271),
(270, 272),
(270, 273),
(270, 279),
(270, 280),
(270, 281),
(270, 282),
(271, 270),
(271, 272),
(271, 273),
(271, 279),
(271, 280),
(271, 281),
(271, 282),
(272, 270),
(272, 271),
(272, 273),
(272, 279),
(272, 280),
(272, 281),
(272, 282),
(273, 270),
(273, 271),
(273, 272),
(273, 279),
(273, 280),
(273, 281),
(273, 282),
(274, 275),
(274, 276),
(274, 277),
(274, 278),
(274, 334),
(275, 274),
(275, 276),
(275, 277),
(275, 278),
(275, 333),
(275, 335),
(276, 274),
(276, 275),
(276, 277),
(276, 278),
(276, 333),
(276, 334),
(276, 335),
(277, 274),
(277, 275),
(277, 276),
(277, 278),
(277, 333),
(277, 334),
(278, 274),
(278, 275),
(278, 276),
(278, 277),
(278, 333),
(278, 334),
(278, 335),
(279, 270),
(279, 271),
(279, 272),
(279, 273),
(279, 280),
(279, 281),
(279, 282),
(280, 270),
(280, 271),
(280, 272),
(280, 273),
(280, 279),
(280, 281),
(281, 270),
(281, 271),
(281, 272),
(281, 273),
(281, 279),
(281, 280),
(281, 282),
(282, 270),
(282, 271),
(282, 272),
(282, 273),
(282, 279),
(282, 281),
(283, 252),
(283, 253),
(283, 254),
(283, 255),
(283, 256),
(283, 284),
(283, 307),
(283, 308),
(283, 314),
(283, 315),
(284, 252),
(284, 253),
(284, 254),
(284, 255),
(284, 256),
(284, 283),
(284, 307),
(284, 313),
(284, 314),
(284, 315),
(285, 309),
(285, 310),
(285, 311),
(285, 312),
(286, 287),
(286, 288),
(287, 286),
(287, 288),
(288, 286),
(288, 287),
(289, 290),
(289, 291),
(290, 289),
(290, 291),
(291, 289),
(291, 290),
(292, 293),
(292, 294),
(292, 295),
(292, 296),
(293, 292),
(293, 294),
(293, 295),
(293, 296),
(294, 292),
(294, 293),
(294, 295),
(294, 296),
(295, 292),
(295, 293),
(295, 294),
(295, 296),
(296, 292),
(296, 293),
(296, 294),
(296, 295),
(297, 266),
(297, 267),
(297, 268),
(297, 269),
(298, 264),
(298, 265),
(298, 299),
(298, 300),
(299, 264),
(299, 265),
(299, 298),
(299, 300),
(300, 264),
(300, 265),
(300, 298),
(300, 299),
(301, 302),
(301, 303),
(301, 304),
(301, 305),
(301, 306),
(302, 301),
(302, 303),
(302, 304),
(302, 305),
(302, 306),
(303, 301),
(303, 302),
(303, 304),
(303, 305),
(303, 306),
(304, 301),
(304, 302),
(304, 303),
(304, 306),
(305, 301),
(305, 302),
(305, 303),
(305, 306),
(306, 301),
(306, 302),
(306, 303),
(306, 304),
(306, 305),
(307, 252),
(307, 253),
(307, 254),
(307, 255),
(307, 283),
(307, 284),
(307, 316),
(308, 252),
(308, 253),
(308, 254),
(308, 255),
(308, 283),
(308, 316),
(309, 285),
(309, 310),
(309, 311),
(309, 312),
(310, 285),
(310, 309),
(310, 311),
(310, 312),
(311, 285),
(311, 309),
(311, 310),
(311, 312),
(312, 285),
(312, 309),
(312, 310),
(312, 311),
(313, 253),
(313, 254),
(313, 256),
(313, 284),
(313, 316),
(314, 252),
(314, 253),
(314, 255),
(314, 283),
(314, 284),
(315, 254),
(315, 255),
(315, 256),
(315, 283),
(315, 284),
(316, 255),
(316, 256),
(316, 307),
(316, 308),
(316, 313),
(317, 318),
(317, 319),
(317, 320),
(317, 321),
(317, 322),
(317, 323),
(317, 324),
(318, 317),
(318, 319),
(318, 320),
(318, 321),
(318, 322),
(319, 317),
(319, 318),
(319, 320),
(319, 321),
(319, 322),
(319, 323),
(320, 317),
(320, 318),
(320, 319),
(320, 321),
(320, 322),
(320, 323),
(320, 324),
(321, 317),
(321, 318),
(321, 319),
(321, 320),
(321, 322),
(321, 323),
(321, 324),
(322, 317),
(322, 318),
(322, 319),
(322, 320),
(322, 321),
(322, 323),
(322, 324),
(323, 317),
(323, 319),
(323, 320),
(323, 321),
(323, 322),
(323, 324),
(324, 317),
(324, 320),
(324, 321),
(324, 322),
(324, 323),
(325, 326),
(325, 327),
(325, 328),
(325, 329),
(325, 330),
(325, 331),
(325, 332),
(326, 325),
(326, 327),
(326, 328),
(326, 329),
(326, 330),
(326, 331),
(326, 332),
(327, 325),
(327, 326),
(327, 328),
(327, 329),
(327, 330),
(327, 332),
(328, 325),
(328, 326),
(328, 327),
(328, 329),
(328, 330),
(328, 331),
(328, 332),
(329, 325),
(329, 326),
(329, 327),
(329, 328),
(329, 330),
(329, 331),
(329, 332),
(330, 325),
(330, 326),
(330, 327),
(330, 328),
(330, 329),
(330, 331),
(331, 325),
(331, 326),
(331, 328),
(331, 329),
(331, 330),
(332, 325),
(332, 326),
(332, 327),
(332, 328),
(332, 329),
(333, 275),
(333, 276),
(333, 277),
(333, 278),
(333, 334),
(333, 335),
(334, 274),
(334, 276),
(334, 277),
(334, 278),
(334, 333),
(334, 335),
(335, 275),
(335, 276),
(335, 278),
(335, 333),
(335, 334);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1399 ;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(1323, 300, 1, 0),
(1398, 335, 1, 0),
(1341, 310, 1, 0),
(1360, 253, 1, 0),
(1279, 272, 1, 0),
(1277, 271, 1, 0),
(1397, 334, 1, 0),
(1386, 325, 1, 0),
(1388, 328, 1, 0),
(1389, 329, 1, 0),
(1385, 326, 1, 0),
(1387, 327, 1, 0),
(1395, 333, 1, 0),
(1393, 332, 1, 0),
(1391, 330, 1, 0),
(1392, 331, 1, 0),
(1275, 270, 1, 0),
(1280, 273, 1, 0),
(1359, 252, 1, 0),
(1324, 299, 1, 0),
(1328, 304, 1, 0),
(1332, 302, 1, 0),
(1335, 301, 1, 0),
(1319, 297, 1, 0),
(1316, 294, 1, 0),
(1315, 293, 1, 0),
(1318, 296, 1, 0),
(1314, 292, 1, 0),
(1322, 298, 1, 0),
(1317, 295, 1, 0),
(1312, 290, 1, 0),
(1364, 316, 1, 0),
(1311, 289, 1, 0),
(1306, 288, 1, 0),
(1313, 291, 1, 0),
(1337, 306, 1, 0),
(1329, 305, 1, 0),
(1356, 314, 1, 0),
(1343, 312, 1, 0),
(1342, 311, 1, 0),
(1355, 313, 1, 0),
(1271, 268, 1, 0),
(1268, 267, 1, 0),
(1263, 266, 1, 0),
(1283, 275, 1, 0),
(1273, 269, 1, 0),
(1238, 258, 1, 0),
(1290, 276, 1, 0),
(1363, 263, 1, 0),
(1241, 261, 1, 0),
(1261, 265, 1, 0),
(1262, 264, 1, 0),
(1242, 262, 1, 0),
(1240, 260, 1, 0),
(1282, 274, 1, 0),
(1255, 259, 1, 0),
(1380, 324, 1, 0),
(1383, 323, 1, 0),
(1382, 321, 1, 0),
(1381, 322, 1, 0),
(1346, 315, 1, 0),
(1372, 317, 1, 0),
(1371, 320, 1, 0),
(1375, 319, 1, 0),
(1373, 318, 1, 0),
(1340, 309, 1, 0),
(1357, 308, 1, 0),
(1354, 307, 1, 0),
(1348, 284, 1, 0),
(1237, 257, 1, 0),
(1361, 254, 1, 0),
(1362, 256, 1, 0),
(1358, 255, 1, 0),
(1291, 277, 1, 0),
(1292, 278, 1, 0),
(1294, 280, 1, 0),
(1293, 279, 1, 0),
(1336, 303, 1, 0),
(1305, 287, 1, 0),
(1304, 286, 1, 0),
(1301, 285, 1, 0),
(1347, 283, 1, 0),
(1296, 282, 1, 0),
(1297, 281, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=653 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(252, 121),
(252, 122),
(253, 121),
(253, 122),
(254, 121),
(254, 122),
(255, 121),
(255, 122),
(256, 121),
(256, 122),
(257, 147),
(257, 150),
(258, 147),
(258, 150),
(259, 147),
(259, 150),
(260, 136),
(260, 137),
(261, 136),
(261, 137),
(262, 136),
(262, 137),
(263, 122),
(263, 132),
(264, 151),
(264, 152),
(265, 151),
(265, 152),
(266, 156),
(266, 157),
(267, 156),
(267, 157),
(268, 156),
(268, 157),
(269, 156),
(269, 157),
(270, 121),
(270, 123),
(271, 121),
(271, 123),
(272, 121),
(272, 123),
(273, 121),
(273, 123),
(274, 121),
(274, 124),
(275, 121),
(275, 124),
(276, 121),
(276, 124),
(277, 121),
(277, 124),
(278, 121),
(278, 124),
(279, 121),
(279, 123),
(280, 121),
(280, 123),
(281, 121),
(281, 123),
(282, 121),
(282, 123),
(283, 121),
(283, 122),
(284, 121),
(284, 122),
(285, 159),
(286, 136),
(286, 138),
(287, 136),
(287, 138),
(288, 136),
(288, 138),
(289, 158),
(290, 158),
(291, 158),
(292, 128),
(293, 128),
(294, 128),
(295, 128),
(296, 128),
(297, 156),
(297, 157),
(298, 151),
(298, 152),
(299, 151),
(299, 152),
(300, 151),
(300, 152),
(301, 129),
(302, 129),
(303, 129),
(304, 129),
(305, 129),
(306, 129),
(307, 121),
(307, 122),
(308, 121),
(308, 122),
(309, 159),
(310, 159),
(311, 159),
(312, 159),
(313, 121),
(313, 122),
(314, 122),
(315, 121),
(315, 122),
(316, 121),
(316, 122),
(317, 130),
(318, 130),
(319, 130),
(320, 130),
(321, 130),
(322, 130),
(323, 130),
(324, 130),
(325, 127),
(326, 127),
(327, 127),
(328, 127),
(329, 127),
(330, 127),
(331, 127),
(332, 127),
(333, 124),
(334, 124),
(335, 124);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(252, 0),
(253, 0),
(254, 0),
(255, 0),
(256, 0),
(257, 0),
(258, 0),
(259, 0),
(260, 0),
(261, 0),
(262, 0),
(263, 0),
(264, 0),
(265, 0),
(266, 0),
(267, 0),
(268, 0),
(269, 0),
(270, 0),
(271, 0),
(272, 0),
(273, 0),
(274, 0),
(275, 0),
(276, 0),
(277, 0),
(278, 0),
(279, 0),
(280, 0),
(281, 0),
(282, 0),
(283, 0),
(284, 0),
(285, 0),
(286, 0),
(287, 0),
(288, 0),
(289, 0),
(290, 0),
(291, 0),
(292, 0),
(293, 0),
(294, 0),
(295, 0),
(296, 0),
(297, 0),
(298, 0),
(299, 0),
(300, 0),
(301, 0),
(302, 0),
(303, 0),
(304, 0),
(305, 0),
(306, 0),
(307, 0),
(308, 0),
(309, 0),
(310, 0),
(311, 0),
(312, 0),
(313, 0),
(314, 0),
(315, 0),
(316, 0),
(317, 0),
(318, 0),
(319, 0),
(320, 0),
(321, 0),
(322, 0),
(323, 0),
(324, 0),
(325, 0),
(326, 0),
(327, 0),
(328, 0),
(329, 0),
(330, 0),
(331, 0),
(332, 0),
(333, 0),
(334, 0),
(335, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile`
--

CREATE TABLE IF NOT EXISTS `oc_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile_description`
--

CREATE TABLE IF NOT EXISTS `oc_profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(3, 6, 'Replacement Sent'),
(2, 6, 'Credit Issued'),
(1, 6, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(4, 6, 'Faulty, please supply details'),
(3, 6, 'Order Error'),
(2, 6, 'Received Wrong Item'),
(1, 6, 'Dead On Arrival'),
(5, 6, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(2, 6, 'Awaiting Products'),
(3, 6, 'Complete'),
(1, 6, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26608 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(11460, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(23123, 0, 'pavverticalmenu_params', 'params', '[]', 0),
(23315, 0, 'filter', 'filter_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"2";}}', 1),
(25853, 0, 'pavblog', 'pavblog', 'a:42:{s:14:"general_lwidth";s:3:"818";s:15:"general_lheight";s:3:"479";s:14:"general_swidth";s:3:"818";s:15:"general_sheight";s:3:"479";s:14:"general_xwidth";s:2:"80";s:15:"general_xheight";s:2:"80";s:14:"rss_limit_item";s:2:"12";s:26:"keyword_listing_blogs_page";s:0:"";s:16:"children_columns";s:1:"3";s:14:"general_cwidth";s:3:"261";s:15:"general_cheight";s:3:"153";s:22:"cat_limit_leading_blog";s:1:"1";s:24:"cat_limit_secondary_blog";s:1:"5";s:22:"cat_leading_image_type";s:1:"l";s:24:"cat_secondary_image_type";s:1:"s";s:24:"cat_columns_leading_blog";s:1:"1";s:27:"cat_columns_secondary_blogs";s:1:"1";s:14:"cat_show_title";s:1:"1";s:20:"cat_show_description";s:1:"1";s:17:"cat_show_readmore";s:1:"1";s:14:"cat_show_image";s:1:"1";s:15:"cat_show_author";s:1:"1";s:17:"cat_show_category";s:1:"1";s:16:"cat_show_created";s:1:"1";s:13:"cat_show_hits";s:1:"1";s:24:"cat_show_comment_counter";s:1:"1";s:15:"blog_image_type";s:1:"l";s:15:"blog_show_title";s:1:"1";s:15:"blog_show_image";s:1:"1";s:16:"blog_show_author";s:1:"1";s:18:"blog_show_category";s:1:"1";s:17:"blog_show_created";s:1:"1";s:25:"blog_show_comment_counter";s:1:"1";s:14:"blog_show_hits";s:1:"1";s:22:"blog_show_comment_form";s:1:"1";s:14:"comment_engine";s:5:"local";s:14:"diquis_account";s:10:"pavothemes";s:14:"facebook_appid";s:12:"100858303516";s:13:"comment_limit";s:2:"10";s:14:"facebook_width";s:3:"600";s:20:"auto_publish_comment";s:1:"0";s:16:"enable_recaptcha";s:1:"1";}', 1),
(12052, 0, 'pavblog_frontmodules', 'pavblog_frontmodules', 'a:1:{s:7:"modules";a:3:{i:0;s:15:"pavblogcategory";i:1;s:14:"pavblogcomment";i:2;s:13:"pavbloglatest";}}', 1),
(12053, 0, 'pavblogcategory', 'pavblogcategory_module', 'a:1:{i:1;a:5:{s:11:"category_id";s:1:"1";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(12054, 0, 'pavblogcomment', 'pavblogcomment_module', 'a:1:{i:1;a:5:{s:5:"limit";s:1:"6";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(26082, 0, 'pavnewsletter', 'pavnewsletter_module', 'a:1:{i:1;a:6:{s:9:"layout_id";s:5:"99999";s:8:"position";s:10:"footer_top";s:6:"status";s:1:"0";s:10:"sort_order";i:2;s:11:"description";a:1:{i:6;s:98:"&lt;p&gt;Để lại Email của bạn để nhận thông tin về sản phẩm mới&lt;/p&gt;\r\n";}s:6:"social";a:1:{i:6;s:0:"";}}}', 1),
(26075, 0, 'pavproducts', 'pavproducts_module', 'a:9:{i:1;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";s:13:"category_tabs";a:1:{i:0;s:3:"121";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:2;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";s:13:"category_tabs";a:1:{i:0;s:3:"136";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:3;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";s:13:"category_tabs";a:1:{i:0;s:3:"147";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:4;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";s:13:"category_tabs";a:1:{i:0;s:3:"151";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:5;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";s:13:"category_tabs";a:1:{i:0;s:3:"156";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:6;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"6";s:13:"category_tabs";a:1:{i:0;s:3:"159";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:7;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"7";s:13:"category_tabs";a:1:{i:0;s:3:"161";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:8;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"8";s:13:"category_tabs";a:1:{i:0;s:3:"160";}s:5:"image";a:1:{i:0;s:0:"";}s:5:"class";a:1:{i:0;s:0:"";}}i:9;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:12:"prefix_class";s:0:"";s:5:"width";s:3:"202";s:6:"height";s:3:"224";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"0";s:10:"sort_order";i:9;s:13:"category_tabs";a:1:{i:0;s:3:"147";}s:5:"image";a:1:{i:0;s:30:"data/catalo/catalovemaybay.jpg";}s:5:"class";a:1:{i:0;s:0:"";}}}', 1),
(26062, 0, 'pavmegamenu', 'pavmegamenu_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:5:"99999";s:8:"position";s:8:"mainmenu";s:6:"status";s:1:"1";s:10:"sort_order";i:1;}}', 1),
(26079, 0, 'banner', 'banner_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:2:"16";s:5:"width";s:3:"188";s:6:"height";s:2:"88";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";i:1;}}', 1),
(25279, 0, 'visitor', 'visitor_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"5";}}', 1),
(26066, 0, 'pavbloglatest', 'pavbloglatest_module', 'a:2:{i:1;a:10:{s:11:"description";a:2:{i:1;s:0:"";i:2;s:0:"";}s:4:"tabs";s:6:"latest";s:5:"width";s:3:"239";s:6:"height";s:3:"140";s:4:"cols";s:1:"3";s:5:"limit";s:1:"6";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:2;a:10:{s:11:"description";a:2:{i:1;s:0:"";i:2;s:0:"";}s:4:"tabs";s:6:"latest";s:5:"width";s:3:"239";s:6:"height";s:3:"140";s:4:"cols";s:1:"4";s:5:"limit";s:1:"4";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";i:1;}}', 1),
(20955, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"4";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"60";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(26600, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-69350162-1'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;', 0),
(26599, 0, 'config', 'config_error_filename', 'error.txt', 0),
(26590, 0, 'config', 'config_seo_url', '1', 0),
(26591, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(26592, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(26593, 0, 'config', 'config_maintenance', '0', 0),
(26594, 0, 'config', 'config_password', '1', 0),
(26595, 0, 'config', 'config_encryption', '2f5ad1f784dd844984ece1339b1cf66f', 0),
(26596, 0, 'config', 'config_compression', '0', 0),
(26597, 0, 'config', 'config_error_display', '0', 0),
(26598, 0, 'config', 'config_error_log', '1', 0),
(25278, 0, 'visitor', 'visitor_status', '1', 0),
(25277, 0, 'visitor', 'visitor_theme', 'Users', 0),
(25276, 0, 'visitor', 'visitor_expire', '60', 0),
(26576, 0, 'config', 'config_smtp_username', '', 0),
(26577, 0, 'config', 'config_smtp_password', '', 0),
(26578, 0, 'config', 'config_smtp_port', '25', 0),
(26579, 0, 'config', 'config_smtp_timeout', '5', 0),
(26580, 0, 'config', 'config_alert_mail', '0', 0),
(26581, 0, 'config', 'config_account_mail', '0', 0),
(26582, 0, 'config', 'config_alert_emails', '', 0),
(26583, 0, 'config', 'config_fraud_detection', '0', 0),
(26584, 0, 'config', 'config_fraud_key', '', 0),
(26585, 0, 'config', 'config_fraud_score', '', 0),
(26586, 0, 'config', 'config_fraud_status_id', '7', 0),
(26587, 0, 'config', 'config_secure', '0', 0),
(26588, 0, 'config', 'config_shared', '0', 0),
(26589, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(26065, 0, 'pavproductcarousel', 'pavproductcarousel_module', 'a:1:{i:1;a:14:{s:11:"description";a:1:{i:6;s:0:"";}s:6:"prefix";s:0:"";s:4:"tabs";a:1:{i:0;s:6:"latest";}s:5:"width";s:3:"215";s:6:"height";s:3:"238";s:12:"itemsperpage";s:1:"5";s:4:"cols";s:1:"5";s:5:"limit";s:2:"15";s:8:"interval";s:4:"8000";s:9:"auto_play";s:1:"0";s:9:"layout_id";s:1:"1";s:8:"position";s:8:"showcase";s:6:"status";s:1:"0";s:10:"sort_order";i:1;}}', 1),
(26078, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"980";s:6:"height";s:3:"280";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"0";s:10:"sort_order";i:11;}}', 1),
(26607, 0, 'pavcustom', 'pavcustom_module', 'a:1:{i:1;a:8:{s:12:"module_title";a:1:{i:6;s:14:"Giới Thiệu";}s:11:"description";a:1:{i:6;s:482:"&lt;p&gt;&lt;strong&gt;&lt;a href=&quot;/&quot; style=&quot;font-size: 23px&quot;&gt;CÔNG TY TNHH GOLDTECH&lt;/a&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;CS1:&amp;nbsp;Số 1A - Ngõ 72 - Dịch Vọng - Cầu Giấy - Hà Nội&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;CS2: Tổ 7 - Khu 9 - Nông Trang - Việt Trì - Phú Thọ&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Hotline: 04.63286530 - 0962163395&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Website:&amp;nbsp; www.congnghevang.net&lt;/p&gt;\r\n";}s:10:"show_title";s:1:"0";s:9:"layout_id";s:5:"99999";s:8:"position";s:10:"footer_top";s:6:"status";s:1:"1";s:12:"module_class";s:0:"";s:10:"sort_order";s:1:"1";}}', 1),
(26064, 0, 'pavsliderlayer', 'pavsliderlayer_module', 'a:1:{i:0;a:5:{s:8:"group_id";s:1:"3";s:9:"layout_id";s:1:"1";s:8:"position";s:9:"slideshow";s:6:"status";s:1:"1";s:10:"sort_order";i:2;}}', 1),
(26080, 0, 'pavcarousel', 'pavcarousel_module', 'a:1:{i:0;a:10:{s:9:"banner_id";s:2:"16";s:12:"itemsperpage";s:2:"24";s:5:"limit";s:2:"24";s:7:"columns";s:1:"6";s:5:"width";s:3:"190";s:6:"height";s:2:"88";s:9:"layout_id";s:5:"99999";s:8:"position";s:11:"mass_bottom";s:6:"status";s:1:"1";s:10:"sort_order";i:1;}}', 1),
(26076, 0, 'zopim_live_chat', 'zopim_live_chat_module', 'a:4:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";i:10;}i:1;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:1:"7";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(26077, 0, 'zopim_live_chat', 'zopim_live_chat_code', '&lt;!--Start of Zopim Live Chat Script--&gt;\r\n&lt;script type=&quot;text/javascript&quot;&gt;\r\nwindow.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=\r\nd.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.\r\n_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute(&quot;charset&quot;,&quot;utf-8&quot;);\r\n$.src=&quot;//v2.zopim.com/?3ry8YlVgJr8km4NltLWJqTavgm0PfJyB&quot;;z.t=+new Date;$.\r\ntype=&quot;text/javascript&quot;;e.parentNode.insertBefore($,e)})(document,&quot;script&quot;);\r\n&lt;/script&gt;\r\n&lt;!--End of Zopim Live Chat Script--&gt;', 0),
(26575, 0, 'config', 'config_smtp_host', '', 0),
(26574, 0, 'config', 'config_mail_parameter', '', 0),
(26573, 0, 'config', 'config_mail_protocol', 'mail', 0),
(26572, 0, 'config', 'config_ftp_status', '0', 0),
(26571, 0, 'config', 'config_ftp_root', '', 0),
(26570, 0, 'config', 'config_ftp_password', '', 0),
(26569, 0, 'config', 'config_ftp_username', '', 0),
(26568, 0, 'config', 'config_ftp_port', '21', 0),
(26567, 0, 'config', 'config_ftp_host', 'localhost', 0),
(26566, 0, 'config', 'config_image_cart_height', '90', 0),
(26565, 0, 'config', 'config_image_cart_width', '81', 0),
(26562, 0, 'config', 'config_image_compare_height', '90', 0),
(26563, 0, 'config', 'config_image_wishlist_width', '81', 0),
(25789, 0, 'pavmegamenu_params', 'params', '[{"align":"aligned-left","submenu":"","cols":1,"group":0,"id":88,"rows":[]},{"submenu":"0","subwidth":250,"id":3,"align":"aligned-left","cols":1,"group":0,"rows":[{"cols":[{"widgets":"","colwidth":12}]}]},{"align":"aligned-left","submenu":"","cols":1,"group":0,"id":434,"rows":[]}]', 0),
(26564, 0, 'config', 'config_image_wishlist_height', '90', 0),
(26561, 0, 'config', 'config_image_compare_width', '81', 0),
(26559, 0, 'config', 'config_image_related_width', '500', 0),
(26560, 0, 'config', 'config_image_related_height', '554', 0),
(26558, 0, 'config', 'config_image_additional_height', '83', 0),
(26557, 0, 'config', 'config_image_additional_width', '75', 0),
(26553, 0, 'config', 'config_image_popup_width', '500', 0),
(26554, 0, 'config', 'config_image_popup_height', '554', 0),
(26556, 0, 'config', 'config_image_product_height', '224', 0),
(26555, 0, 'config', 'config_image_product_width', '202', 0),
(26552, 0, 'config', 'config_image_thumb_height', '554', 0),
(26551, 0, 'config', 'config_image_thumb_width', '500', 0),
(26550, 0, 'config', 'config_image_category_height', '312', 0),
(26549, 0, 'config', 'config_image_category_width', '873', 0),
(26548, 0, 'config', 'config_icon', 'data/logo-cĂ´ng-ty.png', 0),
(26547, 0, 'config', 'config_logo', 'data/Banner/1.png', 0),
(26546, 0, 'config', 'config_return_status_id', '2', 0),
(26545, 0, 'config', 'config_return_id', '0', 0),
(26544, 0, 'config', 'config_commission', '5', 0),
(26543, 0, 'config', 'config_affiliate_id', '4', 0),
(26542, 0, 'config', 'config_stock_status_id', '5', 0),
(26541, 0, 'config', 'config_stock_checkout', '0', 0),
(26540, 0, 'config', 'config_stock_warning', '0', 0),
(26539, 0, 'config', 'config_stock_display', '0', 0),
(26538, 0, 'config', 'config_complete_status_id', '5', 0),
(26537, 0, 'config', 'config_order_status_id', '1', 0),
(26536, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(26535, 0, 'config', 'config_order_edit', '100', 0),
(26534, 0, 'config', 'config_checkout_id', '5', 0),
(26533, 0, 'config', 'config_guest_checkout', '1', 0),
(26532, 0, 'config', 'config_cart_weight', '1', 0),
(26531, 0, 'config', 'config_account_id', '3', 0),
(26527, 0, 'config', 'config_customer_online', '0', 0),
(26528, 0, 'config', 'config_customer_group_id', '1', 0),
(26529, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(26530, 0, 'config', 'config_customer_price', '0', 0),
(26036, 0, 'google_sitemap', 'google_sitemap_status', '1', 0),
(26083, 0, 'themecontrol', 'themecontrol', 'a:69:{s:13:"default_theme";s:13:"pav_styleshop";s:9:"layout_id";s:1:"1";s:8:"position";s:1:"1";s:21:"cateogry_display_mode";s:4:"grid";s:24:"listing_products_columns";s:1:"0";s:30:"listing_products_columns_small";s:1:"0";s:34:"listing_products_columns_minismall";s:1:"0";s:14:"category_pzoom";s:1:"1";s:15:"show_swap_image";s:1:"0";s:18:"product_enablezoom";s:1:"1";s:19:"product_zoomgallery";s:6:"slider";s:16:"product_zoommode";s:5:"basic";s:20:"product_zoomlenssize";s:3:"150";s:18:"product_zoomeasing";s:1:"1";s:21:"product_zoomlensshape";s:5:"basic";s:22:"product_related_column";s:1:"0";s:24:"enable_product_customtab";s:1:"1";s:22:"product_customtab_name";a:1:{i:6;s:0:"";}s:25:"product_customtab_content";a:1:{i:6;s:0:"";}s:16:"location_address";s:14:"Hanoi, Vietnam";s:17:"location_latitude";s:9:"21.029883";s:18:"location_longitude";s:10:"105.786092";s:18:"contact_customhtml";a:1:{i:6;s:452:"&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;&lt;small&gt;Dịch vụ khách hàng:&lt;/small&gt;&lt;/b&gt;&lt;br /&gt;\r\n&lt;a href=&quot;mailto:kientran886@gmail.com &quot;&gt;kientran886@gmail.com &lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;&lt;small&gt;Đổi và trả hàng:&lt;/small&gt;&lt;/b&gt;&lt;br /&gt;\r\n&lt;a href=&quot;mailto:kientran886@gmail.com&quot;&gt;kientran886@gmail.com&lt;/a&gt;&lt;/p&gt;\r\n";}s:4:"skin";s:4:"baby";s:11:"theme_width";s:4:"auto";s:23:"enable_custom_copyright";s:1:"0";s:9:"copyright";s:29:"Copyright 2016 thietkeweb.xyz";s:18:"enable_offsidebars";s:1:"0";s:20:"enable_footer_center";s:1:"0";s:16:"enable_paneltool";s:1:"0";s:23:"enable_development_mode";s:0:"";s:6:"layout";s:9:"fullwidth";s:9:"quickview";s:1:"1";s:9:"logo_type";s:10:"logo-theme";s:12:"support_data";a:1:{i:6;s:2566:"&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; height=&quot;122&quot; width=&quot;631&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;114&quot; width=&quot;247&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;width:91px;height:79px;&quot;&gt;\r\n						&lt;p&gt;&lt;img src=&quot;http://congnghevang.net/image/data/Slide Show/logohead1.jpg&quot; style=&quot;width: 79px; height: 79px; float: left;&quot; /&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n						&lt;td style=&quot;width:210px;height:79px;&quot;&gt;\r\n						&lt;p&gt;&lt;a href=&quot;#&quot;&gt;SẢN PHẨM CHÍNH HÃNG&lt;/a&gt;&lt;/p&gt;\r\n\r\n						&lt;p&gt;&lt;a href=&quot;#&quot;&gt;CHẤT LƯỢNG UY TÍN&lt;/a&gt;&lt;/p&gt;\r\n\r\n						&lt;p&gt;&lt;a href=&quot;#&quot;&gt;GIÁ CẢ HỢP LÝ&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;width:343px;height:35px;&quot;&gt;\r\n						&lt;p&gt;&lt;img src=&quot;http://congnghevang.net/image/data/Slide Show/freeship.png&quot; style=&quot;width: 57px; height: 34px; float: left;&quot; /&gt;&amp;nbsp;&lt;a href=&quot;#&quot;&gt;GIAO HÀNG MIỄN PHÍ TRÊN TOÀN QUỐC&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;width:343px;height:41px;&quot;&gt;\r\n						&lt;p&gt;&lt;img src=&quot;http://congnghevang.net/image/data/Slide Show/iconsuachua.jpg&quot; style=&quot;width: 57px; height: 37px; float: left;&quot; /&gt;&lt;a href=&quot;#&quot;&gt;SỬA CHỮA - BẢO HÀNH TẠI NƠI SỬ DỤNG&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;div class=&quot;support-skyper&quot;&gt;\r\n&lt;p&gt;&lt;a class=&quot;chat-skype&quot; href=&quot;skype:kinhdoanh.01?call&quot;&gt;&lt;img src=&quot;http://congnghevang.net/image/data/Slide Show/skype-logo.png&quot; /&gt; &lt;/a&gt; &lt;span&gt;0962163395&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a class=&quot;chat-skype&quot; href=&quot;skype:kinhdoanh.02?call&quot;&gt;&lt;img src=&quot;http://congnghevang.net/image/data/Slide Show/skype-logo.png&quot; /&gt; &lt;/a&gt; &lt;span&gt;0983027948&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n";}s:17:"widget_about_data";a:1:{i:6;s:0:"";}s:18:"widget_paypal_data";a:1:{i:6;s:256:"&lt;p&gt;&lt;a href=&quot;http://thietkeweb.xyz&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://congnghevang.net/image/data/pavblog/logo-footer.png&quot; style=&quot;width: 100px; height: 17px;&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n";}s:8:"fontsize";s:2:"14";s:17:"enable_customfont";s:1:"0";s:11:"type_fonts1";s:8:"standard";s:13:"normal_fonts1";s:27:"Verdana, Geneva, sans-serif";s:11:"google_url1";s:0:"";s:14:"google_family1";s:0:"";s:14:"body_selector1";s:0:"";s:11:"type_fonts2";s:8:"standard";s:13:"normal_fonts2";s:27:"Verdana, Geneva, sans-serif";s:11:"google_url2";s:0:"";s:14:"google_family2";s:0:"";s:14:"body_selector2";s:0:"";s:11:"type_fonts3";s:8:"standard";s:13:"normal_fonts3";s:27:"Verdana, Geneva, sans-serif";s:11:"google_url3";s:0:"";s:14:"google_family3";s:0:"";s:14:"body_selector3";s:0:"";s:14:"block_showcase";s:0:"";s:15:"block_promotion";s:0:"";s:16:"block_footer_top";s:1:"2";s:19:"block_footer_center";s:0:"";s:19:"block_footer_bottom";s:0:"";s:19:"enable_compress_css";s:0:"";s:17:"exclude_css_files";s:13:"bootstrap.css";s:15:"customize_theme";s:0:"";s:12:"body_pattern";s:4:"none";s:12:"use_custombg";s:1:"0";s:8:"bg_image";s:0:"";s:9:"bg_repeat";s:6:"repeat";s:11:"bg_position";s:8:"left top";s:10:"custom_css";s:0:"";s:17:"custom_javascript";s:0:"";}', 1),
(26526, 0, 'config', 'config_tax_customer', 'shipping', 0),
(26525, 0, 'config', 'config_tax_default', 'shipping', 0),
(26524, 0, 'config', 'config_vat', '0', 0),
(26523, 0, 'config', 'config_tax', '1', 0),
(26522, 0, 'config', 'config_voucher_max', '1000', 0),
(26521, 0, 'config', 'config_voucher_min', '1', 0),
(26520, 0, 'config', 'config_download', '1', 0),
(26519, 0, 'config', 'config_review_status', '1', 0),
(26516, 0, 'config', 'config_catalog_limit', '16', 0),
(26517, 0, 'config', 'config_admin_limit', '20', 0),
(26518, 0, 'config', 'config_product_count', '1', 0),
(26515, 0, 'config', 'config_weight_class_id', '1', 0),
(26514, 0, 'config', 'config_length_class_id', '1', 0),
(26513, 0, 'config', 'config_currency_auto', '1', 0),
(26512, 0, 'config', 'config_currency', 'VND', 0),
(26511, 0, 'config', 'config_admin_language', 'vi', 0),
(26510, 0, 'config', 'config_language', 'vi', 0),
(26509, 0, 'config', 'config_zone_id', '3776', 0),
(26508, 0, 'config', 'config_country_id', '230', 0),
(26507, 0, 'config', 'config_layout_id', '4', 0),
(26505, 0, 'config', 'config_meta_keyword', 'Camera quan sát, Camera giám sát, Lắp đặt camera quan sát, lắp đặt camera giám sát, lap dat camera, camera chất lượng cao, camera xem qua mang,camera quan sát không dây,camera quan sát từ xa, camera sát qua điện thoại, may cham cong, may cham cong van tay, khoa tu, bao dong chong trom, thiet bi dien thong minh, lap dat mang LAN', 0),
(26506, 0, 'config', 'config_template', 'pav_styleshop', 0),
(26504, 0, 'config', 'config_meta_description', 'GOLDTECH cung cấp các giải pháp về thiết bị Camera quan sát, chống trộm, kiểm soát ra vào, là nhà cung cấp uy tín hàng đầu về thiết bị an ninh ', 0),
(26500, 0, 'config', 'config_email', 'kientran886@gmail.com', 0),
(26503, 0, 'config', 'config_title', 'Camera quan sát - lắp đặt camera quan sát ', 0),
(26502, 0, 'config', 'config_fax', '', 0),
(26501, 0, 'config', 'config_telephone', '0962163395', 0),
(26499, 0, 'config', 'config_address', 'Số 1A - Ngõ 72 - Dịch Vọng - Cầu Giấy - Hà Nội', 0),
(26498, 0, 'config', 'config_owner', 'Công Ty TNHH GOLDTECH', 0),
(26497, 0, 'config', 'config_name', 'Công Ty TNHH GOLDTECH', 0),
(26606, 0, 'pavverticalmenu', 'pavverticalmenu_module', 'a:7:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:9:"slideshow";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:2;a:4:{s:9:"layout_id";s:1:"5";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:3;a:4:{s:9:"layout_id";s:2:"14";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:4;a:4:{s:9:"layout_id";s:2:"13";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:5;a:4:{s:9:"layout_id";s:2:"15";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:6;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 6, 'Out Of Stock'),
(8, 6, 'Pre-Order'),
(7, 6, 'In Stock'),
(6, 6, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', 17.5000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1555 ;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1276, 'information_id=4', 'gioi-thieu'),
(1425, 'product_id=285', 'Cong-tac-cam-bien-chuyen-dong-AST02S'),
(917, 'pavblog/category=21', ''),
(918, 'pavblog/category=23', ''),
(919, 'pavblog/category=20', ''),
(1334, 'pavblog/category=27', 'dich-vu-giai-phap'),
(931, 'information_id=7', 'khach-hang'),
(1432, 'manufacturer_id=54', 'bao dong Karass'),
(1428, 'product_id=286', 'Đau-ghi-hinh-4-kenh-HIKVISION-DS-7104HGHI-E1'),
(944, 'manufacturer_id=13', 'HP'),
(1514, 'manufacturer_id=62', 'camera quan sat KBVISION'),
(1504, 'product_id=314', 'camera-quan-sat-icam-294hd'),
(1512, 'product_id=316', 'camera-quan-sat-icam-493hd'),
(1494, 'product_id=315', 'camera-quan-sat-icam-393hd'),
(1461, 'product_id=295', 'Camera-quan-sat-GLTECH-GLP-HD13'),
(1462, 'product_id=296', 'Camera-quan-sat-GLP-HD13M  Full 1080p'),
(1463, 'product_id=297', 'May-cham-cong-van-tay-RONALD-JACK-X88'),
(1466, 'product_id=298', 'Man-hinh-mau-chuong-hinh-Commax-CDV-43N'),
(1507, 'product_id=252', 'camera-icam-191hd'),
(1508, 'product_id=253', 'camera-icam-291hd'),
(1403, 'product_id=274', 'Camera-quan-sat-dahua-HAC-HDW1000RP'),
(1404, 'product_id=275', 'Camera-quan-sat-dahua-HAC-HFW1000RP'),
(1411, 'product_id=276', 'Camera-quan-sat-dahua-HAC-HDW1000MP'),
(1412, 'product_id=277', 'Camera-quan-sat-dahua-HAC-HFW1000SP'),
(1521, 'product_id=317', 'camera-hdcvi-1.0megapixel-kbvision-kb1001c'),
(1505, 'product_id=308', 'Camera-quan-sat-icam-194hd'),
(1491, 'product_id=312', 'cong-tac-den-cam-ung-am-tuong-am-s37'),
(1481, 'product_id=306', 'Camera-AHD-than-hong-ngoai-KCE-CBTIA6048D'),
(1480, 'product_id=303', 'Camera-AHD-ban-cau-KCE-SDTIA6030D'),
(1472, 'product_id=304', 'Camera-AHD-than-hong-ngoai-KCE-EBTIA6636CB'),
(1473, 'product_id=305', 'Camera-AHD-than-hong-ngoai-KCE-SBTIA6054CB'),
(1503, 'product_id=313', 'camera-quan-sat-icam-293hd'),
(1486, 'pavblog/blog=21', 'Cung-cap-lap-đat-he-thong-camera-quan-sat-va-he-thong-may-cham-cong-van-tay-cho-cong-ty-tnhh-now-vina'),
(1487, 'pavblog/blog=22', 'giai-phap-camera-giam-sat-truong-hoc'),
(1488, 'product_id=309', 'den- op-tran-cam-ung-am-323'),
(1489, 'product_id=310', 'den-cam-ung-op-tran-am-326'),
(1490, 'product_id=311', 'cong-tac-mo-den-khi-co-nguoi-va-troi-toi-am-ss68'),
(1520, 'product_id=320', 'camera-hdcvi-1.3megapixel-kbvision-kb1301c'),
(1524, 'product_id=319', 'camera-hdcvi-1.0megapixel-kbvision-kb1003c'),
(1522, 'product_id=318', 'camera-hdcvi-1.0megapixel-kbvision-kb1002c'),
(1459, 'product_id=293', 'Camera-GLTECH-GLP-HD12M-Full-1080P'),
(1458, 'product_id=292', 'Camera-quan-sat-GLTECH-GLP-HD12'),
(1468, 'product_id=299', 'Man-hinh-chuong-cua-Commax-CDV-43Q'),
(1467, 'product_id=300', 'Man-hinh-mau-chuong-cua-Commax-CDV-70K'),
(1460, 'product_id=294', 'Camera-quan-sat-GLTECH-GLP-HD1P '),
(1396, 'product_id=270', 'Camera-quan-sat-DS-2CE56C0T-IRP'),
(1398, 'product_id=271', 'Camera-quan-sat-DS-2CE16C0T-IRP'),
(1400, 'product_id=272', 'Camera-quan-sat-hikvision-DS-2CE16C0T-IT3'),
(1401, 'product_id=273', 'Camera-quan-sat-hikvision-DS-2CE56C0T-IT3'),
(1413, 'product_id=278', 'Camera-quan-sat-dahua-HAC-HDBW2120EP'),
(1414, 'product_id=279', 'Camera-quan-sat-hikvision-DS-2CE16C0T-IT5'),
(1415, 'product_id=280', 'Camera-quan-sat-hikvision-DS-2CE56C2T-IT3'),
(1418, 'product_id=281', 'Camera-quan-sat-hikvision-DS-2CE16C2T-IT3'),
(1417, 'product_id=282', 'Camera-HDTVI-HIKVISION-DS-2CE56D1T-IR'),
(1420, 'pavblog/blog=20', 'Huong-dan-cai-dat-va-su-dung-phan-mem-xem-camera-iVMS4200-Hikvision'),
(1429, 'product_id=287', 'Đau-Ghi-Hinh-16-kenh-Hikvision-DS-7216HGHI-E1'),
(1430, 'product_id=288', 'Đau-Ghi-Hinh-4-Kênh-Hikvision-DS-7204HGHI-SH'),
(1433, 'manufacturer_id=55', 'bao dong AMOS'),
(1434, 'manufacturer_id=56', 'chuong hinh COMMAX'),
(1435, 'manufacturer_id=57', 'chuong hinh Ete'),
(1436, 'manufacturer_id=58', 'chuong hinh HYUNDAI'),
(1445, 'product_id=289', 'Khoa-đien-tu-YLI-YM-280LED'),
(1446, 'product_id=290', 'Khoa-dien-tu-doi-YM-280DLED'),
(1444, 'manufacturer_id=60', 'khoa dien tu YLI'),
(1447, 'product_id=291', 'Khoa-dien-tu-YM-750LED'),
(1449, 'manufacturer_id=61', 'camera quan sat GLTECH'),
(1394, 'pavblog/blog=19', 'Tim-hieu-ve-tinh-nang-moi-nhat-cua-camera-hikvision-2016'),
(1509, 'product_id=254', 'camera-icam-391hd'),
(1506, 'product_id=255', 'camera-icam-491hd'),
(1510, 'product_id=256', 'camera-icam-691hd'),
(1325, 'product_id=257', 'bao-dong-amos-am-3800g'),
(1326, 'product_id=258', 'bao-dong-chong-trom-amos-am-gsm74'),
(1354, 'product_id=259', 'bao-dong-chong-trom-amos-am-3500g'),
(1328, 'product_id=260', '-dau-ghi-hinh-icam-dvr-ah1041hd'),
(1329, 'product_id=261', 'dau-ghi-hinh-icam-dvr-ah1081hd'),
(1330, 'product_id=262', 'dau-ghi-hinh-icam-dvr-ah1016hd'),
(1511, 'product_id=263', 'Camera-quan-sat-ICAM-992IP'),
(1393, 'pavblog/blog=18', 'lap-dat-camera-quan-sat-nha-may'),
(1374, 'product_id=264', 'Man-hinh-mau-chuong-cua-Commax-CDV-35A'),
(1373, 'product_id=265', 'man-hinh-mau-chuong-cua-COMMAX-CDV-35U'),
(1375, 'product_id=266', 'May-cham-cong-RONALD-JACK-X628C'),
(1364, 'manufacturer_id=43', 'camera quan sat ICAM'),
(1365, 'manufacturer_id=44', 'Camera quan sat HIKVISION'),
(1363, 'manufacturer_id=45', 'camera quan sat DAHUA'),
(1362, 'manufacturer_id=46', 'may cham cong RONALD JACK'),
(1366, 'manufacturer_id=47', 'Camera quan sat VANTECH'),
(1431, 'manufacturer_id=48', 'camera quan sat SAMTECH'),
(1368, 'manufacturer_id=49', 'camera quan sat KCE'),
(1369, 'manufacturer_id=50', 'Camera quan sat QUESTEK'),
(1370, 'manufacturer_id=51', 'camera quan sat BENCO'),
(1371, 'manufacturer_id=52', 'Camera quan sat AVTECH'),
(1380, 'product_id=267', 'may-cham-cong-van-tay-va-the-cam-ung-RONALD-JACK-X628C'),
(1389, 'product_id=268', 'May-cham-cong-RONALD-JACK-4000TID-C'),
(1391, 'product_id=269', 'May-cham-cong-RONALD-JACK-8000T'),
(1495, 'product_id=283', 'Camera-icam-371hd'),
(1496, 'product_id=284', 'Camera-ICAM-381HD'),
(1476, 'product_id=302', 'Camera-AHD-ban-cau-KCE-DTIA6024'),
(1479, 'product_id=301', 'Camera-AHD-ban-cau-KCE-SPTIA6024'),
(1502, 'product_id=307', 'Camera-quan-sat-icam-193hd'),
(1228, 'category_id=121', 'camera-quan-sat'),
(1450, 'category_id=122', 'camera-quan-sat-icam'),
(1457, 'category_id=123', 'camera-quan-sat-hikvision'),
(1383, 'category_id=124', 'camera-quan-sat-dahua'),
(1456, 'category_id=125', 'camera-quan-sat-vantech'),
(1454, 'category_id=126', 'camera-quan-sat-avtech'),
(1386, 'category_id=127', 'camera-quan-sat-samtech'),
(1448, 'category_id=128', 'camera-quan-sat-gltech'),
(1384, 'category_id=129', 'camera-quan-sat-kce'),
(1292, 'category_id=130', 'camera-quan-sat-kbvision'),
(1290, 'category_id=131', 'camera-quan-sat-questek'),
(1547, 'category_id=132', 'camera-quan-sat-wifi-khong-day'),
(1455, 'category_id=133', 'camera-nguy-trang'),
(1285, 'category_id=134', 'camera-quan-sat-chuyen-dung'),
(1288, 'category_id=135', 'phu-kien-camera-quan-sat'),
(1305, 'category_id=136', 'dau-ghi-hinh-camera'),
(1310, 'category_id=137', 'dau-ghi-hinh-icam'),
(1309, 'category_id=138', 'dau-ghi-hinh-hikvision'),
(1308, 'category_id=139', 'dau-ghi-hinh-dahua'),
(1304, 'category_id=140', 'dau-ghi-hinh-vantech'),
(1306, 'category_id=141', 'dau-ghi-hinh-avtech'),
(1314, 'category_id=142', 'dau-ghi-hinh-samtech'),
(1453, 'category_id=143', 'dau-ghi-hinh-gltech'),
(1312, 'category_id=144', 'dau-ghi-hinh-kce'),
(1311, 'category_id=145', 'dau-ghi-hinh-kbvision'),
(1313, 'category_id=146', 'dau-ghi-hinh-questek'),
(1277, 'category_id=147', 'bao-dong-chong-trom'),
(1280, 'category_id=148', 'bao-dong-sonic-safety'),
(1279, 'category_id=149', 'bao-dong-karass'),
(1278, 'category_id=150', 'bao-dong-amos'),
(1295, 'category_id=151', 'chuong-cua-co-hinh'),
(1297, 'category_id=152', 'chuong-hinh-commax'),
(1298, 'category_id=153', 'chuong-hinh-ete'),
(1296, 'category_id=154', 'chuong-hinh-aiphone'),
(1299, 'category_id=155', 'chuong-hinh-hyundai'),
(1300, 'category_id=156', 'kiem-soat-ra-vao-cham-cong'),
(1302, 'category_id=157', 'may-cham-cong-ronald-jack'),
(1439, 'category_id=158', 'khoa-cua-tu'),
(1315, 'category_id=159', 'thiet-bi-nha-thong-minh'),
(1303, 'category_id=160', 'thiet-bi-mang'),
(1316, 'category_id=161', 'tivi-box-android'),
(1333, 'pavblog/category=28', 'tin-tuc'),
(1531, 'product_id=321', 'camera-hdcvi-1.3megapixel-kbvision-kb1303c'),
(1530, 'product_id=322', 'camera-hdcvi-1.3megapixel-kbvision-kb1302c'),
(1532, 'product_id=323', 'camera-hdcvi-1.3megapixel-kbvision-kb1305c'),
(1529, 'product_id=324', 'camera-hdcvi-2.0megapixel-kbvision-kb2001c'),
(1534, 'pavblog/blog=23', 'Lap-dat-camera-giam-sat'),
(1537, 'product_id=325', 'camera-ahd-samtech-stc-3124'),
(1536, 'product_id=326', 'camera-ahd-samtech-STC-5136 '),
(1538, 'product_id=327', 'camera-ahd-samtech-stc-3010'),
(1539, 'product_id=328', 'camera-ahd-samtech-stc-3110'),
(1540, 'product_id=329', 'camera-ahd-samtech-stc-6310'),
(1542, 'product_id=330', 'camera-ahd-samtech-STC-3610 '),
(1543, 'product_id=331', 'Camera-ahd-1.3megapixel-samtech-STC-304G  '),
(1544, 'product_id=332', 'Camera-ahd-1.3megapixel-samtech-STC-312G '),
(1546, 'pavblog/blog=24', 'Lap-dat-camera-quan-sat-trang-trai-chan-nuoi'),
(1549, 'pavblog/blog=25', 'Camera-wifi-khong-day'),
(1551, 'product_id=333', 'camera-hdcvi-2mp-dahua-HAC-HDW1200M'),
(1553, 'product_id=334', 'camera-hdcvi-2.0-megapixcel-dahua-HAC-HFW1200RMP'),
(1554, 'product_id=335', 'Camera-hdcvi-2.0mp-dahua-HAC-HFW1200S');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '7cb5ee0101865b369779a80e9f10fce3fbbe114e', 'a0b5407a9', '', '', 'info@attvietnam.vn', '', '14.162.191.202', 1, '2015-09-16 08:43:00'),
(2, 1, 'quantri', '0b5b1bfa4e17e5d9fa49f61e0fa690cb3c55ac4f', '605ce71d5', 'Trần', 'Kiên', 'kientran886@gmail.com', '', '123.16.4.112', 1, '2014-01-27 23:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:191:{i:0;s:14:"amazon/listing";i:1;s:14:"amazon/product";i:2;s:16:"amazonus/listing";i:3;s:16:"amazonus/product";i:4;s:17:"catalog/attribute";i:5;s:23:"catalog/attribute_group";i:6;s:16:"catalog/category";i:7;s:16:"catalog/download";i:8;s:14:"catalog/filter";i:9;s:19:"catalog/information";i:10;s:20:"catalog/manufacturer";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:15:"catalog/profile";i:14;s:14:"catalog/review";i:15;s:18:"common/filemanager";i:16;s:13:"design/banner";i:17;s:19:"design/custom_field";i:18;s:13:"design/layout";i:19;s:12:"ebay/profile";i:20;s:13:"ebay/template";i:21;s:14:"extension/feed";i:22;s:17:"extension/manager";i:23;s:16:"extension/module";i:24;s:17:"extension/openbay";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:16:"feed/google_base";i:29;s:19:"feed/google_sitemap";i:30;s:20:"localisation/country";i:31;s:21:"localisation/currency";i:32;s:21:"localisation/geo_zone";i:33;s:21:"localisation/language";i:34;s:25:"localisation/length_class";i:35;s:25:"localisation/order_status";i:36;s:26:"localisation/return_action";i:37;s:26:"localisation/return_reason";i:38;s:26:"localisation/return_status";i:39;s:25:"localisation/stock_status";i:40;s:22:"localisation/tax_class";i:41;s:21:"localisation/tax_rate";i:42;s:25:"localisation/weight_class";i:43;s:17:"localisation/zone";i:44;s:14:"module/account";i:45;s:16:"module/affiliate";i:46;s:29:"module/amazon_checkout_layout";i:47;s:13:"module/banner";i:48;s:17:"module/bestseller";i:49;s:15:"module/carousel";i:50;s:15:"module/category";i:51;s:18:"module/ebaydisplay";i:52;s:15:"module/featured";i:53;s:13:"module/filter";i:54;s:18:"module/google_talk";i:55;s:18:"module/information";i:56;s:13:"module/latest";i:57;s:16:"module/pp_layout";i:58;s:16:"module/slideshow";i:59;s:14:"module/special";i:60;s:12:"module/store";i:61;s:14:"module/welcome";i:62;s:14:"openbay/amazon";i:63;s:16:"openbay/amazonus";i:64;s:15:"openbay/openbay";i:65;s:12:"openbay/play";i:66;s:23:"payment/amazon_checkout";i:67;s:24:"payment/authorizenet_aim";i:68;s:21:"payment/bank_transfer";i:69;s:14:"payment/cheque";i:70;s:11:"payment/cod";i:71;s:21:"payment/free_checkout";i:72;s:22:"payment/klarna_account";i:73;s:22:"payment/klarna_invoice";i:74;s:14:"payment/liqpay";i:75;s:20:"payment/moneybookers";i:76;s:14:"payment/nochex";i:77;s:15:"payment/paymate";i:78;s:16:"payment/paypoint";i:79;s:13:"payment/payza";i:80;s:26:"payment/perpetual_payments";i:81;s:18:"payment/pp_express";i:82;s:25:"payment/pp_payflow_iframe";i:83;s:14:"payment/pp_pro";i:84;s:21:"payment/pp_pro_iframe";i:85;s:17:"payment/pp_pro_pf";i:86;s:17:"payment/pp_pro_uk";i:87;s:19:"payment/pp_standard";i:88;s:15:"payment/sagepay";i:89;s:22:"payment/sagepay_direct";i:90;s:18:"payment/sagepay_us";i:91;s:19:"payment/twocheckout";i:92;s:28:"payment/web_payment_software";i:93;s:16:"payment/worldpay";i:94;s:10:"play/order";i:95;s:12:"play/product";i:96;s:27:"report/affiliate_commission";i:97;s:22:"report/customer_credit";i:98;s:22:"report/customer_online";i:99;s:21:"report/customer_order";i:100;s:22:"report/customer_reward";i:101;s:24:"report/product_purchased";i:102;s:21:"report/product_viewed";i:103;s:18:"report/sale_coupon";i:104;s:17:"report/sale_order";i:105;s:18:"report/sale_return";i:106;s:20:"report/sale_shipping";i:107;s:15:"report/sale_tax";i:108;s:14:"sale/affiliate";i:109;s:12:"sale/contact";i:110;s:11:"sale/coupon";i:111;s:13:"sale/customer";i:112;s:20:"sale/customer_ban_ip";i:113;s:19:"sale/customer_group";i:114;s:10:"sale/order";i:115;s:14:"sale/recurring";i:116;s:11:"sale/return";i:117;s:12:"sale/voucher";i:118;s:18:"sale/voucher_theme";i:119;s:15:"setting/setting";i:120;s:13:"setting/store";i:121;s:16:"shipping/auspost";i:122;s:17:"shipping/citylink";i:123;s:14:"shipping/fedex";i:124;s:13:"shipping/flat";i:125;s:13:"shipping/free";i:126;s:13:"shipping/item";i:127;s:23:"shipping/parcelforce_48";i:128;s:15:"shipping/pickup";i:129;s:19:"shipping/royal_mail";i:130;s:12:"shipping/ups";i:131;s:13:"shipping/usps";i:132;s:15:"shipping/weight";i:133;s:11:"tool/backup";i:134;s:14:"tool/error_log";i:135;s:12:"total/coupon";i:136;s:12:"total/credit";i:137;s:14:"total/handling";i:138;s:16:"total/klarna_fee";i:139;s:19:"total/low_order_fee";i:140;s:12:"total/reward";i:141;s:14:"total/shipping";i:142;s:15:"total/sub_total";i:143;s:9:"total/tax";i:144;s:11:"total/total";i:145;s:13:"total/voucher";i:146;s:9:"user/user";i:147;s:20:"user/user_permission";i:148;s:22:"module/pavverticalmenu";i:149;s:19:"module/themecontrol";i:150;s:15:"module/pavdeals";i:151;s:25:"module/pavproductcarousel";i:152;s:13:"module/filter";i:153;s:13:"module/pavmap";i:154;s:14:"module/pavblog";i:155;s:22:"module/pavblogcategory";i:156;s:21:"module/pavblogcomment";i:157;s:20:"module/pavbloglatest";i:158;s:16:"module/pavcustom";i:159;s:18:"module/pavcarousel";i:160;s:17:"module/pavtwitter";i:161;s:21:"module/pavsliderlayer";i:162;s:18:"module/pavmegamenu";i:163;s:16:"module/pavsocial";i:164;s:20:"module/pavnewsletter";i:165;s:18:"module/pavproducts";i:166;s:13:"module/latest";i:167;s:14:"module/special";i:168;s:25:"module/pavproductcarousel";i:169;s:12:"module/store";i:170;s:12:"module/store";i:171;s:16:"module/pavsocial";i:172;s:17:"module/pavtwitter";i:173;s:16:"module/pavcustom";i:174;s:21:"module/pavproducttabs";i:175;s:25:"module/pavproductfeatured";i:176;s:21:"module/pavreassurance";i:177;s:21:"module/pavreassurance";i:178;s:13:"module/pavads";i:179;s:14:"module/special";i:180;s:17:"module/bestseller";i:181;s:20:"module/pavautosearch";i:182;s:20:"module/pavautosearch";i:183;s:15:"module/category";i:184;s:20:"module/pavnewsletter";i:185;s:17:"module/bestseller";i:186;s:22:"module/zopim_live_chat";i:187;s:14:"module/special";i:188;s:15:"module/carousel";i:189;s:14:"module/visitor";i:190;s:19:"feed/google_sitemap";}s:6:"modify";a:191:{i:0;s:14:"amazon/listing";i:1;s:14:"amazon/product";i:2;s:16:"amazonus/listing";i:3;s:16:"amazonus/product";i:4;s:17:"catalog/attribute";i:5;s:23:"catalog/attribute_group";i:6;s:16:"catalog/category";i:7;s:16:"catalog/download";i:8;s:14:"catalog/filter";i:9;s:19:"catalog/information";i:10;s:20:"catalog/manufacturer";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:15:"catalog/profile";i:14;s:14:"catalog/review";i:15;s:18:"common/filemanager";i:16;s:13:"design/banner";i:17;s:19:"design/custom_field";i:18;s:13:"design/layout";i:19;s:12:"ebay/profile";i:20;s:13:"ebay/template";i:21;s:14:"extension/feed";i:22;s:17:"extension/manager";i:23;s:16:"extension/module";i:24;s:17:"extension/openbay";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:16:"feed/google_base";i:29;s:19:"feed/google_sitemap";i:30;s:20:"localisation/country";i:31;s:21:"localisation/currency";i:32;s:21:"localisation/geo_zone";i:33;s:21:"localisation/language";i:34;s:25:"localisation/length_class";i:35;s:25:"localisation/order_status";i:36;s:26:"localisation/return_action";i:37;s:26:"localisation/return_reason";i:38;s:26:"localisation/return_status";i:39;s:25:"localisation/stock_status";i:40;s:22:"localisation/tax_class";i:41;s:21:"localisation/tax_rate";i:42;s:25:"localisation/weight_class";i:43;s:17:"localisation/zone";i:44;s:14:"module/account";i:45;s:16:"module/affiliate";i:46;s:29:"module/amazon_checkout_layout";i:47;s:13:"module/banner";i:48;s:17:"module/bestseller";i:49;s:15:"module/carousel";i:50;s:15:"module/category";i:51;s:18:"module/ebaydisplay";i:52;s:15:"module/featured";i:53;s:13:"module/filter";i:54;s:18:"module/google_talk";i:55;s:18:"module/information";i:56;s:13:"module/latest";i:57;s:16:"module/pp_layout";i:58;s:16:"module/slideshow";i:59;s:14:"module/special";i:60;s:12:"module/store";i:61;s:14:"module/welcome";i:62;s:14:"openbay/amazon";i:63;s:16:"openbay/amazonus";i:64;s:15:"openbay/openbay";i:65;s:12:"openbay/play";i:66;s:23:"payment/amazon_checkout";i:67;s:24:"payment/authorizenet_aim";i:68;s:21:"payment/bank_transfer";i:69;s:14:"payment/cheque";i:70;s:11:"payment/cod";i:71;s:21:"payment/free_checkout";i:72;s:22:"payment/klarna_account";i:73;s:22:"payment/klarna_invoice";i:74;s:14:"payment/liqpay";i:75;s:20:"payment/moneybookers";i:76;s:14:"payment/nochex";i:77;s:15:"payment/paymate";i:78;s:16:"payment/paypoint";i:79;s:13:"payment/payza";i:80;s:26:"payment/perpetual_payments";i:81;s:18:"payment/pp_express";i:82;s:25:"payment/pp_payflow_iframe";i:83;s:14:"payment/pp_pro";i:84;s:21:"payment/pp_pro_iframe";i:85;s:17:"payment/pp_pro_pf";i:86;s:17:"payment/pp_pro_uk";i:87;s:19:"payment/pp_standard";i:88;s:15:"payment/sagepay";i:89;s:22:"payment/sagepay_direct";i:90;s:18:"payment/sagepay_us";i:91;s:19:"payment/twocheckout";i:92;s:28:"payment/web_payment_software";i:93;s:16:"payment/worldpay";i:94;s:10:"play/order";i:95;s:12:"play/product";i:96;s:27:"report/affiliate_commission";i:97;s:22:"report/customer_credit";i:98;s:22:"report/customer_online";i:99;s:21:"report/customer_order";i:100;s:22:"report/customer_reward";i:101;s:24:"report/product_purchased";i:102;s:21:"report/product_viewed";i:103;s:18:"report/sale_coupon";i:104;s:17:"report/sale_order";i:105;s:18:"report/sale_return";i:106;s:20:"report/sale_shipping";i:107;s:15:"report/sale_tax";i:108;s:14:"sale/affiliate";i:109;s:12:"sale/contact";i:110;s:11:"sale/coupon";i:111;s:13:"sale/customer";i:112;s:20:"sale/customer_ban_ip";i:113;s:19:"sale/customer_group";i:114;s:10:"sale/order";i:115;s:14:"sale/recurring";i:116;s:11:"sale/return";i:117;s:12:"sale/voucher";i:118;s:18:"sale/voucher_theme";i:119;s:15:"setting/setting";i:120;s:13:"setting/store";i:121;s:16:"shipping/auspost";i:122;s:17:"shipping/citylink";i:123;s:14:"shipping/fedex";i:124;s:13:"shipping/flat";i:125;s:13:"shipping/free";i:126;s:13:"shipping/item";i:127;s:23:"shipping/parcelforce_48";i:128;s:15:"shipping/pickup";i:129;s:19:"shipping/royal_mail";i:130;s:12:"shipping/ups";i:131;s:13:"shipping/usps";i:132;s:15:"shipping/weight";i:133;s:11:"tool/backup";i:134;s:14:"tool/error_log";i:135;s:12:"total/coupon";i:136;s:12:"total/credit";i:137;s:14:"total/handling";i:138;s:16:"total/klarna_fee";i:139;s:19:"total/low_order_fee";i:140;s:12:"total/reward";i:141;s:14:"total/shipping";i:142;s:15:"total/sub_total";i:143;s:9:"total/tax";i:144;s:11:"total/total";i:145;s:13:"total/voucher";i:146;s:9:"user/user";i:147;s:20:"user/user_permission";i:148;s:22:"module/pavverticalmenu";i:149;s:19:"module/themecontrol";i:150;s:15:"module/pavdeals";i:151;s:25:"module/pavproductcarousel";i:152;s:13:"module/filter";i:153;s:13:"module/pavmap";i:154;s:14:"module/pavblog";i:155;s:22:"module/pavblogcategory";i:156;s:21:"module/pavblogcomment";i:157;s:20:"module/pavbloglatest";i:158;s:16:"module/pavcustom";i:159;s:18:"module/pavcarousel";i:160;s:17:"module/pavtwitter";i:161;s:21:"module/pavsliderlayer";i:162;s:18:"module/pavmegamenu";i:163;s:16:"module/pavsocial";i:164;s:20:"module/pavnewsletter";i:165;s:18:"module/pavproducts";i:166;s:13:"module/latest";i:167;s:14:"module/special";i:168;s:25:"module/pavproductcarousel";i:169;s:12:"module/store";i:170;s:12:"module/store";i:171;s:16:"module/pavsocial";i:172;s:17:"module/pavtwitter";i:173;s:16:"module/pavcustom";i:174;s:21:"module/pavproducttabs";i:175;s:25:"module/pavproductfeatured";i:176;s:21:"module/pavreassurance";i:177;s:21:"module/pavreassurance";i:178;s:13:"module/pavads";i:179;s:14:"module/special";i:180;s:17:"module/bestseller";i:181;s:20:"module/pavautosearch";i:182;s:20:"module/pavautosearch";i:183;s:15:"module/category";i:184;s:20:"module/pavnewsletter";i:185;s:17:"module/bestseller";i:186;s:22:"module/zopim_live_chat";i:187;s:14:"module/special";i:188;s:15:"module/carousel";i:189;s:14:"module/visitor";i:190;s:19:"feed/google_sitemap";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_verticalmenu`
--

CREATE TABLE IF NOT EXISTS `oc_verticalmenu` (
  `verticalmenu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `type_submenu` varchar(10) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content` text,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  PRIMARY KEY (`verticalmenu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=219 ;

--
-- Dumping data for table `oc_verticalmenu`
--

INSERT INTO `oc_verticalmenu` (`verticalmenu_id`, `widget_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `type_submenu`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `content_text`, `submenu_content`, `level`, `left`, `right`) VALUES
(1, 0, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, -5, 34, 47),
(116, 1, '', 1, 0, NULL, NULL, NULL, '', '121', '1', 'category', 0, 1, 'menu', 0, 1, 0, 1, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0),
(118, 1, '', 1, 0, NULL, NULL, NULL, NULL, '160', '1', 'category', 2, 1, 'menu', 0, 1, 0, 8, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(119, 1, '', 1, 0, NULL, NULL, NULL, NULL, '151', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(120, 1, '', 1, 0, NULL, NULL, NULL, NULL, '161', '1', 'category', 2, 1, 'menu', 0, 1, 0, 7, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(123, 1, '', 1, 0, NULL, NULL, NULL, NULL, '136', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(126, 1, '', 1, 0, NULL, NULL, NULL, NULL, '156', '1', 'category', 2, 1, 'menu', 0, 1, 0, 5, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(127, 1, '', 1, 0, NULL, NULL, NULL, NULL, '147', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(131, 1, '', 1, 0, NULL, NULL, NULL, NULL, '159', '1', 'category', 2, 1, 'menu', 0, 1, 0, 6, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(186, 1, '', 116, 0, NULL, NULL, NULL, '', '133', '1', 'category', 0, 1, 'menu', 0, 1, 0, 12, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0),
(187, 1, '', 116, 0, NULL, NULL, NULL, NULL, '124', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(188, 1, '', 116, 0, NULL, NULL, NULL, NULL, '134', '1', 'category', 2, 1, 'menu', 0, 1, 0, 13, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(189, 1, '', 116, 0, NULL, NULL, NULL, NULL, '125', '1', 'category', 2, 1, 'menu', 0, 1, 0, 7, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(190, 1, '', 116, 0, NULL, NULL, NULL, NULL, '135', '1', 'category', 2, 1, 'menu', 0, 1, 0, 14, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(191, 1, '', 116, 0, NULL, NULL, NULL, NULL, '126', '1', 'category', 2, 1, 'menu', 0, 1, 0, 6, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(192, 1, '', 116, 0, NULL, NULL, NULL, NULL, '127', '1', 'category', 2, 1, 'menu', 0, 1, 0, 8, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(193, 1, '', 116, 0, NULL, NULL, NULL, '', '128', '1', 'category', 0, 1, 'menu', 0, 1, 0, 9, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0),
(194, 1, '', 116, 0, NULL, NULL, NULL, NULL, '129', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(195, 1, '', 116, 0, NULL, NULL, NULL, NULL, '130', '1', 'category', 2, 1, 'menu', 0, 1, 0, 5, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(196, 1, '', 116, 0, NULL, NULL, NULL, NULL, '131', '1', 'category', 2, 1, 'menu', 0, 1, 0, 10, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(197, 1, '', 116, 0, NULL, NULL, NULL, NULL, '122', '1', 'category', 2, 1, 'menu', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(198, 1, '', 116, 0, NULL, NULL, NULL, '', '132', '1', 'category', 0, 1, 'menu', 0, 1, 0, 11, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0),
(199, 1, '', 116, 0, NULL, NULL, NULL, NULL, '123', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(200, 1, '', 123, 0, NULL, NULL, NULL, NULL, '142', '1', 'category', 2, 1, 'menu', 0, 1, 0, 8, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(201, 1, '', 123, 0, NULL, NULL, NULL, NULL, '143', '1', 'category', 2, 1, 'menu', 0, 1, 0, 9, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(202, 1, '', 123, 0, NULL, NULL, NULL, NULL, '144', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(203, 1, '', 123, 0, NULL, NULL, NULL, NULL, '145', '1', 'category', 2, 1, 'menu', 0, 1, 0, 5, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(204, 1, '', 123, 0, NULL, NULL, NULL, NULL, '146', '1', 'category', 2, 1, 'menu', 0, 1, 0, 10, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(205, 1, '', 123, 0, NULL, NULL, NULL, NULL, '137', '1', 'category', 2, 1, 'menu', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(206, 1, '', 123, 0, NULL, NULL, NULL, NULL, '138', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(207, 1, '', 123, 0, NULL, NULL, NULL, NULL, '139', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(208, 1, '', 123, 0, NULL, NULL, NULL, NULL, '140', '1', 'category', 2, 1, 'menu', 0, 1, 0, 7, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(209, 1, '', 123, 0, NULL, NULL, NULL, NULL, '141', '1', 'category', 2, 1, 'menu', 0, 1, 0, 6, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(210, 1, '', 127, 0, NULL, NULL, NULL, NULL, '148', '1', 'category', 2, 1, 'menu', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(211, 1, '', 127, 0, NULL, NULL, NULL, NULL, '149', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(212, 1, '', 127, 0, NULL, NULL, NULL, NULL, '150', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(213, 1, '', 119, 0, NULL, NULL, NULL, NULL, '152', '1', 'category', 2, 1, 'menu', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(214, 1, '', 119, 0, NULL, NULL, NULL, NULL, '153', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(215, 1, '', 119, 0, NULL, NULL, NULL, NULL, '154', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(216, 1, '', 119, 0, NULL, NULL, NULL, NULL, '155', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(217, 1, '', 126, 0, NULL, NULL, NULL, NULL, '157', '1', 'category', 2, 1, 'menu', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0),
(218, 1, '', 126, 0, NULL, NULL, NULL, '', '158', '1', 'category', 0, 1, 'menu', 0, 1, 0, 2, 0, '', NULL, 0, 'top', '', NULL, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_verticalmenu_description`
--

CREATE TABLE IF NOT EXISTS `oc_verticalmenu_description` (
  `verticalmenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`verticalmenu_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_verticalmenu_description`
--

INSERT INTO `oc_verticalmenu_description` (`verticalmenu_id`, `language_id`, `title`, `description`) VALUES
(120, 6, 'Tivi Box Android', ''),
(126, 6, 'Kiểm Soát Vào Ra - Chấm Công', ''),
(123, 6, 'Đầu Ghi Hình Camera', ''),
(119, 6, 'Chuông Cửa Có Hình', ''),
(118, 6, 'Thiết Bị Mạng', ''),
(131, 6, 'Thiết Bị Nhà Thông Minh', ''),
(127, 6, 'Báo Động Chống Trộm', ''),
(188, 6, 'Camera quan sát chuyên dụng', ''),
(187, 6, 'Camera quan sát DAHUA', ''),
(186, 6, 'Camera ngụy trang', ''),
(116, 6, 'Camera quan sát', ''),
(189, 6, 'Camera quan sát  VANTECH', ''),
(190, 6, 'Phụ kiện camera quan sát', ''),
(191, 6, 'Camera quan sát  AVTECH', ''),
(192, 6, 'Camera quan sát SAMTECH', ''),
(193, 6, 'Camera quan sát GLTECH', ''),
(194, 6, 'Camera quan sát KCE', ''),
(195, 6, 'Camera quan sát KBVISION', ''),
(196, 6, 'Camera quan sát QUESTEK', ''),
(197, 6, 'Camera quan sát ICAM', ''),
(198, 6, 'Camera quan sát Wifi không dây', ''),
(199, 6, 'Camera quan sát HIKVISION', ''),
(200, 6, 'Đầu ghi hình SAMTECH', ''),
(201, 6, 'Đầu ghi hình BENCO', ''),
(202, 6, 'Đầu ghi hình KCE', ''),
(203, 6, 'Đầu ghi hình KBVISION', ''),
(204, 6, 'Đầu ghi hình QUESTEK', ''),
(205, 6, 'Đầu ghi hình ICAM', ''),
(206, 6, 'Đầu ghi hình HIKVISION', ''),
(207, 6, 'Đầu ghi hình DAHUA', ''),
(208, 6, 'Đầu ghi hình VANTECH', ''),
(209, 6, 'Đầu ghi hình AVTECH', ''),
(210, 6, 'Báo động SONIC SAFETY', ''),
(211, 6, 'Báo động KARASS', ''),
(212, 6, 'Báo động AMOS', ''),
(213, 6, 'Chuông hình COMMAX', ''),
(214, 6, 'Chuông hình ETE', ''),
(215, 6, 'Chuông hình AIPHONE', ''),
(216, 6, 'Chuông hình HYUNDAI', ''),
(217, 6, 'Máy Chấm Công RONALD JACK', ''),
(218, 6, 'Khóa cửa từ', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_verticalmenu_widgets`
--

CREATE TABLE IF NOT EXISTS `oc_verticalmenu_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_verticalmenu_widgets`
--

INSERT INTO `oc_verticalmenu_widgets` (`id`, `name`, `type`, `params`, `store_id`) VALUES
(1, 'Video Opencart Installation', 'video_code', 'a:1:{s:10:"video_code";s:168:"&lt;iframe width=&quot;300&quot; height=&quot;315&quot; src=&quot;//www.youtube.com/embed/cUhPA5qIxDQ&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;";}', 0),
(2, 'Electronics &amp; Computers', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:1022:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=59&quot;&gt;Computers &amp;amp; Tablets&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=25&quot;&gt;TV &amp;amp; Home Theater&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=59&quot;&gt;Home &amp;amp; Portable Audio&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=29&quot;&gt;Cell Phones &amp;amp; Services&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=28&quot;&gt;Camera &amp;amp; Video&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=20&quot;&gt;Vehicle, GPS &amp;amp; Navigation&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=34&quot;&gt;Musical Instruments&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n";i:2;s:1282:"&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=59&quot;&gt;للإمبراطورية &amp;amp; للإمبراطورية&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=25&quot;&gt;للإمبر &amp;amp; للإمبراطورية في مدن,&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=59&quot;&gt;للإمبراطورية &amp;amp; للإمبراطورية في مدن,&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=29&quot;&gt;للإمبراطورية &amp;amp; للإمبراطورية في مدن,&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=28&quot;&gt;للإمبراطورية &amp;amp; للإمبراطورية في مدن,&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=20&quot;&gt;للإمبراطورية &amp;amp; للإمبراطورية في مدن,&lt;/a&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&lt;a href=&quot;index.php?route=product/category&amp;amp;path=34&quot;&gt;مدن, هذا جديدة المذابح&lt;/a&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;";}}', 0),
(3, 'Products Latest', 'product_list', 'a:4:{s:9:"list_type";s:7:"special";s:5:"limit";s:1:"3";s:11:"image_width";s:3:"161";s:12:"image_height";s:3:"121";}', 0),
(4, 'Products In Cat 20', 'product_category', 'a:4:{s:11:"category_id";s:2:"20";s:5:"limit";s:1:"3";s:11:"image_width";s:3:"161";s:12:"image_height";s:3:"121";}', 0),
(5, 'Manufactures', 'banner', 'a:4:{s:8:"group_id";s:1:"8";s:11:"image_width";s:3:"170";s:12:"image_height";s:2:"58";s:5:"limit";s:2:"16";}', 0),
(6, 'PavoThemes Feed', 'feed', 'a:1:{s:8:"feed_url";s:55:"http://www.pavothemes.com/opencart-themes.feed?type=rss";}', 0),
(7, 'Image Widget  ', 'image', 'a:3:{s:10:"image_path";s:31:"data/demo/sub-vertical-menu.png";s:11:"image_width";s:3:"335";s:12:"image_height";s:3:"180";}', 0),
(8, 'Banner', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:86:"&lt;img src=&quot;image/data/banner/verticalmenu-banner.jpg&quot; alt=&quot;&quot;&gt;";i:2;s:86:"&lt;img src=&quot;image/data/banner/verticalmenu-banner.jpg&quot; alt=&quot;&quot;&gt;";}}', 0),
(9, 'Malesuada', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:525:"&lt;ul&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Phasellus Purus&lt;/a&gt;\r\n  &lt;/li&gt;\r\n   &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Bags &amp; Purses&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Belts&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Gloves&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Jewellery&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Sunglasses&lt;/a&gt;\r\n  &lt;/li&gt;\r\n &lt;/ul&gt;";i:2;s:525:"&lt;ul&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Phasellus Purus&lt;/a&gt;\r\n  &lt;/li&gt;\r\n   &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Bags &amp; Purses&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Belts&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Gloves&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Jewellery&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Sunglasses&lt;/a&gt;\r\n  &lt;/li&gt;\r\n &lt;/ul&gt;";}}', 0),
(10, 'Last Tweets', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:378:"&lt;p&gt;\r\nProin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit.\r\n&lt;/p&gt; \r\n";i:2;s:378:"&lt;p&gt;\r\nProin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit.\r\n&lt;/p&gt; \r\n";}}', 0),
(11, 'Accessories', 'html', 'a:1:{s:4:"html";a:2:{i:1;s:523:"&lt;ul&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Formal Shoes&lt;/a&gt;\r\n  &lt;/li&gt;\r\n   &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Casual Shoes&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Sandals&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Wide Fit&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Bibendum&lt;/a&gt;\r\n  &lt;/li&gt;\r\n &lt;/ul&gt;";i:2;s:523:"&lt;ul&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Formal Shoes&lt;/a&gt;\r\n  &lt;/li&gt;\r\n   &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Casual Shoes&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Sandals&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Wide Fit&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Phasellus leo&lt;/a&gt;\r\n  &lt;/li&gt;\r\n  &lt;li&gt;\r\n    &lt;a href=&quot;#&quot;&gt;Bibendum&lt;/a&gt;\r\n  &lt;/li&gt;\r\n &lt;/ul&gt;";}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(7, 6, 'Birthday'),
(6, 6, 'Christmas'),
(8, 6, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(5, 6, 'Pound ', 'lb'),
(2, 6, 'Gram', 'g'),
(1, 6, 'Kilogram', 'kg'),
(6, 6, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4033 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovar-Bilogora', 'BB', 1),
(848, 53, 'City of Zagreb', 'CZ', 1),
(849, 53, 'Dubrovnik-Neretva', 'DN', 1),
(850, 53, 'Istra', 'IS', 1),
(851, 53, 'Karlovac', 'KA', 1),
(852, 53, 'Koprivnica-Krizevci', 'KK', 1),
(853, 53, 'Krapina-Zagorje', 'KZ', 1),
(854, 53, 'Lika-Senj', 'LS', 1),
(855, 53, 'Medimurje', 'ME', 1),
(856, 53, 'Osijek-Baranja', 'OB', 1),
(857, 53, 'Pozega-Slavonia', 'PS', 1),
(858, 53, 'Primorje-Gorski Kotar', 'PG', 1),
(859, 53, 'Sibenik', 'SI', 1),
(860, 53, 'Sisak-Moslavina', 'SM', 1),
(861, 53, 'Slavonski Brod-Posavina', 'SB', 1),
(862, 53, 'Split-Dalmatia', 'SD', 1),
(863, 53, 'Varazdin', 'VA', 1),
(864, 53, 'Virovitica-Podravina', 'VP', 1),
(865, 53, 'Vukovar-Srijem', 'VS', 1),
(866, 53, 'Zadar-Knin', 'ZK', 1),
(867, 53, 'Zagreb', 'ZA', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan Laani', 'AL', 1),
(1086, 72, 'Etela-Suomen Laani', 'ES', 1),
(1087, 72, 'Ita-Suomen Laani', 'IS', 1),
(1088, 72, 'Lansi-Suomen Laani', 'LS', 1),
(1089, 72, 'Lapin Lanani', 'LA', 1),
(1090, 72, 'Oulun Laani', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1819, 117, 'Aizkraukles Rajons', 'AIZ', 1),
(1820, 117, 'Aluksnes Rajons', 'ALU', 1),
(1821, 117, 'Balvu Rajons', 'BAL', 1),
(1822, 117, 'Bauskas Rajons', 'BAU', 1),
(1823, 117, 'Cesu Rajons', 'CES', 1),
(1824, 117, 'Daugavpils Rajons', 'DGR', 1),
(1825, 117, 'Dobeles Rajons', 'DOB', 1),
(1826, 117, 'Gulbenes Rajons', 'GUL', 1),
(1827, 117, 'Jekabpils Rajons', 'JEK', 1),
(1828, 117, 'Jelgavas Rajons', 'JGR', 1),
(1829, 117, 'Kraslavas Rajons', 'KRA', 1),
(1830, 117, 'Kuldigas Rajons', 'KUL', 1),
(1831, 117, 'Liepajas Rajons', 'LPR', 1),
(1832, 117, 'Limbazu Rajons', 'LIM', 1),
(1833, 117, 'Ludzas Rajons', 'LUD', 1),
(1834, 117, 'Madonas Rajons', 'MAD', 1),
(1835, 117, 'Ogres Rajons', 'OGR', 1),
(1836, 117, 'Preilu Rajons', 'PRE', 1),
(1837, 117, 'Rezeknes Rajons', 'RZR', 1),
(1838, 117, 'Rigas Rajons', 'RGR', 1),
(1839, 117, 'Saldus Rajons', 'SAL', 1),
(1840, 117, 'Talsu Rajons', 'TAL', 1),
(1841, 117, 'Tukuma Rajons', 'TUK', 1),
(1842, 117, 'Valkas Rajons', 'VLK', 1),
(1843, 117, 'Valmieras Rajons', 'VLM', 1),
(1844, 117, 'Ventspils Rajons', 'VSR', 1),
(1845, 117, 'Daugavpils', 'DGV', 1),
(1846, 117, 'Jelgava', 'JGV', 1),
(1847, 117, 'Jurmala', 'JUR', 1),
(1848, 117, 'Liepaja', 'LPK', 1),
(1849, 117, 'Rezekne', 'RZK', 1),
(1850, 117, 'Riga', 'RGA', 1),
(1851, 117, 'Ventspils', 'VSL', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'JO', 1),
(1972, 129, 'Kedah', 'KE', 1),
(1973, 129, 'Kelantan', 'KL', 1),
(1974, 129, 'Labuan', 'LA', 1),
(1975, 129, 'Melaka', 'ME', 1),
(1976, 129, 'Negeri Sembilan', 'NS', 1),
(1977, 129, 'Pahang', 'PA', 1),
(1978, 129, 'Perak', 'PE', 1),
(1979, 129, 'Perlis', 'PR', 1),
(1980, 129, 'Pulau Pinang', 'PP', 1),
(1981, 129, 'Sabah', 'SA', 1),
(1982, 129, 'Sarawak', 'SR', 1),
(1983, 129, 'Selangor', 'SE', 1),
(1984, 129, 'Terengganu', 'TE', 1),
(1985, 129, 'Wilayah Persekutuan', 'WP', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3031, 197, 'Ascension', 'A', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3033, 197, 'Tristan da Cunha', 'T', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakir', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3972, 222, 'Isle of Man', 'IOM', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4019, 243, 'Kosovo', 'KM', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
