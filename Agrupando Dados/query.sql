USE controledegastos;

-- Calcule a média de todas as compras com datas inferiores a 12/05/2013
SELECT AVG(valor) 
FROM compras
WHERE data < '2013-05-12';

-- Calcule a quantidade de compras com datas inferiores a 12/05/2013 e que já foram recebidas
SELECT 
	COUNT(id) AS qntd_de_compras
FROM compras
WHERE recebida = 1 AND data < '2013-05-12';

-- Calcule a soma de todas as compras, agrupadas se a compra foi recebida ou não
SELECT 
	recebida,
    SUM(valor) AS total
FROM compras
GROUP BY recebida;