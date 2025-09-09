-- Problem: Count the number of direct reports for each manager and calculate average age
-- Source: Practice SQL queries
-- Difficulty: Medium
-- Approach: 
--   1. Join the employees table with itself on manager ID.
--   2. Group by manager to count reports and calculate average age of subordinates.

SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age), 0) AS average_age
FROM employees m
JOIN employees e 
  ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
