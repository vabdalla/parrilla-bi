Parrilla BI

End-to-end Business Intelligence project based on a simulated restaurant operation, built with SQL Server, Power BI and dimensional data modeling.

The project is currently evolving from a static analytical solution into a Data Engineering pipeline using Python, API ingestion, RAW/STAGING layers and ETL.

---

## About the Project

Parrilla BI started from a simple question:

> How can operational restaurant data be transformed into useful information for business decisions?

The dataset simulates 24 months of restaurant operations and was created to practice the complete analytical workflow — from database modeling and data validation to SQL analysis, Power BI dashboards and business storytelling.

The current version contains:

- 78,916 orders
- 219,044 order items
- 29,825 deliveries
- 3,600 customers
- 135 products

The project is based on synthetic data and does not contain real customer or company information.

---

##  Project Goals

The first stage of the project focused on building an analytical environment capable of answering questions such as:

- Where does revenue come from?
- Which products and categories generate the most revenue?
- How does sales performance change over time?
- Which sales channels concentrate the highest order volume?
- What is the average order value by channel?
- How can employee and commission data be incorporated into the analytical model?

The next stage introduces Data Engineering concepts to simulate how new operational data could be generated, ingested, processed and delivered to the analytical layer.

---

##  Current Architecture — V1

The current analytical flow is:

```text
Synthetic CSV Dataset
        ↓
    SQL Server
        ↓
Dimensional Analytical Model
        ↓
      Views
        ↓
     Power BI
        ↓
Analysis & Storytelling
