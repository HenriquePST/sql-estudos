SELECT * FROM DimProduct 

-- ==============================filtro============================================
SELECT brandName
FROM DimProduct
WHERE BrandName = 'Contoso'

-- ================= ordenação, Ordenação descrescente eM mais de uma tabela =============
SELECT brandname
FROM DimProduct
ORDER BY BrandName

SELECT brandname
FROM DimProduct
ORDER BY BrandName DESC

SELECT brandname, ProductName
FROM DimProduct
ORDER BY BrandName,ProductName

-- select top 
SELECT top 10 brandname,ProductName
FROM DimProduct
ORDER BY BrandName DESC

-- ====================== select distinct ( elimina duplicidade )===============================
SELECT distinct brandname
FROM DimProduct
ORDER BY BrandName 

-- =================== sql max e min ( menor preço e maior preço)========================

SELECT MIN(unitprice) 
FROM DimProduct

SELECT 
       MAX(FactSales.UnitPrice) AS MaxUnitPrice
FROM DimProduct
INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey
INNER JOIN DimDate ON FactSales.DateKey = DimDate.DateKey
WHERE DimDate.CalendarYear = 2007

-- =========================== sql select COUNT, SUM, AND AVG ===========================

SELECT COUNT(productkey)
FROM DimProduct

SELECT SUM(UnitCost)
FROM DimProduct

SELECT AVG(UnitCost)
FROM DimProduct


--==========================SQL WHERE AND, OR, NOT =====================

SELECT ProductKey, productname,
ColorName
FROM DimProduct
WHERE ColorName = 'Blue' OR ColorName = 'Silver'

SELECT ProductKey, productname,
ColorName
FROM DimProduct
WHERE ColorName = 'Blue' AND ColorName = 'Silver'

SELECT ProductKey, productname,
ColorName
FROM DimProduct
WHERE NOT ColorName = 'Blue'

-- =============================SQL WHERE IN, NOT IN =======================

SELECT ProductKey, productname,
ColorName
FROM DimProduct
WHERE ColorName IN ('Blue', 'Silver')

SELECT ProductKey, productname,
ColorName
FROM DimProduct
WHERE ColorName NOT IN ('Blue', 'Silver')

SELECT ProductKey, productname, UnitPrice,
ColorName
FROM DimProduct
WHERE (UnitPrice >= 12.99 AND UnitPrice <= 134.00)
ORDER BY UnitPrice DESC

-- =====================SQL WHERE BETWEEN, NOT BETWEEN================================

SELECT ProductKey, productname, UnitPrice,
ColorName
FROM DimProduct
WHERE UnitPrice BETWEEN 12.99 AND 134.00
ORDER BY UnitPrice 

SELECT ProductKey, productname, UnitPrice,
ColorName
FROM DimProduct
WHERE UnitPrice NOT BETWEEN 12.99 AND 134.00
ORDER BY UnitPrice 

SELECT 
    COUNT(ProductKey) AS TotalProdutos,
    SUM(UnitPrice) AS SomaPreco
FROM DimProduct
WHERE ColorName BETWEEN 'Blue' AND 'Silver'

SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'

---============================= WHERE LIKE %=========================================
-- CONTENDO TEXTO  '%TEXTO%'
-- COMEÇA TEXTO  'TEXTO%'
-- TERMINA TEXTO '%TEXTO'

SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 PLAYER%'

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '1GB%'

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%WMA'

--- sql is NuLL

SELECT * FROM DimCustomer
--WHERE CompanyName IS NOT NULL
WHERE CompanyName IS NULL


-- ====================SQL GROUP BY =============================================

SELECT top 10 * FROM dimproduct

SELECT BrandName, COUNT(productkey)
FROM DimProduct
GROUP BY brandName

SELECT BrandName, COUNT(productkey) as 'qtda de prod'
FROM DimProduct
WHERE BrandName is not NULL
GROUP BY brandName

-- =================== inner Join pk e fk ======================================

SELECT 
       MAX(FactSales.UnitPrice) AS MaxUnitPrice
FROM DimProduct
INNER JOIN FactSales 
ON DimProduct.ProductKey = FactSales.ProductKey
INNER JOIN DimDate 
ON FactSales.DateKey = DimDate.DateKey



