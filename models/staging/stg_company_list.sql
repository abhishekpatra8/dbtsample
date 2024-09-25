with companies as (
    select 
        id as company_id,
        state_id,
        name as company_name,
        sales_revenue as company_sales
    from {{ source("manufacture", "company_list") }}
)

select * from companies