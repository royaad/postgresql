-- CREATE TABLE customer
CREATE TABLE IF NOT EXISTS customer(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NOT NULL,
company VARCHAR(60) NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL DEFAULT 'PA',
zip SMALLINT NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NULL,
sex CHAR(1) NOT NULL,
date_entered TIMESTAMP NOT NULL,
id SERIAL PRIMARY KEY
);
-- CREATE TYPE
CREATE TYPE sex_type AS ENUM ('M', 'F', 'O');
-- DROP TYPE
-- DROP TYPE sex_type;
-- Change COLUMN TYPE
ALTER TABLE customer
ALTER COLUMN sex
TYPE sex_type USING sex::sex_type;
-- CREATE TABLE sales_person
CREATE TABLE IF NOT EXISTS sales_person(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL DEFAULT 'PA',
zip SMALLINT NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NULL,
sex sex_type NOT NULL,
date_hired TIMESTAMP NOT NULL,
id SERIAL PRIMARY KEY
);
-- CREATE TABLE product_type
CREATE TABLE IF NOT EXISTS product_type(
name VARCHAR(30) NOT NULL,
id SERIAL PRIMARY KEY);
-- CREATE TABLE product
CREATE TABLE IF NOT EXISTS product(
type_id INTEGER REFERENCES product_type(id),
name VARCHAR(30) NOT NULL,
supplier VARCHAR(30) NOT NULL,
description TEXT NOT NULL,
id SERIAL PRIMARY KEY);
-- CREATE TABLE item
CREATE TABLE IF NOT EXISTS item(
product_id INTEGER REFERENCES product(id),
size INTEGER NOT NULL,
color VARCHAR(30) NOT NULL,
picture VARCHAR(256) NOT NULL,
price NUMERIC(6,2) NOT NULL,
id SERIAL PRIMARY KEY);
-- CREATE TABLE sales_order
CREATE TABLE IF NOT EXISTS sales_order(
cust_id INTEGER REFERENCES customer(id),
sales_person_id INTEGER REFERENCES sales_person(id),
time_order_taken TIMESTAMP NOT NULL,
purchase_order_number INTEGER NOT NULL,
credit_card_number VARCHAR(16) NOT NULL,
credit_card_exper_month SMALLINT NOT NULL,
credit_card_exper_day SMALLINT NOT NULL,
credit_card_secret_code SMALLINT NOT NULL,
name_on_card VARCHAR(100) NOT NULL,
id SERIAL PRIMARY KEY
);
-- CREATE TABLE sales_item
CREATE TABLE IF NOT EXISTS sales_item(
item_id INTEGER REFERENCES item(id),
sales_order_id INTEGER REFERENCES sales_order(id),
quantity INTEGER NOT NULL,
discount NUMERIC(3,2) NULL DEFAULT 0,
taxable BOOLEAN NOT NULL DEFAULT FALSE,
sales_tax_rate NUMERIC(5,2) NOT NULL DEFAULT 0,
id SERIAL PRIMARY KEY
);
/* DATATYPES
Character Types:
1. Char(5): Stores up to a max number of 5 characters (Char values are padded with spaces to the specified length)
2. Varchar: Store any length of characters (Varchar data type values are not padded with spaces)
3. Varchar(20): Store up to 20 characters
4. Text: Store any length of characters
Numeric Types:
Serial:
1. Smallserial : 1 to 32,767
2. Serial : 1 to 2147483647
3. Bigserial : 1 to 9223372036854775807
Integer:
1. Smallint : -32,768 to 32, 767
2. Integer : -2,147,583,648 to 2,174,483,647
3. Bigint : -9223372036854775808 to 9223372036854775807
Floats:
1. Decimal : 131072 whole digits and 16383 after decimal
2. Numeric : 131072 whole digits and 16383 after decimal
3. Real : 1E-37 to 1E37 (6 places of precision)
4. Double Precision : 1E-307 to 1E308 (15 places of precision) Used when decimal doesn’t have to be very precise
5. Float : Same as double
Boolean:
1. True, 1, t, y, yes, on
2. False, 0, f, n, no, off
3. null
Date / Time 
DATE
1. No matter what format you enter you get this : 1974-12-21
TIME
1. TIME WITHOUT TIME ZONE (Default)
2. ‘1:30:30 PM’:: TIME WITHOUT TIME ZONE -> 13:30:30
3. 01:30 AM EST -> 01:30-5:00 (UTC Format)
4. 01:30 PM PST -> 01:30-8:00
5. 01:30 PM UTC -> 01:30+00:00
6. ’01:30:30 PM EST’::TIME WITH TIME ZONE -> 13:30:30-5:00
TIMESTAMP
1. ‘DEC-21-1974 1:30 PM EST’::TIMESTAMP WITH TIME ZONE -> 1974-12-21 13:30-5:00
INTERVAL
1. Represents a duration of time
2. ‘1 day’::INTERVAL -> 01:00
3. ‘1 D 1 H 1 M 1 S’::INTERVAL -> 01:01:01:01
4. You can add and subtract intervals
5. You can add or subtract intervals from dates
6. (‘DEC-21-1974 1:30 PM EST’::TIMESTAMP WITH TIME ZONE) – (‘1 D’::INTERVAL)
*/