select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select region
from PC_DBT_DB.DBT_.dim_regions
where region is null



      
    ) dbt_internal_test