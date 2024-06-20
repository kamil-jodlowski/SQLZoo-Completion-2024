# Module 4: SELECT in SELECT

## Query 1: List each country name where the population is larger than that of 'Russia'.

```sql
SELECT name 
FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia');
This query retrieves the names of countries whose population is larger than that of Russia.

Query 2: Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom');
This query retrieves the names of countries in Europe with a per capita GDP greater than that of the United Kingdom.

Query 3: List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent 
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;
This query retrieves the names and continents of countries in the same continents as Argentina or Australia, ordered by country name.

Query 4: Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') 
AND population < (SELECT population FROM world WHERE name = 'Germany');
This query retrieves the names and populations of countries with populations greater than the United Kingdom but less than Germany.

Query 5: Show the name and the population of each country in Europe as a percentage of the population of Germany.

SELECT name, CONCAT(ROUND((population / (SELECT population FROM world WHERE name = 'Germany')) * 100, 0), '%') AS percentage
FROM world
WHERE continent = 'Europe';
This query calculates and displays the population of each country in Europe as a percentage of the population of Germany.

Query 6: Which countries have a GDP greater than every country in Europe? [Give the name only.]

SELECT name
FROM world 
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);
This query retrieves the names of countries with a GDP greater than every country in Europe.

Query 7: Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area 
FROM world x
WHERE area >= ALL(SELECT area
                  FROM world y
                  WHERE y.continent = x.continent AND population > 0);
This query finds the largest country (by area) in each continent and displays the continent, country name, and area.

Query 8: List each continent and the name of the country that comes first alphabetically.

SELECT continent, name 
FROM world x 
WHERE name = (SELECT MIN(name)
              FROM world y
              WHERE x.continent = y.continent);
This query lists each continent along with the name of the country that comes first alphabetically.

Query 9: Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population
FROM world x 
WHERE continent IN (SELECT continent
                    FROM world
                    GROUP BY continent
                    HAVING MAX(population) <= 25000000);
This query finds the names of countries in continents where all countries have a population less than or equal to 25,000,000.

Query 10: Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.

SELECT x.name, x.continent
FROM world x
WHERE x.population > ALL(SELECT y.population * 3
                         FROM world y
                         WHERE y.continent = x.continent AND y.name != x.name);
This query identifies countries whose population is more than three times the population of all their neighbors in the same continent.


### Summary
1. **Query 1-10** retrieves various details from the `world` dataset based on specified criteria. Each query is designed to extract specific information about countries and continents, demonstrating different aspects of SQL querying and data retrieval.
