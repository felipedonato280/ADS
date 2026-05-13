--CREATE TABLE estudantes
CREATE TABLE estudantes (id int, nome VARCHAR(50), idade int);

--INSERTS TABLE estudantes 
INSERT INTO estudantes (id, nome, idade) VALUES (1, 'Fernanda', 20);
INSERT INTO estudantes (id, nome, idade) VALUES (2, 'Maria', 19);
INSERT INTO estudantes (id, nome, idade) VALUES (3, 'Gabriel', 21);
INSERT INTO estudantes (id, nome, idade) VALUES (4, 'Antônio', 23);
INSERT INTO estudantes (id, nome, idade) VALUES (5, 'Marcos', 21);
INSERT INTO estudantes (id, nome, idade) VALUES (6, 'Sofia', 22);
INSERT INTO estudantes (id, nome, idade) VALUES (7, 'Laura', 18);
INSERT INTO estudantes (id, nome, idade) VALUES (8, 'Bruna', 20);

--CREATE TABLE professores 
CREATE TABLE professores (id int, nome VARCHAR(50), idade int);

--INSERTS TABLE professores 
INSERT INTO professores (id, nome, idade) VALUES (1, 'Roberto', 40);
INSERT INTO professores (id, nome, idade) VALUES (2, 'Laura', 35);
INSERT INTO professores (id, nome, idade) VALUES (3, 'José', 38);
INSERT INTO professores (id, nome, idade) VALUES (4, 'Maria', 45);
INSERT INTO professores (id, nome, idade) VALUES (5, 'Antônio', 50);
INSERT INTO professores (id, nome, idade) VALUES (6, 'Geralda', 32);
INSERT INTO professores (id, nome, idade) VALUES (7, 'Marcos', 45);
INSERT INTO professores (id, nome, idade) VALUES (8, 'Otávio', 30);

--SELECTS

SELECT * FROM estudantes;

SELECT * FROM professores; 

