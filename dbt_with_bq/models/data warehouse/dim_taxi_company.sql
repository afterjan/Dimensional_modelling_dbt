{{
  config(
    materialized = 'table',
    unique_key = 'taxi_id'
  )
}}

WITH
  t1 AS (
  SELECT
    DISTINCT taxi_id,
    company,
    fare/trip_miles AS fare_per_miles
  FROM
    {{ ref('taxi_trips') }}
  WHERE
    taxi_id IS NOT NULL
    AND NOT trip_miles = 0
    AND NOT fare = 0
  ORDER BY
    1)
SELECT
  taxi_id,
  company,
  AVG(fare_per_miles) AS avg_fare_per_miles
FROM
  t1
GROUP BY 1,2
ORDER BY 1,2