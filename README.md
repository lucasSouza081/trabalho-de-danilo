# 📚 Sistema de Gerenciamento de Livraria

## Sobre o Projeto

Este projeto implementa um sistema completo de gerenciamento de livraria utilizando banco de dados relacional MySQL. O sistema foi desenvolvido como parte de um trabalho acadêmico e abrange desde a modelagem de dados até operações avançadas de consulta e manipulação.

## 🎯 Objetivos

- Criar um modelo de dados robusto para gerenciar operações de uma livraria
- Implementar relacionamentos complexos entre entidades (1:1, 1:N, N:N)
- Demonstrar proficiência em SQL através de consultas, views e manipulação de dados
- Aplicar boas práticas de modelagem e normalização de banco de dados

## 🗂️ Estrutura do Banco de Dados

### Entidades Principais

#### 📖 Livros
- **Atributos**: ISBN (PK), Título, Data de Publicação, Gênero, Número de Páginas, Descrição, Preço Base
- **Relacionamentos**: 
  - Pertence a uma Área de Conhecimento (1:N)
  - Escrito por múltiplos Autores (N:N)
  - Possui múltiplos Exemplares (1:N)

#### ✍️ Autores
- **Atributos**: Autor_ID (PK), Nome Completo, Data de Nascimento
- **Relacionamentos**:
  - Escreve múltiplos Livros (N:N)
  - Pode ter uma Editora associada (1:1)
  - Pode gerenciar um Departamento (1:1)

#### 🏢 Editoras
- **Atributos**: Editora_ID (PK), Nome Fantasia, CNPJ, Endereço
- **Relacionamentos**:
  - Possui múltiplos Departamentos (1:N)
  - Associada a um Autor (N:1)

#### 👥 Clientes
- **Atributos**: Cliente_ID (PK), Nome, CPF/CNPJ, Email (UNIQUE), Telefone, Data de Cadastro
- **Relacionamentos**:
  - Realiza múltiplos Pedidos (1:N)

#### 🛒 Pedidos
- **Atributos**: Pedido_ID (PK), Data do Pedido, Valor Total, Status, Método de Pagamento
- **Relacionamentos**:
  - Pertence a um Cliente (N:1)
  - Possui múltiplos Itens de Pedido (1:N)

#### 👔 Funcionários
- **Atributos**: ID_Funcionario (PK), Nome, CPF, Cargo, Email, Telefone, Endereço, Data de Admissão
- **Relacionamentos**:
  - Trabalha em um Departamento (N:1)

#### 🏬 Departamentos
- **Atributos**: Departamento_ID (PK), Nome, Descrição de Atividades
- **Relacionamentos**:
  - Possui múltiplos Funcionários (1:N)
  - Pertence a uma Editora (N:1)
  - Gerenciado por um Autor (N:1)

### Entidades Auxiliares

- **Exemplares**: Controle físico de cada cópia dos livros
- **Áreas de Conhecimento**: Categorização dos livros
- **Palavras-Chave**: Tags para busca e categorização
- **Itens de Pedido**: Detalhamento dos produtos em cada pedido

## 📋 Estrutura de Arquivos

```
trabalho-de-danilo/
├── 01_KAUAN_INSERTS_SEM_SALARIO.sql
│   └── Script de povoamento com dados de exemplo
├── 02_KAUAN_MANIPULACAO_SEM_SALARIO.sql
│   └── Scripts de UPDATE e DELETE
├── trabalho de danilão.sql
│   └── Script principal com DDL, DML e consultas
└── README.md
    └── Este arquivo
```

## 🚀 Como Usar

### Pré-requisitos

- MySQL 5.7 ou superior
- Cliente MySQL (MySQL Workbench, DBeaver, ou linha de comando)

### Instalação

1. **Criar o banco de dados**:
```sql
CREATE DATABASE trabalho_de_danilo;
USE trabalho_de_danilo;
```

2. **Executar os scripts na ordem**:
   - Primeiro: `trabalho de danilão.sql` (criação das tabelas e views)
   - Segundo: `01_KAUAN_INSERTS_SEM_SALARIO.sql` (povoamento)
   - Terceiro: `02_KAUAN_MANIPULACAO_SEM_SALARIO.sql` (operações de manipulação)

3. **Verificar a instalação**:
```sql
SHOW TABLES;
SELECT * FROM VW_Livros_Mais_Vendidos;
```

## 📊 Funcionalidades

### 1. Views de Relatórios (10 views)

- **VW_Livros_Mais_Vendidos**: Top 10 livros por quantidade vendida
- **VW_Faturamento_Por_Cliente**: Total gasto por cada cliente
- **VW_Pedidos_Pendentes**: Lista de pedidos aguardando processamento
- **VW_Faturamento_Por_Genero**: Receita por gênero literário
- **VW_Clientes_Sem_Pedidos**: Clientes inativos
- **VW_Funcionarios_Departamentos**: Organograma simplificado
- **VW_Contagem_Funcionarios_Por_Depto**: Distribuição de RH
- **VW_Catalogo_Completo_Livros**: Catálogo com autores e áreas
- **VW_Livros_Sem_Exemplares**: Livros sem estoque físico
- **VW_Clientes_Generos_Diversos**: Clientes com compras variadas

### 2. Consultas Avançadas (20+ queries)

Incluem:
- Agregações com GROUP BY e HAVING
- Subconsultas (subselects)
- Joins múltiplos (INNER, LEFT, RIGHT)
- Filtros complexos com WHERE
- Ordenação e limitação de resultados
- Cálculos e funções agregadas

### 3. Operações de Manipulação

**Updates (14 operações)**:
- Correção de dados cadastrais
- Promoções e transferências de funcionários
- Reajustes de preços (individuais e em lote)
- Atualização de status de pedidos
- Updates condicionais com CASE

**Deletes (7 operações)**:
- Remoção de palavras-chave
- Descarte de exemplares danificados
- Limpeza de relacionamentos N:N
- Exclusão em cascata respeitando FKs

### 4. Alterações de Estrutura

- Adição de novas colunas
- Modificação de tipos de dados
- Criação de constraints (UNIQUE, CHECK, DEFAULT)
- Renomeação de colunas
- Remoção de colunas obsoletas

## 🎲 Dados de Exemplo

O banco é povoado com:
- **5** Áreas de Conhecimento
- **20** Autores
- **20** Clientes (PF e PJ)
- **5** Editoras
- **20** Livros
- **5** Departamentos
- **20** Funcionários
- **40** Exemplares
- **25** Pedidos
- **35** Itens de Pedido
- **40** Palavras-Chave

## 🔑 Conceitos Aplicados

### Modelagem
- Normalização até 3FN
- Relacionamentos 1:1, 1:N e N:N
- Chaves primárias e estrangeiras
- Integridade referencial

### SQL
- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- DQL (Data Query Language)
- Constraints e validações
- Views e consultas complexas

### Boas Práticas
- Nomenclatura consistente
- Comentários explicativos
- Índices em chaves estrangeiras
- Validação de dados com CHECK
- Tratamento de valores NULL

## ⚠️ Notas Importantes

1. **Versão sem Salário**: Os scripts foram atualizados para remover a coluna de salário da tabela de Funcionários
2. **SET SQL_SAFE_UPDATES = 0**: Necessário para permitir updates sem WHERE em casos específicos
3. **Ordem de Execução**: Respeitar a ordem dos scripts para evitar erros de FK
4. **Cascata de Deletes**: Alguns relacionamentos requerem delete manual de registros dependentes

## 🛠️ Troubleshooting

### Erro de Foreign Key
```sql
-- Verificar constraints
SHOW CREATE TABLE nome_da_tabela;

-- Desabilitar verificação temporariamente (usar com cuidado!)
SET FOREIGN_KEY_CHECKS = 0;
-- executar operação
SET FOREIGN_KEY_CHECKS = 1;
```

### Erro de Duplicação
```sql
-- Verificar registros duplicados
SELECT coluna, COUNT(*) 
FROM tabela 
GROUP BY coluna 
HAVING COUNT(*) > 1;
```

## 📈 Possíveis Melhorias

- [ ] Implementar triggers para auditoria
- [ ] Adicionar stored procedures para operações complexas
- [ ] Criar índices otimizados para consultas frequentes
- [ ] Implementar soft delete (exclusão lógica)
- [ ] Adicionar tabela de log de alterações
- [ ] Criar funções personalizadas (UDF)
- [ ] Implementar particionamento para tabelas grandes


## 📝 Licença

Este projeto foi desenvolvido para fins educacionais.

## 📧 Contato

Para dúvidas ou sugestões sobre o projeto, entre em contato com os desenvolvedores.

---

**Data de Última Atualização**: Outubro/2024

**Versão**: 2.0 (Sem Salário)
