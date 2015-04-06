-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2015 at 01:56 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apl-baz-pr2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bilet`
--

DROP TABLE IF EXISTS `bilet`;
CREATE TABLE IF NOT EXISTS `bilet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klasa` int(11) NOT NULL,
  `numer_miejsca` int(11) NOT NULL,
  `cena` decimal(8,2) NOT NULL,
  `imie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lot_id` int(11) NOT NULL,
  `zakup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lot_id` (`lot_id`),
  KEY `zakup_id` (`zakup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
CREATE TABLE IF NOT EXISTS `klient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numer_lotu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_wylotu` datetime NOT NULL,
  `czas_lotu` int(11) NOT NULL COMMENT 'Wyrażone w sekundach',
  `samolot_id` int(11) NOT NULL,
  `lotnisko_start` int(11) NOT NULL,
  `lotnisko_end` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `samolot_id` (`samolot_id`),
  KEY `lotnisko_start` (`lotnisko_start`),
  KEY `lotnisko_end` (`lotnisko_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lotnisko`
--

DROP TABLE IF EXISTS `lotnisko`;
CREATE TABLE IF NOT EXISTS `lotnisko` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `miasto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kraj` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `samolot`
--

DROP TABLE IF EXISTS `samolot`;
CREATE TABLE IF NOT EXISTS `samolot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rok_produkcji` date NOT NULL,
  `liczba_miejsc` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zakup`
--

DROP TABLE IF EXISTS `zakup`;
CREATE TABLE IF NOT EXISTS `zakup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_zakupu` datetime NOT NULL,
  `klient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_id` (`klient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`id`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`zakup_id`) REFERENCES `zakup` (`id`);

--
-- Constraints for table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`samolot_id`) REFERENCES `samolot` (`id`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`lotnisko_start`) REFERENCES `lotnisko` (`id`),
  ADD CONSTRAINT `lot_ibfk_3` FOREIGN KEY (`lotnisko_end`) REFERENCES `lotnisko` (`id`);

--
-- Constraints for table `zakup`
--
ALTER TABLE `zakup`
  ADD CONSTRAINT `zakup_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
