CREATE TABLE employees_public
(
    emp_no int NOT NULL,
    first_name varchar(14) NOT NULL,
    last_name varchar(16) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no)
);

INSERT INTO employees_public (emp_no, first_name, last_name, hire_date)
SELECT emp_no, first_name, last_name, hire_date
FROM employees;
