--AULA DE LAG

-- Criar a tabela Vendas
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    DataVenda DATE,
    Valor DECIMAL(10, 2)
);

-- Inserir alguns dados de vendas
INSERT INTO Vendas (ID, DataVenda, Valor)
VALUES
    (1, '2023-09-01', 100.00),
    (2, '2023-09-02', 150.00),
    (3, '2023-09-03', 200.00),
    (4, '2023-09-04', 120.00),
    (5, '2023-09-05', 180.00);


-- Usando a função LAG para calcular a diferença de valor entre as vendas
SELECT
    ID,
    DataVenda,
    Valor,
    LAG(Valor) OVER (ORDER BY DataVenda) AS ValorAnterior,
    Valor - LAG(Valor) OVER (ORDER BY DataVenda) AS Diferenca
FROM 
	Vendas
ORDER BY 
	DataVenda;
