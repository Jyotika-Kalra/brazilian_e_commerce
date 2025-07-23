-- More Sales with less review score (1-3)
SELECT
  p.product_id,
  b.string_field_1 AS product_category_name_en,
  COUNT(oi.order_id) AS total_orders,
  ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
  hallowed-object-298708.brazilian_e_commerce.order_item_data oi
JOIN
  hallowed-object-298708.brazilian_e_commerce.products_dataset p
ON
  oi.product_id = p.product_id
JOIN
  hallowed-object-298708.brazilian_e_commerce.order_reviews_dataset r
ON
  oi.order_id = r.order_id
JOIN
  hallowed-object-298708.brazilian_e_commerce.product_category_name_translation b
ON
  p.product_category_name = b.string_field_0
GROUP BY
  p.product_id,
  b.string_field_1
HAVING
  COUNT(oi.order_id) > 20
  AND AVG(r.review_score) < 3.5
ORDER BY
  total_orders DESC
LIMIT
  5;
