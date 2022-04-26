/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(100)
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

/* p2 */
ALTER TABLE animals ADD species varchar;

/* p3 */
CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR,
  age INT,
  PRIMARY KEY (id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR,
  PRIMARY KEY (id)
);

ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
