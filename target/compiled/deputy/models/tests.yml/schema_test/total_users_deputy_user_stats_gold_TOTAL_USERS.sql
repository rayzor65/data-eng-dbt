

with validation as (

    select
        TOTAL_USERS, ACTIVE_USERS, DELETED_USERS
    from ANALYTICS_ENG_DB.dbt_rho.deputy_user_stats_gold
),

validation_errors as (

    select
        *
    from validation
    WHERE TOTAL_USERS != ACTIVE_USERS + DELETED_USERS

)

select count(*)
from validation_errors

