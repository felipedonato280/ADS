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