with distinct_viewers as (
select customer_id, first_value(visitor_id)
OVER (PARTITION BY customer_id ORDER BY visitor_id) visitor
  from `analytics-engineers-club.web_tracking.pageviews`
where customer_id is not null
group by visitor_id, customer_id
--order by 2 desc 
limit 50)

select * except(visitor)
from `analytics-engineers-club.web_tracking.pageviews` pv 
left join distinct_viewers dv on pv.customer_id=dv.customer_id
where pv.customer_id is not null
order by pv.customer_id
limit 10



--select customer_id, distinct(visitor_id) as visitor_ids
--from `analytics-engineers-club.web_tracking.pageviews` 
--where customer_id is not null
--group by customer_id, devicetype)

--select * 
--  from distinct_viewers --v
--  left join `analytics-engineers-club.web_tracking.pageviews` pv on v.