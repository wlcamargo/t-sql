--INNER JOIN

--Quando usar o inner Join?
--R: Quando quiser trazer correspondências presentes nas duas tabelas 

CREATE TABLE TB_ALUNOS(
	ID_CLIENTE INT,
	NOME VARCHAR(50)
)
GO

INSERT INTO TB_ALUNOS VALUES
(1,'WALLACE'),
(2,'TULIO'),
(3,'MIDIAN'),
(4,'ADAIL'),
(5,'ANDERSON'),
(6,'BRUNO'),
(7,'DANILO'),
(8,'EDUARDO')
GO

CREATE TABLE TB_EMAIL(
	ID_CLIENTE INT,
	EMAIL VARCHAR(50)
)
GO

INSERT INTO TB_EMAIL VALUES
(1,'WALLACE@GMAIL'),
(2,'TULIO@GMAIL')
GO

--JUNTAR TABELAS E TRAZER SOMENTE CLIENTES COM EMAIL
SELECT 
	TA.ID_CLIENTE,
	TA.NOME,
	TE.EMAIL
FROM
	TB_ALUNOS TA
	INNER JOIN TB_EMAIL TE ON TA.ID_CLIENTE = TE.ID_CLIENTE
