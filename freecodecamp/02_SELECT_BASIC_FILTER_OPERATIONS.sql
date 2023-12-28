-- Fake tables can be created @ https://www.mockaroo.com/
-- Show first 10 rows
SELECT * FROM person LIMIT 10;
SELECT * FROM person FETCH FIRST 10 ROW ONLY;
-- Show first 10 rows OFFSET by 5, order between LIMIT and OFFSET is not important
SELECT * FROM person LIMIT 10 OFFSET 5;
SELECT * FROM person OFFSET 5 LIMIT 10;
-- Show rows 981 till end
SELECT * FROM person OFFSET 980;
-- Only display DISTINCT values
SELECT DISTINCT country FROM person;
-- Only display persons with country = 'France'
SELECT * FROM person WHERE country = 'France';
-- Only display persons with country = 'France' AND gender = 'Female'
SELECT * FROM person WHERE country = 'France' AND gender = 'Female';
-- Only display persons with country = 'France' OR country = 'Germany'
SELECT * FROM person WHERE country = 'France' OR country = 'Germany';
-- Display persons whos country is 'France', 'China', 'Poland'
SELECT * FROM person WHERE country IN ('France', 'China', 'Poland')
-- Display persons whos email google
SELECT * FROM person WHERE email LIKE '%@google.%'
-- Display persons whos email address is length 6
SELECT * FROM person WHERE email LIKE '______@%'
-- Display persons whos country starts with p case insensitive
SELECT * FROM person WHERE country ILIKE 'p%'