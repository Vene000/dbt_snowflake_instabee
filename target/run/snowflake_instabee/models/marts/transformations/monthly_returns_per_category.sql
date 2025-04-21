
  
    

        create or replace transient table PC_DBT_DB.DBT_.monthly_returns_per_category
         as
        (select * from (SELECT
    DATE_TRUNC('month', s.order_date) AS order_month,
    p.product_category,P.SUB_CATEGORY,
    COUNT(CASE WHEN s.order_id IS NOT NULL and s.returned = 'Yes' THEN 1 END) AS returned_orders
FROM PC_DBT_DB.DBT_.fact_sales s
JOIN PC_DBT_DB.DBT_.dim_products p
    ON s.product_id = p.product_id
WHERE EXTRACT(YEAR FROM s.order_date) = 2019
GROUP BY 1, 2,3
ORDER BY 4 DESC)
WHERE returned_orders <>0
        );
      
  