
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver  as (
    SELECT t1.*
FROM ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze AS t1
LEFT JOIN ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze AS t2
  ON t1.DEPUTY_ID = t2.DEPUTY_ID 
        AND (t1.TIMESTAMP < t2.TIMESTAMP 
         OR (t1.TIMESTAMP = t2.TIMESTAMP AND t1.UUID < t2.UUID))
WHERE t2.DEPUTY_ID IS NULL
  );
