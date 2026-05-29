-- Realizar as seguintes consultas SQL aplicando o produto cartesiano (cruzamento de 
-- chave primária e chave estrangeira na cláusula WHERE).

--1) Listar todos os clientes. 

SELECT * FROM cliente;

--2) Listar todas as compras. 

SELECT * FROM compras;

--3) Listar somente os clientes que fizeram compras e quais foram estas compras. 

SELECT nome_cliente, nome_compra
FROM cliente, compras
WHERE cliente.id_cliente = compras.id_cliente;

SELECT id_cliente, nome_compra
FROM compras
WHERE id_cliente IN (
	SELECT id_cliente
	FROM cliente
);

SELECT (
	SELECT nome_cliente
	FROM cliente
	WHERE cliente.id_cliente = compras.id_cliente) AS nome_cliente,
nome_compra
FROM compras
WHERE id_cliente IS NOT NULL;

--4) Listar somente os nomes dos clientes que NÃO fizeram compras. 



--5) Listar somente os nomes das compras que NÃO foram adquiridas pelos clientes. 



--6) Listar o nome da compra de maior preço.   



--7) Listar o nome da compra de menor preço. 



--8) Listar os nomes e o preço das compras que são maiores ou iguais a R$ 1000 reais e 
--menores ou iguais a R$ 1500 reais.



-- Realizar as seguintes consultas SQL aplicando o tipo de junção (join) apropriado. 



--9) Listar somente os clientes que fizeram compras e quais foram estas compras. 

SELECT nome_cliente, nome_compra
FROM compras
INNER JOIN cliente
ON compras.id_cliente = cliente.id_cliente;

--10) Listar todos os clientes independente se fizeram ou não compras. 



--11) Listar todas as compras independente se tal compra foi ou ainda não foi comprada 
--por algum cliente. 



--12) Listar todos os clientes que NÃO fizeram nenhuma compra. 



--13) Listar todas as compras que NÃO foram adquiridas pelos clientes. 



--14) Listar todos os clientes e todas as compras independente se um cliente adquiriu ou 
--não alguma compra. 



--15) Listar todos os clientes que NÃO compraram nada e todas as compras que NÃO foram 
--adquiridas pelos clientes. 

