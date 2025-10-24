-- 1) SQL_ VARIANT_ PROPERTY

SELECT 10 AS NUMERO
SELECT 49.40 AS DECIMAL
SELECT 'MARCUS' AS NOME 
SELECT '20/06/2026' AS DATA

SELECT SQL_VARIANT_PROPERTY(10,'BaseType')
SELECT SQL_VARIANT_PROPERTY(49.40 ,'BaseType')
SELECT SQL_VARIANT_PROPERTY('MARCUS','BaseType')
SELECT SQL_VARIANT_PROPERTY('20/06/2026','BaseType')

-- 2) CAST: FUNÇÃO PARA ESPECIFICAR O TIPO DOS DADOS 

SELECT CAST(21.20 AS INT)

SELECT SQL_VARIANT_PROPERTY(CAST(10.02 AS INT),'BaseType')

SELECT CAST('20/06/2023' AS datetime)

SELECT SQL_VARIANT_PROPERTY(CAST(20/06/2023 AS int),'BaseType')

-- EXERCICIO 1 : Crie uma consulta juntanto o texto o preço do pastel é: 'com o valor 30.99

SELECT 'o preço do pastel é : ' + CAST(30.99 as varchar(30)) 

-- EXERCICO 2 : ADICIONE 1 DIA A DATA '20/05/2021

SELECT CAST('2021/05/20' AS DATETIME) + 1 

-- 3) FORMAT: FUNÇAO PARA FORMATAÇÃO DE VALORES SO SQL 
-- A) NUMÉRICOS :
-- SELECT FORMAT ( VALOR, FORMATO)

SELECT FORMAT(1000, 'N')
SELECT FORMAT(1000, 'G')

--B) PERSONALIZADOS 
SELECT FORMAT(123456789, '####-##-###')

--C) DATA: 
SELECT FORMAT(CAST('2021/03/05'AS datetime), 'yyyy/MM/dd')
SELECT FORMAT(CAST('2021/03/05'AS datetime), 'yyyy/MMM/dd')
SELECT FORMAT(CAST('2021/03/05'AS datetime), 'yyyy/MMMM/dd')

-- Exercício 3: Crie uma consulta juntando o texto 'A data de validade do produto é: ' com a data 17/abr/2022.
-- Obs: Você deverá usar o CAST para garantir que a data é entendida com o tipo DATETIME


SELECT 'A data de validade do produto é: ' + FORMAT(CAST('2025-04-17' AS DATETIME), 'dd/MMM/yyyy')

