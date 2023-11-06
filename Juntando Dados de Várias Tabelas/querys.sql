USE controledegastos;

CREATE TABLE compradores (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200),
endereco VARCHAR(200),
telefone VARCHAR(30)
);

INSERT INTO compradores (nome, endereco, telefone) VALUES 
('Alex Felipe', 'Rua Vergueiro, 3185', '5571-2751');

INSERT INTO compradores (nome, endereco, telefone) VALUES 
('João da Silva', 'Av. Paulista, 6544', '2220-4156');

ALTER TABLE compras
ADD COLUMN id_compradores INT;

UPDATE compras SET id_compradores = 1 WHERE id < 22;

UPDATE compras SET id_compradores = 2 WHERE id > 21;

SELECT * FROM compras;
SELECT * FROM compradores;

-- De o join onde os valores da coluna <id_compradores> (FOREIGN KEY) da tabela ""compras"" 
-- for igual ao valor da coluna <id> da tabela ""compradores""
SELECT * FROM compras 
JOIN compradores ON compras.id_compradores = compradores.id;

-- Restringimos agora e só podemos adicionar um id_compradores se na tabela compradores existir este id
-- Ou seja, não permitimos a inserção de compradores inexistentes
ALTER TABLE compras 
ADD CONSTRAINT fk_compradores FOREIGN KEY (id_compradores) REFERENCES compradores (id);

INSERT INTO compras (valor, data, observacoes, recebida, id_compradores)
VALUES (
	1000.40, '2023-11-06', 'processador novo', 1, 2
);

SELECT * 
FROM compras
JOIN compradores
ON compras.id_compradores = compradores.id
WHERE observacoes = 'processador novo';


---------- Exercícios ----------



-- Crie a tabela compradores com id, nome, endereco e telefone.
CREATE TABLE compradores (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200),
endereco VARCHAR(200),
telefone VARCHAR(30)
);

-- Insira os compradores, Alex Felipe e João da Silva.
INSERT INTO compradores (nome, endereco, telefone) 
VALUES ('Alex Felipe', 'Rua Vergueiro, 3185', '5571-2751');

INSERT INTO compradores (nome, endereco, telefone) 
VALUES ('João da Silva', 'Av. Paulista, 6544', '2220-4156');

-- Adicione a coluna id_compradores na tabela compras e defina a chave estrangeira (FOREIGN KEY) referenciando o id da tabela compradores.
ALTER TABLE compras
ADD COLUMN id_compradores INT;

ALTER TABLE compras 
ADD CONSTRAINT fk_compradores FOREIGN KEY (id_compradores) REFERENCES compradores (id);

-- Atualize a tabela compras e insira o id dos compradores na coluna id_compradores.
SELECT * FROM compras 
JOIN compradores ON compras.id_compradores = compradores.id;

-- Exiba o NOME do comprador e o VALOR de todas as compras feitas antes de 09/08/2014.
SELECT 
	compradores.nome,
    compras.valor
FROM compras
JOIN compradores
ON compras.id_compradores = compradores.id
WHERE data < '2014-08-09';

-- Exiba todas as compras do comprador que possui ID igual a 2.
SELECT * FROM compras
WHERE id_compradores = 2;

-- Exiba todas as compras (mas sem os dados do comprador), cujo comprador tenha nome que começa com 'GUILHERME'.
INSERT INTO compradores (nome, endereco, telefone)
VALUES ('Guilherme Pereira', 'Av. Faria Lima, 321', '5140-9321');

INSERT INTO compras (valor, data, observacoes, recebida, id_compradores)
VALUES (130.50, '2023-11-06', 'Chinelo da Nike', 0, 3);

SELECT 
		compras.id,
        compras.valor,
        compras.data,
        compras.observacoes,
        compras.recebida,
        compras.id_compradores
FROM compras
JOIN compradores ON compras.id_compradores = compradores.id
WHERE compradores.nome LIKE 'GUILHERME%';

-- Exiba o nome do comprador e a soma de todas as suas compras.
SELECT 
	compradores.nome,
    SUM(compras.valor)
FROM compras
JOIN compradores ON compras.id_compradores = compradores.id
GROUP BY compradores.nome;

-- Crie uma coluna chamada "forma_pagto" do tipo ENUM e defina os valores: 'BOLETO' e 'CREDITO'.
ALTER TABLE compras
ADD COLUMN forma_pagto ENUM('BOLETO', 'CREDITO');

-- Adicione as formas de pagamento para todas as compras por meio da instrução UPDATE.
UPDATE compras
SET forma_pagto = 'CREDITO'
WHERE id < 24;

UPDATE compras
SET forma_pagto = 'BOLETO'
WHERE id >= 24;
