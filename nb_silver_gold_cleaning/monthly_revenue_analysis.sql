SELECT 
    d.year, d.month, d.month_name,
    SUM(CASE WHEN f.is_refund = 0 THEN f.revenue ELSE 0 END) AS gross_sales_revenue,
    SUM(CASE WHEN f.is_refund = 1 THEN f.revenue ELSE 0 END) AS refund_revenue,
    SUM(f.revenue) AS net_revenue,
    COUNT(CASE WHEN f.is_refund = 0 THEN 1 END) AS order_count,
    SUM(CASE WHEN f.discount_code IS NOT NULL AND f.is_refund = 0 THEN 1 ELSE 0 END) AS discounted_orders,
    ROUND(100.0 * SUM(CASE WHEN f.discount_code IS NOT NULL AND f.is_refund = 0 THEN 1 ELSE 0 END) 
          / COUNT(CASE WHEN f.is_refund = 0 THEN 1 END), 1) AS pct_orders_discounted
FROM gold_fact_orders f
JOIN gold_dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;