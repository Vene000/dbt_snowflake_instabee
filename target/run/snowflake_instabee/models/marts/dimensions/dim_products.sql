
  
    

        create or replace transient table PC_DBT_DB.DBT_.dim_products
         as
        (WITH ranked_products AS (
  SELECT
    product_id,
    product_name,
    product_category,
    sub_category,
    ROW_NUMBER() OVER (
      PARTITION BY product_id 
      ORDER BY product_category NULLS LAST, sub_category NULLS LAST, product_name NULLS LAST
    ) as rn
  FROM PC_DBT_DB.DBT_.stg_instabee_orders
  WHERE product_id IS NOT NULL
  GROUP BY product_id, product_name, product_category, sub_category
)

SELECT
  product_id,
  product_name,
  product_category,
  sub_category
FROM ranked_products
WHERE rn = 1
        );
      
  