-- comandos SELECT TOP(N) E TOP (N) PERCENT : retorna as N primeiras linhas 

-- 1. crie um codigo que retorna as 10 primeiras linhas da tabela de produtos.

SELECT TOP (10) * FROM DimProduct
 

-- 2. retorna as 10% primeiras linhas da tabela de clientes. 
SELECT TOP(10) PERCENT * FROM DimCustomer



