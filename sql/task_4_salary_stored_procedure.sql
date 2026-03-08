
-- Task 4: Salary Filter Stored Procedure
-- This creates a stored procedure that filters employees by salary range and returns
-- the average salary by gender and department for those employees.
-- Parameters: p_min_salary (minimum salary), p_max_salary (maximum salary)

# Task-4
DROP PROCEDURE IF EXISTS filter_salary;  -- Drop the procedure if it already exists

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
    -- Select average salary by gender and department for salaries within the specified range
    SELECT 
        e.gender,                      -- Employee gender
        d.dept_name,                   -- Department name
        AVG(s.salary) as avg_salary    -- Average salary
    FROM
        t_salaries s
            JOIN
        t_employees e ON s.emp_no = e.emp_no        -- Join to get employee gender
            JOIN
        t_dept_emp de ON de.emp_no = e.emp_no       -- Join to get department assignments
            JOIN
        t_departments d ON d.dept_no = de.dept_no   -- Join to get department names
        WHERE s.salary BETWEEN p_min_salary AND p_max_salary  -- Filter by salary range
    GROUP BY d.dept_no, e.gender;                   -- Group by department and gender
END$$

DELIMITER ;

-- Call the procedure with example parameters (salaries between 50,000 and 90,000)
CALL filter_salary(50000, 90000);
