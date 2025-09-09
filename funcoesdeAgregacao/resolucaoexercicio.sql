USE ContosoRetailDW

/*1 O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales */

SELECT * FROM FactSales

SELECT
    SUM(SalesQuantity) AS 'Quantidade Vendida',
    SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM
    FactSales
WHERE
    channelKey = 1


/* 2- Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.*/

select * FROM DimCustomer

SELECT 
    AVG(YearlyIncome) AS MediaSalarial
FROM 
    DimCustomer
WHERE 
    Occupation = 'Professional';

/* 3- Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações:

a)Quantos funcionários tem a loja com mais funcionários?
b)Qual é o nome dessa loja?
c)Quantos funcionários tem a loja com menos funcionários?
d)Qual é o nome dessa loja? */


--analise quantidade funcionario
SELECT * FROM DimEmployee

-- a) quantidade de loja com mais funcionario 

SELECT 
    MAX(employeeCount) as 'maior qt de funcionario'
FROM
    DimStore

SELECT 
    top (1) StoreName 'nome da loja',
    EmployeeCount 'qtd funcionarios'
FROM 
    DimStore 
ORDER BY EmployeeCount desc

--c)Quantos funcionários tem a loja com menos funcionários?

SELECT 
    MIN(EmployeeCount) AS 'qtd funcionarios'
FROM 
    DimStore;

-- d) Qual é o nome dessa loja?
SELECT 
top(1) storename,
employeecount

FROM
DimStore
where EmployeeCount is not NULL
ORDER by EmployeeCount asc 


/*
A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
total de funcionários do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação. */

SELECT * FROM DimEmployee

-- TOTAL FEMININO
SELECT 
COUNT(firstname)
FROM
DimEmployee
WHERE Gender = 'F' 

-- TOTAL MASCULINO 
SELECT 
COUNT(firstname)
FROM
DimEmployee
WHERE Gender = 'M'


-- Funcionária mais antiga
SELECT TOP 1 
    FirstName  AS Nome,
    EmailAddress AS Email,
    HireDate AS DataContratacao,
    Gender
FROM DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC

-- Funcionário mais antigo
SELECT TOP 1 
    FirstName AS Nome,
    EmailAddress AS Email,
    HireDate AS DataContratacao,
    Gender
FROM DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate ASC;


/* 5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta.*/

SELECT * FROM DimProduct

SELECT 
    COUNT(DISTINCT colorname) AS QtdeCores,
    COUNT(DISTINCT brandName) AS QtdeMarcas,
    COUNT(DISTINCT className) AS QtdeClasses
FROM DimProduct;
