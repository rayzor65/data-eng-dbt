



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_conversions_bronze
where END_TIME is null

