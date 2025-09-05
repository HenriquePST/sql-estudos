-- COMANDOS WHERE, AND OR NOT

USE ContosoRetailDW


SELECT * FROM DimProduct 

SELECT TOP(1) UnitPrice FROM DimProduct
ORDER BY UnitPrice DESC


-- Quais são os produtos que têm preço unitário maior ou igual a 2000, listados em ordem crescente de preço

SELECT
    PRODUCTNAME AS 'PRODUTO',
    UNITPRICE AS 'PREÇO'
FROM 
    DimProduct
WHERE UnitPrice >= 2000

ORDER BY 
    UNITPRICE ASC

-- Quais são todos os produtos da marca Fabrikam e Black na tabela DimProduct?”

SELECT DISTINCT 
    brandName 
FROM 
    DimProduct

SELECT * FROM DimProduct
Where BrandName = 'Fabrikam'

SELECT * FROM DimProduct
Where colorname = 'Black'

--Quais são os  clientes nasceram apos o dia 31-12-1970.

SELECT * FROM DimCustomer
WHERE BirthDate > = '1970-12-31' --FORMATO 'yyyy-mm-dd'
ORDER BY
    BirthDate DESC


-- Seleciona todas as linhas da tabela em que o nome é fabrikam OU a cor é azul.
SELECT * FROM DimProduct
WHERE BrandName ='Fabrikam' AND ColorName = 'Blue'

-- Seleciona todas as linhas da tabela em que o nome é contoso OU cor é PRETA.
SELECT * FROM DimProduct 
Where BrandName = 'Contoso' OR ColorName = 'Black' 

-- Seleciona todas as linhas da tabela em que o nome é contoso OU Nome é fabrikam OU Cor azul 
SELECT * FROM DimProduct 
Where BrandName = 'Contoso' OR BrandName = 'Fabrikam' OR ColorName = 'Blue'

-- Seleciona todas as linhas da tabela em que o nome do departamento NÃO é Marketing
SELECT * FROM DimEmployee 
Where NOT DepartmentName = 'Marketing' 

SELECT * FROM DimEmployee
WHERE NOT MiddleName = 'NULL' 

