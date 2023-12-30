-- SQL language supports logical and arithmetic operations
-- LOGICAL OPERATIONS
-- Logical operations return true or false booleans
-- Bigger than
SELECT 2 > 1;
-- Bigger or equal than
SELECT 1 >= 2;
-- Lesser than
SELECT 2 < 1;
-- Lesser or equal than
SELECT 1 <= 2;
-- Equal to
SELECT 1 = 2;
-- Not equal to
SELECT 1 <> 2;
-- IS NULL
SELECT NULL IS NULL;
-- SELECT person's info WHERE email IS NULL
SELECT * FROM person WHERE email IS NULL;
-- IS NOT NULL
SELECT NULL IS NOT NULL;
-- ARITHMETIC OPERATIONS
-- Arithmetic oprerations return a number
-- Addition
SELECT 2 + 1;
-- Subtraction
SELECT 2 - 1;
-- Multiplication
SELECT 2 * 3;
-- Division between 2 integers returns an INT
SELECT 10 / 3;
-- Division with 1 float returns an FLOAT
SELECT 10.0 / 3;
-- Division by NULL returns NULL
SELECT 10.0 / NULL;
-- Power
SELECT 10 ^ 2;
-- Factorial
SELECT FACTORIAL(5);
-- Modulo
SELECT 10 % 3;
-- STRING OPERATIONS
-- Cast to lowercase letters
SELECT LOWER('Test');
-- Cast to uppercase letters
SELECT UPPER('Test');
-- OTHER
-- Use :: to cast
SELECT 3.33::INT;
SELECT 3.33::VARCHAR(3);
-- NULLIF(value, condition)
SELECT NULLIF(10,0); -- returns 10
SELECT NULLIF(0,0); -- returns NULL
-- COALESCE return first NOT NULL value
SELECT COALESCE(NULL, NULL, 10, 5); -- returns 10
-- REPLACE NULL emails with 'NOT PROVIDED'
SELECT COALESCE(email, 'NOT PROVIDED') FROM person LIMIT 50;
-- COALESCE + NULLIF to handle ZERODIVISION
SELECT COALESCE(10 / NULLIF(0,0)); -- returns NULL
SELECT COALESCE(10 / NULLIF(2,0)); -- returns 5
-- In the CLI run the command
-- \i C:/Users/user/Desktop/MOOCs/PostgreSQL/data/car.sql
-- Change file path accordingly
-- Arithmetic operations can be applied directly in SELECT
SELECT id, make, model, price::INT AS original_price,
ROUND(price * 0.9, 0) AS discounted_price,
ROUND(price * 0.1, 0) AS discount
FROM car LIMIT 50;