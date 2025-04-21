
  
    

        create or replace transient table PC_DBT_DB.DBT_.top_selling_states_and_regions
         as
        (WITH monthly_region_sales AS(SELECT
DATE_TRUNC('month', order_date) AS order_month,
    s.region,
    s.state,
    d.regional_manager,
    SUM(s.sales) AS region_sales
FROM PC_DBT_DB.DBT_.fact_sales s
LEFT JOIN PC_DBT_DB.DBT_.dim_regions d
    ON s.region = d.region AND s.state = d.state
WHERE EXTRACT(YEAR FROM s.order_date) = 2019
GROUP BY 1, 2, 3,4
ORDER BY region_sales DESC),

monthly_totals AS (
  SELECT
      order_month,
      SUM(region_sales) AS total_monthly_sales
  FROM monthly_region_sales
  GROUP BY 1
),

ranked_regions AS (
  SELECT
      mrs.*,
      mt.total_monthly_sales,
      ROUND(mrs.region_sales * 100.0 / mt.total_monthly_sales, 2) AS sales_percentage,
      ROW_NUMBER() OVER (PARTITION BY mrs.order_month ORDER BY mrs.region_sales DESC) AS region_rank
  FROM monthly_region_sales mrs
  JOIN monthly_totals mt
      ON mrs.order_month = mt.order_month
  WHERE mrs.order_month IS NOT NULL
)

SELECT
    order_month,
    region AS top_region,
    state AS top_state,
    regional_manager,
    region_sales,
    sales_percentage
FROM ranked_regions
WHERE region_rank = 1
ORDER BY order_month DESC
        );
      
  