
-- Task 2: Managers by Gender
-- This query lists all department managers along with their gender, department, and tenure details.
-- It creates a comprehensive view by cross-joining all calendar years (derived from employee hire dates)
-- with department managers, and determines if each manager was active in each year.

# Task-2
SELECT 
    d.dept_name,                    -- Department name
    ee.gender,                      -- Manager's gender
    dm.emp_no,                      -- Manager's employee number
    dm.from_date,                   -- Manager's start date in the role
    dm.to_date,                     -- Manager's end date in the role
    e.calendar_year,                -- Calendar year from hire dates
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active                   -- Flag indicating if manager was active in that year
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year  -- Subquery to get all unique calendar years from hire dates
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN                      -- Cross join to get all combinations of years and managers
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no  -- Join to get department names
        JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no    -- Join to get manager details
ORDER BY dm.emp_no, calendar_year;             -- Order by employee number and year