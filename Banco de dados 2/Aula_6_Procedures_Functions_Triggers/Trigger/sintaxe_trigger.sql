
--SINTAXE PARA CRIAÇÃO DE GATILHOS 
CREATE TRIGGER nome { BEFORE | AFTER } { evento [OR ...] } ON tabela 
	FOR EACH { ROW | STATEMENT }
EXECUTE PROCEDURE nome_funcao ( argumentos )

--SINTAXE PARA ALTERAÇÃO DE GATILHOS: 
ALTER TRIGGER nome ON tabela RENAME TO novo_nome

--Exemplo:
ALTER TRIGGER teste_trigger_inicial ON TESTE_TRIGGER RENAME TO teste_trigger_final;

--SINTAXE PARA EXCLUSÃO DE GATILHOS 
DROP TRIGGER nome ON tabela [ CASCADE | RESTRICT ] 

--Exemplo:
DROP TRIGGER teste_trigger_inicial ON TESTE_TRIGGER;

--Sintaxe para Desabilitar triggers:
--Para desabilitar uma trigger execute o comando abaixo:
ALTER TABLE  nome_tabela DISABLE TRIGGER nome_trigger

--Exemplo:
ALTER TABLE TESTE_TRIGGER DISABLE TRIGGER teste_trigger_inicial

--Para desabilitar todas as triggers da tabela, execute o seguinte comando:
ALTER TABLE  nome_tabela DISABLE TRIGGER ALL

--Exemplo: 
ALTER TABLE TESTE_TRIGGER DISABLE TRIGGER ALL

--Sintaxe para Habilitar triggers:
--Para habilitar uma trigger basta alterar o parâmetro DISABLE por ENABLE:
ALTER TABLE  nome_tabela ENABLE TRIGGER nome_trigger

--Exemplo: 
ALTER TABLE  TESTE_TRIGGER ENABLE TRIGGER teste_trigger_inicial

--Agora para habilitar todas as triggers da tabela:
ALTER TABLE  nome_tabela ENABLE TRIGGER ALL

--Exemplo: 
ALTER TABLE  TESTE_TRIGGER ENABLE TRIGGER ALL

--Obtendo informações sobre as triggers do banco de dados

--Exemplo: 
SELECT * FROM INFORMATION_SCHEMA.TRIGGERS

--Exemplo: 
SELECT * FROM PG_CATALOG.PG_TRIGGER