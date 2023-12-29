-- DATETIME
-- Check documentation @
-- https://www.postgresql.org/docs/current/datatype-datetime.html
-- https://www.postgresql.org/docs/current/functions-datetime.html
-- Get current datetime
SELECT NOW();
-- Cast it into DATE
SELECT NOW()::DATE;
-- Cast it into TIME;
SELECT NOW()::TIME;
-- EXTRACT CENTURY, DECADE, YEAR, MONTH, DAY, DOW (Day of Week), etc...
SELECT EXTRACT(CENTURY FROM NOW());
SELECT EXTRACT(DECADE FROM NOW());
SELECT EXTRACT(YEAR FROM NOW()); -- YEARS is also valid
SELECT EXTRACT(MONTH FROM NOW()); -- MONTHS is also valid
SELECT EXTRACT(DAY FROM NOW()); -- DAYS is also valid
SELECT EXTRACT(DOW FROM NOW());
SELECT EXTRACT(HOUR FROM NOW()); -- HOURS is also valid
SELECT EXTRACT(MINUTE FROM NOW()); -- MINUTES is also valid
SELECT EXTRACT(SECOND FROM NOW()); -- SECONDS is also valid
-- ARITHMETIC OPERATIONS WITH DATETIME
-- Define a DATE
SELECT DATE '1999-3-19';
-- Define a TIME
SELECT TIME '10:00';
-- Define a DATETIME
SELECT TIMESTAMP '1999-3-19 10:';
SELECT DATE '1999-3-19' + TIME '10:00'; -- date +/- time → timestamp
-- Define time INTERVAL
SELECT INTERVAL '100 DAYS';
SELECT INTERVAL '1 MONTH';
SELECT INTERVAL '3 HOURS';
SELECT INTERVAL '1 YEAR 1 MONTH 3 HOURS';
-- date - date → integer (producing the number of days elapsed)
SELECT DATE '1999-3-19' - DATE '1999-1-2';
-- date +/- interval → timestamp
SELECT DATE '1999-3-19' + INTERVAL '1 YEAR 1 MONTH 3 HOURS';
-- Add INTERVAL to DATE the cast to DATE
SELECT (DATE '1999-3-19' + INTERVAL '1 YEAR 1 MONTH 3 HOURS')::DATE;
-- time - time → interval
SELECT TIME '10:00' - TIME '12:00'; -- returns -2:00:00
-- Compute AGE
SELECT first_name, last_name, dob, AGE(NOW(),dob) FROM person LIMIT 50;
-- Logical operation
SELECT (DATE '1999-3-19' < DATE '2000-3-19');
SELECT (DATE '1999-3-19' <> DATE '2000-3-19');
SELECT (DATE '1999-3-19' > DATE '2000-3-19');
SELECT (DATE '1999-3-19' = DATE '2000-3-19');