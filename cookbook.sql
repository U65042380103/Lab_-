GRANT ALL PRIVILEGES ON * . * TO 'nudpob'@'%';
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 03:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u65042380103`
--

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` varchar(1) NOT NULL,
  `region_name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
('1', 'northern'),
('2', 'southern'),
('3', 'central'),
('4', 'eastern'),
('5', 'northeastern');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `howto` varchar(255) NOT NULL,
  `region_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `ingredient`, `howto`, `region_id`) VALUES
('10001', 'fried rice', 'rice,onion,carrot,egg', 'fried and serve', '3'),
('10002', 'khao-soi', 'egg noodles,spring oion,chicken,chilli paste,soup', 'boil soup then put in noodles and serve', '2'),
('10003', 'ผัดกะเพราะหมู', 'น้ำมัน,กะเพรา,หมูสับ,พริก,ชูรส,ซอส', 'ใส่น้ำมัน ผัดทุกอย่างให้เข้ากัน แล้วจัดเสิร์ฟ', '3'),
('10004', 'กะเพราไก่', 'น้ำมัน,กะเพรา,ไก่สับ,พริก,ชูรส,ซอส', 'ใส่น้ำมัน ผัดทุกอย่างให้เข้ากัน แล้วจัดเสิร์ฟ', '3'),
('10005', 'น้ำพริก', 'พริก,มะนาว,น้ำปลา', 'ตำทุกอย่างให้เข้ากัน และเสิร์ฟพร้อมผักเคียง', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region` (`region_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
