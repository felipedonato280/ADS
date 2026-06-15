CREATE TABLE cidade (
    codcidade INT,
    nome VARCHAR(40) NOT NULL,
    CONSTRAINT PK_Cidade PRIMARY KEY (codcidade)
);

CREATE TABLE clube (
    codclube INT,
    nome VARCHAR(30) NOT NULL,
    federacao VARCHAR(10),
    ranking INT NOT NULL,
    codcidade INT NOT NULL,

    CONSTRAINT PK_Clube PRIMARY KEY (codclube),

    CONSTRAINT FK_Clube_Cidade
        FOREIGN KEY (codcidade)
        REFERENCES cidade(codcidade)
);

CREATE TABLE jogador (
    codjogador INT,
    nome VARCHAR(30) NOT NULL,
    posicao VARCHAR(20),
    idade INT,
    salario FLOAT, -- ou DECIMAL(10,2)
    codclube INT,

    CONSTRAINT PK_Jogador PRIMARY KEY (codjogador),

    CONSTRAINT FK_Jogador_Clube
        FOREIGN KEY (codclube)
        REFERENCES clube(codclube)
);

CREATE TABLE campeonato (
    codcamp INT,
    nome VARCHAR(40) NOT NULL,
    ano INT NOT NULL,

    CONSTRAINT PK_Campeonato PRIMARY KEY (codcamp)
);

CREATE TABLE tem (
    codcamp INT NOT NULL,
    codclube INT NOT NULL,
    numjogos INT NOT NULL,
    pontos INT NOT NULL,
    posicao INT NOT NULL,

    CONSTRAINT PK_Tem
        PRIMARY KEY (codcamp, codclube),

    CONSTRAINT FK_Tem_Campeonato
        FOREIGN KEY (codcamp)
        REFERENCES campeonato(codcamp),

    CONSTRAINT FK_Tem_Clube
        FOREIGN KEY (codclube)
        REFERENCES clube(codclube)
);

-- CIDADE

INSERT INTO cidade (codcidade, nome) VALUES (1, 'Porto Alegre');
INSERT INTO cidade (codcidade, nome) VALUES (2, 'Caxias do Sul');
INSERT INTO cidade (codcidade, nome) VALUES (3, 'Pelotas');
INSERT INTO cidade (codcidade, nome) VALUES (4, 'Santa Maria');
INSERT INTO cidade (codcidade, nome) VALUES (5, 'São Paulo');
INSERT INTO cidade (codcidade, nome) VALUES (6, 'Belo Horizonte');
INSERT INTO cidade (codcidade, nome) VALUES (7, 'Rio de Janeiro');
INSERT INTO cidade (codcidade, nome) VALUES (8, 'Curitiba');
INSERT INTO cidade (codcidade, nome) VALUES (9, 'Recife');
INSERT INTO cidade (codcidade, nome) VALUES (10, 'Bahia');

-- CLUBE

INSERT INTO clube VALUES (1, 'grêmio', 'gaúcha', 1, 1);
INSERT INTO clube VALUES (2, 'inter', 'gaúcha', 2, 1);
INSERT INTO clube VALUES (3, 'juventude', 'gaúcha', 4, 2);
INSERT INTO clube VALUES (4, 'brasil-pel', 'gaúcha', 3, 3);
INSERT INTO clube VALUES (5, 'flamengo', 'carioca', 1, 7);
INSERT INTO clube VALUES (6, 'botafogo', 'carioca', 2, 7);
INSERT INTO clube VALUES (7, 'cruzeiro', 'mineira', 1, 6);
INSERT INTO clube VALUES (8, 'atlético-mg', 'mineira', 2, 6);
INSERT INTO clube VALUES (9, 'são paulo', 'paulista', 4, 5);
INSERT INTO clube VALUES (10, 'corinthians', 'paulista', 2, 5);
INSERT INTO clube VALUES (11, 'palmeiras', 'paulista', 1, 5);
INSERT INTO clube VALUES (12, 'santos', 'paulista', 3, 5);

-- JOGADOR

INSERT INTO jogador VALUES (1, 'marcelo grohe', 'goleiro', 25, 300000, 1);
INSERT INTO jogador VALUES (2, 'andré', 'atacante', 23, 400000, 1);
INSERT INTO jogador VALUES (3, 'luan', 'atacante', 25, 450000, 1);
INSERT INTO jogador VALUES (4, 'geromel', 'zagueiro', 27, 200000, 1);
INSERT INTO jogador VALUES (5, 'jael', 'atacante', 28, 150000, 1);

INSERT INTO jogador VALUES (6, 'zeca', 'meio campo', 25, 300000, 2);
INSERT INTO jogador VALUES (7, 'marcelo lomba', 'goleiro', 25, 300000, 2);
INSERT INTO jogador VALUES (8, 'leandro damião', 'atacante', 27, 400000, 2);
INSERT INTO jogador VALUES (9, 'guerrero', 'atacante', 24, 250000, 2);
INSERT INTO jogador VALUES (10, 'vitor cuesta', 'zagueiro', 25, 300000, 2);

INSERT INTO jogador VALUES (11, 'bruno henrique', 'atacante', 20, 120000, 5);
INSERT INTO jogador VALUES (12, 'rodrigo caio', 'zagueiro', 25, 300000, 5);
INSERT INTO jogador VALUES (13, 'diego alves', 'goleiro', 25, 350000, 5);
INSERT INTO jogador VALUES (14, 'gabigol', 'atacante', 23, 800000, 5);
INSERT INTO jogador VALUES (15, 'diego', 'meio campo', 27, 400000, 5);

INSERT INTO jogador VALUES (16, 'suárez', 'atacante', 27, 1500000, 1);
INSERT INTO jogador VALUES (17, 'everton galdino', 'atacante', 25, 120000, 1);

-- CAMPEONATO

INSERT INTO campeonato VALUES (1, 'gaúcho', 2018);
INSERT INTO campeonato VALUES (2, 'paulista', 2018);
INSERT INTO campeonato VALUES (3, 'mineiro', 2018);
INSERT INTO campeonato VALUES (4, 'carioca', 2018);
INSERT INTO campeonato VALUES (5, 'pernambucano', 2018);
INSERT INTO campeonato VALUES (6, 'catarinense', 2018);
INSERT INTO campeonato VALUES (7, 'paranaense', 2018);
INSERT INTO campeonato VALUES (8, 'paranaense', 2006);
INSERT INTO campeonato VALUES (9, 'gaúcho', 2005);
INSERT INTO campeonato VALUES (10, 'paulista', 2007);

-- TEM

INSERT INTO tem VALUES (1, 1, 2, 6, 1);
INSERT INTO tem VALUES (1, 2, 2, 4, 2);
INSERT INTO tem VALUES (1, 3, 2, 4, 3);
INSERT INTO tem VALUES (1, 4, 2, 3, 4);

INSERT INTO tem VALUES (2, 9, 2, 6, 1);
INSERT INTO tem VALUES (2, 10, 2, 6, 2);

INSERT INTO tem VALUES (9, 3, 2, 3, 3);
INSERT INTO tem VALUES (9, 4, 2, 0, 4);

INSERT INTO tem VALUES (3, 7, 2, 6, 1);
INSERT INTO tem VALUES (3, 8, 2, 4, 2);

-- =================================
-- SELECTS
-- =================================

SELECT * FROM cidade;

SELECT * FROM clube;

SELECT * FROM jogador;

SELECT * FROM campeonato;

SELECT * FROM tem;

GO

-- ==================================
-- PROCEDURE
-- ==================================
-- Esta procedure recebe o nome de um clube como parâmetro
-- e retorna os jogadores pertencentes a esse clube.

CREATE OR ALTER PROCEDURE sp_ListarJogadoresClube
    @NomeClube VARCHAR(50) -- Nome do clube informado pelo usuário
AS
BEGIN

    SELECT
        jogador.nome AS Jogador,
        jogador.posicao,
        jogador.idade,
        jogador.salario
    FROM jogador
    INNER JOIN clube
        ON jogador.codclube = clube.codclube -- Relaciona jogador ao seu clube
    WHERE clube.nome = @NomeClube; -- Filtra apenas o clube informado

END;
GO


-- ==================================
-- FUNÇÃO MÉDIA SALARIAL
-- ==================================
-- Esta função calcula a média salarial dos jogadores
-- de um determinado clube.

CREATE OR ALTER FUNCTION fn_MediaSalarialClube
(
    @CodClube INT -- Código do clube
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    DECLARE @Media DECIMAL(10,2); -- Armazena a média calculada

    SELECT
        @Media = AVG(CAST(salario AS DECIMAL(10,2))) -- Calcula a média salarial
    FROM jogador
    WHERE codclube = @CodClube; -- Apenas jogadores do clube informado

    RETURN ISNULL(@Media,0); -- Retorna 0 caso não existam jogadores

END;
GO


-- ==================================
-- FUNÇÃO FOLHA SALARIAL
-- ==================================
-- Esta função calcula o total gasto com salários
-- de todos os jogadores de um clube.

CREATE OR ALTER FUNCTION fn_FolhaSalarialClube
(
    @CodClube INT -- Código do clube
)
RETURNS MONEY
AS
BEGIN

    DECLARE @Total MONEY; -- Armazena o valor total

    SELECT
        @Total = SUM(salario) -- Soma todos os salários do clube
    FROM jogador
    WHERE codclube = @CodClube;

    RETURN ISNULL(@Total,0); -- Retorna 0 caso não existam jogadores

END;
GO


-- ==================================
-- TABELA DE AUDITORIA
-- ==================================
-- Esta tabela armazena o histórico de alterações
-- realizadas nos salários dos jogadores.

IF OBJECT_ID('AuditoriaSalario','U') IS NULL
BEGIN

    CREATE TABLE AuditoriaSalario
    (
        idAuditoria INT IDENTITY(1,1) PRIMARY KEY, -- Identificador único
        codJogador INT,                            -- Código do jogador
        nomeJogador VARCHAR(100),                  -- Nome do jogador
        salarioAntigo MONEY,                       -- Salário antes da alteração
        salarioNovo MONEY,                         -- Salário após a alteração
        folhaClube MONEY,                          -- Folha salarial atualizada do clube
        dataAlteracao DATETIME DEFAULT GETDATE()   -- Data e hora da alteração
    );

END;
GO


-- ==================================
-- TRIGGER
-- ==================================
-- Esta trigger é executada automaticamente após
-- uma atualização na tabela jogador.
-- Sua função é registrar alterações salariais
-- na tabela AuditoriaSalario.

CREATE OR ALTER TRIGGER trg_AtualizaFolhaSalarial
ON jogador
AFTER UPDATE -- Executa após um UPDATE
AS
BEGIN

    IF UPDATE(salario) -- Verifica se a coluna salario foi alterada
    BEGIN

        INSERT INTO AuditoriaSalario
        (
            codJogador,
            nomeJogador,
            salarioAntigo,
            salarioNovo,
            folhaClube
        )
        SELECT
            i.codjogador,                         -- Código do jogador
            i.nome,                               -- Nome do jogador
            d.salario,                            -- Salário antes da alteração
            i.salario,                            -- Salário após a alteração
            dbo.fn_FolhaSalarialClube(i.codclube) -- Recalcula a folha salarial do clube
        FROM inserted i                           -- Dados novos
        INNER JOIN deleted d
            ON i.codjogador = d.codjogador;       -- Relaciona dados antigos e novos

    END;

END;
GO


-- ==================================
-- TESTES
-- ==================================

-- Lista todos os jogadores do Grêmio
EXEC sp_ListarJogadoresClube 'grêmio';
GO

-- Exibe a média salarial do clube de código 1
SELECT dbo.fn_MediaSalarialClube(1) AS MediaSalarial;
GO

-- Exibe a folha salarial total do clube de código 1
SELECT dbo.fn_FolhaSalarialClube(1) AS FolhaSalarial;
GO

-- Desativa a trigger temporariamente
DISABLE TRIGGER trg_AtualizaFolhaSalarial
ON jogador;

-- Atualiza o salário do jogador Luan
UPDATE jogador
SET salario = 500000
WHERE nome = 'luan';
GO

-- Reativa a trigger
ENABLE TRIGGER trg_AtualizaFolhaSalarial
ON jogador;

-- Exibe os jogadores atualizados
SELECT * FROM jogador;

-- Exibe o histórico de auditoria
SELECT * FROM AuditoriaSalario;
GO