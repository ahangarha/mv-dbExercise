/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', 'February 3, 2020', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', 'November 15, 2018', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', 'January 7, 2021', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', 'May 12, 2017', 11, true, 5);

/* p2 - update */
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', 'February 8, 2020', -11, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', 'November 15, 2021', -5.7, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', 'April 2, 1993', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', 'June 12, 2005', -45, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', 'June 7, 2005', 0.4, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', 'October 13, 1998', 17, true, 9);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', 'May 14, 2022', 22, true, 4);

/* p3 */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon';

/* P4 join table */
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('William Tatcher', 45, 'April 23, 2000');
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('Maisy Smith', 26, 'January 17, 2019');
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('Jack Harkness', 38, 'June 8, 2008');

INSERT INTO specializations
  (specie_id, vet_id) VALUES (1, 1);
INSERT INTO specializations
  (specie_id, vet_id) VALUES (1, 3);
INSERT INTO specializations
  (specie_id, vet_id) VALUES (2, 3);
INSERT INTO specializations
  (specie_id, vet_id) VALUES (2, 4);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (1, 1, 'May 24, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (1, 3, 'July 22, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (2, 4, 'February 2, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (3, 2, 'January 5, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (3, 2, 'March 8, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (3, 2, 'May 14, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (4, 3, 'May 4, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (5, 4, 'February 24, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (6, 2, 'December 21, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (6, 1, 'August 10, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (6, 2, 'April 7, 2021');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (7, 3, 'September 29, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (8, 4, 'October 3, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (8, 4, 'November 4, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (9, 2, 'January 24, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (9, 2, 'May 15, 2019');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (9, 2, 'February 27, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (9, 2, 'August 3, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (10, 3, 'May 24, 2020');
INSERT INTO visits (animal_id, vet_id, date_of_visit)
  VALUES (10, 1, 'January 11, 2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
