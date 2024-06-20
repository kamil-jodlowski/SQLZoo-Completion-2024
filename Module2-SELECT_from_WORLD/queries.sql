/* Query 1: Change the query shown so that it displays Nobel prizes for 1950. */

SELECT yr, subject, winner 
FROM nobel 
WHERE yr =1950

/* Query 2: Show who won the 1962 prize for literature.*/

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature'

/* Query 3: Show the year and subject that won 'Albert Einstein' his prize.*/
  
SELECT yr, subject
FROM nobel 
WHERE winner = 'Albert Einstein' 

/* Query 4: Give the name of the 'peace' winners since the year 2000, including 2000.*/
  
SELECT winner
FROM nobel 
WHERE YR >= 2000
AND SUBJECT = 'peace'

/* Query 5: Show the name and population for France, Germany, Italy.*/
  
SELECT * 
FROM nobel
WHERE subject = 'literature'
AND YR BETWEEN 1980 AND 1989

/* Query 6: Show all details of the presidential winners:
Theodore Roosevelt
Thomas Woodrow Wilson
Jimmy Carter
Barack Obama*/
  
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');


/* Query 7: Show the winners with first name John */
  
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

/* Query 8: Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.*/
  
SELECT yr, subject, winner 
FROM nobel
WHERE yr = 1980 AND subject = 'physics' OR yr = 1984 AND subject= 'chemistry';

/* Query 9: SShow the year, subject, and name of winners for 1980 excluding chemistry and medicine*/
  
SELECT yr, subject, winner
FROM nobel 
WHERE yr = 1980 AND subject NOT IN ('medicine', 'chemistry')

/* Query 10: Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */
  
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004 ;

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
