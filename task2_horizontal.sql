CREATE TABLE salaries_horizontal
(
    emp_no int NOT NULL,
    salary int NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    PRIMARY KEY (emp_no, from_date)
) PARTITION BY RANGE (from_date);

CREATE TABLE salaries_h1 PARTITION OF salaries_horizontal FOR VALUES FROM (MINVALUE) TO ('1990-01-01');
CREATE TABLE salaries_h2 PARTITION OF salaries_horizontal FOR VALUES FROM ('1990-01-01') TO ('1992-01-01');
CREATE TABLE salaries_h3 PARTITION OF salaries_horizontal FOR VALUES FROM ('1992-01-01') TO ('1994-01-01');
CREATE TABLE salaries_h4 PARTITION OF salaries_horizontal FOR VALUES FROM ('1994-01-01') TO ('1996-01-01');
CREATE TABLE salaries_h5 PARTITION OF salaries_horizontal FOR VALUES FROM ('1996-01-01') TO ('1998-01-01');
CREATE TABLE salaries_h6 PARTITION OF salaries_horizontal FOR VALUES FROM ('1998-01-01') TO ('2000-01-01');
CREATE TABLE salaries_h7 PARTITION OF salaries_horizontal FOR VALUES FROM ('2000-01-01') TO (MAXVALUE);

TRUNCATE TABLE salaries_horizontal;
INSERT INTO salaries_horizontal
SELECT *
FROM salaries;