
  
    

    create or replace table `datafellowship9`.`dbt_taxi_trips`.`dim_pickup`
    
    
    OPTIONS()
    as (
      

with __dbt__cte__taxi_trips as (


SELECT *
FROM `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
WHERE EXTRACT(YEAR from trip_start_timestamp) IN (2020,2021,2022)
)SELECT DISTINCT pickup_census_tract,
  pickup_community_area,
  pickup_latitude,
  pickup_longitude
FROM __dbt__cte__taxi_trips
WHERE pickup_census_tract IS NOT NULL
ORDER BY 1
    );
  