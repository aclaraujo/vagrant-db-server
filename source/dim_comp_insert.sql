-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2021 at 01:36 AM
-- Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbdw`
--

--
-- Truncate table before insert `dim_comp`
--

TRUNCATE TABLE `dim_comp`;
--
-- Dumping data for table `dim_comp`
--

INSERT INTO `dim_comp` (`id_comp`, `ano`, `num_mes`, `mes`, `ano_mes`) VALUES
(1, 2020, 1, 'JANEIRO', 'JAN/2020'),
(2, 2020, 2, 'FEVEREIRO', 'FEV/2020'),
(3, 2020, 3, 'MARÇO', 'MAR/2020'),
(4, 2020, 4, 'ABRIL', 'ABR/2020'),
(5, 2020, 5, 'MAIO', 'MAI/2020'),
(6, 2020, 6, 'JUNHO', 'JUN/2020'),
(7, 2020, 7, 'JULHO', 'JUL/2020'),
(8, 2020, 8, 'AGOSTO', 'AGO/2020'),
(9, 2020, 9, 'SETEMBRO', 'SET/2020'),
(10, 2020, 10, 'OUTUBRO', 'OUT/2020'),
(11, 2020, 11, 'NOVEMBRO', 'NOV/2020'),
(12, 2020, 12, 'DEZEMBRO', 'DEZ/2020');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
