-- Do a gender count
SELECT gender, COUNT(*)
FROM person
GROUP BY gender;
-- Do a gender count and then order by frequency
SELECT gender, COUNT(*)
FROM person
GROUP BY gender
ORDER BY COUNT(*) DESC;
-- Do a gender count and then order alphabetically
-- ASC is the default
SELECT gender, COUNT(*)
FROM person
GROUP BY gender
ORDER BY gender;
-- Do a country count. Then, order by count and show only countries HAVING more than 20 records.
SELECT country, COUNT(*)
FROM person
GROUP BY country
HAVING COUNT(*) > 20
ORDER BY COUNT(*) DESC;
-- Check documentation for aggregate function @ https://www.postgresql.org/docs/9.5/functions-aggregate.html
-- Get MAX price of all cars
SELECT MAX(price) FROM car;
-- Get Min price of all cars
SELECT MIN(price) FROM car;
-- Get the SUM of all car prices
SELECT SUM(price) FROM car;
-- Get AVG price of all cars
SELECT AVG(price) FROM car;
-- Get MAX price per car make
SELECT make, MAX(price) FROM car GROUP BY make;
-- Get MAX price per car make and car model
SELECT make, model, MAX(price) FROM car GROUP BY make, model;