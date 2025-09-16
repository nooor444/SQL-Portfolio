--Remove duplicates by keeping the latest record (based on created_at) for each customer email.
WITH ranked AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY created_at DESC) AS rn
    FROM Customers
)
SELECT *
FROM ranked
WHERE rn = 1;
