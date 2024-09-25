with details as (
    select 
        id as details_id,
        company_id,
        business_as,
        description,
        ranking,
        industry,
        address,
        website,
        sales_growth,
        net_income_growth,
        assets,
        fiscal_year_end,
        stock_exchange,
        contacts
    from {{ source("manufacture", "company_details") }}
)

select * from details