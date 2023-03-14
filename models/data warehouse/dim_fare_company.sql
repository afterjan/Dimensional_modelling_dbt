{{
  config(
    materialized = 'table',
    unique_key = 'company'
  )
}}

WITH
  t1 AS (
  SELECT
    company,
    fare/trip_miles AS fare_per_miles
  FROM
    {{ ref('taxi_trips') }}
  WHERE
    company IS NOT NULL
    AND NOT trip_miles = 0
    AND NOT fare = 0 )
    
SELECT
  company,
  AVG(fare_per_miles) AS avg_fare_per_miles
FROM t1
GROUP BY 1
ORDER BY 1