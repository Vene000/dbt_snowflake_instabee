WITH source AS (
    SELECT * FROM INSTABEE.PUBLIC.RETURNS
),

deduplicated AS (
    SELECT order_id, MAX(returned) AS returned
    FROM source
    GROUP BY order_id
)

SELECT * FROM deduplicated