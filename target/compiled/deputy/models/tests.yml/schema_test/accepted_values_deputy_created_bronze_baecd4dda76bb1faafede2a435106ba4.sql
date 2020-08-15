




with all_values as (

    select distinct
        DEPUTY_EDITION as value_field

    from ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'pro_trial','paid_premium'
    )
)

select count(*) as validation_errors
from validation_errors

