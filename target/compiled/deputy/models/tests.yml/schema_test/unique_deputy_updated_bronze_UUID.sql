



select count(*) as validation_errors
from (

    select
        UUID

    from ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze
    where UUID is not null
    group by UUID
    having count(*) > 1

) validation_errors

