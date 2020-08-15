{{ config(materialized="table") }}

SELECT dc.DEPUTY_EDITION, 
    dc.DEPUTY_EDITION_ID, 
    dc.DEPUTY_ID, 
    dc.HOSTNAME,
    dc.TIMESTAMP as CREATED_AT,
    dc.PORTFOLIO_NAME, 
    dd.TIMESTAMP as DELETED_AT,
    dc.REGION
FROM {{ ref('deputy_created_bronze') }} dc
LEFT JOIN DEPUTY_DELETED dd ON dc.DEPUTY_ID = dd.DEPUTY_ID