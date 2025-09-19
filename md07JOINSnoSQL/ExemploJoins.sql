--- EXEMPLO INNER JOIN, LEFT JOIN E RIGHT JOIN 

SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct 
SELECT ProductSubcategoryKey, ProductSubcategoryName FROM DimProductSubcategory


--inner
SELECT 
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM    
    DimProduct
INNER JOIN DimProductsubCategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubCategoryKey


--Left 
SELECT 
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM    
    DimProduct
LEFT JOIN DimProductsubCategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubCategoryKey

--RIGTH
SELECT 
    ProductKey,
    ProductName,
    DimProduct.ProductSubcategoryKey,
    ProductSubcategoryName
FROM    
    DimProduct
RIGHT JOIN DimProductsubCategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubCategoryKey