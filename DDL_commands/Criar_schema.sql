--CRIAR SCHEMA
USE ADM
GO

CREATE SCHEMA LOGS;
GO
--Criando tabela no Schema
CREATE TABLE LOGS.PYTHON (ROWID int IDENTITY (1,1), APPLICATION VARCHAR(100));

--Adicionar tabela existente ao novo schema
CREATE SCHEMA teste;

--Aterando dbo para Schema criado
alter schema teste transfer dbo.TB_REGISTRO 
go