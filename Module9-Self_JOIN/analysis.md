# Module 9: SELF JOIN

## Query 1: How many stops are in the database

```sql
SELECT COUNT(id)
FROM stops;
This query retrieves the total number of stops in the database.

Query 2: Find the id value for the stop 'Craiglockhart'

SELECT id
FROM stops 
WHERE name = 'Craiglockhart';
This query retrieves the id value for the stop named 'Craiglockhart'.

Query 3: Give the id and the name for the stops on the '4' 'LRT' service

SELECT id, name 
FROM stops 
JOIN route ON route.stop = stops.id
WHERE num = '4' AND company = 'LRT';
This query retrieves the id and name of stops served by the '4' 'LRT' service.

Query 4: The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Add a HAVING clause to restrict the output to these two routes

SELECT company, num, COUNT(*)
FROM route 
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) > 1;
This query retrieves the routes that visit either London Road or Craiglockhart and have a count of more than 1, indicating they serve both stops.

Query 5: Change the query so that it shows the services from Craiglockhart to London Road

SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = 149;
This query retrieves the services that connect Craiglockhart to London Road.

Query 6: Change the query so that the services between 'Craiglockhart' and 'London Road' are shown by name

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';
This query retrieves the services between Craiglockhart and London Road by their names.

Query 7: Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

SELECT DISTINCT a.company, a.num
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;
This query retrieves a distinct list of services connecting Haymarket and Leith.

Query 8: Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

SELECT a.company, a.num 
FROM route a 
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON (stopa.id = a.stop)
JOIN stops stopb ON (stopb.id = b.stop)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';
This query retrieves the services connecting Craiglockhart and Tollcross.

Query 9: Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company

SELECT DISTINCT stopb.name, a.company, a.num
FROM route a 
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON (stopa.id = a.stop)
JOIN stops stopb ON (stopb.id = b.stop)
WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT';
This query retrieves a distinct list of stops reachable from Craiglockhart by taking one LRT bus, including Craiglockhart itself.

Query 10: Find the routes involving two buses that can go from Craiglockhart to Lochend. Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus

SELECT x.num, x.company, x.name, y.num, y.company 
FROM 
  (SELECT DISTINCT stopb.name, b.company, b.num
   FROM route a 
   JOIN route b ON (a.company = b.company AND a.num = b.num)
   JOIN stops stopa ON (a.stop = stopa.id)
   JOIN stops stopb ON (b.stop = stopb.id)
   WHERE stopa.name = 'Craiglockhart') x 
JOIN
  (SELECT DISTINCT stopc.name, c.company, c.num
   FROM route c 
   JOIN route d ON (c.company = d.company AND c.num = d.num)
   JOIN stops stopc ON (c.stop = stopc.id)
   JOIN stops stopd ON (d.stop = stopd.id)
   WHERE stopd.name = 'Lochend') y 
ON (y.name = x.name) 
ORDER BY x.num, x.name, y.num;
This query retrieves the routes involving two buses to travel from Craiglockhart to Lochend, showing the bus number and company for the first bus, the transfer stop, and the bus number and company for the second bus.

Summary
Query 1-10 retrieve various information from the stops and route datasets, including details about stops, routes, and services, handling joins, aggregation functions, and nested queries. Each query provides insights into stop and route-related data using SQL joins, aggregation functions, and conditional logic.
