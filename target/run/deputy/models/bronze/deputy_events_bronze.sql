

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_events_bronze  as
      (

SELECT * FROM DEPUTY_CREATED
UNION
SELECT * FROM DEPUTY_UPDATED
      );
    