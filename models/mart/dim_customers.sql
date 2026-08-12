


select {{dbt_utils.generate_surrogate_key(['c.user_id'])}} as customer_key,
c.user_id, c.full_name, c.email, c.country, u.created_at, c.tot_subscriptions,
c.tot_active_status,c.tot_canceled_status,c.tot_amount,
{{ customer_segment('c.tot_amount') }} as customer_segment,
case when c.tot_active_status>0 then 'active_customer' else 'inactive_customer' end as customer_status 
from {{ref('int_customer_lifetime')}} as c left join {{ref('stg_users')}} as u
on c.user_id = u.user_id