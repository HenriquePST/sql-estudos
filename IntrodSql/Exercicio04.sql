/*Exercício 4.
A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o estoque.
Você é da área de compras e precisa descobrir quem são esses fornecedores.
Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela DimProduct e renomeie essa nova coluna da tabela.*/


use ContosoRetailDW
SELECT * FROM DimProduct

SELECT 
    DISTINCT Manufacturer AS 'Produtor'
FROM    
    DimProduct