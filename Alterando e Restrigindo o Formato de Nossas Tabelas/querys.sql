USE controledegastos;

-- Vizualizar as informações da tabela (tipo de dado, qual é a PK...)
DESC compras;

-- Podemos inserir valores nulos pois a tabela foi criada sem restrição
INSERT INTO compras (valor, data, observacoes, recebida)
VALUES (2000.20, NULL, 'Lanchonete do Mosca', 1);

-- Verificando valores nulos
SELECT * FROM compras
WHERE data IS NULL;

DELETE FROM compras
WHERE data IS NULL;

-- Agora a coluna DATA não pode mais receber valores nulos
ALTER TABLE compras
MODIFY COLUMN data DATE NOT NULL;

-- Se tentarmos inserir ele nos retorna um erro
INSERT INTO compras (valor, data, observacoes, recebida)
VALUES (2000.20, NULL, 'Lanchonete do Mosca', 1);

-- Podemos também definir valores DEFAULT
ALTER TABLE compras
MODIFY COLUMN recebida TINYINT DEFAULT 0;
-- Agora se não especificarmos o valor que queremos colocar na coluna ele irá
-- preencher automáticamente com o 0

INSERT INTO compras (valor, data, observacoes)
VALUES (125.50, '2023-10-28', 'Headset Redragon');
-- Preencheu automáticamente com o 0


