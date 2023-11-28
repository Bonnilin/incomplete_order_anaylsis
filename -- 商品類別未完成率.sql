-- 商品類別未完成率
SELECT d.category_id,
       d.name AS category_name,
       date (create_date, 'start of month'),
       count(DISTINCT a.order_id) AS ' uncompleted_order'
   FROM order_tab a
   LEFT JOIN order_item_tab b ON a.order_id = b.order_id
   LEFT JOIN item_info_tab c ON b.item_id = c.item_id
   LEFT JOIN item_categories_tab d ON c.category_id = d.category_id
   WHERE b.status IN (1,2,6)
   GROUP BY 1,2,3