



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_user_silver
where CREATED_AT is null

