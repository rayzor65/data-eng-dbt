
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze  as (
    select
    *
from DEPUTY_CREATED
  );
