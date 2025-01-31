
# Resumo da Aula: Criação de Bases de Dados no SQL Server

Nesta aula, aprendemos a criar bases de dados no SQL Server, com destaque para boas práticas.

## Principais Pontos Abordados

1. **Nomeação e Propriedade da Base de Dados**
   - Nomeie a base de dados de forma clara e evite utilizar o nome do usuário como proprietário.
   - Utilize o usuário `sa` como owner para evitar problemas futuros com acessos, especialmente se o usuário for desativado no AD.

2. **Estrutura da Base de Dados**
   - A base é composta por dois arquivos principais:
     - **Dados (row data):** Armazena os dados da base.
     - **Log:** Registra as transações realizadas.
   - Defina um tamanho inicial adequado, considerando o crescimento estimado para os próximos seis meses. Isso evita fragmentação e melhora a performance.

3. **Crescimento Automático e Limites**
   - Configure o **Autogrow** para permitir crescimento automático da base.
   - Estabeleça limites de tamanho (**maxsize**) para evitar problemas de armazenamento.

4. **Estratégias de Armazenamento**
   - Para bases de dados grandes, distribua arquivos de dados em discos diferentes para melhorar a performance.
   - Use discos mais rápidos (como SSDs) para armazenar tabelas e índices frequentemente acessados.

5. **Uso de Filegroups**
   - Crie **filegroups** para organizar os dados e alocar tabelas específicas em discos distintos.
   - Isso melhora o desempenho, especialmente em consultas pesadas.

6. **Arquivos de Log**
   - Geralmente, utiliza-se um único arquivo de log, já que o SQL Server grava transações de forma sequencial.

## Conclusão
Essas práticas são fundamentais para otimizar a performance e a manutenção do banco de dados, garantindo escalabilidade e eficiência em bases de dados maiores.

```
![image](https://github.com/user-attachments/assets/81511998-0065-4efd-8a53-c1fb5b4fe376)
![image](https://github.com/user-attachments/assets/f8d7f7b3-cfee-431c-89f2-a92368d154ba)


