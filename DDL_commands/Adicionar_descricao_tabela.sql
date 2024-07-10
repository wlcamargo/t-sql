CREATE TABLE ExemploTabela (
    ID INT,
    Nome NVARCHAR(50)
);

-- Adicionando descrição à tabela
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Tabela de exemplo com ID e Nome', 
    @level0type=N'SCHEMA', 
    @level0name=N'dbo', 
    @level1type=N'TABLE', 
    @level1name=N'ExemploTabela';

