
    
    

select
    order_line_id as unique_field,
    count(*) as n_records

from PC_DBT_DB.DBT_.fact_sales
where order_line_id is not null
group by order_line_id
having count(*) > 1


