-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 14/06/2024 às 01:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Hotelaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Hospedes`
--

CREATE TABLE `Hospedes` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` bigint(9) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Hospedes`
--

INSERT INTO `Hospedes` (`id`, `nome`, `email`, `telefone`, `data_nascimento`) VALUES
(1, 'Carlos Souza', 'carlos.souza@example.com', 123456789, '1985-02-15'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', 987654321, '1990-06-30'),
(3, 'Pedro Lima', 'pedro.lima@example.com', 456789123, '1975-12-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Quartos`
--

CREATE TABLE `Quartos` (
  `id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `preco_por_noite` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Quartos`
--

INSERT INTO `Quartos` (`id`, `numero`, `tipo`, `preco_por_noite`) VALUES
(1, 101, 'Solteiro', 150.00),
(2, 102, 'Casal', 200.00),
(3, 103, 'Luxo', 350.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Reservas`
--

CREATE TABLE `Reservas` (
  `id` int(11) NOT NULL,
  `hospede_id` int(11) DEFAULT NULL,
  `quarto_id` int(11) DEFAULT NULL,
  `data_checkin` date DEFAULT NULL,
  `data_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Reservas`
--

INSERT INTO `Reservas` (`id`, `hospede_id`, `quarto_id`, `data_checkin`, `data_checkout`) VALUES
(1, 1, 1, '2024-07-01', '2024-07-05'),
(2, 2, 2, '2024-07-10', '2024-07-15'),
(3, 3, 3, '2024-07-20', '2024-07-25');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Hospedes`
--
ALTER TABLE `Hospedes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Quartos`
--
ALTER TABLE `Quartos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospede_id` (`hospede_id`),
  ADD KEY `quarto_id` (`quarto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Hospedes`
--
ALTER TABLE `Hospedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Quartos`
--
ALTER TABLE `Quartos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Reservas`
--
ALTER TABLE `Reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Reservas`
--
ALTER TABLE `Reservas`
  ADD CONSTRAINT `Reservas_ibfk_1` FOREIGN KEY (`hospede_id`) REFERENCES `Hospedes` (`id`),
  ADD CONSTRAINT `Reservas_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `Quartos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
