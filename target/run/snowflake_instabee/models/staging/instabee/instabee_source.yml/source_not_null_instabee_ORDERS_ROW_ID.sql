select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ROW_ID
from INSTABEE.PUBLIC.ORDERS
where ROW_ID is null



      
    ) dbt_internal_test