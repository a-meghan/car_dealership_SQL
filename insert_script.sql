insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone_num
) values (
	1,
	'Odette',
	'Karev',
	'188 Coding Temple drive, atlanta, GA 39087',
	'678-901-2345'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone_num
) values (
	2,
	'Ophie',
	'James',
	'188 Coding Temple drive, atlanta, GA 39087',
	'678-987-6543'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone_num
) values (
	3,
	'Rose',
	'Windle',
	'143 Schoolhouse rd, atlanta, GA 39087',
	'689-098-0987'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	phone_num
) values (
	4,
	'Randall',
	'Dimka',
	'275 Schoolhouse rd, atlanta, GA 39087',
	'689-012-3456'
);

insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) values (
	1,
	'Peter',
	'Franco'
);

insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) values (
	2,
	'Polly',
	'Pocket'
);

insert into mechanic(
	mech_id,
	first_name,
	last_name
) values (
	1,
	'Wally',
	'Pickle'
);

insert into mechanic(
	mech_id,
	first_name,
	last_name
) values (
	2,
	'Billy',
	'Bagpipe'
);

insert into cars(
	serial_num,
	make,
	model,
	car_year,
	car_color,
	new_or_used
) values (
	12345,
	'Honda',
	'Accord',
	'2005',
	'Gold',
	'Used'
);

insert into cars(
	serial_num,
	make,
	model,
	car_year,
	car_color,
	new_or_used
) values (
	54321,
	'Toyota',
	'Camry',
	'2022',
	'Black',
	'New'
);

insert into cars(
	serial_num,
	make,
	model,
	car_year,
	car_color,
	new_or_used
) values (
	87659,
	'Jeep',
	'Cherokee',
	'2023',
	'Pink',
	'New'
);

insert into cars(
	serial_num,
	make,
	model,
	car_year,
	car_color,
	new_or_used
) values (
	12309,
	'Honda',
	'Civic',
	'2014',
	'White',
	'Used'
);

insert into parts(
	part_id,
	part_name,
	part_in_stock
) values (
	1,
	'Power steering fluid',
	True
);

insert into parts(
	part_id,
	part_name,
	part_in_stock
) values (
	2,
	'Brakes',
	True
);

insert into parts(
	part_id,
	part_name,
	part_in_stock
) values (
	3,
	'Blinker fluid',
	False
);

insert into invoice(
	invoice_id,
	customer_id,
	serial_num,
	salesperson_id,
	mech_id
) values (
	1,
	1,
	12309,
	1,
	2,
	1
);

alter table invoice
drop column part_id;

insert into service_ticket(
	service_id,
	customer_id,
	mech_id,
	part_id,
	other_services
) values (
	1,
	2,
	1,
	null,
	'Oil change'
);

insert into invoice(
	invoice_id,
	customer_id,
	serial_num,
	salesperson_id,
	mech_id
) values (
	2,
	2,
	87659,
	2,
	2
);

insert into service_ticket(
	service_id,
	customer_id,
	mech_id,
	part_id,
	other_services
) values (
	2,
	3,
	1,
	2,
	NULL
);

create or replace function add_parts(_part_id INT, _part_name VARCHAR, _part_in_stock BOOL)
returns void
as $MAIN$
begin
	insert into parts(part_id,part_name,part_in_stock)
	values(_part_id,_part_name,_part_in_stock);
end;
$MAIN$
language plpgsql;

select add_parts(4, 'Headlights', true);

select part_id, part_name
from parts
where part_id = 4;

create or replace function add_service_ticket(_service_id INT, _customer_id INT, _mech_id INT, _part_id INT, _other_services VARCHAR)
returns void
as $MAIN$
begin
	insert into service_ticket(service_id,customer_id,mech_id,part_id,other_services)
	values(_service_id,_customer_id,_mech_id,_part_id,_other_services);
end;
$MAIN$
language plpgsql;

select add_service_ticket(3, 4, 1, 2, null);

select * from service_ticket
where service_id = 3