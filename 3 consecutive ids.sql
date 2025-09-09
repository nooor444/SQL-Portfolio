-- File: three_consecutive_ids.sql
-- Problem: Find records where IDs are consecutive (e.g., 101, 102, 103)
-- Source: Practice SQL queries
-- Difficulty: Medium
-- Skills Demonstrated: Window functions, self-join, subqueries, ordering
-- Approach: 
--   1. Compare each ID with the next two IDs to check for consecutiveness.
--   2. Can be solved using LEAD() window function or self-join approach.
--   3. Useful for detecting missing sequences, validating data integrity.

-- Using LEAD() approach:
SELECT id AS first_id,
       LEAD(id, 1) OVER (ORDER BY id) AS second_id,
       LEAD(id, 2) OVER (ORDER BY id) AS third_id
FROM table_name
QUALIFY (LEAD(id, 1) OVER (ORDER BY id) = id + 1)
       AND (LEAD(id, 2) OVER (ORDER BY id) = id + 2);

