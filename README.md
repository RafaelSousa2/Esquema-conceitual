# 🚗 Projeto de Banco de Dados - Oficina Mecânica
Este projeto tem como objetivo a modelagem e implementação de um banco de dados relacional para gerenciar as operações de uma **oficina mecânica**. O banco contempla o cadastro e relacionamento entre clientes, veículos, ordens de serviço, peças, funcionários, mecânicos, equipes e serviços prestados.
![Oficina mecânica](https://github.com/user-attachments/assets/8646dfe2-821d-4a7f-b76a-73b4423e0732)
## 🧠 Contexto e Objetivo

O banco de dados foi desenvolvido a partir de um esquema lógico baseado em um modelo ER previamente construído (imagem acima). Ele visa atender às operações comuns de uma oficina, como:

- Abertura de ordens de serviço para veículos de clientes;
- Atribuição de funcionários e mecânicos às ordens;
- Controle de serviços executados e peças utilizadas;
- Organização de mecânicos em equipes.

O projeto também inclui inserção de dados fictícios para testes e uma série de queries SQL com diferentes níveis de complexidade.

---

## 🛠️ Estrutura do Projeto

- `CREATE TABLE`: Criação de todas as tabelas com relacionamentos, constraints e integridade referencial;
- `INSERT INTO`: Inserção de dados de exemplo para testes;
- `SELECTs`: Consultas simples e avançadas demonstrando as funcionalidades do banco.

---

## 🗂️ Entidades e Relacionamentos

- **Cliente**
- **Veículo** (relacionado a Cliente)
- **Funcionário**
- **Mecânico**
- **Equipe**
- **Serviço** (relacionado a Mecânico)
- **Peça**
- **Ordem de Serviço** (relacionada a Veículo, Funcionário)
- **Tabelas de junção**:
  - `OrdemServico_Servico`
  - `OrdemServico_Peca`
  - `OrdemServico_Mecanico`
  - `Mecanico_Equipe`

---

## 🧪 Consultas SQL (Queries)

O projeto contempla as seguintes cláusulas SQL:

- `SELECT` simples para recuperar dados;
- Filtros com `WHERE`;
- Atributos derivados com expressões (`DATEDIFF`, `YEAR`, etc.);
- Ordenação com `ORDER BY`;
- Agrupamento com `GROUP BY` e filtragem com `HAVING`;
- Junções (`JOIN`) entre várias tabelas;
- Consultas para perguntas como:
  - Quais ordens de serviço estão aguardando?
  - Qual o total em peças utilizadas por ordem?
  - Qual o tempo médio de execução por mecânico?
  - Quantas ordens foram atendidas por cada equipe?

---

## 📦 Como executar

1. Importe o script `.sql` em seu SGBD (MySQL).
2. Execute os comandos de criação do esquema.
3. Execute os comandos de inserção de dados.
4. Use as queries para explorar os dados.

---

## 💡 Aprendizados

- Modelagem de relacionamentos complexos;
- Criação de constraints e chaves estrangeiras com regras de integridade;
- Uso de `ENUM`, `BOOLEAN`, `AUTO_INCREMENT`;
- Elaboração de queries SQL com múltiplas cláusulas e junções.


---

## ✍️ Autor

**Rafael Sousa**  
Engenheiro Mecânico | Especialista em Gerenciamento de Obras  
💼 Experiência com planejamento, execução e fiscalização.
📫 [LinkedIn](https://www.linkedin.com) (www.linkedin.com/in/rafael-sousa-64009131b)
