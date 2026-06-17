use database retail_db;
use schema analytics;


// Q1 Sales & Profit Performance
// Which region and category generate the highest total sales and profit?
create or replace view region_category_performance as
select region,category,round(sum(profit),2) as total_profits, round(sum(sales),2) as total_sales
from curated.sales_clean
group by region, category;

select * from region_category_performance order by total_profits desc, total_sales desc;

//Q2 Product Analysis
//Which are the top 5 best-performing products based on total profit
create or replace view top_performing_product as 
select product_name, round(sum(profit),2) as total_profits
from curated.sales_clean
group by product_name;

select * from top_performing_product order by total_profits desc;
select * from top_5_product;

//Q3 Customer Analysis
//Who are the top customers contributing the highest revenue and how many orders have they placed?
create or replace view top_customers as
select customer_name, round(sum(sales),2) as revenue,count(order_id) as orders_cnt
from curated.sales_clean
group by customer_name;

select *,dense_rank() over(order by revenue desc) as rank from top_customers desc limit 5;

//Q4Sales Trend Analysis
//How have monthly sales and profits trended over time, and what is the month-over-month growth rate
create or replace view monthly_sales_growth as
WITH cte AS (
    SELECT
        order_year,
        order_month,
        ROUND(SUM(sales),1) AS curr_month_revenue
    FROM curated.sales_clean
    GROUP BY order_year, order_month
)
SELECT
    *,
    LAG(curr_month_revenue)
        OVER( ORDER BY order_year,order_month)
        AS prv_month_revenue,
    ROUND(
        (
            (curr_month_revenue - prv_month_revenue)
            / prv_month_revenue
        ) * 100,
        2
    ) AS growth_pct
FROM cte;

select * from monthly_sales_growth ORDER BY order_year, order_month;

//Q5 Consistently Growing Customers
create or replace view Consistently_growing_custmrs as
with ysales as(
select customer_name , order_year, round(sum(sales),2) as yearly_sales
from curated.sales_clean
group by customer_name , order_year
),
psales as (
select *, lag(yearly_sales) over(partition by customer_name order by order_year) as prev1_ysales,
lag(yearly_sales,2) over(partition by customer_name order by order_year) as prev2_ysales
from ysales)
select distinct(customer_name)
from psales
where yearly_sales is not NULL and prev1_ysales is not NULL and prev2_ysales is not NULL
and yearly_sales > prev1_ysales and prev1_ysales > prev2_ysales;

select * from Consistently_growing_custmrs order by customer_name ;

//Q6 Which are the Top 3 products in each category by revenue, and what percentage of the category's total revenue does each product contribute
create or replace view product_category_rev as 
with prodt_rev as (
select category,product_name, round(sum(sales),2) as prodt_revenue
from curated.sales_clean
group by category, product_name),
catg_rev as (
select *,sum(prodt_revenue) over(partition by category) as category_revenue from prodt_rev
)
select *, round((prodt_revenue/category_revenue) * 100,2) as rev_contrbn_pct,
dense_rank() over(partition by category order by prodt_revenue desc) as product_rank 
from catg_rev;
;

select * from product_category_rev where product_rank <= 3 order by category, product_rank;

