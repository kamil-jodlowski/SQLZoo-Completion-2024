/* Query 1:List the films where the yr is 1962 [Show id, title] */

SELECT id, title
FROM  movie 
WHERE yr = 1962


/* Query 2: Give year of 'Citizen Kane'.*/

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'


/* Query 3: List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). 
  Order results by year.*/

SELECT id, title, yr 
FROM movie 
WHERE title LIKE ('%Star Trek%')
ORDER BY yr

/* Query 4: What id number does the actor 'Glenn Close' have?*/
  
SELECT id 
FROM actor
WHERE name = 'Glenn Close'

/* Query 5: What is the id of the film 'Casablanca' */
  
SELECT id
FROM movie
WHERE title = 'Casablanca'

/* Query 6: Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question) */
  
SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Casablanca';

/* Query 7: Obtain the cast list for the film 'Alien' */
  
SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';

/* Query 8: List the films in which 'Harrison Ford' has appeared.*/
  
SELECT title
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford';

/* Query 9: List the films where 'Harrison Ford' has appeared - but not in the starring role. 
[Note: the ord field of casting gives the position of the actor. 
If ord=1 then this actor is in the starring role]*/
  
SELECT title
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' AND ord <> 1 ;

/* Query 10: List the films together with the leading star for all 1962 films.*/
  
SELECT stadium, COUNT(gtime)
SELECT title, name
FROM actor
JOIN casting ON casting.actorid = actor.id
JOIN movie ON casting.movieid = movie.id
WHERE yr = '1962' AND ord = 1 ;

/* Query 11: Which were the busiest years for 'Rock Hudson', 
show the year and the number of movies he made each year for any year in which he made more than 2 movies.*/
  
SELECT yr,COUNT(title)
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

/* Query 12: List the film title and the leading actor for all of the films 'Julie Andrews' played in.*/
  
SELECT title, name
FROM casting 
JOIN actor ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE movieid IN (SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='Julie Andrews'))
AND ord = 1 ;

/* Query 13: Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.*/
  
SELECT name
FROM casting
JOIN actor ON actor.id = casting.actorid 
WHERE ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15;

/* Query 14: List the films released in the year 1978 ordered by the number of actors in the cast, then by title.*/
  
SELECT title, COUNT(actorid)
FROM casting
JOIN movie ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY movieid 
ORDER BY COUNT(actorid) DESC , title

/* Query 15: List all the people who have worked with 'Art Garfunkel'.*/
  
SELECT name
FROM actor 
JOIN casting ON actor.id = casting.actorid
WHERE movieid IN (SELECT movieid 
                                  FROM casting
                                  WHERE actorid IN (
                                               SELECT id 
                                               FROM actor
                                               WHERE name='Art Garfunkel'))
 AND name <>'Art Garfunkel' ;
