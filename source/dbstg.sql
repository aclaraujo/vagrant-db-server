-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2021 at 01:32 AM
-- Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbstg`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficios_concedidos`
--

CREATE TABLE `beneficios_concedidos` (
  `CID` varchar(50) DEFAULT NULL,
  `CID2` varchar(50) DEFAULT NULL,
  `Despacho` varchar(50) DEFAULT NULL,
  `UF` varchar(50) DEFAULT NULL,
  `competencia` varchar(50) DEFAULT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `dt_nascimento` datetime DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `num_res` varchar(50) DEFAULT NULL,
  `vinculo_dep` varchar(50) DEFAULT NULL,
  `forma_filiacao` varchar(50) DEFAULT NULL,
  `qt_sm` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cid_10`
--

CREATE TABLE `cid_10` (
  `CAT` tinytext,
  `CLASSIF` tinytext,
  `DESCRICAO` text,
  `DESCRABREV` text,
  `REFER` tinytext,
  `EXCLUIDOS` tinytext,
  `SUBCAT` tinytext,
  `CLASSIF_1` tinytext,
  `RESTRSEXO` tinytext,
  `CAUSAOBITO` tinytext,
  `DESCRICAO_1` text,
  `DESCRABREV_1` text,
  `REFER_1` tinytext,
  `EXCLUIDOS_1` tinytext,
  `CAT_1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
