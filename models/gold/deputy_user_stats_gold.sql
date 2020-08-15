{{ config(materialized="view") }}

SELECT COUNT(1) as TOTAL_USERS, 
COUNT(IFF(DELETED_AT IS NULL, 1, null)) as ACTIVE_USERS, 
COUNT(IFF(DELETED_AT IS NOT NULL, 1, null)) as DELETED_USERS
FROM {{ ref('deputy_user_silver') }}