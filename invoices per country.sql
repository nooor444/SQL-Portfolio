-- problem- A business is analyzing data by country. For each country, display:
-- Country name
-- Total number of invoices
-- Average invoice amount (formatted to 6 decimal places)
-- Return only those countries where the average invoice amount is greater than the global average invoice amount.
-- solution :
SELECT
  c.country_name,
  COUNT(i.id) AS total_invoices,
  CAST(ROUND(AVG(i.total_price), 6) AS DECIMAL(18,6)) AS avg_invoice_amount
FROM country  c
JOIN city     ci ON ci.country_id = c.id
JOIN customer cu ON cu.city_id = ci.id
JOIN invoice  i  ON i.customer_id = cu.id
GROUP BY c.id, c.country_name
HAVING AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice)
ORDER BY c.country_name;
