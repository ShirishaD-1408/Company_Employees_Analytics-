USE employees_mod;

-- Task 1: Gender Breakdown
-- This query provides a breakdown of the number of employees by gender for each calendar year,
-- starting from 1990 onwards. It joins the employees table with the department-employee table
-- to count active employees per year and gender.

# Task-1
SELECT 
    YEAR(d.from_date) AS calendar_year,  -- Extract the year from the department assignment start date
    e.gender,                           -- Employee gender
    COUNT(e.emp_no) AS num_of_employees -- Count of employees
FROM     
     t_employees e         
          JOIN    
     t_dept_emp d ON d.emp_no = e.emp_no  -- Join to get department assignments
GROUP BY calendar_year , e.gender        -- Group by year and gender
HAVING calendar_year >= 1990             -- Filter for years 1990 and later
ORDER BY YEAR(d.from_date);              -- Order by calendar year

