create database if not exists RETAIL_DB;

use database RETAIL_DB;

create schema if not exists landing;
create schema if not exists curated;
create schema if not exists ANALYTICS;

show schemas;

use database retail_db;

create file format if not exists CSV_FORMAT
TYPE = CSV
skip_header = 1
field_optionally_enclosed_by = '"';

show file formats;


