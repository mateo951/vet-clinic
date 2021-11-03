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

-- alter table vetclinic.animals add column species varchar(45);