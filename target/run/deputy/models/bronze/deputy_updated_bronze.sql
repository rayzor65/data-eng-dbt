
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze  as (
    

-- SELECT du.*, uuid_string(uuid_string(),DEPUTY_ID) as uuid 
--     FROM DEPUTY_UPDATED du
SELECT du.*, row_number() over (order by DEPUTY_ID, TIMESTAMP) as ROW_NUMBER
    FROM DEPUTY_UPDATED du
    ORDER BY DEPUTY_ID, TIMESTAMP
  );
