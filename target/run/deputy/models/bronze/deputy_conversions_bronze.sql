

      create or replace transient table ANALYTICS_ENG_DB.dbt_rho.deputy_conversions_bronze  as
      (

with du as (
    SELECT DEPUTY_ID, 
        DEPUTY_EDITION_ID, 
        LAG(DEPUTY_EDITION_ID, 1, null) over (partition by DEPUTY_ID order by TIMESTAMP) as PREV_DEPUTY_EDITION_ID, 
        DEPUTY_EDITION_ID - PREV_DEPUTY_EDITION_ID as DIFF_TO_PREV, 
        DEPUTY_EDITION, 
        LAG(DEPUTY_EDITION, 1, null) over (partition by DEPUTY_ID order by TIMESTAMP) as PREV_DEPUTY_EDITION, 
        TIMESTAMP as END_TIME,
        LAG(TIMESTAMP, 1, null) over (partition by DEPUTY_ID order by TIMESTAMP) as START_TIME
    FROM ANALYTICS_ENG_DB.dbt_rho.deputy_events_bronze 
)

SELECT *, 
TIMEDIFF(day, START_TIME, END_TIME) as ACTIVATION_DAYS, 
TIMEDIFF(hours, START_TIME, END_TIME) as ACTIVATION_HOURS,
TIMEDIFF(minutes, START_TIME, END_TIME) as ACTIVATION_MINUTES
FROM du
-- WHERE (DIFF_TO_PREV = DEPUTY_EDITION_ID OR (DIFF_TO_PREV = DEPUTY_EDITION_ID - 1)) AND DEPUTY_EDITION_ID != 0
ORDER BY DEPUTY_ID, START_TIME
      );
    