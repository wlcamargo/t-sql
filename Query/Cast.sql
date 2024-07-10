-- Usando CAST para converter um valor em um tipo diferente
DECLARE @numeroFloat FLOAT = 123.45;
DECLARE @numeroInt INT;

SET @numeroInt = CAST(@numeroFloat AS INT);

-- Exibindo o resultado
SELECT @numeroInt;