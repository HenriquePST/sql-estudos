USE ContosoRetailDW;

--1. Selecionar os 10 primeiros registros com ordenação decrescente
SELECT TOP (10) *
FROM DimStore
ORDER BY EmployeeCount DESC;
/* anotações: TOP (10) limita os resultados às 10 primeiras linhas.
ORDER BY EmployeeCount DESC mostra os maiores valores primeiro (ordem decrescente).*/


--2.  Selecionar os 10 primeiros registros com ordenação crescente
SELECT TOP (10) *
FROM DimStore
ORDER BY EmployeeCount ASC;
/* Anotações:  ASC = crescente (menores valores primeiro).
Útil para ver lojas menores, por exemplo.*/

--3. Selecionar produtos com maior custo unitário
SELECT TOP (10)
    ProductName,
    UnitCost
FROM DimProduct
ORDER BY UnitCost DESC
/*Anotações: Ordena primeiro pelo custo unitário, depois pelo peso (em caso de empate). Usado para análises de produtos premium ou pesados e caros./*