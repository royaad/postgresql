-- CONSTRAINTS
-- DROP primary key CONSTRAINT
ALTER TABLE person DROP CONSTRAINT person_pkey;
-- ADD PRIMARY KEY CONSTRAINT
ALTER TABLE person ADD PRIMARY KEY (id);
-- ADD UNIQUE email CONSTRAINT
ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE (email);
-- DROP unique_email_address CONSTRAINT
ALTER TABLE person DROP CONSTRAINT unique_email_address;
-- ADD a CONSTRAINT on dob. dob should be before NOW().
ALTER TABLE person ADD CONSTRAINT dob_constraint CHECK (dob < NOW()::DATE);
-- The next query will return ERROR:  new row for relation "person" violates check constraint "dob_constraint"
-- INSERT INTO person (first_name, last_name, email, gender, dob, country) VALUES ('Javier', 'Reichardt', null, 'Male', '2024-07-02', 'Ukraine');
-- ADD a CONSTRAINT on gender. gender should be ...
ALTER TABLE person ADD CONSTRAINT gender_constraint
CHECK (LOWER(gender) IN ('genderqueer', 'bigender',
'genderfluid', 'male', 'polygender', 'non-binary',
'female', 'agender'));
-- The next query will return ERROR:  new row for relation "person" violates check constraint "gender_constraint"
INSERT INTO person (first_name, last_name, email, gender, dob, country) VALUES ('Javier', 'Reichardt', null, 'Shemale', '1999-07-02', 'Ukraine');
-- ON CONFLICT CLAUSE
-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-upsert/
-- ON CONFLICT with id DO NOTHING
INSERT INTO person (id, first_name, last_name, email, gender, dob, country)
VALUES (1001, 'Javier', 'Reichardt', null, 'Male', '1999-07-02', 'Ukraine')
ON CONFLICT (id) DO NOTHING;
-- ON CONFLICT with id DO UPDATE
INSERT INTO person (id, first_name, last_name, email, gender, dob, country)
VALUES (1001, 'Javier', 'Reichardt', 'whatever@any.com', 'Male', '1999-07-02', 'Ukraine')
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email;
-- ON CONFLICT with id DO UPDATE (multiple)
INSERT INTO person (id, first_name, last_name, email, gender, dob, country)
VALUES (1001, 'Joseph', 'Wolt', 'j.wolt@any.com', 'Male', '1999-07-02', 'Ukraine')
ON CONFLICT (id) DO UPDATE SET (first_name,last_name,email) = (EXCLUDED.first_name,EXCLUDED.last_name,EXCLUDED.email);
-- SELECT last 10 rows
SELECT * FROM person ORDER BY id DESC LIMIT 10;
-- ON CONFLICT with email DO NOTHING
INSERT INTO person (first_name, last_name, email, gender, dob, country)
VALUES ('Javier', 'Reichardt', 'whatever@any.com', 'Male', '1999-07-02', 'Ukraine')
ON CONFLICT (email) DO NOTHING;
-- ON CONFLICT with gender will return an ERROR:  there is no unique or exclusion constraint matching the ON CONFLICT specification 
-- https://stackoverflow.com/questions/56362387/insert-into-on-conflict-do-nothing-stops-at-check-constraint
-- ON CONFLICT works for UNIQUE, PRIMARY KEY and exclusion constraints. A check constraint is none of those.
INSERT INTO person (first_name, last_name, email, gender, dob, country)
VALUES ('Javier', 'Reichardt', null, 'Shemale', '1999-07-02', 'Ukraine')
ON CONFLICT (gender) DO NOTHING;
-- RETURNIN TO BE UNDERSTOOD
INSERT INTO person (id, first_name, last_name, email, gender, dob, country)
VALUES (1001, 'Joseph', 'Wolt', 'j.wolt@any.com', 'Male', '1999-07-02', 'Ukraine')
ON CONFLICT (id) DO NOTHING
RETURNING id, email;