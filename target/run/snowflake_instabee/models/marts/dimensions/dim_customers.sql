
  
    

        create or replace transient table PC_DBT_DB.DBT_.dim_customers
         as
        (SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM PC_DBT_DB.DBT_.stg_instabee_orders
        );
      
  