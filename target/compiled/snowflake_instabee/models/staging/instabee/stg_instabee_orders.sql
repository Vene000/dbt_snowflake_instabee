with source as (

    select * from INSTABEE.PUBLIC.ORDERS

),

renamed as (

    select 
md5(cast(coalesce(cast(ORDER_ID as TEXT), '') || '-' || coalesce(cast(PRODUCT_ID as TEXT), '') || '-' || coalesce(cast(ROW_ID as TEXT), '') as TEXT)) as ORDER_LINE_ID,
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