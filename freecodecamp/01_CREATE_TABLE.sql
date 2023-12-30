-- create a table
CREATE TABLE IF NOT EXISTS person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	dob DATE NOT NULL,
	email VARCHAR(100));
-- You can check the psql datatypes @ https://www.postgresql.org/docs/current/datatype.html
-- Drop a table (Not recommended action)
-- DROP TABLE person;
-- DROP TABLE IF it EXISTS (Not recommended action)
DROP TABLE IF EXISTS costumers;
-- CREATE TABLE costumers with UNIQUE email and DEFAULT value
CREATE TABLE costumers (id SERIAL NOT NULL PRIMARY KEY,
						name VARCHAR NOT NULL,
						email VARCHAR UNIQUE,
						active BOOL NOT NULL DEFAULT TRUE);
-- Insert a new record
INSERT INTO costumers (name)
VALUES('John Smith');
-- Record will be inserted with email NULL and active TRUE
SELECT * FROM costumers;