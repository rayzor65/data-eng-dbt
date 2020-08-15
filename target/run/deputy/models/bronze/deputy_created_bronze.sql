

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze  as
      (

select
    *, REGEXP_SUBSTR(HOSTNAME,'\.(au|uk|eu|na|as)\.', 1, 1, 'c', 1) as REGION
from DEPUTY_CREATED
      );
    