CREATE TABLE employees_confidential
(
    emp_no int NOT NULL,
    birth_date date NOT NULL,
    gender char(1) NOT NULL,
    PRIMARY KEY (emp_no)
);

INSERT INTO employees_confidential (emp_no, birth_date, gender)
SELECT emp_no, birth_date, gender
FROM employees;