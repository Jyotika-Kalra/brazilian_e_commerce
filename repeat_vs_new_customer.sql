-- Repeat vs New Customers
with s as (SELECT
  o.customer_id,
  count(o.order_id) as times_ordered,
  case when count(o.order_id) = 1 then 'one-time' else 'repeat' end as customer_type,
  c.customer_state
FROM
  `hallowed-object-298708.brazilian_e_commerce.orders_dataset` o
JOIN
  `hallowed-object-298708.brazilian_e_commerce.customer_dataset` c
ON
  o.customer_id = c.customer_id
group by 1,4
order by times_ordered desc)

select * from s
where customer_type = 'repeat'
