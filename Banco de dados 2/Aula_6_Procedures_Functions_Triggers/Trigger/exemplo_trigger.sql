--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este registro seja armazenado na tabela backup cliente.

create table cliente (
nome varchar(50),
endereco varchar(100),
rg int,
cidade varchar(30),
estado char(2)
);

create table bk_cliente (
nome varchar(50),
endereco varchar(100),
rg int,
cidade varchar(30),
estado char(2)
);

--Exemplo1: Toda vez que for deletado um registro da tabela cliente quero que este registro seja armazenado na tabela bk_cliente.

Agora vamos popular a tabela cliente com alguns registros:
insert into cliente values ('pedro','Rua 1', 12345678,'Santa Maria','RS');
insert into cliente values ('joão','Rua 2', 11223344,'Agudo','RS');
insert into cliente values ('maria','Rua 3', 11227788,'Restinga Sêca','RS');
insert into cliente values ('lucas','Rua 4', 22334455,'Faxinal do Soturno','RS');
insert into cliente values ('marcos','Rua 5', 33221100,'São Sepé','RS');

--Agora vamos visualizar os registros inseridos na tabela cliente:
select * from cliente;

--Criação da função salvaexcluido
CREATE OR REPLACE FUNCTION salvaexcluido() RETURNS trigger 
as $$ 
BEGIN
    insert into bk_cliente values (old.nome, old.endereco, old.rg, old.cidade, old.estado);
    RETURN null;
END;
$$ LANGUAGE 'plpgsql';

--Agora vamos criar a trigger propriamente dita
CREATE TRIGGER exclusao_cliente
AFTER delete on cliente 
FOR EACH ROW EXECUTE PROCEDURE salvaexcluido();

--Testar 
delete from cliente where nome='pedro';

--Exemplo2: Desejamos que na nossa regra de negócio a partir de agora o novo salário não pode diminuir em relação ao antigo, para isso podemos utilizar a RAISE EXCEPTION. 

create table empregado(
codemp int, 
nomemp char(40), 
salario numeric(10,2),
primary key (codemp)); 

insert into empregado values (1,'emp1',2000.00);

--Criação da função fversal
CREATE OR REPLACE FUNCTION fversal() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salario < OLD.salario
		THEN RAISE EXCEPTION 'salario nao pode diminuir'; 
	END IF;
		RETURN NEW; 
END;
$$ 
LANGUAGE 'plpgsql';

--Criação da trigger tversal 
CREATE TRIGGER tversal 
AFTER UPDATE ON empregado 
FOR EACH ROW EXECUTE PROCEDURE fversal();

--Agora vamos tentar atualizar o salário de um empregado diminuindo o seu salário.  
UPDATE empregado SET salario = 1000 WHERE codemp=1;

--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento não pode ter mais que 4 funcionários alocados.

create table departamento (
coddepto int, 
nomdepto char (50), 
primary key (coddepto)
);

create table funcionario (
codfunc int, 
nomfunc char(50), 
coddepto int, 
foreign key (coddepto) references departamento (coddepto), 
primary key (codfunc)
);

--Depois de criarmos as tabelas departamento e funcionário, agora vamos popular estas tabelas. 
--Populando a tabela departamento:

insert into departamento values (1,'d1');
insert into departamento values (2,'d2');

--Populando a tabela funcionario: 

insert into funcionario values (1,'f1',1); 
insert into funcionario values (2,'f2',1); 
insert into funcionario values (3,'f3',1); 
insert into funcionario values (4,'f4',2); 
insert into funcionario values (5,'f5',2);

--Agora vamos criar a função (function) que será disparada pelo gatilho (trigger)  que será criada a seguir. 

CREATE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
DECLARE vconta int;
BEGIN
select count(*) into vconta from funcionario
where coddepto = new.coddepto; 
	IF vconta > 4 then RAISE EXCEPTION 'mais de 4 funcionários'; 
	END IF;
	RETURN NEW; 
END;
$$ LANGUAGE 'plpgsql';

--Agora vamos criar o gatilho (trigger) que será responsável por disparar a função (function) que foi criada anteriormente.  

CREATE TRIGGER tvernumf 
AFTER UPDATE OR INSERT ON funcionario  
FOR EACH ROW EXECUTE PROCEDURE fvernumfuncdepto();

--Exemplo3: Nesse exemplo foi definida na regra de negócio que um departamento não pode ter mais que 4 funcionários alocados.
---OPÇÃO 1: USANDO A CONSULTA APÓS DECLARAÇÃO DA VARIÁVEL AUXILIAR

CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
DECLARE vcount INT;
BEGIN
     vcount := (select count(*) from funcionario where coddepto = NEW.coddepto); 
     IF vcount > 4
		THEN RAISE EXCEPTION 'mais de 4 funcionários por depto não é permitido'; 
     END IF;
		RETURN NEW; 
END;
$$ LANGUAGE 'plpgsql';

---OPÇÃO 2: USANDO A CONSULTA DIRETAMENTE NA DECLARAÇÃO DA VARIAVEL AUXILIAR 

CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
DECLARE vcount INT := (select count(*) from funcionario where coddepto = NEW.coddepto);
BEGIN
     IF vcount > 4
		THEN RAISE EXCEPTION 'mais de 4 funcionários por depto não é permitido'; 
     END IF;
		RETURN NEW; 
END;
$$ LANGUAGE 'plpgsql';

---OPÇÃO 3: USANDO A CONSULTA DENTRO DO IF SEM PRECISAR DE UMA VARIÁVEL AUXILIAR

CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
BEGIN
     IF (select count(*) from funcionario where coddepto = NEW.coddepto) > 4
		THEN RAISE EXCEPTION 'mais de 4 funcionários por depto não é permitido'; 
     END IF;
		RETURN NEW; 
END;
$$ LANGUAGE 'plpgsql';

---OPÇÃO 4: USANDO A CONSULTA DENTRO DO IF EXISTS SEM PRECISAR DE UMA VARIÁVEL AUXILIAR E USANDO APENAS A TABELA FUNCIONARIO 

    CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
		BEGIN
			IF EXISTS (select count(*) 
				       from funcionario
				       where coddepto = NEW.coddepto
				       group by coddepto
				       having count(*) > 4 
				) THEN
				RAISE EXCEPTION 'Não pode ter mais que 4 funcionarios por depto';  
			END IF;
				RETURN NEW;
		END
	$$ LANGUAGE 'plpgsql';

---OPÇÃO 5: USANDO A CONSULTA DENTRO DO IF EXISTS SEM PRECISAR DE UMA VARIÁVEL AUXILIAR CRUZANDO PK E FK DAS TABELAS FUNCIONARIO E DEPARTAMENTO 

    CREATE OR REPLACE FUNCTION fvernumfuncdepto() RETURNS TRIGGER AS $$
		BEGIN
			IF EXISTS (select count(*) 
				       from funcionario, departamento 
				       where funcionario.coddepto = departamento.coddepto and funcionario.coddepto = NEW.coddepto
				       group by departamento.coddepto
				       having count(*) > 4 
				) THEN
				RAISE EXCEPTION 'Não pode ter mais que 4 funcionarios por depto';  
			END IF;
				RETURN NEW;
		END
	$$ LANGUAGE 'plpgsql';

----------TESTAR 
insert into funcionario values (1,'f1',1); 
insert into funcionario values (2,'f2',1); 
insert into funcionario values (3,'f3',1); 
insert into funcionario values (4,'f4',1); 
insert into funcionario values (5,'f5',1); 