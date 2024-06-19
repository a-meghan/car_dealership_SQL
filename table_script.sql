create table customer (
	customer_id serial primary key,
	first_name varchar(25),
	last_name varchar(25),
	address varchar(255),
	phone_num varchar(25)
);

create table salesperson (
	salesperson_id serial primary key,
	first_name varchar(25),
	last_name varchar(25)
);

create table mechanic (
	mech_id serial primary key,
	first_name varchar(25),
	last_name varchar(50)
);

create table cars (
	serial_num serial primary key,
	make varchar(50),
	model varchar(50),
	car_year varchar(10),
	car_color varchar(15),
	new_or_used varchar(5)
);

create table parts (
	part_id serial primary key,
	part_name varchar(50),
	part_in_stock bool
);

create table invoice (
	invoice_id serial primary key,
	customer_id int references customer(customer_id),
	serial_num int references cars(serial_num),
	salesperson_id int references salesperson(salesperson_id),
	part_id int references parts(part_id),
	mech_id int references mechanic(mech_id)
);

create table service_ticket (
	service_id serial primary key,
	customer_id int references customer(customer_id),
	mech_id int references mechanic(mech_id),
	part_id int references parts(part_id),
	other_services varchar(200)
);