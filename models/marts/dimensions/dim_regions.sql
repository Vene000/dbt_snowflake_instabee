SELECT DISTINCT
    r.region,
    r.state,
    p.regional_manager
FROM {{ ref('stg_instabee_orders') }} r
LEFT JOIN {{ ref('stg_instabee_people') }} p
    ON r.region = p.region