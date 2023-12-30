-- CREATE TABLE vehicle
-- TABLE vehicle should be created before TABLE employee,
-- since TABLE employee REFERENCES vehicle(id)
create table vehicle (
	id BIGSERIAL  NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	price NUMERIC(19,2) NOT NULL
);
-- CREATE TABLE employee
create table employee (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	gender VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	country VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES vehicle(id),
    UNIQUE(car_id)
);
-- INSERT 10 employees
insert into employee (first_name, last_name, email, gender, dob, country) values ('Javier', 'Reichardt', null, 'Male', '2023-07-02', 'Ukraine');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Dalila', 'Frances', 'dfrances1@ucsd.edu', 'Genderfluid', '2023-11-21', 'Uganda');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Roanne', 'Hutfield', null, 'Female', '2023-07-27', 'Poland');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Fabiano', 'Craigie', null, 'Male', '2023-07-20', 'China');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Yvonne', 'Overnell', 'yovernell4@aol.com', 'Female', '2023-09-13', 'Poland');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Shirlene', 'Riolfo', 'sriolfo5@booking.com', 'Female', '2023-04-07', 'Cuba');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Terese', 'Clulee', null, 'Female', '2023-05-11', 'China');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Asher', 'Barnes', 'abarnes7@howstuffworks.com', 'Male', '2023-10-20', 'China');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Tallie', 'Leynton', null, 'Male', '2023-10-07', 'Myanmar');
insert into employee (first_name, last_name, email, gender, dob, country) values ('Lorain', 'Gradly', 'lgradly9@acquirethisname.com', 'Female', '2023-01-10', 'Azerbaijan');
-- INSERT 7 vehicles
insert into vehicle (id, make, model, price) values (1, 'Pontiac', 'Grand Am', 81021.39);
insert into vehicle (id, make, model, price) values (2, 'Suzuki', 'Forenza', 86423.76);
insert into vehicle (id, make, model, price) values (3, 'Mercedes-Benz', 'C-Class', 65165.57);
insert into vehicle (id, make, model, price) values (4, 'Mazda', 'RX-7', 71660.33);
insert into vehicle (id, make, model, price) values (5, 'Honda', 'Civic', 98556.47);
insert into vehicle (id, make, model, price) values (6, 'Chevrolet', 'Corvette', 13785.01);
insert into vehicle (id, make, model, price) values (7, 'Infiniti', 'QX56', 26809.07);