




with all_values as (

    select distinct
        DEPUTY_EDITION as value_field

    from ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'paid_scheduling_only','free','paid_flexi','enterprise','mobile_only','yearly','paid_timesheet_only'
    )
)

select count(*) as validation_errors
from validation_errors

