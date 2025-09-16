--Identify customers who have not purchased anything in the last 3 months, but had at least 1 purchase earlier.
SELECT DISTINCT c.customer_id, c.name
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN (
    SELECT customer_id 
    FROM Orders 
    WHERE order_date >= DATEADD(MONTH, -3, GETDATE())
)
AND c.customer_id IN (
    SELECT customer_id 
    FROM Orders
);
