

select
    *, REGEXP_SUBSTR(HOSTNAME,'\.(au|uk|eu|na|as)\.', 1, 1, 'c', 1) as REGION
from DEPUTY_CREATED