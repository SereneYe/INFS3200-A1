EXPLAIN ANALYZE
SELECT emp_no
FROM employees_confidential_fdw
WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01';

EXPLAIN ANALYZE
SELECT e.emp_no, e.birth_date
FROM employees e, (SELECT emp_no, birth_date
FROM employees_confidential_fdw
WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01') ecf
WHERE ecf.emp_no = e.emp_no;

EXPLAIN ANALYZE
SELECT e.last_name, e.first_name
FROM employees e, (SELECT e.emp_no, e.birth_date
FROM employees e, (SELECT emp_no, birth_date
FROM employees_confidential_fdw
WHERE birth_date >= '1970-01-01' AND birth_date < '1975-01-01') ecf
WHERE ecf.emp_no = e.emp_no) FR
where e.emp_no = FR.emp_no;


