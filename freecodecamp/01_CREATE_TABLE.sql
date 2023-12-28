-- create a table
CREATE TABLE IF NOT EXISTS person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	dob DATE NOT NULL,
	email VARCHAR(100));
-- You can check the psql datatypes @ https://www.postgresql.org/docs/current/datatype.html
-- Drop a table
-- DROP TABLE person;
-- Insert a new record
INSERT INTO person (first_name, last_name, gender, dob)
VALUES('John', 'Smith', 'Male', DATE '1789-7-14');

