with states as (
    select * from {{ ref("stg_state_list") }}
),

companies as (
    select * from {{ ref("stg_company_list") }}
),

details as (
    select * from {{ ref("stg_company_details") }}
),

state_companies as (
    select 
        states.state_id as state_id,
        states.state_name as state_name,
        company_id,
        company_name,
    from companies 
    join states on companies.state_id = states.state_id
),

final_details as (
    select 
        -- state_companies.state_id,
        state_companies.state_name,
        -- state_companies.company_id,
        state_companies.company_name,
        details.business_as,
        details.description,
        details.ranking,
        details.industry,
        details.address,
        details.website,
        details.sales_growth,
        details.net_income_growth,
        details.assets,
        details.fiscal_year_end,
        details.stock_exchange,
        details.contacts
    from details
    join state_companies on state_companies.company_id = details.company_id
    where details.business_as != '' and details.net_income_growth != ''
)

select * from final_details