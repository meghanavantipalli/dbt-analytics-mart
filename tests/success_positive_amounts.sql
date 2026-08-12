
select * from {{ref('stg_transactions')}} where payment_status='success' and amount<0