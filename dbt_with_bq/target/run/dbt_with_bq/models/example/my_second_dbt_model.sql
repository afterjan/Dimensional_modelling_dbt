

  create or replace view `datafellowship9`.`dbt_taxi_trips`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `datafellowship9`.`dbt_taxi_trips`.`my_first_dbt_model`
where id = 1;

