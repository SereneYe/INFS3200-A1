CREATE USER serene3 WITH PASSWORD 'infs3200';
\c emp_confidential
GRANT CONNECT ON DATABASE "emp_confidential" TO serene3; 
GRANT USAGE ON SCHEMA public TO serene3;
GRANT SELECT ON TABLE employees_confidential TO serene3;