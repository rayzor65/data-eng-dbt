

SELECT du.*, uuid_string(uuid_string(),DEPUTY_ID) as uuid 
    FROM DEPUTY_UPDATED du