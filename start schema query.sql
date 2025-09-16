--Using a star schema with FactSales, DimDate, and DimProduct, find the monthly revenue per product category.
SELECT 
    d.year,
    d.month,
    p.category,
    SUM(f.sales_amount) AS monthly_revenue
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
JOIN DimProduct p ON f.product_id = p.product_id
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month, monthly_revenue DESC;
