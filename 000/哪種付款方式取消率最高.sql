-- 哪種付款方式取消率最高?
SELECT Date(create_date,'start of month') AS 'Month',
CASE WHEN b.payment_method_id = 1 then 'Credit_Card'
WHEN b.payment_method_id = 2 then 'Shopee_Wallet'
WHEN b.payment_method_id = 3 then 'Paynow'
WHEN b.payment_method_id = 4 then 'Google_Pay'
WHEN b.payment_method_id = 5 then 'Paylah'
END AS payment_methods,
CASE WHEN b.status = 1 then 'Deleted'
WHEN b.status = 2 then 'Unpaid'
WHEN b.status = 3 then 'Paid'
WHEN b.status = 4 then 'Shipped'
WHEN b.status = 6 then 'Cancelled'
END AS status,
count(DISTINCT a.order_id) AS ' uncomplete_order'
FROM order_item_tab a
LEFT JOIN order_tab b ON a.order_id = b.order_id
LEFT JOIN payment_methods_tab c ON b.payment_method_id = c.method_id
GROUP BY 1,2,3