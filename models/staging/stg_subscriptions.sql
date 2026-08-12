with subscriptions as (select * from {{ source('stash_raw','subscriptions')}})
select cast(subscription_id as int) as subscription_id,
cast(user_id as int) as user_id,
lower(plan_tier) as plan_tier,
initcap(status) as status,
cast(monthly_price as int) as monthly_price,
signup_date, updated_at from subscriptions  