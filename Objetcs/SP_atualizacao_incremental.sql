--EXEMPLO DE PROCEDURES COM PAR�METROS

DROP DATABASE IF EXISTS ANALITICO
GO
CREATE DATABASE ANALITICO
GO

DROP DATABASE IF EXISTS OPERACIONAL
GO
CREATE DATABASE OPERACIONAL
GO

USE OPERACIONAL
GO

DROP TABLE IF EXISTS TB_VENDA_MENSAL
GO

CREATE TABLE TB_VENDA_MENSAL (
	ID_VENDA INT IDENTITY(1,1),
	DATA_VENDA DATE,
	VAL_VENDA MONEY
)
GO
ALTER TABLE TB_VENDA_MENSAL ADD CONSTRAINT PK_VENDA PRIMARY KEY (ID_VENDA)
GO

INSERT INTO TB_VENDA_MENSAL VALUES 
('2021-01-01',3000),
('2021-02-01',3000),
('2021-03-01',3000),
('2021-04-01',3000),
('2021-05-01',3000),
('2021-06-01',3000),
('2021-07-01',3000),
('2021-08-01',3000),
('2021-09-01',3000),
('2021-10-01',3000),
('2021-11-01',3000),
('2021-12-01',3000),
('2022-01-01',3000),
('2022-02-01',3000),
('2022-03-01',3000),
('2022-04-01',3000),
('2022-05-01',3000),
('2022-06-01',3000)
GO

SELECT * FROM TB_VENDA_MENSAL
GO

USE ANALITICO
GO
--COPIA DA TABELA COM TODOS OS DADOS
SELECT 
	*
INTO
	fVendasMes
FROM 
	[OPERACIONAL].dbo.TB_VENDA_MENSAL
GO

SELECT * FROM fVendasMes
GO

--CARGA INCREMENTAL
USE OPERACIONAL
GO
INSERT INTO TB_VENDA_MENSAL VALUES 
('2022-07-01',3000),
('2022-08-01',3000),
('2022-09-01',3000),
('2022-10-01',3000),
('2022-11-01',3000),
('2022-12-01',3000)
--GO


CREATE PROCEDURE SP_ATUALIZACAO_INCREMENTAL (@MAX_DAT DATE) AS
BEGIN
	--TABELA DESTINO
	INSERT INTO fVendasMes (DATA_VENDA,VAL_VENDA)
	--TABELA DE ORIGEM
	SELECT DATA_VENDA,VAL_VENDA FROM [OPERACIONAL].dbo.TB_VENDA_MENSAL
		WHERE 
			DATA_VENDA > @MAX_DAT
END
GO

CREATE PROCEDURE SP_TESTE_ATUALIZACAO AS
BEGIN
DECLARE @MAX_DATA DATE = (SELECT MAX(DATA_VENDA) FROM ANALITICO.dbo.fVendasMes)
IF
(SELECT MAX(DATA_VENDA) FROM ANALITICO.dbo.fVendasMes) = (SELECT MAX(DATA_VENDA) FROM OPERACIONAL.dbo.TB_VENDA_MENSAL)
	SELECT 'N�O H� REGISTROS PARA ATUALIZAR NO DESTINO' AS RESULT
ELSE
	EXEC SP_ATUALIZACAO_INCREMENTAL @MAX_DATA
END
GO

USE ANALITICO
GO
--CHAMADA DA PROCEDURE
--==================================================
EXEC SP_TESTE_ATUALIZACAO


select * from fVendasMes