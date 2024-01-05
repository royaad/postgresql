-- Views are select statements thats result is stored in your database. 
CREATE VIEW purchase_order_overview AS -- We can equally use `CREATE OR REPLACE`
SELECT sales_order.purchase_order_number, customer.company, 
sales_item.quantity, product.supplier, product.name, item.price, 
-- Can’t use total if you want this to be updated Fix Below
(sales_item.quantity * item.price) AS Total,
-- Remove concat if you want this to be updatable 
CONCAT(sales_person.first_name, ' ', sales_person.last_name) AS Salesperson
FROM sales_order
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
JOIN customer
ON sales_order.cust_id = customer.id
JOIN product
ON product.id = item.product_id
JOIN sales_person
ON sales_person.id = sales_order.sales_person_id
ORDER BY purchase_order_number;

-- When data in the database is updated so is the view.
-- Views can be used the same ways as a regular table.
-- https://www.commandprompt.com/education/postgresql-alter-view-statement-with-examples/
-- If you want it to be updatable though it can’t include DISTINCT, UNION, Aggregate Functions, GROUP BY or HAVING.
SELECT * FROM purchase_order_overview;

-- Make Total Updatable
-- We cannot use ALTER VIEW to DROP COLUMN
-- Instead, we need to CREATE a new VIEW
-- To make Total updatable, we can just calculate Total when calling the view
SELECT *, (quantity * price) AS Total
FROM purchase_order_overview;
-- DROP VIEW
DROP VIEW purchase_order_overview;