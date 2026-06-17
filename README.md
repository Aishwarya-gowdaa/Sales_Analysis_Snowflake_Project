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

#### 2. Product Performance

Business Question:
Which products generate the highest profit?

Metrics:

* Product Profit Ranking

#### 3. Top Customers

Business Question:
Who are the highest revenue-generating customers?

Metrics:

* Revenue
* Order Count
* Customer Ranking

#### 4. Monthly Sales Growth

Business Question:
How does revenue trend over time?

Metrics:

* Monthly Revenue
* Previous Month Revenue
* Growth Percentage

Functions Used:

* LAG()

#### 5. Consistently Growing Customers

Business Question:
Which customers demonstrate continuous revenue growth over multiple years?

Functions Used:

* LAG()
* CTEs

#### 6. Product Revenue Contribution

Business Question:
Which products contribute the most revenue within each category?

Metrics:

* Product Revenue
* Category Revenue
* Revenue Contribution %
* Product Rank

Functions Used:

* DENSE_RANK()
* Window Aggregations

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
