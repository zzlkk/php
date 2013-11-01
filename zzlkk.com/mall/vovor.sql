-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013-10-29 14:58:23
-- 服务器版本: 5.1.69
-- PHP 版本: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vovor`
--

-- --------------------------------------------------------

--
-- 表的结构 `bsi_admin`
--

CREATE TABLE IF NOT EXISTS `bsi_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT 'admin',
  `access_id` int(1) NOT NULL DEFAULT '0',
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `bsi_admin`
--

INSERT INTO `bsi_admin` (`id`, `pass`, `username`, `access_id`, `f_name`, `l_name`, `email`, `last_login`, `status`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'admin', 1, '', '', 'admin@mall.zzlkk.com', '2013-10-29 06:34:09', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_adminmenu`
--

CREATE TABLE IF NOT EXISTS `bsi_adminmenu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) DEFAULT NULL,
  `menu_desc` varchar(200) NOT NULL DEFAULT '',
  `parent_id` int(4) DEFAULT '0',
  `status` enum('Y','N') DEFAULT 'Y',
  `ord` int(5) NOT NULL DEFAULT '0',
  `privileges` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kid` (`name`,`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `bsi_adminmenu`
--

INSERT INTO `bsi_adminmenu` (`id`, `name`, `url`, `menu_desc`, `parent_id`, `status`, `ord`, `privileges`) VALUES
(1, '房间管理', '#', '', 0, 'Y', 1, 1),
(2, '价格管理', '#', '', 0, 'Y', 2, 1),
(3, '预定管理', '#', '', 0, 'Y', 3, 1),
(4, '设置', '#', '', 0, 'Y', 6, 1),
(5, '房间列表', 'apartment-list.php', '', 1, 'Y', 1, 1),
(6, '房间设施', 'apartment-facilities.php', '', 1, 'Y', 2, 1),
(7, '房间图片', 'apartment-gallery.php', '', 1, 'Y', 3, 1),
(8, '房间类型', 'apartment-types.php', '', 1, 'Y', 4, 1),
(9, '价格计划', 'priceplan.php', '', 2, 'Y', 1, 1),
(10, '预定列表', 'booking-list.php', '', 3, 'Y', 1, 1),
(11, '客户查询', 'customer-lookup.php', '', 3, 'Y', 2, 1),
(12, 'Apartment Blocking', 'apartment-blocking.php', '', 3, 'Y', 3, 1),
(13, '全局设置', 'global-setting.php', '', 4, 'Y', 1, 1),
(14, '支付方式', 'payment-gateway.php', '', 4, 'Y', 2, 1),
(15, '邮件内容', 'email-contents.php', '', 4, 'Y', 3, 1),
(16, '内容管理', '#', '', 0, 'Y', 4, 1),
(17, '菜单&内容', 'content-list.php', '', 16, 'Y', 1, 1),
(18, '日历视图', 'calendar-view.php', '', 3, 'Y', 4, 1),
(19, '房间预定类型', 'apartment-bookingtype.php', '', 4, 'Y', 4, 1),
(20, '客户列表', 'property_owner_list.php', '', 1, 'Y', 6, 1),
(21, '模块', '#', '', 0, 'Y', 5, 1),
(22, '模块管理', 'module_manager.php', '', 21, 'Y', 1, 1),
(23, '地理位置类型', 'location-types.php', '', 1, 'Y', 5, 1),
(24, '房间特色', 'feature-keys.php', '', 1, 'Y', 2, 1),
(25, '系统消息', 'message-list.php', '', 16, 'Y', 2, 1),
(26, '区域与地理位置关系', 'district-loc.php', '', 1, 'Y', 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_all_facilities`
--

CREATE TABLE IF NOT EXISTS `bsi_all_facilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facilities` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `bsi_all_facilities`
--

INSERT INTO `bsi_all_facilities` (`id`, `facilities`) VALUES
(1, '体感娱乐'),
(2, '健身器材');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_apartment_master`
--

CREATE TABLE IF NOT EXISTS `bsi_apartment_master` (
  `appmt_id` int(11) NOT NULL AUTO_INCREMENT,
  `appmt_type_id` int(11) NOT NULL,
  `appmt_name` varchar(255) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `addr2` varchar(255) NOT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `locationType` varchar(255) DEFAULT NULL,
  `locationTypeArray` varchar(2000) DEFAULT NULL,
  `short_desc` text NOT NULL,
  `long_desc` longtext NOT NULL,
  `default_img` varchar(100) NOT NULL,
  `apart_floor_img` varchar(100) NOT NULL,
  `features` text,
  `lat` varchar(50) NOT NULL DEFAULT '29.509218',
  `longitude` varchar(50) NOT NULL DEFAULT '106.513523',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`appmt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `bsi_apartment_master`
--

INSERT INTO `bsi_apartment_master` (`appmt_id`, `appmt_type_id`, `appmt_name`, `addr1`, `addr2`, `district`, `city`, `state`, `country`, `zipcode`, `phone`, `street`, `locationType`, `locationTypeArray`, `short_desc`, `long_desc`, `default_img`, `apart_floor_img`, `features`, `lat`, `longitude`, `status`) VALUES
(1, 3, '杨家坪步行街套间 188元', '杨家坪', '', '九龙坡区', '重庆', '重庆', '中国', '', '4008006320', '杨家坪步行街', '', '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"1号线","1":"2号线"}}]', '杨家坪步行街套间 188元，购物 出行 便捷享受。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	杨家坪步行街套间 188元，购物 出行 便捷享受。</p>\r\n<p>\r\n	<br />\r\n	<img alt="" src="/gallery/ApartImage/1381310218_room%205.jpg" /></p>\r\n', '1382332128_20080529_98506ecec275c1d587ffw2EeMDI8YaTS.jpg', '1381310219_ping.jpg', '{"户型":"三室一厅","房间大小":"100㎡","是否与主人同住":"否","是否有床":"","楼层":"12"}', '29.535871', '106.510046', 1),
(2, 1, '解放碑温馨双人间 148元', '渝中区', '', '南岸区', '重庆', '重庆', '中国', '', '4008006320', '解放碑商圈', '公交周围', '[]', '解放碑温馨双人间 148元，旅游 购物，便捷出行。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	解放碑温馨双人间 148元，旅游 购物，便捷出行。</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<img alt="" src="/gallery/ApartImage/1381310358_room%207.jpg" /></p>\r\n', '1381310358_room 7.jpg', '1381310358_ping.jpg', '{"户型":"","房间大小":"","是否与主人同住":""}', '29.53631', '106.506273', 1),
(3, 2, '高升桥商圈双人间 188元', '高升桥', '', '金牛区', '成都', '四川', '中国', '', '4008006320', '二环路南四段', NULL, '[]', '高升桥商圈双人间 188元，休闲 养生，度假最佳之选。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	高升桥商圈双人间 188元，休闲 养生，度假最佳之选。</p>\r\n<p>\r\n	<img alt="" src="/gallery/ApartImage/1381310532_room%209.jpg" /></p>\r\n', '1381310532_room 9.jpg', '1381310532_ping.jpg', '{"户型":"","房间大小":"","是否与主人同住":""}', '29.533294', '106.555285', 1),
(4, 1, '杨家坪商圈经济舒适间 99元', '重庆市杨家坪', '', NULL, '重庆', '重庆杨家坪', '中国', '400000', '4008006320', '重庆', NULL, '公交周围,地铁周围', '杨家坪商圈经济舒适间99元，价格实惠，出行方便，娱乐丰富。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	杨家坪商圈经济舒适间99元，价格实惠，出行方便，娱乐丰富。</p>\r\n<p>\r\n	<img alt="" src="/gallery/ApartImage/1381309320_room%201.jpg" /></p>\r\n', '1381309320_room 1.jpg', '1381309320_ping.jpg', '', '29.509218', '106.513523', 1),
(5, 3, '杨家坪商圈豪华套间 199元', '杨家坪', '', NULL, '重庆', '重庆', '中国', '400000', '4008006320', '重庆', NULL, '公交周围,地铁周围', '杨家坪商圈豪华套间 199元，尊贵享受，贴心服务。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;杨家坪商圈豪华套间 199元，尊贵享受，贴心服务。<br />\r\n	<img alt="" src="/gallery/ApartImage/1381309716_room%203.jpg" /></p>\r\n', '1381309716_room 3.jpg', '1381309716_ping.jpg', '', '29.509218', '106.513523', 1),
(6, 2, '杨家坪商圈温馨双人间 149元', '杨家坪', '', NULL, '重庆', '重庆', '中国', '400000', '4008006320', '重庆', NULL, '公交周围,地铁周围', '杨家坪商圈温馨双人间 149元，浓情浪漫，便捷出行。', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;杨家坪商圈温馨双人间 149元，浓情浪漫，便捷出行。</p>\r\n<p>\r\n	<img alt="" src="/gallery/ApartImage/1381309507_room%202.jpg" /></p>\r\n', '1381309507_room 2.jpg', '1381309507_ping.jpg', '{"户型":"二室一厅","房间大小":"","是否与主人同住":""}', '29.509218', '106.513523', 1),
(7, 4, '杨家坪商圈贵宾套间 299元', '杨家坪', '', '南岸区', '重庆', '重庆', '中国', '400000', '4008006320', '重庆', NULL, '公交周围,地铁周围', '杨家坪商圈贵宾套间 299元，尊贵享受，宾至如归！', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	杨家坪商圈贵宾套间 299元，尊贵享受，宾至如归！</p>\r\n<p>\r\n	<img alt="" src="/gallery/ApartImage/1381309966_room%204.jpg" /></p>\r\n', '1381309966_room 4.jpg', '1381309966_ping.jpg', '{"户型":"","房间大小":"","是否与主人同住":""}', '', '', 1),
(11, 2, '好房子', '重庆市南岸区亚太路亚太商谷1栋13-8', '重庆市南岸区亚太路亚太商谷1栋', '南岸区', '重庆市', '重庆', '中国', '400060', '4008006320', '重庆市南岸区亚太路亚太商谷1栋13-8', NULL, '[]', '安逸得很的房子！', '', '1381627495_6.jpg', '', '{"户型":"","房间大小":"","是否与主人同住":""}', '29.512529', '106.579431', 1),
(12, 1, '商圈江景房', '重庆市南岸区亚太路亚太商谷1栋13-8', '', NULL, '重庆市', '重庆', '', '', '', '重庆市南岸区亚太路亚太商谷1栋13-8', NULL, '公交周围,地铁周围', '地理位置方便', '', '1381627229_2.jpg', '', '{"户型":"单间配套","房间大小":"80","是否与主人同住":"否"}', '', '', 1),
(13, 1, '温馨洋房1200', '重庆市渝北区', '', NULL, '重庆', '重庆', '', '', '', '红旗河沟', NULL, '地铁周围', '发达省份试点', '<p>\r\n	反对撒撒旦发射点发</p>\r\n', '', '', '{"户型":"123232","房间大小":"132123","是否与主人同住":"312312312"}', '', '', 1),
(14, 1, '精装小户', '重庆市渝北区', '', NULL, '重庆', '重庆', '', '', '', '慧心大厦', NULL, '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"1号线","1":"2号线"}},{"parent":"高校周围","child":{"0":"重庆大学"}}]', '精装小户', '<p>\r\n	精装小户</p>\r\n', '', '', '{"户型":"4324","房间大小":"234234","是否与主人同住":"234423"}', '29.558526173207785', '106.52446746826172', 1),
(15, 1, '豪华套房', '重庆市渝北区', '', NULL, '重庆', '重庆', '', '', '', '中央公园', NULL, '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"1号线"}},{"parent":"高校周围","child":{"0":"重庆大学"}}]', '豪华套房', '<p>\r\n	豪华套房</p>\r\n', '', '', '{"户型":"三室一厅","房间大小":"500平方","是否与主人同住":"否"}', '29.772125846370546', '105.73104858398438', 1),
(16, 1, '金装房屋', '重庆市沙坪坝沙中路电力小区', '', '沙坪坝', '重庆', '重庆', '中国', '', '4008006320', '沙中路', NULL, '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"1号线","1":"2号线","2":"3号线"}},{"parent":"高校周围","child":{"0":"重庆大学"}}]', '房子不错哦\r\n', '<p>\r\n	gallery/ApartImage/1381309716_room 3.jpg<span _fck_bookmark="1" style="display: none;">&nbsp;</span></p>\r\n', '1382671954_3595098_143447848766_2.jpg', '1382671954_3595098_143447848766_2.jpg', '{"户型":"双人","房间大小":"70","是否与主人同住":"否","是否有床":"有","楼层":"10"}', '11', '11', 1),
(17, 1, '靠近南坪车站50元', '南坪响水路苏宁电器楼上', '', NULL, '重庆', '重庆', '', '', '', '重庆市南坪响水路8号', NULL, '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"3号线"}},{"parent":"高校周围","child":{}}]', '交通便利，整洁卫生', '', '1382968279_dresden.png', '', '{"户型":"单间配套","房间大小":"30","是否与主人同住":"是","是否有床":"有","楼层":"9"}', '29.52624689385778', '106.5708415210247', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_apartment_type`
--

CREATE TABLE IF NOT EXISTS `bsi_apartment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appartment_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `bsi_apartment_type`
--

INSERT INTO `bsi_apartment_type` (`id`, `appartment_type`) VALUES
(1, '标准房间'),
(2, '双人套间'),
(3, '豪华套间'),
(4, '贵宾套间'),
(5, '总统套间');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_appmt_facilities`
--

CREATE TABLE IF NOT EXISTS `bsi_appmt_facilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appmt_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=140 ;

--
-- 转存表中的数据 `bsi_appmt_facilities`
--

INSERT INTO `bsi_appmt_facilities` (`id`, `appmt_id`, `facility_id`) VALUES
(133, 1, 2),
(132, 1, 1),
(125, 2, 2),
(124, 2, 1),
(127, 3, 2),
(126, 3, 1),
(7, 4, 1),
(8, 4, 2),
(9, 5, 1),
(10, 5, 2),
(41, 6, 2),
(40, 6, 1),
(49, 7, 2),
(48, 7, 1),
(111, 11, 2),
(110, 11, 1),
(47, 12, 2),
(46, 12, 1),
(52, 13, 1),
(53, 13, 2),
(120, 14, 1),
(121, 15, 1),
(135, 16, 2),
(134, 16, 1),
(139, 17, 2),
(138, 17, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_appmt_features`
--

CREATE TABLE IF NOT EXISTS `bsi_appmt_features` (
  `appmt_id` int(11) NOT NULL,
  `appmt_size` varchar(50) NOT NULL DEFAULT '',
  `apptmt_lot_size` varchar(50) NOT NULL DEFAULT '',
  `bedroom` int(11) NOT NULL DEFAULT '0',
  `bathroom` int(11) NOT NULL DEFAULT '0',
  `car_garage` int(11) NOT NULL DEFAULT '0',
  `garage_size` varchar(50) NOT NULL DEFAULT '',
  `total_rooms` int(11) NOT NULL DEFAULT '0',
  `basement` varchar(255) NOT NULL DEFAULT '',
  `floors` int(11) NOT NULL DEFAULT '0',
  `year_of_build` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bsi_appmt_features`
--

INSERT INTO `bsi_appmt_features` (`appmt_id`, `appmt_size`, `apptmt_lot_size`, `bedroom`, `bathroom`, `car_garage`, `garage_size`, `total_rooms`, `basement`, `floors`, `year_of_build`) VALUES
(1, '', '', 0, 0, 0, '', 0, '', 0, 0),
(4, '55', '3', 2, 0, 1, '1', 3, '1', 2, 2012),
(5, '1', '121', 1, 1, 1, '1', 1, '12', 1, 1),
(6, '1', '1', 1, 1, 1, '1', 1, '1', 1, 1),
(7, '1', '1', 1, 1, 1, '1', 1, '1', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_appmt_gallery`
--

CREATE TABLE IF NOT EXISTS `bsi_appmt_gallery` (
  `gallery_id` int(11) NOT NULL AUTO_INCREMENT,
  `appmt_id` int(11) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `bsi_appmt_gallery`
--

INSERT INTO `bsi_appmt_gallery` (`gallery_id`, `appmt_id`, `img_path`) VALUES
(1, 1, '1382332312_1b02e50q11711d.5402be.jpg'),
(2, 1, '1382332312_20080529_98506ecec275c1d587ffw2EeMDI8YaTS.jpg'),
(3, 1, '1382332312_2006110203441213452[1].jpg'),
(4, 1, '1382332312_jimi012[1].jpg'),
(5, 1, '1382332312_Jingxuan218[1].jpg'),
(6, 1, '1382332360_Chahua01[1].jpg'),
(7, 1, '1382332360_ubuntuwall.jpg'),
(8, 1, '1382332360_Chahua09[1].jpg'),
(9, 1, '1382332360_Jingxuan24[1].jpg');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_appmt_user`
--

CREATE TABLE IF NOT EXISTS `bsi_appmt_user` (
  `appmt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`appmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bsi_appmt_user`
--

INSERT INTO `bsi_appmt_user` (`appmt_id`, `user_id`) VALUES
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(11, 7),
(12, 8),
(13, 9),
(14, 11),
(15, 11),
(17, 7);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_bookings`
--

CREATE TABLE IF NOT EXISTS `bsi_bookings` (
  `booking_id` int(10) NOT NULL,
  `appmt_id` int(11) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checkin_date` date NOT NULL DEFAULT '0000-00-00',
  `checkout_date` date NOT NULL DEFAULT '0000-00-00',
  `client_id` int(11) unsigned DEFAULT NULL,
  `total_cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(255) NOT NULL,
  `payment_success` tinyint(1) NOT NULL DEFAULT '0',
  `payment_txnid` varchar(100) DEFAULT NULL,
  `paypal_email` varchar(500) DEFAULT NULL,
  `special_id` int(10) unsigned NOT NULL DEFAULT '0',
  `special_requests` text,
  `is_apply` tinyint(4) NOT NULL,
  `is_block` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `block_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `start_date` (`checkin_date`),
  KEY `end_date` (`checkout_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bsi_bookings`
--

INSERT INTO `bsi_bookings` (`booking_id`, `appmt_id`, `booking_time`, `checkin_date`, `checkout_date`, `client_id`, `total_cost`, `payment_amount`, `payment_type`, `payment_success`, `payment_txnid`, `paypal_email`, `special_id`, `special_requests`, `is_apply`, `is_block`, `is_deleted`, `block_name`) VALUES
(1380891419, 1, '2013-10-04 12:56:59', '2013-10-04', '2013-10-05', 2, '99.00', '99.00', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1381198894, 3, '2013-10-08 02:21:34', '2013-10-09', '2013-10-10', 1, '80.00', '16.00', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1381219206, 1, '2013-10-08 08:52:03', '2013-10-09', '2013-10-10', 1, '99.00', '0.01', 'ap', 1, '2013100802088826', '550753607@qq.com', 0, NULL, 0, 0, 1, NULL),
(1381220920, 2, '2013-10-08 08:30:00', '2013-10-09', '2013-10-10', 1, '30.00', '0.01', 'ap', 1, '2013100802168626', '550753607@qq.com', 0, NULL, 0, 0, 0, NULL),
(1381222386, 1, '2013-10-08 08:59:18', '2013-10-09', '2013-10-10', 1, '99.00', '0.01', 'ap', 1, '2013100802250226', '550753607@qq.com', 0, NULL, 0, 0, 0, NULL),
(1381657429, 2, '2013-10-21 05:27:23', '2013-10-13', '2013-10-14', 5, '30.00', '0.01', 'ap', 1, '2013101313404395', 'mr_chenqing@126.com', 0, NULL, 1, 0, 0, NULL),
(1382067327, 11, '2013-10-18 03:35:27', '2013-10-18', '2013-10-19', 1, '78.00', '78.00', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382069218, 1, '2013-10-18 04:06:58', '2013-10-18', '2013-10-19', 1, '99.00', '0.01', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382071573, 1, '2013-10-18 04:46:13', '2013-10-18', '2013-10-19', 1, '99.00', '0.01', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382072342, 1, '2013-10-18 04:59:02', '2013-11-13', '2013-11-14', 1, '99.00', '0.01', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382074913, 1, '2013-10-18 05:41:53', '2013-10-19', '2013-10-20', 14, '99.00', '0.01', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382432839, 5, '2013-10-22 09:07:19', '2013-10-23', '2013-10-24', 1, '199.00', '199.00', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382693179, 1, '2013-10-25 09:26:19', '2013-11-21', '2013-11-22', 1, '99.00', '0.01', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382693313, 1, '2013-10-25 09:28:33', '2013-11-27', '2013-11-30', 1, '297.00', '0.03', 'poa', 1, NULL, NULL, 0, NULL, 0, 0, 0, NULL),
(1382955517, 11, '2013-10-28 10:21:15', '2013-10-30', '2013-10-31', 17, '78.00', '78.00', 'poa', 1, NULL, NULL, 0, NULL, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_clients`
--

CREATE TABLE IF NOT EXISTS `bsi_clients` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  `street_addr` text,
  `street_addr2` text NOT NULL,
  `city` varchar(64) DEFAULT NULL,
  `province` varchar(128) DEFAULT NULL,
  `zip` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `bsi_clients`
--

INSERT INTO `bsi_clients` (`client_id`, `first_name`, `surname`, `title`, `street_addr`, `street_addr2`, `city`, `province`, `zip`, `country`, `phone`, `email`, `password`, `user_type`, `ip`) VALUES
(1, '', '徐鹏', '', '', '', '', '', '', '', '18084030059', '750908472@qq.com', '', 1, '113.249.151.127'),
(2, 'kk', 'kk', 'Mr', 'kk', 'kk', 'kk', 'kk', '44', 'kk', '44', 'kk@zzlkk.com', '', 1, '183.69.205.88'),
(3, '2312', '13', 'Mr', '123', '123', '321', '123', '213', '231', '13', '231@qq.com', '', 1, '113.249.131.94'),
(4, '商户一号', '一号', NULL, '重庆市杨家坪', '', '重庆', '重庆', '400000', '中国', '18084030059', '381814048@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '113.249.131.94'),
(5, '', '陈庆', '', '', '', '', '', '', '', '15023782548', '1076691256@qq.com', '', 1, '120.128.2.6'),
(6, '', '阳作杰', '', '', '', '', '', '', '', '18084030058', '523375883@qq.com', '', 1, '125.85.128.105'),
(7, 'qing', 'chen', NULL, '重庆市南岸区亚太路亚太商谷1栋', '重庆市南岸区亚太路亚太商谷1栋', '重庆市', '重庆', '400060', '中国', '02367878952', '2@qq.com', '708a9c84b47404c5524405e5cbd910b8', 2, '222.161.199.168'),
(8, ' ', 'andy', NULL, '重庆市南岸区亚太路亚太商谷1栋13-8', ' ', '重庆市', '重庆', ' ', ' ', '15023782548', '1076691256@qq.com', '708a9c84b47404c5524405e5cbd910b8', 2, ''),
(9, ' ', '徐鹏', NULL, ' ', ' ', ' ', ' ', ' ', ' ', '18084030059', '523375882@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2, ''),
(10, '', '徐鹏', '', '', '', '', '', '', '', '18084030059', '523375887@qq.com', '', 1, '125.85.137.106'),
(11, ' ', '徐鹏', NULL, ' ', ' ', ' ', ' ', ' ', ' ', '18084030059', '523375883@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2, ''),
(12, '', 'kk', '', '', '', '', '', '', '', '156212', 'test3@zzlkk.com', '', 1, '125.85.137.106'),
(13, '', '1q', '', '', '', '', '', '', '', '156212', '137430723@qq.com', '', 1, '125.85.137.106'),
(14, '', '11', '', '', '', '', '', '', '', '151', '312310723@qq.com', '', 1, '125.85.137.106'),
(15, '', '刘春', '', '', '', '', '', '', '', '15998933333', '22222@qq.com', '', 1, '113.249.151.127'),
(16, '', 'liuchun', '', '', '', '', '', '', '', '111123456566', '381494501@qq.com', '', 1, '113.249.132.213'),
(17, '', '橙子', '', '', '', '', '', '', '', '15023782548', '775165500@qq.com', '', 1, '125.85.118.166');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_configure`
--

CREATE TABLE IF NOT EXISTS `bsi_configure` (
  `conf_id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(100) NOT NULL,
  `conf_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`conf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='bsi hotel configurations' AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `bsi_configure`
--

INSERT INTO `bsi_configure` (`conf_id`, `conf_key`, `conf_value`) VALUES
(1, 'conf_apartment_name', '房间租赁系统'),
(2, 'conf_apartment_streetaddr', '杨家坪 跃华新都 13-7'),
(3, 'conf_apartment_city', '重庆市'),
(4, 'conf_apartment_state', '重庆市'),
(5, 'conf_apartment_country', '中国'),
(6, 'conf_apartment_zipcode', '400000'),
(7, 'conf_apartment_phone', '023-68494107'),
(8, 'conf_apartment_fax', ''),
(9, 'conf_apartment_email', '523375883@qq.com'),
(13, 'conf_currency_symbol', '￥'),
(14, 'conf_currency_code', '元'),
(20, 'conf_tax_amount', '0.0'),
(21, 'conf_dateformat', 'yy-mm-dd'),
(22, 'conf_booking_exptime', '2000'),
(24, 'conf_enabled_discount', '0'),
(25, 'conf_enabled_deposit', '1'),
(26, 'conf_apartment_timezone', 'Asia/Chongqing'),
(27, 'conf_booking_turn_off', '0'),
(28, 'conf_minimum_stay', '1'),
(29, 'conf_server_os', ''),
(30, 'conf_notification_email', '523375883@qq.com'),
(34, 'conf_bookingid_prefix', ''),
(35, 'conf_advance_payment', ''),
(38, 'conf_rental_type', '1'),
(39, 'conf_week_checkin_day', '1'),
(40, 'conf_maximum_stay', '350'),
(41, 'conf_apppmt_listing_type', '0'),
(42, 'conf_appmt_listing_price', '30'),
(43, 'conf_appmt_auto_approve', '1'),
(44, 'conf_appmt_allow_listing', '1'),
(45, 'conf_mesurment_unit', '㎡(平米)'),
(46, 'conf_property_submission', '1');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_district_type`
--

CREATE TABLE IF NOT EXISTS `bsi_district_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  `district` varchar(255) NOT NULL,
  `locationType` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `bsi_district_type`
--

INSERT INTO `bsi_district_type` (`id`, `city`, `district`, `locationType`) VALUES
(11, '重庆', '九龙坡区', '[{"parent":"景区周围","child":{"0":"动物园"}},{"parent":"地铁周围","child":{"0":"1号线","1":"2号线","2":"3号线"}},{"parent":"高校周围","child":{"0":"重庆大学"}}]'),
(13, '重庆', '南岸区', '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"3号线"}},{"parent":"高校周围","child":{}}]'),
(12, '成都', '金牛区', '[{"parent":"景区周围","child":{}},{"parent":"地铁周围","child":{"0":"1号线"}}]'),
(14, '重庆', '九龙坡区', '[{"parent":"地铁周围","child":{"0":"1号线","1":"2号线"}},{"parent":"高校周围","child":{"0":"重庆大学"}}]');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_email_contents`
--

CREATE TABLE IF NOT EXISTS `bsi_email_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_name` varchar(500) NOT NULL,
  `email_subject` varchar(500) NOT NULL,
  `email_text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `bsi_email_contents`
--

INSERT INTO `bsi_email_contents` (`id`, `email_name`, `email_subject`, `email_text`) VALUES
(1, 'Confirmation Email', 'Confirmation of your successfull booking for that Apartment.', 'Text can be chnage in admin Panel.'),
(2, 'Cancellation Email ', 'Cancellation Email subject.', 'Text Can be changed from admin panel');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_features_key`
--

CREATE TABLE IF NOT EXISTS `bsi_features_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feature_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `bsi_features_key`
--

INSERT INTO `bsi_features_key` (`id`, `feature_key`) VALUES
(1, '户型'),
(2, '房间大小'),
(4, '是否与主人同住'),
(5, '是否有床'),
(6, '楼层');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_invoice`
--

CREATE TABLE IF NOT EXISTS `bsi_invoice` (
  `booking_id` int(10) NOT NULL,
  `client_name` varchar(500) NOT NULL,
  `client_email` varchar(500) NOT NULL,
  `invoice` longtext NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bsi_invoice`
--

INSERT INTO `bsi_invoice` (`booking_id`, `client_name`, `client_email`, `invoice`) VALUES
(1380891419, 'Mr kk kk', 'kk@zzlkk.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1380891419</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr kk kk</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/04/2013</td><td align="center" style="background:#ffffff;">10/05/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">13074</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">100.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1381198894, 'Mr fda fdsaf', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381198894</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr fda fdsaf</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">1567</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">成都高升桥 成都</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥80.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">20.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥16.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1381201244, 'Mr fdas afds', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381201244</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr fdas afds</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">1434</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市渝北区 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥30.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">20.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥6.00</td></tr></tbody></table>'),
(1381201303, 'Mr sfadf fads', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381201303</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr sfadf fads</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">13074</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">100.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr></tbody></table>'),
(1381201504, 'Mr afdf afds', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381201504</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr afdf afds</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">1434</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市渝北区 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥30.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">20.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥6.00</td></tr></tbody></table>'),
(1381201574, 'Mr 2312 123213', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381201574</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">Mr 2312 123213</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\r\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">13074</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">100.00% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr></tbody></table>'),
(1381219206, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381219206</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">13074</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br><br><table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; bgcolor:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Option</td><td align="left" style="background:#ffffff">PayPal</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payer E-Mail</td><td align="left" style="background:#ffffff">550753607@qq.com</td></tr><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Transaction ID</td><td align="left" style="background:#ffffff">2013100802088826</td></tr></table>'),
(1381220920, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381220920</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">1434</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市渝北区 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥30.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.02% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br><br><table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; bgcolor:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Option</td><td align="left" style="background:#ffffff">PayPal</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payer E-Mail</td><td align="left" style="background:#ffffff">550753607@qq.com</td></tr><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Transaction ID</td><td align="left" style="background:#ffffff">2013100802168626</td></tr></table>'),
(1381222386, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381222386</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total Night(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">10/09/2013</td><td align="center" style="background:#ffffff;">10/10/2013</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">13074</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br><br><table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; bgcolor:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Option</td><td align="left" style="background:#ffffff">PayPal</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payer E-Mail</td><td align="left" style="background:#ffffff">550753607@qq.com</td></tr><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Transaction ID</td><td align="left" style="background:#ffffff">2013100802250226</td></tr></table>'),
(1381657429, '  陈庆', '1076691256@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1381657429</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  陈庆</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-13</td><td align="center" style="background:#ffffff;">2013-10-14</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">解放碑温馨双人间 148元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">渝中区 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥30.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.02% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br><br><table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; bgcolor:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payment Option</td><td align="left" style="background:#ffffff">PayPal</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Payer E-Mail</td><td align="left" style="background:#ffffff">mr_chenqing@126.com</td></tr><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#ffffff">Transaction ID</td><td align="left" style="background:#ffffff">2013101313404395</td></tr></table>'),
(1382067327, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382067327</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-18</td><td align="center" style="background:#ffffff;">2013-10-19</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">好房子</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市南岸区亚太路亚太商谷1栋13-8 重庆市</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥78.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382069218, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382069218</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-20</td><td align="center" style="background:#ffffff;">2013-10-21</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382071573, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382071573</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-24</td><td align="center" style="background:#ffffff;">2013-10-25</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382072342, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382072342</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-11-13</td><td align="center" style="background:#ffffff;">2013-11-14</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382074913, '  11', '312310723@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382074913</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  11</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-19</td><td align="center" style="background:#ffffff;">2013-10-20</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382432839, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382432839</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-23</td><td align="center" style="background:#ffffff;">2013-10-24</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪商圈豪华套间 199元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥199.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">Manual</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>');
INSERT INTO `bsi_invoice` (`booking_id`, `client_name`, `client_email`, `invoice`) VALUES
(1382693179, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382693179</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-11-21</td><td align="center" style="background:#ffffff;">2013-11-22</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥99.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.01</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">线下支付</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382693313, '  徐鹏', '750908472@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382693313</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  徐鹏</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-11-27</td><td align="center" style="background:#ffffff;">2013-11-30</td><td align="center" style="background:#ffffff;">3</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪步行街套间 188元</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">杨家坪 重庆</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥297.00</td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Advance Payment Amount(<span style="font-size: 10px;">0.01% of Grand Total</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥0.03</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">线下支付</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1382955517, '  橙子', '775165500@qq.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="3" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Booking Details</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Booking Number</td><td align="left" style="background:#ffffff;" colspan="3">1382955517</td></tr>\n		<tr><td align="left" style="background:#ffffff;">Customer Name</td><td align="left" style="background:#ffffff;" colspan="3">  橙子</td></tr>	\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check In Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Check Out Date</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total 天(s)</td></tr>\n		<tr><td align="center" style="background:#ffffff;">2013-10-30</td><td align="center" style="background:#ffffff;">2013-10-31</td><td align="center" style="background:#ffffff;">1</td></tr>\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3">&nbsp;</td></tr>\n		<tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee; width:30%">Apartment Name</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">好房子</td></tr><tr><td align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Apartment Address</td><td colspan="2" align="" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">重庆市南岸区亚太路亚太商谷1栋13-8 重庆市</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="3"></td></tr><tr><td colspan="2" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">￥78.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Payment Details</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">Payment Options</td><td align="left" style="background:#ffffff;">线下支付</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">Transaction Id</td><td align="left" style="background:#ffffff;">NA</td></tr></table>');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_location_type`
--

CREATE TABLE IF NOT EXISTS `bsi_location_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location_type` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `bsi_location_type`
--

INSERT INTO `bsi_location_type` (`id`, `location_type`, `parent_id`) VALUES
(1, '景区周围', 0),
(2, '地铁周围', 0),
(5, '1号线', 2),
(6, '2号线', 2),
(7, '3号线', 2),
(8, '高校周围', 0),
(9, '重庆大学', 8),
(10, '动物园', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_message`
--

CREATE TABLE IF NOT EXISTS `bsi_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `bsi_message`
--

INSERT INTO `bsi_message` (`id`, `title`, `content`) VALUES
(3, '测试标题', '大幅度反弹'),
(2, '测试标题2', '发达省份试点的方式的'),
(4, '您的预定', '您预定的房间还没有付款');

-- --------------------------------------------------------

--
-- 表的结构 `bsi_payment_gateway`
--

CREATE TABLE IF NOT EXISTS `bsi_payment_gateway` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(255) NOT NULL,
  `gateway_code` varchar(50) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `partner` varchar(50) DEFAULT NULL,
  `geteway_key` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ord` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `bsi_payment_gateway`
--

INSERT INTO `bsi_payment_gateway` (`id`, `gateway_name`, `gateway_code`, `account`, `partner`, `geteway_key`, `enabled`, `ord`) VALUES
(4, 'PayPal', 'pp', 'hafijulkhan@gmail.com', NULL, NULL, 1, 2),
(7, '线下支付', 'poa', NULL, NULL, NULL, 1, 3),
(8, '在线支付', 'ap', NULL, '43444444434343', '42343434343', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_priceplan`
--

CREATE TABLE IF NOT EXISTS `bsi_priceplan` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `appmt_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stay_from` int(11) NOT NULL,
  `stay_to` int(11) NOT NULL,
  `deposit_percent` decimal(10,2) NOT NULL,
  `default_pp` tinyint(1) NOT NULL,
  PRIMARY KEY (`pp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `bsi_priceplan`
--

INSERT INTO `bsi_priceplan` (`pp_id`, `appmt_id`, `price`, `stay_from`, `stay_to`, `deposit_percent`, `default_pp`) VALUES
(1, 1, '148.00', 0, 0, '100.00', 1),
(2, 1, '99.00', 1, 9, '0.01', 0),
(3, 0, '0.00', 0, 0, '0.00', 1),
(4, 0, '0.00', 0, 0, '0.00', 1),
(5, 0, '0.00', 0, 0, '0.00', 1),
(6, 0, '0.00', 0, 0, '0.00', 1),
(7, 0, '0.00', 0, 0, '0.00', 1),
(8, 2, '50.00', 0, 0, '10.00', 1),
(9, 2, '30.00', 1, 5, '0.02', 0),
(10, 3, '70.00', 0, 0, '20.00', 1),
(11, 3, '80.00', 1, 5, '20.00', 0),
(12, 4, '99.00', 0, 0, '0.00', 1),
(13, 5, '199.00', 0, 0, '0.00', 1),
(14, 6, '149.00', 0, 0, '0.00', 1),
(15, 7, '299.00', 0, 0, '0.00', 1),
(19, 11, '78.00', 0, 0, '0.00', 1),
(20, 12, '50.00', 0, 0, '0.00', 1),
(21, 5, '150.00', 3, 7, '0.00', 0),
(22, 13, '500.00', 0, 0, '0.00', 1),
(23, 14, '60.00', 0, 0, '0.00', 1),
(24, 15, '200.00', 0, 0, '0.00', 1),
(25, 16, '0.00', 0, 0, '0.00', 1),
(26, 17, '50.00', 0, 0, '0.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bsi_site_contents`
--

CREATE TABLE IF NOT EXISTS `bsi_site_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cont_title` varchar(255) NOT NULL DEFAULT '',
  `contents` mediumtext,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '0',
  `ord` int(11) DEFAULT '0',
  `content_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cont_title` (`cont_title`,`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `bsi_site_contents`
--

INSERT INTO `bsi_site_contents` (`id`, `cont_title`, `contents`, `status`, `url`, `parent_id`, `ord`, `content_type`) VALUES
(2, '关于我们', '<p>\r\n	<img alt="" src="/cp/images/room%209.jpg" /></p>\r\n<p>\r\n	 </p>\r\n<p>\r\n	我们拥有庞大的加盟商资源，提供一流的住宿、休闲、度假、会议、接待等服务，最贴心的服务带给您最满意的享受，让每一位顾客都宾至如归。</p>\r\n', 1, '', 0, 9, 2),
(6, '所有房间', '', 1, 'all-apartment.php', 0, 2, 1),
(7, '出售物业', '<p>\r\n	your content goes here. content can be change from admin panel.</p>\r\n', 1, '', 3, 1, 2),
(8, '在线商城', '', 1, 'http://mall.zzlkk.com/shop', 0, 3, 1),
(10, '汽车票预订', '', 1, 'http://www.96096kp.com/', 10, 2, 1),
(11, '火车票预订', '', 1, '', 10, 1, 1),
(12, '首页', '<div id="show">\r\n	<div id="kinMaxShow">\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/1.jpg" /></a>\r\n			<p class="title">\r\n				美国称将绕过联合国安理会自行惩罚叙利亚</p>\r\n		</div>\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/2.jpg" /></a>\r\n			<p class="title">\r\n				西安军工企业夫妻藏匿国家机密资料被判刑</p>\r\n		</div>\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/3.jpg" /></a>\r\n			<p class="title">\r\n				首都机场爆炸案嫌犯冀中星涉爆炸罪被公诉</p>\r\n		</div>\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/4.jpg" /></a>\r\n			<p class="title">\r\n				美国摄影师离火山口仅1米处拍最完美喷发照</p>\r\n		</div>\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/5.jpg" /></a>\r\n			<p class="title">\r\n				地方官员为跑批文驻北京 在部委端茶扫地打开水</p>\r\n		</div>\r\n		<div>\r\n			<a href="http://www.lanrentuku.com" target="_blank"><img src="http://www.iruizi.com/kinMaxShow/images/demo_artifice_images/6.jpg" /></a>\r\n			<p class="title">\r\n				经济年度人物评选启动 主题转型升级智慧与行动</p>\r\n		</div>\r\n	</div>\r\n</div>\r\n', 1, 'index.php ', 0, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `name`, `url`, `email`, `body`, `dt`) VALUES
(2, '飞蛾之心', 'http://mall.zzlkk.com', '523375882@qq.com', '我是评论家', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `zen_address_book`
--

CREATE TABLE IF NOT EXISTS `zen_address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `zen_address_book`
--

INSERT INTO `zen_address_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES
(1, 1, 'm', 'JustaDemo', 'Bill', 'Smith', '123 Any Avenue', '', '12345', 'Here', '', 223, 12),
(2, 2, 'm', NULL, '徐', '鹏', '重庆市渝北区', NULL, '400900', '重庆', '', 44, 132),
(3, 3, 'm', NULL, '', '阳作杰', '重庆市渝北区', NULL, '400900', '重庆', '', 44, 132),
(4, 4, 'm', NULL, '', 'qq', 'qqqqq', NULL, '400000', 'qqqqq', '', 44, 150),
(5, 5, 'm', NULL, 'Zz', 'kk', 'kkkkk', NULL, '400000', 'kk', '', 44, 132),
(6, 6, 'm', NULL, '', 'Qiqiang Peng', 'Yangjiaping', NULL, '400000', 'cq', '', 44, 130),
(7, 7, 'm', NULL, '', 'Qiqiang Peng', 'Yangjiaping', NULL, '400000', 'cq', '', 44, 130),
(8, 8, 'm', NULL, '', 'Qiqiang Peng', 'Yangjiaping', NULL, '2535', 'cq', '', 44, 162),
(9, 9, 'm', NULL, '', 'Qiqiang Peng', 'Yangjiaping', NULL, '2535', 'BUDDEROO', '', 44, 162),
(10, 10, 'm', NULL, '', 'Qiqiang Peng', 'Yangjiaping', NULL, '2535', 'BUDDEROO', '', 44, 162),
(11, 11, 'm', NULL, '', 'Annabelle Biscoe', 'Yangjiaping', NULL, '400000', 'cq', '', 44, 158),
(12, 12, 'm', NULL, '', '可可姐', 'xxxxxxxxxxx', NULL, '400000', 'xxxxxx', '', 44, 131),
(13, 13, 'm', NULL, '', 'Rebecca Shirly', '58 Walter Crescent', NULL, '10000', 'Chongqing', '', 44, 155),
(14, 14, 'm', NULL, '', 'liu qiang', '58 Walter Crescent', NULL, '400000', 'Chongqing', '', 44, 147),
(15, 15, 'm', NULL, '', 'Rebecca Shirly', '1600 Holloway Avenue', NULL, '94132', '成都', '', 44, 157),
(16, 16, 'm', NULL, '', 'Rebecca Shirly', 'kkkkk', NULL, '2535', '成都', '', 44, 157),
(17, 17, 'm', NULL, '', 'andy', '重庆市南岸区亚太商谷1栋13-8', NULL, '400060', '重庆市', '', 44, 132),
(18, 18, 'm', NULL, '', '陈庆', '重庆市江北区', NULL, '400060', '重庆市', '', 44, 132),
(19, 19, 'm', NULL, '', '徐鹏', '某个地方', NULL, '000000', '上海', '', 44, 132),
(20, 20, '', NULL, '', '徐鹏', '', NULL, '', '', '', 0, 0),
(21, 21, '', NULL, '', 'balala', '', NULL, '', '', '', 0, 0),
(22, 22, '', NULL, '', 'fghjjjj', '', NULL, '', '', '', 0, 0),
(23, 23, '', NULL, '', 'dftgy', '', NULL, '', '', '', 0, 0),
(24, 24, '', NULL, '', '徐鹏', '', NULL, '', '', '', 0, 0),
(25, 25, 'm', NULL, '', 'sdfsf', 'sdfsdf', NULL, '000000', 'sdfsdfs', '', 44, 136),
(26, 26, '', NULL, '', 'liuchun', '', NULL, '', '', '', 0, 0),
(27, 27, 'm', NULL, '', 'ddds', 'sdfsdf', NULL, '000000', 'sdsdf', '', 44, 0),
(28, 28, 'm', NULL, '', 'fds', '4343434', NULL, '000000', '4343', '', 44, 0),
(29, 29, '', NULL, '', '橙子', '', NULL, '', '', '', 0, 0),
(30, 30, 'm', NULL, '', 'q2q2', 'Yangjiaping', NULL, '000000', 'cq', '', 44, 158);

-- --------------------------------------------------------

--
-- 表的结构 `zen_address_format`
--

CREATE TABLE IF NOT EXISTS `zen_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `zen_address_format`
--

INSERT INTO `zen_address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country'),
(6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country'),
(7, '$postcode$cr$country $state $city$cr$streets$cr$company$cr$firstname $lastname', '$city / $country');

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin`
--

CREATE TABLE IF NOT EXISTS `zen_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_admin`
--

INSERT INTO `zen_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_profile`, `admin_pass`, `prev_pass1`, `prev_pass2`, `prev_pass3`, `pwd_last_change_date`, `reset_token`, `last_modified`, `last_login_date`, `last_login_ip`, `failed_logins`, `lockout_expires`, `last_failed_attempt`, `last_failed_ip`) VALUES
(1, 'admin', '523375882@qq.com', 1, '02dbf7d1b103f76409a1072d1a85fb6e:0f', '3ce3e899766276361c54e41c216562c4:46', '', '', '2013-09-27 11:01:49', '', '2013-09-27 10:56:47', '2013-10-28 12:02:46', '125.85.146.120', 0, 0, '2013-10-25 11:40:24', '113.249.151.127');

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin_activity_log`
--

CREATE TABLE IF NOT EXISTS `zen_admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=667 ;

--
-- 转存表中的数据 `zen_admin_activity_log`
--

INSERT INTO `zen_admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(1, '2013-09-27 11:00:17', 0, 'Log found to be empty. Logging started.', '', '192.168.1.3', 0, '', ''),
(2, '2013-09-27 11:00:17', 0, 'alert_page.php ', '', '192.168.1.3', 0, '', ''),
(3, '2013-09-27 11:01:29', 0, 'login.php ', 'camefrom=index.php&', '192.168.1.3', 0, '', ''),
(4, '2013-09-27 11:01:36', 0, 'login.php admin', 'camefrom=index.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f966296649c9a6c6c989e696c949c916c6a916c9e6964646a6c669c906c606a9494ab500),
(5, '2013-09-27 11:01:49', 0, 'login.php ', '', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd5354b314b4a36354e4e34b74c4e4ab6304eb54836b7343232354e4b363036484d52b282a856d2514a4c2ec9cccf030a141513d4550b00),
(6, '2013-09-27 11:01:54', 1, 'alt_nav.php', '', '192.168.1.3', 0, '', ''),
(7, '2013-09-27 11:02:05', 1, 'template_select.php', '', '192.168.1.3', 0, '', ''),
(8, '2013-09-27 11:02:41', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '192.168.1.3', 0, '', ''),
(9, '2013-09-27 11:02:46', 1, 'template_select.php', 'page=1&tID=1&action=save&', '192.168.1.3', 0, '', 0xab56cac953b252cac92c498d4f2f4aad54aa0500),
(10, '2013-09-27 11:03:03', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(11, '2013-09-27 11:03:58', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(12, '2013-09-27 11:05:39', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a195962085702850d8d946a01),
(13, '2013-09-27 11:05:44', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(14, '2013-09-27 11:05:51', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(15, '2013-09-27 11:05:56', 1, 'configuration.php', 'gID=12&cID=270&action=edit&', '192.168.1.3', 0, '', ''),
(16, '2013-09-27 11:06:29', 1, 'configuration.php', 'gID=12&cID=270&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c090ef10f728df70ff7730d8a77f575f4f48977747109720d0e8eaf00ea33362242612550a1a9522d00),
(17, '2013-09-27 11:06:29', 1, 'configuration.php', 'gID=12&cID=270&', '192.168.1.3', 0, '', ''),
(18, '2013-09-27 11:06:30', 1, 'configuration.php', 'gID=12&cID=271&action=edit&', '192.168.1.3', 0, '', ''),
(19, '2013-09-27 11:06:33', 1, 'configuration.php', 'gID=12&cID=271&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c71f575f4f489770bf2f78daf002bc426530994313457aa0500),
(20, '2013-09-27 11:06:33', 1, 'configuration.php', 'gID=12&cID=271&', '192.168.1.3', 0, '', ''),
(21, '2013-09-27 11:06:37', 1, 'configuration.php', 'gID=12&cID=274&action=edit&', '192.168.1.3', 0, '', ''),
(22, '2013-09-27 11:06:39', 1, 'configuration.php', 'gID=12&cID=274&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c0976f57389778d0809728cf70f72710d8a77f575f4f4098e0ff18faf006a34312346652550a5a1a9522d00),
(23, '2013-09-27 11:06:39', 1, 'configuration.php', 'gID=12&cID=274&', '192.168.1.3', 0, '', ''),
(24, '2013-09-27 11:06:51', 1, 'configuration.php', 'gID=12&cID=290&action=edit&', '192.168.1.3', 0, '', ''),
(25, '2013-09-27 11:06:53', 1, 'configuration.php', 'gID=12&cID=290&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c0976f57389778d0809728cf7f10f8f0f0ef177f68e77f575f4f4098e0ff18faf006a36312156752550b5a189522d00),
(26, '2013-09-27 11:06:53', 1, 'configuration.php', 'gID=12&cID=290&', '192.168.1.3', 0, '', ''),
(27, '2013-09-27 11:06:55', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '192.168.1.3', 0, '', ''),
(28, '2013-09-27 11:06:59', 1, 'configuration.php', 'gID=12&cID=259&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18807f19cfc23e22b409a2c09a9aa04aa32b454aa0500),
(29, '2013-09-27 11:06:59', 1, 'configuration.php', 'gID=12&cID=259&', '192.168.1.3', 0, '', ''),
(30, '2013-09-27 11:07:01', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '192.168.1.3', 0, '', ''),
(31, '2013-09-27 11:07:07', 1, 'configuration.php', 'gID=12&cID=260&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a48cd4cc934333353d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df1880f700c0e0ef70f7289af002a363221a8ac12a8ccd04ca91600),
(32, '2013-09-27 11:07:07', 1, 'configuration.php', 'gID=12&cID=260&', '192.168.1.3', 0, '', ''),
(33, '2013-09-27 11:07:12', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(34, '2013-09-27 11:07:14', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a191960085702854d946a01),
(35, '2013-09-27 11:07:20', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(36, '2013-09-27 11:07:22', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(37, '2013-09-27 11:07:24', 1, 'configuration.php', 'gID=12&cID=258&action=edit&', '192.168.1.3', 0, '', ''),
(38, '2013-09-27 11:07:33', 1, 'configuration.php', 'gID=12&cID=258&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522ace2d2950d2512a2e4dcacd2c71f575f4f4890f0972f40b0ef00f0a89af002a3031c4295d0994363457aa0500),
(39, '2013-09-27 11:07:33', 1, 'configuration.php', 'gID=12&cID=258&', '192.168.1.3', 0, '', ''),
(40, '2013-09-27 11:07:43', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(41, '2013-09-27 11:07:50', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(42, '2013-09-27 11:07:52', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a5960885602450d0d956a01),
(43, '2013-09-27 11:09:59', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a5960885602450d0d956a01),
(44, '2013-09-27 11:11:02', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(45, '2013-09-27 11:11:10', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(46, '2013-09-27 11:11:12', 1, 'alt_nav.php', '', '192.168.1.3', 0, '', ''),
(47, '2013-09-27 11:11:20', 1, 'newsletters.php', '', '192.168.1.3', 0, '', ''),
(48, '2013-09-27 11:11:26', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(49, '2013-09-27 11:11:39', 1, 'mail.php', 'action=preview&', '192.168.1.3', 0, '', 0x6d8e4b0ac3300c05efa275288efc8bbbea410cc1b195d252131247abd0bb57a4d0553783d0639e7440e6b62f95b636524d8fd7984ad9a835b842644399223b8f29f250b044f6e882d00d26b29d124a8ada4307f3b65471b00f920d1ad56d5d2f59761d349e9e94f7b3d17aadc4b193b43813f0474b4e525d7a6156e67b43e42abfa43b9d7270faafe06d3fcb1cd00bc958787f00),
(50, '2013-09-27 11:11:41', 1, 'mail.php', 'action=send_email_to_user&', '192.168.1.3', 0, '', 0x758ecb0ac2301045ff25eb22ede4d5b8f24302254da65a69ec23c942c47f77ace04a3797e11ececc3c982f29cf11b7d46174e3d4b910364c891d992d023ddaa234385bda00c1160dca50aa56d8227b0744816b56b1619b2339d018622d87fab4ae074f5dc552e9afe8f3be516a5e93237bdaa284816f4a54447968287d2d3e37488ef48b3be32e1bc57f0a5a3603cd0634250a495a59a6d9856e18a7b74a85cbd9f94bc45bfe5fe6fbb283e70b),
(51, '2013-09-27 11:11:56', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(52, '2013-09-27 11:12:01', 1, 'configuration.php', 'gID=13&', '192.168.1.3', 0, '', ''),
(53, '2013-09-27 11:12:05', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(54, '2013-09-27 11:12:13', 1, 'configuration.php', 'gID=12&cID=261&action=edit&', '192.168.1.3', 0, '', ''),
(55, '2013-09-27 11:12:55', 1, 'configuration.php', 'gID=12&cID=261&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522ace2d29d02b2cd44bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18887f05c83c25c83e22b805a8ccd88515909546968a1540b00),
(56, '2013-09-27 11:12:55', 1, 'configuration.php', 'gID=12&cID=261&', '192.168.1.3', 0, '', ''),
(57, '2013-09-27 11:13:26', 1, 'image_handler.php', '', '192.168.1.3', 0, '', ''),
(58, '2013-09-27 11:13:31', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(59, '2013-09-27 11:13:33', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a195b62085702850d8d956a01),
(60, '2013-09-27 11:13:43', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(61, '2013-09-27 11:13:47', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a191960085702850d0d956a01),
(62, '2013-09-27 11:13:50', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(63, '2013-09-27 11:13:56', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(64, '2013-09-27 11:14:06', 1, 'configuration.php', 'gID=12&cID=273&action=edit&', '192.168.1.3', 0, '', ''),
(65, '2013-09-27 11:14:25', 1, 'configuration.php', 'gID=12&cID=262&action=edit&', '192.168.1.3', 0, '', ''),
(66, '2013-09-27 11:15:01', 1, 'configuration.php', 'gID=12&cID=262&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b25252d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18887f05c83c25c83e203fc8342e22b808a8d0d88565e09546ea1540b00),
(67, '2013-09-27 11:15:01', 1, 'configuration.php', 'gID=12&cID=262&', '192.168.1.3', 0, '', ''),
(68, '2013-09-27 11:15:09', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(69, '2013-09-27 11:15:11', 1, 'modules.php', 'set=payment&action=install&', '192.168.1.3', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a191b63085702852d946a01),
(70, '2013-09-27 11:15:27', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(71, '2013-09-27 11:22:44', 1, 'configuration.php', 'gID=1&', '192.168.1.3', 0, '', ''),
(72, '2013-09-27 17:10:11', 0, 'login.php ', 'camefrom=index.php&', '192.168.1.3', 0, '', ''),
(73, '2013-09-27 17:10:17', 0, 'login.php admin', 'camefrom=index.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c62989c929696689a9c6c649e689c9c9a9491689168949294606064669e626c94ab500),
(74, '2013-09-27 17:10:22', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(75, '2013-09-27 17:10:41', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a2935334d328829b5484b4952d251aa2a8b4fcbcc492d06ca182ad50200),
(76, '2013-09-27 17:10:58', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a2935334d328829b5484b498a2935353531039226c9864a3a4a5565f1699939a9c54055864ab500),
(77, '2013-09-27 17:11:18', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f28f88f7707574f1f4738f0ff7700c098ef7730d57d251aa2a8b4fcbcc492d062a3154aa0500),
(78, '2013-09-27 17:11:29', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a2935334d328829b5484b4952d251aa2a8b4fcbcc492d06ca182ad50200),
(79, '2013-09-27 17:11:47', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2520a7074778d0f08f27709750e098ef7730d57d251aa2a8b4fcbcc492d064a1b2ad50200),
(80, '2013-09-27 17:12:10', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a2935334d328829b5484b498a2935353531039226c9864a3a4a5565f1699939a9c54055864ab500),
(81, '2013-09-29 10:42:55', 0, 'login.php ', 'camefrom=index.php&', '192.168.1.3', 0, '', ''),
(82, '2013-09-29 10:43:00', 0, 'login.php admin', 'camefrom=index.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f96669c96906e606c6c62669294906a9e6c6264686a6a6a9268966c6c6a66916694ab500),
(83, '2013-09-29 10:43:03', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(84, '2013-09-29 10:43:17', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a293533374a8e29354db53407b24d930c624a2d4dd392947494aacae2d33273528b81aa0c956a01),
(85, '2013-09-29 10:43:40', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a293533374a8e29354db53407b24d930c624a2d4dd392947494aacae2d33273528b81aa0c91b8259505a960a15a00),
(86, '2013-09-29 10:44:07', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2524aad2a484c4f2df6484d4cc9cc4b57d251aa2a8b4fcbcc492d06ca1921714b2a0b528142864ab500),
(87, '2013-09-29 10:52:03', 1, 'ezpages.php', '', '192.168.1.3', 0, '', ''),
(88, '2013-09-29 10:52:19', 1, 'ezpages.php', 'page=1&ezID=6&', '192.168.1.3', 0, '', ''),
(89, '2013-09-29 10:52:23', 1, 'ezpages.php', 'page=1&ezID=6&action=new&', '192.168.1.3', 0, '', ''),
(90, '2013-09-29 10:52:42', 1, 'ezpages.php', 'page=1&ezID=6&', '192.168.1.3', 0, '', ''),
(91, '2013-09-29 10:52:56', 1, 'ezpages.php', 'page=1&ezID=3&', '192.168.1.3', 0, '', ''),
(92, '2013-09-29 10:52:59', 1, 'ezpages.php', 'page=1&ezID=3&action=new&', '192.168.1.3', 0, '', ''),
(93, '2013-09-29 10:53:14', 1, 'ezpages.php', 'page=1&action=update&', '192.168.1.3', 0, '', 0x7552db6e83300cfd9588e7a90b21e1524dfb843eed11290ac4194894a024884e55ff7d0ea0aeddb49713fbf8f822c7d764529fe065af936392252fbb1bfa304072bc260ce97ace0b4a114583586ace111b65509d62f8048b4f6e5ba6b4138c7284452efda8ed8261ba1795bd97de0f3be3830ab3971d280d0eb914b9cd91deba20addb78f620f6bd86c65e76f5eefd2f37d686958cdce63c8b231f6c2bdb4e4d3fca3d1b030f923f79db9aba701e64804b78589549713d4595a97a1682e7885015c8377986b6a166451a91d1b7c691faf57d7f50c5385dd75dddb3799bd673458d463e67e6b943215819a3913186b6319721164a6385aa10805fc599a8670e69d41b916ed1df9d39d006bb6562d5b688552e68b44bac916bdec44fd7224e44b15b5516714656e144254eb71fc347d77be2837540d030d6110d674ba6d94dd603b1e3f07520274bd65d92a51f06d200999c6dc17bd08778486a087276f15292bb2371c9e046b5b2b76f),
(94, '2013-09-29 10:53:14', 1, 'ezpages.php', 'page=1&ezID=3&', '192.168.1.3', 0, '', ''),
(95, '2013-09-29 10:53:25', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(96, '2013-09-29 10:53:53', 1, 'configuration.php', 'gID=19&', '192.168.1.3', 0, '', ''),
(97, '2013-09-29 10:54:04', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(98, '2013-09-29 10:54:07', 1, 'store_manager.php', '', '192.168.1.3', 0, '', ''),
(99, '2013-09-29 10:54:13', 1, 'whos_online.php', '', '192.168.1.3', 0, '', ''),
(100, '2013-09-29 10:54:17', 1, 'banner_manager.php', '', '192.168.1.3', 0, '', ''),
(101, '2013-09-29 10:54:19', 1, 'template_select.php', '', '192.168.1.3', 0, '', ''),
(102, '2013-09-29 10:54:20', 1, 'alt_nav.php', '', '192.168.1.3', 0, '', ''),
(103, '2013-09-29 10:54:24', 1, 'define_pages_editor.php', '', '192.168.1.3', 0, '', ''),
(104, '2013-09-29 10:54:29', 1, 'ezpages.php', '', '192.168.1.3', 0, '', ''),
(105, '2013-09-29 10:54:33', 1, 'ezpages.php', 'reset_ez_sort_order=1&action=set_ez_sort_order&', '192.168.1.3', 0, '', ''),
(106, '2013-09-29 10:54:33', 1, 'ezpages.php', 'page=&', '192.168.1.3', 0, '', ''),
(107, '2013-09-29 10:54:37', 1, 'ezpages.php', 'reset_ez_sort_order=0&action=set_ez_sort_order&', '192.168.1.3', 0, '', ''),
(108, '2013-09-29 10:54:37', 1, 'ezpages.php', 'page=&', '192.168.1.3', 0, '', ''),
(109, '2013-09-29 10:55:38', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(110, '2013-09-29 10:55:39', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(111, '2013-09-29 10:55:42', 1, 'ezpages.php', 'page=1&ezID=7&action=new&', '192.168.1.3', 0, '', ''),
(112, '2013-09-29 10:56:09', 1, 'ezpages.php', 'page=1&action=update&', '192.168.1.3', 0, '', 0x65905d6ac3301084efa2e7509cb6aa69a0f4063d816191ed4d2d5024a15d6143c8ddb3ae94bfe67166bf19a139aa687e91c08e6aa75ab5a9922d3b54bba37a15bbcbad7ed35dd6bd6ebafcd918ecf23bee3f84decaf9076772c88c499d4a1e42440f1e6798ad1fc32c5053abc11210b9ea101bce04139a51d2c52b02282486906e7e65c98ed88745cced6a16f548b7fa86ef43e06b4511cfd51c06182613f9ff6372b8439e7265ab890f0e1817beec557759d7308e21a7f5bb32042e2f718adf07633dacd1afec29f73424dba3bab2204d98bc717f1567),
(113, '2013-09-29 10:56:09', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(114, '2013-09-29 10:56:29', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(115, '2013-09-29 10:56:30', 1, 'ezpages.php', 'page=1&ezID=7&action=new&', '192.168.1.3', 0, '', ''),
(116, '2013-09-29 10:59:46', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(117, '2013-09-29 10:59:51', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0x4d8acd0a80200c80df65e708ead8cb0c59b32473c36660d1bbe7d1e3f7f30249f2612bd9599084075758c034e2296b897c216576c6e888a4241b755718e0b9d18756db3b776855b9a909be1f),
(118, '2013-09-29 11:03:32', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b252727476f60ff50b890f0e750a0d7252d251aa2a8b4fcbcc492d06ca1921714b2a0b528142864ab500),
(119, '2013-09-29 11:06:07', 1, 'developers_tool_kit.php', 'action=locate_configuration&configuration_key_lookup=ACCOUNT_SUBURB&', '192.168.1.3', 0, '', ''),
(120, '2013-09-29 11:06:10', 1, 'configuration.php', 'gID=5&cID=133&', '192.168.1.3', 0, '', ''),
(121, '2013-09-29 11:06:27', 1, 'configuration.php', 'gID=5&cID=133&action=edit&', '192.168.1.3', 0, '', ''),
(122, '2013-09-29 11:06:29', 1, 'configuration.php', 'gID=5&cID=133&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2524a4bcc294e55d2512a2e4dcacd2c717476f60ff50b890f0e750a0d728aaf002a3034c4255b09943555aa0500),
(123, '2013-09-29 11:06:29', 1, 'configuration.php', 'gID=5&cID=133&', '192.168.1.3', 0, '', ''),
(124, '2013-09-29 11:08:33', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(125, '2013-09-29 11:08:48', 1, 'configuration.php', 'gID=12&cID=261&action=edit&', '192.168.1.3', 0, '', ''),
(126, '2013-09-29 11:08:53', 1, 'configuration.php', 'gID=12&cID=262&action=edit&', '192.168.1.3', 0, '', ''),
(127, '2013-09-29 11:09:16', 1, 'configuration.php', 'gID=12&cID=262&action=edit&', '192.168.1.3', 0, '', ''),
(128, '2013-09-29 11:09:16', 1, 'configuration.php', 'gID=12&cID=262&action=edit&', '192.168.1.3', 0, '', ''),
(129, '2013-09-29 11:09:19', 1, 'configuration.php', 'gID=12&cID=262&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252323255d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18887f05c83c25c83e203fc8342e22b40ca2d89565e09546e68ac540b00),
(130, '2013-09-29 11:09:20', 1, 'configuration.php', 'gID=12&cID=262&', '192.168.1.3', 0, '', ''),
(131, '2013-09-29 11:12:00', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(132, '2013-09-29 11:12:18', 1, 'mail.php', 'action=preview&', '192.168.1.3', 0, '', 0x558d4b0ec2300c05efe2354289f373bbe22091aab4751088a86ad3ac1077c75d4137b635a3e7f786a9d57d29bcd5814b7abc8634cf1bd70a3d3834263822bcadeb755a0a5c206fb27a40dd79b26450fd546de393a75d6c6c9d373936a759c74679e4d83c5a25c4cc4282d362837c1082ca4bb84863baf35f982c92e83c8673ec74777858b6ee98c9c3e70b),
(133, '2013-09-29 11:12:21', 1, 'mail.php', 'action=send_email_to_user&', '192.168.1.3', 0, '', 0x758dcb0ec2201045ff85b531e555a82b3f84a4a130684db10f60618cffeee046bb7033333927f7ce93b892f21c614b3d443b4ebdf57e8394c88948c6b9925ab3f3ba1edd1cc981840dd78930dab55a68ce9aaf4a65b881cb684de95a1e4c9114a8293a0c604acb4483847b244a52b40a1b90b0a6c570c48ff6023f612d98461d06b58fedee8e550b42d6696b5159a6d9fa3e8c532d436073b6ee1ae19effc3fc583ee2f506),
(134, '2013-09-29 11:13:46', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(135, '2013-09-29 11:14:43', 1, 'server_info.php', '', '192.168.1.3', 0, '', ''),
(136, '2013-09-29 11:14:55', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(137, '2013-09-29 11:19:24', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(138, '2013-09-29 11:19:32', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f50b098a8c0f71f5710df0f0f7738df70bf575720d52d251aa2a8b4fcbcc492d06aa3142e2965416a402850c956a01),
(139, '2013-09-29 11:19:50', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f50b098a8c0f71f5710df0f0f7738df70bf575720d52d251aa2a8b4fcbcc492d06aa3154aa0500),
(140, '2013-09-29 11:25:45', 1, 'configuration.php', 'gID=5&', '192.168.1.3', 0, '', ''),
(141, '2013-09-29 11:25:52', 1, 'configuration.php', 'gID=5&cID=138&action=edit&', '192.168.1.3', 0, '', ''),
(142, '2013-09-29 11:34:19', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(143, '2013-09-29 11:47:08', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(144, '2013-09-29 11:47:27', 1, 'mail.php', 'action=preview&', '192.168.1.3', 0, '', 0xab564a2e2d2ec9cf4d2d2a8e4fcd4dcccc894f4c49294a2d2e56b252323532363637b5b03072282cd44bcecf55d2514a2b0252564a46869666162616c6460608a9e2d2a4acd4e412a0acb191a1b1a11108018573816625a6a70285b333b233946a01),
(145, '2013-09-29 11:47:30', 1, 'mail.php', 'action=send_email_to_user&', '192.168.1.3', 0, '', 0x75cc4d0ac2301086e1bb642d6226adc6aebc491893a9a94d4c9b9f85887777eac69530f0c1f3c2bc846da5a648b9188a380583ce652a450ca207a54ebdd67059d7bd4d51ecc498790601f27cd49d5670f8a5d2ae77b295ab02a9246cc71cf917de8879f6b367684b48e8cc38850d19b056b43ed2a3fec7fa5cbee1fd01),
(146, '2013-09-29 11:47:34', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(147, '2013-09-29 11:47:39', 1, 'configuration.php', 'gID=12&', '192.168.1.3', 0, '', ''),
(148, '2013-09-29 11:47:43', 1, 'configuration.php', 'gID=12&cID=271&action=edit&', '192.168.1.3', 0, '', ''),
(149, '2013-09-29 11:47:59', 1, 'configuration.php', 'gID=12&cID=271&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252cace76a8aacac9ced64bcecf55d2512a2e4dcacd2c71f575f4f489770bf2f78daf00aa31b4c4265309943153aa0500),
(150, '2013-09-29 11:47:59', 1, 'configuration.php', 'gID=12&cID=271&', '192.168.1.3', 0, '', ''),
(151, '2013-09-29 11:48:05', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '192.168.1.3', 0, '', ''),
(152, '2013-09-29 11:48:08', 1, 'configuration.php', 'gID=12&cID=259&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252cace76a8aacac9ced64bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18807f19cfc23e22b80ea8d0c09a9aa04aa323451aa0500),
(153, '2013-09-29 11:48:08', 1, 'configuration.php', 'gID=12&cID=259&', '192.168.1.3', 0, '', ''),
(154, '2013-09-29 11:48:09', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '192.168.1.3', 0, '', ''),
(155, '2013-09-29 11:48:26', 1, 'configuration.php', 'gID=12&cID=260&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2528a4c2d36b75054d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df1880f700c0e0ef70f7289af002a353421a8ac12a4cc50a91600),
(156, '2013-09-29 11:48:26', 1, 'configuration.php', 'gID=12&cID=260&', '192.168.1.3', 0, '', ''),
(157, '2013-09-29 11:48:31', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(158, '2013-09-29 11:48:36', 1, 'mail.php', 'action=preview&', '192.168.1.3', 0, '', 0x2dcc510a80201004d0bbec77042992f8d54dc4748d32095dfb29ba7b1b0403036f606ef027b52363258bd9adbb7521542402034a48392aadc5544aef8f0c1dc4ca6520a5e9baf6947ea573ded0371ea418e420be3067be710b324747119e17),
(159, '2013-09-29 11:48:37', 1, 'mail.php', 'action=send_email_to_user&', '192.168.1.3', 0, '', 0x75ccc10ac2301004d07fd9b3084d28969efa27614d365a939836d91c5af1dfdd8a576160e00dcc0b6cab9c13956a28e11c0d3a57a85618a1575a5ffa6150d3ba9e6d4e70025fa4460861daf718c24f6bbb3ec8b20c5a75ba53478493dce08d843d562fd09698d1193fc703059019ed3dd193ff236fcb77787f00),
(160, '2013-09-29 11:48:42', 1, 'mail.php', '', '192.168.1.3', 0, '', ''),
(161, '2013-09-29 12:03:29', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(162, '2013-09-29 12:03:35', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f3f471f573f4758d770e72750c718d777476f60ff50b51d251aa2a8b4fcbcc492d062a3242e2965416a402850c956a01),
(163, '2013-09-29 12:23:20', 0, 'login.php ', 'camefrom=customers.php&', '192.168.1.3', 0, '', ''),
(164, '2013-09-29 12:23:27', 0, 'login.php admin', 'camefrom=customers.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c92926e6a9262986a96649a686294686c9e6894916461616a966c696469616164ab500),
(165, '2013-09-29 12:23:27', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(166, '2013-09-29 12:24:14', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(167, '2013-09-29 12:24:20', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f50b098a8cf7710c0e89f773f47555d251aa2a8b4fcbcc492d064a1a2ad50200),
(168, '2013-09-29 12:25:33', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f50b098a8cf7710c0e89f773f4758df7f5f48bf771f5730ff150d251aa2a8b4fcbcc492d06aa3342e2965416a402850c956a01),
(169, '2013-09-29 12:25:42', 1, 'configuration.php', 'gID=2&', '192.168.1.3', 0, '', ''),
(170, '2013-09-29 12:25:46', 1, 'configuration.php', 'gID=2&cID=34&action=edit&', '192.168.1.3', 0, '', ''),
(171, '2013-09-29 12:25:55', 1, 'configuration.php', 'gID=2&cID=34&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523252d2512a2e4dcacd2c71f50b098a8c77f30c0a0e89f773f4758df7f5f48bf771f5730ff188af00a934274a692550a9b9522d00),
(172, '2013-09-29 12:25:55', 1, 'configuration.php', 'gID=2&cID=34&', '192.168.1.3', 0, '', ''),
(173, '2013-09-29 12:26:48', 1, 'configuration.php', 'gID=2&cID=35&action=edit&', '192.168.1.3', 0, '', ''),
(174, '2013-09-29 12:26:52', 1, 'configuration.php', 'gID=2&cID=35&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523252d2512a2e4dcacd2c71f50b098a8cf7710c0e89f773f4758df7f5f48bf771f5730ff188af0029342746652550a589522d00),
(175, '2013-09-29 12:26:53', 1, 'configuration.php', 'gID=2&cID=35&', '192.168.1.3', 0, '', ''),
(176, '2013-09-29 12:26:59', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(177, '2013-09-29 12:29:30', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(178, '2013-09-29 12:29:35', 1, 'configuration.php', 'gID=1&', '192.168.1.3', 0, '', ''),
(179, '2013-09-29 12:29:43', 1, 'configuration.php', 'gID=19&', '192.168.1.3', 0, '', ''),
(180, '2013-09-29 12:29:47', 1, 'configuration.php', 'gID=19&cID=404&action=edit&', '192.168.1.3', 0, '', ''),
(181, '2013-09-29 12:30:14', 1, 'configuration.php', 'gID=19&cID=404&action=save&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b25252cb4b2a2eb08e293536304882b09574948a4b9372334b9c825c1d5de29d83427d9d82e3835d031c831c43fc83e22b80ba0ccd09a9aa04a93254aa0500),
(182, '2013-09-29 12:30:15', 1, 'configuration.php', 'gID=19&cID=404&', '192.168.1.3', 0, '', ''),
(183, '2013-09-29 12:31:09', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(184, '2013-09-29 12:32:06', 1, 'languages.php', '', '192.168.1.3', 0, '', ''),
(185, '2013-09-29 12:32:07', 1, 'languages.php', 'page=1&lID=1&', '192.168.1.3', 0, '', ''),
(186, '2013-09-29 12:32:14', 1, 'languages.php', 'page=1&lID=1&action=delete&', '192.168.1.3', 0, '', ''),
(187, '2013-09-29 12:32:16', 1, 'languages.php', 'page=1&action=deleteconfirm&', '192.168.1.3', 0, '', 0xab56caf17451b2523254aa0500),
(188, '2013-09-29 12:32:16', 1, 'languages.php', 'page=1&', '192.168.1.3', 0, '', ''),
(189, '2013-09-29 12:32:25', 1, 'ezpages.php', '', '192.168.1.3', 0, '', ''),
(190, '2013-09-29 12:32:50', 1, 'layout_controller.php', '', '192.168.1.3', 0, '', ''),
(191, '2013-09-29 12:33:16', 1, 'layout_controller.php', 'page=&cID=134&', '192.168.1.3', 0, '', ''),
(192, '2013-09-29 12:33:18', 1, 'layout_controller.php', 'page=&cID=134&action=edit&', '192.168.1.3', 0, '', ''),
(193, '2013-09-29 12:33:21', 1, 'layout_controller.php', 'page=&cID=134&action=save&layout_box_name=languages.php&', '192.168.1.3', 0, '', 0xab56ca49accc2f2d894fcaaf882f2e492c292d56b2523250d24116cfc94f4e2cc9cccf03ca18a2ca14e71795c4e717a5a41681e40c0c70c9c61767e6a5e7a4621a0db11259ba1600),
(194, '2013-09-29 12:33:22', 1, 'layout_controller.php', 'page=&cID=134&', '192.168.1.3', 0, '', ''),
(195, '2013-09-29 12:33:34', 1, 'layout_controller.php', 'page=&cID=129&', '192.168.1.3', 0, '', ''),
(196, '2013-09-29 12:33:37', 1, 'layout_controller.php', 'page=&cID=129&action=edit&', '192.168.1.3', 0, '', ''),
(197, '2013-09-29 12:33:40', 1, 'layout_controller.php', 'page=&cID=129&action=save&layout_box_name=currencies.php&', '192.168.1.3', 0, '', 0xab56ca49accc2f2d894fcaaf882f2e492c292d56b2523250d24116cfc94f4e2cc9cccf03ca18a2ca14e71795c4e717a5a41601e52c0d7049c61767e6a5e7a4629a0cb11159ba1600),
(198, '2013-09-29 12:33:40', 1, 'layout_controller.php', 'page=&cID=129&', '192.168.1.3', 0, '', ''),
(199, '2013-09-29 12:35:57', 1, 'modules.php', 'set=payment&', '192.168.1.3', 0, '', ''),
(200, '2013-09-29 12:37:29', 1, 'ezpages.php', '', '192.168.1.3', 0, '', ''),
(201, '2013-09-29 12:37:44', 1, 'ezpages.php', 'page=1&ezID=10&', '192.168.1.3', 0, '', ''),
(202, '2013-09-29 12:37:45', 1, 'ezpages.php', 'page=1&ezID=10&', '192.168.1.3', 0, '', ''),
(203, '2013-09-29 12:37:48', 1, 'ezpages.php', 'page=1&ezID=10&action=new&', '192.168.1.3', 0, '', ''),
(204, '2013-09-29 12:38:17', 1, 'ezpages.php', 'page=1&action=update&', '192.168.1.3', 0, '', 0x6590ddaac2301084df25d72255ac8270382f5258d266b581980dd90d2dc879f79318ebefe54cbe99b07355419f91c11a75549b46adee5aac3854c7abda66bf4bfbb66fbad4ee864d9776d8e8ec1cfabdfaab3850400f1e2798ac3734e5c8d2049681d9dd1d162d8961446d30960fb357053045018ad56fdb27ccd6604ff3d250d53bfe527d22928757c5372b34c030ea209fe9fcf0827ce5ea34a35c1c08ceb2cc5366d04e20c572675e00e77518c3ef455b0f25f31322993408978dd40386dc81d16b77ebf807),
(205, '2013-09-29 12:38:17', 1, 'ezpages.php', 'page=1&ezID=10&', '192.168.1.3', 0, '', ''),
(206, '2013-09-29 12:38:22', 1, 'ezpages.php', 'page=1&ezID=13&', '192.168.1.3', 0, '', ''),
(207, '2013-09-29 12:38:25', 1, 'ezpages.php', 'page=1&ezID=13&', '192.168.1.3', 0, '', ''),
(208, '2013-09-29 12:38:27', 1, 'ezpages.php', 'page=1&ezID=13&action=new&', '192.168.1.3', 0, '', ''),
(209, '2013-09-29 12:38:38', 1, 'ezpages.php', 'page=1&ezID=13&', '192.168.1.3', 0, '', ''),
(210, '2013-09-29 12:38:40', 1, 'ezpages.php', 'action=status_header&current=1&ezID=13&page=1&', '192.168.1.3', 0, '', ''),
(211, '2013-09-29 12:38:41', 1, 'ezpages.php', 'page=1&ezID=13&', '192.168.1.3', 0, '', ''),
(212, '2013-09-29 12:38:55', 1, 'ezpages.php', 'page=1&ezID=13&', '192.168.1.3', 0, '', ''),
(213, '2013-09-29 12:39:29', 1, 'ezpages.php', 'page=1&ezID=12&', '192.168.1.3', 0, '', ''),
(214, '2013-09-29 12:39:31', 1, 'ezpages.php', 'page=1&ezID=12&action=new&', '192.168.1.3', 0, '', ''),
(215, '2013-09-29 12:39:39', 1, 'ezpages.php', 'page=1&action=update&', '192.168.1.3', 0, '', 0x65905d0ac2301084ef926791f84b15c48b1496d86e6d202621bba105f1ee26a64ad5b79dd96f3664eec2ab2b12e8561cc56a2d169366cd06c5f12ed6c9afe3b65b5575dc4b94796e36753ceca4148f8283f368c1e20083b6ad1b52444e9740131099c921561c097a542d86fc60f28a007281c185e2573398748b1737be2f14f58dcfe8ce39fe7845fcb3ec1a687ae5f9379d1633e42f57aae9f9668071e4773db906651862c8ff4c0de0b8f4bd3fdf94b6903327f2d86865487c4048790c569957fe09),
(216, '2013-09-29 12:39:39', 1, 'ezpages.php', 'page=1&ezID=12&', '192.168.1.3', 0, '', ''),
(217, '2013-09-29 12:39:41', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(218, '2013-09-29 12:39:41', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(219, '2013-09-29 12:39:41', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(220, '2013-09-29 12:39:42', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(221, '2013-09-29 12:39:42', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(222, '2013-09-29 12:39:43', 1, 'ezpages.php', 'page=1&ezID=7&', '192.168.1.3', 0, '', ''),
(223, '2013-09-29 12:41:07', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(224, '2013-09-29 12:41:20', 1, 'customers.php', 'page=1&cID=3&action=edit&', '192.168.1.3', 0, '', ''),
(225, '2013-09-29 12:41:33', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(226, '2013-09-29 12:42:22', 1, 'customers.php', 'page=1&cID=3&action=edit&', '192.168.1.3', 0, '', ''),
(227, '2013-09-29 12:44:15', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(228, '2013-09-29 12:44:20', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b252f2707574710d8a0ff10cf1718df7f177f7777353d251aa2a8b4fcbcc492d062a3052aa0500),
(229, '2013-09-29 12:45:09', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b252f2707574710d8a0ff10cf1718df7f177f7777353d251aa2a8b4fcbcc492d062a3042e2965416a402850c956a01),
(230, '2013-09-29 12:58:07', 0, 'login.php ', 'camefrom=index.php&', '192.168.1.3', 0, '', ''),
(231, '2013-09-29 12:58:12', 0, 'login.php admin', 'camefrom=index.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a9c616a696c969692649664926c946166969a996269629c929c9a6661696c9664ab500),
(232, '2013-09-29 12:58:51', 1, 'developers_tool_kit.php', '', '192.168.1.3', 0, '', ''),
(233, '2013-09-29 12:58:57', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2520a0ef10f728d0f760d0ef6f4f70b56d251aa2a8b4fcbcc492d06ca1921714b2a0b528142864ab500),
(234, '2013-09-29 13:02:55', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '192.168.1.3', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2522a4e2d2e06f18a4b128b4a947494aacae2d33273528b81524648dc92ca8254a090a1522d00),
(235, '2013-09-29 13:07:44', 0, 'login.php ', 'camefrom=index.php&', '192.168.1.3', 0, '', ''),
(236, '2013-09-29 13:07:51', 0, 'login.php admin', 'camefrom=index.php&', '192.168.1.3', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f92616c9e60606c916c926e6894646c696c6e62629a6964926a68929e606e629064ab500),
(237, '2013-09-29 13:07:54', 1, 'customers.php', '', '192.168.1.3', 0, '', ''),
(238, '2013-09-29 13:07:57', 1, 'customers.php', 'page=1&cID=2&', '192.168.1.3', 0, '', ''),
(239, '2013-09-29 13:07:58', 1, 'customers.php', 'page=1&cID=2&action=edit&', '192.168.1.3', 0, '', ''),
(240, '2013-09-30 14:08:25', 0, 'login.php ', 'camefrom=index.php&', '113.249.142.54', 0, '', ''),
(241, '2013-09-30 14:08:29', 0, 'login.php admin', 'camefrom=index.php&', '113.249.142.54', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a6a9890669169669461606c606168646a649862686462986490669a69696a9894ab500),
(242, '2013-09-30 14:08:40', 0, 'login.php admin', 'camefrom=index.php&', '113.249.142.54', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a6a9890669169669461606c606168646a649862686462986490669a69696a9894ab500),
(243, '2013-09-30 14:08:50', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(244, '2013-09-30 14:09:02', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0x2d8c410a80300c04ff92b378a814c5933f91d8a4a2b5481bbd54fcbb513c0c0b33b017b8538e3d729691232edb88449945a0076b9aa6b55d6786946ab747a8c0679d1e42184ad942f8ad9cd3caeed0e09144c8a3421aa21ee1cc1a5ef7e917b81f),
(245, '2013-09-30 14:09:03', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x75cc310ec2300c85e1bb78460cad2aaa4ebd496412074a12d2c6ce401177c7a958199e2cfd9fe437d8ca92131536947089069d2bc40c130c5ddf5f8671ece66d3bdb9ce004bee899208479df6308bfcaf5fa202b0a1e1db3f3a8730a491fe18d145a3b729b4a5d634667fc129b6a4011b4f7444ff91fe5b51ef0f902),
(246, '2013-09-30 14:09:20', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(247, '2013-09-30 14:09:24', 1, 'configuration.php', 'gID=12&', '113.249.142.54', 0, '', ''),
(248, '2013-09-30 14:09:40', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(249, '2013-09-30 14:09:46', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0xab564a2e2d2ec9cf4d2d2a8e4fcd4dcccc894f4c49294a2d2e56b252323532363637b5b03072282cd44bcecf55d2514a2b0252564ad9d90e555539d9d950d1e2d2a4acd4e412a08491b10918010573818624a6a7c2058d4d946a01),
(250, '2013-09-30 14:09:47', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x75ccc10ac2300cc6f177c9593cb41b8e9df62625b6d99c6dedd6a60727befbe2106f42e083df1ff2025b0ba748b9188a380783ce652a057a6895d697b6ebd4b0ae679b229c60cc323d783f6c5bf0feaba55eef645982d2cd7182519ee0443fd48d605d424267c6397c820032a3bd457af07fe4e77284f70e),
(251, '2013-09-30 14:10:58', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(252, '2013-09-30 14:11:03', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0x2dcc310a80300c85e1bb641607452c4ede446a9b88d650dad8a5e2dd8de0f4e07bf0dfe08a5c9131cb826cf773b1de6714810986aeefc7c1986e4ea97591a101ca3a138430d77a86f0ab94f54077e941563ca9b016ec862a1fd087cf0b),
(253, '2013-09-30 14:12:14', 1, 'developers_tool_kit.php', '', '113.249.142.54', 0, '', ''),
(254, '2013-09-30 14:12:20', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2522a4ecd4b894fcd4dcccc892fc98f2f2d4e2d52d251aa2a8b4fcbcc492d06ca1b21714b2a0b528142864ab500),
(255, '2013-09-30 14:24:54', 1, 'configuration.php', 'gID=12&', '113.249.142.54', 0, '', ''),
(256, '2013-09-30 14:24:58', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '113.249.142.54', 0, '', ''),
(257, '2013-09-30 14:25:00', 1, 'configuration.php', 'gID=12&cID=274&action=edit&', '113.249.142.54', 0, '', ''),
(258, '2013-09-30 14:25:11', 1, 'configuration.php', 'gID=12&cID=271&action=edit&', '113.249.142.54', 0, '', ''),
(259, '2013-09-30 14:25:14', 1, 'configuration.php', 'gID=12&cID=271&action=save&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c71f575f4f489770bf2f78daf002a3434c526530994b154aa0500),
(260, '2013-09-30 14:25:15', 1, 'configuration.php', 'gID=12&cID=271&', '113.249.142.54', 0, '', ''),
(261, '2013-09-30 14:25:24', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '113.249.142.54', 0, '', ''),
(262, '2013-09-30 14:25:26', 1, 'configuration.php', 'gID=12&cID=259&action=save&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523232b434b330b130363270282cd44bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18807f19cfc23e22b409acc08a9aa04aa3255aa0500),
(263, '2013-09-30 14:25:27', 1, 'configuration.php', 'gID=12&cID=259&', '113.249.142.54', 0, '', ''),
(264, '2013-09-30 14:25:28', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '113.249.142.54', 0, '', ''),
(265, '2013-09-30 14:25:38', 1, 'configuration.php', 'gID=12&cID=260&action=save&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a48cd4cc934333353d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df1880f700c0e0ef70f7289af002a36b220a8ac12a8cc4ca91600),
(266, '2013-09-30 14:25:38', 1, 'configuration.php', 'gID=12&cID=260&', '113.249.142.54', 0, '', ''),
(267, '2013-09-30 14:25:43', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(268, '2013-09-30 14:25:50', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0x458c4b0a80300c05ef92b5884dfc5457dea4d41a45b1888daec4bb1b57c28307333037844bce3d7212c7d12f9bf3e39858043aa890a8a9acc5fe38f2b047c8604a7a1da0696b5b5ac2e257720d2b8753ad212a0d924e71d4969ff9c39afb30c1f302),
(269, '2013-09-30 14:25:51', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x75cc4d0ac2301086e1bbcc5ac4645a8d5d7993302653ad24b6cdcfa2887777e2c6953030f0bcf0bdc0d55ce6c8295b8e34054bde27ce1906e835e2a937465fd675efe6083b1893bc01b43a1f4d67501f7e29d7eb835d91aa103ba5514e38ca16ddb8b1cc356e5a973093b7e3145a11a052c8dd233fcb7f2cdbf20def0f),
(270, '2013-09-30 14:26:29', 1, 'developers_tool_kit.php', '', '113.249.142.54', 0, '', ''),
(271, '2013-09-30 14:26:35', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a2935494d350591064931a5a6c6298620769a19884c4a048a981b1b8048132069696a6819536a91949aa6a4a35455169f9699935a0c34c310895b5259900a16aa0500),
(272, '2013-09-30 14:27:58', 1, 'developers_tool_kit.php', '', '113.249.142.54', 0, '', ''),
(273, '2013-09-30 14:28:06', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2525209f008f075f4f4710d8af771f4738f564f2bcacf8d4f4bcccc494d518f55d251aa2a8b4f03728a816a8d90b8259505a9402143a55a00),
(274, '2013-09-30 14:43:35', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x75cc4d0ac2301086e1bbcc5ac4645a8d5d7993302653ad24b6cdcfa2887777e2c6953030f0bcf0bdc0d55ce6c8295b8e34054bde27ce1906e835e2a937465fd675efe6083b1893bc01b43a1f4d67501f7e29d7eb835d91aa103ba5514e38ca16ddb8b1cc356e5a973093b7e3145a11a052c8dd233fcb7f2cdbf20def0f),
(275, '2013-09-30 15:21:26', 0, 'login.php ', 'camefrom=index.php&', '113.249.142.54', 0, '', ''),
(276, '2013-09-30 15:21:37', 0, 'login.php admin', 'camefrom=index.php&', '113.249.142.54', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9a6e6a6a66616c62916a989162906c969a649c9c6a9c91629c9c686c916e629a64ab500),
(277, '2013-09-30 15:21:43', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(278, '2013-09-30 15:21:53', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0xab564a2e2d2ec9cf4d2d2a8e4fcd4dcccc894f4c49294a2d2e56b252323532363637b5b03072282cd44bcecf55d2514a2b0252564a46869666162616c6460608a9e2d2a4acd4e412a06c4909909b0b3423313d15cc2d51aa0500),
(279, '2013-09-30 15:21:56', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x758c310ec2300c45efe219214828844edc2432890b45096963674088bbe3766162fa7aef49ff0da1b1944c953d651c93c7182b31430f9db1f6d439672ef3bc0d25c30686aad383d99f8feee0acd9fd12b7eb8382681551ccfa81375a71e136a582d10f635a9c0a14c170cff494ff525ed31a3e5f),
(280, '2013-09-30 15:22:01', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0xab564a2e2d2ec9cf4d2d2a8e4fcd4dcccc894f4c49294a2d2e56b252323532363637b5b03072282cd44bcecf55d2514a2b0252564a46869666162616c6460608a9e2d2a4acd4e412a06c4909909b0b3423313d15cc2d51aa0500),
(281, '2013-09-30 15:22:06', 1, 'configuration.php', 'gID=12&', '113.249.142.54', 0, '', ''),
(282, '2013-09-30 15:22:10', 1, 'configuration.php', 'gID=12&cID=258&action=edit&', '113.249.142.54', 0, '', ''),
(283, '2013-09-30 15:22:13', 1, 'configuration.php', 'gID=12&cID=258&action=save&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522ace2d29482c2dc950d2512a2e4dcacd2c71f575f4f4890f0972f40b0ef00f0a89af002ab2c4295b09943557aa0500),
(284, '2013-09-30 15:22:13', 1, 'configuration.php', 'gID=12&cID=258&', '113.249.142.54', 0, '', ''),
(285, '2013-09-30 15:22:17', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(286, '2013-09-30 15:22:26', 1, 'mail.php', 'action=preview&', '113.249.142.54', 0, '', 0x6dcc3d0e83300c40e1bb78ae2af25b87a9078984423055ab4688184f88bb938d85e90d9ff476c8c2db52a8f240257dff439aa64accd083d3c6bc1ca27eafeb332f051e30d7961eb40a1e2d1add5dc432fe286f4da378ab288a1b438a62097de3d29ee943f77c9c),
(287, '2013-09-30 15:22:28', 1, 'mail.php', 'action=send_email_to_user&', '113.249.142.54', 0, '', 0x75cc3b0ec2301004d0bb6c8d10f10f271507b1646dec0d04d924f1a74088bb6368a8528d346f342f7035972552ca9622cec1a2f78972860124e3fc2cb566976d3bba25c201a6d46200d6f54a0bcdd9e94fb98e7772a5a9a94a7464aa1c7b345590568d63fbc42bed715dc382de4e73f84e5a81a5a0bb457a94fdb23cd71fbc3f),
(288, '2013-09-30 15:22:29', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '113.249.142.54', 0, '', ''),
(289, '2013-09-30 15:22:46', 1, 'mail.php', 'reset_editor=2&action=set_editor&', '113.249.142.54', 0, '', ''),
(290, '2013-09-30 15:22:46', 1, 'mail.php', '', '113.249.142.54', 0, '', ''),
(291, '2013-09-30 15:23:30', 1, 'configuration.php', 'gID=12&', '113.249.142.54', 0, '', ''),
(292, '2013-09-30 16:14:08', 0, 'login.php ', 'camefrom=configuration.php&gID=5&', '113.249.142.54', 0, '', ''),
(293, '2013-09-30 16:14:15', 0, 'login.php admin', 'camefrom=configuration.php&gID=5&', '113.249.142.54', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9e62649160606e6a9166916c696a6492616c99606e6962666696649891669e6464ab500),
(294, '2013-09-30 16:14:15', 1, 'configuration.php', 'gID=5&', '113.249.142.54', 0, '', ''),
(295, '2013-09-30 16:14:22', 1, 'configuration.php', 'gID=5&cID=135&action=edit&', '113.249.142.54', 0, '', ''),
(296, '2013-09-30 16:14:49', 1, 'configuration.php', 'gID=5&cID=136&action=edit&', '113.249.142.54', 0, '', ''),
(297, '2013-09-30 16:14:59', 1, 'configuration.php', 'gID=5&cID=136&action=save&', '113.249.142.54', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252323151d2512a2e4dcacd2c09f6f00f8f770e72750c718d777476f60ff50b89777175730cf5098907f38222e32b805a8c0d48d25209d46268aa540b00),
(298, '2013-09-30 16:15:00', 1, 'configuration.php', 'gID=5&cID=136&', '113.249.142.54', 0, '', ''),
(299, '2013-09-30 16:15:17', 1, 'configuration.php', 'gID=5&cID=135&action=edit&', '113.249.142.54', 0, '', ''),
(300, '2013-10-08 16:31:19', 0, 'login.php ', 'camefrom=index.php&', '113.249.131.94', 0, '', ''),
(301, '2013-10-08 16:31:25', 0, 'login.php admin', 'camefrom=index.php&', '113.249.131.94', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c62649868626a689c9496926a966968906462986964989a6268626a9264689294ab500),
(302, '2013-10-08 16:31:29', 1, 'configuration.php', 'gID=12&', '113.249.131.94', 0, '', ''),
(303, '2013-10-08 16:31:35', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(304, '2013-10-08 16:31:40', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a199963085702850d0d956a01),
(305, '2013-10-08 16:31:41', 1, 'modules.php', 'set=payment&module=alipay&action=edit&', '113.249.131.94', 0, '', ''),
(306, '2013-10-08 16:34:01', 1, 'modules.php', 'set=payment&module=alipay&action=save&', '113.249.131.94', 0, '', 0x7d915f4f833014c5bf4b9fe728306d476214a551228305d8c30c49c3f89f4ccaa00cd9b2ef6e71beeca1bedcdcdc9cdf39b7b76790b03aaf8abe8d79c56a609cc1cab3360ea16b73bb226e484dc7162d0d4233dc04c00061db6760265311c721be50a93a5ae81069faf3e1304fd897945859f71f642b08067779dd95089d2a15e543db8dfb223deab08445c1d21d973aac4d3f747f4335883186ea525b220d614d95229f9e4b841eca3d7def950481edbefd3d9cdad61420053cdf22fe8d569e1e787e7805fe95bd9bae753d66c979d319911229c330cce37dd5c4e374d44849186b32f17559a414a20e629eb2275ad54dcf6952c66d97f1c79ee777185c66a08b8fd94bcf39abe9b7b05d6070331ba7751ec0e507),
(307, '2013-10-08 16:34:02', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(308, '2013-10-08 16:34:05', 1, 'modules.php', 'set=payment&module=freecharger&', '113.249.131.94', 0, '', ''),
(309, '2013-10-08 16:34:07', 1, 'modules.php', 'set=payment&module=freecharger&action=edit&', '113.249.131.94', 0, '', ''),
(310, '2013-10-08 16:34:09', 1, 'modules.php', 'set=payment&module=freecharger&action=save&', '113.249.131.94', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf53b2aa56f2f57709f5718d0f708cf475f50b89770b727575f6700c72770d8a0f0e710c090d56b252724bcc294e55d2c1a736cadfcf15a8d200bf2aff2017b8b9f19e2e843504fb0785407481d5d6ea28152796a53a959694e4e7c55700c50c0d9550c42a4162664ab500),
(311, '2013-10-08 16:34:11', 1, 'modules.php', 'set=payment&module=freecharger&', '113.249.131.94', 0, '', ''),
(312, '2013-10-08 16:34:13', 1, 'modules.php', 'set=payment&module=paypal&', '113.249.131.94', 0, '', ''),
(313, '2013-10-08 16:34:18', 1, 'modules.php', 'set=payment&module=paypal&action=edit&', '113.249.131.94', 0, '', ''),
(314, '2013-10-08 16:34:23', 1, 'modules.php', 'set=payment&module=paypal&action=save&', '113.249.131.94', 0, '', 0x7d91d16ac23014865f65e4dae92663175e2d36471756932e4d060ea1c4185da136d2d67522befbd2b95d088b5781c3f7fd393fe7888c2bd7f9665fe92677251a1dd18c13154396e0f90c98ecde04c7592ab154291aa1892e6a8b7a016cac52ca204d334a3cab57dbbc7c2a9cd1c587ab9ba0951029f90b30af04994809012c9a7b26b585358d5ddd44fbaab2a53904a577cec00b77e19f058ffcba944d7f1b9e17bf0f0a5c101017ec30c80a982846fe51c2f12917f22c5c5d9b80c43406924558484f3217443121a23b087f03212881abdfffc1025e151570bd5e82a7e06bcde32e33a9f2adaec29778c68cc43faddab6edeff461a78bbe71dbc5c06cf2db655e2e06ad5dd6a60a26d084f9de6335f5197cbd46a71eaaf5a71def9bc695d9979f3e3ca28bd9a1eb3a44a76f),
(315, '2013-10-08 16:34:24', 1, 'modules.php', 'set=payment&module=paypal&', '113.249.131.94', 0, '', ''),
(316, '2013-10-08 16:34:29', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(317, '2013-10-08 16:34:34', 1, 'modules.php', 'set=payment&module=alipay&action=edit&', '113.249.131.94', 0, '', ''),
(318, '2013-10-08 16:34:39', 1, 'modules.php', 'set=payment&module=alipay&action=save&', '113.249.131.94', 0, '', 0x7d915d4f83301885ff4bafe728a0969118456994c8c752d8c50c49c3f84e26655086b8ecbf5b9c37bba8376fde9c3ce79cf4ed09a4ac29ea72e8125eb3069827e005f6c6c5746d6d3dec47d4721db1d230b2a24d084c1075430e16320abb2e2682527574ab43a4e94f87c332659f528767dfbde3ad7030b82b9abe42e8bb56513176fdb42fb3a30e2b58962cdb7169c2da2291ff5baa41c330a0bad256484386a64a2d1f818f050fe5992478c161e8f8af7f0fa78e3d17480d01b131b962e5ed6140a28be15feccdf2edcb312bcedbde8c955819c77199eceb3699e6a3c64aca589b8bafcb63a51473147ac61e69ddb403a76995747dce1f065edc18e0bc007d72cc9f07ce5943bf44ac7e0faeb469d6c0f907),
(319, '2013-10-08 16:34:42', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(320, '2013-10-08 16:36:35', 1, 'modules.php', 'set=payment&module=alipay&action=edit&', '113.249.131.94', 0, '', ''),
(321, '2013-10-08 16:41:21', 1, 'configuration.php', 'gID=12&', '113.249.131.94', 0, '', ''),
(322, '2013-10-08 16:41:25', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '113.249.131.94', 0, '', ''),
(323, '2013-10-08 16:41:45', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '113.249.131.94', 0, '', ''),
(324, '2013-10-08 17:09:08', 0, 'login.php ', 'camefrom=modules.php&set=payment&', '113.249.131.94', 0, '', '');
INSERT INTO `zen_admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(325, '2013-10-08 17:09:18', 0, 'login.php admin', 'camefrom=modules.php&set=payment&', '113.249.131.94', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f926c60669c6a6061649862916c926464666698689290669061686c6e6898606164ab500),
(326, '2013-10-08 17:09:19', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(327, '2013-10-08 17:09:24', 1, 'modules.php', 'set=payment&module=alipay&action=remove&', '113.249.131.94', 0, '', ''),
(328, '2013-10-08 17:09:27', 1, 'modules.php', 'action=removeconfirm&', '113.249.131.94', 0, '', 0xab562a4e2d51b2522a48accc4dcd2b51d251cacd4f29cd49050a25e6640245812245a9b9f965a94ea52525f979f1154019632374d14aa0a8a1b1522d00),
(329, '2013-10-08 17:09:28', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(330, '2013-10-08 17:13:41', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(331, '2013-10-08 17:13:44', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', ''),
(332, '2013-10-08 17:13:44', 1, 'modules.php', 'set=payment&module=&action=edit&', '113.249.131.94', 0, '', ''),
(333, '2013-10-08 17:13:49', 1, 'modules.php', 'set=payment&module=&action=edit&', '113.249.131.94', 0, '', ''),
(334, '2013-10-08 17:13:54', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(335, '2013-10-08 17:13:56', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', ''),
(336, '2013-10-08 17:13:57', 1, 'modules.php', 'set=payment&module=&action=edit&', '113.249.131.94', 0, '', ''),
(337, '2013-10-08 17:14:04', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(338, '2013-10-08 17:14:07', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', ''),
(339, '2013-10-08 17:14:07', 1, 'modules.php', 'set=payment&module=&action=edit&', '113.249.131.94', 0, '', ''),
(340, '2013-10-08 17:14:16', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', ''),
(341, '2013-10-08 17:14:16', 1, 'modules.php', 'set=payment&module=&action=edit&', '113.249.131.94', 0, '', ''),
(342, '2013-10-08 17:14:34', 1, 'categories.php', '', '113.249.131.94', 0, '', ''),
(343, '2013-10-08 17:14:45', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(344, '2013-10-08 17:14:48', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(345, '2013-10-08 17:14:51', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a199962085702850d2d956a01),
(346, '2013-10-08 17:14:58', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(347, '2013-10-08 17:15:10', 1, 'configuration.php', 'gID=12&', '113.249.131.94', 0, '', ''),
(348, '2013-10-08 17:15:14', 1, 'configuration.php', 'gID=12&', '113.249.131.94', 0, '', ''),
(349, '2013-10-08 17:15:23', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(350, '2013-10-08 17:15:26', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a191963085702854d956a01),
(351, '2013-10-08 17:15:35', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(352, '2013-10-08 17:16:08', 1, 'configuration.php', 'gID=12&', '113.249.131.94', 0, '', ''),
(353, '2013-10-08 17:16:20', 1, 'configuration.php', 'gID=12&cID=267&action=edit&', '113.249.131.94', 0, '', ''),
(354, '2013-10-08 17:16:25', 1, 'configuration.php', 'gID=12&cID=267&action=save&', '113.249.131.94', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2524a4bcc294e55d2512a2e4dcacd2c0976f5738977f575f4f4098eaf00ca1a1b6295aa044a191a2bd50200),
(355, '2013-10-08 17:16:25', 1, 'configuration.php', 'gID=12&cID=267&', '113.249.131.94', 0, '', ''),
(356, '2013-10-08 17:16:34', 1, 'modules.php', 'set=payment&', '113.249.131.94', 0, '', ''),
(357, '2013-10-08 17:16:37', 1, 'modules.php', 'set=payment&action=install&', '113.249.131.94', 0, '', 0xab56cacd4f29cd4955b2524accc92c48ac54d251cacc2b2e49ccc9712a2d29c9cf8baf004a991a63085702850d8d956a01),
(358, '2013-10-08 17:16:37', 1, 'modules.php', 'set=payment&module=alipay&action=edit&', '113.249.131.94', 0, '', ''),
(359, '2013-10-08 17:18:21', 1, 'modules.php', 'set=payment&module=alipay&action=save&', '113.249.131.94', 0, '', 0x7d915d4f83301486ff4bafe728a0292c318ad228918fa5b08b199286f19d4ccaa00cd9b2ff6e71deeca2de34cdc9f39cb7e7f40c52d61475397409af59035667e005f6c6c5746d6d3dec47d4721d71a56164459b10ac40d40d3958c828ecba98084ad5d1bd0e91a63f1f0ecb947d490dcf7ef8c05b6130b82b9abe42e854aba818bb7eda97d95187152c4b96edb8b4c3da2291ff1baa41c330a06a6a26d290a1a952e533f0b1e0a1bc27095e71183afedbdfe0d4b1e700a910101b931b569e1e0624ba0aff62ef966f5f975971def6ab588995711c97c9be6e93695e6aaca48cb5b9f8ba3c564a718ea29eb1275a37edc0695a255d9ff3c781177706b82c409f1cf3978173d6d0ef791a13dcd4a6f939105c7e00),
(360, '2013-10-08 17:18:22', 1, 'modules.php', 'set=payment&module=alipay&', '113.249.131.94', 0, '', ''),
(361, '2013-10-08 17:19:30', 1, 'modules.php', 'set=payment&module=alipay&action=edit&', '113.249.131.94', 0, '', ''),
(362, '2013-10-09 11:33:02', 0, 'login.php ', 'camefrom=index.php&', '125.85.135.145', 0, '', ''),
(363, '2013-10-09 11:33:07', 0, 'login.php admin', 'camefrom=index.php&', '125.85.135.145', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9c62616a9a626c62989a996a640c2c2c2d4d22225cdd2d0302dd1d4c2c2dc40a91600),
(364, '2013-10-09 11:33:38', 1, 'modules.php', 'set=payment&', '125.85.135.145', 0, '', ''),
(365, '2013-10-09 11:33:42', 1, 'modules.php', 'set=payment&action=edit&', '125.85.135.145', 0, '', ''),
(366, '2013-10-09 11:33:50', 1, 'modules.php', 'set=payment&action=save&', '125.85.135.145', 0, '', 0x7d905b4f83301886ff4bafe728a02923318ad22891c352d8c50c49d3716cb2510665732efbef82f36617f5ae6d9ee77dbf7e679089a6e4d5d031c94503ec33082277e563ba74d6010e13eaf8de78a471e224ab18d820e98602cc5414f67d4c464a37d1bd0991613eeff7f34cec9446e03e7ce0f56808b8299bbe46e89beba83c76fd695be50713d6b0aa44be91ca84a54392f0b7d4809665417d612c90812c43572a9f5188471eaa3349f48ae3d80bdffe3e4e3d772a500a117131b961d5ed714492abf02ff6ee84ee7599b5946d6fa75aaaed58cbe76ccb5b769ab69a6a1593c571bce4e289f2a61d24cd6ad6f5857c1c64796781cb0cf4ec50bc0c528a867e8d61a6096ede4ed31006b8fc00),
(367, '2013-10-09 11:33:51', 1, 'modules.php', 'set=payment&', '125.85.135.145', 0, '', ''),
(368, '2013-10-09 11:58:36', 0, 'login.php ', 'camefrom=configuration.php&gID=33&', '125.85.135.145', 0, '', ''),
(369, '2013-10-09 11:58:41', 0, 'login.php admin', 'camefrom=configuration.php&gID=33&', '125.85.135.145', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f986866646260689698689292949160626a9c68666c6c9a996a649e6160669c6964ab500),
(370, '2013-10-09 11:58:42', 1, 'configuration.php', 'gID=33&', '125.85.135.145', 0, '', ''),
(371, '2013-10-09 11:58:55', 1, 'configuration.php', 'gID=33&cID=601&action=edit&', '125.85.135.145', 0, '', ''),
(372, '2013-10-09 11:58:59', 1, 'configuration.php', 'gID=33&cID=583&action=edit&', '125.85.135.145', 0, '', ''),
(373, '2013-10-09 11:59:04', 1, 'configuration.php', 'gID=33&cID=583&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a2902523a4ac5a549b99925c1aefef1ae7e8e4e3eae2ef11540492353ac529540294353a55a00),
(374, '2013-10-09 11:59:05', 1, 'configuration.php', 'gID=33&cID=583&', '125.85.135.145', 0, '', ''),
(375, '2013-10-09 12:01:11', 1, 'configuration.php', 'gID=33&cID=601&action=edit&', '125.85.135.145', 0, '', ''),
(376, '2013-10-09 12:01:45', 1, 'configuration.php', 'gID=33&cID=601&action=save&', '125.85.135.145', 0, '', 0x7551cb6ac3400cfc95c5e7bdb409147aefa1101268e8a127a168655bd4de75f7e12494fe7b95d871e8a1173d6656a341fb5d51f0b534256296e061c4ae70f55c89777cb26688c115ca20be0e965aa6cf5032284a9c929dd9049e8fcbdb04d875d6d48cb944767083ad49039360a795eecca8b265aa9d5c76a78b848c48676b228fc2c7cb4c2bc320beb91a30357ecdf24932438f8335cd080a5be32451283e83c6217815c386a7088f735ecd796d4d1754d31aa4eb90da886a9861e9d18de849fd27c648edfd147564869bade9300bd7972434632e50e9d967f873c33bdcb0e788dd0ca7364c828451b7179fca2151940357b6d2ba97bc7fd9c1fbdb660fbbede6035eb770d27f5aaffee7cfca3f3c553fbf),
(377, '2013-10-09 12:01:45', 1, 'configuration.php', 'gID=33&cID=601&', '125.85.135.145', 0, '', ''),
(378, '2013-10-09 14:28:51', 0, 'login.php ', 'camefrom=index.php&', '125.85.135.145', 0, '', ''),
(379, '2013-10-09 14:29:00', 0, 'login.php admin', 'camefrom=index.php&', '125.85.135.145', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f966864996c6e689a68616291696266949c9960669864916a98929a64616c9a6c64ab500),
(380, '2013-10-09 14:29:04', 1, 'configuration.php', 'gID=12&', '125.85.135.145', 0, '', ''),
(381, '2013-10-09 14:29:09', 1, 'configuration.php', 'gID=12&cID=267&action=edit&', '125.85.135.145', 0, '', ''),
(382, '2013-10-09 14:29:14', 1, 'configuration.php', 'gID=12&cID=267&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a2902523a4ac5a549b99925c1ae7e2ef1aebe8e9e3ec1f11540492343ac5295402913a55a00),
(383, '2013-10-09 14:29:14', 1, 'configuration.php', 'gID=12&cID=267&', '125.85.135.145', 0, '', ''),
(384, '2013-10-09 14:29:20', 1, 'configuration.php', 'gID=12&cID=269&action=edit&', '125.85.135.145', 0, '', ''),
(385, '2013-10-09 14:30:15', 1, 'mail.php', '', '125.85.135.145', 0, '', ''),
(386, '2013-10-09 14:30:25', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x458d410e83300c04ffe27355811d9384531f12098560aa568d10849c50ff5e17a9ea657cd81def01a9967dc9b29541727cbc86384d9b94023d301259760e6feb7a4d4b860bcc9b9e1eb0f59d338eb0f947a58e4f49bba6a1329ba8a4a90dd5378d923dda9363a89df1a864e954cbba15ef726a9689557049344663bf64fa3d323325ede830bc3f),
(387, '2013-10-09 14:30:26', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x758dcb0ec2201045ff85b5312d3005baf243481a0a53ad29f6012c8cf1df9d3631aedc9c49e6ce99fb62bea43c47dc5287d18d53e742d83025d632e04228d09a5fd6f5ece7c84e6cd868b48cd7a6d1520b5efda254fa3bfa4ca92d00d21145a86d31554504c3d5c1de96461a4e046c488bd4e5ae78680a0490a03d52cca5da09e2fb480ec2d30d159356966976a11bc6695769e17276fe16f191ff2ff3733982f707),
(388, '2013-10-09 14:30:28', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(389, '2013-10-09 14:34:11', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x558e4b0ec2300c44ef923542a913e7d31507a954e5e320105545d3ac1077c70515c4663cb2fd46f310a9d5759e68a9234de1721b43ce0bd52a7a81a09445e7e074bf1fd33c8983280b8f5e40e78dd34e81fc9d6a8b574a2b5f876652c6a161f4813d68c95ee56e6816bbc2caecffc600aa7da38b4a9f1f0e9db84938d33bd429b93d9568d96b703be04a2406acdc602ab986bc3730da032b92f976f2b0e119a378be00),
(390, '2013-10-09 14:34:21', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x754e490ec2300cfc4bce08b5ced294130fa954657158d4d0d2240784f83b2ea8200e5cecd18c673c77e64aca63c439f518cd69e88df733a6c4764c02e78dd41af6d7ebd68d916d589869ed18d4add24273a8be522af68c2e93da15e5bcec8ab4ad210ca222cc7ddd9546d68126797f190592af8c08dcbd6f2834521373c057a8e6d572146c4358805e0d3a582443532d660c3e19bf3650a2059a12d5a7530b8bdd4b4be9651a46e3fb701a960f44989c8d3b46bce4ff64be4d2fe1f104),
(391, '2013-10-09 14:34:22', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(392, '2013-10-09 14:39:01', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x4d8dd10a83300c45ff25cf63b4a9a9d5a77d8820b5ad6363456cec93ecdf970dc4bd2417ce49ee0ea1f2b6e454784cd93f5ea38fb12466e881d098969cc3dbba5ec392e1027391d503eacebac6195427e23a3d53d8840e9550d9a15a2423d944fd9f45cdf2dfdfd34fb5219280a9f35fa951c7414b7a962935f0fe00),
(393, '2013-10-09 14:46:25', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(394, '2013-10-09 14:46:56', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(395, '2013-10-09 14:47:10', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(396, '2013-10-09 14:47:11', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(397, '2013-10-09 14:47:12', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(398, '2013-10-09 14:47:57', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(399, '2013-10-09 14:48:00', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(400, '2013-10-09 14:49:43', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(401, '2013-10-09 14:52:27', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(402, '2013-10-09 14:52:32', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(403, '2013-10-09 14:52:57', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(404, '2013-10-09 14:53:16', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(405, '2013-10-09 14:53:17', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(406, '2013-10-09 14:54:05', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(407, '2013-10-09 14:54:08', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(408, '2013-10-09 14:54:28', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(409, '2013-10-09 14:54:52', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(410, '2013-10-09 14:54:53', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(411, '2013-10-09 14:55:04', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(412, '2013-10-09 14:55:26', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(413, '2013-10-09 14:56:11', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(414, '2013-10-09 14:57:38', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(415, '2013-10-09 14:58:28', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(416, '2013-10-09 14:59:14', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(417, '2013-10-09 14:59:18', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(418, '2013-10-09 14:59:56', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(419, '2013-10-09 15:00:18', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(420, '2013-10-09 15:00:20', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(421, '2013-10-09 15:01:39', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x4d8dd10a83300c45ff25cf63b4a9a9d5a77d8820b5ad6363456cec93ecdf970dc4bd2417ce49ee0ea1f2b6e454784cd93f5ea38fb12466e881d098969cc3dbba5ec392e1027391d503eacebac6195427e23a3d53d8840e9550d9a15a2423d944fd9f45cdf2dfdfd34fb5219280a9f35fa951c7414b7a962935f0fe00),
(422, '2013-10-09 15:01:42', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x758dcd0e82301084dfa56763684b4be1e48390344b5b14d30af4e7408cefee4262f4e2657732dfccee939892f21c5c4cda0598bc066ba34b89744430ce1ba114bbacebd9cc819cc818717584d156aa5a71567d512ac3dd998cb42f8255b22f92098e9a5bfaab311af03e5cdd1195c60a04430b7ba8ae3e8546d01127bec14259fc0c568f93df4b6840ce606ec13df27f336fcb015e6f),
(423, '2013-10-09 15:01:44', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(424, '2013-10-09 15:02:06', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x458c310e83301004ff727514111b88a1ca4facc3774689b0105ea8107f8fa1a1dad18cb43b850deb9c34c36be2efe459242b403d35c6da77e39cf92ccb33cc891e1473999eccab6b5dedaca9ee846df869584b8dc288108ec5a672c5a39e96219705cbc974fc01),
(425, '2013-10-09 15:02:08', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x75ccb10e02210c80e177e96c8c82a778936f422a053d037247cb608cef2edce2e4d4e6fb9bbec155969c7c61eb134ed12251f1cc30c2a0b43e0dc6a8cbb26c5d4eb08150da1841edcf4773305aed7e89ebf5e19db41a08393061689ada2bbcf9aec8b42a23f5bdc53ac78c64c314fb41031441774ffe29ff515ef31a3e5f),
(426, '2013-10-09 15:03:14', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(427, '2013-10-09 15:03:15', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(428, '2013-10-09 15:03:17', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(429, '2013-10-09 15:03:31', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(430, '2013-10-09 15:03:32', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(431, '2013-10-09 15:04:43', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(432, '2013-10-09 15:04:54', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(433, '2013-10-09 15:05:45', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x75ccb10e02210c80e177e96c8c82a778936f422a053d037247cb608cef2edce2e4d4e6fb9bbec155969c7c61eb134ed12251f1cc30c2a0b43e0dc6a8cbb26c5d4eb08150da1841edcf4773305aed7e89ebf5e19db41a08393061689ada2bbcf9aec8b42a23f5bdc53ac78c64c314fb41031441774ffe29ff515ef31a3e5f),
(434, '2013-10-09 15:05:47', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(435, '2013-10-09 15:06:04', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(436, '2013-10-09 15:06:07', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(437, '2013-10-09 15:06:10', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(438, '2013-10-09 15:06:16', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(439, '2013-10-09 15:06:54', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(440, '2013-10-09 15:06:59', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(441, '2013-10-09 15:07:06', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(442, '2013-10-09 15:07:08', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(443, '2013-10-09 15:07:11', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(444, '2013-10-09 15:07:30', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(445, '2013-10-09 15:07:33', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(446, '2013-10-09 15:07:35', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(447, '2013-10-09 15:07:58', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x458c4b0ec2300c44efe23542d4f9d4ee8a8344aad2c44120a2aa4db342dc1dc386cd1bc9f3c62f48bd1d6b95bdcd52e3fd39c79c77690d267068cce888f0ba6de7b4563841d93526c0813d593278f957ad2f0f4987b6a153c91cbaf75842b76296d0999854aafa39dee427396763e86322fe4a43d60be3a8634c3af3e88cd2322a9d7865ca0ede1f),
(448, '2013-10-09 15:08:01', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x758ccb0ec2201444ff85b531f6f22874e5879034142e5a53ec035818e3bf7bdb8d2b3733c99c9979335f7399136eb9c7e4c6a977216c9833eb9804ce5ba9355cd7f5ece7c44e2c6e641d83c6282d3487cb0fe53a3cd017a2b6ea188cad4a41b455201f6c35da682a257a76373c4a520a676bebb5d94b4da0c4404b63f034532039a930402a5191fa20e9a22ed3ec421fc769bfa1c095e2fc3de1b3fc0fcb6b39c0e70b),
(449, '2013-10-09 15:08:05', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x758ccb0ec2201444ff85b531f6f22874e5879034142e5a53ec035818e3bf7bdb8d2b3733c99c9979335f7399136eb9c7e4c6a977216c9833eb9804ce5ba9355cd7f5ece7c44e2c6e641d83c6282d3487cb0fe53a3cd017a2b6ea188cad4a41b455201f6c35da682a257a76373c4a520a676bebb5d94b4da0c4404b63f034532039a930402a5191fa20e9a22ed3ec421fc769bfa1c095e2fc3de1b3fc0fcb6b39c0e70b),
(450, '2013-10-09 15:47:47', 0, 'login.php ', 'camefrom=index.php&', '125.85.135.145', 0, '', ''),
(451, '2013-10-09 15:47:55', 0, 'login.php admin', 'camefrom=index.php&', '125.85.135.145', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f906294906a689a9a9669606c9e6a606a69606066906466949e666a666c68666c64ab500),
(452, '2013-10-09 15:50:12', 1, 'mail.php', '', '125.85.135.145', 0, '', ''),
(453, '2013-10-09 15:50:20', 1, 'mail.php', 'action=preview&', '125.85.135.145', 0, '', 0x45ccc10a83301084e177d9b39436a9367aea9bc836bb11c52066f4547c7783821e86fff0c1fcc9af58a6a809ad46eec796459202d45069acfd94ce99ef3c3ffc14a9a090721a32afba726f67cdf326acbf41fd923530e41a5832c6fcc89d1e2808c23891b61d),
(454, '2013-10-09 15:50:22', 1, 'mail.php', 'action=send_email_to_user&', '125.85.135.145', 0, '', 0x75ccc10ac2301004d07fc959449356634ffe4958b31bad24a6cd260711ffddb5829e3c0c03f3601eca37ae3951614709c6e800b110b31a54af8dd9f7d6eae33caf7d4e6aa542911a94de1e76b6b3466f7ec4ed74255f4503307ec38082491ee14c0b220704fea0509b620674618c6f96016a057f4974abffc77a9f1678be00),
(455, '2013-10-09 15:50:23', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(456, '2013-10-09 15:51:08', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(457, '2013-10-09 15:51:27', 1, 'testEmail.php', '', '125.85.135.145', 0, '', ''),
(458, '2013-10-09 15:51:35', 1, 'mail.php', 'mail_sent_to=523375882@qq.com&recip_count=1&', '125.85.135.145', 0, '', ''),
(459, '2013-10-09 15:51:55', 1, 'developers_tool_kit.php', '', '125.85.135.145', 0, '', ''),
(460, '2013-10-09 15:52:08', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2528a29353335370092c666a931a526a9062940769299714ca9b98559aa928e5255597c5a664e6a3150ad3112b7a4b220152864a8540b00),
(461, '2013-10-09 18:52:55', 0, 'login.php ', 'camefrom=index.php&', '125.85.135.145', 0, '', ''),
(462, '2013-10-09 18:53:04', 0, 'login.php admin', 'camefrom=index.php&', '125.85.135.145', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9862966e6968606c66626c969c6c96686a669694949268616a94696698916e6894ab500),
(463, '2013-10-09 18:53:10', 1, 'ezpages.php', '', '125.85.135.145', 0, '', ''),
(464, '2013-10-09 18:53:20', 1, 'define_pages_editor.php', '', '125.85.135.145', 0, '', ''),
(465, '2013-10-09 18:53:25', 1, 'define_pages_editor.php', 'define_it=4&action=new_page&', '125.85.135.145', 0, '', ''),
(466, '2013-10-09 18:53:43', 1, 'define_pages_editor.php', 'lngdir=schinese&filename=define_main_page.php&action=save&', '125.85.135.145', 0, '', 0xab564acbcc498d4fcecf2b49cd2b2956b252b2c9cc4d57282e4ab68d518ad1cfcc4d4c4f2d8ed14fce4ad2cb2a488f515248cc2901c900e5ec946a01),
(467, '2013-10-09 18:53:44', 1, 'define_pages_editor.php', '', '125.85.135.145', 0, '', ''),
(468, '2013-10-09 18:54:12', 1, 'define_pages_editor.php', 'define_it=4&action=new_page&', '125.85.135.145', 0, '', ''),
(469, '2013-10-09 18:54:18', 1, 'define_pages_editor.php', 'lngdir=schinese&filename=define_main_page.php&action=save&', '125.85.135.145', 0, '', 0xab564acbcc498d4fcecf2b49cd2b2956b252b2c9cc4d57282e4ab68d518ad12fcec82f88d1cfcc4d4c4f2d8ed14fce4ad2cb2a488f515248cc2901c90355d829d50200),
(470, '2013-10-09 18:54:18', 1, 'define_pages_editor.php', '', '125.85.135.145', 0, '', ''),
(471, '2013-10-09 18:56:06', 1, 'layout_controller.php', '', '125.85.135.145', 0, '', ''),
(472, '2013-10-09 18:56:10', 1, 'layout_controller.php', 'page=&cID=125&', '125.85.135.145', 0, '', ''),
(473, '2013-10-09 18:56:15', 1, 'layout_controller.php', 'page=&cID=125&action=edit&', '125.85.135.145', 0, '', ''),
(474, '2013-10-09 18:56:17', 1, 'layout_controller.php', 'page=&cID=125&action=save&layout_box_name=banner_box2.php&', '125.85.135.145', 0, '', 0xab56ca49accc2f2d894fcaaf882f2e492c292d56b2523250d24116cfc94f4e2cc9cccf03ca18a2ca14e71795c4e717a5a41661ea42c8c51767e6a5e7a4625102b61059ba1600),
(475, '2013-10-09 18:56:18', 1, 'layout_controller.php', 'page=&cID=125&', '125.85.135.145', 0, '', ''),
(476, '2013-10-09 18:56:42', 1, 'configuration.php', 'gID=3&', '125.85.135.145', 0, '', ''),
(477, '2013-10-09 18:57:12', 1, 'configuration.php', 'gID=3&cID=57&action=edit&', '125.85.135.145', 0, '', ''),
(478, '2013-10-09 18:57:16', 1, 'configuration.php', 'gID=3&cID=57&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523253d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f0e7075f674f4890f08f27709750e098ef7f473718d88af006a3036214547255087a1a1522d00),
(479, '2013-10-09 18:57:16', 1, 'configuration.php', 'gID=3&cID=57&', '125.85.135.145', 0, '', ''),
(480, '2013-10-09 18:57:18', 1, 'configuration.php', 'gID=3&cID=57&action=edit&', '125.85.135.145', 0, '', ''),
(481, '2013-10-09 18:57:21', 1, 'configuration.php', 'gID=3&cID=57&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f0e7075f674f4890f08f27709750e098ef7f473718d88af006a303424454725488791522d00),
(482, '2013-10-09 18:57:21', 1, 'configuration.php', 'gID=3&cID=57&', '125.85.135.145', 0, '', ''),
(483, '2013-10-09 18:57:22', 1, 'configuration.php', 'gID=3&cID=58&action=edit&', '125.85.135.145', 0, '', ''),
(484, '2013-10-09 18:57:26', 1, 'configuration.php', 'gID=3&cID=58&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f0d70f6f7f5f4738f0f08f27709750e098eaf00aa35b62052712550b1a1b1522d00),
(485, '2013-10-09 18:57:26', 1, 'configuration.php', 'gID=3&cID=58&', '125.85.135.145', 0, '', ''),
(486, '2013-10-09 18:57:28', 1, 'configuration.php', 'gID=3&cID=60&action=edit&', '125.85.135.145', 0, '', ''),
(487, '2013-10-09 18:57:30', 1, 'configuration.php', 'gID=3&cID=60&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f08f27709750e098ef7730d8faf002a333624acae12a8ced04ca91600),
(488, '2013-10-09 18:57:30', 1, 'configuration.php', 'gID=3&cID=60&', '125.85.135.145', 0, '', ''),
(489, '2013-10-09 18:57:31', 1, 'configuration.php', 'gID=3&cID=62&action=edit&', '125.85.135.145', 0, '', ''),
(490, '2013-10-09 18:57:31', 1, 'configuration.php', 'gID=3&cID=62&action=edit&', '125.85.135.145', 0, '', ''),
(491, '2013-10-09 18:57:33', 1, 'configuration.php', 'gID=3&cID=62&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f08f27709750e098e77f4f189af002a33b620acae12a8ce42a91600),
(492, '2013-10-09 18:57:33', 1, 'configuration.php', 'gID=3&cID=62&', '125.85.135.145', 0, '', ''),
(493, '2013-10-09 18:57:34', 1, 'configuration.php', 'gID=3&cID=63&action=edit&', '125.85.135.145', 0, '', ''),
(494, '2013-10-09 18:57:34', 1, 'configuration.php', 'gID=3&cID=63&action=edit&', '125.85.135.145', 0, '', ''),
(495, '2013-10-09 18:57:36', 1, 'configuration.php', 'gID=3&cID=63&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f08f27709750e098ef7f10c0ef1f4738faf002a35b2204e6d2550ada1b1522d00),
(496, '2013-10-09 18:57:36', 1, 'configuration.php', 'gID=3&cID=63&', '125.85.135.145', 0, '', ''),
(497, '2013-10-09 18:57:37', 1, 'configuration.php', 'gID=3&cID=64&action=edit&', '125.85.135.145', 0, '', ''),
(498, '2013-10-09 18:57:37', 1, 'configuration.php', 'gID=3&cID=64&action=edit&', '125.85.135.145', 0, '', ''),
(499, '2013-10-09 18:57:39', 1, 'configuration.php', 'gID=3&cID=64&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c77720d0e0976f5f1710d0a8eaf00aa323626a8ac12a8ccd058a91600),
(500, '2013-10-09 18:57:39', 1, 'configuration.php', 'gID=3&cID=64&', '125.85.135.145', 0, '', ''),
(501, '2013-10-09 18:57:42', 1, 'configuration.php', 'gID=3&cID=75&action=edit&', '125.85.135.145', 0, '', ''),
(502, '2013-10-09 18:57:45', 1, 'configuration.php', 'gID=3&cID=61&action=edit&', '125.85.135.145', 0, '', ''),
(503, '2013-10-09 18:57:47', 1, 'configuration.php', 'gID=3&cID=61&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252b254d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f08f27709750e098e7773750c090d72754188540035191b93aaab12a8cbd044a91600),
(504, '2013-10-09 18:57:48', 1, 'configuration.php', 'gID=3&cID=61&', '125.85.135.145', 0, '', ''),
(505, '2013-10-09 18:57:50', 1, 'configuration.php', 'gID=3&cID=80&action=edit&', '125.85.135.145', 0, '', ''),
(506, '2013-10-09 18:58:35', 1, 'configuration.php', 'gID=3&cID=55&action=edit&', '125.85.135.145', 0, '', ''),
(507, '2013-10-09 18:58:38', 1, 'configuration.php', 'gID=3&cID=55&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523253d2512a2e4dcacd2cf1758c8877f10c0ef0718c8cf7730d8f0f08f27709750e098eaf002a333624acae12a8ced048a91600),
(508, '2013-10-09 18:58:38', 1, 'configuration.php', 'gID=3&cID=55&', '125.85.135.145', 0, '', ''),
(509, '2013-10-09 18:58:41', 1, 'configuration.php', 'gID=3&cID=57&action=edit&', '125.85.135.145', 0, '', ''),
(510, '2013-10-09 18:58:43', 1, 'configuration.php', 'gID=3&cID=56&action=edit&', '125.85.135.145', 0, '', ''),
(511, '2013-10-09 18:58:46', 1, 'configuration.php', 'gID=3&cID=56&action=save&', '125.85.135.145', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523253d2512a2e4dcacd2cf1758c8877f10c0ef0718c8c0f76750c72f6880f720d0ef509098e7773750c090d727589af00ea303224494b25508ba1a1522d00),
(512, '2013-10-09 18:58:46', 1, 'configuration.php', 'gID=3&cID=56&', '125.85.135.145', 0, '', ''),
(513, '2013-10-09 19:10:48', 0, 'login.php ', 'camefrom=index.php&', '112.90.78.25', 0, '', ''),
(514, '2013-10-09 19:10:49', 0, 'password_forgotten.php ', '', '112.90.78.25', 0, '', ''),
(515, '2013-10-09 19:24:03', 0, 'login.php ', 'camefrom=index.php&', '125.87.25.207', 0, '', ''),
(516, '2013-10-09 19:26:04', 0, 'login.php ', 'camefrom=index.php&', '125.87.25.207', 0, '', ''),
(517, '2013-10-09 19:55:25', 0, 'login.php ', 'camefrom=index.php&', '125.87.25.207', 0, '', ''),
(518, '2013-10-10 10:35:40', 0, 'login.php ', 'camefrom=index.php&', '125.85.128.105', 0, '', ''),
(519, '2013-10-10 10:35:44', 0, 'login.php admin', 'camefrom=index.php&', '125.85.128.105', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f996a649296696160666464646a9a666e64996a6264969898989692696294989894ab500),
(520, '2013-10-10 10:43:58', 1, 'configuration.php', 'gID=1&', '125.85.128.105', 0, '', ''),
(521, '2013-10-10 10:44:11', 1, 'configuration.php', 'gID=5&', '125.85.128.105', 0, '', ''),
(522, '2013-10-10 10:44:22', 1, 'configuration.php', 'gID=5&cID=138&action=edit&', '125.85.128.105', 0, '', ''),
(523, '2013-10-10 10:44:42', 1, 'configuration.php', 'gID=11&', '125.85.128.105', 0, '', ''),
(524, '2013-10-10 10:44:45', 1, 'configuration.php', 'gID=11&cID=464&action=edit&', '125.85.128.105', 0, '', ''),
(525, '2013-10-10 10:44:48', 1, 'configuration.php', 'gID=11&cID=464&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2524a4bcc294e55d2512a2e4dcacd2c71f10c0ef0718c8c0f08f20c73748e8c77f6f773f10cf1f4f70b8eaf002a36342746652548a591522d00),
(526, '2013-10-10 10:44:48', 1, 'configuration.php', 'gID=11&cID=464&', '125.85.128.105', 0, '', ''),
(527, '2013-10-10 10:44:49', 1, 'configuration.php', 'gID=11&cID=463&action=edit&', '125.85.128.105', 0, '', ''),
(528, '2013-10-10 10:44:51', 1, 'configuration.php', 'gID=11&cID=463&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a2902523a4ac5a549b999252e9ec1013e8e91f1cefe7e2e9e219efe7ec1f1fe7ef1ce1eaecedefea121f11540f54696c4aaae04aa363456aa0500),
(529, '2013-10-10 10:44:51', 1, 'configuration.php', 'gID=11&cID=463&', '125.85.128.105', 0, '', ''),
(530, '2013-10-10 10:44:52', 1, 'configuration.php', 'gID=11&cID=463&action=edit&', '125.85.128.105', 0, '', ''),
(531, '2013-10-10 10:44:54', 1, 'configuration.php', 'gID=11&cID=463&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2524a4bcc294e55d2512a2e4dcacd2c71f10c0ef0718c8c77f6f773f10cf1f4f70b8ef7f78b77f67075f6f60f0d89af006ab02456712550b1b9522d00),
(532, '2013-10-10 10:44:54', 1, 'configuration.php', 'gID=11&cID=463&', '125.85.128.105', 0, '', ''),
(533, '2013-10-10 10:46:51', 1, 'configuration.php', 'gID=5&', '125.85.128.105', 0, '', ''),
(534, '2013-10-10 10:47:05', 1, 'configuration.php', 'gID=5&cID=131&action=edit&', '125.85.128.105', 0, '', ''),
(535, '2013-10-10 10:47:07', 1, 'configuration.php', 'gID=5&cID=131&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2524a4bcc294e55d2512a2e4dcacd2c717476f60ff50b8977f1778aaf00ca1a5b6095aa044a9929d50200),
(536, '2013-10-10 10:47:07', 1, 'configuration.php', 'gID=5&cID=131&', '125.85.128.105', 0, '', ''),
(537, '2013-10-10 11:38:04', 0, 'login.php ', 'camefrom=index.php&', '125.85.128.105', 0, '', ''),
(538, '2013-10-10 11:38:11', 0, 'login.php kk@zzlkk.com', 'camefrom=index.php&', '125.85.128.105', 0, '', 0x0dc8310e80200c00c0bf743606a184e8e44f4c69212115589c30fe5d6ebc17486a6957a39ae000d5738c5b75e55e6101e2a7f4365f7adc4dca1b058e4eb230610a869cf5d1a0cdde227c3f),
(539, '2013-10-10 11:38:19', 0, 'login.php admin', 'camefrom=index.php&', '125.85.128.105', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9499606a9698689e6c949c6296929c98926a9e60689c646a64906264669a646264ab500),
(540, '2013-10-10 11:38:22', 1, 'configuration.php', 'gID=12&', '125.85.128.105', 0, '', ''),
(541, '2013-10-10 11:38:28', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '125.85.128.105', 0, '', ''),
(542, '2013-10-10 11:38:55', 1, 'configuration.php', 'gID=12&cID=271&action=edit&', '125.85.128.105', 0, '', ''),
(543, '2013-10-10 11:39:06', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '125.85.128.105', 0, '', ''),
(544, '2013-10-10 11:43:36', 1, 'configuration.php', 'gID=12&cID=270&action=edit&', '125.85.128.105', 0, '', ''),
(545, '2013-10-10 11:43:38', 1, 'configuration.php', 'gID=12&cID=270&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522acf2fcf2f48cd4cc974303433d64bcecf55d2512a2e4dcacd2c090ef10f728df70ff7730d8a77f575f4f48977747109720d0e8eaf00ea33312042612550a191522d00),
(546, '2013-10-10 11:43:38', 1, 'configuration.php', 'gID=12&cID=270&', '125.85.128.105', 0, '', ''),
(547, '2013-10-10 11:43:39', 1, 'configuration.php', 'gID=12&cID=271&action=edit&', '125.85.128.105', 0, '', ''),
(548, '2013-10-10 11:43:40', 1, 'configuration.php', 'gID=12&cID=271&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522acf2fcf2f48cd4cc974303433d64bcecf55d2512a2e4dcacd2c71f575f4f489770bf2f78daf002a3436c0265309943153aa0500),
(549, '2013-10-10 11:43:40', 1, 'configuration.php', 'gID=12&cID=271&', '125.85.128.105', 0, '', ''),
(550, '2013-10-10 11:43:44', 1, 'configuration.php', 'gID=12&cID=259&action=edit&', '125.85.128.105', 0, '', ''),
(551, '2013-10-10 11:43:46', 1, 'configuration.php', 'gID=12&cID=259&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522acf2fcf2f48cd4cc974303433d64bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18807f19cfc23e22b809a0c2d09a9aa04aa3257aa0500),
(552, '2013-10-10 11:43:46', 1, 'configuration.php', 'gID=12&cID=259&', '125.85.128.105', 0, '', ''),
(553, '2013-10-10 11:43:48', 1, 'configuration.php', 'gID=12&cID=260&action=edit&', '125.85.128.105', 0, '', ''),
(554, '2013-10-10 11:43:52', 1, 'configuration.php', 'gID=12&cID=260&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a48cd4cc92ccf2fcf57d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df1880f700c0e0ef70f7289af00aad63534343023a8b212a4d2c8dc5ca91600),
(555, '2013-10-10 11:43:53', 1, 'configuration.php', 'gID=12&cID=260&', '125.85.128.105', 0, '', ''),
(556, '2013-10-10 11:43:54', 1, 'configuration.php', 'gID=12&cID=261&action=edit&', '125.85.128.105', 0, '', ''),
(557, '2013-10-10 11:43:58', 1, 'configuration.php', 'gID=12&cID=261&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522ace2d29d0333433d64bcecf55d2512a2e4dcacd2c71f575f4f4890ff60d09700c0df18887f05c83c25c83e22b807a8c0c895159095469a6540b00),
(558, '2013-10-10 11:43:59', 1, 'configuration.php', 'gID=12&cID=261&', '125.85.128.105', 0, '', ''),
(559, '2013-10-10 11:44:11', 1, 'configuration.php', 'gID=5&', '125.85.128.105', 0, '', ''),
(560, '2013-10-10 11:44:13', 1, 'configuration.php', 'gID=5&cID=135&action=edit&', '125.85.128.105', 0, '', ''),
(561, '2013-10-10 11:44:16', 1, 'configuration.php', 'gID=5&cID=135&action=save&', '125.85.128.105', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2522a2902523a4ac5a549b999258ececefea17e21f1c1218e21aef12e418ee1f19e7e9e219e8e3e408e7f808b7fb85f7c055093b129495a2a815a0c4d956a01),
(562, '2013-10-10 11:44:16', 1, 'configuration.php', 'gID=5&cID=135&', '125.85.128.105', 0, '', ''),
(563, '2013-10-10 11:44:18', 1, 'configuration.php', 'gID=5&cID=134&action=edit&', '125.85.128.105', 0, '', ''),
(564, '2013-10-10 13:55:25', 0, 'login.php ', 'camefrom=index.php&', '112.90.78.22', 0, '', ''),
(565, '2013-10-10 13:55:29', 0, 'login.php ', 'camefrom=index.php&', '101.226.89.61', 0, '', ''),
(566, '2013-10-10 13:55:29', 0, 'login.php ', 'camefrom=index.php&', '101.226.89.64', 0, '', ''),
(567, '2013-10-10 13:55:29', 0, 'login.php ', 'camefrom=index.php&', '101.226.89.69', 0, '', ''),
(568, '2013-10-10 13:55:52', 0, 'password_forgotten.php ', '', '112.90.78.22', 0, '', ''),
(569, '2013-10-10 13:57:08', 0, 'password_forgotten.php ', '', '101.226.89.69', 0, '', ''),
(570, '2013-10-10 13:57:30', 0, 'password_forgotten.php ', '', '101.226.89.64', 0, '', ''),
(571, '2013-10-10 13:58:49', 0, 'password_forgotten.php ', '', '101.226.89.61', 0, '', ''),
(572, '2013-10-11 16:58:32', 0, 'login.php ', 'camefrom=index.php&', '113.249.131.238', 0, '', ''),
(573, '2013-10-11 16:58:38', 0, 'login.php admin', 'camefrom=index.php&', '113.249.131.238', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f946668606a9a6c606a686669626462616862649060629c946402e8867a4540b00),
(574, '2013-10-11 16:58:50', 1, 'developers_tool_kit.php', '', '113.249.131.238', 0, '', ''),
(575, '2013-10-11 16:58:56', 1, 'developers_tool_kit.php', 'action=locate_configuration&', '113.249.131.238', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b252f275f47155d251aa2a8b4fcbcc492d068a182ad50200),
(576, '2013-10-17 13:12:34', 0, 'login.php ', 'camefrom=index.php&', '125.85.137.106', 0, '', ''),
(577, '2013-10-17 13:16:24', 0, 'login.php ', 'camefrom=index.php&', '125.85.137.106', 0, '', ''),
(578, '2013-10-17 13:16:32', 0, 'login.php admin', 'camefrom=index.php&', '125.85.137.106', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f96996e616a6c9e6169649e6a92689966906464989c966692906a64666c6a916694ab500),
(579, '2013-10-17 13:16:42', 1, 'store_manager.php', '', '125.85.137.106', 0, '', ''),
(580, '2013-10-17 13:16:51', 1, 'developers_tool_kit.php', '', '125.85.137.106', 0, '', ''),
(581, '2013-10-17 13:17:04', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '125.85.137.106', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2520af1f4758df70f0d51d251aa2a8b4fcbcc492d068a1a21714b2a0b528142864ab500),
(582, '2013-10-21 18:35:54', 0, 'login.php ', 'camefrom=index.php&', '113.249.149.69', 0, '', ''),
(583, '2013-10-21 18:36:00', 0, 'login.php admin', 'camefrom=index.php&', '113.249.149.69', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f929a9464616966929a9e6e626c60669c969c996864926a649262946a9a6c629894ab500),
(584, '2013-10-21 18:36:14', 1, 'configuration.php', 'gID=19&', '113.249.149.69', 0, '', ''),
(585, '2013-10-21 18:36:25', 1, 'configuration.php', 'gID=19&cID=429&action=edit&', '113.249.149.69', 0, '', ''),
(586, '2013-10-21 18:36:40', 1, 'configuration.php', 'gID=19&cID=429&action=save&', '113.249.149.69', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523254d2512a2e4dcacd2c71760c7175f70ff2740d8e0f0e710c0a89f775f4f48baf00aa313222a0a812a8c85ca91600),
(587, '2013-10-21 18:36:40', 1, 'configuration.php', 'gID=19&cID=429&', '113.249.149.69', 0, '', ''),
(588, '2013-10-21 18:36:58', 1, 'configuration.php', 'gID=19&cID=429&action=edit&', '113.249.149.69', 0, '', ''),
(589, '2013-10-21 18:37:08', 1, 'configuration.php', 'gID=19&cID=429&action=save&', '113.249.149.69', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b252328c373457d2512a2e4dcacd2c71760c7175f70ff2740d8e0f0e710c0a89f775f4f48baf002a333224a0a812649681522d00),
(590, '2013-10-21 18:37:09', 1, 'configuration.php', 'gID=19&cID=429&', '113.249.149.69', 0, '', ''),
(591, '2013-10-21 18:37:20', 1, 'configuration.php', 'gID=19&cID=430&action=edit&', '113.249.149.69', 0, '', ''),
(592, '2013-10-21 18:37:25', 1, 'configuration.php', 'gID=19&cID=428&action=edit&', '113.249.149.69', 0, '', ''),
(593, '2013-10-21 18:37:35', 1, 'configuration.php', 'gID=19&cID=429&action=edit&', '113.249.149.69', 0, '', ''),
(594, '2013-10-21 18:37:49', 1, 'configuration.php', 'gID=19&cID=429&action=save&', '113.249.149.69', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b25232883754d2512a2e4dcacd2c71760c7175f70ff2740d8e0f0e710c0a89f775f4f48baf00aad23534343023a0ae12a4cec8d250a91600),
(595, '2013-10-21 18:37:49', 1, 'configuration.php', 'gID=19&cID=429&', '113.249.149.69', 0, '', ''),
(596, '2013-10-21 18:38:29', 1, 'configuration.php', 'gID=19&cID=429&action=edit&', '113.249.149.69', 0, '', ''),
(597, '2013-10-21 18:38:33', 1, 'configuration.php', 'gID=19&cID=429&action=save&', '113.249.149.69', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2523254d2512a2e4dcacd2c71760c7175f70ff2740d8e0f0e710c0a89f775f4f48baf00aa313223a0a812649099522d00),
(598, '2013-10-21 18:38:33', 1, 'configuration.php', 'gID=19&cID=429&', '113.249.149.69', 0, '', ''),
(599, '2013-10-21 18:39:08', 1, 'configuration.php', 'gID=19&cID=445&action=edit&', '113.249.149.69', 0, '', ''),
(600, '2013-10-25 11:40:16', 0, 'login.php ', 'camefrom=index.php&', '113.249.151.127', 0, '', ''),
(601, '2013-10-25 11:40:24', 0, 'login.php admin', 'camefrom=index.php&', '113.249.151.127', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f989968616a669a686c9a996660629c6a6266689e626464666464986161696a6064ab500),
(602, '2013-10-25 11:40:36', 0, 'login.php admin', 'camefrom=index.php&', '113.249.151.127', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f989968616a669a686c9a996660629c6a6266689e626464666464986161696a6064ab500),
(603, '2013-10-25 11:40:46', 1, 'options_name_manager.php', '', '113.249.151.127', 0, '', ''),
(604, '2013-10-25 11:40:58', 1, 'login.php', 'camefrom=index.php&', '113.249.151.127', 0, '', ''),
(605, '2013-10-26 14:27:28', 0, 'login.php ', 'camefrom=index.php&', '113.249.132.213', 0, '', ''),
(606, '2013-10-26 14:27:56', 0, 'login.php admin', 'camefrom=index.php&', '113.249.132.213', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9494996e6692626c626694926a9c906e606c916e61629c986c6c6491686a946864ab500),
(607, '2013-10-26 14:28:04', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(608, '2013-10-26 14:28:08', 1, 'categories.php', 'cPath=1&', '113.249.132.213', 0, '', ''),
(609, '2013-10-26 14:28:13', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=17&cPath=1&', '113.249.132.213', 0, '', ''),
(610, '2013-10-26 14:28:18', 1, 'categories.php', 'cPath=1&page=0&', '113.249.132.213', 0, '', ''),
(611, '2013-10-26 14:28:26', 1, 'categories.php', 'action=setflag_categories&flag=0&cID=17&cPath=1&', '113.249.132.213', 0, '', ''),
(612, '2013-10-26 14:28:30', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(613, '2013-10-26 14:28:32', 1, 'categories.php', 'cPath=2&', '113.249.132.213', 0, '', ''),
(614, '2013-10-26 14:28:39', 1, 'categories.php', 'cPath=2_19&', '113.249.132.213', 0, '', ''),
(615, '2013-10-26 14:28:42', 1, 'categories.php', 'cPath=2&', '113.249.132.213', 0, '', ''),
(616, '2013-10-26 14:28:45', 1, 'categories.php', 'cPath=2&cID=19&action=edit_category&', '113.249.132.213', 0, '', ''),
(617, '2013-10-26 14:32:48', 1, 'developers_tool_kit.php', '', '113.249.132.213', 0, '', ''),
(618, '2013-10-26 14:32:57', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2524a4e2c494dcf2fca4c2d76cecf2b49cd2b51d251aa2a8b4fcbcc492d064a1b21714b2a0b528142864ab500),
(619, '2013-10-26 14:34:45', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272f50b098a8c77f575f4f48977747109720d0e8e770d0af20f52d251aa2a8b4fcbcc492d062a3342e2965416a402850c956a01),
(620, '2013-10-26 14:37:59', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2524a4e2c494dcf2fca4c2dd62dc92fd0cdc92c2e51d251aa2a8b4fcbcc492d062a3042e2965416a402850c956a01),
(621, '2013-10-26 14:53:45', 1, 'layout_controller.php', '', '113.249.132.213', 0, '', ''),
(622, '2013-10-26 14:54:35', 1, 'developers_tool_kit.php', '', '113.249.132.213', 0, '', ''),
(623, '2013-10-26 14:54:41', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b2522a29c8894f4e2c494dcf2fca4c2d56d251aa2a8b4fcbcc0132ad948c90b8259505a9402143a55a00),
(624, '2013-10-26 15:25:55', 0, 'login.php ', 'camefrom=categories.php&', '113.249.132.213', 0, '', ''),
(625, '2013-10-26 15:26:03', 0, 'login.php admin', 'camefrom=categories.php&', '113.249.132.213', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f906e6864906064989490666c606494616a9c6491606a6a616c6896969c6c996964ab500),
(626, '2013-10-26 15:26:04', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(627, '2013-10-26 15:26:17', 1, 'categories.php', 'cPath=&cID=1&action=edit_category&', '113.249.132.213', 0, '', ''),
(628, '2013-10-26 15:26:31', 1, 'categories.php', 'action=update_category&cPath=&', '113.249.132.213', 0, '', 0x5590cb8ec3200c457fa5623da371213cd26f8984083811521e15218baaeabf8f1d75a6ed065d8eaf0dbe771143c5712d19379f93b888b3f87a674b98515cee4252a9dbad33b1db1b1c8c787cd8126eb1e46bcdebf2721b793eb31ba9c7a804a487b6ef76dd4043b3da98feb471ca1231ae797fa3db87010e1d91a769457e65698eb12a90968ab551c8dcd05b0a80ce7690cc1dd87fa225f2fce4e8ec9bf6e09277c8f3e8532ef4dfd736ddcf6706790e23fa392c7b98c828b88b49c2092ba52380d0b696ead792b03c432cb8d59263f5f576c5270b291d571fa6e98848bb963f2f039cbe4fbc0568ce44724abd062e01e560a3edc5e317),
(629, '2013-10-26 15:26:31', 1, 'categories.php', 'action=edit_category&cPath=&cID=1&', '113.249.132.213', 0, '', ''),
(630, '2013-10-26 15:26:39', 1, 'categories.php', 'cPath=&cID=1&', '113.249.132.213', 0, '', ''),
(631, '2013-10-26 15:26:58', 1, 'categories.php', 'cPath=3&', '113.249.132.213', 0, '', ''),
(632, '2013-10-26 15:27:03', 1, 'categories.php', 'cPath=3&cID=10&action=edit_category&', '113.249.132.213', 0, '', ''),
(633, '2013-10-26 15:27:09', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(634, '2013-10-26 15:27:13', 1, 'categories.php', 'cPath=1&', '113.249.132.213', 0, '', ''),
(635, '2013-10-26 15:27:22', 1, 'categories.php', 'cPath=1&cID=17&action=edit_category&', '113.249.132.213', 0, '', ''),
(636, '2013-10-26 15:29:22', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(637, '2013-10-26 15:29:26', 1, 'categories.php', 'cPath=2&', '113.249.132.213', 0, '', ''),
(638, '2013-10-26 15:31:53', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(639, '2013-10-26 15:31:57', 1, 'categories.php', 'cPath=2&', '113.249.132.213', 0, '', ''),
(640, '2013-10-26 15:31:59', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(641, '2013-10-26 15:32:03', 1, 'categories.php', 'cPath=&cID=2&action=edit_category&', '113.249.132.213', 0, '', ''),
(642, '2013-10-26 15:32:07', 1, 'categories.php', 'action=update_category&cPath=&', '113.249.132.213', 0, '', 0x558f490ac3300c45af52b42e44199a89d25ec4609c5809866640b11725e4ee95a19076239be7f7656987de781a1776b46967a1850caebf6c361341bb0b6e41857a2807150a1a4a38fe344b5bcf6ef56e994fbb416c542833927a2bb0907b97d36f171572c4ecdef145258fef21566f5215aa0a3bc965390a4153c73ae4926eeaf85ad645ec9a56cf388a9b466d1dcbb7e7502af95fc54d66243d9939989788105391587a91972501056d0b7bbdb025fe02a6cdb3ebbdf6ef354a291c1f),
(643, '2013-10-26 15:32:08', 1, 'categories.php', 'cPath=&cID=2&', '113.249.132.213', 0, '', ''),
(644, '2013-10-26 15:32:33', 1, 'categories.php', 'cPath=2&', '113.249.132.213', 0, '', ''),
(645, '2013-10-26 15:32:37', 1, 'categories.php', 'cPath=2&cID=19&action=edit_category&', '113.249.132.213', 0, '', ''),
(646, '2013-10-26 15:33:05', 1, 'categories.php', 'action=update_category&cPath=2&', '113.249.132.213', 0, '', 0x6d8ed10a83300c45ff25cf83a99bbaf92d85d2b55102d64a9a3e88f8ef6b61b0097b3df7dc9bec608de01498306a723040fd84cb2f5c8c4718766872a652db98874af7b1b5709c3487d132ad4261f967abd4dbfea55287b74cbaa61a4b9ffca41d7176bf4bea7abe4fde4ca8bd599299b308a55588c319257f06554631b0e8c00ef90318a33059d1b2ad45aae17803),
(647, '2013-10-26 15:33:05', 1, 'categories.php', 'cPath=2&cID=19&', '113.249.132.213', 0, '', ''),
(648, '2013-10-26 15:41:30', 1, 'categories.php', '', '113.249.132.213', 0, '', ''),
(649, '2013-10-26 15:41:34', 1, 'categories.php', 'cPath=54&', '113.249.132.213', 0, '', ''),
(650, '2013-10-26 15:41:37', 1, 'categories.php', 'cPath=54_60&', '113.249.132.213', 0, '', ''),
(651, '2013-10-26 15:41:40', 1, 'categories.php', 'cPath=54&cID=60&', '113.249.132.213', 0, '', ''),
(652, '2013-10-26 15:51:55', 1, 'developers_tool_kit.php', '', '113.249.132.213', 0, '', ''),
(653, '2013-10-26 15:51:58', 1, 'developers_tool_kit.php', 'action=locate_all_files&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8bcf4ead54b25272760c7175f70ff2740d8e0f0e7542e279fab9b8fa8528e9285595c5a765e6a41603151b21714b2a0b528142864ab500),
(654, '2013-10-26 15:52:49', 1, 'developers_tool_kit.php', 'action=locate_configuration&configuration_key_lookup=CATEGORIES_SUBCATEGORIES_INDENT&', '113.249.132.213', 0, '', ''),
(655, '2013-10-26 15:52:54', 1, 'configuration.php', 'gID=19&cID=423&', '113.249.132.213', 0, '', ''),
(656, '2013-10-26 15:53:24', 1, 'configuration.php', 'gID=19&cID=423&action=edit&', '113.249.132.213', 0, '', ''),
(657, '2013-10-26 15:53:28', 1, 'configuration.php', 'gID=19&cID=423&action=save&', '113.249.132.213', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b25252d2512a2e4dcacd2c71760c7175f70ff2740d8e0f0e7542e279fab9b8fa85c45700151b1912adbc12a8dc54a91600),
(658, '2013-10-26 15:53:28', 1, 'configuration.php', 'gID=19&cID=423&', '113.249.132.213', 0, '', ''),
(659, '2013-10-28 12:02:42', 0, 'login.php ', 'camefrom=index.php&', '125.85.146.120', 0, '', ''),
(660, '2013-10-28 12:02:46', 0, 'login.php admin', 'camefrom=index.php&', '125.85.146.120', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b2827094749412934b32f3f3800229f9e68906a9496666e60689c9e646e61666e6c9964616a90606e6a916a9a92929c94ab500),
(661, '2013-10-28 12:02:56', 1, 'configuration.php', 'gID=25&', '125.85.146.120', 0, '', ''),
(662, '2013-10-28 12:02:59', 1, 'configuration.php', 'gID=20&', '125.85.146.120', 0, '', ''),
(663, '2013-10-28 12:03:04', 1, 'configuration.php', 'gID=19&', '125.85.146.120', 0, '', ''),
(664, '2013-10-28 12:03:11', 1, 'configuration.php', 'gID=19&cID=449&action=edit&', '125.85.146.120', 0, '', '');
INSERT INTO `zen_admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(665, '2013-10-28 12:03:13', 1, 'configuration.php', 'gID=19&cID=449&action=save&', '125.85.146.120', 0, '', 0xab564acecf4bcb4c2f2d4a2cc9cccf8b2f4bcc294d55b2528a4c2d56d2512a2e4dcacd2cf1f47574778d0f0d768d770e0e8e770a0d09f1f70b8eaf00aa323426a0a812a8c858a91600),
(666, '2013-10-28 12:03:14', 1, 'configuration.php', 'gID=19&cID=449&', '125.85.146.120', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin_menus`
--

CREATE TABLE IF NOT EXISTS `zen_admin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_admin_menus`
--

INSERT INTO `zen_admin_menus` (`menu_key`, `language_key`, `sort_order`) VALUES
('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
('catalog', 'BOX_HEADING_CATALOG', 2),
('configuration', 'BOX_HEADING_CONFIGURATION', 1),
('customers', 'BOX_HEADING_CUSTOMERS', 4),
('extras', 'BOX_HEADING_EXTRAS', 11),
('gv', 'BOX_HEADING_GV_ADMIN', 9),
('localization', 'BOX_HEADING_LOCALIZATION', 6),
('modules', 'BOX_HEADING_MODULES', 3),
('reports', 'BOX_HEADING_REPORTS', 7),
('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
('tools', 'BOX_HEADING_TOOLS', 8);

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin_pages`
--

CREATE TABLE IF NOT EXISTS `zen_admin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_admin_pages`
--

INSERT INTO `zen_admin_pages` (`page_key`, `language_key`, `main_page`, `page_params`, `menu_key`, `display_on_menu`, `sort_order`) VALUES
('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
('backup_mysql', 'BOX_TOOLS_BACKUP_MYSQL', 'FILENAME_BACKUP_MYSQL', '', 'tools', 'Y', 17),
('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
('configImageHandler4', 'BOX_TOOLS_IMAGE_HANDLER', 'FILENAME_IMAGE_HANDLER', '', 'tools', 'Y', 14),
('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
('configUltimateSEO', 'BOX_CONFIGURATION_ULTIMATE_SEO', 'FILENAME_CONFIGURATION', 'gID=33', 'configuration', 'Y', 33),
('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
('configZenLightbox', 'BOX_CONFIGURATION_ZEN_LIGHTBOX', 'FILENAME_CONFIGURATION', 'gID=32', 'configuration', 'Y', 32),
('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
('easyPopulate', 'BOX_TOOLS_EASY_POPULATE', 'FILENAME_EASYPOPULATE', '', 'tools', 'Y', 14),
('easyPopulateConfig', 'BOX_CONFIGURATION_EASY_POPULATE', 'FILENAME_CONFIGURATION', 'gID=31', 'configuration', 'Y', 26),
('emailArchive', 'BOX_TOOLS_EMAIL_ARCHIVE_MANAGER', 'FILENAME_EMAIL_HISTORY', '', 'tools', 'Y', 20),
('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5),
('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
('Quick Updates', 'BOX_CATALOG_QUICK_UPDATES', 'FILENAME_QUICK_UPDATES', '', 'catalog', 'Y', 103),
('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2);

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin_pages_to_profiles`
--

CREATE TABLE IF NOT EXISTS `zen_admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_admin_pages_to_profiles`
--

INSERT INTO `zen_admin_pages_to_profiles` (`profile_id`, `page_key`) VALUES
(1, 'easyPopulate');

-- --------------------------------------------------------

--
-- 表的结构 `zen_admin_profiles`
--

CREATE TABLE IF NOT EXISTS `zen_admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_admin_profiles`
--

INSERT INTO `zen_admin_profiles` (`profile_id`, `profile_name`) VALUES
(1, 'Superuser');

-- --------------------------------------------------------

--
-- 表的结构 `zen_authorizenet`
--

CREATE TABLE IF NOT EXISTS `zen_authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_banners`
--

CREATE TABLE IF NOT EXISTS `zen_banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `zen_banners`
--

INSERT INTO `zen_banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES
(1, 'Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/zencart_cn_logo.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(2, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(3, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2004-01-11 20:59:12', NULL, 1, 1, 1, 0),
(4, '还考虑什么? 现在就装一个吧!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', 0, NULL, NULL, '2004-01-12 20:53:18', NULL, 1, 1, 1, 0),
(5, 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', 0, NULL, NULL, '2005-05-13 10:54:38', NULL, 1, 1, 1, 10),
(6, '立即注册PayPal并开始接受信用卡付款!', 'https://www.paypal.com/c2/mrb/pal=GR5QUVVL9AFGN&MRB=R-4DM17246PS436904F', 'banners/cardsvcs_468x60.gif', 'Wide-Banners', '', 0, NULL, NULL, '2006-03-13 11:02:43', NULL, 1, 1, 1, 0),
(7, 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/big-book-ad.gif', 'Wide-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(8, 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'SideBox-Banners', '', 0, NULL, NULL, '2007-02-10 00:00:00', NULL, 1, 1, 1, 1),
(9, 'Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/logo-zencart-cn-125.gif', 'BannersAll', '', 0, NULL, NULL, '2005-12-10 00:00:00', NULL, 1, 1, 1, 15);

-- --------------------------------------------------------

--
-- 表的结构 `zen_banners_history`
--

CREATE TABLE IF NOT EXISTS `zen_banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `zen_banners_history`
--

INSERT INTO `zen_banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 3, 1, 0, '2013-09-27 10:59:51'),
(2, 5, 2, 0, '2013-09-27 10:59:52'),
(3, 9, 2, 0, '2013-09-27 10:59:52'),
(4, 8, 1, 0, '2013-09-27 11:00:10');

-- --------------------------------------------------------

--
-- 表的结构 `zen_categories`
--

CREATE TABLE IF NOT EXISTS `zen_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `zen_categories`
--

INSERT INTO `zen_categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES
(1, 'categories/category_hardware.gif', 0, 1, '2003-12-23 03:18:19', '2004-05-21 00:32:17', 1),
(2, 'categories/category_software.gif', 0, 0, '2003-12-23 03:18:19', '2013-10-26 15:32:07', 1),
(3, 'categories/category_dvd_movies.gif', 0, 3, '2003-12-23 03:18:19', '2004-05-21 00:22:39', 1),
(4, 'categories/subcategory_graphic_cards.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(5, 'categories/subcategory_printers.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(6, 'categories/subcategory_monitors.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(7, 'categories/subcategory_speakers.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(8, 'categories/subcategory_keyboards.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(9, 'categories/subcategory_mice.gif', 1, 0, '2003-12-23 03:18:19', '2004-05-21 00:34:10', 1),
(10, 'categories/subcategory_action.gif', 3, 0, '2003-12-23 03:18:19', '2004-05-21 00:39:17', 1),
(11, 'categories/subcategory_science_fiction.gif', 3, 0, '2003-12-23 03:18:19', NULL, 1),
(12, 'categories/subcategory_comedy.gif', 3, 0, '2003-12-23 03:18:19', NULL, 1),
(13, 'categories/subcategory_cartoons.gif', 3, 0, '2003-12-23 03:18:19', '2004-05-21 00:23:13', 1),
(14, 'categories/subcategory_thriller.gif', 3, 0, '2003-12-23 03:18:19', NULL, 1),
(15, 'categories/subcategory_drama.gif', 3, 0, '2003-12-23 03:18:19', NULL, 1),
(16, 'categories/subcategory_memory.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(17, 'categories/subcategory_cdrom_drives.gif', 1, 0, '2003-12-23 03:18:19', NULL, 1),
(18, 'categories/subcategory_simulation.gif', 2, 0, '2003-12-23 03:18:19', NULL, 1),
(19, 'categories/subcategory_action_games.gif', 2, 0, '2003-12-23 03:18:19', '2013-10-26 15:33:05', 1),
(20, 'categories/subcategory_strategy.gif', 2, 0, '2003-12-23 03:18:19', NULL, 1),
(21, 'categories/gv_25.gif', 0, 4, '2003-12-23 03:18:19', '2004-05-21 00:26:06', 1),
(22, 'categories/box_of_color.gif', 0, 5, '2003-12-23 03:18:19', '2004-05-21 00:28:43', 1),
(23, 'waybkgnd.gif', 0, 500, '2003-12-28 02:26:19', '2003-12-29 23:21:35', 1),
(24, 'categories/category_free.gif', 0, 600, '2003-12-28 11:48:46', '2004-01-02 19:13:45', 1),
(25, 'sample_image.gif', 0, 515, '2003-12-31 02:39:17', '2004-01-24 01:49:12', 1),
(27, 'sample_image.gif', 49, 10, '2004-01-04 14:13:08', '2004-01-24 16:16:23', 1),
(28, 'sample_image.gif', 0, 510, '2004-01-04 17:13:47', '2004-01-05 23:54:23', 1),
(31, 'sample_image.gif', 48, 30, '2004-01-04 23:16:46', '2004-01-24 01:48:29', 1),
(32, 'sample_image.gif', 48, 40, '2004-01-05 01:34:56', '2004-01-24 01:48:36', 1),
(33, 'categories/subcategory.gif', 0, 700, '2004-01-05 02:08:31', '2004-05-20 10:35:31', 1),
(34, 'categories/subcategory.gif', 33, 10, '2004-01-05 02:08:50', '2004-05-20 10:35:57', 1),
(35, 'categories/subcategory.gif', 33, 20, '2004-01-05 02:09:01', '2004-01-24 00:07:33', 1),
(36, 'categories/subcategory.gif', 33, 30, '2004-01-05 02:09:12', '2004-01-24 00:07:41', 1),
(37, 'categories/subcategory.gif', 35, 10, '2004-01-05 02:09:28', '2004-01-24 00:22:39', 1),
(38, 'categories/subcategory.gif', 35, 20, '2004-01-05 02:09:39', '2004-01-24 00:22:46', 1),
(39, 'categories/subcategory.gif', 35, 30, '2004-01-05 02:09:49', '2004-01-24 00:22:53', 1),
(40, 'categories/subcategory.gif', 34, 10, '2004-01-05 02:17:27', '2004-05-20 10:36:19', 1),
(41, 'categories/subcategory.gif', 36, 10, '2004-01-05 02:21:02', '2004-01-24 00:23:04', 1),
(42, 'categories/subcategory.gif', 36, 30, '2004-01-05 02:21:14', '2004-01-24 00:23:18', 1),
(43, 'categories/subcategory.gif', 34, 20, '2004-01-05 02:21:29', '2004-01-24 00:21:37', 1),
(44, 'categories/subcategory.gif', 36, 20, '2004-01-05 02:21:47', '2004-01-24 00:23:11', 1),
(45, 'sample_image.gif', 48, 10, '2004-01-05 23:54:56', '2004-01-24 01:48:22', 1),
(46, 'sample_image.gif', 50, 10, '2004-01-06 00:01:48', '2004-01-24 01:39:56', 1),
(47, 'sample_image.gif', 48, 20, '2004-01-06 03:09:57', '2004-01-24 01:48:05', 1),
(48, 'sample_image.gif', 0, 1000, '2004-01-07 02:24:07', '2004-01-07 02:44:26', 1),
(49, 'sample_image.gif', 0, 1100, '2004-01-07 02:27:31', '2004-01-07 02:44:34', 1),
(50, 'sample_image.gif', 0, 1200, '2004-01-07 02:28:18', '2004-01-07 02:47:19', 1),
(51, 'sample_image.gif', 50, 20, '2004-01-07 02:33:55', '2004-01-24 01:40:05', 1),
(52, 'sample_image.gif', 49, 20, '2004-01-24 16:09:35', '2004-01-24 16:16:33', 1),
(53, 'categories/subcategory.gif', 0, 1500, '2004-04-25 23:07:41', NULL, 1),
(54, 'categories/subcategory.gif', 0, 1510, '2004-04-26 12:02:35', '2004-05-20 11:45:20', 1),
(55, 'categories/subcategory.gif', 54, 0, '2004-04-28 01:48:47', '2004-05-20 11:45:51', 1),
(56, 'categories/subcategory.gif', 54, 0, '2004-04-28 01:49:16', '2004-04-28 01:53:14', 1),
(57, 'categories/subcategory.gif', 54, 0, '2004-05-01 01:29:13', NULL, 1),
(58, 'categories/subcategory.gif', 54, 110, '2004-05-02 12:35:02', '2004-05-18 10:46:13', 1),
(60, 'categories/subcategory.gif', 54, 0, '2004-05-02 23:45:21', NULL, 1),
(61, 'categories/subcategory.gif', 54, 100, '2004-05-18 10:13:46', '2004-05-18 10:46:02', 1),
(62, 'sample_image.gif', 0, 1520, '2003-12-23 03:18:19', '2004-05-22 21:14:57', 1),
(63, 'categories/subcategory.gif', 0, 1530, '2003-12-23 03:18:19', '2004-07-12 17:45:24', 1),
(64, 'categories/subcategory.gif', 0, 1550, '2004-07-12 15:22:27', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_categories_description`
--

CREATE TABLE IF NOT EXISTS `zen_categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_categories_description`
--

INSERT INTO `zen_categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES
(1, 2, '硬件', '我们提供各种各样的硬件，从打印机到显卡、鼠标、键盘等。'),
(2, 2, '软件', '选择各款软件。<br /><br />没看到您想要的吗?'),
(3, 2, '影视', '我们提供各种DVD电影，老少皆宜。<br /><br />请查看分类目录。'),
(4, 2, '显卡', ''),
(5, 2, '打印机', ''),
(6, 2, '显示器', ''),
(7, 2, '音箱', ''),
(8, 2, '键盘', ''),
(9, 2, '鼠标', '选择适合您的鼠标!<br /><br />如果您没有找到想要的鼠标，请联系我们。'),
(10, 2, '动作', '<p>动作大片！<br /><br />不要错过精彩片断，现在就购买！<br /><br /></p>'),
(11, 2, '科幻', ''),
(12, 2, '喜剧', ''),
(13, 2, '卡通', '适于各年龄段的儿童!'),
(14, 2, '惊险', ''),
(15, 2, '戏剧', ''),
(16, 2, '内存', ''),
(17, 2, '光驱', ''),
(18, 2, '模拟', ''),
(19, 2, '动作', '动作类游戏'),
(20, 2, '策略', ''),
(21, 2, '礼券', '现在就发送礼券!<br /><br />礼券适用于商店内的任何商品。'),
(22, 2, '链接商品', '所有这些商品都是&quot;链接&quot;商品。<br /><br />表明他们出现在不止一个分类中。<br /><br />但您只要在一个地方进行维护。<br /><br />主商品用于定价。'),
(23, 2, '测试样品', ''),
(24, 2, '免费赠品', ''),
(25, 2, '属性九折测试', ''),
(27, 2, '优惠5元', ''),
(28, 2, '九折测试', ''),
(31, 2, '忽略九折', ''),
(32, 2, '原价九折', ''),
(33, 2, '总分类', '<p>总分类的说明。</p>'),
(34, 2, '子分类 2A', '子分类2A的说明。'),
(35, 2, '子分类 2B', '子分类2B的说明。'),
(36, 2, '子分类 2C', '子分类2C的说明。'),
(37, 2, '子分类 2B1', '子分类2B1的说明。'),
(38, 2, '子分类 2B2', '子分类2B2的说明。'),
(39, 2, '子分类 2B3', '子分类2B3的说明。'),
(40, 2, '子分类 2A1', '子分类2A1的说明。'),
(41, 2, '子分类 2C1', '子分类2C1的说明。'),
(42, 2, '子分类 2C3', '子分类2C3的说明。'),
(43, 2, '子分类 2A2', '子分类2A2的说明。'),
(44, 2, '子分类 2C2', '子分类2C2的说明。'),
(45, 2, '九折', ''),
(46, 2, '促销价100元', ''),
(47, 2, '属性九折', ''),
(48, 2, '促销商品', ''),
(49, 2, '减价商品', ''),
(50, 2, '促销价格', ''),
(51, 2, '促销价100元无条件', ''),
(52, 2, '优惠5元 无条件', ''),
(53, 2, '无链接商品', ''),
(54, 2, '新特性商品', '<p>新商品演示了Zen Cart新增的很多功能。<br /><br />花点时间看看演示商品，更好地了解Zen Cart提供的所有选项和功能。</p>'),
(55, 2, '批量优惠', '<p>批量优惠可以应用在商品或单个属性上。<br /><br />用于商品的优惠不影响属性价格。<br /><br />仅特价和促销的优惠应用于属性价格。</p>'),
(56, 2, '属性', ''),
(57, 2, '文字价格', ''),
(58, 2, '销售', ''),
(60, 2, '下载', ''),
(61, 2, '实物', ''),
(62, 2, '音乐', ''),
(63, 2, '文档', '现在可以添加文档到分类目录。例如，增加服务/技术文档，或用作集成常见问答栏目。结构很简单，但可以扩展为提供PDF下载、链接到购买下载文件，用途非常广泛。'),
(64, 2, '混合商品类型', '本分类含不同类型的商品。\r\n\r\n包含普通商品和文档商品。两种类型的文档 - 供阅读的文档和可阅读并购买的文档。');

-- --------------------------------------------------------

--
-- 表的结构 `zen_configuration`
--

CREATE TABLE IF NOT EXISTS `zen_configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=641 ;

--
-- 转存表中的数据 `zen_configuration`
--

INSERT INTO `zen_configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, '商店名称', 'STORE_NAME', '卧卧', '商店名称', 1, 1, NULL, '2013-09-27 10:56:48', NULL, NULL),
(2, '店主', 'STORE_OWNER', '卧卧', '店主的名字', 1, 2, NULL, '2013-09-27 10:56:48', NULL, NULL),
(3, '客服电话', 'STORE_TELEPHONE_CUSTSERVICE', '', '请输入客服电话，可能用于支付处理。', 1, 3, NULL, '2013-09-27 10:56:48', NULL, NULL),
(4, '国家或地区', 'STORE_COUNTRY', '44', '商店所在的国家或地区 <br /><br /><strong>备注: 请记住更新商店所在地区。</strong>', 1, 6, NULL, '2013-09-27 10:56:48', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(5, '地区', 'STORE_ZONE', '131', '商店所在地区', 1, 7, NULL, '2013-09-27 10:56:48', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list('),
(6, '预售商品排序', 'EXPECTED_PRODUCTS_SORT', 'desc', '预售商品方框的排序.', 1, 8, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''asc'', ''desc''), '),
(7, '预售商品排序字段', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', '预售商品方框的排序字段.', 1, 9, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''products_name'', ''date_expected''), '),
(8, '使用缺省语言货币', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'true', '自动转换到选择语言的相应货币', 1, 10, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(9, '语言选择', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', '商店缺省的语言选择为商店的设置，还是用户浏览器中的设置？<br /><br />Default: 商店的缺省设置', 1, 11, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''Default'', ''Browser''), '),
(10, '使用搜索引擎友好的URLs (还在开发中)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 6, 12, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(11, '添加商品后显示购物车', 'DISPLAY_CART', 'true', '添加商品后显示购物车 (或退回原来的状态)', 1, 14, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(12, '缺省搜索操作', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', '缺省搜索操作', 1, 17, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''and'', ''or''), '),
(13, '商店地址和电话', 'STORE_NAME_ADDRESS', '商店名称\r\n 地址\r\n 国家\r\n 电话', '商店名称, 地址和电话号码, 用于打印文件和在线显示', 1, 7, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_textarea('),
(14, '显示分类计数', 'SHOW_COUNTS', 'false', '递归计算分类中商品数量', 1, 19, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(15, '税收小数位', 'TAX_DECIMAL_PLACES', '0', '税收金额的小数位', 1, 20, NULL, '2013-09-27 10:56:48', NULL, NULL),
(16, '显示含税价格', 'DISPLAY_PRICE_WITH_TAX', 'false', '显示含税价格 (True) 或 最后再加税 (False)', 1, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(17, '在管理页面中显示含税价格', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', '在管理页面中(发票), 显示含税价格 (True) 或 最后再加税 (False)', 1, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(18, '商品税的计算', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', '计算商品税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址', 1, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(19, '运费税的计算', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', '计算运费税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址 - 货运模块可以覆盖该设置', 1, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(20, '销售税显示', 'STORE_TAX_DISPLAY_STATUS', '0', '即使金额为零也显示销售税<br />0= 否<br />1= 是', 1, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(21, '分开显示税项', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', '如果有多个税项，结帐时每个税项单独显示一行', 1, 22, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(22, '管理对话超时秒数', 'SESSION_TIMEOUT_ADMIN', '900', '输入以秒为单位的时间。<br />PCI 兼容要求最大不超过 900 。<br /> 默认=900<br />例如: 900= 15 分钟<br /><br />备注: 时间太短会导致添加/编辑商品时超时', 1, 40, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''900'', ''600'', ''300''), '),
(23, '管理设置最大进程执行时间', 'GLOBAL_SET_TIME_LIMIT', '60', '输入以秒为单位的时间, 管理设置最大进程执行时间。<br />缺省=60 秒<br />例如: 60= 1 分钟<br /><br />备注: 仅当您进程执行时间有问题时, 才需要修改该时间限制', 1, 42, NULL, '2013-09-27 10:56:48', NULL, NULL),
(24, '显示是否有新版本', 'SHOW_VERSION_UPDATE_IN_HEADER', 'false', '自动显示是否有Zen Cart新版本。打开该选项有时会降低管理页面打开时间。(显示于登录后的主索引页面和服务器信息页面)', 1, 44, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(25, '商店模式', 'STORE_STATUS', '0', '商店模式<br />0= 正常<br />1= 商品展示, 不显示价格<br />2= 商品展示, 显示价格', 1, 25, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(26, '服务器运行时数', 'DISPLAY_SERVER_UPTIME', 'true', '显示服务器运行时数在某些服务器上会导致日志文件中有错误记录。(true = 显示, false = 不显示)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(27, '丢失页面检测', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart能够检测不存在的页面并自动调转到索引页面。调试时可关闭该选项。<br /><br /><strong>缺省=On</strong><br />On = 如有不存在的页面，调整到''index''<br />Off = 不检测不存在的页面<br />Page Not Found = 显示页面不存在的提示页面', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''On'', ''Off'', ''Page Not Found''),'),
(28, 'cURL代理服务器状态', 'CURL_PROXY_REQUIRED', 'False', '您的cURL是否使用代理服务器?', 6, 50, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(29, 'cURL代理服务器地址', 'CURL_PROXY_SERVER_DETAILS', '', '如果您的主机需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: 127.0.0.1:3128', 6, 51, NULL, '2013-09-27 10:56:48', NULL, NULL),
(30, 'HTML编辑器', 'HTML_EDITOR_PREFERENCE', 'NONE', '请选择用于管理电子邮件、电子商情和商品简介的文本编辑器。', 1, 110, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_pull_down_htmleditors('),
(31, '打开phpBB链接?', 'PHPBB_LINKS_ENABLED', 'false', 'Zen Cart的新帐号要和您的(已安装)phpBB论坛同步吗?', 1, 120, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(32, '显示分类计数 - 管理员', 'SHOW_COUNTS_ADMIN', 'true', '在管理页面显示分类计数吗?', 1, 19, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(33, '货币兑换比率', 'CURRENCY_UPLIFT_RATIO', '1.05', '自动更新汇率时，需要使用的"额外"比率是多少？<br />例如: 从汇率服务器更新银行汇率后，您要在银行汇率基础上增加多少比例来设置给客户的汇率？<br /><br /><strong>缺省: 1.05 </strong><br />将公布的银行汇率乘以1.05作为商店的汇率。', 1, 55, NULL, '2013-09-27 10:56:48', NULL, NULL),
(34, '名字', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', '名字最少字数', 2, 1, '2013-09-29 12:25:55', '2013-09-27 10:56:48', NULL, NULL),
(35, '姓氏', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', '姓氏最少字数', 2, 2, '2013-09-29 12:26:52', '2013-09-27 10:56:48', NULL, NULL),
(36, '生日', 'ENTRY_DOB_MIN_LENGTH', '10', '生日最少字数', 2, 3, NULL, '2013-09-27 10:56:48', NULL, NULL),
(37, '电子邮件', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', '电子邮件地址最少字数', 2, 4, NULL, '2013-09-27 10:56:48', NULL, NULL),
(38, '地址', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '4', '地址最少字数', 2, 5, NULL, '2013-09-27 10:56:48', NULL, NULL),
(39, '公司', 'ENTRY_COMPANY_MIN_LENGTH', '0', '公司名称最少字数', 2, 6, NULL, '2013-09-27 10:56:48', NULL, NULL),
(40, '邮编', 'ENTRY_POSTCODE_MIN_LENGTH', '4', '邮编最少字数', 2, 7, NULL, '2013-09-27 10:56:48', NULL, NULL),
(41, '城市', 'ENTRY_CITY_MIN_LENGTH', '2', '城市最少字数', 2, 8, NULL, '2013-09-27 10:56:48', NULL, NULL),
(42, '省份', 'ENTRY_STATE_MIN_LENGTH', '2', '省份最少字数', 2, 9, NULL, '2013-09-27 10:56:48', NULL, NULL),
(43, '电话号码', 'ENTRY_TELEPHONE_MIN_LENGTH', '6', '电话号码最少字数', 2, 10, NULL, '2013-09-27 10:56:48', NULL, NULL),
(44, '密码', 'ENTRY_PASSWORD_MIN_LENGTH', '7', '密码最少字数', 2, 11, NULL, '2013-09-27 10:56:48', NULL, NULL),
(45, '信用卡持卡人姓名', 'CC_OWNER_MIN_LENGTH', '2', '信用卡持卡人姓名最少字数', 2, 12, NULL, '2013-09-27 10:56:48', NULL, NULL),
(46, '信用卡号', 'CC_NUMBER_MIN_LENGTH', '10', '信用卡号码最少字数', 2, 13, NULL, '2013-09-27 10:56:48', NULL, NULL),
(47, '信用卡CVV校验码', 'CC_CVV_MIN_LENGTH', '3', '信用卡CVV校验码最少字数', 2, 13, NULL, '2013-09-27 10:56:48', NULL, NULL),
(48, '商品评论文字', 'REVIEW_TEXT_MIN_LENGTH', '1', '商品评论文字最少字数', 2, 14, NULL, '2013-09-27 10:56:48', NULL, NULL),
(49, '畅销商品', 'MIN_DISPLAY_BESTSELLERS', '1', '成为畅销商品的最小销售数量', 2, 15, NULL, '2013-09-27 10:56:48', NULL, NULL),
(50, '同时购买商品', 'MIN_DISPLAY_ALSO_PURCHASED', '1', '显示为客户同时购买商品的最少数量', 2, 16, NULL, '2013-09-27 10:56:48', NULL, NULL),
(51, '昵称', 'ENTRY_NICK_MIN_LENGTH', '1', '昵称最少字数', 2, 1, NULL, '2013-09-27 10:56:48', NULL, NULL),
(52, '地址簿条目', 'MAX_ADDRESS_BOOK_ENTRIES', '5', '每个客户地址簿中最多允许的条目', 3, 1, NULL, '2013-09-27 10:56:48', NULL, NULL),
(53, '管理页面每页搜索结果', 'MAX_DISPLAY_SEARCH_RESULTS', '20', '管理页面搜索结果的商品数量', 3, 2, NULL, '2013-09-27 10:56:48', NULL, NULL),
(54, '前/后页导航页链接', 'MAX_DISPLAY_PAGE_LINKS', '5', '导航链接显示的数目的数量', 3, 3, NULL, '2013-09-27 10:56:48', NULL, NULL),
(55, '首页新进商品数量', 'MAX_DISPLAY_NEW_PRODUCTS', '6', '显示在首页的新进商品数量', 3, 4, '2013-10-09 18:58:38', '2013-09-27 10:56:48', NULL, NULL),
(56, '首页推荐商品数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '6', '显示在首页的推荐商品数量', 3, 5, '2013-10-09 18:58:46', '2013-09-27 10:56:48', NULL, NULL),
(57, '首页特价商品数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', '显示在首页的特价商品数量', 3, 6, '2013-10-09 18:57:21', '2013-09-27 10:56:48', NULL, NULL),
(58, '预售商品数量', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '9', '显示的预售商品数量', 3, 7, '2013-10-09 18:57:26', '2013-09-27 10:56:48', NULL, NULL),
(59, '特价商品列表数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '6', '特价商品列表每页显示的商品数量', 3, 8, NULL, '2013-09-27 10:56:48', NULL, NULL),
(60, '新进商品列表数量', 'MAX_DISPLAY_PRODUCTS_NEW', '9', '新进商品列表每页显示的商品数量', 3, 9, '2013-10-09 18:57:30', '2013-09-27 10:56:48', NULL, NULL),
(61, '推荐商品列表数量', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '9', '推荐商品列表每页显示的商品数量', 3, 29, '2013-10-09 18:57:47', '2013-09-27 10:56:48', NULL, NULL),
(62, '所有商品列表数量', 'MAX_DISPLAY_PRODUCTS_ALL', '9', '所有商品列表每页显示的商品数量', 3, 11, '2013-10-09 18:57:33', '2013-09-27 10:56:48', NULL, NULL),
(63, '分类商品列表数量', 'MAX_DISPLAY_PRODUCTS_LISTING', '9', '分类商品列表每页显示的商品数量', 3, 12, '2013-10-09 18:57:36', '2013-09-27 10:56:48', NULL, NULL),
(64, '畅销商品数量', 'MAX_DISPLAY_BESTSELLERS', '9', '畅销商品数量', 3, 13, '2013-10-09 18:57:39', '2013-09-27 10:56:48', NULL, NULL),
(65, '同时购买商品数量', 'MAX_DISPLAY_ALSO_PURCHASED', '6', '''客户同时购买的商品''方框中显示的商品数量', 3, 14, NULL, '2013-09-27 10:56:48', NULL, NULL),
(66, '边框中随机推荐商品数量', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', '在边框中显示的随机推荐商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', 3, 15, NULL, '2013-09-27 10:56:48', NULL, NULL),
(67, '边框中随机新进商品数量', 'MAX_RANDOM_SELECT_NEW', '3', '在边框中显示的随机新进商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', 3, 16, NULL, '2013-09-27 10:56:48', NULL, NULL),
(68, '边框中随机特价商品数量', 'MAX_RANDOM_SELECT_SPECIALS', '2', '在边框中显示的随机特价商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', 3, 17, NULL, '2013-09-27 10:56:48', NULL, NULL),
(69, '边框中随机商品评论数量', 'MAX_RANDOM_SELECT_REVIEWS', '1', '在边框中显示的随机商品评论的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', 3, 18, NULL, '2013-09-27 10:56:48', NULL, NULL),
(70, '每页商品评论数量', 'MAX_DISPLAY_NEW_REVIEWS', '6', '每页显示的商品评论数量', 3, 19, NULL, '2013-09-27 10:56:48', NULL, NULL),
(71, '厂商列表 - 滚动栏大小/样式', 'MAX_MANUFACTURERS_LIST', '3', '滚动栏窗口里显示的厂商数目。如果设为1或0显示下拉菜单', 3, 20, NULL, '2013-09-27 10:56:48', NULL, NULL),
(72, '厂商列表 - 检验商品存在', 'PRODUCTS_MANUFACTURERS_STATUS', '1', '要显示厂商名字，保证至少存在一个有效商品<br /><br />提示: 当该开关为开启时，如果有很多商品或厂商，会影响网站速度<br />0= 关 1= 开', 3, 21, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(73, '音乐类型列表 - 滚动栏大小/样式', 'MAX_MUSIC_GENRES_LIST', '3', '滚动栏窗口里显示的音乐类型数目. 如果设为1或0会显示下拉菜单。', 3, 22, NULL, '2013-09-27 10:56:48', NULL, NULL),
(74, '唱片公司列表 - 滚动栏大小/样式', 'MAX_RECORD_COMPANY_LIST', '3', '滚动栏窗口里显示的唱片公司数目. 如果设为1或0会显示下拉菜单。', 3, 23, NULL, '2013-09-27 10:56:48', NULL, NULL),
(75, '唱片公司名称长度', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', '用于唱片公司栏; 唱片公司名称显示的最大长度. 太长的名字会被截断.', 3, 24, NULL, '2013-09-27 10:56:48', NULL, NULL),
(76, '音乐类型名称长度', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', '用于音乐类型栏; 音乐类型名称显示的最大长度. 太长的名字会被截断.', 3, 25, NULL, '2013-09-27 10:56:48', NULL, NULL),
(77, '厂商名字长度', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', '用于厂商栏; 厂商名字显示的最大长度. 太长的名字会被截断.', 3, 26, NULL, '2013-09-27 10:56:48', NULL, NULL),
(78, '每行分类数目', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', '每行分类数目', 3, 27, NULL, '2013-09-27 10:56:48', NULL, NULL),
(79, '最近购买边框- 备注: 边框已关闭', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', '最近购买边框中显示的商品数量', 3, 28, NULL, '2013-09-27 10:56:48', NULL, NULL),
(80, '每页显示的客户订单数', 'MAX_DISPLAY_ORDER_HISTORY', '10', '''我的帐号''订单历史中显示的订单数目', 3, 29, NULL, '2013-09-27 10:56:48', NULL, NULL),
(81, '客户页显示最大客户数', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', 3, 30, NULL, '2013-09-27 10:56:48', NULL, NULL),
(82, '订单页显示最大订单数', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', 3, 31, NULL, '2013-09-27 10:56:48', NULL, NULL),
(83, '分析系统页面显示的商品数', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', 3, 32, NULL, '2013-09-27 10:56:48', NULL, NULL),
(84, '最大分类商品显示列表', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', '每页显示的商品数目', 3, 33, NULL, '2013-09-27 10:56:48', NULL, NULL),
(85, '商品属性 - 选项名称和值的显示', 'MAX_ROW_LISTS_OPTIONS', '10', '显示在商品属性页面的选项名称和值的数量', 3, 34, NULL, '2013-09-27 10:56:48', NULL, NULL),
(86, '商品属性 - 属性数量的显示', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', '显示在商品属性控制页面的属性数量', 3, 35, NULL, '2013-09-27 10:56:48', NULL, NULL),
(87, '商品属性 - 下载管理显示', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', '下载管理页面显示的下载数量', 3, 36, NULL, '2013-09-27 10:56:48', NULL, NULL),
(88, '推荐商品 - 显示在管理页面的数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', '管理页面下每屏的推荐商品数量', 3, 37, NULL, '2013-09-27 10:56:48', NULL, NULL),
(89, '新进商品的定义', 'SHOW_NEW_PRODUCTS_LIMIT', '0', '新进商品列表的定义<br />0= 所有商品<br />1= 当前月份<br />7= 7 天<br />14= 14 天<br />30= 30 天<br />60= 60 天<br />90= 90 天<br />120= 120 天', 3, 40, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''7'', ''14'', ''30'', ''60'', ''90'', ''120''), '),
(90, '显示语言图标的数目', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', '语言边框中每行显示的语言图标的数目', 3, 50, NULL, '2013-09-27 10:56:48', NULL, NULL),
(91, '最大文件上传大小', 'MAX_FILE_UPLOAD_SIZE', '2048000', '允许上传文件的大小<br />缺省= 2048000', 3, 60, NULL, '2013-09-27 10:56:48', NULL, NULL),
(92, '允许上传的文件名后缀', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', '列出允许客户上传到您网站的文件类型 (文件名后缀)。用逗号(,)分开。不要包含点(.)。<br /><br />建议设置: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', 3, 61, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_textarea('),
(93, '管理订单下显示的订单内容', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', '最多订单内容数<br />0 = 无限制', 3, 65, NULL, '2013-09-27 10:56:48', NULL, NULL),
(94, '管理页面显示的PayPal IPN的数量', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', '管理页面显示PayPal IPN的数量<br />缺省为20', 3, 66, NULL, '2013-09-27 10:56:48', NULL, NULL),
(95, '商品链接多个分类的显示', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', '商品链接到多个分类的管理界面下，显示的列数<br />3 = 缺省', 3, 70, NULL, '2013-09-27 10:56:48', NULL, NULL),
(96, '简易页面的显示数量', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', '简易页面的显示数量<br />20 = 缺省', 3, 71, NULL, '2013-09-27 10:56:48', NULL, NULL),
(97, '小图像宽度', 'SMALL_IMAGE_WIDTH', '100', '小图像象素宽度', 4, 1, NULL, '2013-09-27 10:56:48', NULL, NULL),
(98, '小图像高度', 'SMALL_IMAGE_HEIGHT', '80', '小图像象素高度', 4, 2, NULL, '2013-09-27 10:56:48', NULL, NULL),
(99, '标题图像宽度 - 管理页面', 'HEADING_IMAGE_WIDTH', '57', '管理页面的标题图像象素宽度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', 4, 3, NULL, '2013-09-27 10:56:48', NULL, NULL),
(100, '标题图像高度 - 管理页面', 'HEADING_IMAGE_HEIGHT', '40', '管理页面的标题图像象素高度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', 4, 4, NULL, '2013-09-27 10:56:48', NULL, NULL),
(101, '子分类图像宽度', 'SUBCATEGORY_IMAGE_WIDTH', '100', '子分类图像象素宽度', 4, 5, NULL, '2013-09-27 10:56:48', NULL, NULL),
(102, '子分类图像高度', 'SUBCATEGORY_IMAGE_HEIGHT', '57', '子分类图像象素高度', 4, 6, NULL, '2013-09-27 10:56:48', NULL, NULL),
(103, '计算图像尺寸', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', '是否计算图像尺寸?', 4, 7, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(104, '显示缺少的图像', 'IMAGE_REQUIRED', 'true', '显示缺少的图像。适合调试。', 4, 8, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(105, '图像 - 购物车状态', 'IMAGE_SHOPPING_CART_STATUS', '1', '是否在购物车中显示商品图像?<br />0= 否 1= 是', 4, 9, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(106, '图像 - 购物车宽度', 'IMAGE_SHOPPING_CART_WIDTH', '50', '缺省 = 50', 4, 10, NULL, '2013-09-27 10:56:48', NULL, NULL),
(107, '图像 - 购物车高度', 'IMAGE_SHOPPING_CART_HEIGHT', '40', '缺省 = 40', 4, 11, NULL, '2013-09-27 10:56:48', NULL, NULL),
(108, '分类图像宽度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_WIDTH', '57', '商品信息页面的分类图标的象素宽度', 4, 13, NULL, '2013-09-27 10:56:48', NULL, NULL),
(109, '分类图像高度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', '商品信息页面的分类图标的象素高度', 4, 14, NULL, '2013-09-27 10:56:48', NULL, NULL),
(110, '含子分类的分类图像宽度', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', '含子分类的分类图像宽度', 4, 15, NULL, '2013-09-27 10:56:48', NULL, NULL),
(111, '含子分类的分类图像高度', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', '含子分类的分类图像高度', 4, 16, NULL, '2013-09-27 10:56:48', NULL, NULL),
(112, '商品信息 - 图像宽度', 'MEDIUM_IMAGE_WIDTH', '150', '商品信息图像的象素宽度', 4, 20, NULL, '2013-09-27 10:56:48', NULL, NULL),
(113, '商品信息 - 图像高度', 'MEDIUM_IMAGE_HEIGHT', '120', '商品信息图像的象素高度', 4, 21, NULL, '2013-09-27 10:56:48', NULL, NULL),
(114, '商品信息 - 中图像后缀', 'IMAGE_SUFFIX_MEDIUM', '_MED', '商品信息 - 中图像后缀<br />缺省 = _MED', 4, 22, NULL, '2013-09-27 10:56:48', NULL, NULL),
(115, '商品信息 - 大图像后缀', 'IMAGE_SUFFIX_LARGE', '_LRG', '商品信息 - 大图像后缀<br />缺省 = _LRG', 4, 23, NULL, '2013-09-27 10:56:48', NULL, NULL),
(116, '商品信息 - 每行附加图像数目', 'IMAGES_AUTO_ADDED', '3', '商品信息 - 每行附加图像数目<br />缺省 = 3', 4, 30, NULL, '2013-09-27 10:56:48', NULL, NULL),
(117, '图像 - 商品列表宽度', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', '缺省 = 100', 4, 40, NULL, '2013-09-27 10:56:48', NULL, NULL),
(118, '图像 - 商品列表高度', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', '缺省 = 80', 4, 41, NULL, '2013-09-27 10:56:48', NULL, NULL),
(119, '图像 - 新进商品列表宽度', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', '缺省 = 100', 4, 42, NULL, '2013-09-27 10:56:48', NULL, NULL),
(120, '图像 - 新进商品列表高度', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', '缺省 = 80', 4, 43, NULL, '2013-09-27 10:56:48', NULL, NULL),
(121, '图像 - 新进商品宽度', 'IMAGE_PRODUCT_NEW_WIDTH', '100', '缺省 = 100', 4, 44, NULL, '2013-09-27 10:56:48', NULL, NULL),
(122, '图像 - 新进商品高度', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', '缺省 = 80', 4, 45, NULL, '2013-09-27 10:56:48', NULL, NULL),
(123, '图像 - 推荐商品宽度', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', '缺省 = 100', 4, 46, NULL, '2013-09-27 10:56:48', NULL, NULL),
(124, '图像 - 推荐商品高度', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', '缺省 = 80', 4, 47, NULL, '2013-09-27 10:56:48', NULL, NULL),
(125, '图像 - 所有商品列表宽度', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', '缺省 = 100', 4, 48, NULL, '2013-09-27 10:56:48', NULL, NULL),
(126, '图像 - 所有商品列表高度', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', '缺省 = 80', 4, 49, NULL, '2013-09-27 10:56:48', NULL, NULL),
(127, '商品图像 - 缺省图象状态', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', '如果商品没有图像，是否使用缺省图象<br />0= 否<br />1= 是', 4, 60, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(128, '商品图像 - 缺省图象', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', '如果商品没有图像，使用的缺省图象的文件名<br />缺省 = no_picture.gif', 4, 61, NULL, '2013-09-27 10:56:48', NULL, NULL),
(129, '图像 - 商品和分类使用同比例的图像', 'PROPORTIONAL_IMAGES_STATUS', '1', '商品和分类使用同比例的图像吗?<br /><br />提示: 图像比例中不要设置高度或宽度为0<br />0= 关 1= 开', 4, 75, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(130, '称呼字段', 'ACCOUNT_GENDER', 'true', '创建帐号时显示性别选择字段，用于发送电子邮件时的称呼。', 5, 1, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(131, '生日字段', 'ACCOUNT_DOB', 'false', '创建帐号时显示生日字段<br />说明: 生日字段的最小值设置为空时，该字段为可选项<br />生日字段的最小值>0时为必选项', 5, 2, '2013-10-10 10:47:07', '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(132, '公司字段', 'ACCOUNT_COMPANY', 'false', '创建帐号时显示公司字段', 5, 3, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(133, '地址行二', 'ACCOUNT_SUBURB', 'false', '创建帐号时显示地址行二字段', 5, 4, '2013-09-29 11:06:29', '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(134, '省份', 'ACCOUNT_STATE', 'true', '创建帐号时显示省份字段', 5, 5, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(135, '省份 - 总是显示下拉菜单？', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'true', '省份总是显示为下拉菜单吗？', 5, 5, '2013-10-10 11:44:16', '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(136, '创建帐号时的缺省国家', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '44', '设置新建帐号时的默认国家：<br />默认为美国', 5, 6, '2013-09-30 16:14:59', '2013-09-27 10:56:48', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none('),
(137, '传真号码', 'ACCOUNT_FAX_NUMBER', 'true', '创建帐号时显示传真号码字段', 5, 10, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(138, '显示电子商情选择框', 'ACCOUNT_NEWSLETTER_STATUS', '1', '显示电子商情选择框<br />0= 否<br />1= 显示未选择<br />2= 显示已选择<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章</strong>', 5, 45, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(139, '缺省电子邮件格式', 'ACCOUNT_EMAIL_PREFERENCE', '0', '设置客户缺省电子邮件格式<br />0= 文本<br />1= HTML<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章。</strong>', 5, 46, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(140, '商品通知', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', '结帐时是否提示客户商品通知<br />0= 不提示<br />1= 提示 (除非已选择全局通知)<br /><br />提示: 边框要另外关闭', 5, 50, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(141, '购物模式 - 查看商品和价格', 'CUSTOMERS_APPROVAL', '0', '客户是否需要批准后才能购物<br />0= 不需要<br />1= 登录后才能浏览<br />2= 可以浏览，但登录后才显示价格<br />3= 演示用途<br /><br />建议选项 2 用于防止Spiders，如果您希望客户登录后才能查看价格。', 5, 55, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(142, '客户批准模式 - 授权等待中', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', '客户是否需要授权后才能购物<br />0= 不需要授权<br />1= 授权后才能浏览<br />2= 可以浏览，但授权后才显示价格<br />3= 客户可以浏览商品和价格，但需要授权后才可购物<br /><br />推荐使用选项 2 或 3 防止Spiders', 5, 65, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(143, '客户授权: 文件名', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', '客户授权的文件名<br />提示: 不要包含后缀<br />缺省=customers_authorization', 5, 66, NULL, '2013-09-27 10:56:48', NULL, ''),
(144, '客户授权: 隐藏页眉', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', '客户授权: 隐藏页眉 <br />(true=隐藏 false=显示)', 5, 67, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(145, '客户授权: 隐藏左栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', '客户授权: 隐藏左栏目 <br />(true=隐藏 false=显示)', 5, 68, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(146, '客户授权: 隐藏右栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', '客户授权: 隐藏右栏目 <br />(true=隐藏 false=显示)', 5, 69, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(147, '客户授权: 隐藏页脚', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', '客户授权: 隐藏页脚 <br />(true=隐藏 false=显示)', 5, 70, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(148, '客户授权: 隐藏价格', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', '客户授权: 隐藏价格 <br />(true=隐藏 false=显示)', 5, 71, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(149, '客户推荐模式', 'CUSTOMERS_REFERRAL_STATUS', '0', '客户推荐代码创建于<br />0= 关闭<br />1= 用户使用的第一张优惠券的号码<br />2= 客户可以在创建帐号时添加，如果为空可以编辑<br /><br />提示: 一旦客户推荐号码设置好，只能在客户管理下修改', 5, 80, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(150, '已安装支付模块', 'MODULE_PAYMENT_INSTALLED', 'alipay.php;freecharger.php;paypal.php', '支付模块文件名用分号隔开。自动更新，无需编辑。(例如: freecharger.php;cod.php;paypal.php)', 6, 0, '2013-10-08 17:16:37', '2013-09-27 10:56:48', NULL, NULL),
(151, '已安装总额计算模块', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', '总额计算模块文件名用分号分开。自动更新，无需编辑。(例如: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2013-09-27 10:56:48', NULL, NULL),
(152, '已安装配送模块', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', '配送模块文件名用分号分开。自动更新，无需编辑。(例如: ups.php;flat.php;item.php)', 6, 0, NULL, '2013-09-27 10:56:48', NULL, NULL),
(153, '启用免运费模块', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', '要启用免运费模块吗?', 6, 0, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(154, '免运费成本', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', '免运费成本?', 6, 6, NULL, '2013-09-27 10:56:48', NULL, NULL),
(155, '手续费', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', '免运费手续费。', 6, 0, NULL, '2013-09-27 10:56:48', NULL, NULL),
(156, '税率', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', '免运费手续费税率。', 6, 0, NULL, '2013-09-27 10:56:48', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(157, '免运费地区', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', '如果免运费，仅限于该地区。', 6, 0, NULL, '2013-09-27 10:56:48', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(158, '显示排序', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', '显示排序。', 6, 0, NULL, '2013-09-27 10:56:48', NULL, NULL),
(159, '商店提货', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', '使用商店提货?', 6, 0, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(160, '商店提货费用', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', '商店提货费用。', 6, 0, NULL, '2013-09-27 10:56:48', NULL, NULL),
(161, '税率', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', '商店提货处理费税率。', 6, 0, NULL, '2013-09-27 10:56:48', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(162, '税率基准', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', 6, 0, NULL, '2013-09-27 10:56:48', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing''), '),
(163, '配送地区', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(164, '显示排序', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', '显示的排序。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(165, '按件计价', 'MODULE_SHIPPING_ITEM_STATUS', 'True', '使用按件计价吗?', 6, 0, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(166, '运输费用', 'MODULE_SHIPPING_ITEM_COST', '2.50', '运输费用随订单内件数的增加而增加的配送方式。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(167, '手续费', 'MODULE_SHIPPING_ITEM_HANDLING', '0', '此配送方式的手续费。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(168, '税率', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', '此运费用下面的税率。', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(169, '税率基准', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', 6, 0, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(170, '配送地区', 'MODULE_SHIPPING_ITEM_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式.', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(171, '显示排序', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', '显示的顺序。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(172, '启用免费商品模块', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'False', '您接受商品免费吗?', 6, 1, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(173, '显示排序.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', '显示的顺序。低的显示在前。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(174, '支付地区', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', '如果选择地区则仅限该地区使用此支付方式。', 6, 2, NULL, '2013-09-27 10:56:49', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(175, '设置订单状态', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', '设置该支付方式下订单状态为', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(176, '打开PayPal支付模块', 'MODULE_PAYMENT_PAYPAL_STATUS', 'False', '您要使用PayPal支付方式吗?', 6, 0, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(177, '商业编号', 'MODULE_PAYMENT_PAYPAL_BUSINESS_ID', 'admin@localhost', '您的PayPal帐号的主要电子邮件地址<br />说明：该地址必须与PayPal上设置的主要电子邮件地址<strong>完全一致</strong>，并且要注意<strong>大小写</strong>。', 6, 2, NULL, '2013-09-27 10:56:49', NULL, NULL),
(178, '交易货币', 'MODULE_PAYMENT_PAYPAL_CURRENCY', 'Selected Currency', '随订单发送到PayPal的货币<br />说明: 如果选择了非PayPal支持的货币，将自动转换为美元。', 6, 3, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''Selected Currency'', ''Only USD'', ''Only AUD'', ''Only CAD'', ''Only EUR'', ''Only GBP'', ''Only CHF'', ''Only CZK'', ''Only DKK'', ''Only HKD'', ''Only HUF'', ''Only JPY'', ''Only NOK'', ''Only NZD'', ''Only PLN'', ''Only SEK'', ''Only SGD'', ''Only THB'', ''Only MXN'', ''Only ILS'', ''Only PHP'', ''Only TWD'', ''Only BRL'', ''Only MYR''), '),
(179, '付款地区', 'MODULE_PAYMENT_PAYPAL_ZONE', '0', '如果选择了付款地区，仅该地区可以使用该支付模块。', 6, 4, NULL, '2013-09-27 10:56:49', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(180, '设置通知状态', 'MODULE_PAYMENT_PAYPAL_PROCESSING_STATUS_ID', '1', '设置通过该支付方式付款，但还没有完成的订单状态为<br />(推荐状态''等待中'')', 6, 5, NULL, '2013-09-27 10:56:49', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(181, '设置订单状态', 'MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID', '2', '设置通过该支付方式付款的订单状态<br />(推荐''处理中'')', 6, 6, NULL, '2013-09-27 10:56:49', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(182, '退款订单状态', 'MODULE_PAYMENT_PAYPAL_REFUND_ORDER_STATUS_ID', '1', '设置通过该支付方式退款的订单状态<br />(推荐''等待中'')', 6, 7, NULL, '2013-09-27 10:56:49', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(183, '显示顺序', 'MODULE_PAYMENT_PAYPAL_SORT_ORDER', '0', '显示顺序：小的显示在前。', 6, 8, NULL, '2013-09-27 10:56:49', NULL, NULL),
(184, '地址替代', 'MODULE_PAYMENT_PAYPAL_ADDRESS_OVERRIDE', '1', '如果设置为 1，Zen Cart输入的地址会替代客户在PayPal上储存的地址。客户将看到Zen Cart的地址，但不能修改。<br />(如地址不正确，PayPal将认为没有提交地址或者override=0)<br />0=不覆盖<br />1=ZC地址替代PayPal地址', 6, 18, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'',''1''), '),
(185, '送货地址选项', 'MODULE_PAYMENT_PAYPAL_ADDRESS_REQUIRED', '2', '送货地址。如果设置为 0，将提示您的客户输入送货地址。如果设置为 1，将不提示客户输入送货地址。如果设置为 2，客户必须输入送货地址。<br />0=提示<br />1=不询问<br />2=必须<br /><br /><strong>提示: 如果允许客户输入自己的送货地址，您一定要核对PayPal确认信息上地址无误。使用Website Payments Standard (IPN), Zen Cart 不知道客户是否会选择和订单上不同的送货地址。</strong>', 6, 20, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'',''1'',''2''), '),
(186, '购物车商品清单', 'MODULE_PAYMENT_PAYPAL_DETAILED_CART', 'No', '要向PayPal传递详细的商品清单吗? 如设置为True，将传递详细的购物清单', 6, 22, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''No'',''Yes''), '),
(187, '页面风格', 'MODULE_PAYMENT_PAYPAL_PAGE_STYLE', 'Primary', '定制付款页面的风格。页面风格的值是您添加或编辑页面风格时输入的名字。您可以在PayPal网址上，添加或修改客户定制的付款页面风格，位于我的帐号选项下面。如果您要使用主要风格，设置为"primary." 如果要使用缺省风格，设置为"paypal".', 6, 25, NULL, '2013-09-27 10:56:49', NULL, NULL),
(188, 'PayPal服务的模式<br /><br />缺省:<br /><code>www.paypal.com/cgi-bin/webscr</code><br />或者<br /><code>www.paypal.com/us/cgi-bin/webscr</code><br />or for the UK,<br /><code>www.paypal.com/uk/cgi-bin/webscr</code>', 'MODULE_PAYMENT_PAYPAL_HANDLER', 'www.paypal.com/cgi-bin/webscr', '选择PayPal正式交易的网址', 6, 73, NULL, '2013-09-27 10:56:49', NULL, ''),
(189, 'PDT Token (Payment Data Transfer)', 'MODULE_PAYMENT_PAYPAL_PDTTOKEN', '', '在这里输入PDT Token值，在处理结束后立刻激活交易。', 6, 25, NULL, '2013-09-27 10:56:49', 'zen_cfg_password_display', NULL),
(190, '调试模式', 'MODULE_PAYMENT_PAYPAL_IPN_DEBUG', 'Off', '打开调试模式吗? <br />说明: 会发送大量用于调试的邮件!<br />记录文件位于/includes/modules/payment/paypal/logs 目录<br />电子邮件发送到店主的邮箱。<br />不建议使用邮件选项。<br /><strong>通常设置为OFF。</strong>', 6, 71, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''Off'',''Log File'',''Log and Email''), '),
(191, '调试电子邮件地址', 'MODULE_PAYMENT_PAYPAL_DEBUG_EMAIL_ADDRESS', 'admin@localhost', '用于接收调试信息的电子邮件地址', 6, 72, NULL, '2013-09-27 10:56:49', NULL, NULL),
(192, '含税', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', '计算时含税?', 6, 6, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(193, '该模块已安装', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true''), '),
(194, '显示排序', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', '显示的顺序.', 6, 2, NULL, '2013-09-27 10:56:49', NULL, NULL),
(195, '含运费', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', '计算时含运费?', 6, 5, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(196, '重算税价', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', '重新计算税', 6, 7, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''), '),
(197, '税率', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', '团体优惠时使用税率.', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(198, '使用固定运费', 'MODULE_SHIPPING_FLAT_STATUS', 'True', '您要使用固定运费吗?', 6, 0, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(199, '配送费用', 'MODULE_SHIPPING_FLAT_COST', '5.00', '所有订单都收取该费用。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(200, '税率种类', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', '采用下面的运费税种。', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(201, '税率基准', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', 6, 0, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(202, '配送地区', 'MODULE_SHIPPING_FLAT_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', 6, 0, NULL, '2013-09-27 10:56:49', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(203, '显示排序', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', '显示的顺序', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(204, '缺省货币', 'DEFAULT_CURRENCY', 'CNY', '缺省货币', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(205, '缺省语言', 'DEFAULT_LANGUAGE', 'gb', '缺省语言', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(206, '缺省的新订单状态', 'DEFAULT_ORDERS_STATUS_ID', '1', '新建一个订单时，订单状态为该值。', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(207, '显示管理configuration_key', 'ADMIN_CONFIGURATION_KEY_ON', '0', '设置为1将在配置页面下显示configuration_key的名称', 6, 0, NULL, '2013-09-27 10:56:49', NULL, NULL),
(208, '始发国家或地区', 'SHIPPING_ORIGIN_COUNTRY', '44', '选择计算运费的始发国家或地区。', 7, 1, NULL, '2013-09-27 10:56:49', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(209, '邮编', 'SHIPPING_ORIGIN_ZIP', 'NONE', '输入商店邮编，用于运费计算。', 7, 2, NULL, '2013-09-27 10:56:49', NULL, NULL),
(210, '最大包裹重量', 'SHIPPING_MAX_WEIGHT', '50', '邮递公司对单件包裹的最大重量限制。', 7, 3, NULL, '2013-09-27 10:56:49', NULL, NULL),
(211, '小包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_WEIGHT', '0:3', '输入小包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', 7, 4, NULL, '2013-09-27 10:56:49', NULL, NULL),
(212, '大包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_PADDING', '10:0', '输入大包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', 7, 5, NULL, '2013-09-27 10:56:49', NULL, NULL),
(213, '显示箱数和重量', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', '显示货物重量和箱数?<br /><br />0= 否<br />1= 只显示箱数<br />2= 只显示重量<br />3= 箱数和重量', 7, 15, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(214, '运费估价显示', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= 否<br />1= 在购物车上显示按钮<br />2= 在购物车页面显示列表', 7, 20, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(215, '在发票管理中显示订单说明', 'ORDER_COMMENTS_INVOICE', '1', '在发票管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', 7, 25, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(216, '在装箱单管理中显示订单说明', 'ORDER_COMMENTS_PACKING_SLIP', '1', '在装箱单管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', 7, 26, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(217, '无重量商品免运费', 'ORDER_WEIGHT_ZERO_STATUS', '0', '如果订单商品重量为零，免运费吗?<br />0= 否<br />1= 是<br /><br />提示: 免运费时，打开免运费模块，这只会在免运费时显示。', 7, 15, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(218, '显示商品图像', 'PRODUCT_LIST_IMAGE', '1', '要显示商品图像吗?', 8, 1, NULL, '2013-09-27 10:56:49', NULL, NULL),
(219, '显示厂商名字', 'PRODUCT_LIST_MANUFACTURER', '0', '要显示商品厂商名字吗?', 8, 2, NULL, '2013-09-27 10:56:49', NULL, NULL),
(220, '显示商品型号', 'PRODUCT_LIST_MODEL', '0', '要显示商品型号吗?', 8, 3, NULL, '2013-09-27 10:56:49', NULL, NULL),
(221, '显示商品名称', 'PRODUCT_LIST_NAME', '2', '要显示商品名称吗?', 8, 4, NULL, '2013-09-27 10:56:49', NULL, NULL),
(222, '显示商品价格/加入购物车', 'PRODUCT_LIST_PRICE', '3', '要显示商品价格/添加到购物车吗?', 8, 5, NULL, '2013-09-27 10:56:49', NULL, NULL),
(223, '显示商品数量', 'PRODUCT_LIST_QUANTITY', '0', '要显示商品数量吗?', 8, 6, NULL, '2013-09-27 10:56:49', NULL, NULL),
(224, '显示商品重量', 'PRODUCT_LIST_WEIGHT', '0', '要显示商品重量吗?', 8, 7, NULL, '2013-09-27 10:56:49', NULL, NULL),
(225, '商品价格/添加到购物车方框的宽度', 'PRODUCTS_LIST_PRICE_WIDTH', '125', '定义商品价格/添加到购物车方框的宽度<br />缺省= 125', 8, 8, NULL, '2013-09-27 10:56:49', NULL, NULL),
(226, '显示分类/厂商过滤 (0=关; 1=开)', 'PRODUCT_LIST_FILTER', '1', '要显示分类/厂商过滤吗?', 8, 9, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(227, '前/后分页导航条 (1-页面顶部, 2-页面底部, 3-同时)', 'PREV_NEXT_BAR_LOCATION', '3', '设置前/后分页导航条的位置', 8, 10, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(228, '显示商品列表缺省排序', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', '商品列表缺省排序<br />提示: 留空为商品排序。按照您指定的顺序排序商品列表。例如: 2a', 8, 15, NULL, '2013-09-27 10:56:49', NULL, NULL),
(229, '显示添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', '要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong> 如果采用选项2，请关闭下面的多个商品数量方框', 8, 20, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(230, '显示多个商品数量方框状态和设置按钮位置', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 8, 25, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(231, '显示商品介绍', 'PRODUCT_LIST_DESCRIPTION', '150', '要显示商品介绍吗?<br /><br />0= 否<br />150= 建议长度, 或输入显示的最多字数', 8, 30, NULL, '2013-09-27 10:56:49', NULL, NULL);
INSERT INTO `zen_configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(232, '商品列表升序标记', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', '用于表示升序的标记<br />缺省 = +', 8, 40, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_textarea_small('),
(233, '商品列表降序标记', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', '用于表示降序的标记<br />缺省 = -', 8, 41, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_textarea_small('),
(234, '商品列表中显示字母过滤选择', 'PRODUCT_LIST_ALPHA_SORTER', 'true', '在商品列表中显示字母过滤的选择吗?', 8, 50, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(235, '显示商品列表子分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', '在商品列表中显示子分类图像吗?', 8, 52, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(236, '显示商品列表总分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', '在商品列表中显示总分类图像吗?', 8, 53, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(237, '导航显示子分类', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', '经由总分类导航时显示子分类<br /><br />0= 否<br />1= 是', 8, 60, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(238, '检查库存', 'STOCK_CHECK', 'true', '检查库存是否足够', 9, 1, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(239, '减少库存', 'STOCK_LIMITED', 'true', '按照订单从库存中自动减少商品', 9, 2, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(240, '允许结帐', 'STOCK_ALLOW_CHECKOUT', 'true', '即使库存不够，也允许客户结帐', 9, 3, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(241, '显示缺货', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', '在屏幕上提示客户商品库存量不足', 9, 4, NULL, '2013-09-27 10:56:49', NULL, NULL),
(242, '重新进货', 'STOCK_REORDER_LEVEL', '5', '定义何时需要重新进货', 9, 5, NULL, '2013-09-27 10:56:49', NULL, NULL),
(243, '缺货时, 商品的状态为', 'SHOW_PRODUCTS_SOLD_OUT', '0', '显示商品缺货<br /><br />0= 设置商品状态为关闭<br />1= 设置商品状态为打开', 9, 10, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(244, '用缺货图标代替加入购物车按钮', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', '不显示加入购物车按钮，而显示缺货图标<br /><br />0= 否<br />1= 是', 9, 11, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(245, '数量小数位', 'QUANTITY_DECIMALS', '0', '商品数量允许几位小数?<br /><br />0= 不允许', 9, 15, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(246, '购物车上显示 - 复选框或删除按钮', 'SHOW_SHOPPING_CART_DELETE', '3', '在购物车上显示，复选框或删除按钮<br /><br />1= 只显示删除按钮<br />2= 只显示复选框<br />3= 同时显示删除按钮和复选框', 9, 20, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(247, '购物车上显示 - 更新购物车按钮的位置', 'SHOW_SHOPPING_CART_UPDATE', '3', '在购物车上显示更新购物车按钮，位于:<br /><br />1= 每个数量框后面<br />2= 所有商品下面<br />3= 同时显示在每个数量框后面和所有商品下面', 9, 22, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(248, '在空购物车页面显示新进商品', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', '在空购物车页面显示新进商品<br />0= 否或设置显示顺序', 9, 30, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(249, '在空购物车页面显示推荐商品', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', '在空购物车页面显示推荐商品<br />0= 否或设置显示顺序', 9, 31, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(250, '在空购物车页面显示特价商品', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', '在空购物车页面显示特价商品<br />0= 否或设置显示顺序', 9, 32, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(251, '在空购物车页面显示预售商品', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', '在空购物车页面显示预售商品<br />0= 否或设置显示顺序', 9, 33, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(252, '登录时提醒合并购物车', 'SHOW_SHOPPING_CART_COMBINED', '1', '客户登录时，如果以前购物车中有商品，将于现有购物车中的商品合并。<br /><br />要提醒客户吗?<br /><br />0= OFF, 不提醒<br />1= Yes 提醒并转到购物车页面<br />2= Yes 提醒，但不转到购物车页面', 9, 35, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(253, '网页解析时间', 'STORE_PAGE_PARSE_TIME', 'false', '保存解析页面的时间', 10, 1, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(254, '日志保存到', 'STORE_PAGE_PARSE_TIME_LOG', 'D:/www/vovor/shop/cache/page_parse_time.log', '记录页面解析时间的目录和文件名', 10, 2, NULL, '2013-09-27 10:56:49', NULL, NULL),
(255, '日志日期格式', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', '日期格式', 10, 3, NULL, '2013-09-27 10:56:49', NULL, NULL),
(256, '显示网页解析时间', 'DISPLAY_PAGE_PARSE_TIME', 'false', '在每个页面底部显示页面解析时间<br />显示解析时间并不要求保存。', 10, 4, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(257, '保存数据库查询', 'STORE_DB_TRANSACTIONS', 'false', '在页面解析时间记录中保存数据库查询(仅适用PHP4)', 10, 5, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(258, '电子邮件发送方式', 'EMAIL_TRANSPORT', 'smtpauth', '设置发送邮件的方式。<br /><strong>PHP</strong>为缺省方式，采用内置的PHP处理方式。<br />采用Windows和MacOS的服务器要修改该设置为<strong>SMTP</strong>。<br /><br /><strong>SMTPAUTH</strong>仅在服务器要求SMTP验证时使用，同时要设置SMTPAUTH的相应参数。<br /><br /><strong>sendmail</strong>用于linux/unix主机，使用主机上的sendmail程序<br /><strong>"sendmail-f"</strong>仅当服务器要求 -f 参数发送邮件，这个安全措施可以防止欺骗，但如果邮件服务器未设置使用该选项，会出错。<br /><br /><strong>Qmail</strong>用于linux/unix主机的Qmail邮件功能 /var/qmail/bin/sendmail', 12, 1, '2013-09-30 15:22:13', '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''PHP'', ''sendmail'', ''sendmail-f'', ''smtp'', ''smtpauth'', ''Qmail''),'),
(259, 'SMTP帐号邮箱', 'EMAIL_SMTPAUTH_MAILBOX', 'wowopeidi@163.com', '输入邮箱帐号名 (me@mydomain.com) 。这是SMTP授权帐号名。<br />仅在使用SMTPAUTH时需要。', 12, 101, '2013-10-10 11:43:46', '2013-09-27 10:56:49', NULL, NULL),
(260, 'SMTP帐号密码', 'EMAIL_SMTPAUTH_PASSWORD', 'peidiwowo', '输入SMTP邮箱的密码。<br />仅在使用SMTPAUTH时需要。', 12, 101, '2013-10-10 11:43:52', '2013-09-27 10:56:49', 'zen_cfg_password_display', NULL),
(261, 'SMTP主机', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'smtp.163.com', '输入SMTP邮件服务器的DNS名字<br />例如: mail.mydomain.com<br />或 55.66.77.88', 12, 101, '2013-10-10 11:43:58', '2013-09-27 10:56:49', NULL, NULL),
(262, 'SMTP服务器端口', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', '输入SMTP邮件服务器端口号', 12, 101, '2013-09-29 11:09:19', '2013-09-27 10:56:49', NULL, NULL),
(263, '在文本格式邮件中转换货币符号', 'CURRENCIES_TRANSLATIONS', '', '文本格式邮件中使用什么货币符号转换？', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small('),
(264, '电子邮件换行', 'EMAIL_LINEFEED', 'LF', '定义分开邮件头的换行符', 12, 2, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''LF'', ''CRLF''),'),
(265, '使用HTML格式发送电子邮件', 'EMAIL_USE_HTML', 'false', '是否使用HTML格式发送电子邮件', 12, 3, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(266, '通过DNS核对电子邮件地址', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', '是否通过DNS核对电子邮件地址', 6, 6, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(267, '发送电子邮件', 'SEND_EMAILS', 'true', '是否发出电子邮件', 12, 5, '2013-10-09 14:29:14', '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(268, '电子邮件存档', 'EMAIL_ARCHIVE', 'false', '如果您在发邮件时，需要保存复制件，设置为 "true"。', 12, 6, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(269, '电子邮件出错信息', 'EMAIL_FRIENDLY_ERRORS', 'false', '如果邮件失败，是否显示错误信息?  设置为false将显示PHP错误信息. 仅在调试时设置为false.', 12, 7, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(270, '用于显示的店主邮件地址', 'STORE_OWNER_EMAIL_ADDRESS', 'wowopeidi@163.com', '商店店主的电子邮件，显示给客户的联系方式。', 12, 10, '2013-10-10 11:43:38', '2013-09-27 10:56:49', NULL, NULL),
(271, '发件人邮件地址', 'EMAIL_FROM', 'wowopeidi@163.com', '缺省的电子邮件发送人地址，在管理模块下输入邮件时可修改。', 12, 11, '2013-10-10 11:43:40', '2013-09-27 10:56:49', NULL, NULL),
(272, '电子邮件必须从现有域名发送', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', '您的邮件服务器是否要求所有发出的邮件发送地址为你现有的域名？<br /><br />该设置通常用于防止欺骗和垃圾邮件。如果设置为Yes，所有邮件的发送地址为上面设置的发件人邮件地址。', 12, 11, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(273, '管理员电子邮件格式', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', '请选择管理员电子邮件格式', 12, 12, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''TEXT'', ''HTML''), '),
(274, '发送订单确认电子邮件的复件到', 'SEND_EXTRA_ORDER_EMAILS_TO', '2196848320@qq.com', '发送订单确认电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 12, '2013-09-27 11:06:39', '2013-09-27 10:56:49', NULL, NULL),
(275, '发送创建帐号电子邮件的复件 - 状态', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', '是否发送创建帐号电子邮件的复件<br />0= 否 1= 是', 12, 13, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(276, '发送创建帐号电子邮件的复件到', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', '123123@qq.com', '发送创建帐号电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 14, NULL, '2013-09-27 10:56:49', NULL, NULL),
(277, '发送客户发送礼券的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', '是否发送客户发送礼券的电子邮件的复件<br />0= 否 1= 是', 12, 17, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(278, '发送客户发送礼券的电子邮件的复件到', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', '123123@qq.com', '发送客户发送礼券的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 18, NULL, '2013-09-27 10:56:49', NULL, NULL),
(279, '发送客户管理礼券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理礼券邮件的电子邮件的复件<br />0= 否 1= 是', 12, 19, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(280, '发送客户管理礼券邮件的电子邮件的复件到', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', '123123@qq.com', '发送客户管理礼券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 20, NULL, '2013-09-27 10:56:49', NULL, NULL),
(281, '发送客户管理优惠券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理优惠券邮件的电子邮件的复件<br />0= 否 1= 是', 12, 21, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(282, '发送客户管理优惠券邮件的电子邮件的复件到', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', '123123@qq.com', '发送客户管理优惠券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 22, NULL, '2013-09-27 10:56:49', NULL, NULL),
(283, '发送管理订单状态的电子邮件的复件 - 状态', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', '是否发送管理订单状态的电子邮件的复件<br />0= 否 1= 是', 12, 23, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(284, '发送管理订单状态的电子邮件的复件到', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', '123123@qq.com', '发送管理订单状态的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 24, NULL, '2013-09-27 10:56:49', NULL, NULL),
(285, '发送等待审核的电子邮件的复件 - 状态', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', '是否发送等待审核的电子邮件的复件<br />0= 否 1= 是', 12, 25, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(286, '发送等待审核的电子邮件的复件到', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', '123123@qq.com', '发送等待审核的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 26, NULL, '2013-09-27 10:56:49', NULL, NULL),
(287, '设置 "联系我们" 电子邮件下拉列表', 'CONTACT_US_LIST', '', '设置"联系我们"页面上列出的电子邮件地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;<br />仅有一个邮件地址时，不要输入，采用店主邮件地址', 12, 40, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_textarea('),
(288, '联系我们 - 显示商店名称和地址', 'CONTACT_US_STORE_NAME_ADDRESS', '1', '包含商店名称和地址<br />0= 否 1= 是', 12, 50, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(289, '商品库存提醒', 'SEND_LOWSTOCK_EMAIL', '0', '当商品处于低库存时，是否发送电子邮件<br />0= 否<br />1= 是', 12, 60, '2013-09-27 10:56:49', '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(290, '发送库存提醒邮件到', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', '2196848320@qq.com', '当商品处于低库存时，发送电子邮件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', 12, 61, '2013-09-27 11:06:53', '2013-09-27 10:56:49', NULL, NULL),
(291, '显示退订电子商情链接', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', '是否在[信息]边框中，显示退订电子商情的链接？', 12, 70, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(292, '显示客户选择计数', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', '显示接收人名单时，是否显示计数？<br /><em>(如果有很多客户，这会影响速度)</em>', 12, 90, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(293, '允许下载', 'DOWNLOAD_ENABLED', 'true', '打开商品下载功能', 13, 1, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(294, '重定向下载', 'DOWNLOAD_BY_REDIRECT', 'true', '使用浏览器的重定向下载。在非Unix系统上关闭该功能。<br /><br />提示: 重定向打开时，将/pub设为777', 13, 2, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(295, '分块下载', 'DOWNLOAD_IN_CHUNKS', 'false', '如果关闭重定向下载，而您的PHP内存限制的设置低于8 MB，您可能需要打开该选项，使文件分块发送到浏览器。<br /><br />重定向下载打开时没有作用。', 13, 2, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(296, '下载有效期 (天数)', 'DOWNLOAD_MAX_DAYS', '7', '设置下载有效天数。0 表示无限制。', 13, 3, NULL, '2013-09-27 10:56:49', NULL, ''),
(297, '允许下载次数 - 每件商品', 'DOWNLOAD_MAX_COUNT', '5', '设置允许下载次数。0 表示不允许下载。', 13, 4, NULL, '2013-09-27 10:56:49', NULL, ''),
(298, '下载控制更新状态值', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', '哪个订单状态重置下载天数和下载次数 - 缺省为 4', 13, 10, '2013-09-27 10:56:49', '2013-09-27 10:56:49', NULL, NULL),
(299, '下载控制订单状态值 >= 最低状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', '下载控制订单状态值 - 缺省 >= 2<br /><br />是否允许下载取决于订单的状态，订单状态高于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最低值。', 13, 12, '2013-09-27 10:56:49', '2013-09-27 10:56:49', NULL, NULL),
(300, '下载控制订单状态值 <= 最高状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', '下载控制订单状态值 - 缺省 <= 4<br /><br />是否允许下载取决于订单的状态，订单状态低于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最高值。', 13, 13, '2013-09-27 10:56:49', '2013-09-27 10:56:49', NULL, NULL),
(301, '允许属性定价', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', '允许属性定价', 13, 25, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(302, '允许批量优惠', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', '允许批量优惠', 13, 26, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(303, '允许属性图像', 'ATTRIBUTES_ENABLED_IMAGES', 'true', '允许属性图像', 13, 28, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(304, '允许按词或字定价', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', '允许按词或字定价', 13, 35, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(305, '文字价格 - 空格免费', 'TEXT_SPACES_FREE', '1', '文字定价时，空格免费<br /><br />0= 否 1= 是', 13, 36, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(306, '只读选项类型 - 忽略添加到购物车', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', '当一个商品属性为只读时，是否显示添加到购物车按钮?<br />0= 不显示<br />1= 显示', 13, 37, NULL, '2013-09-27 10:56:49', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(307, '打开GZip压缩', 'GZIP_LEVEL', '0', '0= 否 1= 是', 14, 1, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(308, 'Sessions目录', 'SESSION_WRITE_DIRECTORY', 'D:/www/vovor/shop/cache', '如果sessions是基于文件的，保存在该目录。', 15, 1, NULL, '2013-09-27 10:56:50', NULL, NULL),
(309, 'Cookie域名', 'SESSION_USE_FQDN', 'True', '如果选True，域名全称用于保存cookie, 例如：www.mydomain.com。如果选False，仅用域名的部分，例如：mydomain.com。如果您不确定，可以选True。', 15, 2, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(310, '强制使用Cookie', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(311, '检查SSL Sessions编号', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(312, '检查用户代理', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(313, '检查IP地址', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(314, '阻止机器人Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(315, '重建Sessions', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(316, 'IP到主机名转换', 'SESSION_IP_TO_HOST_ADDRESS', 'false', '转换IP地址为主机名<br /><br />提示: 在某些服务器上，会降低session初始化的速度或电子邮件执行时间。', 15, 10, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(317, '兑现代码长度', 'SECURITY_CODE_LENGTH', '10', '输入兑现代码长度<br />越长越安全', 16, 1, NULL, '2013-09-27 10:56:50', NULL, NULL),
(318, '缺省的金额为零的订单状态', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', '当订单的余额为零, 订单状态为', 16, 0, NULL, '2013-09-27 10:56:50', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(319, '新客户的优惠券编号', 'NEW_SIGNUP_DISCOUNT_COUPON', '', '选择优惠券<br />', 16, 75, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_coupon_id('),
(320, '新客户的礼券金额', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', '没有就留空<br />或输入金额，如 10 表示 10.00元', 16, 76, NULL, '2013-09-27 10:56:50', NULL, NULL),
(321, '优惠券每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', '每页显示的优惠券数量', 16, 81, NULL, '2013-09-27 10:56:50', NULL, NULL),
(322, '优惠券分析页面上每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', '分析页面显示的优惠券数量', 16, 81, NULL, '2013-09-27 10:56:50', NULL, NULL),
(323, '接受信用卡 - VISA', 'CC_ENABLED_VISA', '1', '接受VISA 0= 否 1= 是', 17, 1, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(324, '接受信用卡 - MasterCard', 'CC_ENABLED_MC', '1', '接受MasterCard 0= 否 1= 是', 17, 2, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(325, '接受信用卡 - AmericanExpress', 'CC_ENABLED_AMEX', '0', '接受AmericanExpress 0= 否 1= 是', 17, 3, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(326, '接受信用卡 - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', '接受Diners Club 0= 否 1= 是', 17, 4, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(327, '接受信用卡 - Discover Card', 'CC_ENABLED_DISCOVER', '0', '接受Discover卡 0= 否 1= 是', 17, 5, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(328, '接受信用卡 - JCB', 'CC_ENABLED_JCB', '0', '接受JCB 0= 否 1= 是', 17, 6, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(329, '接受信用卡 - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', '接受澳大利亚银行卡 0= 否 1= 是', 17, 7, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(330, '接受信用卡 - SOLO', 'CC_ENABLED_SOLO', '0', '接受SOLO 0= 否 1= 是', 17, 8, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(331, '接受信用卡 - Switch', 'CC_ENABLED_SWITCH', '0', '接受SWITCH 0= 否 1= 是', 17, 9, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(332, '接受信用卡 - Maestro', 'CC_ENABLED_MAESTRO', '0', '接受MAESTRO 0= 否 1= 是', 17, 10, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(333, '接受信用卡 - 付款时显示', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', '付款页面是否显示接受信用卡?<br />0= 不显示<br />1= 显示文字<br />2= 显示图像<br /><br />备注: 图像和文字必须在相关信用卡的数据库和语言文件中同时定义.', 17, 50, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(334, '该模块已安装', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true''),'),
(335, '显示排序', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL),
(336, '购买队列', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', '您要将购买礼券排队吗?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(337, '含运费', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', '计算时含运费', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(338, '含税', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', '计算时含税。', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(339, '重算税价', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', '重新计算税', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(340, '税率种类', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', '接受礼券时，使用以下的税率种类。', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(341, '含税金额', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', '加入帐号时，在购买的礼券上加税', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(342, '设置订单状态', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', '设置用礼券全额付款时订单的状态', 6, 0, NULL, '2013-09-27 10:56:50', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(343, '该模块已安装', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true''),'),
(344, '显示排序', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL),
(345, '收取低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', '您要收取低额订单费用吗?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(346, '收取低额订单费的订单金额', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', '总金额低于该值的订单收取低额订单费。', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL),
(347, '低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', '按百分比收取 - 包含符号 % 例如: 10%<br />收取固定金额 - 例如: 输入 5 表示 5.00元', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL),
(348, '低额订单费适用的送货地区', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', '该送货地区收取低额订单费。', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(349, '税率种类', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', '低额订单费使用下面的税率种类。', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(350, '虚拟商品无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', '购物车中只有虚拟商品时，不收取低额订单费', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(351, '礼券无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', '购物车中只有礼券时，不收取低额订单费', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(352, '该模块已安装', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true''),'),
(353, '显示排序', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL),
(354, '允许免运费', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', '您要免运费吗?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(355, '免运费的订单金额', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', '当订单总金额大于设值时，免运费。', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL),
(356, '免运费的送货地区', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', '当送货地区为该地区时，免运费。', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(357, '该模块已安装', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(''true''),'),
(358, '显示排序', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL),
(359, '该模块已安装', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(''true''),'),
(360, '显示排序', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL),
(361, '该模块已安装', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(''true''),'),
(362, '显示排序', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL),
(363, '税率种类', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', '优惠券采用下面的税类。', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(364, '含税', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', '计算时含税。', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(365, '显示排序', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', '显示的顺序。', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL),
(366, '含运费', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', '计算时含运费', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(367, '该模块已安装', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true''),'),
(368, '重算税价', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', '重新计算税', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(369, '管理员演示', 'ADMIN_DEMO', '0', '是否打开管理员演示？<br />0= 否 1= 是', 6, 0, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(370, '商品选项类型选择', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', '该数字表示选择的商品选项', 0, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(371, '文字商品选项类型', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', '文字商品选项类型数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(372, '单选按钮商品选项类型', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', '单选按钮商品选项类型数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(373, '多选商品选项类型', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', '多选商品选项类型数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(374, '文件商品选项类型', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', '文件商品选项类型数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(375, '文字和文件商品选项类型的编号', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', '文字和文件商品选项类型的编号数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(376, '上传前缀', 'UPLOAD_PREFIX', 'upload_', '用于区分上传选项和其它选项的前缀', 0, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(377, '文字前缀', 'TEXT_PREFIX', 'txt_', '用于区分文字选项值和其它选项值的前缀', 0, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(378, '只读选项类型', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', '只读选项类型数值', 6, NULL, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, NULL),
(379, 'login mode https', 'SSLPWSTATUSCHECK', '', '系统设置，不要修改。', 6, 99, NULL, '2013-09-27 10:56:50', NULL, NULL),
(380, '商品信息 - 商品选项名称排序', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', '商品信息选项名称排序<br />0= 排序, 选项名称<br />1= 选项名称', 18, 35, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(381, '商品信息 - 商品选项属性值排序', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', '商品信息选项属性值排序<br />0= 排序, 价格<br />1= 排序, 选项值名称', 18, 36, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(382, '商品信息 - 在属性图像下显示选项值名称', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', '商品信息 - 在属性图像下显示选项值名称?<br />0= 否 1= 是', 18, 41, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(383, '商品信息 - 显示优惠', 'SHOW_SALE_DISCOUNT_STATUS', '1', '商品信息 - 是否显示优惠？<br />0= 否 1= 是', 18, 45, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(384, '商品信息 - 优惠价格的显示格式', 'SHOW_SALE_DISCOUNT', '1', '商品信息 - 优惠价格的显示格式:<br />1= 显示百分比 2= 显示金额', 18, 46, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''1'', ''2''), '),
(385, '商品信息 - 显示优惠百分比的小数位', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', '商品信息 - 优惠格式显示为百分比时的小数位:<br />缺省= 0', 18, 47, NULL, '2013-09-27 10:56:50', NULL, NULL),
(386, '商品信息 - 免费图像或文字', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', '商品信息 - 是否在价格上显示免费字样的图像或文字<br />0= 文字<br />1= 图像', 18, 50, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(387, '商品信息 - 价格面议图像或文字', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', '商品信息 - 是否在价格上显示价格面议字样的图像或文字<br />0= 文字<br />1= 图像', 18, 51, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(388, '商品数量方框 - 添加新商品', 'PRODUCTS_QTY_BOX_STATUS', '1', '添加新商品时，缺省的数量方框显示状态?<br /><br />0= 否<br />1= 是<br />提示: 打开时，会显示数量方框，缺省的[添加到购物车]数量为 1', 18, 55, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(389, '商品评论请求批准', 'REVIEWS_APPROVAL', '1', '商品评论需要批准吗?<br /><br />提示: 当评论状态为关闭时，也不会显示<br /><br />0= 否 1= 是', 18, 62, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(390, '元标签 - 标题含商品型号', 'META_TAG_INCLUDE_MODEL', '1', '在Meta标签标题中包含商品型号吗?<br /><br />0= 否 1= 是', 18, 69, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(391, '元标签 - 标题含商品价格', 'META_TAG_INCLUDE_PRICE', '1', '在Meta标签标题中包含商品价格吗?<br /><br />0= 否 1= 是', 18, 70, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(392, '元标签的描述字段字数', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', '设置元标签的描述字段字数，缺省 50:', 18, 71, NULL, '2013-09-27 10:56:50', '', ''),
(393, '每行显示的同时购买商品数', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', '每行显示的同时购买商品数<br />0= 关 或设置排序', 18, 72, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(394, '导航条 - 位置', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', '导航条位置<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 18, 21, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''否''), array(''id''=>''1'', ''text''=>''页面顶部''), array(''id''=>''2'', ''text''=>''页面底部''), array(''id''=>''3'', ''text''=>''同时'')),'),
(395, '导航条 - 排序', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', '商品的显示顺序<br />0= 商品编号<br />1= 商品名称<br />2= 商品型号<br />3= 价格, 名称<br />4= 价格, 型号<br />5= 名称, 型号<br />6= 商品排序', 18, 22, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''商品编号''), array(''id''=>''1'', ''text''=>''商品名称''), array(''id''=>''2'', ''text''=>''商品型号''), array(''id''=>''3'', ''text''=>''价格 - 名称''), array(''id''=>''4'', ''text''=>''价格 - 型号''), array(''id''=>''5'', ''text''=>''名称 - 型号''), array(''id''=>''6'', ''text''=>''商品排序'')),'),
(396, '导航条 - 按钮和图像', 'SHOW_PREVIOUS_NEXT_STATUS', '0', '是否显示按钮和图像:<br />0= 否<br />1= 是', 18, 20, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''否''), array(''id''=>''1'', ''text''=>''是'')),'),
(397, '导航条 - 按钮和图像设置', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', '显示按钮和图像的设置<br />0= 仅显示按钮<br />1= 按钮和商品图像<br />2= 仅显示商品图像', 18, 21, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''仅显示按钮''), array(''id''=>''1'', ''text''=>''按钮和商品图像''), array(''id''=>''2'', ''text''=>''仅显示商品图像'')),'),
(398, '导航条 - 图像宽度?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', '上一个/下一个 图像宽度?', 18, 22, NULL, '2013-09-27 10:56:50', '', ''),
(399, '导航条 - 图像高度?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', '上一个/下一个 图像高度?', 18, 23, NULL, '2013-09-27 10:56:50', '', ''),
(400, '分类导航条的位置', 'PRODUCT_INFO_CATEGORIES', '1', '商品的分类图像和名称位于导航条的上面<br />0= 否<br />1= 左对齐<br />2= 中间对齐<br />3= 右对齐', 18, 20, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''否''), array(''id''=>''1'', ''text''=>''左对齐''), array(''id''=>''2'', ''text''=>''中间对齐''), array(''id''=>''3'', ''text''=>''右对齐'')),'),
(401, '分类导航条的名称和图像', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', '商品分类图像和名称<br />0= 总是显示商品分类图像和名称<br />1= 只显示名称<br />2= 当非空时显示商品分类图像和名称', 18, 20, '2013-09-27 10:56:50', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''分类和图像''), array(''id''=>''1'', ''text''=>''仅分类''), array(''id''=>''2'', ''text''=>''非空时分类和图像'')),'),
(402, '栏目宽度 - 左栏目', 'BOX_WIDTH_LEFT', '170px', '左栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', 19, 1, NULL, '2003-11-21 22:16:36', NULL, NULL),
(403, '栏目宽度 - 右栏目', 'BOX_WIDTH_RIGHT', '150px', '右栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', 19, 2, NULL, '2003-11-21 22:16:36', NULL, NULL),
(404, '导航条分割符', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;》&nbsp;', '输入导航条分隔符<br />提示: 空格用 &amp;nbsp; <br />缺省 = &amp;nbsp;::&amp;nbsp;', 19, 3, '2013-09-29 12:30:14', '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(405, '导航条', 'DEFINE_BREADCRUMB_STATUS', '1', '是否显示导航条<br />0= 关<br />1= 开<br />2= 仅不显示在首页', 19, 4, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(406, '畅销商品 - 数目填充', 'BEST_SELLERS_FILLER', '&nbsp;', '用什么分割数字?<br />缺省 = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(407, '畅销商品 - 截断商品名称', 'BEST_SELLERS_TRUNCATE', '35', '商品名称截断长度?<br />缺省 = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL),
(408, '畅销商品 - 截断商品名称后面加上 ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', '截断商品名称时，后面加上 ...<br />缺省 = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(409, '购物车边框', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', '是否显示购物车边框<br />0= 总是显示<br />1= 满的时候<br />2= 满的时候，但查看购物车时不显示', 19, 8, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(410, '分类栏 - 显示特价商品链接', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', '在分类边框中显示特价商品链接', 19, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(411, '分类栏 - 显示新进商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', '在分类边框中显示新进商品链接', 19, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(412, '分类栏 - 显示推荐商品链接', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', '在分类边框中显示推荐商品链接', 19, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(413, '分类栏 - 显示所有商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', '在分类边框中显示所有商品链接', 19, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(414, '左边栏目状态 - 全局', 'COLUMN_LEFT_STATUS', '1', '显示左栏目, 除非有文件替代<br />0= 左栏目总是关闭<br />1= 左栏目打开，除非有文件替代', 19, 15, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(415, '右边栏目状态 - 全局', 'COLUMN_RIGHT_STATUS', '1', '显示右栏目, 除非有文件替代<br />0= 右栏目总是关闭<br />1= 右栏目打开, 除非有文件替代', 19, 16, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(416, '栏目宽度 - 左', 'COLUMN_WIDTH_LEFT', '170px', '左边栏目的宽度<br />可以输入 px<br />缺省 = 150px', 19, 20, NULL, '2003-11-21 22:16:36', NULL, NULL),
(417, '栏目宽度 - 右', 'COLUMN_WIDTH_RIGHT', '150px', '右边栏目的宽度<br />可以输入 px<br />缺省 = 150px', 19, 21, NULL, '2003-11-21 22:16:36', NULL, NULL),
(418, '分类分割符', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', '分类名称之间显示分割符吗?<br />0= 否<br />1= 是', 19, 24, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(419, '分类名称和计数之间的分割符', 'CATEGORIES_SEPARATOR', '', '分类名称和计数间的分割符是?<br />缺省 = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(420, '分类名称和子分类之间的分割符', 'CATEGORIES_SEPARATOR_SUBS', '', '分类名称和子分类之间的分割符是?<br />缺省 = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small('),
(421, '分类计数前缀', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', '计数要加前缀吗?<br />缺省= (', 19, 27, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(422, '分类计数后缀', 'CATEGORIES_COUNT_SUFFIX', ')', '计算后缀是?<br />缺省= )', 19, 28, NULL, '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(423, '分类子分类缩排', 'CATEGORIES_SUBCATEGORIES_INDENT', '', '子分类的缩进为?<br />缺省= &nbsp;&nbsp;', 19, 29, '2013-10-26 15:53:28', '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small('),
(424, '没有商品的分类', 'CATEGORIES_COUNT_ZERO', '0', '显示商品数量为零的分类吗?<br />0= 否<br />1= 是', 19, 30, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(425, '分隔分类边框', 'CATEGORIES_SPLIT_DISPLAY', 'True', '按商品类型分隔分类边框', 19, 31, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(426, '购物车 - 显示总计', 'SHOW_TOTALS_IN_CART', '1', '是否在购物车上显示总计<br />0= 否<br />1= 是: 件数 重量 金额<br />2= 是: 件数 重量 金额，重量为零时不显示<br />3= 是: 件数 金额', 19, 31, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(427, '顾客欢迎词 - 显示在首页', 'SHOW_CUSTOMER_GREETING', '1', '在首页上显示顾客欢迎词<br />0= 否<br />1= 是', 19, 40, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(428, '分类 - 总是显示在首页', 'SHOW_CATEGORIES_ALWAYS', '0', '首页显示分类<br />0= 否<br />1= 是<br />首页显示的分类可以是主分类或一个特定子分类', 19, 45, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(429, '首页 - 显示分类', 'CATEGORIES_START_MAIN', '1', '0= 主分类<br />或输入分类编号<br />提示: 也可以使用子分类，例如: 3_10', 19, 46, '2013-10-21 18:38:33', '2013-09-27 10:56:50', '', ''),
(430, '分类 - 显示子分类', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', '总是显示分类和子分类<br />0= 否, 只显示总分类<br />1= 是, 选择时总是显示分类和子分类', 19, 47, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(431, '广告显示组 - 标题位置 1', 'SHOW_BANNERS_GROUP_SET1', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 1，您要使用哪个广告组?<br />没有就留空', 19, 55, NULL, '2013-09-27 10:56:50', '', ''),
(432, '广告显示组 - 标题位置 2', 'SHOW_BANNERS_GROUP_SET2', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 2，您要使用哪个广告组?<br />没有就留空', 19, 56, NULL, '2013-09-27 10:56:50', '', ''),
(433, '广告显示组 - 标题位置 3', 'SHOW_BANNERS_GROUP_SET3', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 3，您要使用哪个广告组?<br />没有就留空', 19, 57, NULL, '2013-09-27 10:56:50', '', ''),
(434, '广告显示组 - 页脚位置 1', 'SHOW_BANNERS_GROUP_SET4', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 1，您要使用哪个广告组?<br />没有就留空', 19, 65, NULL, '2013-09-27 10:56:50', '', ''),
(435, '广告显示组 - 页脚位置 2', 'SHOW_BANNERS_GROUP_SET5', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 2，您要使用哪个广告组?<br />没有就留空', 19, 66, NULL, '2013-09-27 10:56:50', '', ''),
(436, '广告显示组 - 页脚位置 3', 'SHOW_BANNERS_GROUP_SET6', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 Wide-Banners<br /><br />在页脚位置 3，您要使用哪个广告组?<br />没有就留空', 19, 67, NULL, '2013-09-27 10:56:50', '', '');
INSERT INTO `zen_configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(437, '广告显示组 - 边框 banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏，您要使用哪个广告组?<br />没有就留空', 19, 70, NULL, '2013-09-27 10:56:50', '', ''),
(438, '广告显示组 - 边框 banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏2，您要使用哪个广告组?<br />没有就留空', 19, 71, NULL, '2013-09-27 10:56:50', '', ''),
(439, '广告显示组 - 边框 banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', '所有广告边框栏只可以设置一个广告组<br /><br />缺省组为 BannersAll<br /><br />在边框的所有广告栏，您要使用哪个广告组?<br />没有就留空', 19, 72, NULL, '2013-09-27 10:56:50', '', ''),
(440, '页脚 - 显示IP地址', 'SHOW_FOOTER_IP', '0', '在页脚显示客户IP地址吗<br />0= 否<br />1= 是', 19, 80, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(441, '商品优惠数量 - 添加多少空白优惠?', 'DISCOUNT_QTY_ADD', '5', '在商品价格上添加多少空白优惠?', 19, 90, NULL, '2013-09-27 10:56:50', '', ''),
(442, '商品优惠数量 - 每行显示多少?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', '商品信息页面每行显示多少优惠?', 19, 95, NULL, '2013-09-27 10:56:50', '', ''),
(443, '分类/商品显示顺序', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称', 19, 100, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6''), '),
(444, '选项名称和内容全局添加、复制和删除', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', '选项名称和内容全局添加、复制和删除<br />0= 隐藏<br />1= 显示<br />(默认=1)', 19, 110, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(445, '分类标签菜单 打开/关闭', 'CATEGORIES_TABS_STATUS', '0', '分类标签<br />在页眉显示商店的分类目录，自己发挥想象力。<br />0= 隐藏分类标签<br />1= 显示分类标签', 19, 112, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(446, '网站地图 - 是否包含我的帐号链接', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', '网站地图上是否显示到我的帐号的链接<br />说明: 搜索引擎会尝试索引该页面，通常不会转向安全页面，因为索引登录页面并无好处。<br /><br />缺省: false', 19, 115, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(447, '跳过单个商品的分类', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', '跳过单个商品的分类<br />如果设置为True，客户点击单个商品的分类时，Zen Cart将直接显示商品页面。<br />缺省: True', 19, 120, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(448, '分开登录页面', 'USE_SPLIT_LOGIN_MODE', 'False', '登录页面有两种显示模式: 分页模式 或 同页模式<br />分页模式，点击按钮后进入注册页面。同页模式，注册页面显示在登录之下。<br />缺省: True', 19, 121, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(449, 'CSS按钮', 'IMAGE_USE_CSS_BUTTONS', 'Yes', 'CSS按钮<br />使用CSS按钮替代图像(GIF/JPG)<br />按钮格式在stylesheet文件中定义。', 19, 147, '2013-10-28 12:03:13', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(450, '<strong>关闭维护中: 开/关</strong>', 'DOWN_FOR_MAINTENANCE', 'false', '网站维护中 <br />(true=是 false=否)', 20, 1, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(451, '网站维护中: 文件名', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', '网站维护中: 文件名 <br />备注: 不含后缀<br />缺省=down_for_maintenance', 20, 2, NULL, '2013-09-27 10:56:50', NULL, ''),
(452, '网站维护中: 隐藏页眉', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', '网站维护中: 隐藏页眉 <br />(true=隐藏 false=显示)', 20, 3, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(453, '网站维护中: 隐藏左栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', '网站维护中: 隐藏左栏目 <br />(true=隐藏 false=显示)', 20, 4, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(454, '网站维护中: 隐藏右栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', '网站维护中: 隐藏右栏目 <br />(true=隐藏 false=显示)', 20, 5, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(455, '网站维护中: 隐藏页脚', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', '网站维护中: 隐藏页脚 <br />(true=隐藏 false=显示)', 20, 6, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(456, '网站维护中: 隐藏价格', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', '网站维护中: 隐藏价格 <br />(true=隐藏 false=显示)', 20, 7, NULL, '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(457, '关闭维护中 (不包括该IP地址)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', '您的IP地址(管理员)', '网站维护时，该地址仍然可以访问网站 (例如网管)<br />要输入多个地址，用逗号分开。如果您不知道IP地址，可以查看商店界面的页脚。', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL),
(458, '关闭维护前发布通知: 开/关', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', '是否在网站维护前给出提醒信息<br />(true=是 false=否)<br />如果您将''网站维护中: 开/关''设为开，该值自动设为否', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(459, '维护前的通知日期和小时', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '2003/05/15  2-3 PM', '输入网站维护的日期和时间', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(460, '显示网站管理员开始维护', 'DISPLAY_MAINTENANCE_TIME', 'false', '显示网管何时开始维护 <br />(true=是 false=否)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(461, '显示网站维护时段', 'DISPLAY_MAINTENANCE_PERIOD', 'false', '显示网站维护时段 <br />(true=是 false=否)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(462, '网站维护时段', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', '输入网站维护时段(小时:分钟)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(463, '结帐时确认顾客须知中条款', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', '结帐时显示客户必须同意的顾客须知中的条款。', 11, 1, '2013-10-10 10:44:54', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(464, '创建帐号时确认隐私声明', 'DISPLAY_PRIVACY_CONDITIONS', 'false', '创建帐号时显示客户必须同意的隐私声明。', 11, 2, '2013-10-10 10:44:48', '2013-09-27 10:56:50', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(465, '显示商品图像', 'PRODUCT_NEW_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 1, NULL, '2013-09-27 10:56:50', NULL, NULL),
(466, '显示商品数量', 'PRODUCT_NEW_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 2, NULL, '2013-09-27 10:56:51', NULL, NULL),
(467, '显示商品马上购买按钮', 'PRODUCT_NEW_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 3, NULL, '2013-09-27 10:56:51', NULL, NULL),
(468, '显示商品名称', 'PRODUCT_NEW_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 4, NULL, '2013-09-27 10:56:51', NULL, NULL),
(469, '显示商品型号', 'PRODUCT_NEW_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 5, NULL, '2013-09-27 10:56:51', NULL, NULL),
(470, '显示厂商名字', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 6, NULL, '2013-09-27 10:56:51', NULL, NULL),
(471, '显示商品价格', 'PRODUCT_NEW_LIST_PRICE', '2402', '要显示商品价格吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 7, NULL, '2013-09-27 10:56:51', NULL, NULL),
(472, '显示商品重量', 'PRODUCT_NEW_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 8, NULL, '2013-09-27 10:56:51', NULL, NULL),
(473, '显示商品加入日期', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 21, 9, NULL, '2013-09-27 10:56:51', NULL, NULL),
(474, '显示商品简介', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', 21, 10, NULL, '2013-09-27 10:56:51', NULL, NULL),
(475, '商品显示缺省排序', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', '显示新进商品的缺省排序是什么?<br />缺省 = 6 日期由新到旧<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', 21, 11, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(476, '商品缺省的新组编号', 'PRODUCT_NEW_LIST_GROUP_ID', '21', '警告: 仅在新进商品组编号与缺省的21不同时，才修改该值。<br />新进商品组的编号是什么?', 21, 12, NULL, '2013-09-27 10:56:51', NULL, NULL),
(477, '显示多个商品数量方框并设定按钮位置', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 21, 25, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(478, '屏蔽预售商品', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', '要在边框和中框的新进商品列表中屏蔽预售商品吗?<br />0= 否<br />1= 是', 21, 30, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(479, '显示商品图像', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 1, NULL, '2013-09-27 10:56:51', NULL, NULL),
(480, '显示商品数量', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 2, NULL, '2013-09-27 10:56:51', NULL, NULL),
(481, '显示商品马上购买按钮', 'PRODUCT_FEATURED_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 3, NULL, '2013-09-27 10:56:51', NULL, NULL),
(482, '显示商品名称', 'PRODUCT_FEATURED_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 4, NULL, '2013-09-27 10:56:51', NULL, NULL),
(483, '显示商品型号', 'PRODUCT_FEATURED_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 5, NULL, '2013-09-27 10:56:51', NULL, NULL),
(484, '显示厂商名字', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 6, NULL, '2013-09-27 10:56:51', NULL, NULL),
(485, '显示商品价格', 'PRODUCT_FEATURED_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 7, NULL, '2013-09-27 10:56:51', NULL, NULL),
(486, '显示商品重量', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 8, NULL, '2013-09-27 10:56:51', NULL, NULL),
(487, '显示商品加入日期', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 22, 9, NULL, '2013-09-27 10:56:51', NULL, NULL),
(488, '显示商品简介', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', 22, 10, NULL, '2013-09-27 10:56:51', NULL, NULL),
(489, '商品显示缺省排序', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', '显示推荐商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', 22, 11, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(490, '推荐商品的缺省组编号', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', '警告: 仅在推荐商品组编号与缺省的22不同时，才修改该值<br />推荐商品组的编号是什么?', 22, 12, NULL, '2013-09-27 10:56:51', NULL, NULL),
(491, '显示多个商品数量方框并设定按钮位置', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 22, 25, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(492, '显示商品图像', 'PRODUCT_ALL_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 1, NULL, '2013-09-27 10:56:51', NULL, NULL),
(493, '显示商品数量', 'PRODUCT_ALL_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 2, NULL, '2013-09-27 10:56:51', NULL, NULL),
(494, '显示商品马上购买按钮', 'PRODUCT_ALL_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 3, NULL, '2013-09-27 10:56:51', NULL, NULL),
(495, '显示商品名称', 'PRODUCT_ALL_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 4, NULL, '2013-09-27 10:56:51', NULL, NULL),
(496, '显示商品型号', 'PRODUCT_ALL_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 5, NULL, '2013-09-27 10:56:51', NULL, NULL),
(497, '显示厂商名字', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 6, NULL, '2013-09-27 10:56:51', NULL, NULL),
(498, '显示商品价格', 'PRODUCT_ALL_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 7, NULL, '2013-09-27 10:56:51', NULL, NULL),
(499, '显示商品重量', 'PRODUCT_ALL_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 8, NULL, '2013-09-27 10:56:51', NULL, NULL),
(500, '显示商品加入日期', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', 23, 9, NULL, '2013-09-27 10:56:51', NULL, NULL),
(501, '显示商品简介', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', 23, 10, NULL, '2013-09-27 10:56:51', NULL, NULL),
(502, '商品显示缺省排序', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', '显示所有商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', 23, 11, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(503, '商品缺省的所有组编号', 'PRODUCT_ALL_LIST_GROUP_ID', '23', '警告: 仅在所有商品组编号与缺省的23不同时，才修改该值<br />所有商品组的编号是什么?', 23, 12, NULL, '2013-09-27 10:56:51', NULL, NULL),
(504, '显示多个商品数量方框并设定按钮位置', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', 23, 25, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(505, '在首页上显示新进商品', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', '在首页上显示新进商品<br />0= 否 或设置排序顺序', 24, 65, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(506, '在首页上显示推荐商品', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品<br />0= 否 或设置排序顺序', 24, 66, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(507, '在首页上显示特价商品', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品<br />0= 否 或设置排序顺序', 24, 67, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(508, '在首页上显示预售商品', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', '在首页上显示预售商品<br />0= 否 或设置排序顺序', 24, 68, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(509, '在首页上显示新进商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 分类和子分类<br />0= 否 或设置排序顺序', 24, 70, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(510, '在首页上显示推荐商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 分类和子分类<br />0= 否 或设置排序顺序', 24, 71, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(511, '在首页上显示特价商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 分类和子分类<br />0= 否 或设置排序顺序', 24, 72, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(512, '在首页上显示预售商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', '在首页上显示预售商品 - 分类和子分类<br />0= 否 或设置排序顺序', 24, 73, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(513, '在首页上显示新进商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', 24, 75, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(514, '在首页上显示推荐商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', 24, 76, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(515, '在首页上显示特价商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', 24, 77, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(516, '在首页上显示预售商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', '在首页上显示预售商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', 24, 78, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(517, '显示新进商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', '在商品列表下显示新进商品<br />0= 否 或设置排序顺序', 24, 85, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(518, '显示推荐商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', 24, 86, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(519, '显示特价商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', '在商品列表下显示特价商品<br />0= 否 或设置排序顺序', 24, 87, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(520, '显示预售商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', 24, 88, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(521, '新进商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', '每行显示的新进商品数', 24, 95, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(522, '推荐商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', '每行显示的推荐商品数', 24, 96, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(523, '特价商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', '每行显示的特价商品数', 24, 97, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(524, '过滤当前主分类的商品列表', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', '显示当前主分类的商品列表，还是显示所有分类中的商品?<br />0= 关闭过滤 1=打开过滤 ', 24, 100, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(525, '定义首页文字', 'DEFINE_MAIN_PAGE_STATUS', '1', '是否使用首页文字的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 60, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(526, '定义联系我们', 'DEFINE_CONTACT_US_STATUS', '1', '是否使用联系我们的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 61, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(527, '定义隐私声明', 'DEFINE_PRIVACY_STATUS', '1', '是否使用隐私声明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 62, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(528, '定义发货付款须知', 'DEFINE_SHIPPINGINFO_STATUS', '1', '是否使用发货付款须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 63, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(529, '定义顾客须知', 'DEFINE_CONDITIONS_STATUS', '1', '是否使用顾客须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 64, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(530, '定义成功结帐页面', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', '是否使用成功结帐页的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 65, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(531, '定义优惠券说明', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', '是否使用优惠券说明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 66, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(532, '定义网站地图', 'DEFINE_SITE_MAP_STATUS', '1', '是否使用网站地图的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 67, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(533, '定义Page-Not-Found', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', '使用定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字', 25, 67, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(534, '定义页面二', 'DEFINE_PAGE_2_STATUS', '1', '是否使用页面二的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 82, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(535, '定义页面三', 'DEFINE_PAGE_3_STATUS', '1', '是否使用页面三的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 83, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(536, '定义页面四', 'DEFINE_PAGE_4_STATUS', '1', '是否使用页面四的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', 25, 84, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(537, '简易页面 - 页眉', 'EZPAGES_STATUS_HEADER', '1', '在全局范围打开/关闭简易页面的页眉<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 10, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(538, '简易页面 - 页脚', 'EZPAGES_STATUS_FOOTER', '1', '在全局范围打开/关闭简易页面的页脚<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 11, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(539, '简易页面 - 边框', 'EZPAGES_STATUS_SIDEBOX', '1', '在全局范围打开/关闭简易页面的边框<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', 30, 12, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(540, '简易页面页眉分隔符', 'EZPAGES_SEPARATOR_HEADER', '::', '简易页面页眉分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(541, '简易页面页脚分隔符', 'EZPAGES_SEPARATOR_FOOTER', '::', '简易页面页脚分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(542, '简易页面导航按钮', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', '是否在简易页面上显示导航按钮<br />0=否 (无按钮)<br />1="继续"<br />2="上一页/继续/下一页"<br /><br />缺省: 2', 30, 30, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(543, '简易页面目录', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', '打开简易页面章节的目录吗?<br />0= OFF<br />1= ON', 30, 35, '2013-09-27 10:56:51', '2013-09-27 10:56:51', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(544, '简易页面中不显示页眉的页面', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', '简易页面中不显示商店的页眉的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 1,5,2<br />或留空。', 30, 40, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(545, '简易页面中不显示页脚的页面', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', '简易页面中不显示商店的页脚的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,7<br />或留空。', 30, 41, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(546, '简易页面中不显示左栏目的页面', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的左栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 21<br />或留空。', 30, 42, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(547, '简易页面中不显示右栏目的页面', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的右栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,82,13<br />或留空。', 30, 43, NULL, '2013-09-27 10:56:51', NULL, 'zen_cfg_textarea_small('),
(548, '上传目录', 'EASYPOPULATE_CONFIG_TEMP_DIR', 'tempEP/', '上传目录的名称(默认: tempEP/)', 31, 0, NULL, '2013-09-27 10:56:55', NULL, NULL),
(549, '上传文件日期格式', 'EASYPOPULATE_CONFIG_FILE_DATE_FORMAT', 'y-m-d', '选择上传文件日期格式，通常由MS Excel生成。上传文件的RAW日期 (例如 2005-09-26 09:00:00) 不受影响，会照样上传。', 31, 1, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("m-d-y", "d-m-y", "y-m-d"),'),
(550, '默认时间格式', 'EASYPOPULATE_CONFIG_DEFAULT_RAW_TIME', '09:00:00', '如果上传文件中没有指定时间，将使用该值。适合指定特价在某个时间后生效。(默认: 09:00:00)', 31, 2, NULL, '2013-09-27 10:56:55', NULL, NULL),
(551, '分批导入的数据量', 'EASYPOPULATE_CONFIG_SPLIT_MAX', '300', '缺省的分割上传文件的记录数目。用于防止大量上传时出现的超时。(默认: 300)', 31, 3, NULL, '2013-09-27 10:56:55', NULL, NULL),
(552, '最大分类深度', 'EASYPOPULATE_CONFIG_MAX_CATEGORY_LEVELS', '7', '商店的最大分类深度，决定下载文件中分类的栏目数量 (默认: 7)', 31, 4, NULL, '2013-09-27 10:56:55', NULL, NULL),
(553, '上传/下载价格含税', 'EASYPOPULATE_CONFIG_PRICE_INC_TAX', 'false', '选择价格是否含税。', 31, 5, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("true", "false"),'),
(554, '数量为零的产品不激活', 'EASYPOPULATE_CONFIG_ZERO_QTY_INACTIVE', 'false', '批量上传时，如果产品数量为零，产品状态设置为未激活。(默认: false)', 31, 6, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("true", "false"),'),
(555, '换行的智能标签替换', 'EASYPOPULATE_CONFIG_SMART_TAGS', 'true', '上传文件中描述字段，回车符和换行符转换为HTML换行，防止格式错误(默认: true)', 31, 7, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("true", "false"),'),
(556, '高级智能标签', 'EASYPOPULATE_CONFIG_ADV_SMART_TAGS', 'false', '描述字段采用高级格式化，标题加粗、添加列表等。在ADMIN/easypopulate.php文件中设置 (默认: false)', 31, 8, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("true", "false"),'),
(557, '调试记录', 'EASYPOPULATE_CONFIG_DEBUG_LOGGING', 'true', '生成调试记录 (默认: true)', 31, 9, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array("true", "false"),'),
(558, '自定义产品字段', 'EASYPOPULATE_CONFIG_CUSTOM_FIELDS', '', '输入用逗号分割的产品数据表里的字段名称，将自动增加到导入、导出文件(例如: products_length, products_width). 请确认这些字段存在 PRODUCTS 表中。', 31, 10, NULL, '2013-09-27 10:56:55', NULL, NULL),
(559, '商品列表 - 排列方式', 'PRODUCT_LISTING_LAYOUT_STYLE', 'rows', '选择排列方式:<br />每个产品一行(rows) 还是每行显示多个产品(columns)<br />如果允许顾客自己选择排列方式，这里设定默认值。', 8, 40, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''rows'', ''columns''),'),
(560, '商品列表 - 每行列数', 'PRODUCT_LISTING_COLUMNS_PER_ROW', '3', '选择商品列表中每行显示的商品数目，缺省为3', 8, 41, NULL, '2013-09-27 10:56:55', NULL, NULL),
(561, '商品列表 - 排列方式 - 顾客控制', 'PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER', '1', '是否允许顾客自己选择排列方式 (1=是, 0=否):', 8, 42, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(562, '<b>图片展示</b>', 'ZEN_LIGHTBOX_STATUS', 'true', '<br />如果设置为 true，以下页面的产品图片将启用图片展示效果:<br /><br />- document_general_info<br />- document_product_info<br />- page (简易页面)<br />- product_free_shipping_info<br />- product_info<br />- product_music_info<br />- product_reviews<br />- product_reviews_info<br />- product_reviews_write<br /><br /><b>默认: true</b>', 32, 100, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(563, '透明度', 'ZEN_LIGHTBOX_OVERLAY_OPACITY', '0.8', '<br />设置透明度。<br /><br /><b>默认: 0.8</b>', 32, 101, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''0'', ''0.1'', ''0.2'', ''0.3'', ''0.4'', ''0.5'', ''0.6'', ''0.7'', ''0.8'', ''0.9'', ''1''), '),
(564, '背景淡出时长', 'ZEN_LIGHTBOX_OVERLAY_FADE_DURATION', '400', '<br />控制背景淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', 32, 102, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(565, '变化尺寸时长', 'ZEN_LIGHTBOX_RESIZE_DURATION', '400', '<br />设定变换图片尺寸的速度。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', 32, 103, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(566, '变换尺寸', 'ZEN_LIGHTBOX_RESIZE_TRANSITION', 'false', '<br />允许设定展示图片的大小。<br /><br /><b>默认: false</b><br />', 32, 104, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(567, '初始化宽度', 'ZEN_LIGHTBOX_INITIAL_WIDTH', '250', '<br />显示图片的宽度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />', 32, 105, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(568, '初始化高度', 'ZEN_LIGHTBOX_INITIAL_HEIGHT', '250', '<br />显示图片的高度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />', 32, 106, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(569, '图片淡出时长', 'ZEN_LIGHTBOX_IMAGE_FADE_DURATION', '400', '<br />设定图片淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', 32, 107, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(570, '动态标题时长', 'ZEN_LIGHTBOX_CAPTION_ANIMATION_DURATION', '400', '<br />设定动态标题的时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', 32, 108, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(571, '显示图片计数', 'ZEN_LIGHTBOX_COUNTER', 'true', '<br />设置为true时显示图片计数(图片标题下面)。<br /><br /><b>默认: true</b>', 32, 109, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(572, '点击图片关闭窗口', 'ZEN_LIGHTBOX_CLOSE_IMAGE', 'false', '<br />设置为true时，点击图片关闭窗口。<br /><br /><b>默认: false</b>', 32, 110, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(573, '点击背景关闭窗口', 'ZEN_LIGHTBOX_CLOSE_OVERLAY', 'false', '<br />设置为true时，点击背景关闭窗口。<br /><br /><b>默认: false</b>', 32, 111, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(574, '显示翻页按钮', 'ZEN_LIGHTBOX_PREV_NEXT', 'false', '<br />设置为true时，总是显示前后翻页按钮。说明: 点击图片关闭窗口设置为TRUE时，本参数无效。<br /><br /><b>默认: false</b>', 32, 112, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(575, '<b>键盘翻页</b>', 'ZEN_LIGHTBOX_KEYBOARD_NAVIGATION', 'true', '<br />设置为true时，可以用键盘控制翻页。<br /><br /><b>默认: true</b>', 32, 200, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(576, '关闭展示', 'ZEN_LIGHTBOX_ESCAPE_KEYS', '27,88,67', '<br />下面的所有按键都可关闭图片展示。<br /><br />说明: 仅可以输入<a href="http://en.wikipedia.org/wiki/ASCII" target="_blank">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 27,88,67</b><br />', 32, 201, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(577, '上一张', 'ZEN_LIGHTBOX_PREVIOUS_KEYS', '37,80', '<br />这些按键显示上一张图片。<br /><br />说明: 仅可以输入<a href="http://en.wikipedia.org/wiki/ASCII" target="_blank">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 37,80</b><br />', 32, 202, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(578, '下一张', 'ZEN_LIGHTBOX_NEXT_KEYS', '39,78', '<br />这些按键显示下一张图片。<br /><br />说明: 仅可以输入<a href="http://en.wikipedia.org/wiki/ASCII" target="_blank">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 39,78</b><br />', 32, 203, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(579, '<b>图库模式</b>', 'ZEN_LIGHTBOX_GALLERY_MODE', 'true', '<br />设置为true时，使用前后按钮快速显示附加图片。<br /><br /><b>默认: true</b>', 32, 300, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(580, '商品主图', 'ZEN_LIGHTBOX_GALLERY_MAIN_IMAGE', 'true', '<br />设置为true时，图库中包含商品主图。<br /><br /><b>默认: true</b>', 32, 301, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(581, '<b>支持简易页面</b>', 'ZEN_LIGHTBOX_EZPAGES', 'true', '<br />设置为true时，所有简易页面的链接图片启用图片展示效果。<br /><br /><b>默认: true</b>', 32, 400, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(582, '文件类型', 'ZEN_LIGHTBOX_FILE_TYPES', 'jpg,png,gif', '<br />简易页面上的以下图片类型启用图片展示效果。<br /><br /><b>默认: jpg,png,gif</b><br />', 32, 401, '2013-09-27 10:56:55', '2013-09-27 10:56:55', NULL, NULL),
(583, '启用网址优化吗?', 'SEO_ENABLED', 'true', '是否启用网址优化? 这是整站的开关。<br /><br />请将根目录下的文件htaccess_sample改名为 .htaccess，并修改其中的 /shop/ 为您的zen cart目录。如果Zen Cart安装在网页服务器的根目录下，就设置为 /。<br /><br />打开网址优化后，请执行一次下面的重置缓存(reset)操作。', 33, 0, '2013-10-09 11:59:04', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(584, '在商品的网址中添加cPath吗?', 'SEO_ADD_CPATH_TO_PRODUCT_URLS', 'false', '在商品的网址后添加cPath (例如: some-product-p-1.html?cPath=xx).', 33, 1, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(585, '商品分类的网址中包括上级分类名称吗?', 'SEO_ADD_CAT_PARENT', 'false', '在分类网址前增加上级分类名称 (例如: parent-category-c-1.html).', 33, 2, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(586, '商品的网址中包括上级分类名称吗?', 'SEO_ADD_PRODUCT_CAT', 'false', '在商品网址前加上级分类名称 (例如: category-c-1/product-p-1.html)。', 33, 3, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(587, '过滤太短的单词', 'SEO_URLS_FILTER_SHORT_WORDS', '0', '该设置从网址中过滤少于指定值的单词。', 33, 4, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, NULL),
(588, '输出兼容W3C的网址 (参数)?', 'SEO_URLS_USE_W3C_VALID', 'false', '该设置输出兼容W3C的网址。', 33, 5, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(589, '打开缓存以减少查询次数吗?', 'USE_SEO_CACHE_GLOBAL', 'true', '该设置可以完全关闭缓存。', 33, 6, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(590, '打开商品缓存吗?', 'USE_SEO_CACHE_PRODUCTS', 'true', '该设置可以关闭商品缓存。', 33, 7, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(591, '打开目录缓存吗?', 'USE_SEO_CACHE_CATEGORIES', 'true', '该设置可以关闭分类缓存。', 33, 8, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(592, '打开厂家缓存吗?', 'USE_SEO_CACHE_MANUFACTURERS', 'true', '该设置可以关闭厂家缓存。', 33, 9, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(593, '打开文章缓存吗?', 'USE_SEO_CACHE_ARTICLES', 'true', '该设置可以关闭文章缓存。', 33, 10, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(594, '打开信息缓存吗?', 'USE_SEO_CACHE_INFO_PAGES', 'true', '该设置可以关闭信息缓存。', 33, 11, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(595, '打开自动跳转吗?', 'USE_SEO_REDIRECT', 'true', '该设置实现自动跳转，发送301文件头实现旧网址转向新网址。', 33, 12, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(596, '选择网址重写类型', 'SEO_REWRITE_TYPE', 'Rewrite', '选择网址重写的格式。', 33, 13, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''Rewrite''),'),
(597, '输入特殊字符转换', 'SEO_CHAR_CONVERT_SET', '', '该设置转换特殊字符。<br><br>格式<b>必须</b>为: <b>char=>conv,char2=>conv2</b>', 33, 14, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, NULL),
(598, '要删除字母数字外的所有字符吗?', 'SEO_REMOVE_ALL_SPEC_CHARS', 'false', '该设置可以删除所有除字母和数字外的字符。', 33, 15, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(599, '输入网址的 PCRE 过滤规则', 'SEO_URLS_FILTER_PCRE', '', '使用PCRE规则过滤生成的网址。<br><br>格式<b>必须</b>为: <b>find1=>replace1,find2=>replace2</b>. 在字符转换和删除特殊字符前运行。如果网址中要短横线 - ，可以使用空格。如果是反斜线，要输入两次', 33, 16, '2013-09-27 10:59:51', '2013-09-27 10:59:51', NULL, NULL),
(600, '重置缓存', 'SEO_URLS_CACHE_RESET', 'false', '该设置重置搜索引擎优化缓存的数据。', 33, 17, '2013-09-27 10:59:51', '2013-09-27 10:59:51', 'zen_reset_cache_data_seo_urls', 'zen_cfg_select_option(array(''reset'', ''false''),'),
(601, '输入需要优化的页面', 'SEO_URLS_ONLY_IN', 'index, product_info,checkout_process,products_new, products_all, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4, login, account, create_account, advanced_search, product_free_shipping_info, product_music_info, document_product_info, document_general_info, shopping_cart, unsubscribe', '本设置指定需要网址重写的页面，如果为空，所有页面网址都重写。<br><br>默认页面为: <b>index, product_info, products_new, products_all, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4, login, account, create_account, advanced_search, product_free_shipping_info, product_music_info, document_product_info, document_general_info, shopping_cart, unsubscribe</b>', 33, 18, '2013-10-09 12:01:45', '2013-09-27 10:59:51', NULL, NULL),
(602, 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), ');
INSERT INTO `zen_configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(603, 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'True', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(604, 'IH 调整图像大小', 'IH_RESIZE', 'no', 'Zen-Cart的缺省设置为 -no-，要打开自动调整图像大小，设置为 -yes-。--说明: 如果选择 -no-, 所有图像管理相关的设置会失效，包括: 图像文件类型选择、背景颜色、压缩、弹出图像和水印-- 如果要使用ImageMagick，请在<em>includes/extra_configures/bmz_image_handler_conf.php</em>中设定<strong>convert</strong>文件的路径。', 4, 1001, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''yes'',''no''),'),
(605, 'IH 小图像文件类型', 'SMALL_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，小图像采用与上传的图像相同的后缀。', 4, 1011, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''gif'',''jpg'',''png'',''no_change''),'),
(606, 'IH 小图像背景', 'SMALL_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', 4, 1021, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(607, 'IH 小图像压缩质量', 'SMALL_IMAGE_QUALITY', '85', '设定期望的JPG小图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', 4, 1031, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(608, 'IH 小图像水印', 'WATERMARK_SMALL_IMAGES', 'no', '如果小图像要显示水印，设置为 -yes-', 4, 1041, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''no'',''yes''),'),
(609, 'IH 放大小图像', 'ZOOM_SMALL_IMAGES', 'yes', '如果要在鼠标移动到小图像上时，显示放大的图像，设置为 -yes-', 4, 1051, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''no'',''yes''),'),
(610, 'IH 小图像放大尺寸', 'ZOOM_IMAGE_SIZE', 'Medium', '如果小图像放大为中图，设置为 -Medium-，如果要放大为大图，设置为 -Large-', 4, 1061, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''Medium'',''Large''),'),
(611, 'IH 中图像文件类型', 'MEDIUM_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，中图像采用与上传的图像相同的后缀。', 4, 1071, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''gif'',''jpg'',''png'',''no_change''),'),
(612, 'IH 中图像背景', 'MEDIUM_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', 4, 1081, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(613, 'IH 中图像压缩质量', 'MEDIUM_IMAGE_QUALITY', '85', '设定期望的JPG中图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', 4, 1091, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(614, 'IH 中图像水印', 'WATERMARK_MEDIUM_IMAGES', 'no', '如果中图像要显示水印，设置为 -yes-', 4, 1101, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''no'',''yes''),'),
(615, 'IH 大图像文件类型', 'LARGE_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，大图像采用与上传的图像相同的后缀。', 4, 1111, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''gif'',''jpg'',''png'',''no_change''),'),
(616, 'IH 大图像背景', 'LARGE_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', 4, 1121, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(617, 'IH 大图像压缩质量', 'LARGE_IMAGE_QUALITY', '85', '设定期望的JPG大图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', 4, 1131, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(618, 'IH 大图像水印', 'WATERMARK_LARGE_IMAGES', 'no', '如果大图像要显示水印，设置为 -yes-', 4, 1141, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''no'',''yes''),'),
(619, 'IH 大图像最大宽度', 'LARGE_IMAGE_MAX_WIDTH', '750', '设置大图像的最大宽度。如果宽度和高度为空或0，将不会自动调整大图像的大小。', 4, 1151, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(620, 'IH 大图像最大高度', 'LARGE_IMAGE_MAX_HEIGHT', '550', '设置大图像的最大高度。如果宽度和高度为空或0，将不会自动调整大图像的大小。', 4, 1161, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(621, 'IH 水印位置', 'WATERMARK_GRAVITY', 'Center', '选择水印在图像中的位置，默认为 <strong>Center</Strong>.', 4, 1171, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, 'zen_cfg_select_option(array(''Center'',''NorthWest'',''North'',''NorthEast'',''East'',''SouthEast'',''South'',''SouthWest'',''West''),'),
(622, '图像管理版本', 'IH_VERSION', '4.0', '仅保存图像管理版本，但不显示在配置菜单中。', 0, 10000, '2013-09-27 11:00:17', '2013-09-27 11:00:17', NULL, NULL),
(632, '打开支付宝支付模块', 'MODULE_PAYMENT_ALIPAY_STATUS', 'True', '您要使用支付宝支付方式吗?', 6, 0, NULL, '2013-10-08 17:16:37', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(633, '商家email', 'MODULE_PAYMENT_ALIPAY_SELLER', '137430723@qq.com', '您的支付宝帐号的电子邮件地址', 6, 2, NULL, '2013-10-08 17:16:37', NULL, NULL),
(634, '安全校验码', 'MODULE_PAYMENT_ALIPAY_MD5KEY', 'o0bfnsh77zi17fwrsylgdv30h0ggodbt', '在这里输入交易安全校验码', 6, 4, NULL, '2013-10-08 17:16:37', NULL, NULL),
(635, '合作者身份ID', 'MODULE_PAYMENT_ALIPAY_PARTNER', '2088801929727821', '您账户的合作者身份ID', 6, 5, NULL, '2013-10-08 17:16:37', NULL, NULL),
(636, '付款地区', 'MODULE_PAYMENT_ALIPAY_ZONE', '0', '如果选择了付款地区，仅该地区可以使用该支付模块。', 6, 6, NULL, '2013-10-08 17:16:37', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(637, '设置支付状态', 'MODULE_PAYMENT_ALIPAY_PROCESSING_STATUS_ID', '2', '设置客户付款完成后的订单状态<br />推荐状态(处理中)', 6, 8, NULL, '2013-10-08 17:16:37', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(638, '设置订单状态', 'MODULE_PAYMENT_ALIPAY_ORDER_STATUS_ID', '1', '设置采用支付宝付款的订单状态<br />推荐状态(等待中)', 6, 10, NULL, '2013-10-08 17:16:37', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(639, '显示顺序', 'MODULE_PAYMENT_ALIPAY_SORT_ORDER', '1', '显示顺序：小的显示在前。', 6, 12, NULL, '2013-10-08 17:16:37', NULL, NULL),
(640, '支付宝交易的网址<br />缺省: <code>https://www.alipay.com/cooperate/gateway.do?_input_charset=utf-8</code><br />(不用修改)', 'MODULE_PAYMENT_ALIPAY_HANDLER', 'https://mapi.alipay.com/gateway.do?_input_charset=utf-8', '支付宝正式交易的网址', 6, 18, NULL, '2013-10-08 17:16:37', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `zen_configuration_group`
--

CREATE TABLE IF NOT EXISTS `zen_configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `zen_configuration_group`
--

INSERT INTO `zen_configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, '基本设置', '商店的基本情况', 1, 1),
(2, '最小值', '功能/数据的最小值', 2, 1),
(3, '最大值', '功能/数据的最大值', 3, 1),
(4, '图像参数', '图像参数', 4, 1),
(5, '客户资料', '客户帐号选项配置', 5, 1),
(6, '模块选项', '在配置中不可见', 6, 0),
(7, '配送参数', '配送参数选项', 7, 1),
(8, '商品列表', '商品列表配置选项', 8, 1),
(9, '库存选项', '库存配置选项', 9, 1),
(10, '日志选项', '日志配置选项', 10, 1),
(11, '条款选项', '条款选项', 16, 1),
(12, '电子邮件', '电子邮件的基本设置', 12, 1),
(13, '属性设置', '商品属性设置', 13, 1),
(14, 'GZip压缩', 'GZip压缩选项', 14, 1),
(15, 'Sessions', 'Sessions选项', 15, 1),
(16, '礼券和优惠券', '礼券和优惠券', 16, 1),
(17, '信用卡', '接受的信用卡', 17, 1),
(18, '商品信息', '商品信息显示选项', 18, 1),
(19, '布局设置', '布局选项', 19, 1),
(20, '网站维护', '网站维护选项', 20, 1),
(21, '新进商品', '新进商品列表', 21, 1),
(22, '推荐商品', '推荐商品列表', 22, 1),
(23, '所有商品', '所有商品列表', 23, 1),
(24, '商品索引', '商品索引页面', 24, 1),
(25, '定义页面', '定义首页和其它HTML页面', 25, 1),
(30, '简易页面设置', '简易页面设置', 30, 1),
(31, '批量商品管理', '批量商品管理设置', 31, 1),
(32, '图片展示', '图片展示设置', 32, 1),
(33, '网址优化', '网址优化模块的选项', 33, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_counter`
--

CREATE TABLE IF NOT EXISTS `zen_counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_counter`
--

INSERT INTO `zen_counter` (`startdate`, `counter`) VALUES
('20130927', 7363);

-- --------------------------------------------------------

--
-- 表的结构 `zen_counter_history`
--

CREATE TABLE IF NOT EXISTS `zen_counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_counter_history`
--

INSERT INTO `zen_counter_history` (`startdate`, `counter`, `session_counter`) VALUES
('20130927', 70, 4),
('20130929', 182, 22),
('20130930', 124, 30),
('20131002', 7, 1),
('20131003', 17, 6),
('20131004', 38, 7),
('20131007', 27, 3),
('20131008', 115, 4),
('20131009', 327, 38),
('20131010', 636, 42),
('20131011', 348, 18),
('20131012', 177, 11),
('20131013', 161, 21),
('20131014', 347, 21),
('20131015', 232, 16),
('20131016', 605, 34),
('20131017', 681, 28),
('20131018', 248, 10),
('20131019', 42, 3),
('20131020', 84, 1),
('20131021', 444, 18),
('20131022', 411, 27),
('20131023', 178, 9),
('20131024', 41, 6),
('20131025', 518, 16),
('20131026', 369, 11),
('20131027', 66, 4),
('20131028', 709, 47),
('20131029', 147, 14);

-- --------------------------------------------------------

--
-- 表的结构 `zen_countries`
--

CREATE TABLE IF NOT EXISTS `zen_countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=246 ;

--
-- 转存表中的数据 `zen_countries`
--

INSERT INTO `zen_countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 2),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'Timor-Leste', 'TL', 'TLS', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macao', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROU', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 6),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Serbia', 'RS', 'SRB', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1),
(240, 'Aaland Islands', 'AX', 'ALA', 1),
(241, 'Palestinian Territory', 'PS', 'PSE', 1),
(242, 'Montenegro', 'ME', 'MNE', 1),
(243, 'Guernsey', 'GG', 'GGY', 1),
(244, 'Isle of Man', 'IM', 'IMN', 1),
(245, 'Jersey', 'JE', 'JEY', 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupons`
--

CREATE TABLE IF NOT EXISTS `zen_coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupons_description`
--

CREATE TABLE IF NOT EXISTS `zen_coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupon_email_track`
--

CREATE TABLE IF NOT EXISTS `zen_coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupon_gv_customer`
--

CREATE TABLE IF NOT EXISTS `zen_coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupon_gv_queue`
--

CREATE TABLE IF NOT EXISTS `zen_coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupon_redeem_track`
--

CREATE TABLE IF NOT EXISTS `zen_coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_coupon_restrict`
--

CREATE TABLE IF NOT EXISTS `zen_coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_currencies`
--

CREATE TABLE IF NOT EXISTS `zen_currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `zen_currencies`
--

INSERT INTO `zen_currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 0.14205870, '2013-09-27 10:56:51'),
(2, '人民币', 'CNY', '&yen;', '元', '.', '', '2', 1.00000000, '2013-09-27 10:56:51'),
(3, 'Euro', 'EUR', '&euro;', '', '.', ',', '2', 0.09692550, '2013-09-27 10:56:51'),
(4, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', 0.06997200, '2013-09-27 10:56:51'),
(5, 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', 0.14287770, '2013-09-27 10:56:51'),
(6, 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', 0.16222499, '2013-09-27 10:56:51');

-- --------------------------------------------------------

--
-- 表的结构 `zen_customers`
--

CREATE TABLE IF NOT EXISTS `zen_customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `zen_customers`
--

INSERT INTO `zen_customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_nick`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`, `customers_group_pricing`, `customers_email_format`, `customers_authorization`, `customers_referral`, `customers_paypal_payerid`, `customers_paypal_ec`) VALUES
(1, 'm', 'Bill', 'Smith', '2001-01-01 00:00:00', 'root@localhost.com', '', 1, '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0', 0, 'TEXT', 0, '', '', 0),
(2, 'm', '徐', '鹏', '1991-06-22 00:00:00', '523375882@qq.com', '', 2, '18084030059', '', '6bba7038e0843d560ac45a0016e0b690:d2', '1', 0, 'TEXT', 0, '', '', 0),
(3, 'm', '', '阳作杰', '1991-06-22 00:00:00', '523375883@qq.com', '', 3, '18084030058', '', '58574f925087ecc7e47fe45e212a953c:d2', '0', 0, 'TEXT', 0, '', '', 0),
(4, 'm', '', 'qq', '1986-06-06 00:00:00', 'kk@zzlkk.com', '', 4, '61280169421', '', '3431b770f8ec1931264a2cff990dc26b:bc', '0', 0, 'TEXT', 0, '', '', 0),
(5, 'm', 'Zz', 'kk', '0001-01-01 00:00:00', 'zz@zzlkk.com', '', 5, '15696126241', '', '505aaa74a324b09ec44ea37566c484f9:51', '0', 0, 'TEXT', 0, '', '', 0),
(6, 'm', '', 'Qiqiang Peng', '0001-01-01 00:00:00', 'zzl@zzlkk.com', '', 6, '15696126241', '', 'ea3e11d35fd3829f071ab761d82a342c:83', '0', 0, 'TEXT', 0, '', '', 0),
(7, 'm', '', 'Qiqiang Peng', '0001-01-01 00:00:00', 'zzz@zzlkk.com', '', 7, '15696126241', '', '511fdbacf6c32275603f5479fca53cd6:43', '0', 0, 'TEXT', 0, '', '', 0),
(8, 'm', '', 'Qiqiang Peng', '0001-01-01 00:00:00', 'chasego@qq.com', '', 8, '15696126241', '', 'beaac9deff529f8214d13c02edf2f76d:17', '0', 0, 'TEXT', 0, '', '', 0),
(9, 'm', '', 'Qiqiang Peng', '0001-01-01 00:00:00', '120559929@qq.com', '', 9, '15696126241', '', '2bc577bedf1259c56a21c29d736e0ae6:cc', '0', 0, 'TEXT', 0, '', '', 0),
(10, 'm', '', 'Qiqiang Peng', '0001-01-01 00:00:00', 'xxx@zzlkk.com', '', 10, '15696126241', '', 'bce700e03c190d1b5997ae108f7d8cb3:0c', '0', 0, 'TEXT', 0, '', '', 0),
(11, 'm', '', 'Annabelle Biscoe', '0001-01-01 00:00:00', 'zx@zzlkk.com', '', 11, '15696126241', '', '5e13f3d1b7fcc3e746f6590a71bdbed3:01', '0', 0, 'TEXT', 0, '', '', 0),
(12, 'm', '', '可可姐', '0001-01-01 00:00:00', 'zxx@zzlkk.com', '', 12, '15696126241', '', '664f437f6f8b7acbf77e81e2e1175298:e3', '0', 0, 'TEXT', 0, '', '', 0),
(13, 'm', '', 'Rebecca Shirly', '0001-01-01 00:00:00', 'test@zzlkk.com', '', 13, '15696126241', '', '5785aaa560dcc85a114f35967f0170c7:bb', '0', 0, 'TEXT', 0, '', '', 0),
(14, 'm', '', 'liu qiang', '0001-01-01 00:00:00', 'test2@zzlkk.com', '', 14, '15696126241', '', '605c8be05d4c9f32b738375758d845d6:2c', '0', 0, 'TEXT', 0, '', '', 0),
(15, 'm', '', 'Rebecca Shirly', '0001-01-01 00:00:00', 'test3@zzlkk.com', '', 15, '15696126241', '', '49b841ee1b9cfd18f34982424a8c7376:52', '0', 0, 'TEXT', 0, '', '', 0),
(16, 'm', '', 'Rebecca Shirly', '0001-01-01 00:00:00', 'test5@zzlkk.com', '', 16, '15696126241', '', '1b492dd4f65ec87390b90a0da425489b:71', '0', 0, 'TEXT', 0, '', '', 0),
(17, 'm', '', 'andy', '0001-01-01 00:00:00', '1076691256@qq.com', '', 17, '15023782548', '', '120d1dba99634e21c56573081d29b4b6:44', '0', 0, 'TEXT', 0, '', '', 0),
(18, 'm', '', '陈庆', '0001-01-01 00:00:00', '1@qq.com', '', 18, '15023782548', '', 'd9acd6931762df1d285c72df74ca8a19:5b', '0', 0, 'TEXT', 0, '', '', 0),
(19, 'm', '', '徐鹏', '0001-01-01 00:00:00', '750908472@qq.com', '', 19, '18084030059', '750908472@qq.com', '913deb55d869805d481e2ea65ad9eba0:36', '0', 0, 'TEXT', 0, '', '', 0),
(20, '', '', '徐鹏', '0001-01-01 00:00:00', '523375887@qq.com', '', 20, '18084030055', '', '713c6581fd851e7e7c96eeb2ccf14a3b:45', '0', 0, '', 0, '', '', 0),
(21, '', '', 'balala', '0001-01-01 00:00:00', '1830933201@qq.com', '', 21, '15023782548', '', '6ee9d8f6a57c79b66120a7d6c79e867e:43', '0', 0, 'TEXT', 0, '', '', 0),
(22, '', '', 'fghjjjj', '0001-01-01 00:00:00', '3@qq.com', '', 22, '123456', '', '4631e287598d0dab935016e778e8bafc:26', '0', 0, 'TEXT', 0, '', '', 0),
(23, '', '', 'dftgy', '0001-01-01 00:00:00', '6@qq.com', '', 23, '12345678', '', '578002ad0a45bc9245996e9cf195e679:82', '0', 0, 'TEXT', 0, '', '', 0),
(24, '', '', '徐鹏', '0001-01-01 00:00:00', '23@qq.com', '', 24, '18084030059', '', '2bc577bedf1259c56a21c29d736e0ae6:cc', '0', 0, 'TEXT', 0, '', '', 0),
(25, 'm', '', 'sdfsf', '0001-01-01 00:00:00', 'q2qw3e4r5t@gmail.com', '', 25, '111111111', 'q2qw3e4r5t@gmail.com', 'd9a5a4347505bc8280ba4557e12f488d:7b', '0', 0, 'TEXT', 0, '', '', 0),
(26, '', '', 'liuchun', '0001-01-01 00:00:00', '381494501@qq.com', '', 26, '111123456566', '', 'dc6f2362cec63a0789c17f95aa8d47ac:1d', '0', 0, 'TEXT', 0, '', '', 0),
(27, 'm', '', 'ddds', '0001-01-01 00:00:00', '11111111@qq.com', '', 27, '222222222', '333@qq.com', 'b81f00b66b1da0073ed8c437c9274833:62', '0', 0, 'TEXT', 0, '', '', 0),
(28, 'm', '', 'fds', '0001-01-01 00:00:00', '180456454', '', 28, '4343434343', '434', '6e63f410cca531de726a20b7ebe48968:0b', '0', 0, 'TEXT', 0, '', '', 0),
(29, '', '', '橙子', '0001-01-01 00:00:00', '775165500@qq.com', '', 29, '15023782548', '', 'b0d3790627f35d11d71c97ae2e0b69af:46', '0', 0, 'TEXT', 0, '', '', 0),
(30, 'm', '', 'q2q2', '0001-01-01 00:00:00', 'q2q2@zzlkk.com', '', 30, '123456', 'zzl@zzlkk.com', '299ddc22148fc014c2728b5d500a1e9b:b3', '0', 0, 'TEXT', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `zen_customers_basket`
--

CREATE TABLE IF NOT EXISTS `zen_customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `zen_customers_basket`
--

INSERT INTO `zen_customers_basket` (`customers_basket_id`, `customers_id`, `products_id`, `customers_basket_quantity`, `final_price`, `customers_basket_date_added`) VALUES
(1, 3, '85:3db3c6528c9534dbcc43eac2fd4c4ba2', 1, '0.0000', '20131008'),
(2, 5, '26:4614766d78b26fb71bfd21d09f9eb98c', 1, '0.0000', '20131009'),
(3, 5, '11', 1, '0.0000', '20131009');

-- --------------------------------------------------------

--
-- 表的结构 `zen_customers_basket_attributes`
--

CREATE TABLE IF NOT EXISTS `zen_customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `zen_customers_basket_attributes`
--

INSERT INTO `zen_customers_basket_attributes` (`customers_basket_attributes_id`, `customers_id`, `products_id`, `products_options_id`, `products_options_value_id`, `products_options_value_text`, `products_options_sort_order`) VALUES
(1, 3, '85:3db3c6528c9534dbcc43eac2fd4c4ba2', '1', 16, '', '10.00010'),
(2, 3, '85:3db3c6528c9534dbcc43eac2fd4c4ba2', '2', 21, '', '20.00020'),
(3, 3, '85:3db3c6528c9534dbcc43eac2fd4c4ba2', '13_chk36', 36, '', '70.00020'),
(4, 5, '26:4614766d78b26fb71bfd21d09f9eb98c', '3', 9, '', '30.00010');

-- --------------------------------------------------------

--
-- 表的结构 `zen_customers_info`
--

CREATE TABLE IF NOT EXISTS `zen_customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_customers_info`
--

INSERT INTO `zen_customers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`) VALUES
(1, '0001-01-01 00:00:00', 0, '2004-01-21 01:35:28', '0001-01-01 00:00:00', 0),
(2, '2013-09-29 11:07:39', 1, '2013-09-29 11:07:39', NULL, 0),
(3, '2013-10-26 14:13:22', 51, '2013-09-29 12:23:14', NULL, 0),
(4, '2013-10-10 10:34:56', 7, '2013-09-30 16:19:42', NULL, 0),
(5, '2013-10-18 11:16:00', 8, '2013-10-10 10:58:28', NULL, 0),
(6, '2013-10-10 11:37:54', 1, '2013-10-10 11:37:54', NULL, 0),
(7, '2013-10-10 11:44:52', 1, '2013-10-10 11:44:52', NULL, 0),
(8, '2013-10-10 12:06:21', 1, '2013-10-10 12:06:21', NULL, 0),
(9, '2013-10-10 12:08:13', 1, '2013-10-10 12:08:13', NULL, 0),
(10, '2013-10-10 12:09:54', 1, '2013-10-10 12:09:54', NULL, 0),
(11, '2013-10-10 12:13:27', 1, '2013-10-10 12:13:27', NULL, 0),
(12, '2013-10-10 12:14:23', 1, '2013-10-10 12:14:23', NULL, 0),
(13, '2013-10-10 12:18:04', 1, '2013-10-10 12:18:04', NULL, 0),
(14, '2013-10-10 12:18:50', 1, '2013-10-10 12:18:50', NULL, 0),
(15, '2013-10-10 12:21:02', 1, '2013-10-10 12:21:02', NULL, 0),
(16, '2013-10-10 12:22:25', 1, '2013-10-10 12:22:25', NULL, 0),
(17, '2013-10-29 10:35:17', 12, '2013-10-10 12:49:01', NULL, 0),
(18, '2013-10-13 11:42:29', 4, '2013-10-11 14:49:01', NULL, 0),
(19, '2013-10-11 17:53:58', 2, '2013-10-11 17:09:01', NULL, 0),
(20, '2013-10-17 16:49:13', 5, '2013-10-17 13:27:41', '2013-10-17 16:08:03', 0),
(21, '2013-10-21 14:53:10', 1, '2013-10-21 14:53:10', NULL, 0),
(22, '2013-10-21 17:27:54', 1, '2013-10-21 17:27:54', NULL, 0),
(23, '2013-10-21 17:29:26', 1, '2013-10-21 17:29:26', NULL, 0),
(24, '2013-10-22 15:55:49', 1, '2013-10-22 15:55:49', NULL, 0),
(25, '2013-10-25 11:58:04', 1, '2013-10-25 11:58:04', NULL, 0),
(26, '2013-10-26 14:41:41', 6, '2013-10-25 12:10:17', NULL, 0),
(27, '2013-10-26 16:28:50', 1, '2013-10-26 16:28:50', NULL, 0),
(28, '2013-10-26 16:47:36', 1, '2013-10-26 16:47:36', NULL, 0),
(29, '2013-10-28 18:21:09', 2, '2013-10-28 18:08:30', NULL, 0),
(30, '2013-10-29 14:46:14', 1, '2013-10-29 14:46:14', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zen_db_cache`
--

CREATE TABLE IF NOT EXISTS `zen_db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_email_archive`
--

CREATE TABLE IF NOT EXISTS `zen_email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_ezpages`
--

CREATE TABLE IF NOT EXISTS `zen_ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `zen_ezpages`
--

INSERT INTO `zen_ezpages` (`pages_id`, `languages_id`, `pages_title`, `alt_url`, `alt_url_external`, `pages_html_text`, `status_header`, `status_sidebox`, `status_footer`, `status_toc`, `header_sort_order`, `sidebox_sort_order`, `footer_sort_order`, `toc_sort_order`, `page_open_new_window`, `page_is_ssl`, `toc_chapter`) VALUES
(1, 1, '', 'index.php?main_page=shippinginfo', '', NULL, 0, 1, 1, 1, 0, 35, 30, 10, 0, 0, 10),
(2, 1, '', 'index.php?main_page=contact_us', '', NULL, 0, 1, 0, 0, 0, 80, 90, 0, 0, 0, 0),
(3, 1, '', '', '', 'Array', 1, 1, 0, 0, 20, 20, 0, 0, 0, 0, 0),
(4, 1, '', 'index.php?main_page=featured_products', '', NULL, 1, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0),
(5, 1, '', 'index.php?main_page=site_map', '', NULL, 0, 0, 1, 0, 0, 70, 70, 0, 0, 0, 0),
(6, 1, '', 'index.php?main_page=privacy', '', NULL, 0, 1, 1, 0, 0, 40, 40, 0, 0, 0, 0),
(7, 1, '', 'index.php?main_page=unsubscribe', '', 'Array', 0, 1, 0, 0, 0, 75, 0, 0, 0, 0, 0),
(8, 1, '', '', '', NULL, 0, 1, 0, 0, 0, 60, 0, 0, 0, 0, 0),
(9, 1, '', 'index.php', '', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, '', 'index.php?main_page=products_new', '', 'Array', 1, 0, 0, 0, 55, 0, 0, 0, 0, 0, 0),
(11, 1, '', 'index.php?main_page=conditions', '', NULL, 0, 1, 1, 0, 0, 30, 20, 0, 0, 0, 0),
(12, 1, '', 'index.php?main_page=specials', '', 'Array', 1, 0, 0, 0, 80, 0, 0, 0, 0, 0, 0),
(13, 1, '', 'index.php?main_page=create_account', '', NULL, 0, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zen_ezpages_content`
--

CREATE TABLE IF NOT EXISTS `zen_ezpages_content` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `pages_html_text` text,
  PRIMARY KEY (`pc_id`),
  KEY `idx_ezpages_content` (`pages_id`,`languages_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `zen_ezpages_content`
--

INSERT INTO `zen_ezpages_content` (`pc_id`, `pages_id`, `languages_id`, `pages_title`, `pages_html_text`) VALUES
(1, 1, 2, '发货付款', ''),
(2, 1, 1, 'Shipping', ''),
(3, 2, 2, '联系我们', ''),
(4, 2, 1, 'Contact Us', ''),
(5, 3, 2, '最新资讯', '演示商店正式开张<br /><br />所有商品都是演示用途，本站非营业网站<br /><br />下单仅限于测试各项功能'),
(6, 3, 1, 'News', 'This store is for demo purpose only. No order will be processed.'),
(7, 4, 2, '推荐商品', ''),
(8, 4, 1, 'Featured Products', ''),
(9, 5, 2, '网站地图', ''),
(10, 5, 1, 'Site Map', ''),
(11, 6, 2, '隐私声明', ''),
(12, 6, 1, 'Privacy', ''),
(13, 7, 2, '电子邮件', ''),
(14, 7, 1, 'Newsletter', ''),
(15, 8, 2, '公司简介', ''),
(16, 8, 1, 'About Us', ''),
(17, 9, 2, '首页', ''),
(18, 9, 1, 'Home', ''),
(19, 10, 2, '新品上架', ''),
(20, 10, 1, 'New Products', ''),
(21, 11, 2, '顾客须知', ''),
(22, 11, 1, 'Conditions of Use', ''),
(23, 12, 2, '优惠促销', ''),
(24, 12, 1, 'Specials', ''),
(25, 13, 2, '注册', ''),
(26, 13, 1, 'Register', '');

-- --------------------------------------------------------

--
-- 表的结构 `zen_featured`
--

CREATE TABLE IF NOT EXISTS `zen_featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `zen_featured`
--

INSERT INTO `zen_featured` (`featured_id`, `products_id`, `featured_date_added`, `featured_last_modified`, `expires_date`, `date_status_change`, `status`, `featured_date_available`) VALUES
(1, 34, '2004-02-21 16:34:31', '2004-02-21 16:34:31', '0001-01-01', '2004-02-21 16:34:31', 1, '0001-01-01'),
(2, 8, '2004-02-21 17:04:54', '2004-02-21 22:31:52', '2004-02-27', '2004-04-25 22:50:50', 0, '2004-02-21'),
(3, 12, '2004-02-21 17:10:49', '2004-02-21 17:10:49', '0001-01-01', '2004-02-21 17:10:49', 1, '0001-01-01'),
(4, 27, '2004-02-21 22:30:53', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(5, 26, '2004-02-21 22:31:24', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(6, 40, '2004-05-13 22:50:33', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(7, 171, '2004-07-12 15:47:22', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(8, 172, '2004-07-12 15:47:29', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(9, 168, '2004-07-12 15:47:37', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(10, 169, '2004-07-12 15:47:45', NULL, '0001-01-01', NULL, 1, '0001-01-01');

-- --------------------------------------------------------

--
-- 表的结构 `zen_files_uploaded`
--

CREATE TABLE IF NOT EXISTS `zen_files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zen_geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_geo_zones`
--

INSERT INTO `zen_geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, '北京', '北京本地税率区', NULL, '2013-09-27 10:56:54');

-- --------------------------------------------------------

--
-- 表的结构 `zen_get_terms_to_filter`
--

CREATE TABLE IF NOT EXISTS `zen_get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_get_terms_to_filter`
--

INSERT INTO `zen_get_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES
('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name'),
('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name'),
('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- --------------------------------------------------------

--
-- 表的结构 `zen_group_pricing`
--

CREATE TABLE IF NOT EXISTS `zen_group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_group_pricing`
--

INSERT INTO `zen_group_pricing` (`group_id`, `group_name`, `group_percentage`, `last_modified`, `date_added`) VALUES
(1, 'VIP客户', '10.00', NULL, '2004-04-29 00:21:04');

-- --------------------------------------------------------

--
-- 表的结构 `zen_languages`
--

CREATE TABLE IF NOT EXISTS `zen_languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zen_languages`
--

INSERT INTO `zen_languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(2, '简体中文', 'gb', 'icon.gif', 'schinese', 10);

-- --------------------------------------------------------

--
-- 表的结构 `zen_layout_boxes`
--

CREATE TABLE IF NOT EXISTS `zen_layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=449 ;

--
-- 转存表中的数据 `zen_layout_boxes`
--

INSERT INTO `zen_layout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`) VALUES
(1, 'default_template_settings', 'banner_box_all.php', 1, 1, 5, 0, 0),
(2, 'default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127),
(3, 'default_template_settings', 'banner_box2.php', 1, 1, 15, 1, 15),
(4, 'default_template_settings', 'best_sellers.php', 1, 1, 30, 70, 1),
(5, 'default_template_settings', 'categories.php', 1, 0, 10, 10, 1),
(6, 'default_template_settings', 'currencies.php', 1, 1, 80, 60, 1),
(7, 'default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0),
(8, 'default_template_settings', 'ezpages.php', 1, 1, -1, 2, 1),
(9, 'default_template_settings', 'featured.php', 1, 0, 45, 0, 0),
(10, 'default_template_settings', 'information.php', 1, 0, 50, 40, 1),
(11, 'default_template_settings', 'languages.php', 1, 1, 70, 50, 1),
(12, 'default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1),
(13, 'default_template_settings', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(14, 'default_template_settings', 'more_information.php', 1, 0, 200, 200, 1),
(15, 'default_template_settings', 'music_genres.php', 1, 1, 0, 0, 0),
(16, 'default_template_settings', 'order_history.php', 1, 1, 0, 0, 0),
(17, 'default_template_settings', 'product_notifications.php', 1, 1, 55, 85, 1),
(18, 'default_template_settings', 'record_companies.php', 1, 1, 0, 0, 0),
(19, 'default_template_settings', 'reviews.php', 1, 0, 40, 0, 0),
(20, 'default_template_settings', 'search.php', 1, 1, 10, 0, 0),
(21, 'default_template_settings', 'search_header.php', 0, 0, 0, 0, 1),
(22, 'default_template_settings', 'shopping_cart.php', 1, 1, 20, 30, 1),
(23, 'default_template_settings', 'specials.php', 1, 1, 45, 0, 0),
(24, 'default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0),
(25, 'default_template_settings', 'whos_online.php', 1, 1, 200, 200, 1),
(26, 'template_default', 'banner_box_all.php', 1, 1, 5, 0, 0),
(27, 'template_default', 'banner_box.php', 1, 0, 300, 1, 127),
(28, 'template_default', 'banner_box2.php', 1, 1, 15, 1, 15),
(29, 'template_default', 'best_sellers.php', 1, 1, 30, 70, 1),
(30, 'template_default', 'categories.php', 1, 0, 10, 10, 1),
(31, 'template_default', 'currencies.php', 1, 1, 80, 60, 1),
(32, 'template_default', 'ezpages.php', 1, 1, -1, 2, 1),
(33, 'template_default', 'featured.php', 1, 0, 45, 0, 0),
(34, 'template_default', 'information.php', 1, 0, 50, 40, 1),
(35, 'template_default', 'languages.php', 1, 1, 70, 50, 1),
(36, 'template_default', 'manufacturers.php', 1, 0, 30, 20, 1),
(37, 'template_default', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(38, 'template_default', 'more_information.php', 1, 0, 200, 200, 1),
(39, 'template_default', 'my_broken_box.php', 1, 0, 0, 0, 0),
(40, 'template_default', 'order_history.php', 1, 1, 0, 0, 0),
(41, 'template_default', 'product_notifications.php', 1, 1, 55, 85, 1),
(42, 'template_default', 'reviews.php', 1, 0, 40, 0, 0),
(43, 'template_default', 'search.php', 1, 1, 10, 0, 0),
(44, 'template_default', 'search_header.php', 0, 0, 0, 0, 1),
(45, 'template_default', 'shopping_cart.php', 1, 1, 20, 30, 1),
(46, 'template_default', 'specials.php', 1, 1, 45, 0, 0),
(47, 'template_default', 'whats_new.php', 1, 0, 20, 0, 0),
(48, 'template_default', 'whos_online.php', 1, 1, 200, 200, 1),
(49, 'classic', 'banner_box.php', 1, 0, 300, 1, 127),
(50, 'classic', 'banner_box2.php', 1, 1, 15, 1, 15),
(51, 'classic', 'banner_box_all.php', 1, 1, 5, 0, 0),
(52, 'classic', 'best_sellers.php', 1, 1, 30, 70, 1),
(53, 'classic', 'categories.php', 1, 0, 10, 10, 1),
(54, 'classic', 'currencies.php', 1, 1, 80, 60, 1),
(55, 'classic', 'document_categories.php', 1, 0, 0, 0, 0),
(56, 'classic', 'ezpages.php', 1, 1, -1, 2, 1),
(57, 'classic', 'featured.php', 1, 0, 45, 0, 0),
(58, 'classic', 'information.php', 1, 0, 50, 40, 1),
(59, 'classic', 'languages.php', 1, 1, 70, 50, 1),
(60, 'classic', 'manufacturers.php', 1, 0, 30, 20, 1),
(61, 'classic', 'manufacturer_info.php', 1, 1, 35, 95, 1),
(62, 'classic', 'more_information.php', 1, 0, 200, 200, 1),
(63, 'classic', 'music_genres.php', 1, 1, 0, 0, 0),
(64, 'classic', 'order_history.php', 1, 1, 0, 0, 0),
(65, 'classic', 'product_notifications.php', 1, 1, 55, 85, 1),
(66, 'classic', 'record_companies.php', 1, 1, 0, 0, 0),
(67, 'classic', 'reviews.php', 1, 0, 40, 0, 0),
(68, 'classic', 'search.php', 1, 1, 10, 0, 0),
(69, 'classic', 'search_header.php', 0, 0, 0, 0, 1),
(70, 'classic', 'shopping_cart.php', 1, 1, 20, 30, 1),
(71, 'classic', 'specials.php', 1, 1, 45, 0, 0),
(72, 'classic', 'whats_new.php', 1, 0, 20, 0, 0),
(73, 'classic', 'whos_online.php', 1, 1, 200, 200, 1),
(74, 'lite_blue', 'banner_box.php', 0, 0, 300, 1, 0),
(75, 'lite_blue', 'banner_box2.php', 1, 1, 0, 0, 0),
(76, 'lite_blue', 'banner_box_all.php', 0, 1, 0, 0, 0),
(77, 'lite_blue', 'best_sellers.php', 1, 1, 30, 70, 1),
(78, 'lite_blue', 'categories.php', 1, 0, 10, 10, 1),
(79, 'lite_blue', 'currencies.php', 1, 1, 90, 0, 0),
(80, 'lite_blue', 'document_categories.php', 0, 0, 0, 0, 0),
(81, 'lite_blue', 'ezpages.php', 1, 1, 15, 5, 1),
(82, 'lite_blue', 'featured.php', 1, 0, 25, 0, 0),
(83, 'lite_blue', 'information.php', 0, 1, 5, 40, 1),
(84, 'lite_blue', 'languages.php', 1, 1, 100, 0, 0),
(85, 'lite_blue', 'manufacturers.php', 0, 0, 0, 0, 0),
(86, 'lite_blue', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(87, 'lite_blue', 'more_information.php', 0, 0, 0, 0, 0),
(88, 'lite_blue', 'music_genres.php', 0, 1, 0, 0, 0),
(89, 'lite_blue', 'order_history.php', 1, 1, 25, 0, 0),
(90, 'lite_blue', 'product_notifications.php', 1, 1, 55, 85, 1),
(91, 'lite_blue', 'record_companies.php', 0, 1, 0, 0, 0),
(92, 'lite_blue', 'reviews.php', 1, 1, 50, 0, 0),
(93, 'lite_blue', 'search.php', 1, 1, 10, 0, 0),
(94, 'lite_blue', 'search_header.php', 0, 0, 0, 30, 1),
(95, 'lite_blue', 'shopping_cart.php', 1, 1, 20, 30, 1),
(96, 'lite_blue', 'specials.php', 1, 0, 55, 0, 0),
(97, 'lite_blue', 'whats_new.php', 1, 0, 30, 0, 0),
(98, 'lite_blue', 'whos_online.php', 1, 1, 200, 200, 1),
(99, 'lite_green', 'banner_box.php', 0, 0, 300, 1, 0),
(100, 'lite_green', 'banner_box2.php', 1, 1, 0, 0, 0),
(101, 'lite_green', 'banner_box_all.php', 0, 1, 0, 0, 0),
(102, 'lite_green', 'best_sellers.php', 1, 1, 30, 70, 1),
(103, 'lite_green', 'categories.php', 1, 0, 10, 10, 1),
(104, 'lite_green', 'currencies.php', 1, 1, 90, 0, 0),
(105, 'lite_green', 'document_categories.php', 0, 0, 0, 0, 0),
(106, 'lite_green', 'ezpages.php', 1, 1, 15, 5, 1),
(107, 'lite_green', 'featured.php', 1, 0, 25, 0, 0),
(108, 'lite_green', 'information.php', 0, 1, 5, 40, 1),
(109, 'lite_green', 'languages.php', 1, 1, 100, 0, 0),
(110, 'lite_green', 'manufacturers.php', 0, 0, 0, 0, 0),
(111, 'lite_green', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(112, 'lite_green', 'more_information.php', 0, 0, 0, 0, 0),
(113, 'lite_green', 'music_genres.php', 0, 1, 0, 0, 0),
(114, 'lite_green', 'order_history.php', 1, 1, 25, 0, 0),
(115, 'lite_green', 'product_notifications.php', 1, 1, 55, 85, 1),
(116, 'lite_green', 'record_companies.php', 0, 1, 0, 0, 0),
(117, 'lite_green', 'reviews.php', 1, 1, 50, 0, 0),
(118, 'lite_green', 'search.php', 1, 1, 10, 0, 0),
(119, 'lite_green', 'search_header.php', 0, 0, 0, 30, 1),
(120, 'lite_green', 'shopping_cart.php', 1, 1, 20, 30, 1),
(121, 'lite_green', 'specials.php', 1, 0, 55, 0, 0),
(122, 'lite_green', 'whats_new.php', 1, 0, 30, 0, 0),
(123, 'lite_green', 'whos_online.php', 1, 1, 200, 200, 1),
(124, 'lite_grey', 'banner_box.php', 0, 0, 300, 1, 0),
(125, 'lite_grey', 'banner_box2.php', 0, 1, 0, 0, 0),
(126, 'lite_grey', 'banner_box_all.php', 0, 1, 0, 0, 0),
(127, 'lite_grey', 'best_sellers.php', 1, 1, 30, 70, 1),
(128, 'lite_grey', 'categories.php', 1, 0, 10, 10, 1),
(129, 'lite_grey', 'currencies.php', 0, 1, 90, 0, 0),
(130, 'lite_grey', 'document_categories.php', 0, 0, 0, 0, 0),
(131, 'lite_grey', 'ezpages.php', 1, 1, 15, 5, 1),
(132, 'lite_grey', 'featured.php', 1, 0, 25, 0, 0),
(133, 'lite_grey', 'information.php', 0, 1, 5, 40, 1),
(134, 'lite_grey', 'languages.php', 0, 1, 100, 0, 0),
(135, 'lite_grey', 'manufacturers.php', 0, 0, 0, 0, 0),
(136, 'lite_grey', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(137, 'lite_grey', 'more_information.php', 0, 0, 0, 0, 0),
(138, 'lite_grey', 'music_genres.php', 0, 1, 0, 0, 0),
(139, 'lite_grey', 'order_history.php', 1, 1, 25, 0, 0),
(140, 'lite_grey', 'product_notifications.php', 1, 1, 55, 85, 1),
(141, 'lite_grey', 'record_companies.php', 0, 1, 0, 0, 0),
(142, 'lite_grey', 'reviews.php', 1, 1, 50, 0, 0),
(143, 'lite_grey', 'search.php', 1, 1, 10, 0, 0),
(144, 'lite_grey', 'search_header.php', 0, 0, 0, 30, 1),
(145, 'lite_grey', 'shopping_cart.php', 1, 1, 20, 30, 1),
(146, 'lite_grey', 'specials.php', 1, 0, 55, 0, 0),
(147, 'lite_grey', 'whats_new.php', 1, 0, 30, 0, 0),
(148, 'lite_grey', 'whos_online.php', 1, 1, 200, 200, 1),
(149, 'lite_orange', 'banner_box.php', 0, 0, 300, 1, 0),
(150, 'lite_orange', 'banner_box2.php', 1, 1, 0, 0, 0),
(151, 'lite_orange', 'banner_box_all.php', 0, 1, 0, 0, 0),
(152, 'lite_orange', 'best_sellers.php', 1, 1, 30, 70, 1),
(153, 'lite_orange', 'categories.php', 1, 0, 10, 10, 1),
(154, 'lite_orange', 'currencies.php', 1, 1, 90, 0, 0),
(155, 'lite_orange', 'document_categories.php', 0, 0, 0, 0, 0),
(156, 'lite_orange', 'ezpages.php', 1, 1, 15, 5, 1),
(157, 'lite_orange', 'featured.php', 1, 0, 25, 0, 0),
(158, 'lite_orange', 'information.php', 0, 1, 5, 40, 1),
(159, 'lite_orange', 'languages.php', 1, 1, 100, 0, 0),
(160, 'lite_orange', 'manufacturers.php', 0, 0, 0, 0, 0),
(161, 'lite_orange', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(162, 'lite_orange', 'more_information.php', 0, 0, 0, 0, 0),
(163, 'lite_orange', 'music_genres.php', 0, 1, 0, 0, 0),
(164, 'lite_orange', 'order_history.php', 1, 1, 25, 0, 0),
(165, 'lite_orange', 'product_notifications.php', 1, 1, 55, 85, 1),
(166, 'lite_orange', 'record_companies.php', 0, 1, 0, 0, 0),
(167, 'lite_orange', 'reviews.php', 1, 1, 50, 0, 0),
(168, 'lite_orange', 'search.php', 1, 1, 10, 0, 0),
(169, 'lite_orange', 'search_header.php', 0, 0, 0, 30, 1),
(170, 'lite_orange', 'shopping_cart.php', 1, 1, 20, 30, 1),
(171, 'lite_orange', 'specials.php', 1, 0, 55, 0, 0),
(172, 'lite_orange', 'whats_new.php', 1, 0, 30, 0, 0),
(173, 'lite_orange', 'whos_online.php', 1, 1, 200, 200, 1),
(174, 'lite_red', 'banner_box.php', 0, 0, 300, 1, 0),
(175, 'lite_red', 'banner_box2.php', 1, 1, 0, 0, 0),
(176, 'lite_red', 'banner_box_all.php', 0, 1, 0, 0, 0),
(177, 'lite_red', 'best_sellers.php', 1, 1, 30, 70, 1),
(178, 'lite_red', 'categories.php', 1, 0, 10, 10, 1),
(179, 'lite_red', 'currencies.php', 1, 1, 90, 0, 0),
(180, 'lite_red', 'document_categories.php', 0, 0, 0, 0, 0),
(181, 'lite_red', 'ezpages.php', 1, 1, 15, 5, 1),
(182, 'lite_red', 'featured.php', 1, 0, 25, 0, 0),
(183, 'lite_red', 'information.php', 0, 1, 5, 40, 1),
(184, 'lite_red', 'languages.php', 1, 1, 100, 0, 0),
(185, 'lite_red', 'manufacturers.php', 0, 0, 0, 0, 0),
(186, 'lite_red', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(187, 'lite_red', 'more_information.php', 0, 0, 0, 0, 0),
(188, 'lite_red', 'music_genres.php', 0, 1, 0, 0, 0),
(189, 'lite_red', 'order_history.php', 1, 1, 25, 0, 0),
(190, 'lite_red', 'product_notifications.php', 1, 1, 55, 85, 1),
(191, 'lite_red', 'record_companies.php', 0, 1, 0, 0, 0),
(192, 'lite_red', 'reviews.php', 1, 1, 50, 0, 0),
(193, 'lite_red', 'search.php', 1, 1, 10, 0, 0),
(194, 'lite_red', 'search_header.php', 0, 0, 0, 30, 1),
(195, 'lite_red', 'shopping_cart.php', 1, 1, 20, 30, 1),
(196, 'lite_red', 'specials.php', 1, 0, 55, 0, 0),
(197, 'lite_red', 'whats_new.php', 1, 0, 30, 0, 0),
(198, 'lite_red', 'whos_online.php', 1, 1, 200, 200, 1),
(199, 'pure_black_free', 'banner_box.php', 0, 0, 300, 1, 0),
(200, 'pure_black_free', 'banner_box2.php', 1, 1, 0, 0, 0),
(201, 'pure_black_free', 'banner_box_all.php', 0, 1, 0, 0, 0),
(202, 'pure_black_free', 'best_sellers.php', 1, 1, 30, 70, 1),
(203, 'pure_black_free', 'categories.php', 1, 0, 10, 10, 1),
(204, 'pure_black_free', 'currencies.php', 0, 1, 0, 0, 0),
(205, 'pure_black_free', 'document_categories.php', 0, 0, 0, 0, 0),
(206, 'pure_black_free', 'ezpages.php', 1, 1, 15, 5, 1),
(207, 'pure_black_free', 'featured.php', 1, 0, 25, 0, 0),
(208, 'pure_black_free', 'information.php', 0, 1, 5, 40, 1),
(209, 'pure_black_free', 'languages.php', 0, 1, 0, 0, 0),
(210, 'pure_black_free', 'manufacturers.php', 0, 0, 0, 0, 0),
(211, 'pure_black_free', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(212, 'pure_black_free', 'more_information.php', 0, 0, 0, 0, 0),
(213, 'pure_black_free', 'music_genres.php', 0, 1, 0, 0, 0),
(214, 'pure_black_free', 'order_history.php', 1, 1, 25, 0, 0),
(215, 'pure_black_free', 'product_notifications.php', 1, 1, 55, 85, 1),
(216, 'pure_black_free', 'record_companies.php', 0, 1, 0, 0, 0),
(217, 'pure_black_free', 'reviews.php', 1, 1, 50, 0, 0),
(218, 'pure_black_free', 'search.php', 1, 1, 10, 0, 0),
(219, 'pure_black_free', 'search_header.php', 0, 0, 0, 30, 1),
(220, 'pure_black_free', 'shopping_cart.php', 1, 1, 20, 30, 1),
(221, 'pure_black_free', 'specials.php', 1, 0, 55, 0, 0),
(222, 'pure_black_free', 'whats_new.php', 1, 0, 30, 0, 0),
(223, 'pure_black_free', 'whos_online.php', 1, 1, 200, 200, 1),
(224, 'pure_blue_free', 'banner_box.php', 0, 0, 300, 1, 0),
(225, 'pure_blue_free', 'banner_box2.php', 1, 1, 0, 0, 0),
(226, 'pure_blue_free', 'banner_box_all.php', 0, 1, 0, 0, 0),
(227, 'pure_blue_free', 'best_sellers.php', 1, 1, 30, 70, 1),
(228, 'pure_blue_free', 'categories.php', 1, 0, 10, 10, 1),
(229, 'pure_blue_free', 'currencies.php', 0, 1, 0, 0, 0),
(230, 'pure_blue_free', 'document_categories.php', 0, 0, 0, 0, 0),
(231, 'pure_blue_free', 'ezpages.php', 1, 1, 15, 5, 1),
(232, 'pure_blue_free', 'featured.php', 1, 0, 25, 0, 0),
(233, 'pure_blue_free', 'information.php', 0, 1, 5, 40, 1),
(234, 'pure_blue_free', 'languages.php', 0, 1, 0, 0, 0),
(235, 'pure_blue_free', 'manufacturers.php', 0, 0, 0, 0, 0),
(236, 'pure_blue_free', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(237, 'pure_blue_free', 'more_information.php', 0, 0, 0, 0, 0),
(238, 'pure_blue_free', 'music_genres.php', 0, 1, 0, 0, 0),
(239, 'pure_blue_free', 'order_history.php', 1, 1, 25, 0, 0),
(240, 'pure_blue_free', 'product_notifications.php', 1, 1, 55, 85, 1),
(241, 'pure_blue_free', 'record_companies.php', 0, 1, 0, 0, 0),
(242, 'pure_blue_free', 'reviews.php', 1, 1, 50, 0, 0),
(243, 'pure_blue_free', 'search.php', 1, 1, 10, 0, 0),
(244, 'pure_blue_free', 'search_header.php', 0, 0, 0, 30, 1),
(245, 'pure_blue_free', 'shopping_cart.php', 1, 1, 20, 30, 1),
(246, 'pure_blue_free', 'specials.php', 1, 0, 55, 0, 0),
(247, 'pure_blue_free', 'whats_new.php', 1, 0, 30, 0, 0),
(248, 'pure_blue_free', 'whos_online.php', 1, 1, 200, 200, 1),
(249, 'pure_green_free', 'banner_box.php', 0, 0, 300, 1, 0),
(250, 'pure_green_free', 'banner_box2.php', 1, 1, 0, 0, 0),
(251, 'pure_green_free', 'banner_box_all.php', 0, 1, 0, 0, 0),
(252, 'pure_green_free', 'best_sellers.php', 1, 1, 30, 70, 1),
(253, 'pure_green_free', 'categories.php', 1, 0, 10, 10, 1),
(254, 'pure_green_free', 'currencies.php', 0, 1, 0, 0, 0),
(255, 'pure_green_free', 'document_categories.php', 0, 0, 0, 0, 0),
(256, 'pure_green_free', 'ezpages.php', 1, 1, 15, 5, 1),
(257, 'pure_green_free', 'featured.php', 1, 0, 25, 0, 0),
(258, 'pure_green_free', 'information.php', 0, 1, 5, 40, 1),
(259, 'pure_green_free', 'languages.php', 0, 1, 0, 0, 0),
(260, 'pure_green_free', 'manufacturers.php', 0, 0, 0, 0, 0),
(261, 'pure_green_free', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(262, 'pure_green_free', 'more_information.php', 0, 0, 0, 0, 0),
(263, 'pure_green_free', 'music_genres.php', 0, 1, 0, 0, 0),
(264, 'pure_green_free', 'order_history.php', 1, 1, 25, 0, 0),
(265, 'pure_green_free', 'product_notifications.php', 1, 1, 55, 85, 1),
(266, 'pure_green_free', 'record_companies.php', 0, 1, 0, 0, 0),
(267, 'pure_green_free', 'reviews.php', 1, 1, 50, 0, 0),
(268, 'pure_green_free', 'search.php', 1, 1, 10, 0, 0),
(269, 'pure_green_free', 'search_header.php', 0, 0, 0, 30, 1),
(270, 'pure_green_free', 'shopping_cart.php', 1, 1, 20, 30, 1),
(271, 'pure_green_free', 'specials.php', 1, 0, 55, 0, 0),
(272, 'pure_green_free', 'whats_new.php', 1, 0, 30, 0, 0),
(273, 'pure_green_free', 'whos_online.php', 1, 1, 200, 200, 1),
(274, 'pure_orange_free', 'banner_box.php', 0, 0, 300, 1, 0),
(275, 'pure_orange_free', 'banner_box2.php', 1, 1, 0, 0, 0),
(276, 'pure_orange_free', 'banner_box_all.php', 0, 1, 0, 0, 0),
(277, 'pure_orange_free', 'best_sellers.php', 1, 1, 30, 70, 1),
(278, 'pure_orange_free', 'categories.php', 1, 0, 10, 10, 1),
(279, 'pure_orange_free', 'currencies.php', 0, 1, 0, 0, 0),
(280, 'pure_orange_free', 'document_categories.php', 0, 0, 0, 0, 0),
(281, 'pure_orange_free', 'ezpages.php', 1, 1, 15, 5, 1),
(282, 'pure_orange_free', 'featured.php', 1, 0, 25, 0, 0),
(283, 'pure_orange_free', 'information.php', 0, 1, 5, 40, 1),
(284, 'pure_orange_free', 'languages.php', 0, 1, 0, 0, 0),
(285, 'pure_orange_free', 'manufacturers.php', 0, 0, 0, 0, 0),
(286, 'pure_orange_free', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(287, 'pure_orange_free', 'more_information.php', 0, 0, 0, 0, 0),
(288, 'pure_orange_free', 'music_genres.php', 0, 1, 0, 0, 0),
(289, 'pure_orange_free', 'order_history.php', 1, 1, 25, 0, 0),
(290, 'pure_orange_free', 'product_notifications.php', 1, 1, 55, 85, 1),
(291, 'pure_orange_free', 'record_companies.php', 0, 1, 0, 0, 0),
(292, 'pure_orange_free', 'reviews.php', 1, 1, 50, 0, 0),
(293, 'pure_orange_free', 'search.php', 1, 1, 10, 0, 0),
(294, 'pure_orange_free', 'search_header.php', 0, 0, 0, 30, 1),
(295, 'pure_orange_free', 'shopping_cart.php', 1, 1, 20, 30, 1),
(296, 'pure_orange_free', 'specials.php', 1, 0, 55, 0, 0),
(297, 'pure_orange_free', 'whats_new.php', 1, 0, 30, 0, 0),
(298, 'pure_orange_free', 'whos_online.php', 1, 1, 200, 200, 1),
(299, 'pure_red_free', 'banner_box.php', 0, 0, 300, 1, 0),
(300, 'pure_red_free', 'banner_box2.php', 1, 1, 0, 0, 0),
(301, 'pure_red_free', 'banner_box_all.php', 0, 1, 0, 0, 0),
(302, 'pure_red_free', 'best_sellers.php', 1, 1, 30, 70, 1),
(303, 'pure_red_free', 'categories.php', 1, 0, 10, 10, 1),
(304, 'pure_red_free', 'currencies.php', 0, 1, 0, 0, 0),
(305, 'pure_red_free', 'document_categories.php', 0, 0, 0, 0, 0),
(306, 'pure_red_free', 'ezpages.php', 1, 1, 15, 5, 1),
(307, 'pure_red_free', 'featured.php', 1, 0, 25, 0, 0),
(308, 'pure_red_free', 'information.php', 0, 1, 5, 40, 1),
(309, 'pure_red_free', 'languages.php', 0, 1, 0, 0, 0),
(310, 'pure_red_free', 'manufacturers.php', 0, 0, 0, 0, 0),
(311, 'pure_red_free', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(312, 'pure_red_free', 'more_information.php', 0, 0, 0, 0, 0),
(313, 'pure_red_free', 'music_genres.php', 0, 1, 0, 0, 0),
(314, 'pure_red_free', 'order_history.php', 1, 1, 25, 0, 0),
(315, 'pure_red_free', 'product_notifications.php', 1, 1, 55, 85, 1),
(316, 'pure_red_free', 'record_companies.php', 0, 1, 0, 0, 0),
(317, 'pure_red_free', 'reviews.php', 1, 1, 50, 0, 0),
(318, 'pure_red_free', 'search.php', 1, 1, 10, 0, 0),
(319, 'pure_red_free', 'search_header.php', 0, 0, 0, 30, 1),
(320, 'pure_red_free', 'shopping_cart.php', 1, 1, 20, 30, 1),
(321, 'pure_red_free', 'specials.php', 1, 0, 55, 0, 0),
(322, 'pure_red_free', 'whats_new.php', 1, 0, 30, 0, 0),
(323, 'pure_red_free', 'whos_online.php', 1, 1, 200, 200, 1),
(324, 'abagon', 'banner_box.php', 0, 0, 300, 1, 0),
(325, 'abagon', 'banner_box2.php', 1, 1, 0, 0, 0),
(326, 'abagon', 'banner_box_all.php', 0, 1, 0, 0, 0),
(327, 'abagon', 'best_sellers.php', 1, 1, 30, 70, 1),
(328, 'abagon', 'categories.php', 1, 0, 10, 10, 1),
(329, 'abagon', 'currencies.php', 0, 1, 0, 0, 0),
(330, 'abagon', 'document_categories.php', 0, 0, 0, 0, 0),
(331, 'abagon', 'ezpages.php', 1, 1, 15, 5, 1),
(332, 'abagon', 'featured.php', 1, 0, 25, 0, 0),
(333, 'abagon', 'information.php', 0, 1, 5, 40, 1),
(334, 'abagon', 'languages.php', 0, 1, 0, 0, 0),
(335, 'abagon', 'manufacturers.php', 0, 0, 0, 0, 0),
(336, 'abagon', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(337, 'abagon', 'more_information.php', 0, 0, 0, 0, 0),
(338, 'abagon', 'music_genres.php', 0, 1, 0, 0, 0),
(339, 'abagon', 'order_history.php', 1, 1, 25, 0, 0),
(340, 'abagon', 'product_notifications.php', 1, 1, 55, 85, 1),
(341, 'abagon', 'record_companies.php', 0, 1, 0, 0, 0),
(342, 'abagon', 'reviews.php', 1, 1, 50, 0, 0),
(343, 'abagon', 'search.php', 1, 1, 10, 0, 0),
(344, 'abagon', 'search_header.php', 0, 0, 0, 30, 1),
(345, 'abagon', 'shopping_cart.php', 1, 1, 20, 30, 1),
(346, 'abagon', 'specials.php', 1, 0, 55, 0, 0),
(347, 'abagon', 'whats_new.php', 1, 0, 30, 0, 0),
(348, 'abagon', 'whos_online.php', 1, 1, 200, 200, 1),
(349, 'crista_blue', 'banner_box.php', 0, 0, 300, 1, 0),
(350, 'crista_blue', 'banner_box2.php', 1, 1, 0, 0, 0),
(351, 'crista_blue', 'banner_box_all.php', 0, 1, 0, 0, 0),
(352, 'crista_blue', 'best_sellers.php', 1, 1, 30, 70, 1),
(353, 'crista_blue', 'categories.php', 1, 0, 10, 10, 1),
(354, 'crista_blue', 'currencies.php', 0, 1, 0, 0, 0),
(355, 'crista_blue', 'document_categories.php', 0, 0, 0, 0, 0),
(356, 'crista_blue', 'ezpages.php', 1, 1, 15, 5, 1),
(357, 'crista_blue', 'featured.php', 1, 0, 25, 0, 0),
(358, 'crista_blue', 'information.php', 0, 1, 5, 40, 1),
(359, 'crista_blue', 'languages.php', 0, 1, 0, 0, 0),
(360, 'crista_blue', 'manufacturers.php', 0, 0, 0, 0, 0),
(361, 'crista_blue', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(362, 'crista_blue', 'more_information.php', 0, 0, 0, 0, 0),
(363, 'crista_blue', 'music_genres.php', 0, 1, 0, 0, 0),
(364, 'crista_blue', 'order_history.php', 1, 1, 25, 0, 0),
(365, 'crista_blue', 'product_notifications.php', 1, 1, 55, 85, 1),
(366, 'crista_blue', 'record_companies.php', 0, 1, 0, 0, 0),
(367, 'crista_blue', 'reviews.php', 1, 1, 50, 0, 0),
(368, 'crista_blue', 'search.php', 1, 1, 10, 0, 0),
(369, 'crista_blue', 'search_header.php', 0, 0, 0, 30, 1),
(370, 'crista_blue', 'shopping_cart.php', 1, 1, 20, 30, 1),
(371, 'crista_blue', 'specials.php', 1, 0, 55, 0, 0),
(372, 'crista_blue', 'whats_new.php', 1, 0, 30, 0, 0),
(373, 'crista_blue', 'whos_online.php', 1, 1, 200, 200, 1),
(374, 'crista_grey', 'banner_box.php', 0, 0, 300, 1, 0),
(375, 'crista_grey', 'banner_box2.php', 1, 1, 0, 0, 0),
(376, 'crista_grey', 'banner_box_all.php', 0, 1, 0, 0, 0),
(377, 'crista_grey', 'best_sellers.php', 1, 1, 30, 70, 1),
(378, 'crista_grey', 'categories.php', 1, 0, 10, 10, 1),
(379, 'crista_grey', 'currencies.php', 0, 1, 0, 0, 0),
(380, 'crista_grey', 'document_categories.php', 0, 0, 0, 0, 0),
(381, 'crista_grey', 'ezpages.php', 1, 1, 15, 5, 1),
(382, 'crista_grey', 'featured.php', 1, 0, 25, 0, 0),
(383, 'crista_grey', 'information.php', 0, 1, 5, 40, 1),
(384, 'crista_grey', 'languages.php', 0, 1, 0, 0, 0),
(385, 'crista_grey', 'manufacturers.php', 0, 0, 0, 0, 0),
(386, 'crista_grey', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(387, 'crista_grey', 'more_information.php', 0, 0, 0, 0, 0),
(388, 'crista_grey', 'music_genres.php', 0, 1, 0, 0, 0),
(389, 'crista_grey', 'order_history.php', 1, 1, 25, 0, 0),
(390, 'crista_grey', 'product_notifications.php', 1, 1, 55, 85, 1),
(391, 'crista_grey', 'record_companies.php', 0, 1, 0, 0, 0),
(392, 'crista_grey', 'reviews.php', 1, 1, 50, 0, 0),
(393, 'crista_grey', 'search.php', 1, 1, 10, 0, 0),
(394, 'crista_grey', 'search_header.php', 0, 0, 0, 30, 1),
(395, 'crista_grey', 'shopping_cart.php', 1, 1, 20, 30, 1),
(396, 'crista_grey', 'specials.php', 1, 0, 55, 0, 0),
(397, 'crista_grey', 'whats_new.php', 1, 0, 30, 0, 0),
(398, 'crista_grey', 'whos_online.php', 1, 1, 200, 200, 1),
(399, 'crista_pink', 'banner_box.php', 0, 0, 300, 1, 0),
(400, 'crista_pink', 'banner_box2.php', 1, 1, 0, 0, 0),
(401, 'crista_pink', 'banner_box_all.php', 0, 1, 0, 0, 0),
(402, 'crista_pink', 'best_sellers.php', 1, 1, 30, 70, 1),
(403, 'crista_pink', 'categories.php', 1, 0, 10, 10, 1),
(404, 'crista_pink', 'currencies.php', 0, 1, 0, 0, 0),
(405, 'crista_pink', 'document_categories.php', 0, 0, 0, 0, 0),
(406, 'crista_pink', 'ezpages.php', 1, 1, 15, 5, 1),
(407, 'crista_pink', 'featured.php', 1, 0, 25, 0, 0),
(408, 'crista_pink', 'information.php', 0, 1, 5, 40, 1),
(409, 'crista_pink', 'languages.php', 0, 1, 0, 0, 0),
(410, 'crista_pink', 'manufacturers.php', 0, 0, 0, 0, 0),
(411, 'crista_pink', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(412, 'crista_pink', 'more_information.php', 0, 0, 0, 0, 0),
(413, 'crista_pink', 'music_genres.php', 0, 1, 0, 0, 0),
(414, 'crista_pink', 'order_history.php', 1, 1, 25, 0, 0),
(415, 'crista_pink', 'product_notifications.php', 1, 1, 55, 85, 1),
(416, 'crista_pink', 'record_companies.php', 0, 1, 0, 0, 0),
(417, 'crista_pink', 'reviews.php', 1, 1, 50, 0, 0),
(418, 'crista_pink', 'search.php', 1, 1, 10, 0, 0),
(419, 'crista_pink', 'search_header.php', 0, 0, 0, 30, 1),
(420, 'crista_pink', 'shopping_cart.php', 1, 1, 20, 30, 1),
(421, 'crista_pink', 'specials.php', 1, 0, 55, 0, 0),
(422, 'crista_pink', 'whats_new.php', 1, 0, 30, 0, 0),
(423, 'crista_pink', 'whos_online.php', 1, 1, 200, 200, 1),
(424, 'crista_violet', 'banner_box.php', 0, 0, 300, 1, 0),
(425, 'crista_violet', 'banner_box2.php', 1, 1, 0, 0, 0),
(426, 'crista_violet', 'banner_box_all.php', 0, 1, 0, 0, 0),
(427, 'crista_violet', 'best_sellers.php', 1, 1, 30, 70, 1),
(428, 'crista_violet', 'categories.php', 1, 0, 10, 10, 1),
(429, 'crista_violet', 'currencies.php', 0, 1, 0, 0, 0),
(430, 'crista_violet', 'document_categories.php', 0, 0, 0, 0, 0),
(431, 'crista_violet', 'ezpages.php', 1, 1, 15, 5, 1),
(432, 'crista_violet', 'featured.php', 1, 0, 25, 0, 0),
(433, 'crista_violet', 'information.php', 0, 1, 5, 40, 1),
(434, 'crista_violet', 'languages.php', 0, 1, 0, 0, 0),
(435, 'crista_violet', 'manufacturers.php', 0, 0, 0, 0, 0),
(436, 'crista_violet', 'manufacturer_info.php', 0, 0, 0, 0, 0),
(437, 'crista_violet', 'more_information.php', 0, 0, 0, 0, 0),
(438, 'crista_violet', 'music_genres.php', 0, 1, 0, 0, 0),
(439, 'crista_violet', 'order_history.php', 1, 1, 25, 0, 0),
(440, 'crista_violet', 'product_notifications.php', 1, 1, 55, 85, 1),
(441, 'crista_violet', 'record_companies.php', 0, 1, 0, 0, 0),
(442, 'crista_violet', 'reviews.php', 1, 1, 50, 0, 0),
(443, 'crista_violet', 'search.php', 1, 1, 10, 0, 0),
(444, 'crista_violet', 'search_header.php', 0, 0, 0, 30, 1),
(445, 'crista_violet', 'shopping_cart.php', 1, 1, 20, 30, 1),
(446, 'crista_violet', 'specials.php', 1, 0, 55, 0, 0),
(447, 'crista_violet', 'whats_new.php', 1, 0, 30, 0, 0),
(448, 'crista_violet', 'whos_online.php', 1, 1, 200, 200, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_manufacturers`
--

CREATE TABLE IF NOT EXISTS `zen_manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `zen_manufacturers`
--

INSERT INTO `zen_manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Matrox', 'manufacturers/manufacturer_matrox.gif', '2003-12-23 03:18:19', NULL),
(2, 'Microsoft', 'manufacturers/manufacturer_microsoft.gif', '2003-12-23 03:18:19', NULL),
(3, 'Warner', 'manufacturers/manufacturer_warner.gif', '2003-12-23 03:18:19', NULL),
(4, 'Fox', 'manufacturers/manufacturer_fox.gif', '2003-12-23 03:18:19', NULL),
(5, 'Logitech', 'manufacturers/manufacturer_logitech.gif', '2003-12-23 03:18:19', NULL),
(6, 'Canon', 'manufacturers/manufacturer_canon.gif', '2003-12-23 03:18:19', NULL),
(7, 'Sierra', 'manufacturers/manufacturer_sierra.gif', '2003-12-23 03:18:19', NULL),
(8, 'GT Interactive', 'manufacturers/manufacturer_gt_interactive.gif', '2003-12-23 03:18:19', NULL),
(9, 'Hewlett Packard', 'manufacturers/manufacturer_hewlett_packard.gif', '2003-12-23 03:18:19', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_manufacturers_info`
--

CREATE TABLE IF NOT EXISTS `zen_manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_manufacturers_info`
--

INSERT INTO `zen_manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 2, 'http://www.matrox.com', 0, NULL),
(2, 2, 'http://www.microsoft.com', 0, NULL),
(3, 2, 'http://www.warner.com', 0, NULL),
(4, 2, 'http://www.fox.com', 0, NULL),
(5, 2, 'http://www.logitech.com', 0, NULL),
(6, 2, 'http://www.canon.com', 0, NULL),
(7, 2, 'http://www.sierra.com', 0, NULL),
(8, 2, 'http://www.infogrames.com', 0, NULL),
(9, 2, 'http://www.hewlettpackard.com', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_media_clips`
--

CREATE TABLE IF NOT EXISTS `zen_media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `zen_media_clips`
--

INSERT INTO `zen_media_clips` (`clip_id`, `media_id`, `clip_type`, `clip_filename`, `date_added`, `last_modified`) VALUES
(1, 1, 1, 'thehunter.mp3', '2004-06-01 20:57:43', '0000-00-00 00:00:00'),
(6, 2, 1, 'thehunter.mp3', '2004-07-13 00:45:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `zen_media_manager`
--

CREATE TABLE IF NOT EXISTS `zen_media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zen_media_manager`
--

INSERT INTO `zen_media_manager` (`media_id`, `media_name`, `last_modified`, `date_added`) VALUES
(1, 'Russ Tippins - The Hunter', '2004-06-01 20:57:43', '2004-06-01 20:42:53'),
(2, 'Help!', '2004-07-13 01:01:14', '2004-07-12 17:57:45');

-- --------------------------------------------------------

--
-- 表的结构 `zen_media_to_products`
--

CREATE TABLE IF NOT EXISTS `zen_media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_media_to_products`
--

INSERT INTO `zen_media_to_products` (`media_id`, `product_id`) VALUES
(1, 166),
(2, 169);

-- --------------------------------------------------------

--
-- 表的结构 `zen_media_types`
--

CREATE TABLE IF NOT EXISTS `zen_media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_media_types`
--

INSERT INTO `zen_media_types` (`type_id`, `type_name`, `type_ext`) VALUES
(1, 'MP3', '.mp3');

-- --------------------------------------------------------

--
-- 表的结构 `zen_meta_tags_categories_description`
--

CREATE TABLE IF NOT EXISTS `zen_meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_meta_tags_products_description`
--

CREATE TABLE IF NOT EXISTS `zen_meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_music_genre`
--

CREATE TABLE IF NOT EXISTS `zen_music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zen_music_genre`
--

INSERT INTO `zen_music_genre` (`music_genre_id`, `music_genre_name`, `date_added`, `last_modified`) VALUES
(1, '摇滚', '2004-06-01 20:53:26', NULL),
(2, '爵士', '2004-06-01 20:53:45', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_newsletters`
--

CREATE TABLE IF NOT EXISTS `zen_newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders`
--

CREATE TABLE IF NOT EXISTS `zen_orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_products`
--

CREATE TABLE IF NOT EXISTS `zen_orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_products_attributes`
--

CREATE TABLE IF NOT EXISTS `zen_orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_products_download`
--

CREATE TABLE IF NOT EXISTS `zen_orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_status`
--

CREATE TABLE IF NOT EXISTS `zen_orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_orders_status`
--

INSERT INTO `zen_orders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES
(2, 2, '处理中'),
(3, 2, '已发货'),
(4, 2, '已更新'),
(1, 2, '等待中');

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_status_history`
--

CREATE TABLE IF NOT EXISTS `zen_orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_orders_total`
--

CREATE TABLE IF NOT EXISTS `zen_orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_paypal`
--

CREATE TABLE IF NOT EXISTS `zen_paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_paypal_payment_status`
--

CREATE TABLE IF NOT EXISTS `zen_paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `zen_paypal_payment_status`
--

INSERT INTO `zen_paypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Failed'),
(4, 'Denied'),
(5, 'Refunded'),
(6, 'Canceled_Reversal'),
(7, 'Reversed');

-- --------------------------------------------------------

--
-- 表的结构 `zen_paypal_payment_status_history`
--

CREATE TABLE IF NOT EXISTS `zen_paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_paypal_session`
--

CREATE TABLE IF NOT EXISTS `zen_paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_paypal_testing`
--

CREATE TABLE IF NOT EXISTS `zen_paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zen_products`
--

CREATE TABLE IF NOT EXISTS `zen_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- 转存表中的数据 `zen_products`
--

INSERT INTO `zen_products` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`) VALUES
(1, 1, 31, 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', 0, '2003-11-03 12:32:17', '2004-04-26 23:57:34', NULL, 23, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '299.9900', 4, 1, 0, 0, 0, 0, 0),
(2, 1, 31, 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', 0, '2003-11-03 12:32:17', NULL, NULL, 23, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '499.9900', 4, 1, 0, 0, 0, 0, 0),
(3, 1, 500, 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', 0, '2003-11-03 12:32:17', NULL, NULL, 7, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '39.9900', 9, 1, 0, 0, 0, 0, 0),
(4, 1, 12, 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', 0, '2003-11-03 12:32:17', NULL, NULL, 23, 1, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '42.0000', 10, 1, 0, 0, 0, 0, 0),
(5, 1, 15, 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:44:28', NULL, 7, 1, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '30.0000', 11, 1, 0, 0, 0, 0, 0),
(6, 1, 8, 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:48:28', NULL, 7, 1, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '30.0000', 10, 1, 0, 0, 0, 0, 0),
(7, 1, 500, 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', 0, '2003-11-03 12:32:17', '2004-04-27 14:53:17', NULL, 7, 1, 1, 3, 5, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '34.9900', 12, 1, 0, 0, 0, 0, 0),
(8, 1, 499, 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', 0, '2003-11-03 12:32:17', '2004-04-27 14:52:54', NULL, 7, 1, 1, 3, 6, 1, 1, 0, 0, 0, 0, 0, 1, 0, 10, 1, 1, '35.9900', 13, 1, 0, 0, 0, 0, 0),
(9, 1, 10, 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', 0, '2003-11-03 12:32:17', '2004-05-17 13:35:27', NULL, 7, 1, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '29.9900', 10, 1, 0, 0, 0, 0, 0),
(10, 1, 9, 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', 0, '2003-11-03 12:32:17', NULL, NULL, 7, 1, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '29.9900', 10, 1, 0, 0, 0, 0, 0),
(11, 1, 10, 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:43:40', NULL, 7, 1, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '29.9900', 10, 1, 0, 0, 0, 0, 0),
(12, 1, 9, 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', 0, '2003-11-03 12:32:17', '2004-05-16 00:34:33', NULL, 7, 1, 1, 4, 6, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '39.9900', 10, 1, 0, 0, 0, 0, 0),
(13, 1, 10, 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', 0, '2003-11-03 12:32:17', '2004-04-27 00:07:35', NULL, 7, 1, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '34.9900', 10, 1, 0, 0, 0, 0, 0),
(14, 1, 9, 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', 0, '2003-11-03 12:32:17', '2003-12-23 00:47:39', NULL, 7, 1, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '32.0000', 15, 1, 0, 0, 0, 0, 0),
(15, 1, 9, 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', 0, '2003-11-03 12:32:17', '2003-12-23 00:43:55', NULL, 7, 1, 1, 3, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '35.0000', 14, 1, 0, 0, 0, 0, 0),
(16, 1, 9, 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:42:57', '2008-02-21 00:00:00', 7, 1, 1, 4, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '29.9900', 15, 1, 0, 0, 0, 0, 0),
(17, 1, 10, 'DVD-SPEED', 'dvd/speed.gif', '39.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:47:51', NULL, 7, 1, 1, 4, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '39.9900', 10, 1, 0, 0, 0, 0, 0),
(18, 1, 10, 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', 0, '2003-11-03 12:32:17', NULL, NULL, 7, 1, 1, 4, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '42.0000', 10, 1, 0, 0, 0, 0, 0),
(19, 1, 10, 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:49:00', NULL, 7, 1, 1, 4, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '49.9900', 12, 1, 0, 0, 0, 0, 0),
(20, 1, 8, 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:42:34', NULL, 7, 1, 1, 3, 2, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '54.9900', 15, 1, 0, 0, 0, 0, 0),
(21, 1, 16, 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', 0, '2003-11-03 12:32:17', '2004-04-27 14:51:00', NULL, 7, 1, 1, 7, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '79.9900', 18, 1, 0, 0, 0, 0, 0),
(22, 1, 13, 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:49:29', NULL, 7, 1, 1, 8, 9, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '89.9900', 19, 1, 0, 0, 0, 0, 0),
(23, 1, 16, 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:48:50', NULL, 10, 1, 1, 8, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '99.9900', 20, 1, 0, 0, 0, 0, 0),
(24, 1, 16, 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', 0, '2003-11-03 12:32:17', '2003-12-23 00:43:24', NULL, 8, 1, 1, 8, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '90.0000', 20, 1, 0, 0, 0, 0, 0),
(25, 1, 16, 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', 0, '2003-11-03 12:32:17', '2004-01-04 03:02:41', NULL, 8, 1, 1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '69.9900', 8, 1, 0, 0, 0, 0, 0),
(26, 1, 9, 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', 0, '2003-11-03 12:32:17', '2004-05-03 01:47:47', NULL, 8, 1, 1, 2, 17, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '64.9500', 9, 1, 0, 0, 0, 0, 0),
(27, 1, 70, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', 0, '2003-11-03 12:32:17', '2003-12-23 00:45:03', NULL, 45, 1, 1, 9, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '499.9900', 5, 1, 0, 0, 0, 0, 0),
(28, 1, 999, 'GIFT005', 'gift_certificates/gv_5.gif', '5.0000', 1, '2003-11-03 12:32:17', '2004-01-10 02:57:18', NULL, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '5.0000', 21, 1, 0, 0, 0, 0, 0),
(29, 1, 985, 'GIFT 010', 'gift_certificates/gv_10.gif', '10.0000', 1, '2003-11-03 12:32:17', '2003-12-28 14:51:36', NULL, 0, 1, 0, 0, 15, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '10.0000', 21, 1, 0, 0, 0, 0, 0),
(30, 1, 992, 'GIFT025', 'gift_certificates/gv_25.gif', '25.0000', 1, '2003-11-03 12:32:17', NULL, NULL, 0, 1, 0, 0, 8, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '25.0000', 21, 1, 0, 0, 0, 0, 0),
(31, 1, 997, 'GIFT050', 'gift_certificates/gv_50.gif', '50.0000', 1, '2003-11-03 12:32:17', NULL, NULL, 0, 1, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '50.0000', 21, 1, 0, 0, 0, 0, 0),
(32, 1, 995, 'GIFT100', 'gift_certificates/gv_100.gif', '100.0000', 1, '2003-11-03 12:32:17', NULL, NULL, 0, 1, 0, 0, 5, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '100.0000', 21, 1, 0, 0, 0, 0, 0),
(34, 1, 796, 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', 0, '2003-11-07 22:03:45', '2004-01-01 14:16:01', '2005-02-21 00:00:00', 7, 1, 1, 3, 5, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '35.9900', 22, 1, 0, 0, 0, 0, 0),
(36, 1, 700, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', 0, '2003-12-24 14:29:11', '2004-01-03 01:51:12', NULL, 45, 1, 1, 9, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, '499.0000', 25, 1, 0, 0, 0, 0, 0),
(39, 1, 997, 'TESTFREE', 'free.gif', '100.0000', 0, '2003-12-25 16:33:13', '2004-01-11 02:29:16', NULL, 1, 1, 1, 0, 3, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, '0.0000', 24, 1, 0, 0, 0, 0, 0),
(40, 1, 999, 'TESTCALL', 'call_for_price.jpg', '100.0000', 0, '2003-12-25 17:42:15', '2004-01-04 13:08:08', '2008-02-21 00:00:00', 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, '100.0000', 24, 1, 0, 0, 0, 0, 0),
(41, 1, 999, 'TESTCALL', 'call_for_price.jpg', '100.0000', 0, '2003-12-25 19:13:35', '2004-09-27 13:33:33', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, '100.0000', 28, 0, 0, 0, 0, 0, 0),
(42, 1, 998, 'TESTFREE', 'free.gif', '100.0000', 0, '2003-12-25 19:14:16', '2003-12-25 19:15:00', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, '0.0000', 28, 1, 0, 0, 0, 0, 0),
(43, 1, 999, 'TESTFREEATTRIB', 'free.gif', '100.0000', 0, '2003-12-25 20:44:06', '2004-01-21 16:23:29', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, '0.0000', 24, 1, 0, 0, 0, 0, 0),
(44, 1, 999, 'TESTMINUNITSNOMIX', 'sample_image.gif', '100.0000', 0, '2003-12-25 21:38:59', '2004-01-22 13:15:41', NULL, 1, 1, 1, 0, 0, 4, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '90.0000', 22, 1, 0, 0, 0, 0, 0),
(46, 1, 981, 'TESTMINUNITSMIX', 'sample_image.gif', '100.0000', 0, '2003-12-25 21:53:07', '2003-12-29 02:00:50', NULL, 1, 1, 1, 0, 18, 4, 2, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 22, 1, 0, 0, 0, 0, 0),
(47, 1, 9996, 'GIFT', 'gift_certificates/gv.gif', '0.0000', 1, '2003-12-27 22:56:57', '2004-09-29 20:11:51', NULL, 0, 1, 0, 0, 4, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '5.0000', 21, 1, 0, 0, 0, 0, 0),
(48, 1, 9990, 'TEST1', '1_small.jpg', '39.0000', 0, '2003-12-28 02:27:47', '2004-01-11 02:56:37', NULL, 1, 1, 1, 0, 10, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '39.0000', 23, 1, 0, 0, 0, 0, 0),
(49, 1, 900, 'TEST2', '2_small.jpg', '20.0000', 0, '2003-12-28 02:28:42', '2003-12-29 23:00:27', NULL, 0.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '20.0000', 23, 1, 0, 0, 0, 0, 0),
(50, 1, 1000, 'TEST3', '3_small.jpg', '75.0000', 0, '2003-12-28 02:29:37', '2003-12-29 23:01:04', NULL, 1.5, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '75.0000', 23, 1, 0, 0, 0, 0, 0),
(51, 1, 998, 'Free1', 'b_g_grid.gif', '25.0000', 0, '2003-12-28 11:51:05', '2004-01-21 17:03:32', NULL, 10, 1, 1, 0, 2, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, '0.0000', 24, 1, 0, 0, 0, 0, 0),
(52, 1, 997, 'Free2', 'b_p_grid.gif', '0.0000', 1, '2003-12-28 12:24:58', '2004-01-21 17:01:18', NULL, 2, 1, 1, 0, 2, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, '0.0000', 24, 1, 0, 0, 0, 0, 0),
(53, 1, 991, 'MINUNITSMIX', 'b_c_grid.gif', '25.0000', 0, '2003-12-28 23:26:44', '2004-01-11 02:22:35', NULL, 1, 1, 1, 0, 6, 6, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '20.0000', 23, 1, 0, 0, 0, 0, 0),
(54, 1, 991, 'MINUNITSNOMIX', 'waybkgnd.gif', '25.0000', 0, '2003-12-29 23:19:13', '2004-01-11 02:23:08', NULL, 1, 1, 1, 0, 0, 6, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '25.0000', 23, 1, 0, 0, 0, 0, 0),
(55, 1, 991, 'MINUNITSMIXSALE', 'b_b_grid.gif', '25.0000', 0, '2003-12-31 11:11:46', '2004-01-11 02:26:28', NULL, 1, 1, 1, 0, 0, 6, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '25.0000', 28, 1, 0, 0, 0, 0, 0),
(56, 1, 991, 'MINUNITSNOMIXSALE', 'b_w_grid.gif', '25.0000', 0, '2003-12-31 11:13:08', '2004-01-11 02:26:49', NULL, 1, 1, 1, 0, 0, 6, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '25.0000', 28, 1, 0, 0, 0, 0, 0),
(57, 1, 998, 'TESTFREEALL', 'free.gif', '0.0000', 0, '2003-12-31 11:36:09', '2004-01-21 16:55:19', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, '0.0000', 24, 1, 0, 0, 0, 0, 0),
(59, 1, 700, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', 0, '2003-12-31 14:36:57', '2003-12-31 14:37:05', NULL, 45, 1, 1, 9, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, '300.0000', 23, 1, 0, 0, 0, 0, 0),
(60, 1, 699, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', 0, '2004-01-02 01:34:55', '2004-01-02 01:41:37', NULL, 45, 1, 1, 9, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '499.7500', 28, 1, 0, 0, 0, 0, 0),
(61, 1, 699, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', 0, '2004-01-02 01:44:09', '2004-01-02 01:45:45', NULL, 45, 1, 1, 9, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '499.7500', 28, 1, 0, 0, 0, 0, 0),
(74, 1, 700, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', 0, '2004-01-02 15:34:49', '2004-01-02 15:35:17', NULL, 45, 1, 1, 9, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, '399.2000', 23, 1, 0, 0, 0, 0, 0),
(76, 1, 1000, 'Test25-10', 'test_demo.jpg', '100.0000', 0, '2004-01-03 23:08:33', NULL, NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '75.0000', 28, 1, 0, 0, 0, 0, 0),
(78, 1, 1000, 'Test25-10AttrAll', 'test_demo.jpg', '0.0000', 0, '2004-01-04 01:09:46', '2004-01-04 01:30:12', NULL, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '112.5000', 25, 1, 0, 0, 0, 0, 0),
(79, 1, 1000, 'Test25-AttrAll', 'test_demo.jpg', '0.0000', 0, '2004-01-04 01:28:52', '2004-01-04 01:33:55', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '150.0000', 23, 1, 0, 0, 0, 0, 0),
(80, 1, 1000, 'Test25', 'test_demo.jpg', '100.0000', 0, '2004-01-04 01:31:06', '2004-01-04 13:35:47', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '100.0000', 23, 1, 0, 0, 0, 0, 0),
(82, 1, 1000, 'Test120-5', 'test_demo.jpg', '120.0000', 0, '2004-01-04 14:50:38', '2004-01-04 17:09:03', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '115.0000', 27, 1, 0, 0, 0, 0, 0),
(83, 1, 1000, 'Test120-90-5', 'test_demo.jpg', '120.0000', 0, '2004-01-04 15:01:53', '2004-01-06 10:02:11', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '85.0000', 27, 1, 0, 0, 0, 0, 0),
(84, 1, 999, 'Test120', 'test_demo.jpg', '120.0000', 0, '2004-01-04 15:05:10', '2004-01-06 15:27:39', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '120.0000', 23, 1, 0, 0, 0, 0, 0),
(85, 1, 1000, 'Test90', 'test_demo.jpg', '120.0000', 0, '2004-01-04 15:19:00', '2004-01-06 10:00:35', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 23, 1, 0, 0, 0, 0, 0),
(88, 1, 1000, 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', 0, '2004-01-05 00:14:31', '2004-01-06 09:58:08', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 31, 1, 0, 0, 0, 0, 0),
(89, 1, 1000, 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', 0, '2004-01-05 00:41:40', '2004-01-06 09:57:42', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '108.0000', 31, 1, 0, 0, 0, 0, 0),
(90, 1, 999, 'Test120-90-10', 'test_demo.jpg', '120.0000', 0, '2004-01-05 23:55:18', '2004-01-06 00:08:58', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 45, 1, 0, 0, 0, 0, 0),
(92, 1, 1000, 'Test120-90off-10', 'test_demo.jpg', '120.0000', 0, '2004-01-05 23:58:54', '2004-01-06 00:09:28', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '120.0000', 45, 1, 0, 0, 0, 0, 0),
(93, 1, 1000, 'Test120-New100', 'test_demo.jpg', '120.0000', 0, '2004-01-06 00:02:32', '2004-01-06 00:04:25', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '100.0000', 46, 1, 0, 0, 0, 0, 0),
(94, 1, 1000, 'Test120-25-New100', 'test_demo.jpg', '120.0000', 0, '2004-01-06 00:04:31', '2004-01-06 00:07:08', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '100.0000', 46, 1, 0, 0, 0, 0, 0),
(95, 1, 1000, 'Test120-25-New100-Skip', 'test_demo.jpg', '120.0000', 0, '2004-01-07 02:35:44', '2004-01-07 02:37:27', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 51, 1, 0, 0, 0, 0, 0),
(96, 1, 1000, 'Test120-New100-Off-Skip', 'test_demo.jpg', '120.0000', 0, '2004-01-07 02:36:52', '2004-01-07 02:37:29', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '100.0000', 51, 1, 0, 0, 0, 0, 0),
(97, 1, 1000, 'Test120-90-10-Price', 'test_demo.jpg', '120.0000', 0, '2004-01-07 11:26:34', '2004-01-07 11:27:24', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '108.0000', 32, 1, 0, 0, 0, 0, 0),
(98, 1, 1000, 'Test120-90off-10-Price', 'test_demo.jpg', '120.0000', 0, '2004-01-07 11:28:16', '2004-01-07 11:29:57', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '108.0000', 32, 1, 0, 0, 0, 0, 0),
(99, 1, 997, 'FreeShipping', 'small_00.jpg', '25.0000', 0, '2004-01-07 13:27:30', '2004-01-21 01:48:48', NULL, 5, 1, 1, 0, 3, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, '25.0000', 23, 1, 0, 0, 0, 0, 0),
(100, 1, 700, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', 0, '2004-01-08 14:06:13', '2004-01-08 14:06:50', NULL, 45, 1, 1, 9, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, '374.2500', 25, 1, 0, 0, 0, 0, 0),
(101, 1, 1000, 'Test120-90off-10', 'test_demo.jpg', '0.0000', 0, '2004-01-08 14:11:32', '2004-01-08 14:17:09', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '80.0000', 47, 1, 0, 0, 0, 0, 0),
(104, 1, 1000, 'HIDEQTY', '1_small.jpg', '75.0000', 0, '2004-01-11 03:02:51', '2004-01-22 11:21:36', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '75.0000', 23, 1, 0, 0, 0, 0, 0),
(105, 1, 999, 'MAXSAMPLE-1', 'waybkgnd.gif', '50.0000', 0, '2004-01-11 14:10:59', '2004-01-11 14:36:00', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, '50.0000', 22, 1, 0, 0, 0, 0, 0),
(106, 1, 1000, 'MAXSAMPLE-3', 'waybkgnd.gif', '50.0000', 0, '2004-01-11 14:36:08', '2004-01-11 15:32:56', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 3, 0, 0, 0, '50.0000', 22, 1, 0, 0, 0, 0, 0),
(107, 1, 995, 'FreeShippingNoWeight', 'small_00.jpg', '25.0000', 0, '2004-01-21 01:41:22', '2004-01-21 02:01:54', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '25.0000', 23, 1, 0, 0, 0, 0, 0),
(108, 1, 0, 'SoldOut', 'small_00.jpg', '25.0000', 0, '2004-01-21 01:53:20', NULL, NULL, 3, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '25.0000', 23, 1, 0, 0, 0, 0, 0),
(109, 1, 1000, 'HIDEQTYBOX', '1_small.jpg', '75.0000', 0, '2004-01-21 22:01:20', '2004-01-22 11:21:12', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, '75.0000', 23, 1, 0, 0, 0, 0, 0),
(110, 1, 1000, 'Test120-5SKIP', 'test_demo.jpg', '120.0000', 0, '2004-01-24 16:09:52', '2004-01-24 16:15:25', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '115.0000', 52, 1, 0, 0, 0, 0, 0),
(111, 1, 1000, 'Test120-90-5SKIP', 'test_demo.jpg', '120.0000', 0, '2004-01-24 16:10:12', '2004-01-24 16:15:27', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '90.0000', 52, 1, 0, 0, 0, 0, 0),
(112, 1, 998, 'Test2', '', '25.0000', 0, '2004-04-26 02:24:57', '2004-04-26 02:25:44', NULL, 1, 1, 1, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 2, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(113, 1, 994, 'Test4', '', '25.0000', 0, '2004-04-26 02:25:03', '2004-04-26 02:25:35', NULL, 1, 1, 1, 0, 6, 1, 1, 0, 0, 0, 1, 0, 1, 0, 4, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(114, 1, 998, 'Test5', '', '25.0000', 0, '2004-04-26 02:25:53', '2004-04-26 02:26:15', NULL, 1, 1, 1, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 5, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(115, 1, 999, 'Test1', '', '25.0000', 0, '2004-04-26 02:26:23', '2004-05-06 21:50:19', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(116, 1, 997, 'Test8', '', '25.0000', 0, '2004-04-26 02:26:54', '2004-04-26 02:27:18', NULL, 1, 1, 1, 0, 3, 1, 1, 0, 0, 0, 1, 0, 1, 0, 8, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(117, 1, 995, 'Test3', '', '25.0000', 0, '2004-04-26 02:27:24', '2004-10-03 12:20:14', NULL, 1, 1, 1, 0, 5, 1, 1, 0, 0, 0, 1, 0, 1, 0, 3, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(118, 1, 999, 'Test10', '', '25.0000', 0, '2004-04-26 02:27:52', '2004-04-26 02:28:14', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 10, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(119, 1, 1000, 'Test6', '', '25.0000', 0, '2004-04-26 02:28:22', '2004-10-06 18:26:25', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 6, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(120, 1, 1000, 'Test7', '', '25.0000', 0, '2004-04-26 02:29:03', '2004-04-26 02:29:23', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 7, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(121, 1, 999, 'Test12', '', '25.0000', 0, '2004-04-26 02:29:36', '2004-04-28 13:02:47', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 12, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(122, 1, 998, 'Test9', '', '25.0000', 0, '2004-04-26 02:30:12', '2004-04-26 02:30:32', NULL, 1, 1, 1, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 9, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(123, 1, 999, 'Test11', '', '25.0000', 0, '2004-04-26 02:30:41', '2004-04-26 02:31:04', NULL, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 11, 0, 0, '25.0000', 53, 1, 0, 0, 0, 0, 0),
(127, 1, 1000, 'Normal', 'small_00.jpg', '15.0000', 0, '2004-04-28 01:51:35', '2004-04-28 14:23:29', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, '15.0000', 55, 1, 0, 0, 0, 0, 0),
(130, 1, 1000, 'Special', '2_small.jpg', '15.0000', 0, '2004-04-28 02:19:53', '2004-10-06 00:05:34', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, '10.0000', 55, 1, 0, 0, 0, 0, 0),
(131, 1, 1000, 'PERWORDREQ', '', '0.0000', 0, '2004-05-01 01:31:28', '2004-05-07 21:30:23', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '5.0000', 57, 1, 0, 0, 0, 0, 0),
(132, 1, 997, 'GolfClub', '9_small.jpg', '0.0000', 0, '2004-05-02 12:36:12', '2004-05-02 18:04:36', NULL, 1, 1, 1, 0, 3, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '14.4500', 58, 1, 0, 0, 0, 0, 0),
(133, 1, 1000, 'DOWNLOAD2', '2_small.jpg', '49.9900', 0, '2004-05-02 23:51:33', '2004-05-03 00:06:58', NULL, 0, 1, 1, 0, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '49.9900', 60, 1, 0, 0, 0, 0, 0),
(134, 1, 1000, 'PERLETTERREQ', '', '0.0000', 0, '2004-05-07 21:23:58', '2004-05-07 21:29:50', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '5.0000', 57, 1, 0, 0, 0, 0, 0),
(154, 1, 10000, 'ROPE', '9_small.jpg', '1.0000', 0, '2004-05-16 21:08:08', '2004-07-12 17:18:46', NULL, 0, 1, 1, 0, 0, 10, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '1.0000', 58, 0, 0, 0, 0, 0, 0),
(155, 1, 1000, 'PRICEFACTOR', 'sample_image.gif', '10.0000', 0, '2004-05-17 23:03:10', '2004-07-12 17:21:04', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '10.0000', 56, 1, 0, 0, 0, 0, 0),
(156, 1, 1000, 'PRICEFACTOROFF', 'sample_image.gif', '10.0000', 0, '2004-05-17 23:05:24', '2004-05-17 23:10:12', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '10.0000', 56, 1, 0, 0, 0, 0, 0),
(157, 1, 1000, 'PRICEFACTOROFFATTR', 'sample_image.gif', '10.0000', 0, '2004-05-17 23:10:18', '2004-05-17 23:13:48', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '10.0000', 56, 1, 0, 0, 0, 0, 0),
(158, 1, 1000, 'ONETIME', 'b_b_grid.gif', '45.0000', 0, '2004-05-17 23:22:08', NULL, NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '45.0000', 56, 1, 0, 0, 0, 0, 0),
(159, 1, 10000, 'ATTQTYPRICE', 'b_c_grid.gif', '25.0000', 0, '2004-05-17 23:29:31', '2004-05-17 23:49:56', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '25.0000', 56, 1, 0, 0, 0, 0, 0),
(160, 1, 997, 'GolfClub', '9_small.jpg', '0.0000', 0, '2004-05-18 10:14:35', '2004-05-18 10:15:16', NULL, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '14.4500', 61, 1, 0, 0, 0, 0, 0),
(165, 1, 10000, 'ROPE', '9_small.jpg', '1.0000', 0, '2004-05-18 10:42:50', '2004-07-12 17:18:12', NULL, 0, 1, 1, 0, 0, 10, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '1.0000', 61, 0, 0, 0, 0, 0, 0),
(166, 2, 10000, 'RTBHUNTER', 'sooty.jpg', '4.9900', 0, '2004-05-18 10:42:50', '2004-05-18 10:43:00', NULL, 3, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '3.0000', 62, 1, 0, 0, 0, 0, 0),
(167, 3, 0, '', '', '0.0000', 0, '2004-05-18 10:42:50', '2004-10-06 00:39:10', NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.0000', 63, 1, 0, 0, 0, 0, 0),
(168, 1, 1000, 'PGT', 'samples/1_small.jpg', '3.9500', 0, '2004-07-12 15:25:32', '2004-07-12 16:26:08', NULL, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 10, 0, 0, '3.9500', 64, 1, 0, 0, 0, 0, 0),
(169, 2, 1000, 'PMT', 'samples/2_small.jpg', '3.9500', 0, '2004-07-12 15:27:50', '2004-07-12 16:29:01', NULL, 1, 1, 1, NULL, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 20, 0, 0, '3.9500', 64, 1, 0, 0, 0, 0, 0),
(170, 3, 0, '', 'samples/3_small.jpg', '0.0000', 0, '2004-07-12 15:29:23', '2004-09-27 23:11:25', NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, '0.0000', 64, 1, 0, 0, 0, 0, 0),
(171, 4, 1000, 'DPT', 'samples/4_small.jpg', '0.9346', 0, '2004-07-12 15:32:40', '2004-07-12 17:46:49', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 40, 0, 0, '3.9500', 64, 1, 0, 0, 0, 0, 0),
(172, 5, 1000, 'PFS', 'samples/5_small.jpg', '3.9500', 0, '2004-07-12 15:39:18', '2004-07-12 23:08:43', NULL, 5, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 50, 0, 0, '3.9500', 64, 1, 0, 0, 0, 0, 0),
(173, 1, 1000, 'Book', 'b_g_grid.gif', '0.0000', 0, '2004-09-24 23:54:34', '2004-09-26 02:50:59', NULL, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, '52.5000', 61, 1, 0, 0, 0, 0, 0),
(174, 1, 999, 'TESTCALL', 'call_for_price.jpg', '0.0000', 0, '2004-09-27 13:25:44', '2004-09-27 13:28:54', '2008-02-21 00:00:00', 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, '0.0000', 24, 0, 0, 0, 0, 0, 0),
(175, 1, 1000, 'Normal', '1_small.jpg', '60.0000', 0, '2004-09-27 23:32:52', '2004-10-05 17:13:20', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '60.0000', 55, 1, 0, 0, 0, 0, 0),
(176, 1, 1000, 'Normal', 'small_00.jpg', '100.0000', 0, '2004-10-05 16:45:25', '2004-10-05 16:47:22', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, '100.0000', 55, 1, 0, 0, 0, 0, 0),
(177, 1, 1000, 'Special', '2_small.jpg', '100.0000', 0, '2004-10-05 16:47:45', '2004-10-06 00:05:48', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, '75.0000', 55, 1, 0, 0, 0, 0, 0),
(178, 1, 1000, 'Normal', '1_small.jpg', '60.0000', 0, '2004-10-05 16:54:52', '2004-10-05 17:15:02', NULL, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, '50.0000', 55, 1, 0, 0, 0, 0, 0),
(179, 1, 1000, 'DOWNLOAD1', '1_small.jpg', '39.0000', 0, '2004-10-06 00:08:33', '2004-10-06 00:18:51', NULL, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '39.0000', 60, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_attributes`
--

CREATE TABLE IF NOT EXISTS `zen_products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1104 ;

--
-- 转存表中的数据 `zen_products_attributes`
--

INSERT INTO `zen_products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`, `products_options_sort_order`, `product_attribute_is_free`, `products_attributes_weight`, `products_attributes_weight_prefix`, `attributes_display_only`, `attributes_default`, `attributes_discounted`, `attributes_image`, `attributes_price_base_included`, `attributes_price_onetime`, `attributes_price_factor`, `attributes_price_factor_offset`, `attributes_price_factor_onetime`, `attributes_price_factor_onetime_offset`, `attributes_qty_prices`, `attributes_qty_prices_onetime`, `attributes_price_words`, `attributes_price_words_free`, `attributes_price_letters`, `attributes_price_letters_free`, `attributes_required`) VALUES
(1, 1, 4, 1, '0.0000', '', 10, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(2, 1, 4, 2, '50.0000', '+', 20, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(3, 1, 4, 3, '70.0000', '+', 30, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(4, 1, 3, 5, '0.0000', '+', 10, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(5, 1, 3, 6, '100.0000', '+', 20, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(6, 2, 4, 3, '10.0000', '-', 30, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(7, 2, 4, 4, '0.0000', '+', 40, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(8, 2, 3, 6, '0.0000', '+', 20, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(9, 2, 3, 7, '120.0000', '+', 30, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(10, 26, 3, 8, '0.0000', '+', 20, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(11, 26, 3, 9, '6.0000', '+', 10, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(26, 22, 5, 10, '0.0000', '+', 10, 0, 7, '-', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(27, 22, 5, 13, '0.0000', '+', 1000, 0, 0, '', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(38, 34, 1, 15, '0.4000', '+', 50, 0, 0, '', 0, 0, 1, 'attributes/a_bugs_life_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(39, 34, 1, 16, '0.1000', '+', 10, 0, 0.1, '', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(40, 34, 1, 17, '0.3000', '+', 30, 0, 0.1, '', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(41, 34, 2, 21, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(42, 34, 2, 19, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(43, 34, 2, 20, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(44, 34, 2, 18, '0.0000', '+', 30, 0, 0, '+', 0, 1, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(45, 34, 6, 14, '36.9900', '+', 30, 0, 9, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(46, 34, 6, 22, '1.0000', '+', 20, 0, 2, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(47, 34, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(48, 34, 5, 24, '1.0000', '+', 10, 0, 2, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(52, 34, 10, 0, '0.5000', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(53, 34, 9, 0, '0.7500', '+', 0, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(54, 34, 11, 0, '1.0000', '+', 0, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(55, 34, 8, 0, '0.2500', '+', 0, 0, 0, '+', 0, 0, 1, NULL, 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(56, 34, 7, 0, '0.2500', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(63, 34, 13, 34, '1.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(64, 34, 13, 36, '2.0000', '+', 20, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(65, 34, 13, 35, '5.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(85, 34, 1, 25, '0.2000', '+', 20, 0, 0.1, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(86, 34, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(87, 34, 1, 27, '0.0000', '+', 60, 0, 0.1, '+', 0, 0, 1, 'attributes/a_bugs_life_purple.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(88, 34, 1, 28, '0.0000', '+', 70, 0, 0, '+', 0, 0, 1, 'attributes/a_bugs_life_brown.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(89, 34, 1, 30, '0.0000', '+', 90, 0, 0, '+', 0, 0, 1, 'attributes/a_bugs_life_white.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(90, 34, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/a_bugs_life_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(101, 36, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(102, 36, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(103, 36, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(104, 36, 1, 29, '519.0000', '', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(105, 36, 1, 30, '499.0000', '', 90, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(106, 36, 1, 15, '539.0000', '', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(119, 43, 1, 16, '5.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(120, 43, 1, 17, '6.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(121, 43, 1, 29, '7.0000', '+', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(122, 43, 2, 21, '0.0000', '+', 20, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(123, 43, 2, 18, '1.0000', '+', 30, 1, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(124, 43, 2, 20, '2.0000', '+', 40, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(125, 44, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(126, 44, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(127, 44, 1, 29, '0.0000', '+', 80, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(128, 44, 2, 21, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(129, 44, 2, 18, '1.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(130, 44, 2, 20, '2.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(137, 46, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(138, 46, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(139, 46, 1, 29, '0.0000', '+', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(140, 46, 2, 21, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(141, 46, 2, 18, '1.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(142, 46, 2, 20, '2.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(143, 44, 2, 37, '0.0000', '+', 5, 0, 0, '+', 1, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(144, 46, 2, 37, '0.0000', '+', 5, 1, 0, '+', 1, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(160, 47, 14, 38, '5.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(161, 47, 14, 39, '10.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(162, 47, 14, 41, '15.0000', '+', 15, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(163, 47, 14, 43, '100.0000', '+', 100, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(164, 47, 14, 40, '25.0000', '+', 25, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(165, 47, 14, 42, '50.0000', '+', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(306, 48, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(307, 48, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(308, 48, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(309, 48, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(310, 48, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(311, 48, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(390, 50, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(391, 50, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(392, 50, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(393, 50, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(394, 50, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(395, 50, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(396, 53, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(397, 53, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(398, 53, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(399, 53, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(400, 53, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(401, 53, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(402, 49, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(403, 49, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(404, 49, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(405, 49, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(406, 49, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(407, 49, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(410, 54, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(411, 54, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(412, 54, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(413, 54, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(414, 54, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(415, 54, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(417, 46, 13, 34, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(418, 46, 13, 35, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(419, 46, 13, 36, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(420, 46, 13, 44, '0.0000', '+', 5, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(421, 43, 1, 45, '0.0000', '+', 5, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(422, 36, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(425, 55, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(426, 55, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(427, 55, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(428, 55, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(429, 55, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(430, 55, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(431, 56, 1, 31, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, 'attributes/color_silver.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(432, 56, 1, 15, '0.0000', '+', 50, 0, 0, '+', 0, 0, 1, 'attributes/color_blue.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(433, 56, 6, 23, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(434, 56, 6, 14, '19.9900', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(435, 56, 6, 22, '4.9900', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(436, 56, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 1, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(444, 59, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(445, 59, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(446, 59, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(447, 59, 1, 29, '519.0000', '', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(448, 59, 1, 30, '499.0000', '', 90, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(449, 59, 1, 15, '539.0000', '', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(450, 59, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(451, 60, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(452, 60, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(453, 60, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(454, 60, 1, 29, '10.0000', '+', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(455, 60, 1, 30, '0.0000', '', 90, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(456, 60, 1, 15, '20.0000', '+', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(457, 60, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(458, 61, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(459, 61, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(460, 61, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(461, 61, 1, 29, '10.0000', '+', 80, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(462, 61, 1, 30, '0.0000', '', 90, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(463, 61, 1, 15, '20.0000', '+', 50, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(464, 61, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(482, 74, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(483, 74, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(484, 74, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(485, 74, 1, 29, '519.0000', '', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(486, 74, 1, 30, '499.0000', '', 90, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(487, 74, 1, 15, '539.0000', '', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(488, 74, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(496, 46, 10, 0, '0.7500', '+', 0, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(497, 46, 9, 0, '0.5000', '+', 0, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(498, 46, 11, 0, '0.2500', '+', 0, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(499, 76, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(500, 76, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(501, 76, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(502, 76, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(503, 76, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(504, 76, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(505, 76, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(506, 76, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(507, 76, 13, 36, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(508, 78, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(509, 78, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(510, 78, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(511, 78, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(512, 78, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(513, 78, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(514, 78, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(515, 78, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(516, 78, 13, 36, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(517, 79, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(518, 79, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(519, 79, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(520, 79, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(521, 79, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(522, 79, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(523, 79, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(524, 79, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(525, 79, 13, 36, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(526, 80, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(527, 80, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(528, 80, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(529, 80, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(530, 80, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(531, 80, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(532, 80, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(533, 80, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(534, 80, 13, 36, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(562, 84, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(563, 84, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(564, 84, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(565, 84, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(566, 84, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(567, 84, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(568, 84, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(569, 84, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(570, 84, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(571, 85, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(572, 85, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(573, 85, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(574, 85, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(575, 85, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(576, 85, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(577, 85, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(578, 85, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(579, 85, 13, 36, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(661, 84, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(662, 84, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(663, 84, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(668, 84, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(669, 84, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(671, 84, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(672, 84, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(673, 82, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(674, 82, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(675, 82, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(676, 82, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(677, 82, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(678, 82, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(679, 82, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(680, 82, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(681, 82, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(682, 82, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(683, 82, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(684, 82, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(685, 82, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(686, 82, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(687, 82, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(688, 82, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(689, 83, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(690, 83, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(691, 83, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(692, 83, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(693, 83, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(694, 83, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(695, 83, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(696, 83, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(697, 83, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(698, 83, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(699, 83, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(700, 83, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(701, 83, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(702, 83, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(703, 83, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(704, 83, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(705, 93, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(706, 93, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(707, 93, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(708, 93, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(709, 93, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(710, 93, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(711, 93, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(712, 93, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(713, 93, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(714, 93, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(715, 93, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(716, 93, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(717, 93, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(718, 93, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(719, 93, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(720, 93, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(721, 94, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(722, 94, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(723, 94, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(724, 94, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(725, 94, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(726, 94, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(727, 94, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(728, 94, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(729, 94, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(730, 94, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(731, 94, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(732, 94, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(733, 94, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(734, 94, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(735, 94, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(736, 94, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(801, 90, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(802, 90, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(803, 90, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(804, 90, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(805, 90, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(806, 90, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(807, 90, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(808, 90, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(809, 90, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(810, 90, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(811, 90, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(812, 90, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(813, 90, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(814, 90, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(815, 90, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(816, 90, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(817, 92, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(818, 92, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(819, 92, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(820, 92, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(821, 92, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(822, 92, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(823, 92, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(824, 92, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(825, 92, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(826, 92, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(827, 92, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(828, 92, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(829, 92, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(830, 92, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(831, 92, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(832, 92, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(865, 88, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(866, 88, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(867, 88, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(868, 88, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0);
INSERT INTO `zen_products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`, `products_options_sort_order`, `product_attribute_is_free`, `products_attributes_weight`, `products_attributes_weight_prefix`, `attributes_display_only`, `attributes_default`, `attributes_discounted`, `attributes_image`, `attributes_price_base_included`, `attributes_price_onetime`, `attributes_price_factor`, `attributes_price_factor_offset`, `attributes_price_factor_onetime`, `attributes_price_factor_onetime_offset`, `attributes_qty_prices`, `attributes_qty_prices_onetime`, `attributes_price_words`, `attributes_price_words_free`, `attributes_price_letters`, `attributes_price_letters_free`, `attributes_required`) VALUES
(869, 88, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(870, 88, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(871, 88, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(872, 88, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(873, 88, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(874, 88, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(875, 88, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(876, 88, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(877, 88, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(878, 88, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(879, 88, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(880, 88, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(881, 89, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(882, 89, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(883, 89, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(884, 89, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(885, 89, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(886, 89, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(887, 89, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(888, 89, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(889, 89, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(890, 89, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(891, 89, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(892, 89, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(893, 89, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(894, 89, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(895, 89, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(896, 89, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(897, 95, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(898, 95, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(899, 95, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(900, 95, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(901, 95, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(902, 95, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(903, 95, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(904, 95, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(905, 95, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(906, 95, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(907, 95, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(908, 95, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(909, 95, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(910, 95, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(911, 95, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(912, 95, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(913, 96, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(914, 96, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(915, 96, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(916, 96, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(917, 96, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(918, 96, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(919, 96, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(920, 96, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(921, 96, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(922, 96, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(923, 96, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(924, 96, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(925, 96, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(926, 96, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(927, 96, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(928, 96, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(929, 97, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(930, 97, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(931, 97, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(932, 97, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(933, 97, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(934, 97, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(935, 97, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(936, 97, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(937, 97, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(938, 97, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(939, 97, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(940, 97, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(941, 97, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(942, 97, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(943, 97, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(944, 97, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(945, 98, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(946, 98, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(947, 98, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(948, 98, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(949, 98, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(950, 98, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(951, 98, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(952, 98, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(953, 98, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(954, 98, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(955, 98, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(956, 98, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(957, 98, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(958, 98, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(959, 98, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(960, 98, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(962, 100, 4, 3, '100.0000', '+', 30, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(963, 100, 4, 2, '75.0000', '+', 20, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(964, 100, 4, 1, '50.0000', '+', 10, 0, 1, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(965, 100, 1, 29, '519.0000', '', 80, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(966, 100, 1, 30, '499.0000', '', 90, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(967, 100, 1, 15, '539.0000', '', 50, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(968, 100, 4, 46, '0.0000', '+', 5, 0, 0, '+', 0, 1, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(969, 101, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(970, 101, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(971, 101, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(972, 101, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(973, 101, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(974, 101, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(975, 101, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(976, 101, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(977, 101, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(978, 101, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(979, 101, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(980, 101, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(981, 101, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(982, 101, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(983, 101, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(984, 101, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(987, 109, 5, 10, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(988, 109, 5, 52, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(990, 110, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(991, 110, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(992, 110, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(993, 110, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(994, 110, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(995, 110, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(996, 110, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(997, 110, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(998, 110, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(999, 110, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1000, 110, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1001, 110, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1002, 110, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1003, 110, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1004, 110, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1005, 110, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1006, 111, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 0, 1, 'attributes/color_red.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1007, 111, 1, 25, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, 'attributes/color_orange.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1008, 111, 1, 17, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, 'attributes/color_yellow.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1009, 111, 2, 21, '50.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1010, 111, 2, 20, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1011, 111, 2, 18, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1012, 111, 13, 35, '75.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1013, 111, 13, 34, '100.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1014, 111, 13, 36, '40.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1015, 111, 1, 26, '40.0000', '+', 40, 0, 0, '+', 0, 0, 1, 'attributes/color_green.gif', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1016, 111, 2, 19, '40.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1017, 111, 13, 47, '50.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1018, 111, 13, 48, '0.0000', '+', 5, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1019, 111, 15, 49, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1020, 111, 15, 50, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1021, 111, 15, 51, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', 0, '0.0000', 0, 0),
(1025, 131, 10, 0, '0.0000', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', 0, '0.0000', 0, 1),
(1027, 131, 1, 16, '5.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1028, 131, 1, 26, '5.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1029, 131, 1, 17, '5.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1030, 131, 9, 0, '0.0000', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', 3, '0.0000', 0, 1),
(1031, 132, 16, 53, '14.4500', '+', 30, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1032, 132, 16, 54, '14.4500', '+', 40, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1033, 132, 16, 55, '14.4500', '+', 50, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1034, 132, 16, 56, '14.4500', '+', 60, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1035, 132, 16, 57, '14.4500', '+', 90, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1036, 132, 16, 58, '14.4500', '+', 200, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1037, 132, 16, 61, '14.4500', '+', 20, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1038, 132, 16, 59, '14.4500', '+', 70, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1039, 132, 16, 60, '14.4500', '+', 80, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1040, 133, 5, 10, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1041, 133, 17, 62, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1042, 133, 17, 63, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1043, 133, 5, 64, '0.0000', '+', 100, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1044, 133, 5, 52, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1045, 134, 10, 0, '0.0000', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0200', 0, 1),
(1046, 134, 1, 16, '5.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1047, 134, 1, 26, '5.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1048, 134, 1, 17, '5.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 1),
(1049, 134, 9, 0, '0.0000', '+', 0, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0200', 3, 1),
(1050, 154, 18, 65, '0.0000', '+', 10, 0, 0.25, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1051, 154, 18, 66, '1.5000', '+', 20, 0, 0.75, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1052, 155, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '1.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1053, 155, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '2.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1054, 155, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '3.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1055, 156, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1056, 156, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1057, 156, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1058, 157, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1059, 157, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1060, 157, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1061, 158, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '5.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1062, 158, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1063, 158, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '15.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1064, 159, 1, 16, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1:11,3:10.00,6:9.00,9:8.00,12:7.00,15:6.00', '', '0.0000', 0, '0.0000', 0, 0),
(1065, 159, 1, 26, '0.0000', '+', 40, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:11.00,6:10.00,9:9.00,12:8.00,15:7.00', '', '0.0000', 0, '0.0000', 0, 0),
(1066, 159, 1, 17, '0.0000', '+', 30, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:10.50,6:9.50,9:8.50,12:7.50,15:6.50', '', '0.0000', 0, '0.0000', 0, 0),
(1069, 160, 16, 53, '14.4500', '+', 30, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1070, 160, 16, 54, '14.4500', '+', 40, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1071, 160, 16, 55, '14.4500', '+', 50, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1072, 160, 16, 56, '14.4500', '+', 60, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1073, 160, 16, 57, '14.4500', '+', 90, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1074, 160, 16, 58, '14.4500', '+', 200, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1075, 160, 16, 61, '14.4500', '+', 20, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1076, 160, 16, 59, '14.4500', '+', 70, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1077, 160, 16, 60, '14.4500', '+', 80, 0, 1, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1088, 171, 17, 63, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1089, 171, 17, 62, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1090, 165, 18, 65, '0.0000', '+', 10, 0, 0.25, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1091, 165, 18, 66, '1.5000', '+', 20, 0, 0.75, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1092, 172, 19, 67, '0.0000', '+', 10, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1093, 173, 5, 10, '20.0000', '', 10, 0, 0, '+', 0, 0, 0, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1094, 173, 5, 64, '20.0000', '', 100, 0, 0, '+', 0, 0, 0, '', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1095, 173, 5, 68, '52.5000', '', 5, 0, 1, '', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1096, 175, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1097, 175, 1, 26, '100.0000', '+', 40, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1098, 178, 1, 16, '100.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1099, 178, 1, 26, '100.0000', '+', 40, 0, 0, '+', 0, 0, 0, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1100, 179, 17, 63, '0.0000', '+', 20, 0, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1103, 179, 17, 62, '0.0000', '+', 10, 0, 0, '+', 0, 1, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_attributes_download`
--

CREATE TABLE IF NOT EXISTS `zen_products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_products_attributes_download`
--

INSERT INTO `zen_products_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES
(26, 'unreal.zip', 7, 3),
(1040, 'test.zip', 7, 5),
(1041, 'test2.zip', 7, 5),
(1042, 'test2.zip', 7, 5),
(1043, 'test.zip', 7, 5),
(1044, 'test.zip', 7, 5),
(1088, 'ms_word_sample.zip', 7, 5),
(1089, 'pdf_sample.zip', 7, 5),
(1093, 'test.zip', 7, 5),
(1094, 'test2.zip', 7, 5),
(1100, 'ms_word_sample.zip', 7, 5),
(1103, 'pdf_sample.zip', 7, 5);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_description`
--

CREATE TABLE IF NOT EXISTS `zen_products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- 转存表中的数据 `zen_products_description`
--

INSERT INTO `zen_products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 2, 'Matrox G200 MMS', 'Matrox 的芯片技术在新的 Tech Source GFX 200 系列发挥功能，采用首创以一张 PCI 图形卡支持基于Sun Microsystems Solaris平台，支持多达四个 DVI 数字液晶显示屏。GFX 200 系列，有 16 MB（支持两个显示屏）或 32 MB（支持四个显示屏）SGRAM 可选择。以 Matrox G200 多屏幕显示系列的技术为基础，此技术也广受金融界认可，并支持金融界权威公司如 Barclays、富达投资和路透社等。', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0),
(2, 2, 'Matrox G400 32MB', 'G400显卡绝对是显卡历史上永恒的经典产品，其优良的2D画质在如今都是出类拔萃的！也正因为如此，它也成为许多2D作图用户的首选显卡。在很多二手产品论坛上，G400都是炙手可热的东西。G400采用SGRAM显存，容量为16M或32M，AGP-4X接口，对2D画质要求很高或对Matrox显卡情有独衷的朋友可以关注一下。', 'www.matrox.com/mga/products/mill_g400/home.htm', 0),
(3, 2, '人体工程学鼠标', '人体工程学鼠标又分标准外壳和半透明外壳两种，这些鼠标功能相同，不过手感不同，人体工程学鼠标比较顺手。不加载专用的驱动程序也可以使用滚轮功能。专用的驱动程序可以通过网络获得目前的最新版本。', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0),
(4, 2, '替身杀手', '地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1<br />图像格式: 16:9 宽屏<br />长度: (约) 80 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.replacement-killers.com', 0),
(5, 2, '银翼杀手 - 导演剪辑版 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏<br />长度: (约) 112 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.bladerunner.com', 0),
(6, 2, '黑客帝国 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语.\r\n<br />\r\n音频: 杜比环绕\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 131 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕', 'www.thematrix.com', 1),
(7, 2, '电子情书 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语, 西班牙语. <br />子标题: 英语, 德语, 西班牙语, 法语, 北欧, 波兰. <br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏 <br />长度: (约) 115 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.youvegotmail.com', 0),
(8, 2, '虫虫危机 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比数码 5.1 / 杜比环绕立体声。<br />图像格式: 16:9 宽屏 <br />长度: (约) 91 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.abugslife.com', 1),
(9, 2, '潜龙轰天 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1. <br />图像格式: 16:9 宽屏 <br />长度: (约) 98 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(10, 2, '潜龙轰天2 - 暴走潜龙', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 98 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(11, 2, '枪口朝下 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 1),
(12, 2, '虎胆龙威 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1。 <br />图像格式: 16:9 宽屏 <br />长度: (约) 122 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(13, 2, '致命武器 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(14, 2, '红色角落 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 117 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(15, 2, '惊狂记 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 115 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(16, 2, '生死豪情 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(17, 2, '生死时速 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(18, 2, '生死时速2: 海上惊情', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 120 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(19, 2, '我为玛丽狂 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 114 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(20, 2, '真爱 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 164 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', 0),
(21, 2, '洛城特警3: 精英编辑版 链接', 'Windows 95/98<br /><br />公元2005年，洛杉矶。洛城警局SWAT特勤小组受命保护参加签订废除核武条约的各国领袖，并瓦解恐怖份子的破坏计划。<br /><br />在这个版本中，除了原先的游戏主程序外，还包含了六个新的单人任务，以及原先缺乏的多人联机模式，再加上一堆新增功能及对象，让玩家自由设定进行任务的环境。而如果你已经厌倦了每次都扮演维持秩序的警察，这次可以来点不一样的，在精英版中，玩家除了可以担任特勤小组的警官外，还可以扮演专伺破坏的恐怖份子。', 'www.swat3.com', 4),
(22, 2, '虚幻竞技场 链接', '《虚幻竞技场》加入了许多单人游戏要素，证明开发小组也开始重视游戏的单人部分就像游戏一直注重的联机部分一样。就像Rein与游戏的制作小组成员Jeff Morris说的那样，虽然游戏的剧情方面虽然不会像《战争机器》那样引人入胜，但是可以让玩家了解整个故事的背景。整个虚幻竞技场的故事建立于未来的Super Bowl。统治企业为了平息手下员工的不满情绪，建立了一个格斗竞技场为员工提供消遣。而玩家则扮演一位年轻小伙子，为了向杀害他全家的公司报仇而义无反顾的进入了竞技场。', 'www.unrealtournament.net', 2),
(23, 2, '时空之轮 链接', '《时空之轮》是用《Unreal》的游戏引擎制作，亦即是说该游戏是一支第一身射击游戏。至于游戏的背景，则是著名作家RobertJordan笔下的神话世界。在Jordan笔下的世界中，人类因一时大意而放走了为祸世上的魔王DarkOne，而更惨的是，用以镇压DarkOne的封印亦在动乱中失去了。在数千年后，失落的封印重新被四股敌对的势力发现，遂展开了封印的争夺战。<br /><br />游戏内的法术共计四十种，可大约分为攻击、防守、移动和恢复能源多种，较诸一般射击游戏只靠枪炮去砍杀多姿多采得多了，而且开发小组亦体会到其他游戏的法术系统做得不平衡，形成「只靠一种法术便能过版」的情况，故在设计时亦着重法术间的平衡。举个例来说，一些法术准确度虽高，但其准备时间却要长得多，所以这些法术只可对付一些HP值低的敌人，务求一击便可将之打败。但趟若敌人的HP值高，用同一种法术时便会被人在攻击空档时反击，造成损伤。', 'www.wheeloftime.com', 0),
(24, 2, '圣战群英传: 神圣国度 链接', '游戏的概念与《英雄无敌III》非常相似。开始时玩家拥有自己的城堡和一些资源，当然还有英雄。你的任务就是派遣英雄在地图上清除异己，并且占领各种矿藏，象是水晶、黄金等等。然后用资源建立起来强大的军队与敌人作战从而获得胜利。游戏的进行方式是很传统的那种回合制，就是玩家走一步，对手走一步的那种。凡是玩过《英雄无敌III》的玩家玩起《神圣国度》应该非常容易上手，很快就可以进入角色，但在其中你又必定能够享受到许多全新的乐趣。', '', 0),
(25, 2, '微软键盘', '特别设计10个快捷功能键，拥有多个可自定义的热键', '', 0),
(26, 2, '微软鼠标', '人体工程学：支持 即插即用：支持 适用操作系统：与PC和Mac操作系统兼容 其它特性：Microsoft 光学感应技术', 'www.microsoft.com/hardware/mouse/explorer.asp', 2),
(27, 2, '惠普激打1100Xi 链接', '惠普打印机在激打领域是典范。新的惠普激打1100Xi每分钟打印8页，分辨率600dpi，支持Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2及DOS。通过外接打印服务器支持网络打印。', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 1),
(28, 2, '礼券5元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', 0),
(29, 2, '礼券10元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', 0),
(30, 2, '礼券25元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', 0),
(31, 2, '礼券50元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', 0),
(32, 2, '礼券100元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', 0),
(34, 2, '虫虫危机 多款2003特别收藏版', '虫虫危机 多款2003特别收藏版\r\n<br />\r\n地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比数码5.1 / 杜比环绕立体声.\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 91 分钟.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, 子标题 (多种语言).', 'www.abugslife.com', 0),
(36, 2, '惠普 - 属性促销', '本商品价格为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(39, 2, '免费商品', '免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品显示原价、特价，最后是免费。\r\n<br /><br />\r\n\r\n这是免费商品，但是需要运费。', '', 1),
(40, 2, '价格面议商品', '价格面议商品，同时有特价。\r\n<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />', '', 2),
(41, 2, '价格面议 促销', '价格面议商品，有特价、有促销。\r\n<br /><br />\r\n\r\n显示原价、特价及价格面议。不能购买本商品。\r\n<br /><br />\r\n\r\n购买商品按钮自动改为价格面议，定义为: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\n这个链接将转到联系我们页面。\r\n<br /><br />', '', 0),
(42, 2, '免费商品 + 促销', '免费商品，同时有特价。\r\n<br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br />', '', 0),
(43, 2, '带属性的免费商品', '免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br /><br />\r\n\r属性可以设置为免费或不免费\r\n<br /><br />\r\n\r\n红色属性定价为5元，但设置为商品免费时属性也免费\r\n<br /><br />\r\n\r\n尺寸中号定价为1元，但设置为商品免费时属性也免费', '', 0),
(44, 2, '带属性的不可混合商品', '本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为否，也就是说不可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。', '', 0),
(46, 2, '带属性的可混合商品', '本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为是，也就是说可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。', '', 0),
(47, 2, '按属性定价的礼券', '按属性定价的礼券。', '', 0),
(48, 2, '测试一', '复制和删除属性的测试商品。\r\n<br /><br />\r\n本商品的所有图片位于/images及/images/large 目录。\r\n<br /><br />\r\n主图片为1_small.jpg\r\n<br /><br />\r\n/images 中的附加图片也会自动显示:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\n大图位于/images/large:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\n附加图片的命名不一定要数字，用数字只是为了能按顺序显示这些图片。\r\n<br /><br />\r\n\r\n重要的是附加图片必须位于同一个目录，并且文件名的开头相同: 1_small，而且文件后缀一致: .jpg\r\n<br /><br />\r\n\r\n附加的大图片必须位于/large目录，并采用相同的名称和大图片后缀，在管理页面－商店设置－图象参数中设置，目前设置为 _LRG\r\n<br /><br />', '', 0),
(49, 2, '测试二', '复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试一 复制商品属性到 测试二。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n采用相同的命名: 2_small 、大图片后缀 _LRG 以及相同的后缀 .jpg 生成新的名字: /images/large/2_small_LRG.jpg\r\n<br /><br />', '', 0),
(50, 2, '测试三', '复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试二 复制商品属性到 测试三。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n点击放大时，除非原图比小图片大，否则弹出窗口中的图片是一样的。\r\n<br /><br />', '', 0),
(51, 2, '全免商品 重量10', '免费商品\r\n<br /><br />\r\n\r商品价格为25元 ... 免费是因为本商品设置中:\r\n<br />\r\n免费商品: 是\r\n<br /><br />\r\n\r\n这样商品有显示价格，但实际价格为0\r\n<br /><br />\r\n\r\n重量设置为10，也可以设置为0。免运费是因为设置了免运费为是\r\n<br /><br />\r\n\r\n免运费设置为: 是<br />\r\n不需要运费，但是需要送货地址。\r\n<br /><br />\r\n\r\n因为价格为0且免运费，Zen Cart将显示免费模块而不显示其它支付模块。\r\n<br /><br />\r\n\r\n可以自己修改Zen Cart免费模块的文字。\r\n<br /><br />\r\n\r\n说明: 如果添加了其它收费商品或需要运费，Zen Cart免费模块将不显示，而显示通用的支付模块。', '', 0),
(52, 2, '全免商品 虚拟商品', '商品价格为0\r\n<br /><br />\r\n\r\n重量设置为2 ...\r\n<br /><br />\r\n\r\n虚拟商品设置为是 ... 将不用输入配送地址\r\n<br /><br />', '', 0),
(53, 2, '最少数量及属性混合', '本商品设置最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很"聪明"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是', '', 0),
(54, 2, '最少购买和数量单位 非混合', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很"聪明"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否', '', 0),
(55, 2, '最少购买和数量单位 混合 - 促销', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很"聪明"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是\r\n<br /><br />\r\n\r\n本商品有促销', '', 0),
(56, 2, '最少购买和数量单位 非混合 - 促销', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很"聪明"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否\r\n<br /><br />\r\n\r\n本商品有促销', '', 0),
(57, 2, '免费商品 - 所有', '免费商品，没有价格。\r\n<br /><br />\r\n\r\n免运费也打开。\r\n<br /><br />\r\n\r\n如果单独购买，Zen Cart免运费支付模块会显示是否免运费。\r\n<br /><br />\r\n\r\n如果购买了其它有价商品或有运费，那么Zen Cart不会显示免运费支付模块，需要支付相应运费。', '', 0),
(59, 2, '惠普 - 属性定价', '本商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(60, 2, '惠普 - 促销包括属性', '本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性也设置为优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(61, 2, '惠普 - 促销不包括属性', '本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性设置为没有优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(74, 2, '惠普 - 属性定价 特价 无促销', '本商品价格设置为0 特价设置为20%\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色 499.99元<br />\r\n黑色 519元<br />\r\n蓝色 539元\r\n<br /><br />\r\n\r\n特价为100元优惠。这100元优惠应用于所有设置为优惠的属性。', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(76, 2, '测试 25%特价 10%促销', '原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />', '', 0),
(78, 2, '测试 25%特价 10%促销 属性定价', '属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />', '', 0),
(79, 2, '测试 25%特价 属性定价', '属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />', '', 0),
(80, 2, '测试 25%特价', '原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />', '', 0),
(82, 2, '测试120元 促销-5元', '原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(83, 2, '测试120元 特价90元 促销-5元', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25%\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(84, 2, '测试120元', '原价120元\r\n<br /><br />\r\n\r\n无特价，无促销。\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元<br />\r\n- 绿色40元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n特小号40元<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 无<br /> \r\n- 礼物盒40元<br />\r\n- 收藏盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n特色: <br />\r\n设计精美<br />\r\n客户定制<br />\r\n当日发货<br />\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />\r\n\r\n说明: 无类似仅显示，但能用在非必选项中。\r\n<br /><br />\r\n\r\n价格设置为0，未选择仅显示。\r\n<br /><br />\r\n\r\n因为价格为0，如果用在属性基价给商品定价，本选项的值为0\r\n<br /><br />\r\n\r\n说明: 选项名: 特色 是只读选项\r\n<br /><br />\r\n用于显示商品信息，但不显示在购物车或订单中，不能用于计算属性基价。\r\n<br /><br />', '', 0),
(85, 2, '测试120元 特价90元', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25% 无促销。\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 1),
(88, 2, '测试120元 促销 特价90元 无条件', '商品价格120元\r\n<br /><br />\r\n特价105元\r\n<br /><br />\r\n促销价90元或25% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(89, 2, '测试120元 促销10% 无特价 无条件', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n促销10% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(90, 2, '测试120元 促销10% 有特价', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n促销 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(92, 2, '测试120元 促销10% 无特价', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(93, 2, '测试120元 无特价 促销价100元', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(94, 2, '测试120元 特价25% 促销价100元', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(95, 2, '测试120元 特价25% 促销价100元 不含特价', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(96, 2, '测试120元 无特价 促销价100元 不含特价', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(97, 2, '测试120元 促销10% 有特价 - 原价基础上', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 1),
(98, 2, '测试120元 促销10% 无特价 - 原价基础上', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100号\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(99, 2, '有重量免运费商品', '本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为5\r\n<br /><br />\r\n\r\n重量设置为5，但是免运费设置为是，免运费模块已安装。\r\n<br /><br />', '', 0),
(100, 2, '惠普- 属性允许优惠 有特价', '商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0),
(101, 2, '测试120元 促销10% 无特价', '商品根据属性定价。\r\n<br /><br />\r\n\r\n属性选项: 颜色和尺寸包含在基价计算中\r\n<br /><br />\r\n\r\n礼物选项也包含在基价计算中，但因为 无 设置为0，这个选项的最低价格为0，所以不影响基价。\r\n<br /><br />\r\n\r\n如果 无 不是一个选项而你不想包含这些价格，可以设置所有的礼物选项属性不包含在基价计算中。\r\n<br /><br />\r\n\r\n商品价格为0\r\n<br /><br />\r\n\r\n无特价\r\n<br /><br />\r\n促销10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(104, 2, '隐藏数量方框', '本商品在添加到购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n点击添加到购物车时，将增加一件本商品到购物车中。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n因为图象名为: 1_small.jpg<br />\r\n且保存在/images 目录 ...\r\n<br /><br />\r\n\r\n将自动显示其它匹配的图片:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\n也将显示匹配的位于 /images/large 目录的大图片:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\n附加图片的文件名开头必须和商品图片的名称一致，后缀也必须一致。\r\n<br /><br />\r\n\r\n这些图片会自动显示。\r\n<br /><br />', '', 0),
(105, 2, '最多一件', '本商品只允许购买1件，因为商品最大购买数量设置为1。\r\n<br /><br />\r\n\r\n表明将不显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过1件本商品到购物车\r\n<br /><br />', '', 0),
(106, 2, '最多三件', '本商品只允许购买3件，因为商品最大购买数量设置为3。\r\n<br /><br />\r\n\r\n表明将显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过3件本商品到购物车\r\n<br /><br />', '', 0),
(107, 2, '无重量免运费商品', '本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为0\r\n<br /><br />\r\n\r\n免运费设置为否，免运费模块已安装，仍然为免运费。\r\n<br /><br />\r\n\r\n在商店设置－配送参数 ... 零重量商品免运费设置为是。\r\n<br /><br />\r\n\r\n说明: 如果修改该设置，那么即使商品重量为零，也不会免运费。\r\n<br /><br />', '', 0),
(108, 2, '缺货商品', '本商品缺货，因为商品数量 <= 0\r\n<br /><br />\r\n\r\n商店设置－库存选项中，缺货商品的状态为打开，允许结帐设置为否，添加商品按钮变成商品缺货图标。\r\n<br /><br />\r\n\r\n如果修改商店设置－库存选项，可以设置为即使缺货，也能购买。\r\n<br /><br />', '', 0),
(109, 2, '隐藏数量方框的方法', '本商品加入购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n当显示数量方框设置为是时，商品的最大购买数量被设置为1。\r\n\r\n点击添加到购物车按钮时，只会添加一件商品。\r\n<br /><br />\r\n\r\n因为这是下载类商品，下载类商品不需要购买多件。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n有两种方法用于隐藏数量方框。\r\n<br /><br />\r\n\r\n方法一: 设置显示数量方框为否\r\n<br /><br />\r\n\r\n方法二: 设置最大购买数量为1\r\n<br /><br />\r\n\r\n两种方式都只能购买一件本商品，同时不显示数量方框。\r\n<br /><br />', '', 0),
(110, 2, '测试120元 促销-5元 忽略特价', '原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n忽略特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(111, 2, '测试120元 特价90元 促销-5元 忽略特价', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25% - 忽略特价\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', 0),
(112, 2, '测试二', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(113, 2, '测试四', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(114, 2, '测试五', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(115, 2, '测试一', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(116, 2, '测试八', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(117, 2, '测试三', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 1),
(118, 2, '测试十', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0);
INSERT INTO `zen_products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(119, 2, '测试六', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(120, 2, '测试七', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(121, 2, '测试十二', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(122, 2, '测试九', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(123, 2, '测试十一', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', 0),
(127, 2, '普通商品', '<p>这是普通商品15元</p><p>设置了数量优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>', '', 0),
(130, 2, '特价商品', '<p>特价商品，原价15元，特价10元</p><p>批量优惠已设置，将在特价基础上优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>', '', 0),
(131, 2, '按词收费 - 必填', '<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元，前3个词免费</p><p>颜色为单选，缺省为红色。</p>', '', 0),
(132, 2, '高尔夫球杆', '<p>商品价格设置为0，商品重量设置为1</p><p>同时设置了属性定价</p><p>由属性定价，每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>', '', 0),
(133, 2, '多个下载', '<p>本商品设置为包含多个下载。</p><p>本商品价格49.99元</p><p>属性设置为两个选项名称，每个下载一个，可以同时下载两个文件。</p><p>第一个下载是:</p><p>选项名: 版本<br />选项值: 下载Windows - 英语<br />选项值: 下载Windows - 西班牙语<br />选项值: 下载MAC - 英语<br /></p><p>第二个下载是:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word- 英语</p>', '', 0),
(134, 2, '按字收费 - 必填', '<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元，前3个字免费</p><p>颜色为单选，缺省为红色。</p>', '', 0),
(154, 2, '绳子', '<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>', '', 0),
(155, 2, '价格因素', '<p>本商品价格为10元</p><p>属性中设置了价格因素</p><p>红色10元<br />黄色20元<br />绿色30元</p><p>因此，最终价格为 商品价格 + 价格因素 * 商品价格</p>', '', 0),
(156, 2, '价格因素调整', '<p>本商品价格为10元</p><p>属性中设置了价格因素和价格因素调整</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>', '', 0),
(157, 2, '属性的价格因素调整', '<p>本商品价格为10元</p><p>商品根据属性定价。</p><p>属性由价格因素、价格因素调整定价。</p><p>商品价格仅用于计算价格因素。</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>', '', 0),
(158, 2, '基本费', '<p>本商品设置为颜色加45元。</p><p>红色另加5元<br />黄色另加10元<br />绿色另加15元</p>', '', 0),
(159, 2, '属性批量优惠', '<p>属性批量优惠是根据购买的商品数量设置不同的优惠。</p><p>演示设置: </p><p>红色:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>黄色<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>绿色:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>优惠金额、批量的数量将以表格形式显示。</p>', '', 0),
(160, 2, '高尔夫球杆', '<p>商品价格设置为0，重量为1</p><p>同时设置了属性定价</p><p>每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>', '', 0),
(165, 2, '绳子', '<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>', '', 0),
(166, 2, 'Russ Tippins Band - The Hunter', '', '', 1),
(167, 2, '测试文档', '这是测试文档', '', 0),
(168, 2, '商品样品 普通类型', '普通商品类型用于普通商品。\r\n\r\n不需要特别修改。', '', 0),
(169, 2, '商品样品 音乐类型', '音乐类型用于音乐类商品。\r\n\r\n比普通商品更灵活。', '', 0),
(170, 2, '文档样品 普通类型', '文档普通类型用于文档类商品。\r\n\r\n不能购买，可以显示在文档边框中。如果需要显示文档边框，可以在 工具－外观控制 中打开。', '', 0),
(171, 2, '文档样品 商品类型', '文档商品类型用于可出售类文档。<br /><br />可以显示部分文档内容并出售。<br /><br />本商品类型也可以用于下载类文档。<br /><br />文档商品类型可以用在文档边框或商品分类边框，取决于主分类id的设置。<br /><br />本商品也链接到文档分类目录下，这样可以同时显示在文档分类边框和商品分类边框。', '', 0),
(172, 2, '商品样品 免运费', '<p>商品可以设置为免运费<br /><br />将显示免运费图标。<br /><br />在语言文件中定义ALWAYS_FREE_SHIPPING_ICON。可以为文字、图片、文字/图片混合或者什么也不显示。<br /><br />设置免运费时，商品重量多少都没关系。<br /><br />确认免运费配送模块打开! 否则，如果只有免运费商品，将无法结帐。<br /><br />注意本商品重量5克。由于设置为免运费，所以运费为零。<br /><br />不必使用免运费商品类型，只要设置商品为免运费。如果你想特别设置免运费类商品的显示页面，才需要使用免运费商品类型。<br /><br />包括一个只读选项: 运费，选项值: 免运费。只读选项不在订单中显示。</p>', '', 0),
(173, 2, '书', '本书可以邮寄或下载。<br /><br />\r\n\r\n邮寄有特价，下载无特价。<br /><br />\r\n\r\n在分类/商品中设置为:<br /><br />\r\n\r\n商品由属性定价: 是<br />\r\n商品价格: 0元<br />\r\n重量: 0<br /><br />\r\n\r\n选项名: 版本 (下拉菜单)<br /><br />\r\n选项值: 硬壳封面<br /><br />\r\n下载: MAC 英语<br /><br />\r\n下载: Windows 英语<br /><br />\r\n\r\n属性设置为:<br />\r\n选项名: 版本<br />\r\n选项值: 硬壳封面<br />\r\n价格前缀为空<br />\r\n价格: 52.50元<br />\r\n重量前缀为空<br />\r\n重量: 1<br />\r\n由属性定价时包含在基价中: 是<br />\r\n应用优惠于特价/促销: 是<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: MAC 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0\r\n由属性定价时不包含在基价中<br />\r\n由属性定价时不包含在基价中: 否<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: Windows: 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0<br />\r\n由属性定价时包含在基价中: 否<br />\r\n应用优惠于特价/促销: 否<br /><br />\r\n\r\n特价47.50元<br /><br />', '', 0),
(174, 2, '价格面议 无价格', '价格面议商品，无价格<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />', '', 1),
(175, 2, '递增批量优惠', '<p>这是普通商品，价格60元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>', '', 0),
(176, 2, '普通商品12件', '<p>这是普通商品，价格100元</p><p>批量优惠基于原价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>', '', 0),
(177, 2, '特价商品12件', '<p>这是特价商品，原价100元，特价75元</p><p>批量优惠基于特价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>', '', 0),
(178, 2, '递增批量优惠 有特价', '<p>这是普通商品，价格60元，特价50元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>', '', 0),
(179, 2, '单个下载', '<p>本商品设置为单个下载。</p><p>商品价格39.99元</p><p>属性含1个选项名，允许多种类型的下载。</p><p>下载为:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word - 英语</p>', '', 13);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_discount_quantity`
--

CREATE TABLE IF NOT EXISTS `zen_products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_products_discount_quantity`
--

INSERT INTO `zen_products_discount_quantity` (`discount_id`, `products_id`, `discount_qty`, `discount_price`) VALUES
(4, 127, 12, '10.0000'),
(3, 127, 9, '8.0000'),
(2, 127, 6, '7.0000'),
(1, 8, 3, '10.0000'),
(1, 127, 3, '5.0000'),
(4, 130, 12, '10.0000'),
(3, 130, 9, '8.0000'),
(2, 130, 6, '7.0000'),
(1, 130, 3, '5.0000'),
(9, 175, 9, '10.0000'),
(8, 175, 8, '9.0000'),
(7, 175, 7, '8.0000'),
(6, 175, 6, '7.0000'),
(5, 175, 5, '6.0000'),
(4, 175, 4, '5.0000'),
(3, 175, 3, '4.0000'),
(2, 175, 2, '3.0000'),
(1, 175, 10, '11.0000'),
(3, 178, 3, '4.0000'),
(2, 178, 2, '3.0000'),
(1, 178, 10, '11.0000'),
(6, 177, 36, '30.0000'),
(5, 176, 48, '30.0000'),
(4, 176, 36, '20.0000'),
(3, 176, 24, '10.0000'),
(2, 176, 12, '5.0000'),
(1, 176, 60, '40.0000'),
(5, 177, 24, '20.0000'),
(4, 177, 12, '10.0000'),
(3, 177, 6, '5.0000'),
(2, 177, 60, '50.0000'),
(1, 177, 48, '40.0000'),
(4, 178, 4, '5.0000'),
(5, 178, 5, '6.0000'),
(6, 178, 6, '7.0000'),
(7, 178, 7, '8.0000'),
(8, 178, 8, '9.0000'),
(9, 178, 9, '10.0000');

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_notifications`
--

CREATE TABLE IF NOT EXISTS `zen_products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_options`
--

CREATE TABLE IF NOT EXISTS `zen_products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_products_options`
--

INSERT INTO `zen_products_options` (`products_options_id`, `language_id`, `products_options_name`, `products_options_sort_order`, `products_options_type`, `products_options_length`, `products_options_comment`, `products_options_size`, `products_options_images_per_row`, `products_options_images_style`, `products_options_rows`) VALUES
(1, 2, '颜色', 10, 2, 32, '', 32, 5, 0, 1),
(2, 2, '尺寸', 20, 0, 32, '', 32, 5, 0, 1),
(3, 2, '型号', 30, 0, 32, '', 32, 5, 0, 1),
(4, 2, '内存', 50, 0, 32, '', 32, 5, 0, 1),
(5, 2, '版本', 40, 0, 32, '', 32, 5, 0, 1),
(6, 2, '媒体', 60, 0, 32, '', 32, 5, 0, 1),
(7, 2, '背面图标', 310, 4, 32, '', 32, 5, 0, 1),
(8, 2, '正面图标', 300, 4, 32, '您可以上传自己的图像', 32, 5, 0, 1),
(9, 2, '第二行', 410, 1, 64, '', 40, 5, 0, 1),
(10, 2, '第一行', 400, 1, 64, '输入的文字最多64个字符、标点符号或空格', 40, 5, 0, 1),
(11, 2, '第三行', 420, 1, 64, '', 40, 5, 0, 1),
(12, 2, '第四行', 430, 1, 64, '', 40, 5, 0, 1),
(13, 2, '礼物', 70, 3, 32, '选项:', 32, 5, 0, 1),
(14, 2, '金额', 200, 2, 32, '', 32, 5, 0, 1),
(15, 2, '特色', 700, 5, 32, '&nbsp;', 32, 5, 0, 1),
(16, 2, '球杆', 800, 3, 32, '', 32, 5, 0, 1),
(17, 2, '资料', 45, 0, 32, NULL, 32, 5, 0, 1),
(18, 2, '长度', 70, 0, 32, '', 32, 5, 0, 1),
(19, 2, '交货', 600, 5, 32, '', 32, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_options_types`
--

CREATE TABLE IF NOT EXISTS `zen_products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

--
-- 转存表中的数据 `zen_products_options_types`
--

INSERT INTO `zen_products_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES
(0, '下拉'),
(1, '文本'),
(2, '单选'),
(3, '多选'),
(4, '文件'),
(5, '只读');

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_options_values`
--

CREATE TABLE IF NOT EXISTS `zen_products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_products_options_values`
--

INSERT INTO `zen_products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES
(0, 2, '文字', 0),
(1, 2, '4 mb', 10),
(2, 2, '8MB', 20),
(3, 2, '16MB', 30),
(4, 2, '32MB', 40),
(5, 2, '超值', 10),
(6, 2, '高级', 20),
(7, 2, '豪华', 30),
(8, 2, 'PS/2', 20),
(9, 2, 'USB', 10),
(10, 2, '下载: Windows - 英文', 10),
(13, 2, '盒装: Windows - 英文', 1000),
(14, 2, 'DVD/VHS', 30),
(15, 2, '蓝色', 50),
(16, 2, '红色', 10),
(17, 2, '黄色', 30),
(18, 2, '中号', 30),
(19, 2, '超小', 10),
(20, 2, '大号', 40),
(21, 2, '小号', 20),
(22, 2, 'VHS', 20),
(23, 2, 'DVD', 10),
(24, 2, '二十世纪', 10),
(25, 2, '橙色', 20),
(26, 2, '绿色', 40),
(27, 2, '紫色', 60),
(28, 2, '褐色', 70),
(29, 2, '黑色', 80),
(30, 2, '白色', 90),
(31, 2, '银色', 100),
(32, 2, '金色', 110),
(34, 2, '外包装', 40),
(35, 2, '签名卡', 30),
(36, 2, '礼品盒', 20),
(37, 2, '请选择 ...', 5),
(38, 2, '5元', 5),
(39, 2, '10元', 10),
(40, 2, '25元', 25),
(41, 2, '15元', 15),
(42, 2, '50元', 50),
(43, 2, '100元', 100),
(44, 2, '请选择 ...', 5),
(45, 2, '无', 5),
(46, 2, '无', 5),
(47, 2, '装饰盒', 10),
(48, 2, '无', 5),
(49, 2, '客户定制', 20),
(50, 2, '当日发货', 30),
(51, 2, '设计精美', 10),
(52, 2, '下载: Windows - 西班牙', 20),
(53, 2, '3杆', 30),
(54, 2, '4杆', 40),
(55, 2, '5杆', 50),
(56, 2, '6杆', 60),
(57, 2, '9杆', 90),
(58, 2, '挖起杆', 200),
(59, 2, '7杆', 70),
(60, 2, '8杆', 80),
(61, 2, '2杆', 20),
(62, 2, 'PDF - 英文', 10),
(63, 2, 'WORD - 英文', 20),
(64, 2, '下载: MAC - 英语', 100),
(65, 2, '每尺', 10),
(66, 2, '每码', 20),
(67, 2, '免运费!', 10),
(68, 2, '硬壳封面', 5);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_options_values_to_products_options`
--

CREATE TABLE IF NOT EXISTS `zen_products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `zen_products_options_values_to_products_options`
--

INSERT INTO `zen_products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13),
(14, 6, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 6, 22),
(23, 6, 23),
(24, 5, 24),
(35, 1, 25),
(36, 1, 26),
(37, 1, 27),
(38, 1, 28),
(39, 1, 29),
(40, 1, 30),
(41, 1, 31),
(42, 1, 32),
(53, 13, 34),
(54, 13, 35),
(55, 13, 36),
(56, 9, 0),
(57, 10, 0),
(58, 11, 0),
(59, 12, 0),
(60, 7, 0),
(61, 8, 0),
(62, 2, 37),
(63, 14, 38),
(64, 14, 39),
(65, 14, 40),
(66, 14, 41),
(67, 14, 42),
(68, 14, 43),
(69, 13, 44),
(70, 1, 45),
(71, 4, 46),
(72, 13, 47),
(73, 13, 48),
(74, 15, 49),
(75, 15, 50),
(76, 15, 51),
(77, 5, 52),
(78, 16, 53),
(79, 16, 54),
(80, 16, 55),
(81, 16, 56),
(82, 16, 57),
(83, 16, 58),
(84, 16, 59),
(85, 16, 60),
(86, 16, 61),
(87, 17, 62),
(88, 17, 63),
(89, 5, 64),
(90, 18, 65),
(91, 18, 66),
(92, 19, 67),
(93, 5, 68);

-- --------------------------------------------------------

--
-- 表的结构 `zen_products_to_categories`
--

CREATE TABLE IF NOT EXISTS `zen_products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_products_to_categories`
--

INSERT INTO `zen_products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 4),
(2, 4),
(3, 9),
(4, 10),
(5, 11),
(5, 22),
(6, 10),
(6, 22),
(7, 12),
(7, 22),
(8, 13),
(8, 22),
(9, 10),
(9, 22),
(10, 10),
(11, 10),
(11, 22),
(12, 10),
(12, 22),
(13, 10),
(13, 22),
(14, 15),
(14, 22),
(15, 14),
(15, 22),
(16, 15),
(16, 22),
(17, 10),
(17, 22),
(18, 10),
(19, 12),
(19, 22),
(20, 15),
(20, 22),
(21, 18),
(21, 22),
(22, 19),
(22, 22),
(23, 20),
(23, 22),
(24, 20),
(24, 22),
(25, 8),
(26, 9),
(27, 5),
(27, 22),
(28, 21),
(29, 21),
(30, 21),
(31, 21),
(32, 21),
(34, 22),
(36, 25),
(39, 24),
(40, 24),
(41, 28),
(42, 28),
(43, 24),
(44, 22),
(46, 22),
(47, 21),
(48, 23),
(49, 23),
(50, 23),
(51, 24),
(52, 24),
(53, 23),
(54, 23),
(55, 28),
(56, 28),
(57, 24),
(59, 23),
(60, 28),
(61, 28),
(74, 23),
(76, 28),
(78, 25),
(79, 23),
(80, 23),
(82, 27),
(83, 27),
(84, 23),
(85, 23),
(88, 31),
(89, 31),
(90, 45),
(92, 45),
(93, 46),
(94, 46),
(95, 51),
(96, 51),
(97, 32),
(98, 32),
(99, 23),
(100, 25),
(101, 47),
(104, 23),
(105, 22),
(106, 22),
(107, 23),
(108, 23),
(109, 23),
(110, 52),
(111, 52),
(112, 53),
(113, 53),
(114, 53),
(115, 53),
(116, 53),
(117, 53),
(118, 53),
(119, 53),
(120, 53),
(121, 53),
(122, 53),
(123, 53),
(127, 55),
(130, 55),
(131, 57),
(132, 58),
(133, 60),
(134, 57),
(154, 58),
(155, 56),
(156, 56),
(157, 56),
(158, 56),
(159, 56),
(160, 61),
(165, 61),
(166, 62),
(167, 63),
(168, 64),
(169, 64),
(170, 64),
(171, 63),
(171, 64),
(172, 64),
(173, 61),
(174, 24),
(175, 55),
(176, 55),
(177, 55),
(178, 55),
(179, 60);

-- --------------------------------------------------------

--
-- 表的结构 `zen_product_music_extra`
--

CREATE TABLE IF NOT EXISTS `zen_product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_product_music_extra`
--

INSERT INTO `zen_product_music_extra` (`products_id`, `artists_id`, `record_company_id`, `music_genre_id`) VALUES
(166, 1, 0, 1),
(169, 1, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `zen_product_types`
--

CREATE TABLE IF NOT EXISTS `zen_product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `zen_product_types`
--

INSERT INTO `zen_product_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES
(1, '商品 - 普通', 'product', 1, 'Y', '', '2013-09-27 10:56:54', '2013-09-27 10:56:54'),
(2, '商品 - 音乐', 'product_music', 1, 'Y', '', '2013-09-27 10:56:54', '2013-09-27 10:56:54'),
(3, '文档 - 普通', 'document_general', 3, 'N', '', '2013-09-27 10:56:54', '2013-09-27 10:56:54'),
(4, '文档 - 商品', 'document_product', 3, 'Y', '', '2013-09-27 10:56:54', '2013-09-27 10:56:54'),
(5, '商品 - 免运费', 'product_free_shipping', 1, 'Y', '', '2013-09-27 10:56:54', '2013-09-27 10:56:54');

-- --------------------------------------------------------

--
-- 表的结构 `zen_product_types_to_category`
--

CREATE TABLE IF NOT EXISTS `zen_product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_product_types_to_category`
--

INSERT INTO `zen_product_types_to_category` (`product_type_id`, `category_id`) VALUES
(3, 63),
(4, 63),
(2, 62),
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 16),
(1, 17);

-- --------------------------------------------------------

--
-- 表的结构 `zen_product_type_layout`
--

CREATE TABLE IF NOT EXISTS `zen_product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- 转存表中的数据 `zen_product_type_layout`
--

INSERT INTO `zen_product_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, '显示型号', 'SHOW_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', 1, 1, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(2, '显示重量', 'SHOW_PRODUCT_INFO_WEIGHT', '1', '在商品页面显示重量 0= 否 1= 是', 1, 2, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(3, '显示属性重量', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', 1, 3, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(4, '显示厂商', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', 1, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(5, '显示购物车中数量', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', 1, 5, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(6, '显示库存数量', 'SHOW_PRODUCT_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', 1, 6, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(7, '显示商品评论计数', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', 1, 7, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(8, '显示商品评论按钮', 'SHOW_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', 1, 8, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(9, '显示上市日期', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', 1, 9, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(10, '显示加入日期', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', 1, 10, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(11, '显示商品网址', 'SHOW_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', 1, 11, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(12, '显示商品附加图像', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', 1, 13, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(13, '显示最低价格文字', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', 1, 12, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(14, '商品免运费图像 - 分类', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在分类中显示免运费图像/文字?', 1, 16, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(15, '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', 1, 100, NULL, '2013-09-27 10:56:54', '', ''),
(16, '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', 1, 101, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(17, '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', 1, 102, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(18, '显示型号', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', 2, 1, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(19, '显示重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', 2, 2, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(20, '显示属性重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', 2, 3, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(21, '显示歌手', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', '在商品页面显示歌手名字 0= 否 1= 是', 2, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(22, '显示音乐类型', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', '在商品页面显示音乐类型 0= 否 1= 是', 2, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(23, '显示唱片公司', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', '在商品页面显示唱片公司 0= 否 1= 是', 2, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(24, '显示购物车中数量', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', 2, 5, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(25, '显示库存数量', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', 2, 6, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(26, '显示商品评论计数', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', 2, 7, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(27, '显示商品评论按钮', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', 2, 8, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(28, '显示上市日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', 2, 9, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(29, '显示加入日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', 2, 10, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(30, '显示商品附加图像', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', 2, 13, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(31, '显示价格文字最低至', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', 2, 12, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(32, '商品免运费图像 - 分类', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', 2, 16, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(33, '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', 2, 100, NULL, '2013-09-27 10:56:54', '', ''),
(34, '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', 2, 101, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(35, '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', 2, 102, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(36, '显示商品评论计数', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 Info 0= 否 1= 是', 3, 7, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(37, '显示商品评论按钮', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', 3, 8, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(38, '显示上市日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', 3, 9, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(39, '显示加入日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', 3, 10, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(40, '显示商品网址', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', 3, 11, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(41, '显示商品附加图像', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', 3, 13, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(42, '显示型号', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', 4, 1, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(43, '显示重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', 4, 2, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(44, '显示属性重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', 4, 3, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(45, '显示厂商', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', 4, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(46, '显示购物车中数量', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', 4, 5, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(47, '显示库存数量', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', 4, 6, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(48, '显示商品评论计数', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', 4, 7, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(49, '显示商品评论按钮', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', 4, 8, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(50, '显示上市日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', 4, 9, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(51, '显示加入日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', 4, 10, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(52, '显示商品网址', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', 4, 11, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(53, '显示商品附加图像', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', 4, 13, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(54, '显示价格文字最低至', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', 4, 12, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(55, '商品免运费图像状态 - 分类', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', 4, 16, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(56, '商品价格缺省税种 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', 4, 100, NULL, '2013-09-27 10:56:54', '', ''),
(57, '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', 4, 101, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(58, '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', 4, 102, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(59, '显示型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', 5, 1, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(60, '显示重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', 5, 2, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(61, '显示属性重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', 5, 3, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(62, '显示厂商', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', 5, 4, NULL, '2013-09-27 10:56:54', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(63, '显示购物车中数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', 5, 5, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(64, '显示库存数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', 5, 6, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(65, '显示商品评论计数', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', 5, 7, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(66, '显示商品评论按钮', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', 5, 8, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(67, '显示上市日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', '在商品页面显示上市日期 0= 否 1= 是', 5, 9, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(68, '显示加入日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', 5, 10, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(69, '显示商品网址', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', 5, 11, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(70, '显示商品附加图像', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', 5, 13, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(71, '显示价格文字 最低至', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', 5, 12, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(72, '商品免运费图像 - 分类', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', '是否在列表中显示免运费图像/文字?', 5, 16, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(73, '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', 5, 100, NULL, '2013-09-27 10:56:55', '', ''),
(74, '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', 5, 101, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(75, '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', 5, 102, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(76, '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', 1, 50, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(77, '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', 1, 51, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(78, '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', 1, 52, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(79, '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', 1, 53, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(80, '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', 1, 54, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(81, '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', 2, 50, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(82, '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', 2, 51, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(83, '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', 2, 52, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(84, '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', 2, 53, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(85, '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', 2, 54, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(86, '显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', 3, 50, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(87, '显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', 3, 51, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(88, '显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 Title 0= 否 1= 是', 3, 54, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(89, '显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', 4, 50, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(90, '显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', 4, 51, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(91, '显示元标签标题缺省值 - 文档型号', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示文档型号 0= 否 1= 是', 4, 52, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(92, '显示元标签标题缺省值 - 文档价格', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示文档价格 0= 否 1= 是', 4, 53, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(93, '显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 0= 否 1= 是', 4, 54, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(94, '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', 5, 50, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(95, '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', 5, 51, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(96, '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', 5, 52, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(97, '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', 5, 53, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(98, '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', 5, 54, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(99, '商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品属性仅用于显示<br />仅用于显示<br />0= 否 1= 是', 1, 200, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(100, '商品属性免费 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', 1, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(101, '商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', 1, 202, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(102, '商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', 1, 203, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(103, '商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', 1, 204, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(104, '商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', 1, 205, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(105, '商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', '商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', 1, 206, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(106, '商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', 1, 207, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(107, '音乐属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', '音乐属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', 2, 200, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(108, '音乐属性免费 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', '音乐属性免费<br />商品免费时属性免费<br />0= 否 1= 是', 2, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(109, '音乐属性缺省 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', '音乐属性缺省<br />缺省选中的属性<br />0= 否 1= 是', 2, 202, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(110, '音乐属性有优惠 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', '音乐属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', 2, 203, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(111, '音乐属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '音乐属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', 2, 204, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(112, '音乐属性是必选的 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', '音乐属性是必选的<br />属性是必须的<br />0= 否 1= 是', 2, 205, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(113, '音乐属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', '音乐属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', 2, 206, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(114, '音乐属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '音乐属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', 2, 207, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(115, '普通文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', '普通文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', 3, 200, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(116, '普通文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', '普通文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', 3, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(117, '普通文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', '普通文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', 3, 202, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(118, '普通文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', '普通文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', 3, 203, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(119, '普通文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '普通文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', 3, 204, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(120, '普通文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', '普通文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', 3, 205, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(121, '普通文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', '普通文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', 3, 206, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(122, '普通文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '普通文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', 3, 207, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(123, '商品文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', 4, 200, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(124, '商品文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', 4, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(125, '商品文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', 4, 202, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(126, '商品文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', 4, 203, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(127, '商品文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', 4, 204, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(128, '商品文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', 4, 205, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(129, '商品文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', '商品文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', 4, 206, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(130, '商品文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', 4, 207, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(131, '免运费商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', '免运费商品属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', 5, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(132, '免运费商品属性免费 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', '免运费商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', 5, 201, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(133, '免运费商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', '免运费商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', 5, 202, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(134, '免运费商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', '免运费商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', 5, 203, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(135, '免运费商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '免运费商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', 5, 204, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(136, '免运费商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', '免运费商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', 5, 205, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(137, '免运费商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', '免运费商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', 5, 206, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(138, '免运费商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '免运费商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', 5, 207, NULL, '2013-09-27 10:56:55', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), ');

-- --------------------------------------------------------

--
-- 表的结构 `zen_project_version`
--

CREATE TABLE IF NOT EXISTS `zen_project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zen_project_version`
--

INSERT INTO `zen_project_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.1', '', '', '', '', 'New Installation', '2013-09-27 10:56:55'),
(2, 'Zen-Cart Database', '1', '5.1', '', '', '', '', 'New Installation', '2013-09-27 10:56:55');

-- --------------------------------------------------------

--
-- 表的结构 `zen_project_version_history`
--

CREATE TABLE IF NOT EXISTS `zen_project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zen_project_version_history`
--

INSERT INTO `zen_project_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.1', '', 'New Installation', '2013-09-27 10:56:55'),
(2, 'Zen-Cart Database', '1', '5.1', '', 'New Installation', '2013-09-27 10:56:55');

-- --------------------------------------------------------

--
-- 表的结构 `zen_query_builder`
--

CREATE TABLE IF NOT EXISTS `zen_query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `zen_query_builder`
--

INSERT INTO `zen_query_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES
(1, 'email', '所有客户', '返回所有客户的姓名和电子邮件地址，用于批量发送电子邮件(例如: 电子商情、优惠券、礼券、短信等)。', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', ''),
(2, 'email,newsletters', '所有电子商情订阅者', '返回电子商情订阅者的姓名和电子邮件地址。', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = ''1''', ''),
(3, 'email,newsletters', '以往客户(超过三个月) (订阅者)', '以前曾经购物，但最近三个月内没有购物的客户订阅者', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', ''),
(4, 'email,newsletters', '最近三个月的客户(订阅者)', '最近三个月内有购物的电子商情订阅者。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = ''1'' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(5, 'email,newsletters', '最近三个月的客户(无论是否订阅)', '所有曾经购物的顾客，不论是否订阅电子商情。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(6, 'email,newsletters', '管理员', '仅当前管理员的电子邮件帐号', 'select ''ADMIN'' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', ''),
(7, 'email,newsletters', '从未购物的客户', '发给已注册但从未购物的客户', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- --------------------------------------------------------

--
-- 表的结构 `zen_record_artists`
--

CREATE TABLE IF NOT EXISTS `zen_record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_record_artists`
--

INSERT INTO `zen_record_artists` (`artists_id`, `artists_name`, `artists_image`, `date_added`, `last_modified`) VALUES
(1, 'The Russ Tippins Band', 'sooty.jpg', '2004-06-01 20:53:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_record_artists_info`
--

CREATE TABLE IF NOT EXISTS `zen_record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_record_artists_info`
--

INSERT INTO `zen_record_artists_info` (`artists_id`, `languages_id`, `artists_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'russtippinsband.users.btopenworld.com/', 0, NULL),
(1, 2, 'russtippinsband.users.btopenworld.com', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_record_company`
--

CREATE TABLE IF NOT EXISTS `zen_record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_record_company`
--

INSERT INTO `zen_record_company` (`record_company_id`, `record_company_name`, `record_company_image`, `date_added`, `last_modified`) VALUES
(1, 'HMV Group', NULL, '2004-07-09 14:11:52', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_record_company_info`
--

CREATE TABLE IF NOT EXISTS `zen_record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_record_company_info`
--

INSERT INTO `zen_record_company_info` (`record_company_id`, `languages_id`, `record_company_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'www.hmvgroup.com', 0, NULL),
(1, 2, 'www.hmvgroup.com', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `zen_reviews`
--

CREATE TABLE IF NOT EXISTS `zen_reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_reviews`
--

INSERT INTO `zen_reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_read`, `status`) VALUES
(1, 19, 0, 'Bill Smith', 5, '2003-12-23 03:18:19', '0001-01-01 00:00:00', 11, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zen_reviews_description`
--

CREATE TABLE IF NOT EXISTS `zen_reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_reviews_description`
--

INSERT INTO `zen_reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(1, 1, 'This really is a very funny but old movie!'),
(1, 2, '这是一部很有趣的旧电影！');

-- --------------------------------------------------------

--
-- 表的结构 `zen_salemaker_sales`
--

CREATE TABLE IF NOT EXISTS `zen_salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `zen_salemaker_sales`
--

INSERT INTO `zen_salemaker_sales` (`sale_id`, `sale_status`, `sale_name`, `sale_deduction_value`, `sale_deduction_type`, `sale_pricerange_from`, `sale_pricerange_to`, `sale_specials_condition`, `sale_categories_selected`, `sale_categories_all`, `sale_date_start`, `sale_date_end`, `sale_date_added`, `sale_date_last_modified`, `sale_date_status_change`) VALUES
(1, 0, '10% off Sale', '10.0000', 1, '1.0000', '1000.0000', 2, '25,28,45,47,58', ',25,28,45,47,58,', '2003-12-23', '2008-02-21', '2003-12-23', '2004-05-18', '2013-09-27'),
(3, 0, 'Mice 20%', '20.0000', 1, '1.0000', '1000.0000', 2, '9', ',9,', '2003-12-24', '2004-04-21', '2003-12-31', '2003-12-31', '2004-04-25'),
(6, 1, '$5.00 off', '5.0000', 0, '0.0000', '0.0000', 2, '27', ',27,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-01-05', '2004-01-04'),
(7, 1, '10% Skip Specials', '10.0000', 1, '0.0000', '0.0000', 1, '31', ',31,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-05-18', '2004-01-04'),
(8, 1, '10% Apply to Price', '10.0000', 1, '0.0000', '0.0000', 0, '32', ',32,', '0001-01-01', '0001-01-01', '2004-01-05', '2004-05-18', '2004-01-05'),
(9, 1, 'New Price $100', '100.0000', 2, '0.0000', '0.0000', 2, '46', ',46,', '0001-01-01', '0001-01-01', '2004-01-06', '2004-01-07', '2004-01-06'),
(10, 1, 'New Price $100 Skip Special', '100.0000', 2, '0.0000', '0.0000', 1, '51', ',51,', '0001-01-01', '0001-01-01', '2004-01-07', '2004-01-07', '2004-01-07'),
(11, 1, '$5.00 off Skip Specials', '5.0000', 0, '0.0000', '0.0000', 1, '52', ',52,', '0001-01-01', '0001-01-01', '2004-01-24', '2004-01-24', '2004-01-24');

-- --------------------------------------------------------

--
-- 表的结构 `zen_seo_cache`
--

CREATE TABLE IF NOT EXISTS `zen_seo_cache` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_language_id` tinyint(1) NOT NULL DEFAULT '0',
  `cache_name` varchar(255) NOT NULL DEFAULT '',
  `cache_data` mediumtext NOT NULL,
  `cache_global` tinyint(1) NOT NULL DEFAULT '1',
  `cache_gzip` tinyint(1) NOT NULL DEFAULT '1',
  `cache_method` varchar(20) NOT NULL DEFAULT 'RETURN',
  `cache_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cache_expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cache_id`,`cache_language_id`),
  KEY `cache_id` (`cache_id`),
  KEY `cache_language_id` (`cache_language_id`),
  KEY `cache_global` (`cache_global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_seo_cache`
--

INSERT INTO `zen_seo_cache` (`cache_id`, `cache_language_id`, `cache_name`, `cache_data`, `cache_global`, `cache_gzip`, `cache_method`, `cache_date`, `cache_expires`) VALUES
('4404c1df54fdb1291c8dd9bb259f32a9', 2, 'seo_urls_v2_manufacturers', 'S0lNy8xL1VD3dfQLdXN0DgkNcg2K93P0dY1X11FQV9e05koZVYESHgA=', 1, 1, 'EVAL', '2013-10-26 15:33:06', '2013-11-25 15:33:06'),
('a93b9170a03ff54d81e95917742ea01b', 2, 'seo_urls_v2_categories', 'jZbNbtNAEMfvPAW3gESl+JNWnCpUcQIkxIXTCtIiceEZgqJ8K21Qmo9Cm9iiVVKJpI1KSd3E6ct41/ZbsJ6pFBd1d3v/zcx/Zv479vbO5y9fd55kXm6+33r19t0H8mbz9RaxTGJnM88eZ4KreuT7macvHm3fC5rrxLQA9I5YrScG9fUVxS7r0VlbzJobRH8O+KLHCo5FiwUpbOl34TXWddiRG8z/isOsLDFtCLspxPv5YD7TsllpIR5hafdEPKjYnTjmLMTCTBwUqKLtEm19E7Ma0WBOtFiNT6diTjeT+rTYiP540aWjyglzoaUiHUsWam5AzvIeH51Kp0E0cBOtjQL/UKKTaJhVwfF8BlRvuHH+hzgfd6cB3qC7Ay4zUHiUp0W6c0irQ3FawyAGTnTcpJVSOJ2v6R8VODFxAqkITRmCTaZCdHkIvES64j8pcGKgfVIRClEWMcCf6SIqUcTApaaqGHJhaMAVn1PgxISHmRKVU/RhE/P/DeYUffAQdEdKl6SP5ISiqkk/rJ6KO+CghQ1P+ywvsV1ya3FfAKrcrKMbUqzq7qLd/Gk0LInlJm8K+7rxw/aJSoUBSVl+jg9FnJc/PtgIK9TiA8m4OAeNscqe9JFqBLFqizbO2eG1uHKygFvWi/k9g4+OHIc1sE6Zjrv8rkjvuY0D6JSZ+0uWNLlnrHMeVj1uAtVBtTBp14lbS7Z7osI1gqPtLWnDFYvQCPiQ9Zbh8TU9GIlJnWhwBtjIZfWBhEOd8L1nzkz64bFR42xGmxVsiB9W2q+Ls4MNQ/e39EOvI3W8oJUrcSruKuSG36k3F3M60eGOh+MON7+ES9YZ+WdyaXBPHrbCxKQwcv6zQvcn4soaucUm4U/J59vG2oOLwGvKkoHT48FFOJnKMLjw8cJhTjnB/gE=', 1, 1, 'EVAL', '2013-10-26 15:33:06', '2013-11-25 15:33:06'),
('ca34fbe5f9a075091ad59abf02c259a7', 2, 'seo_urls_v2_products', 'tVlNUxtHEL3nV+RGUpWt0q4QgsopleSYj0olZ5ddJjEHiMvgKh/lKDIIIRBGMuhbYMAYWULYAiQhwZ/ZmZ39F5ntXmCwPDNaklRxovp1T3e/19Ozejj9+8zc9BdjP//y03e/ffvrvR+/+eH7e+bYV5+Pzd5fePLnM+MPKxQyZmfnx778+rOHnzK2RONxbhy2Zh9IrcOetd3r2YMNcrbnHKRIY9/t12htUQoZ9yC0eMl6dVqO0WRKahnxLN2NU+eyj5YGOerTfpYkD9nFupNcMtyNC7q69/85mIATnK+T5g7plElxoIsYGBD1IjjZE9LI0HjC7u7rIgQGTHoRWL7O/0j6mJZ6ugiBAVNeBDoouRd5NmiR3be6CIEBZujjEJZBC2120sKwUgaYwH1aOSRrr2mpbHdSurPdAQGSYflVFn/BS0AOnmtjBEeA0Nhim6wPaGOf5A+0MYIjQJlOb4cl37M3L1lGy3YzOAI0TePLTuov1mxpkwhoDvJzslXaOGfHh1xQ2gDBEb4AvRh089SNVbUxgiNAgpgHxuB0PzmzO8u8cjwrOd1RWUvrdqfnrBbtzoDXWXu+u4AsUKRTqjpLx7oAgWxRsO0iqa46yS5r7IcN5/0FSx07/VejTX3rP3DhC7RAuudOvUKXY0Q/N607gUCmvMnO257dTbFBU1vN4AiQKSm9pktbzsUur6XdrxnOXoX/i99ppKe9dKx/7wGUTC6abHDkZptOcUtKYgs06ZuqdwkLpEXjNZpv0ku+TGyYZij0bEZbw7viUJi7fbLUiZBEXJ4DaMoBQzOksgyjkMDSUvoMA6/RZ0TtE5h4FV1tCp29tR6Q3QJ9d8H3xDAXIFmq0+wp21zj65Y02zB0DNtgkOMKjb2xL+NuNiZHQH1IIs3aXZJ7QTaeS03HoUD2+Rmt9d3yDms2dQCokwgwNKcZh3qJp9EiQISks4/ZOoW/RbQ8F9SRALM7abJ2RM/OSGZJlxfqQgCPjES6ryTxtKRZ4NXhZ0aGyE8LbKcnKXaUszvyZo7jBYJ2vRWpvwhucb6/pNwOGkgSB7ymWBPDXUy7i2t8DZQ9WyJ+CwUMyxdoqqopagSnaSlGWus01+JByNoylgmbIo8IvaSAZO2G3W2Rlyu+i3TOHqQNt1zR+cD9RuEDHejoGEEBKvxcn0XrCrgistmgyRgtKdqF7Ych7KsfGSYt3QQSARGoTbKSoKl3WHg5Dm92EefpZxRoFLs1fEiDDzmuBoNu1jRTIopFBvoaVsTHmSEdTFDRMGy0gkUFhd34ENUsrdmkILprqNwaZISSNy3v5vD5oryZJlFEUBkfhdWZGtkDtkfwID8iakYw9VsIweQwoQ23MhPRHgtoeds+P5X7EVpxy48Z8tA3bNL4mRL6MuSnlEQ/0lNMyfoknkKOHu7XzdGRzlwSfJNSLS5TQy3zK2lFfM6M4EPWy2Efhqf0TF1XF0GjflWlmY3oEe9OkW5YIa/SV30yyGqVZ0uqPWc7xp9p8srLWCj2bXRvyMVSEq9Hb2hfZvQbFW8sfE65NQwTz1mzY/e3+BZ3k5c0DzOEo/jTZbmSgQIO5HELGb5Z4p1JX3Xp9gsF4vqq3C3wZUQlUTN0fR16tkm1LfZ3sxa0htBJp99j7TeaHcMMQZ+Gs+UrmJf2h5w8bf/L13CdvYFskMuBk9vTaML0P2mJPhDy8Xge1Z8wfGzFvmeawpwhxaIiS2GW2L2swlAYGKqV1DSFQUASdYVHQd+cKwpDQbokLX+vmKZwQ5BEQ+4Rv4tc7dfyx6Tpf9GABvLQyprjVwjfabesiC42hztVLPim/87ON91YQUd2/0ELW5XWFqfISpIdpb1nZrvLKZgg24p+hYF8bn2LtLJkt+5k4rSsGBthyJI/ae3OIf/6ywYDeUXCyEL+TGpsjniaCECc8w/8+73ccQRYyy8I/oQlxZrTrilsgbiiLWvFaa6tQODGDs9uPlECQYHT/NqipXe8+IoYwGn/XZTs8mcSXhVyBO74I/dpAkqkK+QEFOfJ0/l5Y2Hm8eOZuXnjwf25h8bCo2nj0dO5heknigMJQqevFun2a4Ut1gU+TNDaGf88YfAvTJz8zvE5qch/sTInsE4i0K1+sLsZHTCKVzKcK1DEKEpIBKLqtBHvDAQFYhD/qNebh7ykURAi/4FLYQJiQv7ilx54lYFsFChgjht7SXYqdCRq+g85YZqZlnJHiAJ18M7EvHUA4M/wmUbZrPCtR/gnBHFi/QM=', 1, 1, 'EVAL', '2013-10-26 15:33:05', '2013-11-25 15:33:05');

-- --------------------------------------------------------

--
-- 表的结构 `zen_sessions`
--

CREATE TABLE IF NOT EXISTS `zen_sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_sessions`
--

INSERT INTO `zen_sessions` (`sesskey`, `expiry`, `value`) VALUES
('7s5129l20k87fvj4l61v963kn1', 1383031211, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949354f4745305a5445314e54646a596d46694d575a6d4d5746694e7a5979596d51795a574a694f4464694e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a49314f694a50526b5a4a51305666535642665645396653453954564639425245525352564e54496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937637a6f314f6949324e6a497a4e794937637a6f784d6a6f695932397564475675644639306558426c496a74694f6a4137637a6f784f446f695a6e4a6c5a56397a61476c7763476c755a31397064475674496a74704f6a4137637a6f794d446f695a6e4a6c5a56397a61476c7763476c755a3139335a576c6e614851694f326b364d44747a4f6a45354f694a6d636d566c58334e6f615842776157356e5833427961574e6c496a74704f6a413766573568646d6c6e5958527062323538547a6f784e7a6f69626d46326157646864476c76626b687063335276636e6b694f6a493665334d364e446f69634746306143493759546f784f6e74704f6a413759546f304f6e747a4f6a5136496e42685a3255694f334d364e546f696157356b5a5867694f334d364e446f696257396b5a534937637a6f324f694a4f54303554553077694f334d364d7a6f695a325630496a747a4f6a413649694937637a6f304f694a7762334e30496a74684f6a41366533313966584d364f446f696332356863484e6f623351694f3245364d4470376658316a6147566a61313932595778705a48787a4f6a5136496e5279645755694f327868626d64315957646c66484d364f446f6963324e6f6157356c633255694f327868626d64315957646c633139705a48787a4f6a4536496a49694f327868626d64315957646c6331396a6232526c66484d364d6a6f695a3249694f324e31636e4a6c626d4e3566484d364d7a6f695130355a496a743062325268655639706333787a4f6a45774f6949794d44457a4c5445774c544935496a7431634752686447564665484270636d463061573975633378694f6a45376332567a63326c76626c396a6233567564475679664749364d54746a64584e306232316c636e4e66615842665957526b636d567a6333787a4f6a457a4f6949784d6a55754f4449754d5459774c6a5931496a746a64584e306232316c636c39705a4878704f6a4d774f324e31633352766257567958325a70636e4e305832356862575638637a6f774f6949694f324e3163335276625756795832786863335266626d46745a58787a4f6a5136496e4579635449694f324e3163335276625756795833526c62475677614739755a58787a4f6a5936496a45794d7a51314e6949375933567a644739745a584a665a57316861577838637a6f784e446f6963544a784d6b4236656d78726179356a623230694f324e3163335276625756795832526c5a6d4631624852665957526b636d567a633139705a4878704f6a4d774f324e31633352766257567958324e7664573530636e6c6661575238637a6f794f6949304e4349375933567a644739745a584a66656d39755a5639705a48787a4f6a4d36496a45314f4349375933567a644739745a584a7a5832463164476876636d6c365958527062323538637a6f784f694977496a733d),
('hdvrcgsil5g1204pc9jqfkia93', 1383030592, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f6949354f4745305a5445314e54646a596d46694d575a6d4d5746694e7a5979596d51795a574a694f4464694e6949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a49314f694a50526b5a4a51305666535642665645396653453954564639425245525352564e54496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937546a747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a493665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d447037665831704f6a453759546f304f6e747a4f6a5136496e42685a3255694f334d364d545136496d4e795a5746305a56396859324e7664573530496a747a4f6a5136496d31765a4755694f334d364e6a6f69546b394f55314e4d496a747a4f6a4d36496d646c6443493759546f784f6e747a4f6a4536496d59694f334d364e446f69643239336279493766584d364e446f696347397a6443493759546f774f6e74396658317a4f6a6736496e4e755958427a61473930496a74684f6a4136653331395932686c59327466646d467361575238637a6f304f694a30636e566c496a74735957356e6457466e5a58787a4f6a6736496e4e6a61476c755a584e6c496a74735957356e6457466e5a584e6661575238637a6f784f694979496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d6469496a746a64584a795a57356a6558787a4f6a4d36496b4e4f575349376447396b59586c6661584e38637a6f784d446f694d6a41784d7930784d4330794f5349376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f334e6c63334e706232356659323931626e526c636e78694f6a45375933567a644739745a584a7a58326c775832466b5a484a6c63334e38637a6f784d7a6f694d5449314c6a67794c6a45324d4334324e534937),
('pgf8m6ua5l7m06t81ug8natlv1', 1383030030, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694a6c4f5451315a54466d4e32566a596a4a694f44497a4e6d4a695a54557a4f5456684d5441795a6a6732596949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a49314f694a50526b5a4a51305666535642665645396653453954564639425245525352564e54496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937546a747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f344f694a7a59326870626d567a5a534937624746755a3356685a32567a58326c6b66484d364d546f694d694937624746755a3356685a32567a58324e765a475638637a6f794f694a6e5969493759335679636d567559336c38637a6f7a4f694a44546c6b694f3352765a47463558326c7a66484d364d544136496a49774d544d744d5441744d6a6b694f3356775a4746305a55563463476c79595852706232357a664749364d54747a5a584e7a6157397558324e76645735305a584a38596a6f784f324e31633352766257567963313970634639685a4752795a584e7a66484d364d545536496a49794d6934784e6a45754d546b354c6a45334e534937);

-- --------------------------------------------------------

--
-- 表的结构 `zen_specials`
--

CREATE TABLE IF NOT EXISTS `zen_specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `zen_specials`
--

INSERT INTO `zen_specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`, `specials_date_available`) VALUES
(1, 3, '39.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(2, 5, '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(3, 6, '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(4, 16, '29.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(5, 41, '90.0000', '2003-12-25 19:15:47', '2004-09-27 13:33:33', '2008-02-21', '2013-09-27 10:59:51', 0, '0001-01-01'),
(6, 42, '95.0000', '2003-12-25 19:15:57', '2004-01-04 13:07:27', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(7, 44, '90.0000', '2003-12-25 21:54:50', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(8, 46, '90.0000', '2003-12-25 21:55:01', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(9, 53, '20.0000', '2003-12-28 23:59:03', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(10, 39, '75.0000', '2003-12-31 02:03:59', '2004-02-21 00:36:40', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(14, 74, '399.2000', '2004-01-02 15:35:30', '2004-01-02 17:38:43', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(27, 59, '300.0000', '2004-01-03 01:51:50', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(28, 76, '75.0000', '2004-01-03 23:09:36', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(29, 78, '112.5000', '2004-01-04 01:12:14', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(31, 83, '90.0000', '2004-01-04 15:03:07', '2004-01-06 10:02:25', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(32, 85, '90.0000', '2004-01-04 15:19:59', '2004-01-06 09:59:59', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(34, 88, '90.0000', '2004-01-05 00:16:22', '2004-01-06 09:59:30', '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(35, 90, '90.0000', '2004-01-05 23:57:20', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(36, 94, '90.0000', '2004-01-06 00:07:34', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(38, 95, '90.0000', '2004-01-07 02:39:58', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(39, 97, '90.0000', '2004-01-07 11:29:03', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(40, 100, '374.2500', '2004-01-08 14:07:31', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(42, 111, '90.0000', '2004-01-24 16:14:19', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(44, 130, '10.0000', '2004-04-28 02:46:44', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(45, 173, '47.5000', '2004-09-24 23:57:05', NULL, '2004-09-28', '2004-09-28 18:48:42', 0, '0001-01-01'),
(46, 166, '3.0000', '2004-10-03 20:24:53', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(47, 177, '75.0000', '2004-10-05 16:49:33', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(48, 178, '50.0000', '2004-10-05 16:56:46', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(50, 40, '75.0000', '2004-01-08 14:07:31', NULL, '0001-01-01', '0001-01-01 00:00:00', 1, '0001-01-01');

-- --------------------------------------------------------

--
-- 表的结构 `zen_tax_class`
--

CREATE TABLE IF NOT EXISTS `zen_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_tax_class`
--

INSERT INTO `zen_tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, '附加购物税', '以下商品含非食物、服务等。', NULL, '2013-09-27 10:56:54');

-- --------------------------------------------------------

--
-- 表的结构 `zen_tax_rates`
--

CREATE TABLE IF NOT EXISTS `zen_tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_tax_rates`
--

INSERT INTO `zen_tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '3.0000', '演示税率', '2013-09-27 10:56:54', '2013-09-27 10:56:54');

-- --------------------------------------------------------

--
-- 表的结构 `zen_template_select`
--

CREATE TABLE IF NOT EXISTS `zen_template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_template_select`
--

INSERT INTO `zen_template_select` (`template_id`, `template_dir`, `template_language`) VALUES
(1, 'lite_grey', '0');

-- --------------------------------------------------------

--
-- 表的结构 `zen_upgrade_exceptions`
--

CREATE TABLE IF NOT EXISTS `zen_upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_upgrade_exceptions`
--

INSERT INTO `zen_upgrade_exceptions` (`upgrade_exception_id`, `sql_file`, `reason`, `errordate`, `sqlstatement`) VALUES
(1, 'sql/mysql_utf8.sql', '无法插入配置值 "CURRENCIES_TRANSLATIONS" ，已存在', '2013-09-27 10:56:55', 'INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES (''Convert currencies for Text emails'', ''CURRENCIES_TRANSLATIONS'', '''', ''What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;'', 12, 120, NULL, ''2003-11-21 00:00:00'', NULL, ''zen_cfg_textarea_small('');');

-- --------------------------------------------------------

--
-- 表的结构 `zen_whos_online`
--

CREATE TABLE IF NOT EXISTS `zen_whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zen_whos_online`
--

INSERT INTO `zen_whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES
(30, 'q2q2, ', '7s5129l20k87fvj4l61v963kn1', '125.82.160.65', '1383028550', '1383029771', '/shop/test.php', 'OFFICE_IP_TO_HOST_ADDRESS', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36');

-- --------------------------------------------------------

--
-- 表的结构 `zen_zones`
--

CREATE TABLE IF NOT EXISTS `zen_zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=334 ;

--
-- 转存表中的数据 `zen_zones`
--

INSERT INTO `zen_zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(7, 223, 'AA', 'Armed Forces Americas'),
(9, 223, 'AE', 'Armed Forces Europe'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 163, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NL', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden-Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubnden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 44, '安徽', '安徽'),
(131, 44, '北京', '北京'),
(132, 44, '重庆', '重庆'),
(133, 44, '福建', '福建'),
(134, 44, '甘肃', '甘肃'),
(135, 44, '广东', '广东'),
(136, 44, '广西', '广西'),
(137, 44, '贵州', '贵州'),
(138, 44, '海南', '海南'),
(139, 44, '河北', '河北'),
(140, 44, '黑龙江', '黑龙江'),
(141, 44, '河南', '河南'),
(142, 44, '香港', '香港'),
(143, 44, '湖北', '湖北'),
(144, 44, '湖南', '湖南'),
(145, 44, '江苏', '江苏'),
(146, 44, '江西', '江西'),
(147, 44, '吉林', '吉林'),
(148, 44, '辽宁', '辽宁'),
(149, 44, '澳门', '澳门'),
(150, 44, '内蒙古', '内蒙古'),
(151, 44, '宁夏', '宁夏'),
(152, 44, '青海', '青海'),
(153, 44, '山西', '山西'),
(154, 44, '陕西', '陕西'),
(155, 44, '山东', '山东'),
(156, 44, '上海', '上海'),
(157, 44, '四川', '四川'),
(158, 44, '台湾', '台湾'),
(159, 44, '天津', '天津'),
(160, 44, '新疆', '新疆'),
(161, 44, '西藏', '西藏'),
(162, 44, '云南', '云南'),
(163, 44, '浙江', '浙江'),
(164, 195, 'A Coruña', 'A Coruña'),
(165, 195, 'Álava', 'Álava'),
(166, 195, 'Albacete', 'Albacete'),
(167, 195, 'Alicante', 'Alicante'),
(168, 195, 'Almería', 'Almería'),
(169, 195, 'Asturias', 'Asturias'),
(170, 195, 'Ávila', 'Ávila'),
(171, 195, 'Badajoz', 'Badajoz'),
(172, 195, 'Baleares', 'Baleares'),
(173, 195, 'Barcelona', 'Barcelona'),
(174, 195, 'Burgos', 'Burgos'),
(175, 195, 'Cáceres', 'Cáceres'),
(176, 195, 'Cádiz', 'Cádiz'),
(177, 195, 'Cantabria', 'Cantabria'),
(178, 195, 'Castellón', 'Castellón'),
(179, 195, 'Ceuta', 'Ceuta'),
(180, 195, 'Ciudad Real', 'Ciudad Real'),
(181, 195, 'Córdoba', 'Córdoba'),
(182, 195, 'Cuenca', 'Cuenca'),
(183, 195, 'Girona', 'Girona'),
(184, 195, 'Granada', 'Granada'),
(185, 195, 'Guadalajara', 'Guadalajara'),
(186, 195, 'Guipúzcoa', 'Guipúzcoa'),
(187, 195, 'Huelva', 'Huelva'),
(188, 195, 'Huesca', 'Huesca'),
(189, 195, 'Jaén', 'Jaén'),
(190, 195, 'La Rioja', 'La Rioja'),
(191, 195, 'Las Palmas', 'Las Palmas'),
(192, 195, 'León', 'León'),
(193, 195, 'Lérida', 'Lérida'),
(194, 195, 'Lugo', 'Lugo'),
(195, 195, 'Madrid', 'Madrid'),
(196, 195, 'Málaga', 'Málaga'),
(197, 195, 'Melilla', 'Melilla'),
(198, 195, 'Murcia', 'Murcia'),
(199, 195, 'Navarra', 'Navarra'),
(200, 195, 'Ourense', 'Ourense'),
(201, 195, 'Palencia', 'Palencia'),
(202, 195, 'Pontevedra', 'Pontevedra'),
(203, 195, 'Salamanca', 'Salamanca'),
(204, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(205, 195, 'Segovia', 'Segovia'),
(206, 195, 'Sevilla', 'Sevilla'),
(207, 195, 'Soria', 'Soria'),
(208, 195, 'Tarragona', 'Tarragona'),
(209, 195, 'Teruel', 'Teruel'),
(210, 195, 'Toledo', 'Toledo'),
(211, 195, 'Valencia', 'Valencia'),
(212, 195, 'Valladolid', 'Valladolid'),
(213, 195, 'Vizcaya', 'Vizcaya'),
(214, 195, 'Zamora', 'Zamora'),
(215, 195, 'Zaragoza', 'Zaragoza'),
(216, 13, 'ACT', 'Australian Capital Territory'),
(217, 13, 'NSW', 'New South Wales'),
(218, 13, 'NT', 'Northern Territory'),
(219, 13, 'QLD', 'Queensland'),
(220, 13, 'SA', 'South Australia'),
(221, 13, 'TAS', 'Tasmania'),
(222, 13, 'VIC', 'Victoria'),
(223, 13, 'WA', 'Western Australia'),
(224, 105, 'AG', 'Agrigento'),
(225, 105, 'AL', 'Alessandria'),
(226, 105, 'AN', 'Ancona'),
(227, 105, 'AO', 'Aosta'),
(228, 105, 'AR', 'Arezzo'),
(229, 105, 'AP', 'Ascoli Piceno'),
(230, 105, 'AT', 'Asti'),
(231, 105, 'AV', 'Avellino'),
(232, 105, 'BA', 'Bari'),
(233, 105, 'BT', 'Barletta Andria Trani'),
(234, 105, 'BL', 'Belluno'),
(235, 105, 'BN', 'Benevento'),
(236, 105, 'BG', 'Bergamo'),
(237, 105, 'BI', 'Biella'),
(238, 105, 'BO', 'Bologna'),
(239, 105, 'BZ', 'Bolzano'),
(240, 105, 'BS', 'Brescia'),
(241, 105, 'BR', 'Brindisi'),
(242, 105, 'CA', 'Cagliari'),
(243, 105, 'CL', 'Caltanissetta'),
(244, 105, 'CB', 'Campobasso'),
(245, 105, 'CI', 'Carbonia-Iglesias'),
(246, 105, 'CE', 'Caserta'),
(247, 105, 'CT', 'Catania'),
(248, 105, 'CZ', 'Catanzaro'),
(249, 105, 'CH', 'Chieti'),
(250, 105, 'CO', 'Como'),
(251, 105, 'CS', 'Cosenza'),
(252, 105, 'CR', 'Cremona'),
(253, 105, 'KR', 'Crotone'),
(254, 105, 'CN', 'Cuneo'),
(255, 105, 'EN', 'Enna'),
(256, 105, 'FM', 'Fermo'),
(257, 105, 'FE', 'Ferrara'),
(258, 105, 'FI', 'Firenze'),
(259, 105, 'FG', 'Foggia'),
(260, 105, 'FC', 'Forlì Cesena'),
(261, 105, 'FR', 'Frosinone'),
(262, 105, 'GE', 'Genova'),
(263, 105, 'GO', 'Gorizia'),
(264, 105, 'GR', 'Grosseto'),
(265, 105, 'IM', 'Imperia'),
(266, 105, 'IS', 'Isernia'),
(267, 105, 'AQ', 'Aquila'),
(268, 105, 'SP', 'La Spezia'),
(269, 105, 'LT', 'Latina'),
(270, 105, 'LE', 'Lecce'),
(271, 105, 'LC', 'Lecco'),
(272, 105, 'LI', 'Livorno'),
(273, 105, 'LO', 'Lodi'),
(274, 105, 'LU', 'Lucca'),
(275, 105, 'MC', 'Macerata'),
(276, 105, 'MN', 'Mantova'),
(277, 105, 'MS', 'Massa Carrara'),
(278, 105, 'MT', 'Matera'),
(279, 105, 'VS', 'Medio Campidano'),
(280, 105, 'ME', 'Messina'),
(281, 105, 'MI', 'Milano'),
(282, 105, 'MO', 'Modena'),
(283, 105, 'MB', 'Monza e Brianza'),
(284, 105, 'NA', 'Napoli'),
(285, 105, 'NO', 'Novara'),
(286, 105, 'NU', 'Nuoro'),
(287, 105, 'OG', 'Ogliastra'),
(288, 105, 'OT', 'Olbia-Tempio'),
(289, 105, 'OR', 'Oristano'),
(290, 105, 'PD', 'Padova'),
(291, 105, 'PA', 'Palermo'),
(292, 105, 'PR', 'Parma'),
(293, 105, 'PG', 'Perugia'),
(294, 105, 'PV', 'Pavia'),
(295, 105, 'PU', 'Pesaro Urbino'),
(296, 105, 'PE', 'Pescara'),
(297, 105, 'PC', 'Piacenza'),
(298, 105, 'PI', 'Pisa'),
(299, 105, 'PT', 'Pistoia'),
(300, 105, 'PN', 'Pordenone'),
(301, 105, 'PZ', 'Potenza'),
(302, 105, 'PO', 'Prato'),
(303, 105, 'RG', 'Ragusa'),
(304, 105, 'RA', 'Ravenna'),
(305, 105, 'RC', 'Reggio Calabria'),
(306, 105, 'RE', 'Reggio Emilia'),
(307, 105, 'RI', 'Rieti'),
(308, 105, 'RN', 'Rimini'),
(309, 105, 'RM', 'Roma'),
(310, 105, 'RO', 'Rovigo'),
(311, 105, 'SA', 'Salerno'),
(312, 105, 'SS', 'Sassari'),
(313, 105, 'SV', 'Savona'),
(314, 105, 'SI', 'Siena'),
(315, 105, 'SR', 'Siracusa'),
(316, 105, 'SO', 'Sondrio'),
(317, 105, 'TA', 'Taranto'),
(318, 105, 'TE', 'Teramo'),
(319, 105, 'TR', 'Terni'),
(320, 105, 'TO', 'Torino'),
(321, 105, 'TP', 'Trapani'),
(322, 105, 'TN', 'Trento'),
(323, 105, 'TV', 'Treviso'),
(324, 105, 'TS', 'Trieste'),
(325, 105, 'UD', 'Udine'),
(326, 105, 'VA', 'Varese'),
(327, 105, 'VE', 'Venezia'),
(328, 105, 'VB', 'Verbania'),
(329, 105, 'VC', 'Vercelli'),
(330, 105, 'VR', 'Verona'),
(331, 105, 'VV', 'Vibo Valentia'),
(332, 105, 'VI', 'Vicenza'),
(333, 105, 'VT', 'Viterbo');

-- --------------------------------------------------------

--
-- 表的结构 `zen_zones_to_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zen_zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zen_zones_to_geo_zones`
--

INSERT INTO `zen_zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 44, 67, 1, NULL, '2013-09-27 10:56:54');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
