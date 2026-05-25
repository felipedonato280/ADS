CREATE TABLE produto(
codigo int, 
valor1 int,
valor2 int,
primary key (codigo));

select * from produto; 

CREATE VIEW v1 AS 
select codigo, valor1
from produto;

select * from v1; 

--Vai inserir também os valores nos campos codigo e valor1 da tabela fisica produto  
INSERT INTO v1 (codigo, valor1) values (1,10);

--Vai dar erro já que a coluna valor2 da view (tabela virtual) v1 não existe!!!    
INSERT INTO v1 (codigo, valor1, valor2) values (2,10,100);

--Vai criar a view v2 com o valor1 = 10 que já tinha sido inserido anteriormente na view v1.  
CREATE VIEW v2 AS 
select valor1, valor2
from produto;

select * from v2; 

--Não é possível inserir valores na view v2 já que a view v2 foi definida apenas com as colunas valor1 e valor2 
--da tabela produto, e na tabela produto o campo cod foi definido como chave primária, neste caso viola a restrição de valor não nulo.
INSERT INTO v2 (valor1, valor2) values (10,100);

--Excluir a view v2; 
DROP view v2; 

--Criar novamente a view v2; 
CREATE VIEW v2 AS select codigo, valor1, valor2
from produto;

--Inserir na view v2 com os campos codigo, valor1 e valor2. 
INSERT INTO v2 (codigo, valor1, valor2) values (4, 10,100);

--vai remover os registros da tabela produto e também os registros de todas as visões que utilizam 
--os campos da tabela produto, no caso da v1 que tinha inserido os valores 1 e 10 para o codigo e valor1, respectivamente.  
DELETE FROM produto;

--A partir da versão 9.4 suporta WITH CHECK OPTION - PostgreSQL 9.4 
--Link PostgreSQL 9.4.26 Documentation: https://www.postgresql.org/docs/9.4/sql-createview.html
CREATE VIEW v4 (codigo, valor1, valor2) AS 
select codigo, valor1, valor2
from produto 
WHERE codigo > 3
WITH CHECK OPTION; -- VAI ATUAR NO INSERT E UPDATE -- INSERÇÃO E ATUALIZAÇÃO DE REGISTROS. 

--OU

CREATE VIEW v4 AS 
select codigo, valor1, valor2
from produto 
WHERE codigo > 3
WITH CHECK OPTION; -- VAI ATUAR NO INSERT E UPDATE -- INSERÇÃO E ATUALIZAÇÃO DE REGISTROS. 

--OU

CREATE VIEW v4 AS 
select *
from produto 
WHERE codigo > 3
WITH CHECK OPTION; -- VAI ATUAR NO INSERT E UPDATE -- INSERÇÃO E ATUALIZAÇÃO DE REGISTROS. 


--Não vai poder inserir porque a view v4 exige que o código seja maior que 3   
INSERT INTO v4 (codigo, valor1, valor2) values (2,10,100);

--Vai deixar inserir porque o código agora é maior que 3   
INSERT INTO v4 (codigo, valor1, valor2) values (4,10,100);

--Não vai permitir atualizar para o código 3 devido a restrição do WITH CHECK OPTION, já que o codigo deve ser maior que 3. 
update v4 set codigo = 3 where codigo = 4; 

--Agora sim vai permitir atualizar para o código 5 já que agora o codigo é maior que 3. 
update v4 set codigo = 5 where codigo = 4; 

SELECT * FROM v4;