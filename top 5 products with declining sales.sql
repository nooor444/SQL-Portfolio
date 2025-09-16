--Find the top 5 products whose total sales in the last 6 months dropped the most compared to the previous 6 months.
WITH sales_cte AS (
    SELECT 
        product_id,
        CASE 
            WHEN order_date >= DATEADD(MONTH, -6, GETDATE()) 
                 THEN 'last_6_months'
            ELSE 'prev_6_months'
        END AS period,
        SUM(amount) AS total_sales
    FROM Orders
    WHERE order_date >= DATEADD(MONTH, -12, GETDATE())
    GROUP BY product_id, 
             CASE 
                WHEN order_date >= DATEADD(MONTH, -6, GETDATE()) 
                     THEN 'last_6_months'
                ELSE 'prev_6_months'
             END
)
SELECT 
    p.product_id,
    p.product_name,
    MAX(CASE WHEN period='prev_6_months' THEN total_sales END) AS prev_sales,
    MAX(CASE WHEN period='last_6_months' THEN total_sales END) AS last_sales,
    (MAX(CASE WHEN period='last_6_months' THEN total_sales END) -
     MAX(CASE WHEN period='prev_6_months' THEN total_sales END)) AS sales_change
FROM sales_cte s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY sales_change ASC
LIMIT 5;
