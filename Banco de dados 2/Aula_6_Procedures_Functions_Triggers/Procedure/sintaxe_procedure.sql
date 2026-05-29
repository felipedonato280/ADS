--SINTAXE PARA CRIAR PROCEDIMENTOS ARMAZENADOS (STORED PROCEDURES OU SIMPLESMENTE PROCEDURES) NO POSTGRESQL USANDO O CONCEITO DE PROCEDURE DE FATO!  

-- Procedures são blocos de código que executam alguma ação dentro do banco de dados. 

/*

create or replace procedure nome_procedure (parametros)
language plpgsql 
as $$
declare 
	declaracao de variaveis;
begin 
	corpo do código;
end $$;

--OU MOSTRANDO DE UMA OUTRA FORMA A SINTAXE COM O DELIMITADOR DE INICIO E FIM CADA UM EM UMA LINHA

create or replace procedure nome_procedure (parametros)
language plpgsql 
as 
$$
declare 
	declaracao de variaveis;
begin 
	corpo do código;
end 
$$ ;

create or replace procedure nome_procedure (parametros)
as $$
declare 
	declaracao de variaveis;
begin 
	corpo do código;
end;
$$ language plpgsql; 


*/
--PASSO A PASSO COM EXEMPLOS 
--Tabela de exemplo 

create table contas (
	id int primary key,
	nome varchar(100),
	saldo decimal
	); 
	
select * from contas; 
    
insert into contas (id, nome, saldo) 
values (1,'Ana', 5000);
	
insert into contas (id, nome, saldo) 
values (2,'Bruno', 10000);

select * from contas; 

--Exercício: Crie uma procedure que registra uma transação financeira realizada entre dois clientes. 
--Exemplo: Sua procedure deve registrar uma transferência de R$ 300 reais entre as contas de Ana e Bruno. 

create or replace procedure transferencia (origem int, destino int, valor decimal)
language plpgsql 
as $$
begin

--subtraindo o montante transferido pela conta de origem 
update contas 
set saldo = saldo - valor
where id = origem;

--adicionando o montante transferido para a conta de destino
update contas 
set saldo = saldo + valor
where id = destino; 

end $$;

-- chamar a procedure

call transferencia (1,2,300);

-- para dropar uma procedure

 drop procedure transferencia;  

--poderia deixar a procedure mais completa verificando se o saldo é maior do que o valor que está transferindo, teria que fazer uma validação nesse caso.  


--OU PODERIA FAZER COM A SINTAXE DESSA FORMA AQUI 

create or replace procedure transferencia (origem int, destino int, valor decimal)
as $$
begin

--subtraindo o montante transferido pela conta de origem 
update contas 
set saldo = saldo - valor
where id = origem;

--adicionando o montante transferido para a conta de destino
update contas 
set saldo = saldo + valor
where id = destino; 

end; 
$$ language plpgsql;

---PODERIA FAZER ESSE MESMO EXERCÍCIO ANTERIOR USANDO O CONCEITO DE FUNÇÃO SEM RETORNO, ISTO É, FUNÇÃO DO TIPO VOID!  

CREATE OR REPLACE FUNCTION transferencia(origem int, destino int, valor decimal) RETURNS void AS
$$

BEGIN

--subtraindo o montante transferido pela conta de origem 
update contas 
set saldo = saldo - valor
where id = origem;

--adicionando o montante transferido para a conta de destino
update contas 
set saldo = saldo + valor
where id = destino; 

END;
$$ LANGUAGE 'plpgsql'; 


-- chamar a função sem retorno do tipo void. 

select transferencia (1,2,300);

   
-----SINTAXE PARA CRIAR PROCEDIMENTOS ARMAZENADOS (STORED PROCEDURES OU SIMPLESMENTE PROCEDURES) NO POSTGRESQL USANDO O CONCEITO DE FUNÇÃO SEM RETORNO, ISTO É, UMA FUNÇÃO DO TIPO VOID!  
/*
CREATE OR REPLACE FUNCTION nome_função(parametros) RETURNS void AS
$$
declare 
	declaracao de variaveis;
BEGIN
corpo do código 
END;
$$ LANGUAGE 'plpgsql';  

--TESTAR

select nome_função(parametros); 

--OU PODERIA 

CREATE OR REPLACE FUNCTION nome_função(parametros) RETURNS void
language plpgsql 
as $$
declare 
	declaracao de variaveis;
begin 
	corpo do código;
end $$;

*/

--PASSO A PASSO COM EXEMPLOS 

create table cliente (
	cod_cli integer not null primary key,
	nome varchar(100),
	sobrenome varchar(100),
	tel varchar(100)
	); 
	
select * from cliente; 

--função para inserir um novo cliente na tabela cliente

CREATE OR REPLACE FUNCTION inserir_cli (cd integer, nom varchar(30), sbn varchar(30), t varchar(30)) RETURNS void 
as $$ 
BEGIN 
  insert into cliente values ($1, $2, $3, $4);
END;
$$ LANGUAGE plpgsql;

--chamar a função para testar 

select inserir_cli (1, 'João', 'Almeida', '123456789');

--ou poderia usar a sintaxe para criar a função do tipo void assim também 

CREATE OR REPLACE FUNCTION inserir_cli (cd integer, nom varchar(30), sbn varchar(30), t varchar(30)) RETURNS void 
LANGUAGE plpgsql
as $$ 
BEGIN 
  insert into cliente values ($1, $2, $3, $4);
END $$;

--chamar a função para testar 

select inserir_cli (2, 'João', 'Almeida', '123456789');
