




select count(*) as validation_errors
from (
    select DEPUTY_ID as id from ANALYTICS_ENG_DB.dbt_rho.deputy_user_silver
) as child
left join (
    select DEPUTY_ID as id from ANALYTICS_ENG_DB.dbt_rho.deputy_created_bronze
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null

