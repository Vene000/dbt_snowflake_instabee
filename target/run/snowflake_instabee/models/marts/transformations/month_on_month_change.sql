
  
    

        create or replace transient table PC_DBT_DB.DBT_.month_on_month_change
         as
        (SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(sales) AS total_sales,
    LAG(SUM(sales)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS previous_month_sales,
    SUM(sales) - LAG(SUM(sales)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS change_in_sales
FROM PC_DBT_DB.DBT_.fact_sales
WHERE EXTRACT(YEAR FROM order_date) = 2019
GROUP BY 1
        );
      
  