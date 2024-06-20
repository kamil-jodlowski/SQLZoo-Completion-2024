# Module 1: Basics

## Query 1: The example uses a WHERE clause to show the population of 'France'. 
Note that strings should be in 'single quotes'. Modify it to show the population of Germany.

```sql
SELECT population
FROM world
WHERE name = 'Germany';
This query retrieves the population of Germany. The WHERE clause is used to filter the results to only include rows where the name column matches 'Germany'.

Query 2: Checking a list. The word IN allows us to check if an item is in a list.

The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
This query retrieves the names and populations of Sweden, Norway, and Denmark. The IN clause is used to filter the results to only include rows where the name column matches any of the specified countries.

Query 3: Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).

The example below shows countries with an area of 250,000-300,000 sq. km.
Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;
This query retrieves the names and areas of countries that have an area between 200,000 and 250,000 square kilometers. The BETWEEN operator is used to filter the results to only include rows where the area column falls within the specified range.

### Summary
1. **Query 1** uses a simple `WHERE` clause to filter results based on the country name.
2. **Query 2** uses the `IN` operator to filter results for multiple country names.
3. **Query 3** uses the `BETWEEN` operator to filter results based on a range of values for the area.





