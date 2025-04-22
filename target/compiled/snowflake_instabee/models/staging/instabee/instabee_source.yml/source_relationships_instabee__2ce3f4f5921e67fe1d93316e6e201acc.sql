
    
    

with child as (
    select REGION as from_field
    from INSTABEE.PUBLIC.ORDERS
    where REGION is not null
),

parent as (
    select REGION as to_field
    from INSTABEE.PUBLIC.PEOPLE
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


