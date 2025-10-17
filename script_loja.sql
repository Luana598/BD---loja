CREATE DATABASE loja_ds2m_b;
USE loja_ds2m_b;

-- Instrução para criação da tabela de cargos
CREATE TABLE tb_cargo (
	id_cargo     INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    salario_base DECIMAL(11,2) NOT NULL,
    descricao    VARCHAR(500),
    cbo          VARCHAR(10)
);

-- Instrução para criação da tabela de funcionários
CREATE TABLE tb_funcionario (
	id_funcionario  INT PRIMARY KEY AUTO_INCREMENT,
    nome 		    VARCHAR(100) NOT NULL,
    cpf 			VARCHAR(11) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone 		VARCHAR(20) NOT NULL,
    email 			VARCHAR(100),
    data_admissao   DATE NOT NULL,
    data_demissao   DATE
);

-- Instrução para criação da tabela de filiais
CREATE TABLE tb_filial (
	id_filial 		INT PRIMARY KEY AUTO_INCREMENT,
    data_abertura 	DATE NOT NULL,
    cnpj			VARCHAR(20) NOT NULL,
	nome 			VARCHAR(100) NOT NULL,
    logradouro		VARCHAR(100) NOT NULL,
    numero			VARCHAR(20) NOT NULL,
	bairro 			VARCHAR(100) NOT NULL,
    cidade 			VARCHAR(100) NOT NULL,
    cep  			VARCHAR(9) NOT NULL,
    uf  			VARCHAR(2) NOT NULL DEFAULT 'SP',
    telefone 		VARCHAR(20) NOT NULL,
    email 			VARCHAR(100) NOT NULL,
    historia 		VARCHAR(1500) NULL,
    ativa			BOOLEAN DEFAULT TRUE,
    data_fechamento DATE
);

-- DESC tb_filial;

/*
	Instrução para criação da tabela de relacionamento
    entre funcionário, filial e cargo
*/
CREATE TABLE tb_funcionario_cargo(
	id 				INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio 	DATE NOT NULL,
    data_fim 		DATE NULL,
    salario_atual   DECIMAL(11,2) NOT NULL,
    anotacoes 		VARCHAR(500),
    id_filial 		INT NOT NULL,
    id_cargo 		INT NOT  NULL,
    id_funcionario  INT NOT NULL,
    FOREIGN KEY(id_filial) REFERENCES tb_filial (id_filial),
    FOREIGN KEY (id_cargo)  REFERENCES tb_cargo (id_cargo),
	FOREIGN KEY (id_funcionario)  REFERENCES tb_funcionario (id_funcionario)
);


-- Inserts na tabela de funcionários
INSERT INTO tb_funcionario(
	nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
) 
	VALUES (
		'Rebeca Gomes', '11122233344', '2009-05-06', '(11)99999-5555', 'rebequinhadejesus@gmail.com', '2025-10-10', NULL
    );
    
   
