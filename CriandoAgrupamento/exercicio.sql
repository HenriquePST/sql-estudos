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


SELECT * 
    FROM
dimproduct

SELECT
    StockTypeName,
    SUM(Weight) AS [Peso Total]
FROM
    DimProduct
WHERE
    BrandName = 'Contoso'
GROUP BY
    StockTypeName
ORDER BY
    SUM(Weight) DESC;

/*6. Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as
16 opções de cores? */

SELECT DISTINCT
        BrandName as 'marca',
        count (DISTINCT ColorName) as 'qtd cores'
FROM  
        DimProduct
GROUP BY
    BrandName

SELECT DISTINCT
       ColorName
FROM   dimproduct
WHERE  brandname = 'contoso';

/* Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média
salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com os seus
conhecimentos em SQL.*/

select * from dimcustomer 

SELECT 
    gender,
    COUNT(gender) AS 'qtd total de clientes ',
    AVG(yearlyIncome) AS 'media_renda_anual'
FROM   
    dimcustomer
WHERE gender is not null
GROUP BY
    gender 

/* 8 -Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de
acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento. */

SELECT 
    education as 'nivel escolar',
    COUNT (gender) as 'qtd total',
    AVG (yearlyIncome) as 'media salarial'
FROM
    dimcustomer
WHERE education is not NULL
GROUP BY
    education

/*DIMEMPLOYEE
9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o
Departamento (DepartmentName). Importante: Você deverá considerar apenas os
funcionários ativos. */

SELECT TOP (10) *
FROM DIMEMPLOYEE;

SELECT 
    DepartmentName as 'departamento',
    COUNT(employeekey) AS 'qtda total dpto'
FROM
    DIMEMPLOYEE
WHERE STATUS  = 'Current'
GROUP BY
    departmentName
   
/*
10. Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000.*/



SELECT 
    Title as 'cargo',
    SUM(VacationHours) AS TotalVacationHours
FROM 
    DIMEMPLOYEE
WHERE 
    Gender = 'F'
    AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
    AND hiredate BETWEEN '1999-01-01' AND '2000-12-31'
GROUP BY 
    Title
ORDER BY 
   title



