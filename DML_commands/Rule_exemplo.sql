--RULE
--CRIAR UMA REGRA NA COLUNA

CREATE TABLE TB_ALUNOS (
	ID INT,
	NOME VARCHAR(30),
	SALARIOS MONEY
)
GO

INSERT INTO TB_ALUNOS VALUES
(1,'NEYMAR',8000),
(2,'RONALDINHO',9500),
(3,'PELE',12000)
GO

--CRIAR REGRA
CREATE RULE RL_SALARIO_MIN AS @SALARIO >=6000
GO

--ASSOCIAR REGRA A COLUNA DA TABELA
EXECUTE sp_bindrule RL_SALARIO_MIN, 'TB_ALUNOS.SALARIOS'
GO

--TENTATIVA DE VIOLAR A REGRA
INSERT INTO TB_ALUNOS VALUES
(4,'RIVALDO',3000)
GO

--RESPEITANDO A REGRA
INSERT INTO TB_ALUNOS VALUES
(4,'RIVALDO',6000)
GO
