/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon%';
select name from animals where date_of_birth BETWEEN '20160101' AND '20191231';
select * from animals where neutered = true and escape_attempts  < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

begin;
update animals set species = 'unspecified';
rollback;

begin;
update animals set species = 'digimon' where name like '%mon%';
update animals set species = 'pokemon' where species = '';
COMMIT;

begin;
delete from animals;
rollback; 

begin;
delete from animals where date_of_birth > '20220101';
savepoint sp1;
update animals set weight_kg = weight_kg * -1;
rollback to sp1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts < 1;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered order by sum desc;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where extract(year from date_of_birth) between 1990 and 2000 group by species;