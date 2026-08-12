
select * 
from {{ ref('stg_transactions') }} 
where payment_status = 'failed' 
  and amount > 0