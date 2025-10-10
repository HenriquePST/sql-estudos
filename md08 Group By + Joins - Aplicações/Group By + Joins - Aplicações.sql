-- GROUP BY + JOIN


-- 1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).
SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
group BY CalendarYear

-- 1.b) Considere apenas o mês (CalendarMonthLabel) de 'January'.
SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
WHERE CalendarMonthLabel = 'January'
group BY CalendarYear


-- 1.c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a de 1200000

SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
WHERE CalendarMonthLabel = 'January'
group BY CalendarYear
HAVING SUM(SalesQuantity) >= 1200000
SELECT TOP 100 * FROM FactSales
SELECT * FROM DimDate
  

SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
WHERE CalendarMonthLabel = 'January'
group BY CalendarYear
HAVING SUM(SalesQuantity) >= 1200000

/*a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.
*/

SELECT 
    ChannelName,
    SUM(SalesQuantity) AS TotalSales
FROM FactSales
INNER JOIN DimChannel
    ON FactSales.ChannelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC;

-- b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).

SELECT 
    StoreName,
    SUM(SalesQuantity) AS TotalSales,
    SUM(ReturnQuantity) AS TotalReturns
FROM FactSales
INNER JOIN DimStore
    ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName;


-- c) Faça um resumo do valor total vendido (SalesAmount) para cada mês (CalendarMonthLabel) e ano (CalendarYear) 

SELECT
    CalendarMonthLabel,
    CalendarYear,
    CalendarMonth,
    SUM(SalesAmount) AS TotalVendas
FROM
    FactSales
INNER JOIN
    DimDate ON FactSales.DateKey = DimDate.DateKey
GROUP BY
    CalendarMonthLabel,
    CalendarYear,
    CalendarMonth
ORDER BY
    CalendarMonth ASC;



-- 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesAmount) por cor do produto.



--a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).

SELECT
colorname,
SUM(SalesQuantity)
FROM
factsales
INNER JOIN dimproduct
ON factsales.productkey = dimproduct.productkey
GROUP BY colorname

--b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000. */ 

SELECT
    colorname,
    SUM(SalesQuantity) AS TotalSales
FROM
    factsales
INNER JOIN dimproduct
    ON factsales.productkey = dimproduct.productkey
GROUP BY
    colorname
HAVING
    SUM(SalesQuantity) >= 3000000
ORDER BY
    TotalSales DESC;


--Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto (ProductCategoryName). Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação entre FactSales e DimProductCategory não é direta.

SELECT TOP 10 * FROM factsales
SELECT top 10 * FROM dimproduct
SELECT top 10 * FROM dimproductsubcategory 
SELECT top 10 * FROM DimProductCategory 

SELECT TOP 10
    productcategoryname,
    SUM(SalesQuantity) AS TotalSales
FROM
    factsales
        INNER JOIN dimproduct 
                ON factsales.productkey = dimproduct.productkey
                    INNER JOIN dimproductsubcategory 
                        ON dimproduct.productsubcategorykey = dimproductsubcategory.productsubcategorykey
                             INNER JOIN DimProductCategory 
                                ON dimproductsubcategory.productcategorykey = DimProductCategory.productcategorykey
GROUP BY
    productcategoryname
ORDER BY
    TotalSales DESC;


-- 4. 4. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

SELECT top 10 * from FactSales
SELECT top 10 * from dimproduct
SELECT top 10 * from DimProductSubcategory
SELECT top 10 * from DimProductCategory

SELECT 
 dimcustomer.customerkey,
    firstname AS 'nome',
    lastname AS 'sobrenome',
    SUM(SalesQuantity) AS total_sales
FROM 
    FactOnlineSales
INNER JOIN 
    dimcustomer 
ON 
    FactOnlineSales.customerkey = dimcustomer.customerkey
WHERE 
    CustomerType = 'Person'
GROUP BY 
 dimcustomer.customerkey, firstname, lastname


-- b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.



SELECT top 10
   Productname as 'produto',
   SUM(SalesQuantity)
FROM
    FactOnlineSales
INNER JOIN DimProduct
    ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE CustomerKey = '7665 '
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC

--Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes.

SELECT 
    gender,
    SUM(salesquantity)
FROM
    FactOnlineSales
inner JOIN DimCustomer
 on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
 WHERE gender is not NULl 
 GROUP by Gender

 --6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100.


SELECT table_name, column_name
FROM information_schema.columns
WHERE column_name LIKE '%currencydescription%';

SELECT * FROM DimCurrency
SELECT * FROM FACTEXCHANGERATE

SELECT
    currencydescription,
    AVG(averagerate) AS 'tx media'
    FROM
DimCurrency
INNER JOIN FactExchangeRate
ON DimCurrency.CurrencyKey = FactExchangeRate.CurrencyKey
WHERE CurrencyDescription != 'Indian Rupee'
GROUP BY CurrencyDescription
HAVING AVG(AverageRate) BETWEEN 10 and 100


-- 7. Descubra o valor total na tabela FactStrategyPlan destinado aos cenários: Actual e Budget.

SELECT top 2 * from FactStrategyPlan
SELECT * from DimCustomer

SELECT
    ScenarioName,
    SUM(amount) AS TOTAL
FROM
    DimScenario
INNER JOIN
    FactStrategyPlan ON DimScenario.ScenarioKey = FactStrategyPlan.ScenarioKey
WHERE
    ScenarioName != 'Forecast'
GROUP BY
    ScenarioName



--8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano.


SELECT top 10 * from FactStrategyPlan
SELECT * from DimDate

SELECT
    CalendarYear as 'ano',
    SUM(amount) as 'total'
FROM
    FactStrategyPlan
INNER JOIN DimDate
    ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear


--9. Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em consideração em sua análise apenas a marca Contoso e a cor Silver.

SELECT TOP 10 * FROM DimProduct
SELECT
    ProductSubcategoryName,
    COUNT(*) AS TotalProdutos
FROM
    DimProduct
INNER JOIN
    DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE
    BrandName = 'Contoso' AND ColorName = 'Silver'
GROUP BY
    ProductSubcategoryName



-- 10. Faça um agrupamento duplo de quantidade de produtos por BrandName e  ProductSubcategoryName. A tabela final deverá ser ordenada de acordo com a coluna BrandName.


SELECT
    ProductSubcategoryName,
    BrandName,
    COUNT(*) AS TotalProdutos
FROM
    DimProduct
INNER JOIN
    DimProductSubcategory
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName ASC

