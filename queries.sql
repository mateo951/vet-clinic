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

-- Foreign Keys queries

alter table animals drop column species;
alter table animals add species_id int, add constraint fk foreign key (species_id) references species(id);
alter table animals add owner_id int, add constraint fk_owners foreign key (owner_id) references owner(owner_id);

update animals set species_id = (select id from species where name like 'Digimon') where name like '%mon%';
update animals set species_id = (select id from species where name like 'Pokemon') where name not like '%mon';

update animals set owner_id = (select owner_id from owners where full_name = 'Sam Smith') where name like '%Agumon%';
update animals set owner_id = (select owner_id from owners where full_name = 'Jennifer Orwell') where name like '%Gabumon%' or name like '%Pikachu%';
update animals set owner_id = (select owner_id from owners where full_name = 'Bob') where name like '%Devimon%' or name like '%Plantmon%';
update animals set owner_id = (select owner_id from owners where full_name = 'Melody Pond') where name like '%Charmander%' or name like '%Squirtle%' or name like '%Blossom%';
update animals set owner_id = (select owner_id from owners where full_name = 'Dean Winchester') where name like '%Angemon%' or name like '%Boarmon%';

select count(animals.owner_id) from animals inner join owners on animals.owner_id = owners.owner_id where owners.full_name like 'Melody Pond';
select * from animals inner join species on animals.species_id = species.id where species.name like 'Pokemon';
select owners.full_name, animals.name from animals right join owners on animals.owner_id = owners.owner_id;
select species.name, count(species.id) from animals inner join species on animals.species_id = species.id group by species.name;
select animals.name, species_id from animals inner join owners on animals.owner_id = owners.owner_id inner join species on animals.species_id = species.id where owners.full_name like '%Jennifer Orwell%' and species.name like 'Digimon';
select owners.full_name, animals.name from owners inner join animals on owners.owner_id = animals.owner_id inner join species on species.id = animals.species_id where owners.full_name like '%Dean Winchester%' and animals.escape_attempts = 0;
select owners.full_name, count(*) from owners join animals on owners.owner_id = animals.owner_id group by owners.full_name having count(*) > 2;