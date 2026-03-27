-- ÍNDICE

CREATE INDEX idx_nome_cliente 
ON Clientes(Nome);
GO

-- VIEW

GO
CREATE VIEW vw_PedidosClientes AS
SELECT 
    c.Nome, 
    p.DataPedido, 
    p.Valor
FROM Pedidos p
INNER JOIN Clientes c ON p.ClienteId = c.Id;
GO

-- Teste da VIEW
SELECT * FROM vw_PedidosClientes;
GO

-- STORED PROCEDURE

GO
CREATE PROCEDURE sp_ListarPedidosPorCliente
    @ClienteId INT
AS
BEGIN
    SELECT * 
    FROM Pedidos
    WHERE ClienteId = @ClienteId;
END;
GO

-- Teste da PROCEDURE
EXEC sp_ListarPedidosPorCliente @ClienteId = 1;
GO

-- FUNCTION

GO
CREATE FUNCTION fn_TotalPedidosCliente (@ClienteId INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = SUM(Valor)
    FROM Pedidos
    WHERE ClienteId = @ClienteId;

    RETURN ISNULL(@Total, 0);
END;
GO

-- Teste da FUNCTION
SELECT dbo.fn_TotalPedidosCliente(1) AS Total;
GO

-- TRIGGER

GO

IF OBJECT_ID('trg_AposInserirPedido', 'TR') IS NOT NULL
    DROP TRIGGER trg_AposInserirPedido;
GO

CREATE TRIGGER trg_AposInserirPedido
ON Pedidos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 'Novo pedido inserido com sucesso!' AS Mensagem;
END;
GO

-- Teste da TRIGGER
INSERT INTO Pedidos (ClienteId, DataPedido, Valor)
VALUES (3, '2026-03-10', 500.00);
GO

-- USUÁRIO E PERMISSÕES

-- Cria login (nível servidor) se não existir
IF NOT EXISTS (
    SELECT * 
    FROM sys.server_principals 
    WHERE name = 'usuario_teste'
)
BEGIN
    CREATE LOGIN usuario_teste WITH PASSWORD = 'Senha123!';
END;
GO

-- Cria usuário no banco se não existir
IF NOT EXISTS (
    SELECT * 
    FROM sys.database_principals 
    WHERE name = 'usuario_teste'
)
BEGIN
    CREATE USER usuario_teste FOR LOGIN usuario_teste;
END;
GO

-- Permissão de leitura
GRANT SELECT ON Clientes TO usuario_teste;
GO

-- Testa a permissão
EXECUTE AS USER = 'usuario_teste';

SELECT * FROM Clientes; -- deve funcionar

SELECT * FROM Pedidos; -- deve dar erro

REVERT;
GO

-- BACKUP

-- IMPORTANTE: a pasta C:\Backup deve existir
BACKUP DATABASE LojaDB
TO DISK = 'C:\Backup\LojaDB.bak'
WITH INIT, FORMAT;
GO