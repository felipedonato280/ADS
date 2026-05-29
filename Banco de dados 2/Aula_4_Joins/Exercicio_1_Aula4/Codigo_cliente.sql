--CREATE TABLE cliente
CREATE TABLE cliente (
	id_cliente serial not null, 
	nome_cliente varchar(50), 
	primary key (id_cliente) 
	); 
	
--CREATE TABLE compras
CREATE TABLE compras (
	id_compra serial not null, 
	id_cliente int,
	nome_compra varchar(50),
	preco float,  
	primary key (id_compra),
	foreign key (id_cliente) references cliente (id_cliente)	
	);

--INSERTS TABLE cliente 
INSERT INTO cliente (nome_cliente) values ('Giovani'); -- 1
INSERT INTO cliente (nome_cliente) values ('Felipe'); -- 2
INSERT INTO cliente (nome_cliente) values ('Rafael'); -- 3
INSERT INTO cliente (nome_cliente) values ('Erika'); -- 4
	
--INSERTS TABLE compras	
INSERT INTO compras (id_cliente, nome_compra, preco) values (1, 'Computador', 3000); -- 1
INSERT INTO compras (id_cliente, nome_compra, preco) values (1, 'PlayStation 4', 1500); -- 2
INSERT INTO compras (id_cliente, nome_compra, preco) values (4, 'iPad', 1800); -- 3
INSERT INTO compras (id_cliente, nome_compra, preco) values (3, 'Headset', 300); -- 4
INSERT INTO compras (id_cliente, nome_compra, preco) values (3, 'Placa de vídeo', 1000); -- 5
INSERT INTO compras (nome_compra, preco) values ('Xbox', 1200); -- 6

--SELECTS 

select * from cliente; 

select * from compras; 