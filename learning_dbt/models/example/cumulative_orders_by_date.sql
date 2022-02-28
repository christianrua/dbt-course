
with sales_per_date as (
    select o_orderdate, sum(o_totalprice) as sum_per_date
    from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
    group by o_orderdate
    order by o_orderdate asc
)

select o_orderdate, sum_per_date, sum(sum_per_date) over(ORDER BY o_orderdate
               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cummulative  from sales_per_date

-- select distinct 
--     o_orderdate,
--     sum(o_totalprice) over (order by o_orderdate) as cummulative_sales
-- from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
-- order by o_orderdate                  