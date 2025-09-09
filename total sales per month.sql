-- File: monthly_sales_running_total.sql
-- Problem: Calculate the running total of sales per month
-- Skills: Window functions, ORDER BY, SUM()
-- Approach: Use SUM() as window function partitioned by month, ordered by date

SELECT 
    order_date,
    SUM(amount) AS monthly_sales,
    SUM(SUM(amount)) OVER (ORDER BY order_date) AS running_total
FROM sales
GROUP BY order_date
ORDER BY order_date;
