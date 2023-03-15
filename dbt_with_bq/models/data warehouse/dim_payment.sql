{{
  config(
    materialized = 'table',
    unique_key = 'payment_id'
  )
}}

WITH t1 AS(
    SELECT 
        DISTINCT payment_type
    FROM {{ ref('taxi_trips') }}
)

SELECT 
    {{ encode_payment('payment_type') }} as payment_id,
    payment_type
FROM 
    t1
WHERE
    payment_type IS NOT NULL
ORDER BY
    1