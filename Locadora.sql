-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 14/06/2024 às 01:05
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
-- Banco de dados: `Locadora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Alugueis`
--

CREATE TABLE `Alugueis` (
  `id_quarto` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `veiculo_id` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Alugueis`
--

INSERT INTO `Alugueis` (`id_quarto`, `cliente_id`, `veiculo_id`, `data_inicio`, `data_fim`) VALUES
(1, 1, 1, '2024-07-01', '2024-07-05'),
(2, 2, 2, '2024-07-10', '2024-07-15'),
(3, 3, 3, '2024-07-20', '2024-07-25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` bigint(9) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Clientes`
--

INSERT INTO `Clientes` (`id`, `nome`, `email`, `telefone`, `data_nascimento`) VALUES
(1, 'Ana Costa', 'ana.costa@example.com', 123456789, '1985-02-15'),
(2, 'Bruno Alves', 'bruno.alves@example.com', 987654321, '1990-06-30'),
(3, 'Carla Martins', 'carla.martins@example.com', 456789123, '1975-12-05'),
(4, 'Ana Costa', 'ana.costa@example.com', 123456789, '1985-02-15'),
(5, 'Bruno Alves', 'bruno.alves@example.com', 987654321, '1990-06-30'),
(6, 'Carla Martins', 'carla.martins@example.com', 456789123, '1975-12-05'),
(7, 'Ana Costa', 'ana.costa@example.com', 123456789, '1985-02-15'),
(8, 'Bruno Alves', 'bruno.alves@example.com', 987654321, '1990-06-30'),
(9, 'Carla Martins', 'carla.martins@example.com', 456789123, '1975-12-05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Veiculos`
--

CREATE TABLE `Veiculos` (
  `id` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `marca` varchar(30) DEFAULT NULL,
  `ano` bigint(4) DEFAULT NULL,
  `preco_por_dia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Veiculos`
--

INSERT INTO `Veiculos` (`id`, `modelo`, `marca`, `ano`, `preco_por_dia`) VALUES
(1, 'Civic', 'Honda', 2020, 200.00),
(2, 'Corolla', 'Toyota', 2019, 180.00),
(3, 'Model S', 'Tesla', 2022, 350.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Alugueis`
--
ALTER TABLE `Alugueis`
  ADD PRIMARY KEY (`id_quarto`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `veiculo_id` (`veiculo_id`);

--
-- Índices de tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Veiculos`
--
ALTER TABLE `Veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Alugueis`
--
ALTER TABLE `Alugueis`
  MODIFY `id_quarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `Veiculos`
--
ALTER TABLE `Veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Alugueis`
--
ALTER TABLE `Alugueis`
  ADD CONSTRAINT `Alugueis_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`),
  ADD CONSTRAINT `Alugueis_ibfk_2` FOREIGN KEY (`veiculo_id`) REFERENCES `Veiculos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
