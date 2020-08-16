
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_user_conversions_gold  as (
    SELECT 
COUNT(1) as TOTAL_CONVERSIONS,
ROUND(AVG(ACTIVATION_DAYS), 1) as AVG_CONVERSION_DAYS,
ROUND(AVG(ACTIVATION_HOURS), 1) as AVG_CONVERSION_HOURS,
ROUND(AVG(ACTIVATION_MINUTES), 1) as AVG_CONVERSION_MINUTES 
FROM ANALYTICS_ENG_DB.dbt_rho.deputy_paid_conversions_silver
  );
