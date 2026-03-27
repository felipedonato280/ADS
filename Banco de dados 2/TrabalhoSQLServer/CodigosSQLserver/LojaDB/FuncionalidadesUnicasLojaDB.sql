-- Limpa e recria tabela de origem
IF OBJECT_ID('NovosClientes', 'U') IS NOT NULL
    DROP TABLE NovosClientes;
GO

CREATE TABLE NovosClientes (
    Id INT,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);
GO

-- IMPORTANTE: incluir TODOS os IDs existentes
INSERT INTO NovosClientes (Id, Nome, Email) VALUES
(1, 'João Silva Atualizado', 'joao@email.com'), -- UPDATE
(2, 'Maria Souza', 'maria@email.com'),          -- mantém
(3, 'Carlos Lima', 'carlos@email.com'),         -- mantém
(4, 'Ana Costa', 'ana@email.com');              -- INSERT
GO

-- Teste

SELECT * FROM NovosClientes;
SELECT * FROM Clientes;

-- MERGE

;MERGE INTO Clientes
USING NovosClientes
ON Clientes.Id = NovosClientes.Id

WHEN MATCHED THEN
    UPDATE SET 
        Clientes.Nome = NovosClientes.Nome,
        Clientes.Email = NovosClientes.Email

WHEN NOT MATCHED THEN
    INSERT (Nome, Email)
    VALUES (NovosClientes.Nome, NovosClientes.Email)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
GO

-- Visualizar resultado após MERGE
SELECT * FROM Clientes;
GO

-- OUTPUT (INSERT)

INSERT INTO Clientes (Nome, Email)
OUTPUT INSERTED.*
VALUES ('Pedro Rocha', 'pedro@email.com');
GO

-- OUTPUT (UPDATE)

UPDATE Clientes
SET Nome = 'Pedro Rocha Atualizado'
OUTPUT INSERTED.*
WHERE Nome = 'Pedro Rocha';
GO

-- OUTPUT (DELETE)

DELETE FROM Clientes
OUTPUT DELETED.*
WHERE Nome = 'Pedro Rocha Atualizado';
GO

-- RESULTADO FINAL

SELECT * FROM Clientes;
GO