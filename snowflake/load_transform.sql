use database retail_db;
use schema curated;

create or replace table Sales_clean as 
select 
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    year(order_date) as order_year,
    month(order_date) as order_month,
    day(order_date) as order_day,
    datediff('DAY',order_date,ship_date) as shipping_days,
    case when profit < 0 then 'LOSS'
    ELSE 'PROFIT' end as profit_status
    from landing.sales_raw;


select * from sales_clean;

show warehouses;
alter warehouse compute_wh
set auto_suspend = 60;
