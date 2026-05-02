Celestial Bodies Database
A PostgreSQL database project built for the freeCodeCamp Relational Database Certification.

Project Overview
This project demonstrates the design and implementation of a relational database that catalogs celestial bodies in our universe. The database includes galaxies, stars, planets, moons, and black holes with proper relationships, constraints, and sample data.

Database Schema
Tables
Table	Description	Rows
galaxy	Galaxies in the universe	6
star	Stars within galaxies	6
planet	Planets orbiting stars	12
moon	Moons orbiting planets	20
black_hole	Black holes in galaxies	3
Relationships
galaxy (1) ───< star (many) star (1) ───< planet (many) planet (1) ───< moon (many) galaxy (1) ───< black_hole (many)

Entity Details
galaxy
galaxy_id - Primary key (SERIAL)
name - Galaxy name (VARCHAR, NOT NULL, UNIQUE)
distance_from_earth - Distance in light-years (NUMERIC)
description - Brief description (TEXT)
has_life - Whether life is known to exist (BOOLEAN)
age_in_millions_of_years - Age of the galaxy (INT, NOT NULL)
is_spherical - Shape classification (BOOLEAN)
star
star_id - Primary key (SERIAL)
name - Star name (VARCHAR, NOT NULL, UNIQUE)
galaxy_id - Foreign key referencing galaxy (INT, NOT NULL)
mass - Mass in solar masses (INT)
temperature - Surface temperature in Kelvin (INT)
is_spherical - Shape (BOOLEAN)
has_life - Whether life exists (BOOLEAN)
planet
planet_id - Primary key (SERIAL)
name - Planet name (VARCHAR, NOT NULL, UNIQUE)
star_id - Foreign key referencing star (INT, NOT NULL)
distance_from_star - Orbital distance in AU (NUMERIC)
planet_type - Classification (VARCHAR)
has_life - Whether life exists (BOOLEAN)
is_spherical - Shape (BOOLEAN)
age_in_millions_of_years - Age (INT)
moon
moon_id - Primary key (SERIAL)
name - Moon name (VARCHAR, NOT NULL, UNIQUE)
planet_id - Foreign key referencing planet (INT, NOT NULL)
distance_from_planet - Orbital distance in km (NUMERIC)
is_spherical - Shape (BOOLEAN)
has_life - Whether life exists (BOOLEAN)
age_in_millions_of_years - Age (INT)
black_hole
black_hole_id - Primary key (SERIAL)
name - Black hole name (VARCHAR, NOT NULL, UNIQUE)
galaxy_id - Foreign key referencing galaxy (INT)
mass - Mass in solar masses (BIGINT, NOT NULL)
is_supermassive - Classification (BOOLEAN)
description - Brief description (TEXT)
Data Types Used
Type	Usage
SERIAL	Auto-incrementing primary keys
INT	Numeric values (age, temperature, mass for stars/planets)
BIGINT	Large numeric values (black hole masses)
NUMERIC	Precise decimal values (distances)
VARCHAR	Text with length limits (names, types)
TEXT	Unrestricted text (descriptions)
BOOLEAN	True/False flags (has_life, is_spherical)
Constraints
Primary Keys: Each table has a SERIAL PRIMARY KEY named [table_name]_id
Foreign Keys: Established relationships between tables
NOT NULL: Required fields on primary keys, names, and foreign keys
UNIQUE: Name columns are unique across all tables
DEFAULT: Boolean fields default to false where applicable
How to Use
Restore the Database
```bash

Create the database
psql -U postgres -c "CREATE DATABASE universe;"

Restore from dump
psql -U postgres -d universe < universe.sql ```

Query Examples
```sql -- List all planets with their stars and galaxies SELECT p.name AS planet, s.name AS star, g.name AS galaxy FROM planet p JOIN star s ON p.star_id = s.star_id JOIN galaxy g ON s.galaxy_id = g.galaxy_id;

-- Count moons per planet SELECT p.name AS planet, COUNT(m.moon_id) AS moon_count FROM planet p LEFT JOIN moon m ON p.planet_id = m.planet_id GROUP BY p.name ORDER BY moon_count DESC;

-- Find supermassive black holes SELECT name, mass, description FROM black_hole WHERE is_supermassive = true; ```

Project Requirements Met
✅ Database named universe
✅ At least 5 tables
✅ Each table has primary key named [table_name]_id
✅ Each table has a name column (VARCHAR)
✅ INT used in at least 2 columns per table
✅ NUMERIC used at least once
✅ TEXT used at least once
✅ BOOLEAN used in at least 2 columns
✅ Foreign keys linking related tables
✅ Minimum row counts: galaxy (6), star (6), planet (12), moon (20)
✅ NOT NULL constraints on required fields
✅ UNIQUE constraint on name columns

Technologies
PostgreSQL 12+
psql command-line tool
pg_dump for database export
Certification
This project is part of the freeCodeCamp Relational Database Certification.

Author
Built as a required project for freeCodeCamp certification.

License
This project is open source and available for educational purposes.
