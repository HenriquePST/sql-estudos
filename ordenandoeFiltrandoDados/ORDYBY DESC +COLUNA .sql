-- exemplo 1 selecione as 10 primeiras linhas da tabela dimproduct e ordene de acordo com a unitcost

--USE ContosoRetailDW 
--SELECT  * FROM DimProduct

SELECT
    top (10) productName,
    UnitCost,
    Weight

FROM
    DimProduct
ORDER BY UnitCost DESC, Weight  DESC
