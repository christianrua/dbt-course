with sample_customer as (
    select *
    from {{ source('sample','customer') }}
),

sample_orders as (
    select *
    from {{ source('sample','orders') }}
)

SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from sample_customer c 
LEFT JOIN sample_orders o 
ON c.c_custkey = o.o_custkey
-- GROUP BY
--     c.c_custkey,
--     c.c_name,
--     c.c_nationkey  
{{group_by(3)}} 
HAVING     
    sum(o.o_totalprice) > 0