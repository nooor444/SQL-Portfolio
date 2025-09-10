-- Problem: Find the price of each product on 2019-08-16
-- Initially, all products start with price = 10.
-- Each row records a new price for the product at that change_date.
-- Solution: Use a correlated subquery to get the most recent change
-- on or before 2019-08-16, otherwise default to 10.

SELECT 
    p.product_id,
    COALESCE((
        SELECT pr.new_price
        FROM Products pr
        WHERE pr.product_id = p.product_id
          AND pr.change_date <= '2019-08-16'
        ORDER BY pr.change_date DESC
        LIMIT 1
    ), 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;
