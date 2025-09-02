USE ContosoRetailDW
-- Comando SELECT DISTINCT: Retorna os valores distintos de uma tabela

-- Retorne todas as linhas da tabela dimProduct
SELECT * FROM DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela dimProduct
SELECT DISTINCT colorName FROM DimProduct

-- Retorne todas as linhas da tabela dimEmployee
SELECT * FROM DimEmployee

-- Retorne os valores distintos da coluna DepartmentName da tabela dimEmployee
SELECT 
    DISTINCT DepartmentName 
FROM 
    DimEmployee