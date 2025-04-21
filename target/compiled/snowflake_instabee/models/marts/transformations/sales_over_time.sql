WITH monthly_sales AS (
  SELECT
      DATE_TRUNC('month', order_date) AS order_month,
      p.product_category,
      SUM(s.sales) AS category_sales
  FROM PC_DBT_DB.DBT_.fact_sales s
  JOIN PC_DBT_DB.DBT_.dim_products p
      ON s.product_id = p.product_id
  WHERE EXTRACT(YEAR FROM order_date) = 2019
  GROUP BY 1, 2
),

monthly_totals AS (
  SELECT
      order_month,
      SUM(category_sales) AS total_monthly_sales
  FROM monthly_sales
  GROUP BY 1
)

SELECT
    ms.order_month,
    ms.product_category,
    ms.category_sales,
    ROUND(ms.category_sales * 100.0 / mt.total_monthly_sales, 2) AS sales_percentage
FROM monthly_sales ms
JOIN monthly_totals mt
    ON ms.order_month = mt.order_month
ORDER BY 1, 4 DESC