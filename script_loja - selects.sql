INSERT INTO tb_funcionario(
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

-- mostrar o cargo com o maior salário
select * from tb_cargo order by salario_base desc;

desc tb_funcionario_cargo;
select * from tb_funcionario_cargo;

select * from tb_funcionario;

insert into tb_funcionario_cargo (data_inicio, salario_atual, id_filial, id_cargo, id_funcionario)
values ('2020-10-07', 9800, 2, 5, 27);

INSERT INTO tb_funcionario(
	nome, cpf, data_nascimento, telefone, email, data_admissao, data_demissao
)
VALUES
(
    'Thiago Neves', '12345678900', '1990-03-15', '(11)91234-5678', 'thiago.neves@empresa.com.br', '2018-05-20', NULL
),
(
    'Viviane Sampaio', '23456789011', '1985-12-01', '(21)92345-6789', 'viviane.sampaio@empresa.com.br', '2019-09-10', '2024-01-05' -- Demitida
),
(
    'Felipe Mello', '34567890122', '1993-06-25', '(31)93456-7890', 'felipe.mello@empresa.com.br', '2022-01-17', NULL
),
(
    'Gisele Torres', '45678901233', '1978-08-11', '(41)94567-8901', 'gisele.torres@empresa.com.br', '2017-11-03', NULL
),
(
    'Henrique Dias', '56789012344', '2001-02-09', '(51)95678-9012', 'henrique.dias@empresa.com.br', '2025-02-01', NULL
),
(
    'Isabela Rocha', '67890123455', '1997-04-30', '(61)96789-0123', 'isabela.rocha@empresa.com.br', '2023-07-22', NULL
),
(
    'Júlio César', '78901234566', '1980-10-19', '(71)97890-1234', 'julio.cesar@empresa.com.br', '2015-03-01', '2020-11-30' -- Demitido
),
(
    'Laura Mendes', '89012345677', '1992-11-28', '(81)98901-2345', 'laura.mendes@empresa.com.br', '2024-05-14', NULL
),
(
    'Marcelo Brito', '90123456788', '1975-01-05', '(91)99012-3456', 'marcelo.brito@empresa.com.br', '2016-12-01', NULL
),
(
    'Natália Penha', '01234567899', '1999-07-07', '(11)90123-4567', 'natalia.penha@empresa.com.br', '2024-08-28', NULL
),
(
    'Otávio Lira', '10230456070', '1983-04-12', '(21)91023-4560', 'otavio.lira@empresa.com.br', '2019-01-08', '2023-04-15' -- Demitido
),
(
    'Priscila Nogueira', '21341567181', '1991-09-21', '(31)92134-1567', 'priscila.nogueira@empresa.com.br', '2021-06-03', NULL
),
(
    'Quênia Vasconcelos', '32452678292', '1986-05-18', '(41)93245-2678', 'quenia.vasconcelos@empresa.com.br', '2020-02-10', NULL
),
(
    'Samuel Dantas', '43563789303', '1970-12-04', '(51)94356-3789', 'samuel.dantas@empresa.com.br', '2014-11-10', '2022-07-01' -- Demitido
),
(
    'Tatiana Xavier', '54674890414', '1996-02-29', '(61)95467-4890', 'tatiana.xavier@empresa.com.br', '2025-03-29', NULL
);

-- usando o ASC LIMIT 5 para limitar a quantidade de registros na resposta
SELECT * FROM tb_funcionario ORDER BY nome ASC LIMIT 62; 

-- usando COUNT para registrar o TOTAL de nomes na tb_funcionário
SELECT COUNT(nome) AS total FROM tb_funcionario;
SELECT nome, data_admissao, COUNT(nome) AS total from tb_funcionario where data_admissao > '2019-12-31';
SELECT nome, data_admissao from tb_funcionario where data_admissao > '2019-12-31';


INSERT INTO tb_funcionario_cargo (data_inicio, salario_atual, id_filial, id_cargo, id_funcionario)
VALUES
-- Início: ID 25 a 35
('2023-01-15', 7500.00, 1, 5, 25), -- Programador Pleno
('2020-05-20', 3200.00, 2, 8, 26), -- Técnico de Suporte N1
('2024-11-01', 12500.50, 2, 2, 27), -- Gerente de Projetos de TI
('2019-08-10', 5100.25, 1, 3, 28), -- DBA Júnior
('2022-03-01', 15800.75, 1, 10, 29), -- Eng. de Dados Sênior
('2021-06-25', 6200.90, 2, 7, 30), -- Designer UX/UI
('2025-01-05', 9850.30, 1, 6, 31), -- Programador Sênior
('2018-04-12', 11200.00, 2, 9, 32), -- Especialista em Cibersegurança
('2024-02-29', 9100.60, 1, 4, 33), -- Coordenador de Infraestrutura
('2023-07-19', 4356.78, 2, 1, 34), -- Programador Jr.
('2020-09-30', 1800.00, 1, 11, 35), -- Estagiário em TI

-- Continuação: ID 36 a 46
('2017-01-01', 7600.00, 2, 5, 36),
('2024-05-13', 4100.00, 1, 8, 37),
('2021-02-05', 13000.50, 1, 2, 38),
('2022-10-10', 5500.25, 2, 3, 39),
('2016-11-21', 16000.75, 2, 10, 40),
('2025-03-08', 6800.90, 1, 7, 41),
('2020-12-04', 10100.30, 2, 6, 42),
('2019-04-03', 11500.00, 1, 9, 43),
('2023-08-22', 9300.60, 2, 4, 44),
('2021-07-14', 4800.78, 1, 1, 45),
('2018-03-09', 2100.00, 2, 11, 46),

-- Continuação: ID 47 a 57
('2024-06-18', 8000.00, 1, 5, 47),
('2022-01-27', 3500.00, 2, 8, 48),
('2017-09-01', 14000.50, 1, 2, 49),
('2025-04-16', 5300.25, 2, 3, 50),
('2020-05-06', 17000.75, 1, 10, 51),
('2023-03-17', 6000.00, 2, 7, 52),
('2021-09-08', 9500.00, 1, 6, 53),
('2018-12-05', 10800.00, 2, 9, 54),
('2024-09-24', 8500.00, 1, 4, 55),
('2022-07-07', 4000.00, 2, 1, 56),
('2019-10-28', 2500.00, 1, 11, 57),

-- Fim: ID 58 a 62
('2023-04-05', 7800.00, 2, 5, 58),
('2020-08-11', 3800.00, 1, 8, 59),
('2024-10-30', 13500.00, 2, 2, 60),
('2022-05-19', 5700.00, 1, 3, 61),
('2016-07-22', 17500.00, 2, 10, 62);

select * from tb_funcionario_cargo;
delete from tb_funcionario;

-- listar a tabela funcionario_cargos exibindo o nome do cargo
SELECT tb_funcionario_cargo.id, tb_funcionario_cargo.id_cargo, tb_cargo.nome 
FROM tb_funcionario_cargo, tb_cargo
WHERE tb_funcionario_cargo.id_cargo = tb_cargo.id_cargo;

SELECT * FROM tb_cargo;




