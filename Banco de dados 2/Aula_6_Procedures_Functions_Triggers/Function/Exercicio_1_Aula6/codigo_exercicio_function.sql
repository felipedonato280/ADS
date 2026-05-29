--CREATE TABLE PARA CRIAR AS TABELAS 

CREATE TABLE tipo(
 codtipo SERIAL PRIMARY KEY,
 nometipo VARCHAR(45) NOT NULL
);

CREATE TABLE produto(
 codproduto SERIAL PRIMARY KEY,
 nomeproduto VARCHAR(100) NOT NULL, 
 preco DECIMAL(10,2),
 estoque BIGINT,
 codtipo INT, 
 FOREIGN KEY (codtipo) REFERENCES tipo(codtipo)
);

CREATE TABLE usuario(
 codusuario SERIAL PRIMARY KEY,
 nomeusuario VARCHAR(45)
);

CREATE TABLE venda(
 codvenda SERIAL PRIMARY KEY,
 codproduto INT NOT NULL,
 codusuario INT,
 quantidade INT NOT NULL,
 CONSTRAINT fkproduto FOREIGN KEY (codproduto) 
    REFERENCES produto(codproduto) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
 CONSTRAINT fkusuario FOREIGN KEY (codusuario) 
    REFERENCES usuario(codusuario) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);


--INSERTS PARA POPULAR AS TABELAS 

INSERT INTO tipo(nometipo) VALUES
('Comida'),('Bebida'), ('Higiene e Limpeza'),
('Mesa e Banho'),('Eletrônico'),
('Material de Escritório');

INSERT INTO usuario(nomeusuario) VALUES
('João'),('Antônio'), ('Pedro'),
('Regina'),('Francisco'),
('Fabrício'),('Manoela'),('Renata');

INSERT INTO produto(nomeproduto, preco, estoque, codtipo) VALUES
('Arroz', 23.42, 234, 1),
('Feijão', 8.54, 523, 1),
('Carne', 50.29, 441, 1),
('Vinho', 32.43, 124, 2),
('Água Mineral Com Gás', 3.78, 1264, 2),
('Coca-Cola Lata', 2.87, 248, 2),
('Amaciante', 12.98, 1457, 3),
('Desodorante', 12.54, 228, 3),
('Toalha de Rosto', 5.99, 67, 4),
('TV 32 polegas', 500.87, 159, 5), 
('Notebook i15-5567-D40B Dell', 500.87, 120, 5), 
('Caneta Bic', 1.87, 50, 6), 
('Pacote de Folha A4 - 500 Folhas', 40.87, 20, 6), 
('Pacote de Clips', 3.87, 25, 6),
('Folha de Cartolina', 1.25, 35, 6); 


--SELECT RANDOM(); -- FUNÇÃO QUE VAI DE 0 (ZERO) A 1 (UM)  
INSERT INTO venda(codproduto, codusuario, quantidade) VALUES
(ROUND(RANDOM()*9 + 1), ROUND(RANDOM()*7 + 1), ROUND(RANDOM()*9 + 1));
--LEMBRAR QUE A FUNÇÃO ROUND VAI ARREDONDAR PARA CIMA OU PARA BAIXO DEPENDENDO DO VALOR. 

SELECT * FROM TIPO;

SELECT * FROM PRODUTO; 

SELECT * FROM USUARIO; 

SELECT * FROM VENDA; 



