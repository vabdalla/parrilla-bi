# Camadas de Dados — RAW e STAGING

## RAW

### raw.PedidosRecebidos

Armazena o payload recebido da API sem alterações, preservando os dados exatamente como foram recebidos na origem.

Essa camada funciona como uma cópia bruta do evento para garantir rastreabilidade e permitir o processamento posterior.

---

## STAGING

### stg.Pedidos

Armazena os dados dos pedidos após a extração e transformação do JSON recebido no RAW.

Os dados passam a estar estruturados em formato relacional, preparados para validações e processamento posterior.

### stg.ItensPedido

Armazena os itens associados aos pedidos após a transformação do array `itens` presente no JSON.

Cada item passa a ocupar seu próprio registro, estabelecendo a relação:

**1 pedido → N itens**

---

## Fluxo

API → RAW → STAGING → Camada Analítica → Power BI

### Responsabilidade de cada camada

| Camada | Responsabilidade |
|---|---|
| RAW | Preservar os dados exatamente como chegaram |
| STAGING | Tratar, validar e estruturar os dados |
| Analítica | Disponibilizar os dados para análise |
| Power BI | Visualização e geração de insights |
