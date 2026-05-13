SELECT * FROM cursos

SELECT * FROM alunos

SELECT * FROM funcionarios

SELECT * FROM clientes

SELECT * FROM pedidos

-- Exercício 1 Liste os nomes dos alunos que pertencem ao curso 'ADS'. Utilize uma subconsulta.

SELECT nome FROM alunos WHERE curso_id = 1

SELECT nome
FROM alunos
WHERE curso_id = (SELECT id FROM cursos WHERE nome = 'ADS');

-- Exercício 2 Liste os funcionários que possuem salário acima da média salarial da empresa. Utilize uma subconsulta escalar.

SELECT *
FROM funcionarios
WHERE salario > (SELECT AVG (salario) FROM funcionarios);

-- Exercício 3 Liste os clientes que possuem pelo menos um pedido. Utilize EXISTS.



-- Exercício 4 Reescreva o exercício 1 utilizando JOIN em vez de subconsulta.

