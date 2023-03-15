{{
  config(
    materialized = 'table',
    unique_key = 'trip_id'
  )
}}

SELECT
  unique_key AS trip_id,
  taxi_id,
  EXTRACT(year FROM trip_start_timestamp) AS year,
  EXTRACT(month FROM trip_start_timestamp) AS month,
  trip_seconds/60 AS trip_minutes,
  trip_miles,
  pickup_census_tract,
  dropoff_census_tract,
  {{ encode_payment('payment_type') }} as payment_id,
  fare,
  tips,
  extras,
  trip_total
FROM
  {{ ref('taxi_trips') }}
WHERE
  trip_seconds IS NOT NULL




