-- File: top_products.sql
-- Problem: Find the top 3 products by total sales amount
-- Skills: JOIN, GROUP BY, ORDER BY, LIMIT
-- Approach: Join sales and products tables, sum sales per product, order descending, limit top 3

SELECT p.product_id, p.product_name, SUM(s.amount) AS total_sales
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 3;
