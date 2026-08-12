"failed transactoins should not have +ve amount"
select * from {{ref('stg_transactions')}} where payment_status='failed' and amount>0