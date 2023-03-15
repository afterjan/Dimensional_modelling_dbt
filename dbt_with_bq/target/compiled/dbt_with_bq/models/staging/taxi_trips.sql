

SELECT *
FROM `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
WHERE EXTRACT(YEAR from trip_start_timestamp) IN (2020,2021,2022)