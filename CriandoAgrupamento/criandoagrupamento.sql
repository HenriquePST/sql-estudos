
-- **Funções de agregação e agrupamentos**
-- Ver tabela completa
select * from dimproduct


-- Contar quantidade total por marca
SELECT
brandname as 'nome da marca',
count(*) as 'quantidade total'
FROM
dimproduct
GROUP BY
BrandName


-- Ver tabela DimStore
SELECT * from DimStore


-- Somar funcionários por tipo de loja () fiz um agrupamento pelo tipo da loja e somamos o total de funcionario para cada uma delas. 

SELECT
storetype,
    SUM(employeeCount) as 'total funcionarios'
FROM
    DimStore
GROUP BY
StoreType
ORDER BY SUM(employeeCount) DESC



-- Média do custo do produto por marca
SELECT
brandname,
AVG(unitcost) as 'media custo'
FROM
DimProduct
GROUP BY
BrandName


-- Máximo valor de preço unitário por classe
SELECT
classname,
MAX(unitprice) as 'preco maximo'
FROM
DimProduct
GROUP BY
ClassName




-- Isso vai retornar a lista de cores e a quantidade de produtos de cada cor da marca Contoso.
SELECT * FROM dimproduct

SELECT 
    COLORNAME AS 'COR DOS PRODUTOS',
    COUNT (*) AS ' TOTAL DE PRODUTOS'
FROM
    DimProduct
WHERE BrandName = 'contosto'
GROUP BY COLORNAME


/*SELECT coluna1, coluna2, ..., função_agregada(coluna)
FROM tabela
WHERE condição ... (quero cor tal , quero nome tal )
GROUP BY coluna1, coluna2, ... ( tabela dinamica preço por marca )
HAVING condição_sobre_agrupamento
ORDER BY coluna;*/ 

--( para fazer um filtro em dados agrupado usar, having)

SELECT * FROM dimproduct

SELECT 
    BrandName AS 'marca',
    COUNT(BrandName) AS 'totalPorMarca'
FROM 
    DimProduct
WHERE 
    ClassName = 'economy'  -- filtra a tabela antes do agrupamento
GROUP BY 
    BrandName
HAVING 
    COUNT(BrandName) >= 200  -- filtra a tabela depois do agrupamento
ORDER BY 
    totalPorMarca DESC;  -- opcional, para ver as marcas com maior quantidade primeiro
