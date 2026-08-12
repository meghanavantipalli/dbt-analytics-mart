select t.*
from {{ref('stg_transactions')}} t
left join {{ref('stg_subscriptions')}} s
    on t.subscription_id = s.subscription_id
where s.subscription_id is null