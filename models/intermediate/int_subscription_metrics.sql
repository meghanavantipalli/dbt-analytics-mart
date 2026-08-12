
select s.subscription_id, u.user_id,u.full_name,u.email, u.country,
       s.plan_tier,s.status, s.signup_date,
       count(t.transaction_id) as total_transactions,
       coalesce(sum(t.amount),0) as total_revenue,
       round(coalesce(avg(t.amount),0)) as avg_payment,
       min(t.transaction_date) as first_payment_date,
       max(t.transaction_date) as last_payment_date
       from {{ref('stg_subscriptions')}} as s left join 
       {{ref('stg_users')}} as u on u.user_id=s.user_id left join
       (select * from {{ref('stg_transactions')}} where payment_status = 'success') as t on s.subscription_id= t.subscription_id 
       group by s.subscription_id, u.user_id,u.full_name,u.email, u.country,
       s.plan_tier,s.status, s.signup_date 
