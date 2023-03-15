

WITH  __dbt__cte__taxi_trips as (


SELECT *
FROM `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
WHERE EXTRACT(YEAR from trip_start_timestamp) IN (2020,2021,2022)
),t1 AS(
    SELECT 
        DISTINCT payment_type
    FROM __dbt__cte__taxi_trips
)

SELECT 
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
    payment_type
FROM 
    t1
WHERE
    payment_type IS NOT NULL
ORDER BY
    1