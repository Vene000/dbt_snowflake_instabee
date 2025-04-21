
  
    

        create or replace transient table PC_DBT_DB.DBT_.fact_sales
         as
        (WITH base AS (
    SELECT
        o.order_line_id,
        o.order_id,
        o.order_date,
        o.ship_date,
        o.ship_mode,
        o.customer_id,
        o.product_id,
        o.country,
        o.region,
        o.state,
        o.sales,
        o.quantity,
        o.discount,
        o.profit,
        r.returned
    FROM PC_DBT_DB.DBT_.stg_instabee_orders o
    LEFT JOIN PC_DBT_DB.DBT_.stg_instabee_returns r
        ON o.order_id = r.order_id
)

SELECT *
FROM base
        );
      
  