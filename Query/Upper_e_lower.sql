--AULA DE UPPER E LOWER
SELECT 
    LOWER([NOME_CLIENTE]) as NOME_MINUSCULO
FROM 
	[TB_CLIENTES]

SELECT 
    UPPER([NOME_CLIENTE]) as NOME_MAIUSCULO
FROM 
	[TB_CLIENTES]

PRINT(lower('WaLLace'))
PRINT(upper('wallace'))
