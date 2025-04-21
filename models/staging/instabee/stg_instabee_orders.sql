with source as (

    select * from {{ source('instabee', 'ORDERS') }}

),

renamed as (

    select 
{{dbt_utils.generate_surrogate_key(['ORDER_ID', 'PRODUCT_ID', 'ROW_ID']) }} as ORDER_LINE_ID,
ROW_ID,
ORDER_ID,	
ORDERDATE AS ORDER_DATE,
SHIPDATE AS SHIP_DATE,	
SHIP_MODE,	
CUSTOMER_ID,	
CUSTOMER_NAME,	
SEGMENT,
COUNTRY,
CITY,
STATE,	
POSTAL_CODE,	
REGION,	
PRODUCT_ID,	
CATEGORY as PRODUCT_CATEGORY,	
SUB_CATEGORY,	
PRODUCT_NAME,	
SALES,	
QUANTITY,	
DISCOUNT,	
PROFIT


    from source

)

select * from renamed