--categories generating more revenue

SELECT
  b.string_field_1 AS product_category_name_en,
  ROUND(SUM(oi.price), 2) AS total_revenue,
  COUNT(DISTINCT oi.order_id) AS num_orders
FROM
  hallowed-object-298708.brazilian_e_commerce.order_item_data oi
JOIN
  hallowed-object-298708.brazilian_e_commerce.products_dataset p
ON
  oi.product_id = p.product_id
JOIN
  hallowed-object-298708.brazilian_e_commerce.product_category_name_translation b
ON
  p.product_category_name = b.string_field_0
GROUP BY
  product_category_name_en
ORDER BY
  total_revenue DESC;
