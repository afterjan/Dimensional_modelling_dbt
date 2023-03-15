
  
    

    create or replace table `datafellowship9`.`dbt_taxi_trips`.`fact_taxi_trips`
    
    
    OPTIONS()
    as (
      

with __dbt__cte__taxi_trips as (


SELECT *
FROM `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
WHERE EXTRACT(YEAR from trip_start_timestamp) IN (2020,2021,2022)
)SELECT
  unique_key AS trip_id,
  taxi_id,
  EXTRACT(year FROM trip_start_timestamp) AS year,
  EXTRACT(month FROM trip_start_timestamp) AS month,
  trip_seconds/60 AS trip_minutes,
  trip_miles,
  pickup_census_tract,
  dropoff_census_tract,
  case payment_type
        when "Cash" then '1'
        when "Credit Card" then  '2'
        when "Dispute" then  '3'
        when "Mobile" then '4'
        when "No charge" then '5'
        when "Pcard" then '6'
        when "Prcard" then '7' 
        when "Prepaid" then '8'
        when "Unknown" then '9'
        when "Way2ride" then '10'
    end as payment_id,
  fare,
  tips,
  extras,
  trip_total
FROM
  __dbt__cte__taxi_trips
WHERE
  trip_seconds IS NOT NULL
    );
  