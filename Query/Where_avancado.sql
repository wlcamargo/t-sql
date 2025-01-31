-- Where 

-- Criando tabelas fict�cias para exemplo de joins com subconsultas
CREATE TABLE TB_CLIENTE (
    ID_CLIENTE INT PRIMARY KEY,
    NOME NVARCHAR(50)
)
GO

CREATE TABLE TB_EMAIL (
    ID_EMAIL INT PRIMARY KEY,
    ID_CLIENTE INT,
    EMAIL NVARCHAR(100),
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE)
)
GO

CREATE TABLE TB_TELEFONE (
    ID_TELEFONE INT PRIMARY KEY,
    ID_CLIENTE INT,
    TELEFONE NVARCHAR(15),
    FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE)
)
GO

-- Inserindo dados fict�cios nas tabelas
INSERT INTO TB_CLIENTE (ID_CLIENTE, NOME)
VALUES
    (1, 'Cliente 1'),
    (2, 'Cliente 2'),
    (3, 'Cliente 3')
GO

INSERT INTO TB_EMAIL (ID_EMAIL, ID_CLIENTE, EMAIL)
VALUES
    (1, 1, 'cliente1@email.com'),
    (2, 2, 'cliente2@email.com'),
    (3, 3, 'cliente3@email.com')
GO

INSERT INTO TB_TELEFONE (ID_TELEFONE, ID_CLIENTE, TELEFONE)
VALUES
    (1, 1, '123-456-7890'),
    (2, 2, '987-654-3210')
GO


--Clientes com e-mail e telefone (no m�nimo 1 de cada)
SELECT C.ID_CLIENTE, c.NOME
FROM TB_CLIENTE c
WHERE EXISTS (
    SELECT 1
    FROM TB_EMAIL e
    WHERE e.ID_CLIENTE = c.ID_CLIENTE
) AND EXISTS (
    SELECT 1
    FROM TB_TELEFONE t
    WHERE t.ID_CLIENTE = c.ID_CLIENTE
)
GO

--Clientes com e-mail e sem telefone
SELECT c.ID_CLIENTE, c.NOME
FROM TB_CLIENTE c
WHERE EXISTS (
    SELECT 1
    FROM TB_EMAIL e
    WHERE e.ID_CLIENTE = c.ID_CLIENTE
) AND NOT EXISTS (
    SELECT 1
    FROM TB_TELEFONE t
    WHERE t.ID_CLIENTE = c.ID_CLIENTE
)
GO

--Clientes com telefone e sem e-mail
SELECT c.ID_CLIENTE, c.NOME
FROM TB_CLIENTE c
WHERE EXISTS (
    SELECT 1
    FROM TB_TELEFONE t
    WHERE t.ID_CLIENTE = c.ID_CLIENTE
) AND NOT EXISTS (
    SELECT 1
    FROM TB_EMAIL e
    WHERE e.ID_CLIENTE = c.ID_CLIENTE
)
GO

--Clientes sem e-mail e telefone
SELECT c.ID_CLIENTE, c.NOME
FROM TB_CLIENTE c
WHERE NOT EXISTS (
    SELECT 1
    FROM TB_EMAIL e
    WHERE e.ID_CLIENTE = c.ID_CLIENTE
) AND NOT EXISTS (
    SELECT 1
    FROM TB_TELEFONE t
    WHERE t.ID_CLIENTE = c.ID_CLIENTE
)
GO