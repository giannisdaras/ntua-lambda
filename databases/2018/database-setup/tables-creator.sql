use ntua_db;

create table employee (irs integer not null primary key, lastname varchar(25) not null,
	ssn integer not null, firstname varchar(25) not null,street varchar(25), num integer, postal_code integer, city
	varchar(25));

create table hotel_group (hotel_group_id integer not null auto_increment primary key,name varchar(25) not null,
	number_of_hotels integer not null,street varchar(25), num integer, postal_code integer, city
	varchar(25)); 

create table hotel_group_emails (hotel_group_id integer not null,email varchar(45) not null,
	primary key (hotel_group_id,email),foreign key (hotel_group_id) references hotel_group(hotel_group_id) on delete cascade);

create table hotel_group_phones (hotel_group_id integer, phone bigint not null, primary key (hotel_group_id,phone), foreign key (hotel_group_id) references hotel_group(hotel_group_id) on delete cascade);


create table hotel (hotel_id integer not null auto_increment primary key,name varchar(25), 
	stars integer not null, number_of_rooms integer not null,
	hotel_group_id integer not null,street varchar(25), num integer, postal_code integer, city
	varchar(25), foreign key (hotel_group_id) references hotel_group(hotel_group_id) on delete cascade);

create table hotel_phones (hotel_id integer not null, phone bigint not null,
	primary key (hotel_id,phone), foreign key (hotel_id) references hotel(hotel_id) on delete cascade);

create table hotel_emails (hotel_id integer not null, email
	varchar(45) not null, primary key (hotel_id,email), foreign key (hotel_id) references hotel(hotel_id) on delete cascade);

create table works (irs integer not null,hotel_id 
	integer not null, start_date date not null, position varchar(25) not null,
	finish_date date, primary key (irs,hotel_id),foreign key (irs) references employee(irs) on delete cascade, foreign key (hotel_id) references hotel(hotel_id) on delete cascade);

create table customer(irs integer not null primary key,first_name varchar(25) not null,
	last_name varchar(25) not null, ssn integer not null, first_registration date not null, 
	street varchar(25), num integer, postal_code integer, city
	varchar(25));

create table amenities(amenity_id integer not null auto_increment primary key,
	amenity varchar(25) not null);


create table hotel_room (room_id integer not null auto_increment, hotel_id integer not null,price float not null, repairs_needed integer not null, expandable 
	integer not null, view integer not null, capacity integer not null,primary key (room_id, hotel_id),
	foreign key (hotel_id) references hotel(hotel_id) on delete cascade);


create table hotel_room_amenities(amenity_id integer not null,
	room_id integer not null,primary key(amenity_id,room_id),foreign key (amenity_id) references amenities(amenity_id) on delete cascade, foreign key (room_id) references hotel_room(room_id) on delete cascade);

create table reserves (reserve_id integer not null auto_increment primary key,
	irs integer not null, room_id integer not null, hotel_id integer not null, 
	start_date date not null, finish_date date not null, paid integer not null
	,foreign key (irs) references customer(irs) on delete cascade, foreign key (room_id) references hotel_room(room_id) on delete cascade
	,foreign key (hotel_id) references hotel(hotel_id) on delete cascade);

create table rents (rent_id integer not null auto_increment primary key,
	irs_employee integer not null,
	irs_customer integer not null,
	hotel_id integer not null, room_id integer not null,payment_amount float not null, payment_method varchar(25),start_date date not null,finish_date date not null,
	foreign key (irs_employee) references employee(irs) on delete cascade, foreign key (irs_customer) references customer(irs) on delete cascade,
	foreign key (hotel_id) references hotel(hotel_id) on delete cascade, foreign key (room_id) references hotel_room(room_id) on delete cascade);

create table booking_history (booking_id integer auto_increment primary key,
	irs_customer integer not null,
	irs_employee integer not null,room_id integer not null,hotel_id integer not null,hotel_group_id integer not null,start_date date not null,finish_date date not null,
	payment_method varchar(25) not null);

create table works_history(works_id integer auto_increment primary key,irs_employee integer not null,hotel_id integer not null,hotel_group_id integer not null,
position varchar(25) not null,start_date date not null,finish_date date not null);
