CREATE TABLE ExemploTabela (
    ID INT,
    Nome NVARCHAR(50)
);

-- Adicionando descrições e comentários às colunas
EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Identificador único da tabela', 
    @level0type=N'SCHEMA', 
    @level0name=N'dbo', 
    @level1type=N'TABLE', 
    @level1name=N'ExemploTabela', 
    @level2type=N'COLUMN', 
    @level2name=N'ID';

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
    @value=N'Nome da entidade', 
    @level0type=N'SCHEMA', 
    @level0name=N'dbo', 
    @level1type=N'TABLE', 
    @level1name=N'ExemploTabela', 
    @level2type=N'COLUMN', 
    @level2name=N'Nome';

        
		
		
		
