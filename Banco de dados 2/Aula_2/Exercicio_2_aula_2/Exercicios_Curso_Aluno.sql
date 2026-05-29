--1) Retornar os nomes dos alunos que fazem o curso de Administração.

SELECT nome_aluno
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
AND c.nome_curso = 'Administração';

--2) Retornar todos os dados dos alunos. 

SELECT * FROM aluno;

--3) Retornar todos os dados dos cursos. 

SELECT * FROM curso;

--4) Retornar à quantidade de alunos que fazem o curso de Informática. 

SELECT COUNT(*)
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
AND c.nome_curso = 'Informática';

--5) Retornar à quantidade de alunos que fazem o curso de Informática OU Administração. 

SELECT COUNT(*)
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
AND c.nome_curso IN ('Informática', 'Administração');

--6) Retornar à quantidade de alunos que NÃO fazem o curso de Informática OU Administração. 

SELECT COUNT(*)
FROM aluno a
LEFT JOIN curso c ON a.cod_curso = c.cod_curso
WHERE c.nome_curso NOT IN ('Informática', 'Administração')
   OR a.cod_curso IS NULL;

--7) Retornar à quantidade de alunos por curso. 

SELECT c.nome_curso, COUNT(*)
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
GROUP BY c.nome_curso;

--8) Retornar à quantidade de alunos por curso ordenando em ordem crescente pela quantidade de alunos por curso. 

SELECT c.nome_curso, COUNT(*)
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
GROUP BY c.nome_curso
ORDER BY COUNT(*) ASC;

--9) Retornar à quantidade de alunos por curso desde que o curso tenha mais do que 2 alunos. 

SELECT c.nome_curso, COUNT(*)
FROM aluno a, curso c
WHERE a.cod_curso = c.cod_curso
GROUP BY c.nome_curso
HAVING COUNT(*) > 2;

--10) Retornar o nome do curso que tem MAIOR quantidade de alunos. 

SELECT nome_curso
FROM curso
WHERE cod_curso = (
    SELECT cod_curso
    FROM aluno
    GROUP BY cod_curso
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

--11) Retornar o nome do curso que tem MENOR quantidade de alunos. 

SELECT nome_curso
FROM curso
WHERE cod_curso = (
    SELECT cod_curso
    FROM aluno
    WHERE cod_curso IS NOT NULL
    GROUP BY cod_curso
    ORDER BY COUNT(*) ASC
    LIMIT 1
);

--12) Retornar os nomes dos alunos que NÃO fazem nenhum curso no momento. 

SELECT nome_aluno
FROM aluno
WHERE cod_curso IS NULL;

--13) Retornar os nomes dos alunos que fazem algum curso no momento. 

SELECT nome_aluno
FROM aluno
WHERE cod_curso IS NOT NULL;

--14) Alterar o nome do curso TPG para Tecnologia em Processos Gerenciais. 

UPDATE curso
SET nome_curso = 'Tecnologia em Processos Gerenciais'
WHERE nome_curso = 'TPG';

--15) Alterar o nome do curso ADS para Análise e Desenvolvimento de Sistemas. 

UPDATE curso
SET nome_curso = 'Análise e Desenvolvimento de Sistemas'
WHERE nome_curso = 'ADS';

--16) Adicionar o campo (coluna) quant_semestres na tabela curso. 

ALTER TABLE curso
ADD COLUMN quant_semestres INT;

--17) Remover o campo (coluna) quant_semestres na tabela curso. 

ALTER TABLE curso
DROP COLUMN quant_semestres;

--18) Remover o aluno Matheus da tabela aluno pelo código do aluno. 

SELECT * FROM aluno WHERE nome_aluno = 'Matheus';

DELETE FROM aluno
WHERE cod_aluno = 16;

--19) Remover o curso de Comércio da tabela curso. 

DELETE FROM curso
WHERE nome_curso = 'Comércio';

--20) Adicionar o campo (coluna) sexo na tabela aluno. 

ALTER TABLE aluno
ADD COLUMN sexo CHAR(1);

--21) Insira o sexo 'M' ou 'F' de cada aluno da tabela aluno. 

UPDATE aluno SET sexo = 'M' WHERE sexo IS NULL;
UPDATE aluno SET sexo = 'F' WHERE nome_aluno LIKE '%A';

--22) Deletar os registros da tabela aluno. 

DELETE FROM aluno;

--23) Deletar os registros da tabela curso.

DELETE FROM curso;

--24) Deletar a tabela curso.  

DROP TABLE curso;

--25) Deletar a tabela aluno. 

DROP TABLE aluno;