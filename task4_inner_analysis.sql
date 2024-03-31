EXPLAIN ANALYZE
SELECT ep.last_name, ep.first_name
FROM employees_public ep
INNER JOIN employees_confidential ec ON ec.emp_no = ep.emp_no
WHERE ec.birth_date >= '1970-01-01' AND ec.birth_date < '1975-01-01';