# Module 7: MORE JOIN

## Query 1: List the films where the yr is 1962

```sql
SELECT id, title
FROM movie 
WHERE yr = 1962;
This query retrieves the ID and title of all films released in the year 1962.

Query 2: Give the year of 'Citizen Kane'

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';
This query retrieves the release year of the film "Citizen Kane".

Query 3: List all of the Star Trek movies, include the id, title and yr

SELECT id, title, yr 
FROM movie 
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
This query lists the ID, title, and year of all "Star Trek" movies, ordered by year.

Query 4: What id number does the actor 'Glenn Close' have?

SELECT id 
FROM actor
WHERE name = 'Glenn Close';
This query retrieves the ID number of the actor Glenn Close.

Query 5: What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title = 'Casablanca';
This query retrieves the ID of the film "Casablanca".

Query 6: Obtain the cast list for 'Casablanca'

SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Casablanca';
This query retrieves the names of all actors in the cast of the film "Casablanca".

Query 7: Obtain the cast list for the film 'Alien'

SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';
This query retrieves the names of all actors in the cast of the film "Alien".

Query 8: List the films in which 'Harrison Ford' has appeared

SELECT title
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford';
This query lists all films in which Harrison Ford has appeared.

Query 9: List the films where 'Harrison Ford' has appeared - but not in the starring role

SELECT title
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' AND ord <> 1;
This query lists all films where Harrison Ford has appeared but not in the starring role.

Query 10: List the films together with the leading star for all 1962 films

SELECT title, name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1962 AND ord = 1;
This query lists all films released in 1962 along with their leading actors.

Query 11: Busiest years for 'Rock Hudson'

SELECT yr, COUNT(title) AS numberofmovies
FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
This query shows the busiest years for Rock Hudson, displaying the year and the number of movies he made in any year where he made more than two movies.

Query 12: List the film title and the leading actor for all of the films 'Julie Andrews' played in

SELECT title, name
FROM casting 
JOIN actor ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE movieid IN (
  SELECT movieid 
  FROM casting
  WHERE actorid IN (
    SELECT id 
    FROM actor
    WHERE name = 'Julie Andrews'
  )
) AND ord = 1;
This query lists the film title and the leading actor for all films in which Julie Andrews played.

Query 13: List actors who've had at least 15 starring roles

SELECT name
FROM casting
JOIN actor ON actor.id = casting.actorid 
WHERE ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15
ORDER BY name;
This query lists actors, in alphabetical order, who have had at least 15 starring roles.

Query 14: List the films released in 1978 ordered by the number of actors in the cast

SELECT title, COUNT(actorid) AS num_actors
FROM casting
JOIN movie ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY movieid 
ORDER BY COUNT(actorid) DESC, title;
This query lists films released in 1978, ordered by the number of actors in the cast, then by title.


### Summary
1. **Query 1-14** retrieves various information from the `movie`, `actor`, and `casting` datasets, including film details, actor information, and cast lists. Each query provides insights into movie and actor-related data using SQL joins, aggregation functions, and subqueries.





