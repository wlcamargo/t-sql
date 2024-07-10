--Exemplo de Unpivot

CREATE TABLE Vendas (
    Produto VARCHAR(50),
    Janeiro INT,
    Fevereiro INT,
    Março INT
)
GO

INSERT INTO Vendas (Produto, Janeiro, Fevereiro, Março)
VALUES
    ('ProdutoA', 100, 150, 200),
    ('ProdutoB', 75, 90, 120),
    ('ProdutoC', 200, 250, 300)
GO

SELECT * FROM Vendas


SELECT Produto, Mes, Valor
FROM Vendas
UNPIVOT (
    Valor FOR Mes IN (Janeiro, Fevereiro, Março)
) AS UnpivotedData;