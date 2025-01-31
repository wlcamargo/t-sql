--TRIGGER QUE CRIA TABELA DE LOGS

--CRIAR TABELA
CREATE TABLE TB_CADASTRO (
	ID INT IDENTITY (1,1),
	ALUNO VARCHAR(50) NOT NULL,
)
GO

--CRIAR TABELA DE LOG
CREATE TABLE TB_LOG_CADASTRO (
	ID INT,
	ALUNO VARCHAR(50),
	DATA_CADASTRO DATETIME,
	MENSAGEM VARCHAR(50)
)
GO

--CRIAR TRIGGER
CREATE TRIGGER TRG_ATUALIZA_LOG
ON TB_CADASTRO
FOR INSERT
AS
	DECLARE @ID INT
	DECLARE @ALUNO VARCHAR(50)
	DECLARE @DATA_CADASTRO DATETIME
	DECLARE @MENSAGEM VARCHAR(100)

	--CAPTURAR DADOS NA �REA TEMPOR�RIA
	SELECT @ID = ID FROM inserted
	SELECT @ALUNO = ALUNO FROM inserted

	--DADOS ADICIONADOS
	SET @DATA_CADASTRO = GETDATE()
	SET @MENSAGEM = 'ATUALIZADO POR TRG_ATUALIZA_LOG'

	INSERT INTO TB_LOG_CADASTRO VALUES (@ID,@ALUNO,@DATA_CADASTRO,@MENSAGEM)
GO

--INSERIR REGISTROS NA TABELA DE CADASTRO
INSERT INTO TB_CADASTRO VALUES ('WALLACE')
INSERT INTO TB_CADASTRO VALUES ('TULIO')
INSERT INTO TB_CADASTRO VALUES ('MIDIAN')
GO

--CONSULTA NA TABELA
SELECT * FROM TB_CADASTRO
GO

--CONSULTA NA TABELA
SELECT * FROM TB_LOG_CADASTRO
GO