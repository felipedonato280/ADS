--Exercício 1 

--Crie uma view chamada vfiscal que possua o código e o nome do fiscal.  
--Inclua um novo fiscal usando a view vfiscal. 
--Liste os dados da tabela fiscal. O que aconteceu?

CREATE VIEW vfiscal AS
SELECT codfis, nomfis
FROM fiscal;

INSERT INTO vfiscal (nomfis)
VALUES ('João');

SELECT * FROM fiscal;

INSERT INTO fiscal(salario) VALUES(100.00);

UPDATE fiscal SET salario = 100.00 WHERE codfis = 4;

--Exercício 2 

--Crie a tabela a seguir: 
--Create table tabteste (cod int not null, nome varchar(50), primary key (cod)); 
--Crie uma view chamada vteste1 que possua apenas o campo nome da tabela tabteste 
--Tente inserir dados em vteste1. O que aconteceu? 

CREATE TABLE tabteste(
    cod INT NOT NULL,
    nome VARCHAR(50),
    PRIMARY KEY(cod)
);

CREATE OR REPLACE VIEW vteste1 AS
SELECT nome, cod
FROM tabteste;

INSERT INTO vteste1(nome, cod)
VALUES('Felipe', 4);

select * from tabteste;

--Exercício 3 

--Crie a view a seguir: 
--Create view vtestecheck as 
--select * from fiscal where salario > '10000.00' with check option; 
--Após tente inserir dados de fiscais  usando a view vtestecheck. Tente informar um salário 
--menor do que 10.000,00 para um dos fiscais. Relate o que aconteceu.

CREATE VIEW vtestecheck AS
SELECT *
FROM fiscal
WHERE salario > 10000.00
WITH CHECK OPTION;

INSERT INTO vtestecheck(nomfis, salario)
VALUES('Carlos',9000);