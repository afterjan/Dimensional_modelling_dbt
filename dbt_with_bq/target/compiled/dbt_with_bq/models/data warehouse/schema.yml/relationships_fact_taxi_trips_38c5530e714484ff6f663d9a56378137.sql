
    
    

with child as (
    select dropoff_census_tract as from_field
    from `datafellowship9`.`dbt_taxi_trips`.`fact_taxi_trips`
    where dropoff_census_tract is not null
),

parent as (
    select dropoff_census_tract as to_field
    from `datafellowship9`.`dbt_taxi_trips`.`dim_dropoff`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


