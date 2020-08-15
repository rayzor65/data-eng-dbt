
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_user_stats_gold  as (
    

SELECT COUNT(1) as TOTAL_USERS, 
COUNT(IFF(DELETED_AT IS NULL, 1, null)) as ACTIVE_USERS, 
COUNT(IFF(DELETED_AT IS NOT NULL, 1, null)) as DELETED_USERS
FROM ANALYTICS_ENG_DB.dbt_rho.deputy_user_silver
  );
