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
    DimProduct.ProdructSubcategoryKey,
    ProductSubcategoryName
FROM    
    DimProduct
RIGHT JOIN DimProductsubCategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubCategoryKey

-- Multiplos Joins
USE ContosoRetailDW

SELECT productkey, productName, ProductSubcategorykey FROM DimProduct
SELECT productsubcategorykey, productsubcategoryName, Productcategorykey FROM DimProductsubcategory
SELECT ProductCategoryKey, ProductCategoryName FROM DimProductCategory

SELECT 
    productkey,
    productname,
    DimProduct.productsubcategorykey,
    productCategoryName,
    DimProductSubcategory.ProductSubcategoryName
FROM
    DimProduct
INNER JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey
        INNER JOIN DimProductCategory 
            ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- UNION (remove o duplicados )

SELECT 
*
FROM
DimCustomer
WHERE GENDER = 'F'
UNION -- <
SELECT
*FROM
DimCustomer
WHERE Gender = 'M'

-- UNION ALL (mantem todos os dados)
SELECT
FIRSTNAME,
BIRTHDATE
FROM
DimCustomer
WHERE Gender = 'F'
UNION ALL -- <
SELECT
FIRSTNAME, 
BIRTHDATE
FROM
DimCustomer
WHERE Gender = 'M'