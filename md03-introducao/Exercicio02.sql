/* Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer descontos especiais para os clientes no dia do seu aniversário. 
Para isso, você vai precisar listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).*/



USE ContosoRetailDW

SELECT * FROM DimProduct

SELECT 
      CustomerKey AS 'id do cliente',
      FirstName AS 'nome',
      EmailAddress AS email,
      BirthDate AS 'Data de Nascimento'
FROM
    DimCustomer


