



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver
where DEPUTY_ID is null

