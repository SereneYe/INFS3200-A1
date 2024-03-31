SELECT COUNT(*) 
FROM dept_emp 
JOIN departments ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Marketing';