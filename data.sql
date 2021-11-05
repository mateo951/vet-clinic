/* Populate database with sample data. */

insert into animals values (default, 'Agumon', '20200206', 1, true, 14.23);
insert into animals values (default, 'Gabumon', '20181115', 2, true, 8.00);
insert into animals values (default, 'Pikachu', '20210107', 1, false, 15.04);
insert into animals values (default, 'Devimon', '20170512', 5, true, 11.00);
insert into animals values (default, 'Charmander', '20200208', 0, false, -11.00);
insert into animals values (default, 'Plantmon', '20221115', 2, true, -5.7);
insert into animals values (default, 'Squirtle', '19930402', 3, false, -12.13);
insert into animals values (default, 'Angemon', '20050612', 1, true, -45);
insert into animals values (default, 'Boarmon', '20050607', 7, true, 20.4);
insert into animals values (default, 'Blossom', '19981013', 3, true, 17);

-- Owners data insertions

insert into owners values (default, 'Sam Smith', 34);
insert into owners values (default, 'Jennifer Orwell', 19);
insert into owners values (default, 'Bob', 45);
insert into owners values (default, 'Melody Pond', 77);
insert into owners values (default, 'Dean Winchester', 14);
insert into owners values (default, 'Jodie Whittaker', 38);

-- Species data insertions

insert into species values(default, 'Pokemon');
insert into species values(default, 'Digimon');

-- Vets data

insert into vets values(default, 'William Tatcher', 45, '20000423');
insert into vets values(default, 'Maisy Smith', 26, '20190117');
insert into vets values(default, 'Stephanie Mendez', 64, '19810504');
insert into vets values(default, 'Jack Harkness', 38, '20080108');

insert into specializations values (default, (select id from species where name = 'Pokemon'), (select id from vets where name = 'William Tatcher'));
insert into specializations values (default, (select id from species where name = 'Pokemon'), (select id from vets where name = 'Stephanie Mendez'));
insert into specializations values (default, (select id from species where name = 'Digimon'), (select id from vets where name = 'Stephanie Mendez'));
insert into specializations values (default, (select id from species where name = 'Digimon'), (select id from vets where name = 'Jack Harkness'));

insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Agumon'), (select id from vetclinic.vets where name = 'William Tatcher'), '20200524');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Agumon'), (select id from vetclinic.vets where name = 'Stephanie Mendez'), '20200722');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Gabumon'), (select id from vetclinic.vets where name = 'Jack Harkness'), '20210202');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Pikachu'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20200605');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Pikachu'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20200308');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Pikachu'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20200514');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Devimon'), (select id from vetclinic.vets where name = 'Stephanie Mendez'), '20210504');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Charmander'), (select id from vetclinic.vets where name = 'Jack Harkness'), '20210224');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Plantmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20191221');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Plantmon'), (select id from vetclinic.vets where name = 'William Tatcher'), '20200810');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Plantmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20210407');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Squirtle'), (select id from vetclinic.vets where name = 'Stephanie Mendez'), '20190929');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Angemon'), (select id from vetclinic.vets where name = 'Jack Harkness'), '20201003');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Angemon'), (select id from vetclinic.vets where name = 'Jack Harkness'), '20201104');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Boarmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20190124');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Boarmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20190515');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Boarmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20200227');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Boarmon'), (select id from vetclinic.vets where name = 'Maisy Smith'), '20200803');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Blossom'), (select id from vetclinic.vets where name = 'Stephanie Mendez'), '20200524');
insert into vetclinic.visits values(default, (select id from vetclinic.animals where name = 'Blossom'), (select id from vetclinic.vets where name = 'William Tatcher'), '20210111');
