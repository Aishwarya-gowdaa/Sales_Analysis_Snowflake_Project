use database retail_db;
use schema landing;

create stage if not exists retail_stage
file_format = retail_db.public.csv_format;

show stages;
list @landing.retail_stage;

create or replace table SALES_RAW(
row_id NUMBER,
    order_id STRING,
    order_date DATE,
    ship_date DATE,
    ship_mode STRING,
    customer_id STRING,
    customer_name STRING,
    segment STRING,
    country STRING,
    city STRING,
    state STRING,
    postal_code NUMBER,
    region STRING,
    product_id STRING,
    category STRING,
    sub_category STRING,
    product_name STRING,
    sales float,
    quantity NUMBER,
    discount float,
    profit float
);

desc table sales_raw;

copy into sales_raw
from @retail_stage;

select count(*) from sales_raw;