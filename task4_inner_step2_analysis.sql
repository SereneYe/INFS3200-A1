EXPLAIN ANALYZE
SELECT ep.last_name, ep.first_name
FROM (SELECT emp_no, last_name, first_name FROM employees_public) ep
INNER JOIN (SELECT emp_no, birth_date FROM employees_confidential ) ec ON ec.emp_no = ep.emp_no
WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01';