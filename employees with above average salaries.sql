-- File: above_avg_salary.sql
-- Problem: List employees whose salary is above the company average
-- Skills: Subquery, comparison
-- Approach: Use a subquery to calculate average salary and filter employees above it

SELECT employee_id, name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
