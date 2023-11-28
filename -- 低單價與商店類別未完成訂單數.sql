-- 低單價與商店類別未完成訂單數
SELECT CASE WHEN is_official_shop = 1 then 'official'
            WHEN is_preferred_shop = 1 then 'preferred'
            WHEN is_cb_shop = 1 then 'cb'
            WHEN is_b2c_shop = 1 then 'b2c'
            END AS shop_type,
       price_usd,
      date (create_date, 'start of month'),
      count(DISTINCT a.order_id) AS ' uncomplete_order'
    FROM order_tab a
    LEFT JOIN order_item_tab b ON a.order_id = b.order_id
    LEFT JOIN item_info_tab c ON b.item_id = c.item_id
    LEFT JOIN item_categories_tab d ON c.category_id = d.category_id
    LEFT JOIN shop_info_tab f ON f.shop_id = a.shop_id
    WHERE date (create_date, 'start of month') = '2020-04-01' AND c.category_id = 16 AND b.status IN (2)
    GROUP BY 1,2,3
    ORDER BY 4