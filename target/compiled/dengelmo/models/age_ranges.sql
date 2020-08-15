select
    WIDTH_BUCKET( (YEAR(CURRENT_DATE()) - birth_year), 1, 100, 5) as bucket,
    (YEAR(CURRENT_DATE()) - birth_year) as age
from trips
    WHERE birth_year IS NOT NULL
ORDER BY bucket