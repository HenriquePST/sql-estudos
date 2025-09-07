--Exercicio 

/* 1- Você é o gerente da área de compras e precisa criar um relatório com as TOP 100 vendas, de
acordo com a quantidade vendida. Você precisa fazer isso em 10min pois o diretor de compras
solicitou essa informação para apresentar em uma reunião.
Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total
vendido (SalesAmount). */


SELECT 
    TOP (100) *
FROM 
    FactSales
ORDER BY SalesQuantity DESC


/* 2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. Porém, a
empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um.
O que você precisará fazer é ordenar esses top 10 produtos, de acordo com a coluna de
UnitPrice e, além disso, estabelecer um critério de desempate, para que seja mostrado na
ordem, do maior para o menor.
Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar
um segundo critério de desempate (além do peso). */

SELECT 
    TOP (10) *
FROM
     DimProduct
ORDER BY 
    UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC -- MAS DE UMA ORDENAÇÃO ADC , 


/* 3 - Você é responsável pelo setor de logística da empresa Contoso e precisa dimensionar o
transporte de todos os produtos em categorias, de acordo com o peso.
Os produtos da categoria A, com peso acima de 100kg, deverão ser transportados na primeira
leva.
Faça uma consulta no banco de dados para descobrir quais são estes produtos que estão na
categoria A.
a) Você deverá retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.
b) Renomeie essas colunas com nomes mais intuitivos.
c) Ordene esses produtos do mais pesado para o mais leve */

SELECT 
    ProductName AS 'Nome do produto',
    Weight AS 'Peso'
FROM 
    DimProduct
WHERE Weight >= 100
ORDER BY Weight DESC


/* 4. Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso.
a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela
DimStore, retorne as seguintes informações: StoreName, OpenDate, EmployeeCount
b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.
c) Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas. */


