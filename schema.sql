/* Database schema to keep the structure of entire database. */

create table animals (
  id serial,name varchar(45),
  date_of_birth date,
  escape_attemts integer,
  neutered boolean,
  weight_kg decimal(10,4),
  user_name varchar (45),
  timestamp timestamp,
  primary key (id)
);
