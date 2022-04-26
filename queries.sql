/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* p2 */
/* ROLEBACK UPDATE */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT count(species) FROM animals WHERE species like 'unspecified';
ROLLBACK;
SELECT count(species) FROM animals WHERE species like 'unspecified';:

/* COMMIT */
BEGIN;
SELECT count(name) FROM animals WHERE species IS NULL;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT count(name) FROM animals WHERE species IS NOT NULL;
COMMIT;
SELECT count(name) FROM animals WHERE species IS NOT NULL;

/* ROLEBACK DELETE */
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* SAVEPOINT */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT AfterDeletingPost20220101;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT AfterDeletingPost20220101;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* Answer Questions */
SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT neutered, max(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* p3 */
SELECT name
  FROM animals a
  JOIN owners o
  ON a.owner_id = o.id and o.full_name = 'Melody Pond';

SELECT a.name
  FROM animals a
  JOIN species s
  ON a.species_id = s.id and s.name = 'Pokemon';

SELECT full_name, name
  FROM owners o
  LEFT JOIN animals a
  ON o.id = a.owner_id;

SELECT count(a.name), s.name
  FROM animals a
  JOIN species s
  ON a.species_id = s.id
  GROUP BY s.name;

SELECT a.name
  FROM animals a
  JOIN species s ON s.id = a.species_id AND s.name = 'Digimon'
  JOIN owners o ON a.owner_id = o.id;

SELECT a.name
  FROM animals a
  JOIN owners o
  ON a.owner_id = o.id
  WHERE a.escape_attempts = 0;

SELECT mySearch.full_name FROM (
  SELECT count(name), full_name
    FROM animals a
    LEFT JOIN owners o
    ON a.owner_id = o.id
    GROUP BY full_name
    ORDER BY count(name) DESC
    LIMIT 1
  ) mySearch;

