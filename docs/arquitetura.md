# Parrilla BI — Arquitetura de Dados

> Arquitetura definida para a evolução do projeto Parrilla BI da etapa de Business Intelligence para Engenharia de Dados.

## Arquitetura

```text
Python + Faker
      │
      ▼
   FastAPI
      │
      ▼
     RAW
      │
      ▼
   STAGING
      │
      ▼
Data Warehouse
      │
      ▼
   Power BI
