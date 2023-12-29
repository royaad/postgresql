-- INSERT new row
-- Javier is inserted with id 1003. Explanation @ line 15.
INSERT INTO person (first_name, last_name, email, gender, dob, country)
VALUES ('Javier', 'Reichardt', null, 'Male', '1999-07-02', 'Ukraine');
-- SELECT last 10 rows
SELECT * FROM person ORDER BY id DESC LIMIT 10;
-- DELETE last record only
DELETE FROM person WHERE id = 1003;
-- The next query should be avoided as it deletes all the table records.
-- DELETE FROM person
-- INSERT again
-- INSERT will be done with id 1004.
INSERT INTO person (first_name, last_name, email, gender, dob, country)
VALUES ('Javier', 'Reichardt', null, 'Male', '1999-07-02', 'Ukraine');
-- DELETE the new INSERT
DELETE FROM person WHERE id = 1004;
-- When a row is removed or unsuccessfully inserted, the primary key will still be incremented.
-- We can RESTART the primary key using the following commands
ALTER SEQUENCE person_id_seq RESTART WITH 1001;
-- Now, the INSERT will be done with id 1001
INSERT INTO person (first_name, last_name, email, gender, dob, country)
VALUES ('Javier', 'Reichardt', null, 'Male', '1999-07-02', 'Ukraine');
-- UPDATE row
UPDATE person SET email = 'javier.reich@yahoo.com' WHERE id = 1001;
-- If we do not use the WHERE close all emails will be updated.
-- SELECT last 10 rows
SELECT * FROM person ORDER BY id DESC LIMIT 10;
-- UPDATE multiple fields
UPDATE person
SET first_name = 'Joe',
last_name = 'Doe',
email = 'jd@gmail.com'
WHERE id = 1001;
-- Or equally
UPDATE person
SET (first_name,last_name,email) = ('Jay','May','jm@mail.com')
WHERE id = 1001;
-- SELECT last 10 rows
SELECT * FROM person ORDER BY id DESC LIMIT 10;