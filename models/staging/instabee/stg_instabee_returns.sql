WITH source AS (
    SELECT * FROM {{ source('instabee', 'RETURNS') }}
),

deduplicated AS (
    SELECT order_id, MAX(returned) AS returned
    FROM source
    GROUP BY order_id
)

SELECT * FROM deduplicated