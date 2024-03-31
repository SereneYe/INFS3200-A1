EXPLAIN ANALYZE
SELECT ep.last_name, ep.first_name
FROM employees_public ep
JOIN (
    SELECT emp_no
    FROM employees_confidential_fdw
    WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01'
) ec ON ec.emp_no = ep.emp_no;