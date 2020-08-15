



select count(*) as validation_errors
from ANALYTICS_ENG_DB.dbt_rho.deputy_events_bronze
where DEPUTY_EDITION_ID is null

