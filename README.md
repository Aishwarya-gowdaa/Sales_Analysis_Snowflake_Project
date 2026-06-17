# Retail Sales Data Engineering Pipeline

## Project Overview

This project demonstrates an end-to-end Data Engineering workflow using Python and Snowflake. The pipeline ingests retail sales data from a CSV file, performs data quality checks and transformations, loads the data into Snowflake, and creates analytical views for business reporting.

The project follows a layered architecture commonly used in modern data platforms:

Landing Layer → Curated Layer → Analytics Layer

## Tech Stack

* Python
* Pandas
* Snowflake
* SQL
* Git
* GitHub

## Architecture

CSV File
↓
Python Data Cleaning
↓
Snowflake Internal Stage
↓
Landing Schema
↓
Curated Schema
↓
Analytics Schema
↓
BI / Reporting

## Project Structure
<img width="320" height="294" alt="image" src="https://github.com/user-attachments/assets/54729477-feb2-4376-a1d5-d5ebda73d2d6" />

### Landing Layer

Purpose:

* Store raw ingested data from source files.
* Preserve source data with minimal modifications.

Objects:

* Internal Stage
* File Format
* SALES_RAW Table

Activities:

* CSV upload
* Data loading using COPY INTO

### Curated Layer

Purpose:

* Store cleaned and standardized business-ready data.

Transformations:

* Standardized column names
* Converted date columns
* Removed unwanted spaces and special characters
* Data quality validation
* Derived business columns

Output:

* SALES_CLEAN Table

### Analytics Layer

Purpose:

* Provide reusable business metrics and reporting views.

Views Created:

#### 1. Region Category Performance

Business Question:
Which region and category generate the highest sales and profit?

Metrics:

* Total Sales
* Total Profit
  
  <img width="611" height="310" alt="image" src="https://github.com/user-attachments/assets/82b9f43f-4956-46c2-86d8-66ca27932abc" />
  <img width="599" height="297" alt="image" src="https://github.com/user-attachments/assets/ffcccee0-0448-4940-b3bc-a2493d2f28fa" />


#### 2. Product Performance

Business Question:
Which products generate the highest profit?

Metrics:

* Product Profit Ranking
  
  <img width="593" height="319" alt="image" src="https://github.com/user-attachments/assets/50b85499-d859-413c-91bd-85a804b19145" />


#### 3. Top Customers

Business Question:
Who are the highest revenue-generating customers?

Metrics:

* Revenue
* Order Count
* Customer Ranking
  
<img width="596" height="329" alt="image" src="https://github.com/user-attachments/assets/6210f8df-5710-45e8-8635-1791f7be70f3" />


#### 4. Monthly Sales Growth

Business Question:
How does revenue trend over time?

Metrics:

* Monthly Revenue
* Previous Month Revenue
* Growth Percentage

<img width="605" height="176" alt="image" src="https://github.com/user-attachments/assets/6aab7609-6d02-4ee0-a8f1-dd46e7fb2ab7" />


#### 5. Consistently Growing Customers

Business Question:
Which customers demonstrate continuous revenue growth over multiple years?




#### 6. Product Revenue Contribution

Business Question:
Which products contribute the most revenue within each category?

Metrics:

* Product Revenue
* Category Revenue
* Revenue Contribution %
* Product Rank

<img width="588" height="313" alt="image" src="https://github.com/user-attachments/assets/d6485441-9b5c-4dcd-ae83-f25cad9e84fe" />



## SQL Concepts Demonstrated

* CTEs
* Aggregations
* GROUP BY
* Window Functions
* DENSE_RANK
* LAG
* Revenue Contribution Analysis
* Growth Calculations
* Analytical Views

## Snowflake Concepts Demonstrated

* Databases
* Schemas
* Internal Stages
* File Formats
* COPY INTO
* Virtual Warehouses
* Views
* Data Layering Architecture

## Key Outcomes
* Built an end-to-end cloud data pipeline.
* Implemented data cleansing using Python and Pandas.
* Loaded data into Snowflake using internal stages.
* Designed Landing, Curated, and Analytics layers.
* Created business-focused analytical views.
* Applied advanced SQL concepts including window functions and ranking.

## Future Enhancements
* Snowpipe for automated ingestion
* Power BI Dashboard Integration
* CI/CD Deployment Pipeline

## Author
Aishwarya

Data Engineering Portfolio Project
