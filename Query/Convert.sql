-- Convertendo uma string em um valor num�rico
DECLARE @numeroString NVARCHAR(10) = '12345';
DECLARE @numeroInt INT;

SET @numeroInt = CONVERT(INT, @numeroString);

-- Exibindo o resultado
SELECT @numeroInt;