# Module 6: JOIN

## Query 1: Show the matchid and player name for all goals scored by Germany.

```sql
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';
This query retrieves the match IDs and player names for all goals scored by players from the German team.

Query 2: Show id, stadium, team1, team2 for game 1012.

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;
This query retrieves the details of game 1012, including the stadium and teams involved.

Query 3: Show the player, teamid, stadium, and mdate for every German goal.

SELECT player, teamid, stadium, mdate 
FROM game 
JOIN goal ON (game.id = goal.matchid)
WHERE teamid = 'GER';
This query shows the player, team ID, stadium, and match date for every goal scored by a German player.

Query 4: Show the team1, team2, and player for every goal scored by a player called Mario.

SELECT team1, team2, player
FROM game 
JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%';
This query retrieves the team1, team2, and player for every goal scored by a player named Mario.

Query 5: Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.

SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10;
This query shows the player, team ID, coach, and goal time for all goals scored in the first 10 minutes of the game.

Query 6: List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname 
FROM game 
JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos';
This query retrieves the dates of the matches and the team names for which Fernando Santos was the coach of team1.

Query 7: List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.

SELECT player
FROM goal
JOIN game ON (id = matchid)
WHERE stadium = 'National Stadium, Warsaw';
This query shows the players who scored goals in a game held at the National Stadium, Warsaw.

Query 8: Show the name of all players who scored a goal against Germany.

SELECT DISTINCT(player)
FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER';
This query retrieves the names of players who scored goals against the German team.

Query 9: Show teamname and the total number of goals scored.

SELECT teamname, COUNT(*) AS numberofgoals
FROM eteam 
JOIN goal ON id = teamid
GROUP BY teamname;
This query shows each team name and the total number of goals scored by that team.

Query 10: Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(gtime) AS goals
FROM game 
JOIN goal ON (id = matchid)
GROUP BY stadium;
This query retrieves the stadium names and the number of goals scored in each stadium.

Query 11: For every match involving 'POL', show the matchid, date, and the number of goals scored.

SELECT matchid, mdate, COUNT(gtime) AS goals
FROM game 
JOIN goal ON (matchid = id)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate;
This query shows the match ID, date, and the number of goals scored for every match involving the Polish team.

Query 12: For every match involving 'GER', show the matchid, date, and the number of goals scored.

SELECT matchid, mdate, COUNT(gtime) AS goals
FROM game 
JOIN goal ON (matchid = id)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;
This query shows the match ID, date, and the number of goals scored for every match involving the German team.

Query 13: List every match with the goals scored by each team.

SELECT mdate, team1, 
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2, 
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game 
LEFT JOIN goal ON (id = matchid)
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;
This query lists every match with the goals scored by each team, showing the match date, teams, and their respective scores.

### Summary
1. **Query 1-13** retrieves various information from the `goal`, `game`, and `eteam`
