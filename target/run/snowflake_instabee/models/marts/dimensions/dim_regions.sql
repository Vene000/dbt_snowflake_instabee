
  
    

        create or replace transient table PC_DBT_DB.DBT_.dim_regions
         as
        (SELECT DISTINCT
    r.region,
    r.state,
    p.regional_manager
FROM PC_DBT_DB.DBT_.stg_instabee_orders r
LEFT JOIN PC_DBT_DB.DBT_.stg_instabee_people p
    ON r.region = p.region
        );
      
  