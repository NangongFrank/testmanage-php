-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2019 at 12:19 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testmg`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `a_name` varchar(20) DEFAULT '管理员',
  `a_code` varchar(20) NOT NULL,
  `a_pwd` varchar(50) NOT NULL COMMENT 'md5加密'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `id` int(11) NOT NULL,
  `a_code` varchar(20) NOT NULL,
  `a_phone` char(11) DEFAULT NULL,
  `a_address` varchar(80) DEFAULT NULL,
  `a_email` varchar(30) DEFAULT NULL,
  `a_sex` enum('女','男') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `c_code` varchar(20) NOT NULL COMMENT '时间戳+6位随机数',
  `c_name` varchar(50) NOT NULL,
  `c_create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `c_author_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courseinfo`
--

CREATE TABLE `courseinfo` (
  `c_code` varchar(20) NOT NULL,
  `c_task` text COMMENT '课题说明',
  `c_tip` text COMMENT '课题要求',
  `c_file_code` varchar(20) DEFAULT NULL COMMENT '时间戳+6位随机数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stucourse`
--

CREATE TABLE `stucourse` (
  `c_code` varchar(20) NOT NULL,
  `u_code` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `action_log` varchar(20) NOT NULL COMMENT '时间戳+6位随机数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stucourselog`
--

CREATE TABLE `stucourselog` (
  `action_log` varchar(20) NOT NULL,
  `action_way` enum('download','upload') DEFAULT NULL,
  `t_task` text COMMENT '老师评语',
  `s_file_code` varchar(20) DEFAULT NULL COMMENT '时间戳+6位随机数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentfiles`
--

CREATE TABLE `studentfiles` (
  `id` int(11) NOT NULL,
  `f_code` varchar(20) NOT NULL COMMENT '上传文件是确定(前端提供)',
  `f_name` varchar(30) NOT NULL,
  `f_truth_name` varchar(20) NOT NULL COMMENT '存储在服务器上的名称',
  `f_path` varchar(30) NOT NULL COMMENT '存储路径',
  `f_state` char(1) DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacherfiles`
--

CREATE TABLE `teacherfiles` (
  `id` int(11) NOT NULL,
  `f_code` varchar(20) NOT NULL COMMENT '上传文件是确定(前端提供)',
  `f_name` varchar(30) NOT NULL,
  `f_truth_name` varchar(20) NOT NULL COMMENT '存储在服务器上的名称',
  `f_path` varchar(30) NOT NULL COMMENT '存储路径',
  `f_state` char(1) DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `u_name` varchar(20) DEFAULT '管理员',
  `u_code` varchar(20) NOT NULL,
  `u_pwd` varchar(50) NOT NULL COMMENT 'md5加密',
  `u_role` enum('student','teacher') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `u_code` varchar(20) NOT NULL,
  `u_phone` char(11) DEFAULT NULL,
  `u_address` varchar(80) DEFAULT NULL,
  `u_email` varchar(30) DEFAULT NULL,
  `u_sex` enum('女','男') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseinfo`
--
ALTER TABLE `courseinfo`
  ADD PRIMARY KEY (`c_code`);

--
-- Indexes for table `stucourse`
--
ALTER TABLE `stucourse`
  ADD PRIMARY KEY (`c_code`);

--
-- Indexes for table `stucourselog`
--
ALTER TABLE `stucourselog`
  ADD PRIMARY KEY (`action_log`);

--
-- Indexes for table `studentfiles`
--
ALTER TABLE `studentfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacherfiles`
--
ALTER TABLE `teacherfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admininfo`
--
ALTER TABLE `admininfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studentfiles`
--
ALTER TABLE `studentfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacherfiles`
--
ALTER TABLE `teacherfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
