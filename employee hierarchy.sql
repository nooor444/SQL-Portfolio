--Given an Employees table with columns (employee_id, name, manager_id), list all employees with their direct manager’s name.
SELECT 
    e.employee_id,
    e.name AS employee_name,
    m.name AS manager_name
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.employee_id;
