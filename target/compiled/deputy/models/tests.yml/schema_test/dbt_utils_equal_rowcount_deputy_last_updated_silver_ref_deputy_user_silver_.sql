



with a as (

    select count(*) as count_a from ANALYTICS_ENG_DB.dbt_rho.deputy_last_updated_silver

),
b as (

    select count(*) as count_b from ANALYTICS_ENG_DB.dbt_rho.deputy_user_silver

),
final as (

    select abs(
            (select count_a from a) -
            (select count_b from b)
            )
        as diff_count

)

select diff_count from final

