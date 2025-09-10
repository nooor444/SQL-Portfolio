-- Problem: Find the person_name of the last person that can fit on the bus without exceeding the weight limit of 1000 kg.
-- The bus boards people in order of `turn`.
-- The bus capacity is 1000 kg. We need the last person in order who can still board without the total exceeding 1000 kg.
-- Solution: Use a window function to calculate the running sum of weights,filter to those <= 1000, and take the last (highest turn) that still fits.

SELECT person_name
FROM (
    SELECT 
        person_id,
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
) q
WHERE cumulative_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
