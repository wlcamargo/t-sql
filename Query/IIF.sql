--Utilização do IIF

-- Criando a tabela Pessoas
CREATE TABLE Pessoas (
    ID INT PRIMARY KEY,
    Nome NVARCHAR(50),
    Idade INT,
    Status NVARCHAR(20)
);

select * from Pessoas

-- Usando uma consulta SELECT com IIF para inserir dados na tabela
INSERT INTO Pessoas (ID, Nome, Idade, Status)
SELECT
    1,
    'João',
    25,
    IIF(25 >= 18, 'Adulto', 'Menor')
UNION ALL
SELECT
    2,
    'Maria',
    30,
    IIF(30 >= 18, 'Adulto', 'Menor')
UNION ALL
SELECT
    3,
    'Pedro',
    15,
    IIF(15 >= 18, 'Adulto', 'Menor')
GO

select * from Pessoas