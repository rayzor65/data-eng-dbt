{{ config(materialized="table") }}

SELECT * 
FROM {{ ref('deputy_conversions_bronze') }} 
WHERE (DIFF_TO_PREV = DEPUTY_EDITION_ID OR (DIFF_TO_PREV = DEPUTY_EDITION_ID - 1)) AND DEPUTY_EDITION_ID != 0
ORDER BY DEPUTY_ID, START_TIME
