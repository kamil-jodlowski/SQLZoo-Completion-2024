# Module 2: SELECT FROM NOBEL

## Query 1: Read the notes about this table. 
Observe the result of running this SQL command to show the name, continent and population of all countries.

```sql
SELECT name, continent, population 
FROM world;

This query retrieves the name, continent, and population of all countries.

Query 2: How to use WHERE to filter records.

Show the name for the countries that have a population of at least 200 million.
200 million is 200000000, there are eight zeros.

SELECT name 
FROM world
WHERE population >= 200000000;
This query retrieves the names of countries with a population of at least 200 million.

Query 3: Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population 
FROM world
WHERE population >= 200000000;
This query retrieves the names and per capita GDP of countries with a population of at least 200 million. The per capita GDP is calculated by dividing the GDP by the population.

Query 4: Show the name and population in millions for the countries of the continent 'South America'.

Divide the population by 1000000 to get population in millions.

SELECT name, (population/1000000) 
FROM world
WHERE continent = 'South America';
This query retrieves the names and populations (in millions) of countries in South America. The population is divided by 1,000,000 to convert it to millions.

Query 5: Show the name and population for France, Germany, Italy.

SELECT name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy');
This query retrieves the names and populations of France, Germany, and Italy. The IN clause is used to filter the results to include only these countries.

Query 6: Show the countries which have a name that includes the word 'United'.

SELECT name 
FROM world
WHERE name LIKE '%United%';
This query retrieves the names of countries that include the word 'United'. The LIKE operator is used with wildcards to find matches.

Query 7: Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area 
FROM world 
WHERE area > 3000000 OR population > 250000000;
This query retrieves the names, populations, and areas of countries that are either big by area (more than 3 million sq km) or big by population (more than 250 million).

Query 8: Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.

Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area 
FROM world 
WHERE area > 3000000 XOR population > 250000000;
This query retrieves the names, populations, and areas of countries that are big by area (more than 3 million sq km) or big by population (more than 250 million), but not both. The XOR operator is used to exclude countries that meet both criteria.

Query 9: Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.

Use the ROUND function to show the values to two decimal places.
For Americas show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000, 2) AS Population_in_Millions, ROUND(gdp/1000000000, 2) AS GDP_in_Billions 
FROM world
WHERE continent = 'South America';
This query retrieves the names, populations (in millions), and GDPs (in billions) of countries in South America. The ROUND function is used to round the values to two decimal places.

Query 10: Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).

Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3) AS Per_Capita_GDP 
FROM world
WHERE gdp >= 1000000000000;
This query retrieves the names and per capita GDP of countries with a GDP of at least one trillion dollars. The per capita GDP is rounded to the nearest $1000 using the ROUND function with -3 as the second argument.

Query 11: Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.
You can use the LENGTH function to find the number of characters in a string.

SELECT name, capital 
FROM world 
WHERE LENGTH(name) = LENGTH(capital);
This query retrieves the names and capitals of countries where the name and capital have the same number of characters. The LENGTH function is used to find the number of characters in each string.

Query 12: The capital of Sweden is Stockholm. Both words start with the letter 'S'.

Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
You can use the function LEFT to isolate the first character.
You can use <> as the NOT EQUALS operator.

SELECT name, capital 
FROM world 
WHERE name <> capital AND LEFT(name, 1) = LEFT(capital, 1);
This query retrieves the names and capitals of countries where the first letters of the name and capital match. The LEFT function is used to isolate the first character of each string, and the <> operator is used to exclude cases where the name and capital are the same word.

Query 13: Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name.

They don't count because they have more than one word in the name.
Find the country that has all the vowels and no spaces in its name.
You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'.

SELECT name 
FROM world 
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';
This query retrieves the names of countries that contain all the vowels (a, e, i, o, u) and have no spaces in their names. The LIKE operator is used with wildcards to find matches, and the NOT LIKE operator is used to exclude names with spaces.


### Summary
1. **Query 1** retrieves the name, continent, and population of all countries.
2. **Query 2** filters countries with a population of at least 200 million.
3. **Query 3** calculates per capita GDP for countries with a population of at least 200 million.
4. **Query 4** shows the population in millions for South American countries.
5. **Query 5** filters for specific countries by name.
6. **Query 6** finds countries with names containing 'United'.
7. **Query 7** shows big countries by area or population.
8. **Query 8** uses XOR to exclude countries that are big by both area and population.
9. **Query 9** shows population in millions and GDP in billions for South America.
10. **Query 10** shows per capita GDP for countries with GDP of at least one trillion.
11. **Query 11** matches countries where the name and capital have the same length.
12. **Query 12** matches countries where the name and capital start with the same letter.
13. **Query 13** finds countries with all vowels and no spaces in the name.






