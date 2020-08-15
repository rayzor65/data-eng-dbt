

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze  as
      (

SELECT du.*, uuid_string(uuid_string(),DEPUTY_ID) as uuid 
    FROM DEPUTY_UPDATED du
      );
    