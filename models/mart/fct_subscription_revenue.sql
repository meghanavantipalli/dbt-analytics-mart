{{
    config(
        materialized ='incremental',
        unique_key = 'subscription_key'

    )
}}


with customers_dim as (select * from {{ref('dim_customers')}}),
sub_metrics as (select * from {{ref('int_subscription_metrics')}})

select {{dbt_utils.generate_surrogate_key(['subscription_id'])}} as subscription_key,
s.subscription_id, c.user_id, c.customer_key, 
s.plan_tier,s.status,s.signup_date,
s.total_transactions, s.total_revenue,s.avg_payment,s.first_payment_date,s.last_payment_date,
(current_date-s.signup_date::date) as subscription_age_days, 
{{revenue_category('s.total_revenue')}} as revenue_status

from sub_metrics as s left join customers_dim as c on s.user_id=c.user_id

{% if is_incremental() %}
where s.last_payment_date>(select max(last_payment_date) from {{this}})
{% endif %}