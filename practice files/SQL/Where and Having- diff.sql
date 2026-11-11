--> where and having

--> used to filter data

--> where works before group-by (on base table data)

--> having works after group-by (on the result after group-by --> after aggregation functions results)

-- ----------------------------------------------------------------------------------------------------------------------------

SELECT 
    d.dept_name,
    e.name AS employee_name,
    e.salary,
    p.project_name,
    p.budget,
    AVG(e.salary) OVER (PARTITION BY d.dept_id) AS avg_salary_in_dept,
    RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC) AS salary_rank,
    (SELECT COUNT(*) 
     FROM projects p2 
     WHERE p2.dept_id = d.dept_id) AS total_projects_in_dept
FROM employees e
JOIN departments d 
    ON e.dept_id = d.dept_id
LEFT JOIN projects p 
    ON d.dept_id = p.dept_id
WHERE e.hire_date >= '2020-01-01'
  AND e.salary > 50000
  AND d.location = 'Hyderabad'
GROUP BY d.dept_name, e.name, e.salary, p.project_name, p.budget, d.dept_id
HAVING COUNT(p.project_id) >= 1
ORDER BY d.dept_name, salary_rank;

-- -------------------------------------------------------------------------------------------

SELECT dept_id, COUNT(*) AS total_employees
FROM employees
WHERE salary > 50000
GROUP BY dept_id
HAVING COUNT(*) >= 5
ORDER BY total_employees DESC;