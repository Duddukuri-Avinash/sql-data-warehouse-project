# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---
## 🔗 Important Links & Tools

Everything is for Free!

- **Datasets:** Access to the project dataset (CSV files)
- **SQL Server Express:** Lightweight server for hosting your SQL database
- **SQL Server Management Studio (SSMS):** GUI for managing and interacting with databases
- **Git Repository:** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently
- **DrawIO:** Design data architecture, models, flows, and diagrams
- **Notion:** All-in-one tool for project management and organization
- **Notion Project Steps:** Access to all project phases and tasks

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.  
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.  
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.  
- **Scope**: Focus on the latest dataset only; historization of data is not required.  
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analytics)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---
## 🧱 Data Architecture

The data architecture for this project follows the Medallion Architecture — **Bronze**, **Silver**, and **Gold** layers.

### Sources
- CRM  
- ERP  
**Object Type:** CSV Files  
**Interface:** Files in Folders  

---

### 🥉 Bronze Layer
Stores raw data as-is from the source systems.  
Data is ingested from CSV Files into SQL Server Database.

**Object Type:** Tables  
**Load:**  
- Batch Processing  
- Full Load  
- Truncate & Insert  
**No Transformations**  
**Data Model:** None (as-is)

---

### 🥈 Silver Layer
This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.

**Object Type:** Tables  
**Load:**  
- Batch Processing  
- Full Load  
- Truncate & Insert  
**Transformations:**  
- Data Cleansing  
- Data Standardization  
- Data Normalization  
- Derived Columns  
- Data Enrichment  

---

### 🥇 Gold Layer
Houses business-ready data modeled into a star schema required for reporting and analytics.

**Object Type:** Views  
**No Load**  
**Transformations:**  
- Data Integrations  
- Aggregations  
- Business Logics  
**Data Model:**  
- Star Schema  
- Flat Table  
- Aggregated Table  

---

### Consume
- BI & Reporting  
- Ad-Hoc SQL Queries  
- Machine Learning

[Data warehouse diagram.drawio](https://github.com/user-attachments/files/28558029/Data.warehouse.diagram.drawio)
1. **Bronze Layer:** Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.

2. **Silver Layer:** This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.

3. **Gold Layer:** Houses business-ready data modeled into a star schema required for reporting and analytics.

## 📂 Repository Structure




This layout clearly separates datasets, documentation, scripts, and configuration files — a best-practice structure for data warehouse projects.  

Would you like me to add a short “Usage Guide” section next, explaining how each layer (bronze, silver, gold) connects with these folders?

data-warehouse-project
- datasets/
  - ERP and CRM raw data
- docs/
  - etl.drawio → ETL techniques and methods
  - data_architecture.drawio → Project architecture
  - data_catalog.md → Dataset catalog with field descriptions
  - data_flow.drawio → Data flow diagram
  - data_models.drawio → Data models (star schema)
  - naming-conventions.md → Naming guidelines
- scripts/
  - bronze/ → Extract & load raw data
  - silver/ → Clean & transform data
  - gold/ → Create analytical models
- tests/ → Test scripts and quality checks
- README.md → Project overview
- LICENSE → License information
- .gitignore → Ignore rules
- requirements.txt → Dependencies


## 🛡 License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---
## 🌟 About Me

Hi there! I'm **Duddukuri Avinash**, a B.Tech 2nd‑year student and passionate data enthusiast. I’m on a mission to learn, explore, and share knowledge about data analytics and engineering in an enjoyable and engaging way!
