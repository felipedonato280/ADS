-- Script de exemplo para aula sobre Subqueries

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    curso_id INT REFERENCES cursos(id)
);

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    salario NUMERIC,
    departamento VARCHAR(100)
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    valor NUMERIC
);

INSERT INTO cursos (nome) VALUES
('ADS'), ('Sistemas'), ('Engenharia');

INSERT INTO alunos (nome, curso_id) VALUES
('Ana',1),('Bruno',2),('Carla',1);

INSERT INTO funcionarios (nome, salario, departamento) VALUES
('Carlos',5000,'TI'),
('Mariana',7000,'TI'),
('João',4000,'RH');

INSERT INTO clientes (nome) VALUES
('Pedro'),('Lucas'),('Marina');

INSERT INTO pedidos (cliente_id, valor) VALUES
(1,100),(1,200),(3,150);

-- Exemplo Subquery
SELECT nome
FROM alunos
WHERE curso_id = (
    SELECT id FROM cursos WHERE nome='ADS'
);

-- Exemplo EXISTS
SELECT nome
FROM clientes c
WHERE EXISTS (
    SELECT 1 
	FROM pedidos p
    WHERE p.cliente_id = c.id
);