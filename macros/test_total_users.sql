{% macro test_total_users(model, column_name) %}

with validation as (

    select
        TOTAL_USERS, ACTIVE_USERS, DELETED_USERS
    from {{ model }}
),

validation_errors as (

    select
        *
    from validation
    WHERE TOTAL_USERS != ACTIVE_USERS + DELETED_USERS

)

select count(*)
from validation_errors

{% endmacro %}