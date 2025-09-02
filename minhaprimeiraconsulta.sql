-- Comentários em códigos
-- 1. Criar uma frase que explica o funcionamento de um determinado código
-- 2. Comentar apenas uma parte de um código e executar o restante 
-- 3. Comentar todo um trecho de um código de maneira rápida e otimizada

-- este código seleciona o banco de dados 
USE 
    ContosoRetailDW


-- comando Select from retorna as linhas da tabela, indepente das colunas selecionas
SELECT 
    * 
FROM
    DimCustomer  

SELECT 
    *
FROM
    DimStore

SELECT 
    StoreKey,
    StoreName, 
    StorePhone
FROM    
    DimStore


SELECT 
    * 
FROM 
    DimProduct

SELECT 
    productName,    
    BrandName 
FROM 
    DimProduct

-- Este código seleciona as colunas de ID dproduto e nome dproduto da tabela de produto 
SELECT 
    --ProductKey
    ProductName
FROM    
    DimProduct


/*SELECT 
    StoreKey
    StoreName,
    StorePhone
FROM    
    DimStore */

SELECT * FROM DimProduct
