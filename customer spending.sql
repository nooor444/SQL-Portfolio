-- Problem:
-- List all customers who spent 25% or less than the average amount spent across all invoices. For each customer, display:
-- Customer name
-- Amount spent (to 6 decimal places)
-- Order the results by amount spent (descending).
-- solution- 
SELECT 
    cu.customer_name,
    CAST(ROUND(SUM(i.total_price), 6) AS DECIMAL(18,6)) AS amount_spent
FROM customer cu
JOIN invoice i ON cu.id = i.customer_id
GROUP BY cu.id, cu.customer_name
HAVING SUM(i.total_price) <= 0.25 * (SELECT AVG(total_price) FROM invoice)
ORDER BY amount_spent DESC;
