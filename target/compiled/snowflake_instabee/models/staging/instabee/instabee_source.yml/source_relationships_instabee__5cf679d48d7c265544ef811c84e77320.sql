
    
    

with child as (
    select ORDER_ID as from_field
    from INSTABEE.PUBLIC.RETURNS
    where ORDER_ID is not null
),

parent as (
    select ORDER_ID as to_field
    from INSTABEE.PUBLIC.ORDERS
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


