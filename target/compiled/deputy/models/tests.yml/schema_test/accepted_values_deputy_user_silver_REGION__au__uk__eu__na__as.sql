




with all_values as (

    select distinct
        REGION as value_field

    from ANALYTICS_ENG_DB.dbt_rho.deputy_user_silver

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'au','uk','eu','na','as'
    )
)

select count(*) as validation_errors
from validation_errors

