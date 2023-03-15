
  
    

    create or replace table `datafellowship9`.`dbt_taxi_trips`.`dim_dropoff`
    
    
    OPTIONS()
    as (
      

with __dbt__cte__taxi_trips as (


SELECT *
FROM `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
WHERE EXTRACT(YEAR from trip_start_timestamp) IN (2020,2021,2022)
)SELECT DISTINCT dropoff_census_tract,
  dropoff_community_area,
  dropoff_latitude,
  dropoff_longitude
FROM __dbt__cte__taxi_trips
WHERE pickup_census_tract IS NOT NULL
ORDER BY 1
    );
  