SELECT * FROM animals WHERE name LIKE ('%mon');
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE (weight_kg >= 10.4 AND weight_kg <= 17.3);
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
COMMIT;
SELECT species from animals;
BEGIN;
DELETE FROM animals;
SELECT COUNT(*) FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT name, COUNT(escape_attempts) FROM animals GROUP BY name, escape_attempts HAVING escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT date_of_birth, AVG(escape_attempts) FROM animals GROUP BY date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';
select name, owner_id, owners.id from animals join owners on owners.id = owner_id where owners.id = 4;
select animals.name, species_id, species.id from animals join species on species_id = species.id where species.id = 1;
select name, full_name, owner_id, owners.id from animals right join owners on owner_id = owners.id;
select count(animals.name), species_id, species.id from animals join species on species_id = species.id group by animals.species_id, species.id;
select animals.name, species_id, full_name, owner_id, species.id from animals join species on species.id = species_id join owners on owner_id = species_id where owners.id = 2;
select name, owner_id, owners.id, escape_attempts from animals join owners on owner_id = owners.id where (owners.id = 5 and escape_attempts = 0);
SELECT owners.full_name, COUNT(animals.id) AS num_animals FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.id, owners.full_name ORDER BY num_animals DESC LIMIT 1;