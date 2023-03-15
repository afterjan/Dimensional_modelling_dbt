{{
  config(
    materialized = 'table',
    unique_key = 'pickup_census_tract'
  )
}}

SELECT DISTINCT pickup_census_tract,
  pickup_community_area,
  pickup_latitude,
  pickup_longitude
FROM {{ ref('taxi_trips') }}
WHERE pickup_census_tract IS NOT NULL
ORDER BY 1