-- File: customers_no_orders.sql
-- Problem: List all customers who have never placed an order
-- Skills: LEFT JOIN, IS NULL
-- Approach: LEFT JOIN customers to orders and filter where order_id is NULL

SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
