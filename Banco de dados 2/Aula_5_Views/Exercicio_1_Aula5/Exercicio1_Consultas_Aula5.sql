--Criar visões com:

--1. Os nomes dos fiscais com salário maior do que 10.000,00. 

CREATE VIEW v1_salario AS
SELECT nomfis
FROM fiscal
WHERE salario > 10000.00;

SELECT * FROM v1_salario;

--2. Os nomes dos fiscais com o número de estandes que eles controlam. 

CREATE VIEW v2_fiscais_estandes AS
SELECT f.nomfis, COUNT(e.codfis) AS quantidade
FROM fiscal f
LEFT JOIN estande e
USING (codfis) --ON f.codfis = e.codfis
GROUP BY f.nomfis;

SELECT * FROM v2_fiscais_estandes;

SELECT nomfis, (
	SELECT COUNT(codfis)
	FROM estande
	WHERE fiscal.codfis = estande.codfis
)
FROM fiscal;

--3. Os nomes dos fiscais que não controlam estandes. 

CREATE VIEW v3_fiscais_sem_estande AS
SELECT nomfis
FROM fiscal f
LEFT JOIN estande e
USING(codfis)
GROUP BY f.nomfis
HAVING COUNT(e.codfis) = 0;

SELECT * FROM v3_fiscais_sem_estande;

SELECT nomfis
FROM fiscal f
WHERE NOT EXISTS(
	SELECT 1
	FROM estande e
	WHERE e.codfis = f.codfis
);

SELECT f.codfis, f.nomfis, e.codfis
FROM fiscal f
LEFT JOIN estande e 
USING(codfis)
WHERE e.codfis IS NULL;

--4. Os dados dos produtos que não são vendidos em nenhum estande. 

CREATE VIEW v4 AS
SELECT p.codprod, p.nomprod
FROM produto p
LEFT JOIN vende v
USING(codprod)
GROUP BY p.codprod, p.nomprod
HAVING COUNT(v.codprod) = 0;

SELECT * FROM v4;

SELECT codprod, nomprod
FROM produto p
WHERE NOT EXISTS(
	SELECT 1
	FROM vende v
	WHERE v.codprod = p.codprod
);

SELECT p.codprod, p.nomprod, v.codprod, v.valor
FROM produto p
LEFT JOIN vende v 
USING(codprod)
WHERE v.codprod IS NULL;

--5. Os dados dos estandes que não vendem o produto denominado “produto1”. 

CREATE VIEW v5 AS
SELECT *
FROM estande e
WHERE NOT EXISTS (
    SELECT *
    FROM vende v
    INNER JOIN produto p
    ON v.codprod = p.codprod
    WHERE p.nomprod = 'produto1'
      AND v.codest = e.codest
);

SELECT * FROM v5;

SELECT e.*
FROM estande e
LEFT JOIN vende v
ON e.codest = v.codest
AND v.codprod = (
    SELECT codprod
    FROM produto
    WHERE nomprod = 'produto1'
)
WHERE v.codprod IS NULL;

--6. Os nomes dos produtos com o valor do seu preço médio de venda. 

CREATE VIEW v6 AS
SELECT p.nomprod, AVG(valor) AS preco_medio
FROM produto P
LEFT JOIN vende V
USING(codprod)
GROUP BY nomprod
ORDER BY preco_medio;

SELECT * FROM v6;

SELECT p.nomprod, AVG(valor) AS preco_medio
FROM produto P
INNER JOIN vende V
USING(codprod)
GROUP BY nomprod
ORDER BY preco_medio;

--7. Os dados dos produtos vendidos em mais de 2 estandes. 

CREATE VIEW v7 AS
SELECT p.codprod, p.nomprod, COUNT(v.codest)
FROM produto p
INNER JOIN vende v
USING (codprod)
GROUP BY p.codprod, p.nomprod
HAVING COUNT(v.codest) > 2;

SELECT * FROM v7;

--8. Os nomes dos produtos e os nomes dos estantes que vendem estes produtos. 



--9. Os nomes dos produtos que são vendidos pelo valor mais baixo. 



--10. Os nomes dos produtos vendidos pelos estandes controlados pelo fiscal 
--denominado “fulano”. 

