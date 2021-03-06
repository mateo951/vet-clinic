/* Database schema to keep the structure of entire database. */

create table animals (
	id serial,
	name varchar(45),
	date_of_birth date,
	escape_attempts integer,
	neutered boolean,
  	weight_kg decimal(10,4),
  	species varchar(45),
	PRIMARY KEY(id)
);

create table owners (
	owner_id int generated by default as identity,
	full_name varchar(45),
	age int, 
	primary key(owner_id)
);

create table species (
	id int generated by default as identity,
	name varchar(45),
	primary key(id)
);

create table vets (
	id int generated by default as identity,
	name varchar(45),
	age int,
	date_of_gradutaion date,
	primary key(id)
);

-- Joining Tables

create table specializations(
	id serial, 
	specie_id int references species(id),
	vet_id int references vets(id),
	primary key(id)
);

create table visits (
	id serial, 
	animal_id int references animals(id),
	vet_id int references vets(id),
	date_of_visit date, 
	primary key (id)
); 