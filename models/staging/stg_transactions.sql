with transactions as (select * from {{source('stash_raw','transactions')}})
select transaction_id,
cast(subscription_id as int) as subscription_id,
cast(amount as int) as amount,
lower(payment_status) as payment_status,
transaction_date
from transactions
