with users as (select * from {{source('stash_raw','users')}})

select cast(user_id as int) as user_id,
initcap(trim(concat(first_name,' ',last_name))) as  full_name,
lower(email) as email,
initcap(trim(country)) as country,created_at
from users