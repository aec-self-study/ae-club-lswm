
-- Use the `ref` function to select from other models

-- models/monthly_users.sql
 select
  date_trunc(first_order_at, month) as month,
  count(*) as rest
 
from {{ ref('customers') }}
 
group by month