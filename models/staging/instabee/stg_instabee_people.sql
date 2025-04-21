with source as (

    select * from {{ source('instabee', 'PEOPLE') }}

)

select * from source