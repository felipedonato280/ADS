-- Verifica se o banco já existe
IF DB_ID('Campeonato_Futebol') IS NULL
BEGIN
    CREATE DATABASE Campeonato_Futebol;
END;
GO

-- Seleciona o banco para uso
USE Campeonato_Futebol;
GO

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

-- Esta procedure é responsável por realizar a contratação
-- de um novo jogador para um clube.
--
-- Antes de efetuar o cadastro, são realizadas validações:
-- 1) Verifica se o clube informado existe na base de dados.
-- 2) Verifica se já existe um jogador cadastrado com o mesmo nome.
--
-- Caso todas as validações sejam aprovadas, o jogador é inserido
-- na tabela jogador.

CREATE OR ALTER PROCEDURE sp_ContratarJogador
(
    @CodJogador INT,      -- ID do jogador
    @Nome VARCHAR(30),    -- Nome do jogador
    @Posicao VARCHAR(20), -- Posição em campo
    @Idade INT,           -- Idade do jogador
    @Salario FLOAT,       -- Salário do jogador
    @CodClube INT         -- Clube ao qual o jogador pertence
)
AS
BEGIN

    -- Verifica se o clube informado existe na tabela clube.
    -- Caso não exista, a execução da procedure é interrompida.
    IF NOT EXISTS
    (
        SELECT 1
        FROM clube
        WHERE codclube = @CodClube
    )
    BEGIN
        PRINT 'Clube não encontrado.';
        RETURN;
    END;

    -- Verifica se já existe um jogador cadastrado
    -- com o mesmo nome.
    IF EXISTS
    (
        SELECT 1
        FROM jogador
        WHERE nome = @Nome
    )
    BEGIN
        PRINT 'Jogador já cadastrado.';
        RETURN;
    END;

    -- Realiza a inserção do novo jogador na tabela.
    INSERT INTO jogador
    (
        codjogador,
        nome,
        posicao,
        idade,
        salario,
        codclube
    )
    VALUES
    (
        @CodJogador,
        @Nome,
        @Posicao,
        @Idade,
        @Salario,
        @CodClube
    );

    -- Mensagem exibida ao usuário indicando sucesso.
    PRINT 'Jogador contratado com sucesso.';

END;
GO


-- ==================================
-- FUNCTION
-- ==================================

-- Esta função recebe um valor salarial como parâmetro
-- e retorna uma classificação textual.
--
-- O objetivo é categorizar os jogadores de acordo
-- com a faixa salarial recebida.

CREATE OR ALTER FUNCTION fn_ClassificacaoSalarial
(
    @Salario MONEY -- Salário que será analisado
)
RETURNS VARCHAR(20)
AS
BEGIN

    -- Variável responsável por armazenar o resultado.
    DECLARE @Classificacao VARCHAR(20);

    -- Salários abaixo de R$ 200.000 são classificados
    -- como Baixo Salário.
    IF @Salario < 200000
        SET @Classificacao = 'Baixo Salario';

    -- Salários entre R$ 200.000 e R$ 499.999
    -- são classificados como Médio Salário.
    ELSE IF @Salario < 500000
        SET @Classificacao = 'Medio Salario';

    -- Salários iguais ou superiores a R$ 500.000
    -- são classificados como Alto Salário.
    ELSE
        SET @Classificacao = 'Alto Salario';

    -- Retorna a classificação calculada.
    RETURN @Classificacao;

END;
GO


-- ==================================
-- FUNÇÃO FOLHA SALARIAL PARA ASSOCIAR A TRIGGER
-- ==================================

-- Esta função calcula a folha salarial de um clube.
--
-- Folha salarial é o valor total gasto com salários
-- de todos os jogadores pertencentes ao clube informado.
--
-- Esta função é utilizada pela trigger para registrar
-- na auditoria o valor atualizado da folha salarial
-- após uma alteração de salário.

CREATE OR ALTER FUNCTION fn_FolhaSalarialClube
(
    @CodClube INT -- Código do clube
)
RETURNS MONEY
AS
BEGIN

    -- Variável responsável por armazenar a soma.
    DECLARE @Total MONEY;

    -- Soma todos os salários dos jogadores do clube.
    SELECT
        @Total = SUM(salario)
    FROM jogador
    WHERE codclube = @CodClube;

    -- Caso não existam jogadores, retorna 0.
    RETURN ISNULL(@Total,0);

END;
GO


-- ==================================
-- TABELA DE AUDITORIA
-- ==================================

-- Esta tabela tem a função de armazenar um histórico
-- de alterações salariais realizadas nos jogadores.
--
-- Sempre que um salário for modificado, a trigger
-- registrará as informações nesta tabela.

IF OBJECT_ID('AuditoriaSalario','U') IS NULL
BEGIN

    CREATE TABLE AuditoriaSalario
    (
        idAuditoria INT IDENTITY(1,1) PRIMARY KEY, -- Identificador único da auditoria
        codJogador INT,                            -- Código do jogador alterado
        nomeJogador VARCHAR(100),                  -- Nome do jogador alterado
        salarioAntigo MONEY,                       -- Salário antes da atualização
        salarioNovo MONEY,                         -- Salário após a atualização
        folhaClube MONEY,                          -- Folha salarial atualizada do clube
        dataAlteracao DATETIME DEFAULT GETDATE()   -- Data e hora da alteração
    );

END;
GO

SELECT * FROM AuditoriaSalario;
GO


-- ==================================
-- TRIGGER
-- ==================================

-- Esta trigger é executada automaticamente após
-- uma operação UPDATE na tabela jogador.
--
-- Seu objetivo é registrar alterações salariais
-- na tabela AuditoriaSalario.
--
-- Além disso, a trigger utiliza a função
-- fn_FolhaSalarialClube para recalcular a folha
-- salarial do clube após a alteração.

CREATE OR ALTER TRIGGER trg_AtualizaFolhaSalarial
ON jogador
AFTER UPDATE -- Executa após a atualização dos dados
AS
BEGIN

    -- Verifica se a coluna salario participou do UPDATE.
    IF UPDATE(salario)
    BEGIN

        -- Insere um registro na tabela de auditoria.
        INSERT INTO AuditoriaSalario
        (
            codJogador,
            nomeJogador,
            salarioAntigo,
            salarioNovo,
            folhaClube
        )
        SELECT

            i.codjogador, -- Código do jogador atualizado
            i.nome,       -- Nome do jogador atualizado
            d.salario,    -- Valor antigo obtido da tabela virtual deleted
            i.salario,    -- Valor novo obtido da tabela virtual inserted
            dbo.fn_FolhaSalarialClube(i.codclube)
            -- Recalcula a folha salarial do clube após a alteração

        FROM inserted i
        -- inserted contém os registros após o UPDATE
        -- deleted contém os registros antes do UPDATE
        INNER JOIN deleted d
            ON i.codjogador = d.codjogador;

    END;

END;
GO


-- ==================================
-- TESTES
-- ==================================

-- ==================================
-- TESTE PROCEDURE
-- ==================================

EXEC sp_ContratarJogador
    18,
    'Cristiano Ronaldo',
    'Atacante',
    39,
    2000000,
    1;
GO

-- Verifica se o jogador foi inserido
SELECT *
FROM jogador
WHERE codjogador = 18;
GO

-- ==================================
-- TESTE FUNCTION
-- ==================================

SELECT
    nome,
    salario,
    dbo.fn_ClassificacaoSalarial(salario) AS Classificacao
FROM jogador;
GO


-- ==================================
-- TESTES DA FUNCTION + TRIGGER
-- ==================================

-- Atualiza o salário do Luan
UPDATE jogador
SET salario = 600000
WHERE nome = 'luan';
GO

-- Exibe o histórico de auditoria
SELECT *
FROM AuditoriaSalario;
GO

-- ==================================
-- TESTE DA FOLHA SALARIAL
-- ==================================

SELECT dbo.fn_FolhaSalarialClube(1) AS FolhaSalarialGremio;
GO

-- ==================================
-- ALTERAR ESTADO DA TRIGGER
-- ==================================

-- Desativa a trigger temporariamente
DISABLE TRIGGER trg_AtualizaFolhaSalarial
ON jogador;


-- Reativa a trigger
ENABLE TRIGGER trg_AtualizaFolhaSalarial
ON jogador;