with states as (
    select 
        id as state_id,
        name as state_name
    from {{ source("manufacture", 'state_list') }}
)

select * from states