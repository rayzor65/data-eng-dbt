

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_user_conversions_silver  as
      (

SELECT dc.DEPUTY_EDITION, 
dl.DEPUTY_EDITION as CONVERTED_TO, 
dc.TIMESTAMP as START_TIME, 
dl.TIMESTAMP as END_TIME, 
TIMEDIFF(day, START_TIME, END_TIME) as ACTIVATION_DAYS, 
TIMEDIFF(hours, START_TIME, END_TIME) as ACTIVATION_HOURS,
TIMEDIFF(minutes, START_TIME, END_TIME) as ACTIVATION_MINUTES, 
dc.DEPUTY_EDITION_ID, 
dc.DEPUTY_ID, 
dc.HOSTNAME, 
dc.PORTFOLIO_NAME, 
dc.REGION
FROM ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze dc 
LEFT JOIN ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver dl ON dc.DEPUTY_ID = dl.DEPUTY_ID
WHERE dc.DEPUTY_EDITION IN ('free', 'pro_trial') AND dl.DEPUTY_EDITION NOT IN ('free', 'pro_trial')
      );
    