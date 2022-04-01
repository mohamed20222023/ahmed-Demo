-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 23, 2022 at 02:15 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
CREATE TABLE IF NOT EXISTS `producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_id` (`supplier_id`),
  KEY `supplier_id_2` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`, `code`, `description`, `price`, `supplier_id`) VALUES
(1, 'mobail', 'gf1223', 'sdfgdfgdfg fd fdg ', 2011, 1),
(3, 'opoo', 'DFGHFGH', 'DFGHFGH', 120, 2);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `address`) VALUES
(1, 'El Sharkawy', 'egypt'),
(2, 'carrefour', 'egypt'),
(3, 'el fayomy', 'Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `store_producer`
--

DROP TABLE IF EXISTS `store_producer`;
CREATE TABLE IF NOT EXISTS `store_producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_stor` int(11) NOT NULL,
  `name_producer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_stor` (`name_stor`),
  KEY `name_producer` (`name_producer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_producer`
--

INSERT INTO `store_producer` (`id`, `name_stor`, `name_producer`) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 1, 3),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stor_supplier`
--

DROP TABLE IF EXISTS `stor_supplier`;
CREATE TABLE IF NOT EXISTS `stor_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_stor` int(11) NOT NULL,
  `name_supplier` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_stor` (`name_stor`),
  KEY `name_supplier` (`name_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stor_supplier`
--

INSERT INTO `stor_supplier` (`id`, `name_stor`, `name_supplier`) VALUES
(1, 2, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `brief data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone`, `email`, `brief data`) VALUES
(1, 'ahmed', 1068173169, 'ahmedmaher0110@gmail.com', 'asfdasf af sadfsdfsad  sdfasfd'),
(2, 'Mohamed', 210562, 'ASDASD', 'SADASD');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producer`
--
ALTER TABLE `producer`
  ADD CONSTRAINT `producer_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store_producer`
--
ALTER TABLE `store_producer`
  ADD CONSTRAINT `store_producer_ibfk_1` FOREIGN KEY (`name_stor`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `store_producer_ibfk_2` FOREIGN KEY (`name_producer`) REFERENCES `producer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stor_supplier`
--
ALTER TABLE `stor_supplier`
  ADD CONSTRAINT `stor_supplier_ibfk_1` FOREIGN KEY (`name_stor`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stor_supplier_ibfk_2` FOREIGN KEY (`name_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
