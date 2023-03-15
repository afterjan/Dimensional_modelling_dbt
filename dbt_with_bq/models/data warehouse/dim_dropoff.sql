{{
  config(
    materialized = 'table',
    unique_key = 'dropoff_census_tract'
  )
}}

SELECT DISTINCT dropoff_census_tract,
  dropoff_community_area,
  dropoff_latitude,
  dropoff_longitude
FROM {{ ref('taxi_trips') }}
WHERE pickup_census_tract IS NOT NULL
ORDER BY 1