--Find the second best-selling product in each month.
WITH monthly_sales AS (
    SELECT 
        product_id,
        DATEPART(MONTH, order_date) AS month_num,
        SUM(amount) AS total_sales
    FROM Orders
    GROUP BY product_id, DATEPART(MONTH, order_date)
),
ranked AS (
    SELECT 
        product_id,
        month_num,
        total_sales,
        RANK() OVER (PARTITION BY month_num ORDER BY total_sales DESC) AS rnk
    FROM monthly_sales
)
SELECT * 
FROM ranked
WHERE rnk = 2;
