



select count(*) as validation_errors
from (

    select
        DEPUTY_ID

    from ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze
    where DEPUTY_ID is not null
    group by DEPUTY_ID
    having count(*) > 1

) validation_errors

