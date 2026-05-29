--CREATE TABLE 

create table curso(
cod_curso serial not null,
nome_curso varchar(50),
PRIMARY KEY (cod_curso)
);

create table aluno(
cod_aluno serial not null, 
nome_aluno varchar(50), 
sexo char(1), 
cod_curso int,
PRIMARY KEY (cod_aluno),
FOREIGN KEY (cod_curso) REFERENCES CURSO (cod_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

--INSERTS TABLE CURSO 

insert into curso(nome_curso) values ('Administração'); -- 1
insert into curso(nome_curso) values ('Informática'); -- 2
insert into curso(nome_curso) values ('Agropecuária'); -- 3
insert into curso(nome_curso) values ('ADS'); -- 4  
insert into curso(nome_curso) values ('TPG'); --5
insert into curso(nome_curso) values ('Comércio'); -- 6
insert into curso(nome_curso) values ('Recursos Humanos'); -- 7

--INSERTS TABLE ALUNO

insert into aluno(nome_aluno, sexo, cod_curso) values ('Pedro', 'M', 1);
insert into aluno(nome_aluno, sexo, cod_curso) values ('João', 'M', 1);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Carlos', 'M', 1);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Vitória', 'F', 1);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Maria', 'F', 2);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Luiza', 'F', 2);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Alex', 'M', 2);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Lucas', 'M', 3);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Fabrício', 'M', 3);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Gabriel', 'M', 4);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Marcos', 'M', 4);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Paula', 'F', 5);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Fernanda', 'F', 5);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Manoel', 'M', 6);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Ricardo', 'M', 7);
insert into aluno(nome_aluno, sexo, cod_curso) values ('Matheus', 'M', 7);
insert into aluno(nome_aluno, sexo) values ('Cristian', 'M');
insert into aluno(nome_aluno, sexo) values ('Moisés', 'M');

--SELECTS

select * from curso; 

select * from aluno; 