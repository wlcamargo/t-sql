-- DATEADD - FUN��ES DE TIME INTELLIGENCE

DROP TABLE IF EXISTS TB_VENDAS
GO

--CRIAR TABELA DE VENDAS
CREATE TABLE TB_VENDAS (
	DATA_VENDA DATE,
	VAL_VENDA MONEY
)
GO

--INSERIR REGISTROS
INSERT INTO TB_VENDAS VALUES
('2021-01-01',3400),
('2021-02-01',5000),
('2021-03-01',2300),
('2021-04-01',1100),
('2021-05-01',2950),
('2021-06-01',3800),
('2021-07-01',7500),
('2021-08-01',2300),
('2021-09-01',8000),
('2021-10-01',6500),
('2021-11-01',3000),
('2021-12-01',1300),
('2022-01-01',4000),
('2022-02-01',5000),
('2022-03-01',2455),
('2022-04-01',5678),
(GETDATE(),1345),
(GETDATE(),4321),
(GETDATE(),2345),
(GETDATE(),3245)
GO

SELECT * FROM TB_VENDAS
GO

--EXIBIR DIA ATUAL
PRINT(GETDATE())

--BUSCAR OS �LTIMOS 3 MESES (A PARTIR DO ATUAL)
SELECT  
	DATA_VENDA,
	VAL_VENDA
FROM 
	TB_VENDAS
WHERE
	DATA_VENDA >= DATEADD(MONTH,-3,GETDATE())
