select
    COUNT(1) as num_of_gender, gender
from trips
GROUP BY gender