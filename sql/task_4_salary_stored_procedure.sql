
-- Task 4: Salary Filter Stored Procedure
-- Defines a procedure `filter_salary` that takes a minimum and maximum salary
-- and returns the average salary grouped by gender and department for all
-- employees whose salary lies within the provided range.
-- Input parameters:
--   p_min_salary FLOAT – inclusive lower bound
--   p_max_salary FLOAT – inclusive upper bound

DROP PROCEDURE IF EXISTS filter_salary;  -- remove existing definition if present

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
    -- Compute average salary by gender and department for records matching the range
    SELECT 
        e.gender,                      -- Gender of employee
        d.dept_name,                   -- Department name
        AVG(s.salary) AS avg_salary    -- Calculated average salary
    FROM t_salaries s
    JOIN t_employees e ON s.emp_no = e.emp_no
    JOIN t_dept_emp de ON de.emp_no = e.emp_no
    JOIN t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
    GROUP BY d.dept_no, e.gender;                   -- Aggregate by dept and gender
END$$

DELIMITER ;

-- Example call:
-- CALL filter_salary(50000, 90000);
