--Função em que retorna-se todos os clientes que fazem aniversário no dia. 
--Utilizando current_date obtém-se a data atual do sistema:

create table clientes (
cod serial not null,
nome varchar(50),
data_niver date,
primary key(cod));
    
select * from clientes;

insert into clientes (nome,data_niver) values ('pedro',current_date); 
insert into clientes (nome,data_niver) values ('joão',current_date); 
insert into clientes (nome,data_niver) values ('maria',current_date); 

set datestyle to postgres, DMY;
select * from clientes;

CREATE FUNCTION aniversariantes() RETURNS SETOF clientes 
AS $$
BEGIN
	RETURN QUERY SELECT * FROM clientes WHERE data_niver = current_date;
	RETURN;
END;
$$ LANGUAGE 'plpgsql'; 

--Testar 
select * from aniversariantes();
select nome from aniversariantes(); 

--Exemplos Funções no PostgreSQL

--Ex1: Função que incrementa o valor passado por parâmetro em 1. 
CREATE OR REPLACE FUNCTION increment(i INT) RETURNS INT 
AS $$
    BEGIN
      RETURN i + 1;
    END;
$$ LANGUAGE plpgsql;

--Testar: 
SELECT increment(11);

--VARIAÇÕES DA QUESTÃO 1  
--Ex1.1: Função que incrementa o valor passado por parâmetro em 1. USANDO A FUNÇÃO ROUND 
-- Passando por parâmetro valor ponto flutuante e retornando um valor inteiro arredondando para cima ou para baixo dependendo do valor do resultado.    
CREATE OR REPLACE FUNCTION increment(i float) RETURNS INT 
AS $$
    BEGIN
      RETURN round (i + 1);
    END;
$$ LANGUAGE plpgsql;

--Testar: 
SELECT increment(11); 

--FUNÇÃO ROUND 
--Ex: USANDO A FUNÇÃO ROUND COM CASAS DECIMAIS 

select round (10.812,2);


--Testar: 
SELECT increment(11); 

--Ex1.2: Função que incrementa o valor passado por parâmetro em 1. USANDO A FUNÇÃO CEIL  
-- Passando por parâmetro valor ponto flutuante e retornando um valor inteiro arredondando para cima o valor do resultado.   

CREATE OR REPLACE FUNCTION increment(i float) RETURNS INT 
AS $$
    BEGIN
      RETURN ceil (i + 1);
    END;
$$ LANGUAGE plpgsql;


--Ex1.3: Função que incrementa o valor passado por parâmetro em 1. USANDO A FUNÇÃO FLOOR  
-- Passando por parâmetro valor ponto flutuante e retornando um valor inteiro arredondando para baixo o valor do resultado.   

CREATE OR REPLACE FUNCTION increment(i float) RETURNS INT 
AS $$
    BEGIN
      RETURN floor (i + 1);
    END;
$$ LANGUAGE plpgsql;

--Ex1.4: Passando dois valores por parâmetro e arredondando para cima ou para baixo a soma dos valores usando a função round.   
--FUNÇÃO ROUND - PODE ARREDONDAR PRA CIMA OU PRA BAIXO, VAI DEPENDER DO VALOR. 
CREATE OR REPLACE FUNCTION soma (n1 numeric, n2 numeric) RETURNS INT 
AS $$
  BEGIN
    RETURN round(n1+n2);
  END;
$$ LANGUAGE plpgsql;
--Testar: 
select soma(2.0,2.7);

--Ex1.5: Passando dois valores por parâmetro e arredondando para cima a soma dos valores usando a função ceil. 
--FUNÇÃO CEIL - ARREDONDAR PRA CIMA
CREATE OR REPLACE FUNCTION soma (n1 numeric, n2 numeric) RETURNS INT 
AS $$
  BEGIN
    RETURN ceil(n1+n2);
  END;
$$ LANGUAGE plpgsql;
--Testar: 
select soma(2.0,2.1);

--Ex1.6: Passando dois valores por parâmetro e arredondando para baixo a soma dos valores usando a função floor. 
--FUNÇÃO FLOOR - ARREDONDAR PRA BAIXO
CREATE OR REPLACE FUNCTION soma (n1 numeric, n2 numeric) RETURNS INT 
AS $$
  BEGIN
    RETURN floor(n1+n2);
  END;
$$ LANGUAGE plpgsql;
--Testar: 
select soma(2.0,2.9);

https://stackoverflow.com/questions/3157753/declare-local-variables-in-postgresql
--EXTRA: Função que soma dois valores setando os valores de forma fixa

CREATE OR REPLACE FUNCTION somefuncname() RETURNS int LANGUAGE plpgsql AS $$
DECLARE
  one int;
  two int;
BEGIN
  one := 1;
  two := 2;
  RETURN one + two;
END
$$;

SELECT somefuncname();

----Função que soma alguns valores setando os valores de forma fixa

CREATE FUNCTION my_func()
RETURNS INT
AS $$
DECLARE
  value1 INT := 1; -- Here
  value2 INT = 2; -- Here
  value3 INT DEFAULT 3; -- Here
  value4 CONSTANT INT := 4; -- Here
  value5 INT; -- Here
BEGIN
  RETURN value1 + value2 + value3;
END;
$$ LANGUAGE plpgsql;

SELECT my_func();

--Ex2: Função que recebe dois valores inteiros e retorna o resultado da soma dos valores.

CREATE OR REPLACE FUNCTION soma (n1 INTEGER, n2 INTEGER) RETURNS INT 
AS $$
  BEGIN
    RETURN n1+n2;
  END;
$$ LANGUAGE plpgsql;
--Testar: 
select soma(2,2);


--Ex3: Função que recebe dois valores numéricos e retorna a média aritmética dos valores (USANDO 2 VALORES).  

CREATE OR REPLACE FUNCTION media (n1 numeric, n2 numeric) RETURNS numeric 
AS $$
DECLARE result real;
  BEGIN
    result := (n1+n2)/2;
    RETURN result;
  END;
$$ LANGUAGE plpgsql;

--Testar: 
select media(5,7) 
select media(4,7)

--Ex3: Função que recebe três valores numéricos e retorna a média aritmética dos valores (USANDO 3 VALORES).  

CREATE OR REPLACE FUNCTION media (n1 numeric, n2 numeric, n3 numeric) RETURNS numeric 
AS $$
DECLARE result real;
  BEGIN
    result := (n1+n2+n3)/3;
    RETURN result;
  END;
$$ LANGUAGE plpgsql;
--Testar: 
select media(8,9,10)

--Ex4: Função para contar o número de registros de uma tabela.

create table livro (
id_livro serial not null, 
nome_livro varchar(50), 
preco_livro numeric (5,2), 
primary key(id_livro)); 

insert into livro (nome_livro,preco_livro) values ('redes de computadores', 100);
insert into livro (nome_livro,preco_livro) values ('banco de dados', 200);
insert into livro (nome_livro,preco_livro) values ('algoritmos', 300);
insert into livro (nome_livro,preco_livro) values ('engenharia de software', 400);
insert into livro (nome_livro,preco_livro) values ('circuitos digitais', 250);

--ATENÇÃO! COMO USAR A FUNÇÃO DE AGREGAÇÃO COUNT NAS FUNÇÕES (FUNCTIONS) NO SGBD POSTGRESQL! 
--ATENÇÃO! COM A CONSULTA DE FORMA DIRETA COMO ESTAVAMOS ACOSTUMADOS A FAZER EM SQL, NÃO FUNCIONA!!!
--SQL: SELECT COUNT(*) FROM LIVRO  

--Opção 1
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
DECLARE total integer;
BEGIN
total:= (select count(*) from livro);
RETURN total;
END;
$$ LANGUAGE plpgsql; 

--Opção 2
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
DECLARE total integer := (select count(*) from livro);
BEGIN
RETURN total;
END;
$$ LANGUAGE plpgsql; 

--Opção 3
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
BEGIN
RETURN (select count(*) from livro);
END;
$$ LANGUAGE plpgsql; 

--Testar: 
select total(); 

---OUTRAS FORMAS/MANEIRAS DE TAMBÉM FAZER A CONSULTA COM A FUNÇÃO DE AGREGAÇÃO COUNT NAS FUNÇÕES (FUNCTIONS) NO SGBD POSTGRESQL!  
--OPÇÃO 1 
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
DECLARE total integer;
BEGIN
select count(*) into total from livro;
RETURN total;
END;
$$ LANGUAGE plpgsql; 

--Testar: 
select total(); 

--OPÇÃO 2 
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
BEGIN
RETURN count(*) from livro;
END;
$$ LANGUAGE plpgsql; 
--Testar: 
select total(); 

--OPÇÃO 3 
CREATE OR REPLACE FUNCTION total() RETURNS integer 
as $$
DECLARE total integer := count(*) from livro;
BEGIN
RETURN total;
END;
$$ LANGUAGE plpgsql; 

select total(); 

--ATENÇÃO: FORMAS DE RESOLVER AGORA USANDO A LINGUAGEM SQL "PURA"!!!  

--OPÇÃO 4 -- USANDO UM PARSE PARA FORÇAR A RESPOSTA DO SELECT EM INTEGER PARA FICAR DE ACORDO COM O QUE DEFINI NO TIPO DE RETORNO DA MINHA FUNÇÃO. 
--ALÉM DISSO, OBSERVE QUE DESSA MANEIRA AQUI ESTOU USANDO A LINGUAGEM SQL SEM BLOCO BEGIN E END COMO USAMOS NA LINGUAGEM PLPGSQL!   
CREATE OR REPLACE FUNCTION total() RETURNS integer 
AS $$
SELECT count(*)::int FROM livro;
$$  
LANGUAGE sql;

select total(); 

--OPÇÃO 5 -- USANDO O TIPO DE RETORNO DA FUNÇÃO COMO BIGINT, DESSA FORMA NÃO PRECISO FAZER O PARSE NO SELECT!  
CREATE OR REPLACE FUNCTION total() RETURNS bigint 
AS $$
SELECT count(*) FROM livro;
$$  
LANGUAGE sql;

select total(); 


--FUNÇÃO PARA INSERIR - EQUIVALENTE AO INSERT 
--Ex5: Função que insere um novo registro na tabela cliente e retorna o boolean true quando o registro é inserido corretamente na tabela cliente.   

create table cliente (
cod_cli integer not null,
nome varchar(30),
sobrenome varchar(30),
tel varchar(30),
primary key (cod_cli)
);

CREATE OR REPLACE FUNCTION inserir_cli (cd integer, nom varchar(30), sbn varchar(30), t varchar(30)) RETURNS boolean 
as $$ 
BEGIN 
  insert into cliente values ($1, $2, $3, $4);
  RETURN true;
END;
$$ LANGUAGE plpgsql;

select inserir_cli (123, 'João', 'Almeida', '123456789');

--FUNÇÃO PARA ATUALIZAR - EQUIVALENTE AO UPDATE 
--Ex6: Função para atualizar o campo telefone da tabela cliente. 
--Recebe dois parâmetros de entrada, o primeiro parâmetro correspondendo a quem eu quero atualizar e o segundo parâmetro o novo número de telefone que vou atualizar.

CREATE OR REPLACE FUNCTION atualiza_telefone (x integer, t varchar(30)) RETURNS boolean 
as $$ 
BEGIN
update cliente set "tel"=$2 where "cod_cli"=$1;  
RETURN true;
END;
$$ LANGUAGE plpgsql;

--Testar: 
select atualiza_telefone(1,'222222222');
select * from cliente;

--FUNÇÃO PARA DELETAR - EQUIVALENTE AO DELETE 
--Recebe um parâmetro de entrada correspondendo ao cliente que eu quero deletar. 
--Ex7: Função que deleta um cliente. 

CREATE OR REPLACE FUNCTION delete_cli (cd integer) RETURNS boolean 
as $$ 
BEGIN 
  delete from cliente where "cod_cli" = $1;
  RETURN true;
END;
$$ LANGUAGE plpgsql;

--Testar: 
select delete_cli (2)