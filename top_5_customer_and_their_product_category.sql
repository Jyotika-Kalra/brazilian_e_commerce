--Top 5 customers and their product category

WITH
  tot_rev AS (
  SELECT
    o.customer_id,
    io.order_id,
    io.product_id,
    ROUND(SUM(io.price), 2) AS total_revenue
  FROM
    `hallowed-object-298708.brazilian_e_commerce.order_item_data` io
  JOIN
    `hallowed-object-298708.brazilian_e_commerce.orders_dataset` o
  ON
    io.order_id = o.order_id
  GROUP BY
    o.customer_id,
    io.order_id,
    io.product_id
  ORDER BY
    total_revenue DESC
  LIMIT
    5 )
SELECT
  tot_rev.customer_id,
  t.string_field_1 AS product_category_en,
  tot_rev.total_revenue
FROM
  tot_rev
JOIN
  `hallowed-object-298708.brazilian_e_commerce.products_dataset` p
ON
  tot_rev.product_id = p.product_id
JOIN
  `hallowed-object-298708.brazilian_e_commerce.product_category_name_translation` t
ON
  p.product_category_name = t.string_field_0
