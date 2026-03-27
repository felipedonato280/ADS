-- CRIAÇÃO DO BANCO

CREATE DATABASE LojaDB;
GO

USE LojaDB;
GO

-- RESETANDO DADOS ANTERIORES E REINICIANDO O ID DAS TABELAS

TRUNCATE TABLE Pedidos;
TRUNCATE TABLE Clientes;

-- TABELA: Clientes

CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);
GO

-- TABELA: Pedidos


CREATE TABLE Pedidos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT NOT NULL,
    DataPedido DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL CHECK (Valor >= 0),

    CONSTRAINT FK_Pedidos_Clientes
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id)
);
GO

-- INSERÇÃO DE DADOS

INSERT INTO Clientes (Nome, Email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Carlos Lima', 'carlos@email.com');

INSERT INTO Pedidos (ClienteId, DataPedido, Valor) VALUES
(1, '2026-01-10', 150.00),
(1, '2026-02-15', 300.00),
(2, '2026-03-01', 200.00);
GO

-- CONSULTAS

-- Lista clientes

SELECT * FROM Clientes; 

-- Lista pedidos 

SELECT * FROM Pedidos; 

-- JOIN pedidos + clientes 

SELECT (
    SELECT Nome
    FROM Clientes
    WHERE Clientes.Id = Pedidos.ClienteId
) 
AS NomeCliente, DataPedido, Valor
FROM Pedidos;

-- Total gasto por cliente

SELECT Nome,(
    SELECT SUM(Valor)
    FROM Pedidos
    WHERE Pedidos.ClienteId = Clientes.Id
) 
AS TotalGasto
FROM Clientes;

GO
