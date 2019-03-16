### Part 4: Final Report

# PART 4
# Write a query that returns the following columns:
#
# | Pokemon Name | Trainer Name | Level | Primary Type | Secondary Type |
# |:------------:|:------------:|:-----:|:------------:|:--------------:|
# | Pokemon's name| Trainer's name| Current Level| Primary Type Name| Secondary Type Name|

SELECT p.name AS PokemonName, t.trainername AS TrainerName,
       pt.pokelevel AS Level, primaryType.name AS PrimaryType,
       secondaryType.name AS SecondaryType
FROM pokemons p
JOIN pokemon_trainer pt ON p.id = pt.pokemon_id
JOIN trainers t ON t.trainerID = pt.trainerID
JOIN types primaryType ON p.primary_type = primaryType.id
JOIN types secondaryType ON p.secondary_type = secondaryType.id


# Sort the data by finding out which trainer has the strongest pokemon so that this
  # will act as a ranking of strongest to weakest trainer. You may interpret
  # strongest in whatever way you want, but you will have to explain your decision.

SELECT pt.trainerID, t.trainername, (SUM(pt.hp) + SUM(pt.maxhp) + SUM(pt.attack) + SUM(pt.defense) +
        SUM(pt.spatk) + SUM(pt.spdef) + SUM(pt.speed) + SUM(pt.pokelevel)) AS TotalStats
FROM pokemon_trainer pt
JOIN trainers t ON pt.trainerID = t.trainerID
GROUP BY pt.trainerID
ORDER BY TotalStats DESC;

# This defines the strongest trainer as the trainer with the highest total stats.
# Total stats for each Pokemon are calculated by getting the sum of its hp, maxhp,
# attack, defense, spatk, spdef, speed, and pokelevel.  The trainer's total stats
# is the sum of all of their Pokemon's total stats.