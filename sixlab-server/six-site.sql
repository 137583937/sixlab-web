<<<<<<< HEAD
CREATE TABLE sixlab_meta
(
  id          INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  key_id      INT(11),
  meta_key    VARCHAR(255),
  meta_val    VARCHAR(2000),
  meta_flag   VARCHAR(255),
  meta_remark VARCHAR(2000)
);
CREATE TABLE sixlab_user
(
  id       INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  username VARCHAR(50),
  password VARCHAR(50)
);
CREATE TABLE tools_code_line
(
  id         INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  check_date DATETIME,
  all_num    INT(11),
  code_num   INT(11),
  code_type  VARCHAR(10)
);
CREATE TABLE tools_his_event
(
  id           INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  event        VARCHAR(255),
  event_type   VARCHAR(255),
  key_id       INT(11),
  event_remark VARCHAR(255),
  event_date   DATE
);
CREATE TABLE tools_movie
(
  id           INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  movie_name   VARCHAR(200)        NOT NULL,
  produce_year VARCHAR(4),
  director     VARCHAR(200),
  remark       VARCHAR(2000),
  view_date    DATE                NOT NULL,
  douban_key   VARCHAR(255) COMMENT '豆瓣 Subject Key',
  douban_score DOUBLE(3, 2) COMMENT '豆瓣评分',
  douban_info  VARCHAR(2000) COMMENT '豆瓣信息栏信息',
  info_status  VARCHAR(4) COMMENT '信息爬虫状态'
);
CREATE TABLE tools_note
(
  id        INT(32) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title     VARCHAR(50),
  content   VARCHAR(50),
  time      DATETIME,
  begin     DATETIME,
  end       DATETIME,
  one_level VARCHAR(50),
  two_level VARCHAR(50)
);
CREATE TABLE tools_record_item
(
  id         INT(32) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  item_name  VARCHAR(50),
  item_order INT(32),
  is_del     VARCHAR(50),
  remark     VARCHAR(50)
);
CREATE TABLE tools_record_val
(
  id          INT(32) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  item_id     INT(32),
  record_date DATETIME,
  record_val  VARCHAR(50)
);
CREATE TABLE tools_show
(
  id           INT(32) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  show_name    VARCHAR(50),
  show_season  INT(32),
  show_episode INT(32),
  show_status  VARCHAR(50),
  view_status  VARCHAR(50),
  tv           VARCHAR(50),
  remark       VARCHAR(50),
  douban_key   VARCHAR(50),
  begin_date   DATETIME,
  finish_date  DATETIME,
  update_date  DATETIME
);
=======
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : six_site

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2016-01-13 09:16:08
*/



CREATE DATABASE IF NOT EXISTS six_site DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use six_site;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for six_site_attr
-- ----------------------------
DROP TABLE IF EXISTS `six_site_attr`;
CREATE TABLE `six_site_attr` (
  `attr_id` INT(11) NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(32) NOT NULL DEFAULT '',
  `attr_link` varchar(32) NOT NULL,
  `attr_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `parent` INT(11) NOT NULL DEFAULT '0',
  `count` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  UNIQUE KEY `id` (`attr_id`,`attr_name`) USING BTREE,
  KEY `attr_type` (`attr_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_attr_obj
-- ----------------------------
DROP TABLE IF EXISTS `six_site_attr_obj`;
CREATE TABLE `six_site_attr_obj` (
  `obj_id` INT(11) NOT NULL DEFAULT '0',
  `attr_id` INT(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`obj_id`,`attr_id`),
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `six_site_commentmeta`;
CREATE TABLE `six_site_commentmeta` (
  `meta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `comment_id` INT(11) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_comments
-- ----------------------------
DROP TABLE IF EXISTS `six_site_comments`;
CREATE TABLE `six_site_comments` (
  `comment_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `comment_post_ID` INT(11) NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` INT(11) NOT NULL DEFAULT '0',
  `user_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_options
-- ----------------------------
DROP TABLE IF EXISTS `six_site_options`;
CREATE TABLE `six_site_options` (
  `option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `six_site_postmeta`;
CREATE TABLE `six_site_postmeta` (
  `meta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `post_id` INT(11) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for six_site_posts
-- ----------------------------
DROP TABLE IF EXISTS `six_site_posts`;
CREATE TABLE `six_site_posts` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `post_author` INT(11) NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_parent` INT(11) NOT NULL DEFAULT '0',
  `page_uri` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for six_site_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `six_site_usermeta`;
CREATE TABLE `six_site_usermeta` (
  `umeta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for six_site_users
-- ----------------------------
DROP TABLE IF EXISTS `six_site_users`;
CREATE TABLE `six_site_users` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
>>>>>>> 初始化网站后台项目 sixlab-server
