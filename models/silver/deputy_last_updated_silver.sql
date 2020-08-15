SELECT t1.*
FROM {{ ref('deputy_updated_bronze') }} AS t1
LEFT JOIN {{ ref('deputy_updated_bronze') }} AS t2
  ON t1.DEPUTY_ID = t2.DEPUTY_ID 
        AND (t1.TIMESTAMP < t2.TIMESTAMP 
         OR (t1.TIMESTAMP = t2.TIMESTAMP AND t1.UUID < t2.UUID))
WHERE t2.DEPUTY_ID IS NULL