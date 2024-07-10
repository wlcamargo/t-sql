--EXEMPLO DE REPLACE

CREATE TABLE [dbo].[TB_CLIENTES](
	[ID_CLIENTE] [int] IDENTITY(1,1),
	[NOME_CLIENTE] [varchar](20),
	[MORADA_CLIENTE] [varchar](50),
	[SEXO_CLIENTE] [char](1),
)

INSERT INTO TB_CLIENTES VALUES
('WALLACE', 'RUA DE PORTUGAL','M'),
('SIDNEY', 'RUA DE AVEIRO','M'),
('KAROL', 'RUA DE LISBOA','F')

SELECT * FROM TB_CLIENTES

SELECT 
	  [ID_CLIENTE]
      ,[NOME_CLIENTE]
      ,[MORADA_CLIENTE]
      ,[SEXO_CLIENTE]
	  ,REPLACE([SEXO_CLIENTE],'M','MASC') AS SEXO_ALTERADO
  FROM [ADM].[dbo].[TB_CLIENTES]

