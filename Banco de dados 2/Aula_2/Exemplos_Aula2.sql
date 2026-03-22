--Uso do comando between e not between serve para verificar um intervalo

SELECT Nomaluno
FROM Aluno
WHERE indicerendimento between 5 and 7

SELECT Nomaluno
FROM Aluno
WHERE indicerendimento not between 5 and 7

--Uso do comando like

-- O % determina onde sera a busca
-- C% palavras que começam com c
-- %a% palavras que tenham a no meio
-- %S palavras que terminem com S

-- O _ substitui caracteres, pode ser usado para filtrar palavras com determinadas quantidades de caracteres

SELECT Nomaluno
FROM ALUNO
Where Nomaluno LIKE 'M%';

SELECT Nomaluno
FROM ALUNO
Where Nomaluno LIKE 'M____';

SELECT Nomaluno
FROM ALUNO
Where Nomaluno LIKE '%A%';

SELECT Nomaluno
FROM ALUNO
Where Nomaluno LIKE '%O';

SELECT Nomaluno
FROM ALUNO
Where Nomaluno LIKE '____A';

-- Uso do comando IN

SELECT Nomaluno
FROM ALUNO
WHERE Indicerendimento IN (8.45 , 9.03)

SELECT Nomaluno
FROM ALUNO
WHERE Indicerendimento NOT IN (8.45 , 9.03)

-- Uso do IS NULL e IS NOT NULL

INSERT INTO aluno (Nomaluno,Datanasc,cpf,email) VALUES ('PEDRO', '2005/12/20','99999999999','joao@gmail.com');
SELECT * FROM aluno ORDER BY Codaluno ASC;

SELECT Nomaluno FROM aluno WHERE indiceRendimento IS NULL;
SELECT Nomaluno FROM aluno WHERE indiceRendimento IS NOT NULL;

-- Uso do MIN e MAX

SELECT MIN(indiceRendimento), MAX(indiceRendimento) FROM aluno;

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno)

UNION ALL

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno);

-- Uso do SUM soma

SELECT SUM(indiceRendimento) FROM aluno;

-- Uso do AVG media

SELECT AVG(indiceRendimento) FROM aluno;

-- Uso de aliases apelidos (AS)

SELECT Nomaluno AS Nome_do_aluno FROM aluno;
SELECT Nomaluno Nome_do_aluno FROM aluno;

SELECT SUM(indiceRendimento) AS Soma_dos_indices FROM aluno;
SELECT SUM(indiceRendimento) FROM aluno;

SELECT a.Nomaluno, a.Codaluno
From aluno AS a;
