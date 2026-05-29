--Como fazer funções que retornam conjuntos de registros no PostgreSQL

CREATE TABLE pessoa_fisica (
	id_pessoa SERIAL,
	nome VARCHAR(80),
	sobrenome VARCHAR(200),
	sexo CHAR(1),
	cpf CHAR(11),
	PRIMARY KEY(id_pessoa)
);

insert into pessoa_fisica (nome, sobrenome, sexo, cpf) values ('Maria', 'dos Santos', 'F', 11111111111);
insert into pessoa_fisica (nome, sobrenome, sexo, cpf) values ('Joana', 'da Silva', 'F', 22222222222);
insert into pessoa_fisica (nome, sobrenome, sexo, cpf) values ('Pedro', 'da Silveira', 'M', 33333333333);
insert into pessoa_fisica (nome, sobrenome, sexo, cpf) values ('Lucas', 'dos Santos', 'M', 44444444444);
insert into pessoa_fisica (nome, sobrenome, sexo, cpf) values ('João', 'da Costa', 'M', 55555555555); 


-------------------------MUDANDO UM POUCO A TABELA PESSOA_FISICA PARA SE RELACIONAR COM A TABELA DEPARTAMENTO

CREATE TABLE departamento (
	id_depto SERIAL primary key,
	nome_depto varchar(40)
	); 


CREATE TABLE pessoa(
	id_pessoa SERIAL,
	nome_pessoa VARCHAR(80),
	sobrenome VARCHAR(200),
	sexo CHAR(1),
	cpf CHAR(11),
	PRIMARY KEY(id_pessoa),
	id_depto int,
	foreign key (id_depto) references departamento (id_depto)
);

insert into departamento (id_depto, nome_depto) values (1, 'Almoxarifado');
insert into departamento (id_depto, nome_depto) values (2, 'TI');
insert into departamento (id_depto, nome_depto) values (3, 'Ensino');	
insert into departamento (id_depto, nome_depto) values (4, 'Financeiro');

insert into pessoa(nome_pessoa, sobrenome, sexo, cpf, id_depto) values ('Maria', 'dos Santos', 'F', 11111111111, 1);
insert into pessoa(nome_pessoa, sobrenome, sexo, cpf, id_depto) values ('Joana', 'da Silva', 'F', 22222222222, 1);
insert into pessoa(nome_pessoa, sobrenome, sexo, cpf, id_depto) values ('Pedro', 'da Silveira', 'M', 33333333333, 2);
insert into pessoa(nome_pessoa, sobrenome, sexo, cpf, id_depto) values ('Lucas', 'dos Santos', 'M', 44444444444, 3);
insert into pessoa(nome_pessoa, sobrenome, sexo, cpf, id_depto) values ('João', 'da Costa', 'M', 55555555555, 4); 

--TESTANDO CONSULTA COM CRUZAMENTO DE DADOS  

select nome_pessoa, nome_depto
from pessoa, departamento
where departamento.id_depto = pessoa.id_depto; 

--1) Tipo retorno RECORD -- usando apenas uma tabela 

CREATE FUNCTION blog_get_pessoas() RETURNS SETOF RECORD AS $$
BEGIN
	RETURN QUERY SELECT id_pessoa, nome, sobrenome, sexo, cpf FROM pessoa_fisica;
	RETURN; -- não precisa colocar que vai funcionar da mesma forma 
END;
$$ LANGUAGE 'plpgsql';


--FUNCIONOU DESSA FORMA 
SELECT * FROM blog_get_pessoas() AS 
(id_pessoa INTEGER, nome VARCHAR, sobrenome VARCHAR, sexo CHAR(1), cpf CHAR(11));



---TESTANDO COM 2 TABELAS -- usando duas tabelas 

CREATE FUNCTION pessoa_depto() RETURNS SETOF RECORD AS $$
BEGIN
	RETURN QUERY SELECT nome_pessoa, nome_depto
				 from pessoa, departamento
				 where departamento.id_depto = pessoa.id_depto;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR

select * from pessoa_depto() as (nome_pessoa varchar, nome_depto varchar);

--2) TIPO SETOF -- Retornando os campos de uma dada Tabela -- SÓ FUNCIONA PARA UMA TABELA !!!

CREATE FUNCTION blog_get_pessoas2() RETURNS SETOF pessoa_fisica AS $$
BEGIN
	RETURN QUERY SELECT * FROM pessoa_fisica
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR 

SELECT * FROM blog_get_pessoas2();

--3) Funções que Retornam Conjuntos de Registros: Tipo de retorno RETURNS TABLE

--COM 1 TABELA 

CREATE FUNCTION blog_get_pessoas3() RETURNS TABLE (
						   id_pessoa INT,
						   nome VARCHAR,
						   sobrenome VARCHAR,
						   sexo CHAR,
						   cpf CHAR) AS $$
BEGIN
	RETURN QUERY SELECT * FROM pessoa_fisica;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR

SELECT * FROM blog_get_pessoas3();

--COM 2 TABELAS 

CREATE OR REPLACE FUNCTION pessoa_depto2() RETURNS TABLE (
						   nome_pessoa VARCHAR,
						   nome_depto VARCHAR
						   ) AS $$
BEGIN
	RETURN QUERY SELECT pessoa.nome_pessoa, departamento.nome_depto 
				 FROM pessoa, departamento
				 where pessoa.id_depto = departamento.id_depto;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR

SELECT * FROM pessoa_depto2();

--4) Funções que Retornam Conjuntos de Registros: Criando um tipo específico de retorno, o CREATE TYPE

----ASSIM FUNCIONOU -- USANDO APENAS UMA TABELA 

CREATE TYPE type_pessoa_fisica AS (
	id_pessoa INT,
	nome VARCHAR(30),
	sobrenome VARCHAR(30),
	sexo CHAR(1),
	cpf CHAR(11)
);


CREATE FUNCTION blog_get_pessoas4() RETURNS SETOF type_pessoa_fisica AS $$
DECLARE
	dados_pessoa type_pessoa_fisica;
BEGIN
	FOR dados_pessoa IN SELECT id_pessoa, nome, sobrenome, sexo, cpf  FROM pessoa_fisica LOOP
		RETURN NEXT dados_pessoa;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR 

SELECT * FROM blog_get_pessoas4();

SELECT * FROM blog_get_pessoas4() WHERE sexo = 'M'; 

SELECT * FROM blog_get_pessoas4() WHERE sexo = 'M' LIMIT 1; 

SELECT * FROM blog_get_pessoas4() WHERE sexo = 'F';

SELECT * FROM blog_get_pessoas4() WHERE sexo = 'F' LIMIT 1; 

--TESTANDO COM 2 TABELAS 

 CREATE TYPE type_pessoa_depto AS (
	nome_pessoa VARCHAR(80),
	nome_depto VARCHAR(40)
);


CREATE OR REPLACE FUNCTION pessoa_depto3() RETURNS SETOF type_pessoa_depto AS $$
DECLARE
	dados_pessoa type_pessoa_depto;
BEGIN
	FOR dados_pessoa IN SELECT nome_pessoa, nome_depto FROM pessoa, departamento WHERE departamento.id_depto = pessoa.id_depto LOOP
		RETURN NEXT dados_pessoa;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

--TESTAR 

SELECT * FROM pessoa_depto3();

SELECT * FROM pessoa_depto3() where nome_depto = 'Almoxarifado';

SELECT * FROM pessoa_depto3() where nome_depto = 'Almoxarifado' LIMIT 1;