/*SELECT coluna1, coluna2, ..., função_agregada(coluna)
FROM tabela
WHERE condição ... (quero cor tal , quero nome tal )
GROUP BY coluna1, coluna2, ... ( tabela dinamica preço por marca )
HAVING condição_sobre_agrupamento
ORDER BY coluna;*/ 

SELECT  TOP (100) * FROM 
FACTSALES

/*1. a) a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).*/

SELECT 
    channelkey,
    sum(SalesQuantity) AS totalVendas
FROM 
    FACTSALES
GROUP BY 
    channelkey;

/*2 b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).*/

SELECT 
    storekey,
    SUM(SalesQuantity) AS 'quantidade vendida', 
    SUM(ReturnQuantity) AS 'quantidade devolvida'
FROM 
    FactSales
GROUP BY 
    storekey;

/*c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007*/

SELECT
    channelKey as 'canal de venda',
    SUM(salesAmount) as 'faturamento total'
FROM
    FactSales
WHERE DateKey BETWEEN '20070101' and '20071231'
GROUP BY
    channelKey

/*2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).
*/

SELECT 
    ProductKey,
    SUM(SalesAmount)
    FROM
    FactSales
GROUP BY 
    ProductKey

/*



a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.*/

SELECT 
    ProductKey AS 'id do produto',
    SUM(SalesQuantity) AS QuantidadeVendida,
    SUM(SalesAmount) AS 'faturamento total'
FROM
    FactSales
    WHERE DateKey BETWEEN '20070101' and '20071231'
GROUP BY 
    ProductKey
HAVING 
    SUM(SalesAmount) > 5000000
ORDER BY 
    SUM(SalesAmount) DESC;




/*b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

SELECT top(10)
    ProductKey,
    SUM(SalesQuantity) AS QuantidadeVendida,
    SUM(SalesAmount) AS TotalVendido
FROM
    FactSales
GROUP BY 
    ProductKey
ORDER BY 
    SUM(SalesAmount) DESC;

/*
3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).*/

SELECT 
    CustomerKey AS "id do cliente",
    SUM(SalesQuantity) AS "total vendido"
FROM 
    FactOnlineSales
GROUP BY 
    CustomerKey
ORDER BY 
    SUM(SalesQuantity) DESC;

 /*b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).*/

SELECT 
    ProductKey AS 'ID do produto', 
    SUM(salesquantity) AS 'total vendido'
From 
    FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY
    ProductKey
ORDER BY SUM(SalesQuantity) DESC

/*DIMPRODUCT
4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/

--a

SELECT * FROM DimProduct
    SELECT 
    BrandName AS 'total produto por marca',
    COUNT (BrandName) AS 'qtd, produtos'
FROM
    DimProduct
GROUP BY
    BrandName


--b)

SELECT
    ClassName AS 'classe do produto',
    AVG(unitprice) AS 'media de preco'
FROM 
    DimProduct
GROUP BY
    ClassName

--c)
    SELECT 
    ColorName as 'cor',
    SUM(weight) as 'peso total'
    FROM 
    DimProduct
    GROUP BY 
        ColorName


/*Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em
ordem decrescente.*/


    