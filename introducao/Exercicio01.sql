

/* EXERCICO 1 -- Você é responsável por controlar os dados de clientes e de produtos da sua empresa.

O que você precisará fazer é confirmar se:
a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu 
gestor para saber se existe alguma defasagem no controle dos produtos.
R: VERDADEIRO
b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.
R:FALSO
*/


USE ContosoRetailDW

SELECT 
* 
FROM 
    DimProduct


SELECT 
* 
FROM 
    DimCustomer