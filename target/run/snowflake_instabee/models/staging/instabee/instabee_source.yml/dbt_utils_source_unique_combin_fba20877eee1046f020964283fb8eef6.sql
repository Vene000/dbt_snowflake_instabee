select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        ORDER_ID, PRODUCT_ID, ROW_ID
    from INSTABEE.PUBLIC.ORDERS
    group by ORDER_ID, PRODUCT_ID, ROW_ID
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test