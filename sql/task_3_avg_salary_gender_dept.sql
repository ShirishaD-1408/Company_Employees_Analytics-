
-- Task 3: Average Salary by Gender and Department
-- This query calculates the average salary for each gender within each department,
-- broken down by calendar year, up to 2002. It joins salaries with employee and department data.

# Task-3
SELECT 
    e.gender,                           -- Employee gender
    d.dept_name,                        -- Department name
    ROUND(AVG(s.salary), 2) AS salary,  -- Average salary rounded to 2 decimal places
    YEAR(s.from_date) AS calendar_year  -- Year from salary record start date
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no        -- Join to get employee gender
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no       -- Join to get department assignments
        JOIN
    t_departments d ON d.dept_no = de.dept_no   -- Join to get department names
GROUP BY d.dept_no , e.gender , calendar_year   -- Group by department, gender, and year
HAVING calendar_year <= 2002                   -- Filter for years up to 2002
ORDER BY d.dept_no;                            -- Order by department number
