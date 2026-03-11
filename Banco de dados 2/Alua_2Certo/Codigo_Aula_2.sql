--CRIAÇÃO DA TABELA ALUNO 
create table aluno (
  Codaluno serial not null,
  Nomaluno varchar(50),
  Datanasc date,
  cpf char(11),
  email varchar(200),
  indiceRendimento numeric(4,2),
  primary key(Codaluno)) 
  
--MOSTRANDO A TABELA ALUNO 
  select * from aluno 

--POPULANDO (INSERINDO REGISTROS) NA TABELA ALUNO 
INSERT INTO aluno (Nomaluno,Datanasc,cpf,email,indiceRendimento) VALUES ('JOAO', '1998/03/11','11111111111','joao@gmail.com','8.45');

INSERT INTO aluno (Nomaluno,Datanasc,cpf,email,indiceRendimento) VALUES ('MARIA', '1997/12/31','22222222222','maria@gmail.com','6.78');

INSERT INTO aluno (Nomaluno,Datanasc,cpf,email,indiceRendimento) VALUES ('MANUEL', '1987/05/04','33333333333','manuel@gmail.com','7.98');

INSERT INTO aluno (Nomaluno,Datanasc,cpf,email,indiceRendimento) VALUES ('JOSÉ', '1985/03/30','44444444444','jose@gmail.com','5.45');

INSERT INTO aluno (Nomaluno,Datanasc,cpf,email,indiceRendimento) VALUES ('ANA', '1978/02/23','55555555555','ana@gmail.com','9.03');

--MOSTRANDO TODOS OS REGISTROS DA TABELA ALUNO 
  select * from aluno 

--Comando para exibir a data em formato PT-BR (DD-MM-YYYY)
SET datestyle TO postgres, DMY; 