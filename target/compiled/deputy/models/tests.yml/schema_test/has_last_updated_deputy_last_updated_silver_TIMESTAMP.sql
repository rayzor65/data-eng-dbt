

with validation as (

    select
        TIMESTAMP as LAST_UPDATED_AT,
        DEPUTY_ID
    from ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver
),

validation_errors as (

    select
        COUNT(1) as num_records
    from validation
    -- if this is true, then even_field is actually odd!
    -- where (even_field % 2) = 1
    GROUP BY DEPUTY_ID
    HAVING num_records > 1

)

select count(*)
from validation_errors

