
    
    

with dbt_test__target as (

  select pickup_census_tract as unique_field
  from `datafellowship9`.`dbt_taxi_trips`.`dim_pickup`
  where pickup_census_tract is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


