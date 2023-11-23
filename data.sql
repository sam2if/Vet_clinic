INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, FALSE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', 11, TRUE, 5);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantnom', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', 17, TRUE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', '2022-05-14', 22, TRUE, 4);
insert into owners(full_name, age) values ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
insert into species(name) values ('Pokemon'), ('Digimon');
update animals set species_id = 2 where name like '%mon';
update animals set species_id = 1 where species_id is null;
update animals set owner_id = 1 where name = 'Agumon';
update animals set owner_id = 2 where name = 'Gabumon';
update animals set owner_id = 2 where name = 'Pikachu';
update animals set owner_id = 3 where name = 'Devimon';
update animals set owner_id = 3 where name = 'Plantnom';
update animals set owner_id = 4 where name in ('Charmander', 'Squirtle', 'Blossom');
update animals set owner_id = 5 where name in ('Angemon', 'Boarmon');
insert into vets(name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23'), 
('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');
insert into specialization (vets_id, species_id) values (1, 1), (3, 1), (3, 2), (4, 2);
insert into visits (animals_id, vets_id, date_of_visits) values (1, 1, '2020-05-24'), 
(1, 3, '2020-07-22'), (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), 
(3, 2, '2020-03-08'), (3, 2, '2020-03-14'), (4, 3, '2021-05-04'), 
(5, 4, '2021-02-24'), (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), 
(6, 2, '2021-04-07'), (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), 
(8, 4, '2020-11-04'), (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), 
(9, 2, '2020-02-27'), (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), 
(10, 1, '2021-01-11');
