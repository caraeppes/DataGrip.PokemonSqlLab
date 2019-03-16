### Part 2: Simple Selects and Counts
  
# What are all the types of pokemon that a pokemon can have?
SELECT name AS PokemonTypes
FROM types;

# What is the name of the pokemon with id 45?
SELECT name AS Pokemon_45
FROM pokemons
WHERE id = 45;

# How many pokemon are there?
SELECT COUNT(id) AS TotalNumberOfPokemon
FROM pokemons;

# How many types are there?
SELECT COUNT(id) AS NumberOfTypes
FROM types;

# How many pokemon have a secondary type?
SELECT COUNT(id) AS NumberOfPokemonWithSecondaryTypes
FROM pokemons
WHERE secondary_type IS NOT NULL;
