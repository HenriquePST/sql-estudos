/* COMANDOS WHERE, AND OR NOT

Dica importante: Ordem de precedência
No SQL, a ordem de avaliação é:

NOT,AND,OR

Então:
WHERE A OR (B AND (NOT C))

SINTXE:AND
SELECT coluna1, coluna2
FROM nome_da_tabela
WHERE condição1 AND condição2;


SINTXE:OR
SELECT coluna1, coluna2
FROM nome_da_tabela
WHERE condição1 OR condição2;

SINTXE:NOT
SELECT coluna1, coluna2
FROM nome_da_tabela
WHERE NOT condição;


Combinando AND, OR e NOT (com parênteses)
SELECT *
FROM Tabela
WHERE (condição1 OR condição2)
  AND NOT condição3;

*/


USE ContosoRetailDW


SELECT * FROM DimProduct 

SELECT TOP(1) UnitPrice FROM DimProduct
ORDER BY UnitPrice DESC


-- Quais são os produtos que têm preço unitário maior ou igual a 2000, listados em ordem crescente de preço

SELECT
    PRODUCTNAME AS 'PRODUTO',
    UNITPRICE AS 'PREÇO'
FROM 
    DimProduct
WHERE UnitPrice >= 2000

ORDER BY 
    UNITPRICE ASC

-- Quais são todos os produtos da marca Fabrikam e Black na tabela DimProduct?”

SELECT DISTINCT 
    brandName 
FROM 
    DimProduct

SELECT * FROM DimProduct
Where BrandName = 'Fabrikam'

SELECT * FROM DimProduct
Where colorname = 'Black'

--Quais são os  clientes nasceram apos o dia 31-12-1970.

SELECT * FROM DimCustomer
WHERE BirthDate > = '1970-12-31' --FORMATO 'yyyy-mm-dd'
ORDER BY
    BirthDate DESC


-- Seleciona todas as linhas da tabela em que o nome é fabrikam OU a cor é azul.
SELECT * FROM DimProduct
WHERE BrandName ='Fabrikam' AND ColorName = 'Blue'

-- Seleciona todas as linhas da tabela em que o nome é contoso OU cor é PRETA.
SELECT * FROM DimProduct 
Where BrandName = 'Contoso' OR ColorName = 'Black' 

-- Seleciona todas as linhas da tabela em que o nome é contoso OU Nome é fabrikam OU Cor azul 
SELECT * FROM DimProduct 
Where BrandName = 'Contoso' OR BrandName = 'Fabrikam' OR ColorName = 'Blue'

-- Seleciona todas as linhas da tabela em que o nome do departamento NÃO é Marketing
SELECT * FROM DimEmployee 
Where NOT DepartmentName = 'Marketing' 

SELECT * FROM DimEmployee
WHERE NOT MiddleName = 'NULL' 




-- Exercicios de Fixação: AND, OR e NOT 
-- 1 Selecione todas as linhas da tabela DimEmployee de funcionario do sexo feminino e do departamento de finanças 


SELECT * FROM DimEmployee
--SELECT DISTINCT DepartmentName FROM  DimEmployee
WHERE DepartmentName = 'Finance' AND Gender = 'F'
--ORDER BY BirthDate ASC 

-- 2 Selecione todas as linhas da tabela dimproduct de produtos da marca contoso E da cor vermelha e quenham um unitPrice maior ou igual a $100.

SELECT * FROM dimproduct
WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100

--3 - Selecione todas as linhas da tabela dimproduct com produtos da marca litware ou da marca fabrikam ou da cor preta

SELECT * FROM dimproduct
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'
GO

--4 Selecione todas as linhas da tabela dimsalesTerritory onde o continente é a europa mas o pais nao é igual a italia 

SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'

-- Cuidados ao utilizar o AND em conjunto com o OR ( FAZ NECESSARIO A SEPARACAO POR PRECENDENCIA POR PARENTESES )

-- Exemplo: Selecione todas as linhas da tabela dimProduct onde a cor do produto pode ser igual a preto OU vermelho, MAS a marca deve ser obrigatoriamente igual a fabrikam,

SELECT * FROM DimProduct 
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'
GO


/* Where mais In - Alternativa ao OR com múltiplas condições
É como dizer:
“Me traga todos os registros onde a coluna tenha um desses valores.”

SELECT coluna1, coluna2
FROM tabela
WHERE colunaX IN (valor1, valor2, valor3, ...); */


SELECT * FROM DimProduct
WHERE ColorName IN ('Silver','Blue', 'Red','Black')
ORDER BY ProductKey ASC

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering')


-- Where mais Like - Filtro especial para textos
-- Me traga os dados contendo valores x

-- CONTENDO TEXTO  '%TEXTO%'
-- COMEÇA TEXTO  'TEXTO%'
-- TERMINA TEXTO '%TEXTO'

SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 PLAYER%'

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '1GB%'

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%WMA'


-- Where mais Between - Filtrando entre valores
-- Intervalo de valor Betwen ( quero um filtro entre 50 e 100 dolares por exemplo )

SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'


-- Where mais Is Null e Is Not Null - Filtrando valores nulos

SELECT * FROM DimCustomer
--WHERE CompanyName IS NOT NULL
WHERE CompanyName IS NULL

