with subscriptions_metrics as(
    select user_id,
    count(*) over(partition by user_id) as tot_subscriptions,
    count(case when status='active' then 1 end) over(partition by user_id) as tot_active_status,
    count(case when status='canceled' then 1 end) over(partition by user_id) as tot_canceled_status,
    sum(total_revenue) over(partition by user_id) as tot_amount,
    (current_date-first_payment_date::date) as tot_days from {{ref('int_subscription_metrics')}}

)
select distinct u.user_id,u.full_name,u.email,u.country,s.tot_subscriptions,s.tot_active_status,s.tot_canceled_status,s.tot_amount,s.tot_days
from {{ref('stg_users')}} as u left join subscriptions_metrics as s on u.user_id=s.user_id