--EXEMPLO DE DISTINCT

-- Criar a tabela
CREATE TABLE Exemplo (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50)
)
GO

-- Inserir alguns dados com valores duplicados
INSERT INTO Exemplo (ID, Nome)
VALUES
    (1, 'João'),
    (2, 'Maria'),
    (3, 'João'),
    (4, 'Pedro'),
    (5, 'Maria')
GO

--CONSULTA TABELA COMPLETA
SELECT * FROM EXEMPLO

--CONSULTA SEM DUPLICADOS
SELECT DISTINCT(NOME) FROM EXEMPLO