USE employees_mod;

-- Task 1: Gender Breakdown
-- Retrieves the number of employees for each gender in every calendar year.
-- Uses department assignment dates to determine the relevant year and
-- includes only years from 1990 onward. The query joins employee records
-- with their department assignments to count active staff by gender.

SELECT 
    YEAR(d.from_date) AS calendar_year,  -- Year when the employee began the department assignment
    e.gender,                           -- Employee's gender
    COUNT(e.emp_no) AS num_of_employees -- Total employees in that year and gender
FROM t_employees e
JOIN t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year, e.gender       -- Aggregate by year and gender
HAVING calendar_year >= 1990           -- Only include 1990 and later
ORDER BY calendar_year;                -- Sort results by year

