{{
  config(
    materialized = 'table',
    unique_key = 'taxi_id'
  )
}}

SELECT 
  DISTINCT taxi_id,
  company
FROM 
  {{ ref('taxi_trips') }}
WHERE 
  taxi_id IS NOT NULL
ORDER BY 1