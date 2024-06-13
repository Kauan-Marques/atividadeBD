-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 14/06/2024 às 00:45
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
-- Banco de dados: `Livraria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Autores`
--

CREATE TABLE `Autores` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `nacionalidade` varchar(70) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Autores`
--

INSERT INTO `Autores` (`id`, `nome`, `nacionalidade`, `data_nascimento`) VALUES
(1, 'J.K. Rowling', 'Britânica', '1965-07-31'),
(2, 'George R.R. Martin', 'Americana', '1948-09-20'),
(3, 'J.R.R. Tolkien', 'Britânica', '1892-01-03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Clientes`
--

INSERT INTO `Clientes` (`id`, `nome`, `email`, `endereco`, `data_registro`) VALUES
(1, 'Ana Paula', 'ana.paula@example.com', 'Rua A, 123', '2024-01-15'),
(2, 'Carlos Silva', 'carlos.silva@example.com', 'Rua B, 456', '2024-02-20'),
(3, 'Maria Souza', 'maria.souza@example.com', 'Rua C, 789', '2024-03-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Compras`
--

CREATE TABLE `Compras` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `livro_id` int(11) DEFAULT NULL,
  `data_compra` date DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Compras`
--

INSERT INTO `Compras` (`id`, `cliente_id`, `livro_id`, `data_compra`, `quantidade`) VALUES
(1, 1, 1, '2024-05-10', 1),
(2, 2, 2, '2024-06-12', 2),
(3, 3, 3, '2024-06-13', 1),
(4, 1, 3, '2024-06-14', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Livros`
--

CREATE TABLE `Livros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Livros`
--

INSERT INTO `Livros` (`id`, `titulo`, `autor_id`, `genero`, `preco`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 1, 'Fantasia', 29.90),
(2, 'A Guerra    dos Tronos', 2, 'Fantasia', 49.90),
(3, 'O Senhor dos Anéis', 3, 'Fantasia', 39.90);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Autores`
--
ALTER TABLE `Autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Compras`
--
ALTER TABLE `Compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `livro_id` (`livro_id`);

--
-- Índices de tabela `Livros`
--
ALTER TABLE `Livros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Autores`
--
ALTER TABLE `Autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Compras`
--
ALTER TABLE `Compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Livros`
--
ALTER TABLE `Livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Compras`
--
ALTER TABLE `Compras`
  ADD CONSTRAINT `Compras_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`),
  ADD CONSTRAINT `Compras_ibfk_2` FOREIGN KEY (`livro_id`) REFERENCES `Livros` (`id`);

--
-- Restrições para tabelas `Livros`
--
ALTER TABLE `Livros`
  ADD CONSTRAINT `Livros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `Autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
