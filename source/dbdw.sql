-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2021 at 01:30 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `dim_cid`
--

CREATE TABLE `dim_cid` (
  `SUBCAT` varchar(255) DEFAULT NULL,
  `id_cid` int(11) DEFAULT NULL,
  `categoria` text,
  `cid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_comp`
--

CREATE TABLE `dim_comp` (
  `id_comp` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `num_mes` int(11) DEFAULT NULL,
  `mes` varchar(50) DEFAULT NULL,
  `ano_mes` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dim_especie`
--

CREATE TABLE `dim_especie` (
  `id_especie` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `despacho` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_localidade`
--

CREATE TABLE `dim_localidade` (
  `id_localidade` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `sigla_uf` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dim_segurado`
--

CREATE TABLE `dim_segurado` (
  `id_segurado` bigint(20) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `filiacao` varchar(50) DEFAULT NULL,
  `idade_conc` double DEFAULT NULL,
  `vinculo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fato_beneficio`
--

CREATE TABLE `fato_beneficio` (
  `id_localidade` int(11) DEFAULT NULL,
  `id_cid` int(11) DEFAULT NULL,
  `id_segurado` int(11) DEFAULT NULL,
  `id_comp` int(11) DEFAULT NULL,
  `id_especie` int(11) DEFAULT NULL,
  `qtd_beneficios` bigint(20) DEFAULT NULL,
  `tot_renda` double DEFAULT NULL,
  `med_renda` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_comp`
--
ALTER TABLE `dim_comp`
  ADD KEY `id_comp` (`id_comp`);

--
-- Indexes for table `dim_especie`
--
ALTER TABLE `dim_especie`
  ADD PRIMARY KEY (`id_especie`),
  ADD KEY `idx_dim_especie_lookup` (`especie`,`despacho`),
  ADD KEY `idx_dim_especie_tk` (`id_especie`);

--
-- Indexes for table `dim_localidade`
--
ALTER TABLE `dim_localidade`
  ADD PRIMARY KEY (`id_localidade`),
  ADD KEY `idx_dim_localidade_lookup` (`codigo`),
  ADD KEY `idx_dim_localidade_tk` (`id_localidade`);

--
-- Indexes for table `dim_segurado`
--
ALTER TABLE `dim_segurado`
  ADD PRIMARY KEY (`id_segurado`),
  ADD KEY `idx_dim_segurado_lookup` (`sexo`,`filiacao`,`idade_conc`,`vinculo`),
  ADD KEY `idx_dim_segurado_tk` (`id_segurado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_localidade`
--
ALTER TABLE `dim_localidade`
  MODIFY `id_localidade` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5568;
--
-- AUTO_INCREMENT for table `dim_segurado`
--
ALTER TABLE `dim_segurado`
  MODIFY `id_segurado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5035;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
