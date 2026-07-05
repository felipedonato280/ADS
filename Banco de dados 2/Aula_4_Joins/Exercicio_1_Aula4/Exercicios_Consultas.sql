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

--3)Listar somente os clientes que fizeram compras e quais foram estas compras. 

--PRODUTO CARTESIANO (CRUZAMENTO ENTRE PK E FK NA CLÁUSULA WHERE) 

select * 
from cliente, compras 
where cliente.id_cliente = compras.id_cliente;

--TIPOS DE JUNÇÃO QUE FAZEM O EQUIVALENTE AO PRODUTO CARTESIANO (CRUZAMENTO ENTRE PK E FK NA CLÁUSULA WHERE -- DESSA FORMA VAI OBTER UM SUBCONJUNTO DO PRODUTO CARTESIANO)

--EQUIJUNÇÃO OU JUNÇÃO IDÊNTICA OU JUNÇÃO EQUIVALENTE 

select * 
from cliente 
join compras 
using (id_cliente);  

--JUNÇÃO INTERNA = INNER JOIN 

select * 
from cliente 
inner join compras 
on cliente.id_cliente = compras.id_cliente; 

select * 
from cliente 
inner join compras 
using (id_cliente);  

--NATURAL JOIN 

select * 
from cliente 
natural join compras; 

--NATURAL INNER JOIN 

select * 
from cliente 
natural inner join compras; 

--JUNÇÃO THETA 

select * 
from cliente 
join compras 
on cliente.id_cliente = compras.id_cliente; 

select * 
from cliente 
join compras 
on (cliente.id_cliente = compras.id_cliente); 

--4) Listar somente os nomes dos clientes que NÃO fizeram compras. 

SELECT nome_cliente
FROM cliente
WHERE id_cliente NOT IN(
	SELECT id_cliente
	FROM compras
	WHERE id_cliente IS NOT NULL
);

SELECT c.nome_cliente
FROM cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM compras co
    WHERE co.id_cliente = c.id_cliente
);

--5) Listar somente os nomes das compras que NÃO foram adquiridas pelos clientes. 

SELECT nome_compra
FROM compras
WHERE id_cliente IS NULL;

--6) Listar o nome da compra de maior preço.   

SELECT nome_compra
FROM compras
WHERE preco = (
	SELECT MAX(preco)
	FROM compras
);

--7) Listar o nome da compra de menor preço. 

SELECT nome_compra
FROM compras
WHERE preco = (
	SELECT MIN(preco)
	FROM compras
);

--8) Listar os nomes e o preço das compras que são maiores ou iguais a R$ 1000 reais e 
--menores ou iguais a R$ 1500 reais.

SELECT nome_compra, preco
FROM compras
WHERE preco >= 1000 AND preco <= 1500;

-- Realizar as seguintes consultas SQL aplicando o tipo de junção (join) apropriado. 

--9) Listar somente os clientes que fizeram compras e quais foram estas compras. 

SELECT nome_cliente, nome_compra
FROM cliente
INNER JOIN compras
ON cliente.id_cliente = compras.id_cliente;

--10) Listar todos os clientes independente se fizeram ou não compras. 

SELECT nome_cliente, nome_compra
FROM cliente
LEFT JOIN compras
ON cliente.id_cliente = compras.id_cliente;

--11) Listar todas as compras independente se tal compra foi ou ainda não foi comprada 
--por algum cliente. 

SELECT nome_cliente, nome_compra
FROM cliente
RIGHT JOIN compras
ON cliente.id_cliente = compras.id_cliente;

SELECT nome_cliente, nome_compra
FROM compras
LEFT JOIN cliente
ON compras.id_cliente = cliente.id_cliente;

--12) Listar todos os clientes que NÃO fizeram nenhuma compra. 

SELECT nome_cliente, nome_compra
FROM cliente
LEFT JOIN compras
ON cliente.id_cliente = compras.id_cliente
WHERE compras.id_cliente IS NULL;

--13) Listar todas as compras que NÃO foram adquiridas pelos clientes. 

SELECT nome_cliente, nome_Compra
FROM cliente
RIGHT JOIN compras
ON cliente.id_cliente = compras.id_cliente
WHERE cliente.id_cliente IS NULL;

SELECT nome_cliente, nome_compra
FROM compras
LEFT JOIN cliente
ON compras.id_cliente = cliente.id_cliente
WHERE cliente.id_cliente IS NULL;

--14) Listar todos os clientes e todas as compras independente se um cliente adquiriu ou 
--não alguma compra. 

SELECT nome_cliente, nome_compra
FROM cliente
FULL JOIN compras
ON cliente.id_cliente = compras.id_cliente;

--15) Listar todos os clientes que NÃO compraram nada e todas as compras que NÃO foram 
--adquiridas pelos clientes. 

SELECT nome_cliente, nome_compra
FROM cliente
FULL JOIN compras
ON cliente.id_cliente = compras.id_cliente
WHERE cliente.id_cliente IS NULL
   OR compras.id_cliente IS NULL;