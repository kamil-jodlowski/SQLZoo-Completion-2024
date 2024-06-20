/* Query 1: List each country name where the population is larger than that of 'Russia'.
world(name, continent, area, population, gdp) */

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/* Query 2: Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > 
(SELECT gdp/population
           FROM world
           WHERE name = 'United Kingdom');

/* Query 3: List the name and continent of countries in the continents containing either Argentina or Australia. 
Order by name of the country.*/
  
SELECT name, continent 
FROM world
WHERE continent IN 
(SELECT continent
FROM world 
WHERE name = 'Argentina' OR name='Australia')
ORDER BY name;

/* Query 4: Which country has a population that is more than United Kingdom but less than Germany? 
Show the name and the population.*/
  
SELECT name, population 
FROM world 
WHERE population>
(SELECT population 
FROM world
WHERE name = 'United Kingdom') AND population<
(SELECT population 
FROM world 
WHERE name = 'Germany')

/* Query 5: Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
The format should be Name, Percentage for example:*/
  
SELECT name, CONCAT(ROUND(population/
(SELECT population
FROM world 
WHERE name = 'Germany')*100, 0), '%') AS percentage
FROM world
WHERE continent = 'Europe'

/* Query 6: Which countries have a GDP greater than every country in Europe? [Give the name only.] 
(Some countries may have NULL gdp values) */
  
SELECT name
FROM world 
WHERE gdp > ALL(SELECT gdp
                                FROM world
                                WHERE continent = 'Europe' AND gdp>0);


/* Query 7: Find the largest country (by area) in each continent, show the continent, the name and the area:
The above example is known as a correlated or synchronized sub-query. */
  
SELECT continent, name, area 
FROM world x
  WHERE area >= ALL(SELECT area
                                                FROM world y
                                                WHERE y.continent=x.continent
                                                AND population>0)

/* Query 8: List each continent and the name of the country that comes first alphabetically.*/
  
SELECT continent, name 
FROM world x 
WHERE name = (SELECT MIN(name)
                              FROM world y
                              WHERE x.continent = y.continent);

/* Query 9: Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population.*/
  
SELECT population,name 
FROM world x 
WHERE population > ALL(SELECT population 
                    FROM world y 
                    WHERE x.continent = y.continent
                    AND population >0); 

/* Query 10: Some countries have populations more than three times that of all of their neighbours (in the same continent).
Give the countries and continents. */
  
SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)

/* Query 11: Greece has capital Athens.
Each of the sFind all details of the prize won by PETER GRÜNBERG */
  
SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg'

/* Query 12: Find all details of the prize won by EUGENE O'NEILL */

SELECT *
FROM nobel
WHERE winner LIKE 'Eugene G%'

/* Query 13: Knights in order
List the winners, year and subject where the winner starts with Sir. 
Show the the most recent first, then by name order. */

SELECT winner, yr, subject 
FROM nobel 
WHERE winner LIKE 'Sir%' 
ORDER BY yr DESC , winner ASC

/* Query 14: The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last. */

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY 
    (subject IN ('chemistry', 'physics')) ASC, 
    subject ASC, 
    winner ASC;
