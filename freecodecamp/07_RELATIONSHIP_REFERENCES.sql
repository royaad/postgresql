-- In the CLI run the command
-- \i C:/Users/user/Desktop/MOOCs/PostgreSQL/data/employee-vehicle.sql
-- link employee with car
UPDATE employee SET car_id = 1 WHERE id = 2;
UPDATE employee SET car_id = 2 WHERE id = 4;
UPDATE employee SET car_id = 3 WHERE id = 5;
UPDATE employee SET car_id = 6 WHERE id = 10;
UPDATE employee SET car_id = 7 WHERE id = 9;
-- Explore employee TABLE
SELECT id, first_name, last_name, car_id FROM employee ORDER BY id;
-- INNER JOIN
-- Returns only employee having a vehicle
SELECT * FROM employee
JOIN vehicle ON employee.car_id = vehicle.id; -- We can equally use INNER JOIN
-- LEFT JOIN
-- Returns all employees even those having no vehicles
SELECT * FROM employee
LEFT JOIN vehicle ON employee.car_id = vehicle.id;
-- Explore employees that don't have a vehicle
SELECT * FROM employee
LEFT JOIN vehicle ON employee.car_id = vehicle.id
WHERE car_id IS NULL;
-- RIGHT JOIN
-- Returns all vehicles even those not owned by an employee
SELECT * FROM employee
RIGHT JOIN vehicle ON employee.car_id = vehicle.id;
-- We cannot delete a reference from its original table if it is still referenced in another table.