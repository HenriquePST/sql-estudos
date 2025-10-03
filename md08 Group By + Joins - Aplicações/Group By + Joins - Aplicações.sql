-- GROUP BY + JOIN
-- 1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).
-- 1.b) Considere apenas o mês (CalendarMonthLabel) de 'January'.
-- 1.c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a de 1200000


SELECT TOP 100 * FROM FactSales
SELECT * FROM DimDate
  
-- a  
SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
group BY CalendarYear


-- b
SELECT
CalendarYear as 'ano',
SUM(SalesQuantity) as 'total vendido'
FROM
FactSales
INNER JOIN DimDate
ON FactSales.DateKey = dimdate.Datekey
WHERE CalendarMonthLabel = 'January'
group BY CalendarYear

-- c 
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
b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).
c) Faça um resumo do valor total vendido (SalesAmount) para cada mês
(CalendarMonthLabel) e ano (CalendarYear).*/

-- a
SELECT 
    ChannelName,
    SUM(SalesQuantity) AS TotalSales
FROM FactSales
INNER JOIN DimChannel
    ON FactSales.ChannelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC;


-- b
SELECT 
    StoreName,
    SUM(SalesQuantity) AS TotalSales,
    SUM(ReturnQuantity) AS TotalReturns
FROM FactSales
INNER JOIN DimStore
    ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName;

--c

SELECT * from dimdate
    SELECT
   CalendarMonthLabel,
    CalendarYear,
    calendarMONTH,
    SUM(SalesAmount)
    FROM
    FactSales
    INNER JOIN DimDate
    on factsales.Datekey = dimdate.Datekey
    GROUP BY CalendarMonthLabel,CalendarYear,calendarMONTH
    ORDER BY calendarMONTH ASC


/* 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto.
a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000. */ 

SELECT * from DimProduct