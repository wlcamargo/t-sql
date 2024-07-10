--TRIGGER QUE EVITA UPDATE OU DELETE SEM WHERE

USE ADM
go

CREATE TRIGGER [dbo].[BLOCK_DML_SEM_WHERE] 
ON [dbo].[TB_REGISTRO] --ALTERAR NOME DA TABELA
FOR UPDATE, DELETE 
AS 
BEGIN 
  
    DECLARE 
        @Linhas_Alteradas INT = @@ROWCOUNT,
        @Linhas_Tabela INT = (SELECT SUM(row_count) FROM sys.dm_db_partition_stats WHERE [object_id] = OBJECT_ID('TB_REGISTRO')  AND (index_id <= 1)) --ALTERAR NOME DA TABELA
 
    IF (@Linhas_Alteradas >= @Linhas_Tabela)
    BEGIN 
		PRINT('Operações de DELETE e/ou UPDATE sem cláusula WHERE não são permitidas nesta tabela')
		PRINT('')
        ROLLBACK
    END 
END
GO

--TESTANDO TRIGGER
DELETE FROM  TB_REGISTRO