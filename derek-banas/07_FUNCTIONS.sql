/*  We can define our own SQL functions
SYNTAX
------
CREATE OR REPLACE FUNCTION function_name(variable_1 type, variable_2 type) RETURNS type AS
$body$
-- SQL queries here
$body$
LANGUAGE SQL
*/

-- We begin by creating a simple function that adds to ints and returns an int
CREATE OR REPLACE FUNCTION fn_add_ints(int, int) RETURNS int AS
$body$
--$1 refers to 1st parameter and $2 the 2nd
--The result is passed back as a string
SELECT $1 + $2;
$body$
LANGUAGE SQL;
-- Execute
SELECT fn_add_ints(4,5);
-- We can also write it as
CREATE OR REPLACE FUNCTION fn_add_ints_2(var_1 int, var_2 int) RETURNS int AS
$body$
SELECT var_1 + var_2;
$body$
LANGUAGE SQL;
-- Execute
SELECT fn_add_ints_2(5,5);
-- A function can simply execute a query and return void
CREATE OR REPLACE FUNCTION fn_update_employee_state(state_name char(2)) RETURNS void AS
$body$
	UPDATE sales_person
	SET state = state_name
	WHERE state is null
$body$
LANGUAGE SQL;

SELECT fn_update_employee_state('PA');
-- Function to get number of customers with no phone
CREATE OR REPLACE FUNCTION fn_number_customers_no_phone() RETURNS numeric AS
$body$
	SELECT count(*)
	FROM customer
	WHERE phone is NULL;	
$body$
LANGUAGE SQL;
-- Execute
SELECT fn_number_customers_no_phone();
-- Get Number of Customers from Texas using a Named Parameter
CREATE OR REPLACE FUNCTION fn_get_number_customers_from_state(state_name char(2)) 
RETURNS numeric AS
$body$
	SELECT count(*)
	FROM customer
	WHERE state = state_name;	
$body$
LANGUAGE SQL;
-- Execute
SELECT fn_get_number_customers_from_state('TX');
SELECT fn_get_number_customers_from_state('CA');
-- Get number or order for a specific first and last name
CREATE OR REPLACE FUNCTION fn_get_number_orders_from_customer(cus_fname varchar, cus_lname varchar) 
RETURNS numeric AS
$body$
	SELECT COUNT(*)
	FROM sales_order
	NATURAL JOIN customer
	WHERE customer.first_name = cus_fname AND customer.last_name = cus_lname;	
$body$
LANGUAGE SQL;

SELECT fn_get_number_orders_from_customer('Christopher', 'Jones');




