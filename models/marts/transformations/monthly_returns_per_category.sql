select * from (SELECT
    DATE_TRUNC('month', s.order_date) AS order_month,
    p.product_category,P.SUB_CATEGORY,
    COUNT(CASE WHEN s.order_id IS NOT NULL and s.returned = 'Yes' THEN 1 END) AS returned_orders
FROM {{ ref('fact_sales') }} s
JOIN {{ ref('dim_products') }} p
    ON s.product_id = p.product_id
WHERE EXTRACT(YEAR FROM s.order_date) = 2019
GROUP BY 1, 2,3
ORDER BY 4 DESC)
WHERE returned_orders <>0
