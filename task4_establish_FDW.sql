CREATE EXTENSION IF NOT EXISTS postgres_fdw;

DROP SERVER IF EXISTS foreign_server CASCADE;

CREATE SERVER foreign_server 
FOREIGN DATA WRAPPER postgres_fdw 
OPTIONS (host 'infs3200-sharedb.zones.eait.uq.edu.au', port '5432', dbname 'sharedb');

DROP USER MAPPING IF EXISTS FOR CURRENT_USER SERVER foreign_server;

CREATE USER MAPPING FOR CURRENT_USER
SERVER foreign_server 
OPTIONS (user 'sharedb', password 'Y3Y7FdqDSM9.3d47XUWg');

DROP FOREIGN TABLE IF EXISTS titles;

CREATE FOREIGN TABLE titles (
  emp_no int NOT NULL,
  title varchar(50) NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL
) SERVER foreign_server OPTIONS (schema_name 'public', table_name 'titles');

SELECT COUNT(*) FROM "titles";