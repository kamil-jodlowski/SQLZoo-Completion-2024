
# Module 5: Basics - SUM and COUNT

## Query 1: Show the total population of the world.

```sql
SELECT SUM(population) AS TotalPopulation
FROM world;
This query calculates the total population of all countries in the world.

Query 2: List all the continents - just once each.

SELECT DISTINCT continent
FROM world;
This query retrieves a list of all continents without repeating any.

Query 3: Give the total GDP of Africa.

SELECT SUM(gdp) AS TotalGDP
FROM world
WHERE continent = 'Africa';
This query calculates the total GDP of all countries in Africa.

Query 4: How many countries have an area of at least 1,000,000 square kilometers.

SELECT COUNT(name) AS NumCountries
FROM world
WHERE area >= 1000000;
This query counts the number of countries with an area of at least 1,000,000 square kilometers.

Query 5: What is the total population of 'Estonia', 'Latvia', and 'Lithuania'.

SELECT SUM(population) AS TotalPopulation
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
This query calculates the total population of Estonia, Latvia, and Lithuania combined.

Query 6: For each continent show the continent and number of countries.

SELECT continent, COUNT(name) AS NumCountries
FROM world
GROUP BY continent;
This query lists each continent along with the number of countries it contains.

Query 7: For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name) AS NumCountries
FROM world
WHERE population >= 10000000
GROUP BY continent;
This query shows each continent along with the number of countries within it that have populations of at least 10 million.

Query 8: List the continents that have a total population of at least 100 million.

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
This query lists the continents that have a total population of at least 100 million

### Summary
1. **Query 1-8** retrieves various aggregated information from the `world` dataset, including total population, continent details, GDP calculations, and country counts based on different criteria. Each query provides insights into global and continental statistics using SQL aggregation functions and grouping techniques.
