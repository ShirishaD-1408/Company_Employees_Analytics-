
-- Task 3: Average Salary by Gender and Department
-- Computes the mean salary for each gender-department combination per year.
-- Only salary records through 2002 are included. The query links salary data
-- with employee demographics and department assignments to perform the grouping.

SELECT 
    e.gender,                           -- Gender of the employee
    d.dept_name,                        -- Department name
    ROUND(AVG(s.salary), 2) AS avg_salary,  -- Rounded average salary
    YEAR(s.from_date) AS calendar_year  -- Year when the salary record began
FROM t_salaries s
JOIN t_employees e ON s.emp_no = e.emp_no
JOIN t_dept_emp de ON de.emp_no = e.emp_no
JOIN t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, calendar_year   -- Aggregate by department, gender, and year
HAVING calendar_year <= 2002                   -- Keep years up to 2002 only
ORDER BY d.dept_no;                            -- Sort by department number
