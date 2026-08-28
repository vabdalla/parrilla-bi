# Parrilla BI — Estado V1

> Snapshot técnico do projeto antes da evolução para a etapa de Engenharia de Dados.

## Status da versão

**Versão:** V1 — Analytics / Business Intelligence  
**Banco de dados:** SQL Server  
**Database:** `ParrillaBI`

Nesta versão, o projeto possui uma base histórica carregada no SQL Server,
modelo analítico, consultas SQL, views e dashboards em Power BI.

Os dados ainda são estáticos e não existe uma camada automatizada de ingestão.

---

## Dados atuais

A base utilizada no projeto é sintética e representa a operação fictícia de
um restaurante especializado em parrilla.

Principais volumes:

- 135 produtos
- 3.600 clientes
- 78.916 pedidos
- 219.044 itens de pedidos
- 29.825 entregas

---

## Modelo de dados

O banco atualmente utiliza uma estrutura dimensional para suportar as análises.

### Dimensões

- `Dim_Produtos`
- `Dim_Clientes`
- `Dim_Funcionarios`
- `Dim_Comissao`

### Tabelas Fato

- `Fato_Pedidos`
- `Fato_ItensPedido`
- `Fato_Entregas`

---

## Funcionários e comissão

A versão atual também contém informações de funcionários associadas aos pedidos.

Foram adicionadas:

- dimensão de funcionários;
- regras de comissão;
- associação dos funcionários aos pedidos;
- estrutura para futuras análises de desempenho e comissão.

---

## Camada analítica

A principal view utilizada para consumo analítico no Power BI é:

- `vw_vendas_itens`

Essa view trabalha na granularidade de item do pedido e reúne informações
necessárias para análises de vendas, produtos, categorias e canais.

---

## Power BI

O Power BI consome os dados preparados no SQL Server.

A V1 possui duas páginas principais:

### Dashboard Geral

Visão geral da operação contendo indicadores e análises de:

- faturamento;
- total de pedidos;
- ticket médio;
- produtos;
- categorias;
- canais de venda;
- evolução temporal.

### 01 — Receita

Página desenvolvida com foco em storytelling e análise de receita.

Principais análises:

- faturamento total;
- total de pedidos;
- ticket médio;
- faturamento por canal;
- evolução mensal do faturamento;
- comparação entre volume de pedidos e ticket médio por canal;
- geração de insights e recomendações de negócio.

---

## Arquitetura atual

O fluxo atual é:

CSV
→ SQL Server
→ Modelo Analítico
→ Views
→ Power BI

A carga inicial dos arquivos foi realizada por scripts SQL utilizando
`BULK INSERT`.

---

## Limitações da V1

Nesta versão ainda não existem:

- geração contínua de novos pedidos;
- API de ingestão;
- camada RAW;
- camada STAGING;
- pipeline ETL automatizado;
- carga incremental;
- monitoramento do pipeline;
- processamento periódico.

O conjunto de dados funciona atualmente como uma base histórica estática.

---

## Próxima evolução

A próxima fase do Parrilla BI será voltada à introdução de conceitos de
Engenharia de Dados.

Arquitetura planejada:

Python + Faker
→ FastAPI
→ RAW
→ STAGING
→ ETL
→ Data Warehouse
→ Power BI

### Objetivo

Simular a geração de novos pedidos e construir um fluxo de ingestão,
processamento e disponibilização dos dados para análise.

O modelo dimensional desenvolvido na V1 será preservado como camada
analítica / Data Warehouse do projeto.
