select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_line_id
from PC_DBT_DB.DBT_.fact_sales
where order_line_id is null



      
    ) dbt_internal_test