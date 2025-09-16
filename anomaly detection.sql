--Find days where daily revenue was more than 2 standard deviations away from the average.
WITH daily_revenue AS (
    SELECT order_date, SUM(amount) AS total_revenue
    FROM Orders
    GROUP BY order_date
),
stats AS (
    SELECT 
        AVG(total_revenue) AS avg_rev,
        STDEV(total_revenue) AS std_rev
    FROM daily_revenue
)
SELECT d.order_date, d.total_revenue
FROM daily_revenue d, stats s
WHERE d.total_revenue > s.avg_rev + 2*s.std_rev
   OR d.total_revenue < s.avg_rev - 2*s.std_rev
ORDER BY d.order_date;
