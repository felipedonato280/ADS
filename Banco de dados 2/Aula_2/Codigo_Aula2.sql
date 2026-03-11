--CREATE TABLE 
create table ENGENHEIRO (
Cod_Eng serial not null, 
Nome_Eng varchar(50) not null,
primary key (Cod_Eng)
);

create table PROJETO (
Cod_Proj serial not null, 
Nome_Proj varchar(100) not null,
primary key (Cod_Proj)
);

create table PARTICIPACAO (
Cod_Eng int, 
Cod_Proj int, 
FOREIGN KEY (Cod_Eng) REFERENCES ENGENHEIRO (Cod_Eng) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Cod_Proj) REFERENCES PROJETO (Cod_Proj) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Cod_Eng, Cod_Proj)
);

--SELECTS  
select * from ENGENHEIRO; 

select * from PROJETO;

select * from PARTICIPACAO; 

--INSERTS TABELA ENGENHEIRO
insert into ENGENHEIRO (Nome_Eng) values ('Pedro');  -- 1 
insert into ENGENHEIRO (Nome_Eng) values ('Paulo'); -- 2 
insert into ENGENHEIRO (Nome_Eng) values ('João');  -- 3
insert into ENGENHEIRO (Nome_Eng) values ('Maria'); -- 4
insert into ENGENHEIRO (Nome_Eng) values ('Lucas');  -- 5
insert into ENGENHEIRO (Nome_Eng) values ('Manoela'); -- 6
insert into ENGENHEIRO (Nome_Eng) values ('Ana Paula'); -- 7
insert into ENGENHEIRO (Nome_Eng) values ('Fabiano');   -- 8
insert into ENGENHEIRO (Nome_Eng) values ('Fabrício'); -- 9
insert into ENGENHEIRO (Nome_Eng) values ('Felipe');    -- 10

--INSERTS TABELA PROJETO
insert into PROJETO (Nome_Proj) values ('Projeto 1'); 
insert into PROJETO (Nome_Proj) values ('Projeto 2'); 
insert into PROJETO (Nome_Proj) values ('Projeto 3'); 
insert into PROJETO (Nome_Proj) values ('Projeto 4'); 
insert into PROJETO (Nome_Proj) values ('Projeto 5'); 
insert into PROJETO (Nome_Proj) values ('Projeto 6'); 

--INSERTS TABELA PARTICIPACAO 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (1,1); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (1,2); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (1,3); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (2,1); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (2,2); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (2,3); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (3,3);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (3,4);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (3,5);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (4,4);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (4,5);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (5,1);  
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (5,2); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (6,2);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (6,3); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (7,3);
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (7,4); 
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (8,2);  
insert into PARTICIPACAO (Cod_Eng, Cod_Proj) values (8,1);