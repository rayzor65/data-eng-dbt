




with all_values as (

    select distinct
        PREV_DEPUTY_EDITION_ID as value_field

    from ANALYTICS_ENG_DB.dbt_rho.deputy_conversions_bronze

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1'
    )
)

select count(*) as validation_errors
from validation_errors

