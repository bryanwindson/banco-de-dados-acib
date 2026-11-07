# DATABASE_ACIB

## Banco de Dados – Projeto Integrador ACIB
**Sistema de Gestão para a Associação Comunitária Itaqui Bacanga**

---

## 📌 Visão Geral

Este banco de dados foi desenvolvido como parte do Projeto Integrador **“Tecnologia que Transforma”**, com o objetivo de informatizar e integrar os principais processos administrativos, financeiros e operacionais da **Associação Comunitária Itaqui Bacanga (ACIB)**.

Durante o levantamento de requisitos, foram identificados os seguintes problemas:

- Falta de controle sobre entradas e saídas financeiras  
- Dificuldade para identificar associados adimplentes e inadimplentes  
- Erros em registros manuais e cálculos financeiros  
- Demora na geração de relatórios de prestação de contas  
- Falta de transparência nas movimentações  
- Ausência de controle de materiais e volumes armazenados  

Este banco foi estruturado para resolver esses problemas e fornecer uma base sólida, organizada e escalável para o sistema de gestão da ACIB.

---

## 🗂 Estrutura do Banco de Dados

A modelagem foi dividida em **módulos funcionais**, cada um representando um conjunto de tabelas relacionadas.

---

### 🔐 1. Controle de Acesso

Responsável por definir usuários, cargos e permissões no sistema.

**Tabelas:**
- `cargos` – define os papéis dos usuários  
- `permissoes` – ações permitidas no sistema  
- `cargo_permissao` – relação entre cargos e permissões  
- `usuarios` – cadastro de usuários vinculados aos cargos  

---

### 👥 2. Associados

Responsável pelo gerenciamento dos membros da ACIB.

**Tabelas:**
- `associados` – dados pessoais, tipo (PF/PJ), mensalidade e situação  
- `pagamentos` – registros de mensalidades e contribuições extras  

Permite acompanhar inadimplência, histórico de pagamentos e contribuições.

---

### 💰 3. Financeiro Interno

Gerencia as movimentações financeiras da associação.

**Tabela:**
- `financeiro` – registros de entradas e saídas, contendo:
  - tipo (entrada/saída)  
  - categoria  
  - descrição  
  - valor  
  - data do lançamento  
  - usuário responsável  

---

### 📊 4. Relatórios

Armazena e gerencia relatórios gerados no sistema.

**Tabela:**
- `relatorios` – informações como:
  - tipo  
  - categoria (Semanal, Mensal, Anual)  
  - usuário responsável  
  - data de geração  
  - arquivo e caminho do arquivo  

---

### 🔔 5. Notificações

Responsável pela comunicação com os associados.

**Tabela:**
- `notificacoes` – envio de mensagens de:
  - atraso  
  - confirmação  
  - informativos  

Com suporte aos canais:
- Email  
- WhatsApp  
- SMS  

---

### ♻️ 6. Controle de Materiais

Módulo responsável pelo controle operacional de materiais e volumes.

**Tabelas:**
- `materiais` – tipos de materiais cadastrados  
- `frequencias` – periodicidade de controle  
- `armazenamentos` – locais/seções de armazenamento  
- `registros_materiais` – registros de volume, local e frequência  

---

### ⚙️ 7. Configurações Globais

Permite parametrizar regras gerais do sistema.

**Tabela:**
- `configuracoes` – armazenamento de parâmetros chave/valor  

---

## 🔗 Relacionamentos

- Um **cargo** pode possuir várias **permissões**  
- Um **usuário** herda as permissões do seu cargo  
- Um **associado** pode possuir vários **pagamentos** e **notificações**  
- Um **usuário** pode registrar lançamentos financeiros e gerar relatórios  
- Um **material** pode possuir vários registros em diferentes armazenamentos  

---

## 📦 Dados Iniciais

O banco conta com dados iniciais para testes e demonstração, incluindo:

- Cargos e permissões  
- Materiais padrão  
- Frequências padrão  
- Armazenamentos padrão  
- Configurações globais iniciais  

---

## 📁 Arquivos do Repositório

- `acib_database.sql` – Estrutura completa do banco de dados  
- `insert_acib.sql` – Dados iniciais para testes  
- Diagramas e documentação complementar  

---

## 🎯 Objetivo Geral

Fornecer uma base de dados robusta para um sistema capaz de:

- Automatizar o controle financeiro  
- Garantir precisão e segurança nos registros  
- Monitorar a situação dos associados  
- Facilitar a geração de relatórios  
- Controlar materiais e volumes  
- Aumentar a transparência e eficiência da gestão da ACIB
