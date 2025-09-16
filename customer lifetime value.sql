-- For each customer, calculate their lifetime value (total amount spent), average purchase amount, and their most recent purchase date. Order by lifetime value (highest first).
SELECT 
    c.customer_id,
    c.name,
    SUM(o.amount) AS lifetime_value,
    AVG(o.amount) AS avg_purchase,
    MAX(o.visited_on) AS last_purchase_date
FROM Customer c
JOIN Orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value DESC;
