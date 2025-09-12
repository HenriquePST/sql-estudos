
\-- **Funções de agregação e agrupamentos**

\-- Ver tabela completa
select \* from dimproduct


\-- Contar quantidade total por marca
SELECT
brandname as 'nome da marca',
count(\*) as 'quantidade total'
FROM
dimproduct
GROUP BY
BrandName


\-- Ver tabela DimStore
SELECT \* from DimStore


\-- Somar funcionários por tipo de loja
SELECT
storetype,
SUM(employeeCount) as 'total funcionarios'
FROM
DimStore
GROUP BY
StoreType


\- Média do custo do produto por marca
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


