--Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela

-- Logica
/*Os nomes dos produtos (provavelmente da tabela DimProduct)
Os nomes das subcategorias (da tabela DimProductSubcategory)
 juntar essas duas tabelas para mostrar o (nome do produto + nome da subcategoria) */


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

-- Logica
/*DimProductSubcategory.ProductCategoryKey com DimProductCategory.ProductCategoryKey
Se encontrar, trazer os dados 
Se não encontrar, preenche com NULL */


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

 
/*➡️ :
-- Logica
DimStore.GeographyKey com DimGeography.GeographyKey
Se encontrar, traz os dados do continente e país
Se não encontrar, preenche com NULL */


SELECT 
    storekey 'id loja ', 
    storename 'loja', 
    employeecount 'qtd funcionarios',
    DimGeography.ContinentName 'continente',
    DimGeography.RegionCountryName 'país'
FROM 
    DimStore
LEFT JOIN 
    DimGeography
    ON DimStore.GeographyKey = DimGeography.GeographyKey;

-- 4 Complementa a tabela DimProduct com a informação de ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes

SELECT top(10) * FROM DimProduct
SELECT top(10) * FROM DimProductCategory
SELECT top(10) * FROM DimProductSubcategory

SELECT top(15)
    productname,
    productcategorydescription
FROM
    DimProduct
LEFT JOIN  DimProductSubcategory
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
LEFT JOIN DimProductCategory
ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductcategoryKey


/*5 -A tabela FactStrategyPlan resume o planejamento estratégico da
empresa. Cada linha representa um montante destinado a uma
determinada AccountKey.

a. Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para
reconhecer a tabela.
*/

SELECT top 100 * FROM FactStrategyPlan
SELECT TOP 100 * FROM DimAccount


/*b. Faça um INNER JOIN para criar uma tabela contendo o
AccountName para cada AccountKey da tabela FactStrategyPlan. O
seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount*/

SELECT top 10
    strategyPlanKey,
    DateKey,
    AccountName,
    amount 
FROM 
    FactStrategyPlan 
INNER JOIN dimaccount  
ON FactStrategyPlan.AccountKey = DimAccount.AccountKey
ORDER BY amount

/*Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna
AccountKey que identifica o tipo de conta, há também uma outra coluna
chamada ScenarioKey. Essa coluna possui a numeração que identifica o
tipo de cenário: Real, Orçado e Previsão.
Faça um INNER JOIN para criar uma tabela contendo o ScenarioName
para cada ScenarioKey da tabela FactStrategyPlan. O seu SELECT final
deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount
*/

SELECT top 10
    strategyPlanKey,
    DateKey,
    Scenarioname,
    amount 
FROM 
    FactStrategyPlan 
INNER JOIN DimScenario  
ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

/* 7 - Algumas subcategorias não possuem nenhum exemplar de produto.
Identifique que subcategorias são essas*/

--Traz todos os registros da tabela da direita (DimProductSubcategory), mesmo que não haja correspondência na tabela da esquerda (DimProduct). Ou seja, ele mostra subcategorias que podem não estar associadas a nenhum produto.

--dimproduct
--dimproductsubcategory

SELECT 
    ProductName,
    ProductsubCategoryName
FROM
    DimProduct
RIGHT JOIN DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE 
    ProductName IS NULL;

/* A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para
as marcas Contoso, Fabrikam e Litware. Crie um código SQL para chegar
no mesmo resultado */

SELECT top 10 * from DimProduct
SELECT top 10 * from DimChannel

SELECT distinct
    BrandName,
    ChannelName
FROM
    DimProduct
cross JOIN DimChannel
where BrandName in ('contoso', 'fabrikam', 'litware')

/*Neste exercício, você deverá relacionar as tabelas FactOnlineSales com
DimPromotion. Identifique a coluna que as duas tabelas têm em comum e
utilize-a para criar esse relacionamento.
Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount
A sua consulta deve considerar apenas as linhas de vendas referentes a
produtos com desconto (PromotionName <> ‘No Discount’). Além disso,
você deverá ordenar essa tabela de acordo com a coluna DateKey, em
ordem crescente */ 


SELECT TOP 10
    OnlineSalesKey,
    DateKey,
    PromotionName,
    SalesAmount
FROM FactOnlineSales
INNER JOIN DimPromotion
    ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE PromotionName <> 'no discount'
ORDER BY DateKey;


/*A tabela abaixo é resultado de um Join entre a tabela FactSales e as
tabelas: DimChannel, DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com
SalesAmount.*/


SELECT top 10
    SalesKey,
    channelname,
    Storename,
    Productname,
    SalesAmount
FROM
    FactSales
INNER JOIN DimChannel
    ON FactSales.channelKey = DimChannel.channelKey
INNER JOIN DimStore
    ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
    ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount ASC






