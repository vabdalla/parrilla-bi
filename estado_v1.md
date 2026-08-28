# Parrilla BI — Estado V1

> Snapshot técnico do projeto antes da evolução para a etapa de Engenharia de Dados.

## Status da versão

**Versão:** V1 — Analytics / Business Intelligence  
**Banco de dados:** SQL Server  
**Database:** `ParrillaBI`

Nesta versão, o projeto possui uma base histórica carregada no SQL Server,
modelo dimensional, consultas SQL, views analíticas e dashboards em Power BI.

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

O banco atualmente utiliza uma estrutura dimensional voltada ao consumo analítico.

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

A V1 também incorpora informações de funcionários e regras de comissão.

Foram adicionadas:

- dimensão de funcionários;
- regras de comissão;
- associação dos funcionários aos pedidos;
- estrutura para futuras análises de desempenho e comissão.

---

## Camada analítica

A principal view utilizada para consumo no Power BI é:

- `vw_vendas_itens`

A view trabalha na granularidade de item do pedido e reúne informações
necessárias para análises de:

- vendas;
- produtos;
- categorias;
- canais;
- pedidos;
- evolução temporal.

---

## Power BI

O Power BI consome os dados preparados no SQL Server.

A V1 possui duas páginas principais.

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

Página desenvolvida com maior foco em storytelling e interpretação dos indicadores.

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

```text
CSV
 ↓
SQL Server
 ↓
Modelo Dimensional
 ↓
Views
 ↓
Power BI
