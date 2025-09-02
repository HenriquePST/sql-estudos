-- Comando AS : Renomeando colunas (aliasing)

-- Selecione as 3 colunas da tabela dimProduto: ProductName, BrandName e ColorName

USE ContosoRetailDW

SELECT
    ProductName AS 'Nome do Produto',
    BrandName AS 'Marca',
    ColorName AS 'Cor'
FROM   
    DimProduct