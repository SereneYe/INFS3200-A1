CREATE EXTENSION IF NOT EXISTS postgres_fdw;

DROP SERVER IF EXISTS foreign_server3 CASCADE;

CREATE SERVER foreign_server3 
FOREIGN DATA WRAPPER postgres_fdw 
OPTIONS (host 'localhost', port '5432', dbname 'emp_confidential');

DROP USER MAPPING IF EXISTS FOR CURRENT_USER SERVER foreign_server3;

CREATE USER MAPPING FOR CURRENT_USER
SERVER foreign_server3
OPTIONS (user 'serene3', password 'infs3200');

DROP FOREIGN TABLE IF EXISTS employees_confidential_fdw;

CREATE FOREIGN TABLE employees_confidential_fdw (
  emp_no int NOT NULL,
  birth_date date NOT NULL,
  gender char(1) NOT NULL
) SERVER foreign_server3 OPTIONS (schema_name 'public', table_name 'employees_confidential');

SELECT COUNT(*) FROM "employees_confidential_fdw";