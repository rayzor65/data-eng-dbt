{{ config(materialized="view") }}

SELECT du.*, row_number() over (order by DEPUTY_ID, TIMESTAMP) as ROW_NUMBER
    FROM DEPUTY_UPDATED du
    ORDER BY DEPUTY_ID, TIMESTAMP