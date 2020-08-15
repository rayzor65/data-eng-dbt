
  create or replace  view ANALYTICS_ENG_DB.dbt_rho.deputy_users  as (
    SELECT dc.DEPUTY_EDITION, 
    dc.DEPUTY_EDITION_ID, 
    dc.DEPUTY_ID, 
    dc.HOSTNAME,
    dc.TIMESTAMP as CREATED_AT,
    dc.PORTFOLIO_NAME, 
    dd.TIMESTAMP as DELETED_AT
FROM DEPUTY_CREATED dc
LEFT JOIN DEPUTY_DELETED dd ON dc.DEPUTY_ID = dd.DEPUTY_ID
  );
