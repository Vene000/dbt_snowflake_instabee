SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM {{ ref('stg_instabee_orders') }}