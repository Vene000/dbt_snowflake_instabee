
  create or replace   view PC_DBT_DB.DBT_.stg_instabee_people
  
   as (
    with source as (

    select * from INSTABEE.PUBLIC.PEOPLE

)

select * from source
  );

