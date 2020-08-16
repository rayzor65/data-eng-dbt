with last_updated as (
    SELECT d1.*
    FROM ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze AS d1
    LEFT JOIN ANALYTICS_ENG_DB.dbt_rho.deputy_updated_bronze AS d2
    ON d1.DEPUTY_ID = d2.DEPUTY_ID 
            AND (d1.TIMESTAMP < d2.TIMESTAMP 
            OR (d1.TIMESTAMP = d2.TIMESTAMP AND d1.ROW_NUMBER < d2.ROW_NUMBER))
    WHERE d2.DEPUTY_ID IS NULL
)

SELECT lu.DEPUTY_EDITION, 
    lu.DEPUTY_EDITION_ID, 
    dc.DEPUTY_ID, 
    dc.HOSTNAME,
    dc.TIMESTAMP as CREATED_AT,
    dc.PORTFOLIO_NAME, 
    dd.TIMESTAMP as DELETED_AT,
    REGEXP_SUBSTR(dc.HOSTNAME,'\.(au|uk|eu|na|as)\.', 1, 1, 'c', 1) as REGION
FROM DEPUTY_CREATED dc
LEFT JOIN DEPUTY_DELETED dd ON dc.DEPUTY_ID = dd.DEPUTY_ID
LEFT JOIN last_updated lu ON dc.DEPUTY_ID = lu.DEPUTY_ID