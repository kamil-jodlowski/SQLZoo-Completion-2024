/* Query 1: Show the total population of the world.
world(name, continent, area, population, gdp) */

SELECT SUM(population)
FROM world


/* Query 2: List all the continents - just once each..*/

SELECT DISTINCT(continent)
FROM world;

/* Query 3: Give the total GDP of Africa*/
  
SELECT SUM(gdp) AS SUMGDP
FROM world
WHERE continent = 'Africa'

/* Query 4: How many countries have an area of at least 1000000*/
  
SELECT COUNT(name) 
FROM world 
WHERE area > 1000000

/* Query 5: What is the total population of ('Estonia', 'Latvia', 'Lithuania') */
  
SELECT SUM(population) AS PPLSUM
FROM world 
WHERE name IN ('Estonia' , 'Latvia' , 'Lithuania');

/* Query 6: For each continent show the continent and number of countries. */
  
SELECT continent , COUNT(name) 
FROM world
GROUP BY continent

/* Query 7: For each continent show the continent and number of countries with populations of at least 10 million. */
  
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

/* Query 8: List the continents that have a total population of at least 100 million.*/
  
SELECT DISTINCT(continent)
FROM world x
WHERE population >= 100000000
GROUP BY continent;
