

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze  as
      (select
    *
from DEPUTY_CREATED
      );
    