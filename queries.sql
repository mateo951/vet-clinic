/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon%';
select name from animals where date_of_birth BETWEEN '20160101' AND '20191231';
select * from animals where neutered = true and escape_attempts  < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;