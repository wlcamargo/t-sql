DECLARE @dbName NVARCHAR(128);
DECLARE @sql NVARCHAR(MAX);

-- Tabela temporária para armazenar os resultados
CREATE TABLE #TableCounts (
    DatabaseName NVARCHAR(128),
    TableCount INT
);

-- Cursor para iterar sobre cada banco de dados
DECLARE db_cursor CURSOR FOR
SELECT name 
FROM sys.databases 
WHERE state_desc = 'ONLINE' -- Considera apenas os bancos de dados online
AND name NOT IN ('master', 'tempdb', 'model', 'msdb'); -- Exclui os bancos de sistema

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @dbName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Monta a consulta dinâmica para contar as tabelas em cada banco de dados
    SET @sql = 'INSERT INTO #TableCounts (DatabaseName, TableCount)
                SELECT ''' + @dbName + ''', COUNT(*) 
                FROM [' + @dbName + '].sys.tables';

    -- Executa a consulta
    EXEC sp_executesql @sql;

    FETCH NEXT FROM db_cursor INTO @dbName;
END;

-- Fecha e deleta o cursor
CLOSE db_cursor;
DEALLOCATE db_cursor;

-- Exibe o resultado
SELECT * FROM #TableCounts;

-- Limpa a tabela temporária
DROP TABLE #TableCounts;

