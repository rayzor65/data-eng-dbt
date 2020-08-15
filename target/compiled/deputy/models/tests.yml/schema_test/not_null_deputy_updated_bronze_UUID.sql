



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze
where UUID is null

