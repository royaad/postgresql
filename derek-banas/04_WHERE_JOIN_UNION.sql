-- CONCAT merges columns
SELECT CONCAT(first_name,  ' ', last_name) AS Name, phone, state
FROM customer
WHERE state = 'TX';
-- We can use logical operations on DATE and TIMESTAMP
SELECT time_order_taken
FROM sales_order
WHERE time_order_taken > '2018-12-01' AND time_order_taken < '2018-12-31';
-- To enhance readability and streamline the code, consider using BETWEEN and AND instead of WHERE and AND.
SELECT time_order_taken
FROM sales_order
WHERE time_order_taken BETWEEN '2018-12-01' AND '2018-12-31';
-- We can define multiple JOIN conditions with logical operators 
SELECT item_id, price
FROM item JOIN sales_item -- INNER JOIN is also equivalent
ON item.id = sales_item.item_id AND price > 120.00
ORDER BY item_id;
-- We can join 3 tables. Get the orders, quantity and the total sale.
SELECT sales_order.id, sales_item.quantity, item.price, 
(sales_item.quantity * item.price) AS Total
FROM sales_order
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
ORDER BY sales_order.id;
/* CROSS JOIN
For every possible combination of rows from T1 and T2 (i.e., a Cartesian product),
the joined table will contain a row consisting of all columns in T1 followed by all columns in T2.
If the tables have N and M rows respectively, the joined table will have N * M rows.
*/
SELECT sales_order_id, quantity, product_id
FROM item CROSS JOIN sales_item
ORDER BY sales_order_id;
-- UNION effectively appends the result of query2 to the result of query1.
-- query1 returns 2 rows
SELECT first_name, last_name, street, city, zip, birth_date
FROM customer
WHERE EXTRACT(MONTH FROM birth_date) = 12
UNION
-- query2 returns 1 row
SELECT first_name, last_name, street, city, zip, birth_date
FROM sales_person
WHERE EXTRACT(MONTH FROM birth_date) = 12
ORDER BY birth_date;
-- UNION returns 3 rows. N.B. # of columns must match.