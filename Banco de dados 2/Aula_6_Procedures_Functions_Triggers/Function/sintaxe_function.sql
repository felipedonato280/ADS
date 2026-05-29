--SINTAXE PARA CRIAR FUNÇÕES 
CREATE OR REPLACE FUNCTION nomedafuncao() RETURNS tipo
AS $$ 
DECLARE
	....
	BEGIN
	....
		RETURN
	END;
$$ LANGUAGE 'plpgsql';

--EXEMPLO: Criar a função alomundo 
--OPÇÃO 1
CREATE OR REPLACE FUNCTION alomundo() RETURNS varchar
AS $$ 
DECLARE mensagem VARCHAR := 'Alo, Mundo';
BEGIN
RETURN mensagem; 
END;
$$ LANGUAGE plpgsql;

----FUNÇÃO COM DELIMITADOR DE FUNÇÃO USANDO ASPAS SIMPLES AO INVÉS DE DOLAR OU CIFRÃO COM FUNÇÃO QUE RETORNA UM VARCHAR 

CREATE OR REPLACE FUNCTION alomundo() RETURNS varchar
AS ' 
DECLARE mensagem VARCHAR := ''Alo, Mundo, Marchesan'';
BEGIN
RETURN mensagem; 
END;
' LANGUAGE plpgsql;

select alomundo();

--Testar
select alomundo()

--FUNÇÃO COM DELIMITADOR DE FUNÇÃO USANDO ASPAS SIMPLES AO INVÉS DE DOLAR OU CIFRÃO 

CREATE OR REPLACE FUNCTION addition(v1 INTEGER, v2 INTEGER) RETURNS INTEGER AS '
DECLARE
  result INTEGER;
BEGIN
SELECT v1 + v2 INTO result;
RETURN result;
END;
' LANGUAGE plpgsql;

select addition(2,5);

--OU ASSIM TAMBÉM FUNCIONA  

CREATE OR REPLACE FUNCTION addition(v1 INTEGER, v2 INTEGER) RETURNS INTEGER 
LANGUAGE plpgsql AS '
DECLARE
  result INTEGER;
BEGIN
SELECT v1 + v2 INTO result;
RETURN result;
END
'; 

select addition (10,5); 

--OPÇÃO 2
CREATE OR REPLACE FUNCTION alomundo() RETURNS varchar
AS $$ 
DECLARE mensagem VARCHAR;
BEGIN
mensagem:= 'Olá Mundo';
RETURN mensagem; 
END;
$$ LANGUAGE plpgsql;

--Testar
select alomundo()

--OPÇÃO 3 - MANEIRA MAIS OTIMIZADA DE FAZER 
CREATE OR REPLACE FUNCTION alomundo() RETURNS varchar
AS $$ 
BEGIN
RETURN 'Alô, Mundo';
END;
$$ LANGUAGE plpgsql;

--Testar
select alomundo()

--SINTAXE PARA DELETAR FUNÇÕES 
DROP FUNCTION nome_função (tipo) 

--EXEMPLO: deletar a função sqrt do tipo inteiro 
 DROP FUNCTION sqrt (integer) 
 
 --SINTAXE PARA ALTERAR FUNÇÕES 
--Exemplos:
--Para renomear a função sqrt do tipo integer para square_root
ALTER FUNCTION sqrt (integer) RENAME TO square_root;

--Para mudar o proprietário da função sqrt do tipo integer para o usuário joe
ALTER FUNCTION sqrt (integer) OWNER TO joe;

--Para mudar o schema da função sqrt do tipo integer para o schema maths
ALTER FUNCTION sqrt (integer) SET SCHEMA maths