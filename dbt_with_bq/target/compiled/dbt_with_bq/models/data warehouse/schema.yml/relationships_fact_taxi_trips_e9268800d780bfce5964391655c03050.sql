
    
    

with child as (
    select taxi_id as from_field
    from `datafellowship9`.`dbt_taxi_trips`.`fact_taxi_trips`
    where taxi_id is not null
),

parent as (
    select taxi_id as to_field
    from `datafellowship9`.`dbt_taxi_trips`.`dim_taxi_company`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


