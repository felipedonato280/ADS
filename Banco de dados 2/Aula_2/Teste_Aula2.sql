-- ADICIONAR O ATRIBUTO IDADE
ALTER TABLE engenheiro add idade_eng int;

select * from engenheiro;

-- ADICIONA IDADE
update engenheiro set idade_eng = 20 where cod_eng IN (1,2,3);

select * from engenheiro order by cod_eng asc;

-- REMOVER ATRIBUTO IDADE
alter table engenheiro drop idade_eng;

-- MUDAR O NOME DO DB
ALTER DATABASE Lista_2 RENAME TO Lista_2_Renomeada;

-- MUDAR O NOME DA TABELA
ALTER TABLE engenheiro RENAME TO eng;

-- REMOVER TODOS OS REGISTROS
delete from participacao where cod_eng = 8;
delete from participacao;

select * from participacao;

-- USANDO TRUNCATE
truncate participacao;

select * from participacao;