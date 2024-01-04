-- tilde `~` is used for REGEX operations
-- first_name starting with Ma
SELECT first_name, last_name
FROM customer
WHERE first_name ~ '^Ma';
-- last_name ending with ez
SELECT first_name, last_name
FROM customer
WHERE last_name ~ 'ez$';
-- last_name containing ez or ck (anywhere)
SELECT first_name, last_name
FROM customer
WHERE last_name ~ 'ez|ck';
-- last_name contains w, x, y, or z
SELECT first_name, last_name
FROM customer
WHERE last_name ~ '[w-z]';
-- first_name starts with M and ends with a
SELECT first_name, last_name
FROM customer
WHERE first_name ~ '^M[a-z]*a$';
-- last_name starts with M and has 6 or more letters 
SELECT first_name, last_name
FROM customer
WHERE last_name ~ '^M[a-z]{5,}';

/* REGEX
- . Any Character
- * 0 or more
- + 1 or more
- ^ Beginning of string
- $ End of string
- [^ab] Not a & b
- [ab] a or b
- [A-Z] All uppercase letters
- [a-z] All lowercase letters
- [0-9] All numbers
- {n} Exactly n instances
- {m,n} Between m and n instances
- m|n Match m or n
*/