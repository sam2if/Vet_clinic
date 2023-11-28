CREATE DATABASE vet_clinic;
CREATE TABLE animals (id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, name VARCHAR(50) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, weight_kg DECIMAL(18, 2));
ALTER TABLE animals ADD species VARCHAR(100);
create table owners(id int generated by default as identity primary key, full_name varchar(50) not null, age int not null);
create table species (id int generated by default as identity primary key, name varchar(50));
alter table animals drop column species;
alter table animals add column species_id int;
alter table animals add column species_id int;
alter table animals add constraint fk_animals foreign key (species_id) references species(id);
alter table animals add column owner_id int;
alter table animals add constraint fk_owner foreign key (owner_id) references owners(id);
create table vets (id int generated by default as identity primary key, name varchar(50) not null, age int not null, date_of_graduation date not null);
create table specialization (vets_id int references vets(id), species_id int references species(id), primary key (vets_id, species_id));
create table visits (id int generated by default as identity, animals_id int references animals(id), vets_id int references vets(id), date_of_visits date not null, primary key (id, animals_id, vets_id));

--branch performance audit
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visits) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, age, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;  

CREATE INDEX idx_animal_id ON visits(animal_id);

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4; 

EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
CREATE INDEX idx_vet_id ON visits(vet_id);
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Adding an index to improve the execution time.
CREATE INDEX idx_email ON owners(email);
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
