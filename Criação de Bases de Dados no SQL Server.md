
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

![1image](https://github.com/user-attachments/assets/8742ad56-fbb5-45e1-9a9e-f8cf06be29e7)
![image 1](https://github.com/user-attachments/assets/5e13ce96-70ee-4c32-89a4-ab5f3010c455)





