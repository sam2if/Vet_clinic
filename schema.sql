CREATE DATABASE vet_clinic;
CREATE TABLE animals (id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, name VARCHAR(50) NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, weight_kg DECIMAL(18, 2));