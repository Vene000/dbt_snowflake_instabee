SELECT
    DATE_TRUNC('month', s.order_date) AS order_month,
    p.product_category,
    SUM(s.sales) AS monthly_sales,
    LAG(SUM(s.sales)) OVER (PARTITION BY p.product_category ORDER BY DATE_TRUNC('month', s.order_date)) AS previous_month_sales,
    (SUM(s.sales) - LAG(SUM(s.sales)) OVER (PARTITION BY p.product_category ORDER BY DATE_TRUNC('month', s.order_date))) /
        NULLIF(LAG(SUM(s.sales)) OVER (PARTITION BY p.product_category ORDER BY DATE_TRUNC('month', s.order_date)), 0) AS growth_rate
FROM PC_DBT_DB.DBT_.fact_sales s
JOIN PC_DBT_DB.DBT_.dim_products p
    ON s.product_id = p.product_id
WHERE EXTRACT(YEAR FROM order_date) = 2019
GROUP BY 1, 2