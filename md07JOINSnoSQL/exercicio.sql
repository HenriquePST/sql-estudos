--Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela



SELECT TOP 10 *
FROM DimProductSubcategory

SELECT top 10 * 
FROM DimProduct

 SELECT 
    ProductKey AS 'id',
    ProductName AS 'nome',
    ProductSubcategoryName AS 'subcategoria'
FROM 
    DimProduct 
INNER JOIN 
    DimProductSubcategory  ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey


--2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e  DimProductCategory. Utilize essa coluna para complementar informações na tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.

SELECT * from DimProductSubcategory
SELECT * from  DimProductCategory

SELECT
    ProductSubcategoryKey AS 'id', 
    ProductSubcategoryName AS 'subcategoria',
    ProductCategoryName AS 'categoria'
FROM
    DimProductSubcategory
LEFT JOIN
    DimProductCategory
    ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;
    
-- 3 Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados (de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT JOIN neste exercício.



SELECT 
*
 FROM
DimStore

SELECT
* FROM
DimGeography



