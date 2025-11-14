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


-- Criação da tabela de endereços do funcionário no BD
CREATE TABLE tbl_endereco_funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    id_funcionario INT NOT NULL,
	FOREIGN KEY (id_funcionario) REFERENCES  tb_funcionario (id_funcionario)
    );
    
    ALTER TABLE tbl_endereco_funcionario RENAME TO tb_endereco_funcionario;

    SELECT * FROM tbl_endereco_funcionario;

-- Inserts na tabela de funcionários
INSERT INTO tb_funcionario(
	nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
) 
	VALUES (
		'Rebeca Gomes', '11122233344', '2009-05-06', '(11)99999-5555', 'rebequinhadejesus@gmail.com', '2025-10-10', NULL
    );
    

-- Criação e Insert na Tabela Loja

CREATE TABLE tb_loja(
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia varchar(100) NOT NULL, 
    cnpj varchar(20) NOT NULL,
    razao_social varchar(100) NOT NULL, 
    ie varchar(20) NOT NULL, 
    logradouro varchar(100) NULL,
    bairro varchar(100) NULL,
    cidade varchar(100) NULL,
    cep varchar(9) NULL,
    uf varchar(2) NULL
);

INSERT INTO tb_loja (
    nome_fantasia, cnpj, razao_social, ie, logradouro, bairro, cidade, cep, uf
)
VALUES
('Loja_1', '11.111.111/0001-11', 'Loja  Comércio LTDA', '123456789', 'Rua A, 100', 'Centro', 'São Paulo', '01010-000', 'SP');

SELECT * FROM tb_loja;
SELECT * FROM tb_filial;

-- adicioando a fk na tb_filial
ALTER TABLE tb_filial ADD COLUMN id_loja INT NOT NULL;
DESC tb_filial;

ALTER TABLE tb_filial 
	ADD CONSTRAINT fk_loja 
	FOREIGN KEY (id_loja)
	REFERENCES tb_loja (id_loja);

-- Criação e Insert na Tabela Produto

CREATE TABLE tbl_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(11,2) NOT NULL,
    descricao VARCHAR(500) NULL,
    fabricante VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NULL,
    lote VARCHAR(30) NULL,
    quantidade DECIMAL(11,2) NOT NULL,
    unidade VARCHAR(20) NOT NULL
);

INSERT INTO tb_produto (
    nome, valor, descricao, fabricante, modelo, lote, quantidade, unidade
) 
VALUES 
('Smartphone X100', 1899.90, 'Smartphone com 128GB de armazenamento e câmera dupla.', 'TecnoMobile', 'X100', 'Lote-AX2025', 50, 'unidade'),

('Notebook UltraSlim 14', 3599.00, 'Notebook leve, ideal para estudos e trabalho.', 'NeoTech', 'US-14', 'Lote-NT785', 30, 'unidade'),

('Fone de Ouvido Bluetooth WaveSound', 199.90, 'Fone sem fio com cancelamento de ruído.', 'AudioWave', 'WS-BT', 'Lote-AW451', 100, 'unidade');

INSERT INTO tb_produto (
    nome, valor, descricao, fabricante, modelo, lote, quantidade, unidade
) 
VALUES
('Teclado Mecânico Lumina RGB', 349.90, 'Teclado mecânico com iluminação RGB e switches Blue.', 'KeyMaster', 'KM-RGB-BLUE', 'Lote-TK2025', 25, 'peça'),

('Mouse Gamer Precision 8000DPI', 129.90, 'Mouse gamer com ajuste de DPI e 8 botões programáveis.', 'SpeedMouse', 'SM-8000', 'Lote-MS450', 40, 'peça'),

('Caixa de Som Bluetooth Pulse Pro', 259.00, 'Caixa de som portátil com bateria de 10 horas.', 'SoundPlus', 'Pulse-Pro', 'Lote-SP777', 15, 'caixa'),

('Cabo HDMI 2.1 Ultra HD 3m', 39.90, 'Cabo HDMI compatível com resolução 8K.', 'WireTech', 'HDMI-21-3M', 'Lote-WT003', 200, 'unidade');

SELECT * FROM tb_produto;

-- Criação e Insert na Tabela filial_produto

CREATE TABLE tb_filial_produto(
id INT AUTO_INCREMENT PRIMARY KEY,
quantidade decimal(11,2) NOT NULL,
id_filial INT NOT NULL,
id_produto INT NOT NULL,
FOREIGN KEY (id_filial) REFERENCES  tb_filial (id_filial),
FOREIGN KEY (id_produto) REFERENCES  tb_produto (id_produto)
);

SELECT * FROM tb_filial_produto;
SELECT * FROM tb_filial;

-- Inserindo produtos nas filiais
INSERT INTO tb_filial_produto (quantidade, id_filial, id_produto) VALUES
(50.00, 1, 1),(30.00, 1, 2),
(20.00, 1, 3),(25.00, 1, 5),
(15.00, 1, 6),(10.00, 1, 7),
(35.00, 2, 2), (25.00, 2, 3),
(45.00, 2, 4),(20.00, 2, 5),
(18.00, 2, 6),(12.00, 2, 7);

-- criação da tabela Cliente

CREATE TABLE tbl_cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    data_nascimento DATE NULL,
    telefone VARCHAR(20) NULL,
    email VARCHAR(100) NULL,
    renda DECIMAL(11,2) NULL
);

INSERT INTO tbl_cliente (nome, cpf, data_nascimento, telefone, email, renda) VALUES
('Ana Souza', '12345678901', '1990-05-12', '(11)91234-5678', 'ana.souza@email.com', 3500.00),
('Bruno Lima', '23456789012', '1985-08-23', '(21)98765-4321', 'bruno.lima@email.com', 4200.50),
('Carla Mendes', '34567890123', '1992-12-01', '(31)99876-5432', 'carla.mendes@email.com', 2800.75),
('Daniel Rocha', '45678901234', '1988-03-15', '(41)91234-8765', 'daniel.rocha@email.com', 5000.00),
('Elisa Martins', '56789012345', '1995-07-30', '(51)98765-1234', 'elisa.martins@email.com', 3100.20),
('Fábio Torres', '67890123456', '1983-11-10', '(61)99876-4321', 'fabio.torres@email.com', 1500.00),
('Gisele Cardoso', '78901234567', '1991-09-25', '(71)91234-9876', 'gisele.cardoso@email.com', 3700.90),
('Henrique Almeida', '89012345678', '1987-01-05', '(81)98765-6789', 'henrique.almeida@email.com', 4000.00),
('Isabela Freitas', '90123456789', '1993-06-18', '(91)99876-1234', 'isabela.freitas@email.com', 2900.50),
('João Pedro Santos', '01234567890', '1989-04-22', '(11)91234-4321', 'joao.santos@email.com', 5200.00);

    ALTER TABLE tbl_cliente RENAME TO tb_cliente;

Select * from tb_cliente;

-- criação da tabela endereço de Cliente

CREATE TABLE tb_endereco_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    id_cliente INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES  tb_cliente (id_cliente)
    );


CREATE TABLE  tb_pedido(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE NOT NULL,
total  decimal(11,2) NOT NULL,
forma_pagamento varchar(50) not null,
informacoes varchar(200), 
id_cliente int not null,
id_funcionario int not null,
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_funcionario) references tb_funcionario (id_funcionario)
);

-- tabela relacionamento pedido/produto
create table tb_itens(
	id_item int primary key auto_increment,
    quantidade decimal(11,2) not null,
    valor_unitario decimal(11,2) not null,
    total decimal(11,2) not null,
    id_produto int not null,
    id_pedido int not null,
    foreign key(id_produto) references tb_produto (id_produto),
    foreign key(id_pedido) references tb_pedido (id_pedido)
    );
    
    select * from tb_cargo;
    select * from tb_itens;

-- INSERIR UM NOVO PEDIDO 
insert into tb_pedido (data_pedido, total, forma_pagamento, informacoes, id_cliente, id_funcionario)
values (current_date(), 0.0, 'DINHEIRO', null, 4, 26); 

select * from tb_cliente;
select * from tb_pedido;
select * from tb_produto;

-- CADASTRAR OS ITENS DO PEDIDO (TB_ITENS)
INSERT INTO tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido )
VALUES (2, 39.00, (quantidade * valor_unitario),7, 1);

INSERT INTO tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido )
VALUES (3, 199.90, (quantidade * valor_unitario), 3, 1);

INSERT INTO tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido )
VALUES (3, 1899.90, (quantidade * valor_unitario), 1, 1);


SELECT p.id_pedido, pr.nome produto, i.quantidade, i.valor_unitario, i.total, p.data_pedido, c.nome cliente, f.nome vendedor
	FROM tb_pedido p JOIN tb_cliente c 
	ON p.id_cliente = c.id_cliente JOIN tb_funcionario f
    ON p.id_funcionario = f.id_funcionario JOIN tb_itens i 
    ON i.id_pedido = p.id_pedido JOIN tb_produto pr
    ON i.id_produto = pr.id_produto; 


-- select do total do pedido 1
SELECT id_pedido, SUM(total) total_pedido
FROM tb_itens;

select p.id_funcionario, f.nome, p.id_pedido
from tb_pedido p JOIN tb_funcionario f
on p.id_funcionario = f.id_funcionario;