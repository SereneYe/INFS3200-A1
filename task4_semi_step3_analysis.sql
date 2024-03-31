EXPLAIN ANALYZE
SELECT FR.last_name, FR.first_name
FROM (SELECT ep.last_name, ep.first_name
FROM employees_public ep JOIN (SELECT ec.emp_no
FROM (SELECT emp_no FROM employees_public) ep
JOIN employees_confidential_fdw ec ON ep.emp_no = ec.emp_no
WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01') ec ON ec.emp_no = ep.emp_no) FR;






