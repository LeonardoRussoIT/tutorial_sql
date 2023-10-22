-- Crie um banco de dados chamado Controle de Gastos
CREATE SCHEMA controledegastos;

-- Crie uma tabela. Ela precisa ter os seguintes campos: id inteiro, 
-- valor número com vírgula, data, observacoes e um booleano para marcar se a 
-- compra foi recebida. A tabela deve-se chamar "compras".
CREATE TABLE compras(
	id INT AUTO_INCREMENT PRIMARY KEY, 
	valor DECIMAL(18,2), 
	data DATE, 
	observacoes VARCHAR(255), 
	recebida TINYINT);

-- Insira valores aleatórios nela
INSERT INTO compras (valor, data, observacoes, recebida)
VALUES 
(200, '2012-02-19', 'Material escolar', 1),
(3500, '2012-05-21', 'Televisao', 0),
(1576.40, '2012-04-30', 'Material de construcao', 1),
(163.45, '2012-12-15', 'Pizza pra familia', 1),
(4780.00, '2013-01-23', 'Sala de estar', 1),
(392.15, '2013-03-03', 'Quartos', 1),
(1203.00, '2013-03-18', 'Quartos', 1),
(402.90, '2013-03-21', 'Copa', 1),
(54.98, '2013-04-12', 'Lanchonete', 0),
(12.34, '2013-05-23', 'Lanchonete', 0),
(78.65, '2013-12-04', 'Lanchonete', 0),
(12.39, '2013-01-06', 'Sorvete no parque', 0),
(98.12, '2013-07-09', 'Hopi Hari', 1),
(2498.0, '2013-01-12', 'Compras de janeiro', 1),
(3212.4, '2013-11-13', 'Compras do mes', 1),
(223.09, '2013-12-17', 'Compras de natal', 1),
(768.90, '2013-01-16', 'Festa', 1),
(827.5, '2014-01-09', 'Festa', 1),
(12.0, '2014-02-19', 'Salgado no aeroporto', 1),
(678.43, '2014-05-21', 'Passagem pra Bahia', 1),
(10937.12, '2014-04-30', 'Carnaval em Cancun', 1),
(1501.0, '2014-06-22', 'Presente da sogra', 0),
(1709.0, '2014-08-25', 'Parcela da casa', 0),
(567.09, '2014-09-25', 'Parcela do carro', 0),
(631.53, '2014-10-12', 'IPTU', 1),
(909.11, '2014-02-11', 'IPVA', 1),
(768.18, '2014-04-10', 'Gasolina viagem Porto Alegre', 1),
(434, '2014-04-01', 'Rodeio interior de Sao Paulo', 0),
(115.90, '2014-06-12', 'Dia dos namorados', 0),
(98, '2014-10-12', 'Dia das crianças', 0),
(253.7, '2014-12-20', 'Natal - presentes', 0),
(370.15, '2014-12-25', 'Compras de natal', 0),
(32.09, '2015-07-02', 'Lanchonete', 1),
(954.12, '2015-11-03', 'Show da Ivete Sangalo', 1),
(98.7, '2015-02-07', 'Lanchonete', 1),
(213.5, '2015-09-25', 'Roupas', 0),
(1245.2, '2015-10-17', 'Roupas', 0),
(23.78, '2015-12-18', 'Lanchonete do Zé', 1),
(576.12, '2015-09-13', 'Sapatos', 1),
(12.34, '2015-07-19', 'Canetas', 0),
(87.43, '2015-05-10', 'Gravata', 0),
(887.66, '2015-02-02', 'Presente para o filhao', 1);

-- Selecione valor e observacoes de todas as compras cuja data seja maior-ou-igual que 15/12/2012.
SELECT 
	valor, 
    observacoes
FROM compras
WHERE data >= '2012-12-15'
ORDER BY id;

-- Qual o comando SQL para juntar duas condições diferentes? Por exemplo, SELECT * FROM TABELA WHERE campo > 1000 campo < 5000. 
SELECT
	*
FROM compras
WHERE valor > 100 AND valor < 500;

-- Selecione todas as compras cuja data seja maior-ou-igual que 15/12/2012 e menor do que 15/12/2014.
SELECT 
	*
FROM compras
WHERE data > '2012-12-15' AND data < '2014-12-15'
ORDER BY id;

-- Selecione todas as compras cujo valor esteja entre R$15,00 e R$35,00 e a observação comece com a palavra 'Lanchonete'.
SELECT 
	*
FROM compras
WHERE valor >= 15 AND valor <= 35 AND observacoes LIKE 'Lanchonete%';

-- Selecione todas as compras que já foram recebidas.
SELECT 
	*
FROM compras
WHERE recebida = 1;

-- Selecione todas as compras que ainda não foram recebidas.
SELECT
	*
FROM compras
WHERE recebida = 0;

-- Selecione todas as compras com valor maior que 5.000,00 ou que já foram recebidas.
SELECT 
	*
FROM compras
WHERE valor >= 5000 OR recebida = 1;