-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 14/06/2024 às 01:38
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
-- Banco de dados: `Academia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Alunos`
--

CREATE TABLE `Alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` bigint(9) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Matriculas`
--

CREATE TABLE `Matriculas` (
  `id` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Personal`
--

CREATE TABLE `Personal` (
  `id` int(11) NOT NULL,
  `nome` int(11) DEFAULT NULL,
  `telefone` bigint(9) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Treinos`
--

CREATE TABLE `Treinos` (
  `id` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `tipo_de_treino` varchar(50) DEFAULT NULL,
  `observacao` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Alunos`
--
ALTER TABLE `Alunos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Matriculas`
--
ALTER TABLE `Matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_aluno` (`id_aluno`);

--
-- Índices de tabela `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Treinos`
--
ALTER TABLE `Treinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_personal` (`id_personal`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Alunos`
--
ALTER TABLE `Alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Matriculas`
--
ALTER TABLE `Matriculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Personal`
--
ALTER TABLE `Personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Treinos`
--
ALTER TABLE `Treinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Matriculas`
--
ALTER TABLE `Matriculas`
  ADD CONSTRAINT `Matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `Alunos` (`id`);

--
-- Restrições para tabelas `Treinos`
--
ALTER TABLE `Treinos`
  ADD CONSTRAINT `Treinos_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `Alunos` (`id`),
  ADD CONSTRAINT `Treinos_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `Personal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
