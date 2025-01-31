
# **Banco de Dados - SQL Server**

## **📌 Resumo Geral**

### **Bases de Dados de Sistema no SQL Server**
As bases de dados de sistema são fundamentais para o funcionamento do SQL Server:

- **master**: Controla informações da instância e configurações gerais.
- **model**: Modelo base para a criação de novos bancos.
- **msdb**: Gerencia agendamentos, jobs e automações.
- **tempdb**: Armazena dados temporários e é recriada a cada reinício do servidor.
- **Resource**: Contém objetos do sistema, fornecendo suporte à engine.

💡 **Dica:** Faça backup regular das bases `master`, `msdb` e `model`, pois sua perda pode comprometer a recuperação do SQL Server.

## **Transações no SQL Server**

### **1. Definição e Importância**
- O SQL Server utiliza um **log de transações** para garantir integridade e consistência.
- Antes de gravar dados no banco definitivo, as operações são registradas no log, protegendo contra falhas como quedas de energia.

### **2. Problemas de Sistemas Antigos**
- Antigamente, tecnologias como Clipper gravavam dados diretamente no disco, o que aumentava o risco de corrupção em caso de falhas.

### **3. Funcionamento**
- Comandos como `INSERT` são processados na memória e gravados no log (`.ldf`).
- A persistência dos dados ocorre somente após o comando **COMMIT**.

### **4. Checkpoint**
- O **checkpoint** move periodicamente (ou manualmente) os dados do log para o banco definitivo (`.mdf`), melhorando a performance.

### **5. Recuperação Após Falhas**
- Transações confirmadas no log são aplicadas na base ao reiniciar o SQL Server.
- Transações pendentes são descartadas para manter a integridade.

### **6. Write-Ahead Logging (WAL)**
- O mecanismo WAL registra todas as transações no log antes de gravá-las no banco definitivo, garantindo consistência em caso de falhas.
---
## **Criando Bancos de Dados**

### **1. Via Interface Gráfica (SSMS)**
1. Abra o SQL Server Management Studio (SSMS).
2. Clique com o botão direito em **Databases > New Database**.
3. Configure o nome e os parâmetros do banco.
4. Clique em **OK** para criar.

### **2. Via T-SQL**
Comando básico:
```sql
CREATE DATABASE EmpresaDB;
```

Com parâmetros personalizados:
```sql
CREATE DATABASE EmpresaDB
ON
(
    NAME = 'EmpresaDB_Data',
    FILENAME = 'C:\SQLServer\Data\EmpresaDB.mdf',
    SIZE = 10MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
)
LOG ON
(
    NAME = 'EmpresaDB_Log',
    FILENAME = 'C:\SQLServer\Data\EmpresaDB.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 2MB
);
```

**Explicação dos Parâmetros**:
- **`SIZE`**: Tamanho inicial do arquivo.
- **`MAXSIZE`**: Tamanho máximo permitido.
- **`FILEGROWTH`**: Incremento automático de tamanho.

💡 **Dica:** Prefira T-SQL em projetos maiores para facilitar automação e padronização.

---

## **Controle de Transações**

### **Comandos Essenciais**
1. **`BEGIN TRAN`**: Inicia uma transação.
2. **`COMMIT TRAN`**: Confirma e persiste as alterações.
3. **`ROLLBACK TRAN`**: Reverte as alterações caso ocorra erro.

### **🛠️ Exemplo Prático**
```sql
BEGIN TRAN
    UPDATE Clientes SET Saldo = Saldo - 100 WHERE ID = 1;
    UPDATE Clientes SET Saldo = Saldo + 100 WHERE ID = 2;
COMMIT TRAN;
```

### **Revertendo em Caso de Erro**
```sql
BEGIN TRAN
    UPDATE Clientes SET Saldo = Saldo - 100 WHERE ID = 1;

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRAN;
        PRINT 'Erro encontrado, transação revertida!';
        RETURN;
    END

    UPDATE Clientes SET Saldo = Saldo + 100 WHERE ID = 2;
COMMIT TRAN;
```

💡 **Dica:** Use `ROLLBACK TRAN` para garantir consistência em situações de erro.

---

## **Explicando WAL (Write-Ahead Logging)**

### **Como Funciona?**
- O WAL garante que as transações sejam gravadas primeiro no log antes de serem aplicadas no banco de dados definitivo.
- Essa estratégia protege contra falhas e inconsistências, garantindo que nenhuma transação confirmada seja perdida.

---

## **💡 Considerações Finais**

- **Separação de Arquivos**: Mantenha arquivos `.mdf` e `.ldf` em discos diferentes para melhorar o desempenho.
- **Backup Regular**: Planeje backups periódicos para proteger dados críticos.
- **Boas Práticas**: Utilize o WAL e checkpoints para manter a consistência e a performance do banco.

