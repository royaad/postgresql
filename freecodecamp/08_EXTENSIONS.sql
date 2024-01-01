-- Check available extensions
SELECT * FROM pg_available_extensions;
-- Install/CREATE uuid EXTENSION
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- \df in CLI to check functions
-- CREATE TABLE
CREATE TABLE car_uuid (car_uuid UUID NOT NULL PRIMARY KEY,
					   make VARCHAR(100) NOT NULL,
					   price NUMERIC(19, 2) NOT NULL CHECK (price > 0));

CREATE TABLE employee_uuid (id UUID NOT NULL PRIMARY KEY,
						   full_name VARCHAR(101) NOT NULL,
						   car_uuid UUID REFERENCES car_uuid(car_uuid),
						   email VARCHAR(100),
                           UNIQUE(car_uuid),
						   UNIQUE(email));
-- INSERT INTO car_uuid
INSERT INTO car_uuid VALUES
(uuid_generate_v4(), 'Honda', 15251.20),
(uuid_generate_v4(), 'Mercedes', 30254.35);
-- Explore table
SELECT * FROM car_uuid;
-- INSERT INTO employee_uuid
INSERT INTO employee_uuid VALUES
(uuid_generate_v4(), 'John Smith', null, null),
(uuid_generate_v4(), 'Jane Doe', '787f630a-9ecf-472f-9c53-8e1f6a7efa4a', null);
-- LEFT JOIN
SELECT * FROM employee_uuid LEFT JOIN car_uuid ON employee_uuid.car_uuid = car_uuid.car_uuid;
-- When the columns names are the same in both tables we can simply use
SELECT * FROM employee_uuid LEFT JOIN car_uuid USING (car_uuid);