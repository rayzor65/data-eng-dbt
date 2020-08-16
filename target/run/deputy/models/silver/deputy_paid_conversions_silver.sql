
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_paid_conversions_silver  as (
    SELECT * 
FROM ANALYTICS_ENG_DB.dbt_rho.deputy_conversions_bronze 
WHERE (DIFF_TO_PREV = DEPUTY_EDITION_ID OR (DIFF_TO_PREV = DEPUTY_EDITION_ID - 1)) AND DEPUTY_EDITION_ID != 0
ORDER BY DEPUTY_ID, START_TIME
  );
