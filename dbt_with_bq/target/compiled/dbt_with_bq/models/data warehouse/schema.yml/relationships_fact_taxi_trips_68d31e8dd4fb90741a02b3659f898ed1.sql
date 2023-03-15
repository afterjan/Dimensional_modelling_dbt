
    
    

with child as (
    select payment_id as from_field
    from `datafellowship9`.`dbt_taxi_trips`.`fact_taxi_trips`
    where payment_id is not null
),

parent as (
    select payment_id as to_field
    from `datafellowship9`.`dbt_taxi_trips`.`dim_payment`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


