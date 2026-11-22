-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2026 at 01:14 AM
-- Server version: 10.11.19-MariaDB
-- PHP Version: 8.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gerenciador_fretes`
--

-- --------------------------------------------------------

--
-- Table structure for table `fretes`
--

CREATE TABLE `fretes` (
  `id` int(11) NOT NULL,
  `transportadora_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `origem` varchar(150) DEFAULT NULL,
  `destino` varchar(150) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `peso` decimal(10,3) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `valor`, `categoria`, `peso`, `quantidade`) VALUES
(2, 'Caixa de papel', 'Caixa com 500 folhas de papel', 25.00, 'Papelaria', 2.000, 10),
(4, 'Caneta do Bob Esponja', 'Caneta azul personalizada.', 7.00, 'Escolar', 0.050, 100),
(5, 'Apontador do FNAF', 'Apontador pequeno de plástico.', 5.50, 'Escolar', 0.500, 100),
(6, 'Mochila escolar', 'Mochila preta de couro com dois compartimentos.', 89.90, 'Acessórios', 0.800, 5),
(7, 'Caderno Grande de 10 matérias de Hollow knight', 'Caderno personalizado, capa dura. com folhas pautadas e adesivos.', 60.00, 'Papelaria', 0.500, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transportadoras`
--

INSERT INTO `transportadoras` (`id`, `nome`, `telefone`, `email`) VALUES
(1, 'Transportadora Rota Sul', '46999998888', 'contato@rotasul.example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fretes`
--
ALTER TABLE `fretes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportadora_id` (`transportadora_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fretes`
--
ALTER TABLE `fretes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fretes`
--
ALTER TABLE `fretes`
  ADD CONSTRAINT `fretes_ibfk_1` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`),
  ADD CONSTRAINT `fretes_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
