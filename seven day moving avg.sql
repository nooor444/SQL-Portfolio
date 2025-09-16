--Compute the 7-day moving average of revenue from the Orders table.
SELECT 
    order_date,
    SUM(amount) AS daily_revenue,
    AVG(SUM(amount)) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7d
FROM Orders
GROUP BY order_date
ORDER BY order_date;
