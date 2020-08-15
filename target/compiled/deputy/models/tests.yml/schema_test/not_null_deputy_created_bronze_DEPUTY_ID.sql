



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze
where DEPUTY_ID is null

