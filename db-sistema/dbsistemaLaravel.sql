-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 19/12/2018 às 15:26
-- Versão do servidor: 5.7.24-0ubuntu0.18.04.1
-- Versão do PHP: 7.2.13-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsistemaLaravel`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `condicao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nome`, `descricao`, `condicao`) VALUES
(2, 'Limpeza', 'produtos de limpeza', 1),
(3, 'alimentícios', 'produtos alimentícios', 1),
(4, 'medicinais', 'produtos medicinais', 1),
(5, 'Lacticineos', 'produtos Lacticineos', 1),
(6, 'Bebidas', 'bebidas em geral', 1),
(7, 'naturais', 'produtos naturais', 1),
(8, 'saúde', 'produtos saude', 0),
(9, 'saúde', 'produtos saude', 0),
(10, 'abc', 'abc', 0),
(11, 'teste', 'teste', 0),
(12, 'eletrônico', 'Produtos Eletrônicos', 1),
(13, 'Brinquedos', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhe_entrada`
--

CREATE TABLE `detalhe_entrada` (
  `iddetalhe_entrada` int(11) NOT NULL,
  `identrada` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_compra` decimal(9,2) DEFAULT NULL,
  `preco_venda` decimal(9,2) DEFAULT NULL,
  `detalhe_entradacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhe_venda`
--

CREATE TABLE `detalhe_venda` (
  `iddetalhe_venda` int(11) NOT NULL,
  `idvenda` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_venda` decimal(9,2) DEFAULT NULL,
  `desconto` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada`
--

CREATE TABLE `entrada` (
  `identrada` int(11) NOT NULL,
  `idfornecedor` int(11) NOT NULL,
  `tipo_comprovante` varchar(45) DEFAULT NULL,
  `serie_comprovante` varchar(45) DEFAULT NULL,
  `num_comprovante` varchar(45) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `taxa` decimal(4,2) DEFAULT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL,
  `tipo_pessoa` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_doc` varchar(30) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `pessoa`
--

INSERT INTO `pessoa` (`idpessoa`, `tipo_pessoa`, `nome`, `tipo_documento`, `num_doc`, `endereco`, `telefone`, `email`) VALUES
(1, 'Inativo', 'João Paulo', 'CPF', '111111111111111', 'av. teste', '22222-22222', 'joao@teste.com.br'),
(2, 'Inativo', 'João Pauloo', 'RG', '1111111111111112', 'av. teste2', '22222-222221', 'joao2@teste.com.br'),
(3, 'Cliente', 'João Paulo', 'CPF', '44634123456', 'teste', '24097339', 'teste@teste.om.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `estoque` int(11) NOT NULL,
  `descricao` varchar(512) DEFAULT NULL,
  `imagem` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `produto`
--

INSERT INTO `produto` (`idproduto`, `idcategoria`, `codigo`, `nome`, `estoque`, `descricao`, `imagem`, `estado`) VALUES
(1, 2, '1', 'computador', 10, 'pc', 'pc.png', 'Inativo'),
(5, 12, '001', 'Tablet', 10, 'Tablet novo', 'tablet.png', 'Ativo'),
(6, 13, '001', 'Toy Store', 10, 'brinquedo', 'brinquedo.jpg', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `tipo_cormprovante` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `num_cormprovante` varchar(45) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `taxa` decimal(4,2) DEFAULT NULL,
  `total_venda` decimal(9,2) DEFAULT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices de tabela `detalhe_entrada`
--
ALTER TABLE `detalhe_entrada`
  ADD PRIMARY KEY (`iddetalhe_entrada`),
  ADD KEY `fk_detalhe_entrada_idx` (`identrada`),
  ADD KEY `fk_detalhe_produto_idx` (`idproduto`);

--
-- Índices de tabela `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  ADD PRIMARY KEY (`iddetalhe_venda`),
  ADD KEY `fk_detalhe_venda_idx` (`idvenda`),
  ADD KEY `fk_detalhe_produto_idx` (`idproduto`);

--
-- Índices de tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`identrada`),
  ADD KEY `fk_entrada_pessoa_idx` (`idfornecedor`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idpessoa`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `fk_produto_categoria_idx` (`idcategoria`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`),
  ADD KEY `fk_venda_cliente_idx` (`idcliente`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de tabela `detalhe_entrada`
--
ALTER TABLE `detalhe_entrada`
  MODIFY `iddetalhe_entrada` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  MODIFY `iddetalhe_venda` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `identrada` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idpessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idvenda` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `detalhe_entrada`
--
ALTER TABLE `detalhe_entrada`
  ADD CONSTRAINT `fk_detalhe_entrada` FOREIGN KEY (`identrada`) REFERENCES `entrada` (`identrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalhe_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  ADD CONSTRAINT `fk_detalhevenda_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalhevenda_venda` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_entrada_pessoa` FOREIGN KEY (`idfornecedor`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`idcliente`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
