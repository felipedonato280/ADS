--1) Listar os nomes dos alunos.

SELECT Nomaluno FROM aluno;

--2) Listar os nomes e a data de nascimento. 

SELECT Nomaluno, Datanasc FROM aluno;

--3) Listar os nomes e códigos dos alunos com índice de rendimento maior do que 7. 

SELECT Nomaluno, Codaluno FROM aluno WHERE indiceRendimento > 7;

--4) Alterar o nome da aluna Ana para Ana Beatriz. 

UPDATE aluno SET Nomaluno = 'ANA BEATRIZ' WHERE Nomaluno = 'ANA';
SELECT * FROM aluno;

--5) Alterar o índice de rendimento de todos os alunos acrescentando 10%. 

UPDATE aluno SET indiceRendimento = indiceRendimento * 1.1;
SELECT * FROM aluno;

--6) Alterar a data de nascimento da aluna Maria para 30/11/1996. 

UPDATE aluno SET Datanasc = '30/11/1996' WHERE Nomaluno = 'MARIA';
UPDATE aluno SET Datanasc = '1996-11-30' WHERE Nomaluno = 'MARIA';
SELECT * FROM aluno;

--7) Listar os nomes e e-mails dos alunos que nasceram depois de 1990.

SELECT Nomaluno, email FROM aluno WHERE (extract(year from datanasc)>'1990');

--8) Excluir os dados dos alunos com índice de rendimento menor que 6. 

DELETE FROM aluno WHERE indiceRendimento < 6;
SELECT * FROM aluno;

--9) Listar todos os registros da tabela aluno. 

SELECT * FROM aluno;

--10) Mostrar o total de alunos da tabela aluno. 

SELECT COUNT(*) FROM aluno;

--11) Insira a coluna ‘sexo’ do tipo char (1) na tabela aluno. 

ALTER TABLE aluno
ADD COLUMN sexo char(1);

--12) Insira o sexo 'M' ou 'F' de cada aluno da tabela aluno. 

UPDATE aluno SET sexo = 'M' WHERE sexo IS NULL;

UPDATE aluno SET sexo = 'F' WHERE Nomaluno LIKE '%A';

SELECT * FROM aluno;

--13) Mostre o total de alunos do sexo masculino. 

SELECT COUNT(*) FROM aluno WHERE sexo = 'M';

--14) Liste o nome dos alunos do sexo masculino. 

SELECT Nomaluno FROM aluno WHERE sexo = 'M';

--15) Mostre o total de alunos do sexo feminino. 

SELECT COUNT(*) FROM aluno WHERE sexo = 'F';

--16) Liste o nome dos alunos do sexo feminino. 

SELECT Nomaluno FROM aluno WHERE sexo = 'F';

--17) Mostre a soma do índice de rendimento de todos os alunos. 

SELECT SUM(indiceRendimento) FROM aluno;

--18) Mostre a soma do índice de rendimento dos alunos do sexo feminino. 

SELECT SUM(indiceRendimento) FROM aluno WHERE sexo = 'F';

--19) Mostre a soma do índice de rendimento dos alunos do sexo masculino. 

SELECT SUM(indiceRendimento) FROM aluno WHERE sexo = 'M';

--20) Mostre a média do índice de rendimento dos alunos da tabela aluno. 

SELECT AVG(indiceRendimento) FROM aluno;
SELECT indiceRendimento FROM aluno;

-- Tem como calcular na mao, se quiser
SELECT SUM(indiceRendimento) / COUNT(indiceRendimento) FROM aluno;

-- Teste usando o group by
SELECT sexo, AVG(indiceRendimento)
FROM aluno
GROUP BY sexo;

--21) Mostre a média do índice de rendimento dos alunos do sexo feminino. 

SELECT AVG(indiceRendimento) FROM aluno WHERE sexo = 'F';

--22) Mostre a média do índice de rendimento dos alunos do sexo masculino. 

SELECT AVG(indiceRendimento) FROM aluno WHERE sexo = 'M';

--23) Mostrar a maior nota do índice de rendimento considerando todos os alunos. 

SELECT MAX(indiceRendimento) FROM aluno;

-- Mostrando o nome junto, com subconsulta

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno);

--24) Mostrar a menor nota do índice de rendimento considerando todos os alunos. 

SELECT MIN(indiceRendimento) FROM aluno;

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno);

--25) Mostrar a maior e a menor nota do índice de rendimento dos alunos do sexo masculino. 

SELECT MAX(indiceRendimento), MIN(indiceRendimento) FROM aluno WHERE sexo = 'M';

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE sexo = 'M'
AND (
	indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno WHERE sexo = 'M')
	or
	indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno WHERE sexo = 'M')
);

--26) Mostrar a maior e menor nota do índice de rendimento dos alunos do sexo feminino. 

SELECT MAX(indiceRendimento), MIN(indiceRendimento)
FROM aluno
WHERE sexo = 'F';

SELECT Nomaluno, indiceRendimento
FROM aluno
WHERE sexo = 'F'
AND (
    indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno WHERE sexo = 'F')
    OR
    indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno WHERE sexo = 'F')
);

--27) Mostrar o nome do aluno com maior índice de rendimento.  

SELECT Nomaluno
FROM aluno
WHERE indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno);

--28) Mostrar o nome do aluno com menor índice de rendimento. 

SELECT Nomaluno
FROM aluno
WHERE indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno);

--29) Mostrar os nomes dos alunos que tenham o menor e o maior índice de rendimento, respectivamente. 

SELECT Nomaluno
FROM aluno
WHERE indiceRendimento = (SELECT MIN(indiceRendimento) FROM aluno)
	OR indiceRendimento = (SELECT MAX(indiceRendimento) FROM aluno);

--30) Mostrar os nomes dos alunos juntamente com o menor e o maior índice de rendimento, respectivamente. 

SELECT
Nomaluno,
indiceRendimento,
(SELECT MIN(indiceRendimento) FROM aluno) AS MenorIndice,
(SELECT MAX(indiceRendimento) FROM aluno) AS MaiorIndice
FROM aluno;