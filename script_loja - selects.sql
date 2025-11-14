/* INSERT INTO tb_funcionario(
	nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
) 
	VALUES (
		'Rebeca Gomes', '11122233344', '2009-05-06', '(11)99999-5555', 'rebequinhadejesus@gmail.com', '2025-10-10', NULL
    );
    
    
INSERT INTO tb_funcionario (
    nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
) 
VALUES
    ('Rebeca Gomes', '11122233344', '2009-05-06', '(11)99999-5555', 'rebequinhadejesus@gmail.com', '2025-10-10', NULL),
    ('Lucas Andrade', '22233344455', '2001-03-12', '(11)98888-4444', 'lucas.andrade@gmail.com', '2024-07-01', NULL),
    ('Mariana Silva', '33344455566', '1998-09-22', '(21)97777-3333', 'mariana.silva@hotmail.com', '2023-05-15', NULL),
    ('João Pedro Lima', '44455566677', '1995-12-10', '(31)96666-2222', 'joaopedro.lima@gmail.com', '2022-09-20', NULL),
    ('Ana Paula Souza', '55566677788', '2000-07-30', '(41)95555-1111', 'anapaula.souza@gmail.com', '2025-01-10', NULL),
    ('Carlos Eduardo', '66677788899', '1999-11-05', '(61)94444-0000', 'carlos.eduardo@empresa.com', '2023-02-01', NULL),
    ('Fernanda Oliveira', '77788899900', '2002-02-25', '(71)93333-9999', 'fernanda.oli@gmail.com', '2024-03-12', NULL),
    ('Rafael Torres', '88899900011', '1997-06-18', '(81)92222-8888', 'rafael.torres@gmail.com', '2021-11-05', NULL),
    ('Beatriz Lima', '99900011122', '2003-04-08', '(91)91111-7777', 'bia.lima@hotmail.com', '2025-04-15', NULL),
    ('Gustavo Martins', '00011122233', '1996-01-27', '(51)90000-6666', 'gustavo.martins@empresa.com', '2020-06-10', NULL),
    ('Juliana Costa', '12345678901', '1994-08-14', '(85)98888-5555', 'juliana.costa@gmail.com', '2019-10-20', NULL);
*/
-- Listar todos os funcionários
SELECT * FROM tb_funcionario;

-- Deletar o funcionario de id 1
DELETE FROM tb_funcionario WHERE id_funcionario = 1;

-- Deletar o funcionario de id diferente de 1 | "<>" opera apenas números
DELETE FROM tb_funcionario WHERE id_funcionario <> 1;

-- Listar todos os funcionários ordenados pelo nome (ordem crescente)
SELECT * FROM tb_funcionario ORDER BY nome ASC; 

-- Listar todos os funcionários ordenados pelo nome (ordem decrescente)
SELECT * FROM tb_funcionario ORDER BY nome DESC; 

-- Listar todos os funcionários ordenados pela idade (do mais velho pro mais novo)
SELECT * FROM tb_funcionario ORDER BY data_nascimento; 

-- Listar todos os funcionários demitidos
SELECT * FROM tb_funcionario WHERE data_demissao IS NOT NULL; 

-- Listar todos os funcionários demitidos, da demissão mais recente para a mais antiga
SELECT * FROM tb_funcionario 
WHERE data_demissao IS NOT NULL 
ORDER BY data_demissao DESC; 

-- Listar todos os funcionários admitidos na década de 2010 usando 'AND'
SELECT * FROM tb_funcionario 
WHERE data_admissao >= '2010-01-01' AND data_admissao <= '2019-12-31'; 

-- Listar todos os funcionários admitidos na década de 2010 usando 'BETWEEN'
SELECT * FROM tb_funcionario 
WHERE data_admissao BETWEEN '2010-01-01' AND '2019-12-31'; 

-- Listar todos os funcionários admitidos na década de 2010 usando 'BETWEEN', ordenados da mais recente para a mais antiga
SELECT * FROM tb_funcionario 
WHERE data_admissao BETWEEN '2010-01-01' AND '2019-12-31'
ORDER BY data_admissao DESC; 

-- Listar todos os funcionários admitidos na década de 2010 usando 'BETWEEN', ordenaods da mais recente para a mais antiga
-- Mostrando apenas o nome (Nome), data de admissão (contratação) e e-mail (e-mail)
SELECT nome AS 'Nome', data_admissao AS 'Contratação', email AS 'E-mail' FROM tb_funcionario 
WHERE data_admissao BETWEEN '2010-01-01' AND '2019-12-31'; 


-- aula do dia 17/10/2025 

-- inserindo valores na tb_filial ------------------------------

desc tb_filial;

-- definindo campos serem preenchidos com o Insert
insert into tb_filial (data_abertura, cnpj, nome, logradouro, numero, bairro, cidade, uf, cep, email, telefone)
-- informando os valores a serem preenchidos com o values
values('2001-09-23', '1112223333444', 'FILIAL 1', 'Rua Paraná', '500', 'Jardim Europa', 'Jandira', 'SP', 
'00034560', 'filial1@empresa.com', '(11)4567-0987' );

select * from tb_filial;

-- definindo campos serem preenchidos com o Insert
insert into tb_filial (data_abertura, cnpj, nome, logradouro, numero, bairro, cidade, uf, cep, email, telefone)
-- informando os valores a serem preenchidos com o values
values('2009-12-10', '345653467766', 'FILIAL 2', 'Av. Nove de Julho', '235', 'Vila Albertina', 'Cascavel', 'PR', 
'09987654', 'filial2@empresa.com', '(45)5567-2234' );

-- inserindo valores na tb_cargo ----------------------

desc tb_cargo;

insert into tb_cargo (nome, salario_base, cbo)
values('Programador Jr.', 4356.78, '3171-20');

select * from tb_cargo;

/*
insert into tb_cargo (nome, salario_base, cbo, descricao)
values
('Analista de Sistemas Pleno', 7500.00, '2123-10', 'Responsável por análise, projeto e implementação de sistemas de médio porte.'),
('Gerente de Projetos de TI', 12500.50, '1421-20', 'Liderança e gestão de projetos de desenvolvimento de software e infraestrutura.'),
('DBA Júnior', 5100.25, '2123-05', 'Administração básica de banco de dados, backups e monitoramento de performance.'),
('Técnico de Suporte N1', 3200.00, '3171-10', 'Atendimento primário a usuários, resolução de problemas de hardware e software.'),
('Engenheiro de Dados Sênior', 15800.75, '2123-25', 'Design, construção e otimização de arquiteturas de dados de larga escala.'),
('Designer UX/UI', 6200.90, '2624-35', 'Criação de interfaces de usuário focadas na experiência e usabilidade.'),
('Programador Sênior', 9850.30, '3171-15', 'Desenvolvimento de código complexo e revisão de pares, mentoria a juniores.'),
('Especialista em Cibersegurança', 11200.00, '2123-20', 'Implementação de políticas de segurança e monitoramento de vulnerabilidades.'),
('Coordenador de Infraestrutura', 9100.60, '1423-05', 'Supervisão da equipe e da manutenção de servidores, redes e ambientes de cloud.'),
('Estagiário em TI', 1800.00, '2123-30', 'Apoio nas atividades de desenvolvimento e suporte técnico, aprendizado contínuo.');
*/

-- mostrar o cargo com o maior salário
select * from tb_cargo order by salario_base desc;

desc tb_funcionario_cargo;
select * from tb_funcionario_cargo;

select * from tb_funcionario;

-- usando o ASC LIMIT 5 para limitar a quantidade de registros na resposta
SELECT * FROM tb_funcionario ORDER BY nome ASC LIMIT 62; 

-- usando COUNT para registrar o TOTAL de nomes na tb_funcionário
SELECT COUNT(nome) AS total FROM tb_funcionario;
SELECT nome, data_admissao, COUNT(nome) AS total from tb_funcionario where data_admissao > '2019-12-31';
SELECT nome, data_admissao from tb_funcionario where data_admissao > '2019-12-31';

select * from tb_funcionario_cargo;
delete from tb_funcionario;
select * from tb_funcionario;

-- listar a tabela funcionario_cargos exibindo o nome do cargo
SELECT tb_funcionario_cargo.id, tb_funcionario_cargo.id_cargo, tb_cargo.nome 
FROM tb_funcionario_cargo, tb_cargo
WHERE tb_funcionario_cargo.id_cargo = tb_cargo.id_cargo;

-- listar a tabela funcionario_cargos exibindo o nome do funcionário
SELECT tb_funcionario_cargo.id,
 tb_funcionario_cargo.id_funcionario,
 tb_funcionario.nome,
 tb_funcionario.email
FROM tb_funcionario_cargo, tb_funcionario
WHERE tb_funcionario_cargo.id_funcionario = tb_funcionario.id_funcionario
ORDER BY tb_funcionario.nome ASC;

SELECT * FROM tb_cargo;

-- listar a tabela funcionario_cargo exibindo o nome do funcionario 
-- e o cargo atual
SELECT
 fc.id,
 fc.id_funcionario,
 fc.id_cargo,
 f.nome as funcionario,
 c.nome as cargo,
 f.email
FROM tb_funcionario_cargo as fc, tb_funcionario as f, tb_cargo as c
WHERE fc.id_funcionario = f.id_funcionario
AND  fc.id_cargo = c.id_cargo
ORDER BY c.nome ASC;

 SELECT * FROM tb_funcionario_cargo WHERE id = 5 OR id = 2;
 SELECT * FROM tb_funcionario;
 
 SELECT * FROM tb_funcionario_cargo ORDER BY id_funcionario;

DELETE FROM tb_funcionario_cargo WHERE id_funcionario >= 36;
DELETE FROM tb_funcionario WHERE id_funcionario >= 36;

SELECT * FROM tb_funcionario_cargo WHERE id_cargo = 5;

-- somando o valor pago para os funcionários que ocupam o cargo de id 2
SELECT SUM(salario_atual) as gastoComAnalistas 
FROM tb_funcionario_cargo
WHERE id_cargo = 2;

SELECT SUM(salario_atual) as gastoComTecnicos 
FROM tb_funcionario_cargo
WHERE id_cargo = 5;

 -- -- -- -- -- -- -- -- -- -- -- -- aula do dia 24/10/2025 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- usando JOIN ao invés de WHERE em SELECTS

-- listando os cargos e nomes dos funcionários 
SELECT f.id_funcionario , f.nome, fc.id_cargo, c.nome as cargo, fc.salario_atual, fc.data_fim 
FROM tb_funcionario f
JOIN tb_funcionario_cargo fc 
ON f.id_funcionario = fc.id_funcionario
JOIN tb_cargo c
ON c.id_cargo = fc.id_cargo;

-- criação de uma View para listar funcionários e seus cargos
CREATE VIEW view_lista_funcionatios_cargos AS 
	SELECT f.id_funcionario , f.nome, fc.id_cargo, c.nome as cargo, fc.salario_atual, fc.data_fim 
	FROM tb_funcionario f
	JOIN tb_funcionario_cargo fc 
	ON f.id_funcionario = fc.id_funcionario
	JOIN tb_cargo c
	ON c.id_cargo = fc.id_cargo;

-- Executando a view recém criada
SELECT * FROM view_lista_funcionatios_cargos
WHERE salario_atual < 9000
ORDER BY salario_atual ASC;

-- criando uma consulta que mostre o nome do funcionário e dados de endereço

SELECT f.id_funcionario, f.nome, e.logradouro, e.numero, e.bairro, e.cidade, e.cep, e.uf
FROM tb_funcionario f
JOIN tb_endereco_funcionario e
ON f.id_funcionario = e.id_funcionario;

-- criando view do select
CREATE VIEW view_lista_endereco_funcionario AS 
SELECT f.id_funcionario, f.nome, e.logradouro, e.numero, e.bairro, e.cidade, e.cep, e.uf
FROM tb_funcionario f
JOIN tb_endereco_funcionario e
ON f.id_funcionario = e.id_funcionario;



-- Executando a view recém criada
SELECT nome, cidade, uf FROM view_lista_endereco_funcionario;

-- select com LEFT JOIN para encontrar funcionarios sem endereços cadastrados
SELECT f.id_funcionario, f.nome, e.logradouro, e.numero, e.bairro, e.cidade, e.cep, e.uf
FROM tb_funcionario f LEFT JOIN tb_endereco_funcionario e
ON f.id_funcionario = e.id_funcionario
WHERE e.logradouro IS NULL;

-- criando view desse select
CREATE VIEW view_funcionarios_sem_endereco AS
SELECT f.id_funcionario, f.nome, e.logradouro, e.numero, e.bairro, e.cidade, e.cep, e.uf
FROM tb_funcionario f LEFT JOIN tb_endereco_funcionario e
ON f.id_funcionario = e.id_funcionario
WHERE e.logradouro IS NULL;

SELECT * from view_funcionarios_sem_endereco;
 DROP VIEW view_funcionarios_sem_endereco;

 -- comandos auxiliares
SELECT * FROM tb_cargo;
SELECT * FROM tb_funcionario;
SELECT * FROM tb_funcionario_cargo;
SELECT COUNT(id_funcionario) as total FROM tb_funcionario;
SELECT COUNT(id) as total FROM tb_funcionario_cargo; 


update tb_cargo SET nome ='vendedor' where id_cargo = 8;

select * from tb_funcionario_cargo where id_cargo = 8;


-- LISTAR FUNCIONÁRIOS COM SEUS CARGOS
SELECT fc.id_cargo, fc.id_funcionario, f.nome funcionario, c.nome cargo
FROM tb_funcionario_cargo fc JOIN tb_funcionario f 
ON fc.id_funcionario = f.id_funcionario JOIN tb_cargo c
ON fc.id_cargo = c.id_cargo
ORDER BY cargo;


-- ----------- dia 07/11/25:  criando uma trigger entre as tabelas Itens e Pedido -----------------------------------
select * from tb_itens;
select * from tb_pedido;
select * from tb_funcionario;
select * from tb_produto;
delete from tb_itens where id_item = 5;

-- CRIANDO 2° PEDIDO
insert into tb_pedido(data_pedido, total, forma_pagamento, id_cliente, id_funcionario)
values (current_date(), 0.0, 'DINHEIRO', 6, 27);

rollback;

-- FORNECENDO ITENS DO PEDIDO 2
insert into tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido)
values (2, 199.90, (quantidade * valor_unitario), 3, 6);


/*
	CRIAR TRIGGER QUE SERÁ DISPARADA TODA VEZ QUE UM NOVO ITEM FOR CADASTRADO NA TB_ITENS, 
    FAZENDO UM UPDATE DO CAMPO 	'TOTAL' NA TB_PEDIDO
*/

-- DELIMITER: define que o comando acabará em '$$' ao invés de ';'
DELIMITER $$
-- a trigger se inicia DEPOIS que um insert é feito em tb_itens, para cada linha adicionada
CREATE TRIGGER trg_atualiza_total_pedido_insert
AFTER INSERT ON tb_itens
FOR EACH ROW 
BEGIN 
-- declarando variável que receberá o total do pedido 
	DECLARE total_pedido DECIMAL(11,2);
    
    -- somando valor total da tb_itens e 
	-- guardando na variável total_pedido
    SELECT sum(total)
    INTO total_pedido
    FROM tb_itens 
    WHERE id_pedido = NEW.id_pedido;
    
    -- atualizando o total na tb_pedido com o valor obtido na tb_itens
    UPDATE tb_pedido 
    SET total = total_pedido 
    WHERE id_pedido = NEW.id_pedido;
END$$
DELIMITER ; 


/*
	CRIAR TRIGGER QUE SERÁ DISPARADA TODA VEZ QUE UM ITEM FOR DELETADO NA TB_ITENS, 
    FAZENDO UM UPDATE DO CAMPO 	'TOTAL' NA TB_PEDIDO
*/
DELIMITER $$
CREATE TRIGGER trg_atualiza_total_pedido_delete
AFTER DELETE ON tb_itens
FOR EACH ROW 
BEGIN 
	DECLARE total_pedido DECIMAL(11,2);

	
    SELECT ifnull(sum(total), 0)
    INTO total_pedido
    FROM tb_itens 
    WHERE id_pedido = OLD.id_pedido;
    
    UPDATE tb_pedido 
    SET total = total_pedido 
    WHERE id_pedido = OLD.id_pedido;
END$$
DELIMITER ; 



SET AUTOCOMMIT = ON;

-- CRIANDO 3° PEDIDO
insert into tb_pedido(data_pedido, total, forma_pagamento, id_cliente, id_funcionario)
values (current_date(), 0.0, 'DINHEIRO', 6, 26);
commit;
rollback;

-- converter um email para letra minúscula antes do insert
DELIMITER $$
CREATE TRIGGER trg_set_email_lowercase
BEFORE INSERT ON tb_funcionario
FOR EACH ROW 
BEGIN 
    SET NEW.email = lower(new.email);
END$$
DELIMITER ; 

INSERT INTO tb_funcionario(
	nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
) 
	VALUES (
		'Luana Bomfim', '11122233344', '2009-05-06', '(11)99999-5555', 'LUANA@GMAIL.COM', '2025-10-10', NULL
    );
    
    select * from tb_funcionario;
    delete from tb_funcionario where id_funcionario = 91;
    DROP trigger trg_email_lowercase_insert;
    
    -- ------------------------------- 14/11/2025  ----------------------------------------- --
    
    /*
	      Funções de agregação        /    Funções de agrupamento
    - SUM                             /   - GROUP BY : "agrupar por"
    - COUNT                           / 
    - MAX: maior valor                /
    - MIN: menor valor                /
    - AVERAGE: média                  / 
    
    */

-- usando MAX para mostrar o valor mais alto da tbl_produto
select MAX(valor) from tb_produto;

-- -------- mostrar o produto mais caro ordenando pelo valor e limitando o resultado a 1 -------------
select id_produto, nome, valor
	from tb_produto
		order by valor desc
			limit 1;

select count(valor) from tb_produto;
select sum(valor) from tb_produto;

select * from tb_itens;
select * from tb_pedido;
select * from tb_produto;
select * from tb_funcionario;
select * from tb_cargo;
select * from tb_funcionario_cargo;
select * from tb_cliente;

-- ------- vendo o total faturado em $$ de mouses vendidos -----------
select sum(total) from tb_itens where id_produto = 3;
-- ------- total de mouses pedidos ---------------------------
select sum(quantidade) from tb_itens where id_produto = 3;

-- ------- criando novo pedido pro vendedor 27 -------------------
insert into tb_pedido( data_pedido, total, forma_pagamento, id_cliente, id_funcionario )
			  values (current_date(), 0.0, "CRÉDITO", 1, 27);

-- ------- inserindo itens do novo pedido -----------------
insert into tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido)
              values (2, 349.90, (quantidade * valor_unitario), 4, 5) ;
              
insert into tb_itens (quantidade, valor_unitario, total, id_produto, id_pedido)
              values (4, 39.90, (quantidade * valor_unitario), 7, 5) ;
              
-- -------- qual o valor total do pedido 1 --------------------
select sum(total) from tb_itens where id_pedido = 1;

-- ------- atualizar o total do pedido 1 ------------------
update tb_pedido
   set total = (select sum(total) from tb_itens where id_pedido = 1)
	where id_pedido = 1; 
    
-- --------  total de vendas por produto usando ## GROUP BY ## ------------------
select i.id_produto, p.nome, sum(i.total) total_vendido, sum(i.quantidade) quantidade_vendida
 from tb_itens i 
 join tb_produto p 
 on i.id_produto = p.id_produto
 GROUP BY i.id_produto;
 
-- --------  total de vendas por funcionário usando ## GROUP BY ## ------------------
select p.id_funcionario, sum(p.total) total, f.nome, sum(p.total  * 12/100) comissao
from tb_pedido p
join tb_funcionario f
on p.id_funcionario = f.id_funcionario
GROUP BY p.id_funcionario;

-- --------- usando ## LEFT JOIN ## para listar todos os vendedores que nunca efetuaram vendas  ------------

select f.id_funcionario, f.nome, p.id_pedido
from tb_funcionario f LEFT JOIN tb_pedido p
on p.id_funcionario = f.id_funcionario
where p.id_funcionario is null;

-- --------- usando ## LEFT JOIN ## para listar produtos que nunca foram vendidos  ------------
select pr.id_produto, pr.produto
from tb_produto pr LEFT JOIN tb_itens i
on i.id_produto = pr.id_produto
where i.id_produto is null;
