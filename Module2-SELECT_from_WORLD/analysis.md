# Module 3: SELECT FROM NOBEL

## Query 1: Change the query shown so that it displays Nobel prizes for 1950.

```sql
SELECT yr, subject, winner 
FROM nobel 
WHERE yr = 1950;
This query retrieves Nobel prize details for the year 1950.

Query 2: Show who won the 1962 prize for literature.

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';
This query retrieves the winner of the Nobel prize for literature in 1962.

Query 3: Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject
FROM nobel 
WHERE winner = 'Albert Einstein';
This query retrieves the year and subject of the Nobel prize won by Albert Einstein.

Query 4: Give the name of the 'peace' winners since the year 2000, including 2000.

SELECT winner
FROM nobel 
WHERE yr >= 2000
AND subject = 'peace';
This query retrieves the winners of the Nobel Peace Prize since the year 2000.

Query 5: Show the name and population for France, Germany, Italy.

SELECT *
FROM nobel
WHERE winner IN ('France', 'Germany', 'Italy');
This query retrieves all details of Nobel prize records where the winner is France, Germany, or Italy.

Query 6: Show all details of the presidential winners: Theodore Roosevelt, Thomas Woodrow Wilson, Jimmy Carter, Barack Obama.

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');
This query retrieves all details of Nobel prize records for the specified presidential winners.

Query 7: Show the winners with first name John.

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';
This query retrieves the winners of Nobel prizes whose first name is John.

Query 8: Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

SELECT yr, subject, winner 
FROM nobel
WHERE (yr = 1980 AND subject = 'physics') OR (yr = 1984 AND subject = 'chemistry');
This query retrieves the year, subject, and winner details of Nobel prizes in physics for 1980 and chemistry for 1984.

Query 9: Show the year, subject, and name of winners for 1980 excluding chemistry and medicine.

SELECT yr, subject, winner
FROM nobel 
WHERE yr = 1980 AND subject NOT IN ('medicine', 'chemistry');
This query retrieves the year, subject, and winner details of Nobel prizes for 1980 excluding those in chemistry and medicine.

Query 10: Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004).

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
   OR (subject = 'Literature' AND yr >= 2004);
This query retrieves the year, subject, and winner details of Nobel prizes in Medicine before 1910 and Literature after 2004.

Query 11: Find all details of the prize won by PETER GRÜNBERG.

SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';
This query retrieves all details of the Nobel prize won by Peter Grünberg.

Query 12: Find all details of the prize won by EUGENE O'NEILL.

SELECT *
FROM nobel
WHERE winner LIKE 'Eugene O%';
This query retrieves all details of the Nobel prize won by Eugene O'Neill.

Query 13: Knights in order List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject 
FROM nobel 
WHERE winner LIKE 'Sir%' 
ORDER BY yr DESC, winner ASC;
This query retrieves the winners, year, and subject details of Nobel prizes where the winner's name starts with 'Sir', ordered by year descending and winner name ascending.

Query 14: The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY 
    (subject IN ('chemistry', 'physics')) ASC, 
    subject ASC, 
    winner ASC;
This query retrieves the winners and subjects of Nobel prizes in 1984, ordered first by subjects other than chemistry and physics, followed by chemistry and physics, and then by winner name.


### Summary
1. **Query 1-14** retrieves various details from the Nobel prize dataset based on specified criteria. Each query is designed to extract specific information about Nobel laureates and their prizes, demonstrating different aspects of SQL querying and data retrieval.
