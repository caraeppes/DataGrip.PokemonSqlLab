### Part 3: Joins and Groups

# What is each pokemon's primary type?
SELECT p.name AS Pokemon, t.name AS PrimaryType
FROM types t
JOIN pokemons p ON t.id = p.primary_type;

# What is Rufflet's secondary type?
SELECT p.name AS Pokemon, t.name AS SecondaryType
FROM types t
JOIN pokemons p ON t.id = p.secondary_type
WHERE p.name = 'Rufflet';

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name AS Trainer303sPokemon
FROM pokemons p
JOIN pokemon_trainer pt ON p.id = pt.pokemon_id
WHERE pt.trainerID = 303;

# How many pokemon have a secondary type `Poison`?
SELECT COUNT(p.secondary_type) AS NumberOFPokemonWithSecondaryTypePoison
FROM pokemons p
JOIN types t ON t.id = p.secondary_type
WHERE p.secondary_type = 7;

# What are all the primary types and how many pokemon have that type?
SELECT t.name AS PrimaryType, COUNT(p.primary_type) AS NumberOfPokemon
FROM pokemons p
JOIN types t ON t.id = p.primary_type
GROUP BY t.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have?
SELECT trainerID, COUNT(pokelevel) AS NumberOfLevel100Pokemon
FROM pokemon_trainer
WHERE pokelevel = 100
GROUP BY trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT COUNT(pokemon_id) AS NumberOfPokemonBelongingToOneTrainer
FROM (
     SELECT pokemon_id
  FROM pokemon_trainer
     GROUP BY pokemon_id
  HAVING COUNT(*) = 1) AS PokemonWhoBelongToOneTrainer;
