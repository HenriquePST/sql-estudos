-- Seleção simples da tabela FactSales
SELECT TOP (100) * 
FROM FactSales;

-- Função SUM: total vendido e total devolvido
SELECT 
    SUM(SalesQuantity) AS 'Total Vendido',
    SUM(ReturnQuantity) AS 'Total Devolvido'
FROM FactSales;

-- Visualização da tabela DimProduct
SELECT * 
FROM DimProduct;

-- Função COUNT: contagem total de registros na tabela
SELECT 
    COUNT(*) AS 'Total de Produtos'
FROM DimProduct;

-- Função COUNT: contagem de valores não nulos em uma coluna
SELECT 
    COUNT(ProductName) AS 'Qtd de Produtos com Nome'
FROM DimProduct;

-- Função COUNT + DISTINCT: contagem de cores distintas
SELECT 
    COUNT(DISTINCT ColorName) AS 'Qtd de Cores Distintas'
FROM DimProduct;

-- Função MAX: maior preço unitário
SELECT 
    MAX(UnitPrice) AS 'Preço Máximo'
FROM DimProduct;

-- Funções MIN e MAX: custo mínimo e máximo
SELECT 
    MIN(UnitCost) AS 'Custo Mínimo',
    MAX(UnitCost) AS 'Custo Máximo'
FROM DimProduct;

-- 

-- Visualizar todos os dados da tabela DimCustomer
SELECT * 
FROM DimCustomer;

-- Função AVG: média da renda anual dos clientes
SELECT 
    AVG(YearlyIncome) AS 'Média Anual de Salário'
FROM DimCustomer;


