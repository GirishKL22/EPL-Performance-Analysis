-- 1. Total matches per season for epl seasons from 2015_16 to 2024_25.

SELECT season, COUNT(*) AS matches_played
FROM epl_clean
GROUP BY season
ORDER BY season;


-- 2.Season by season Summary for all 10 seasons.(Totalmatches,homes wins,away wins,draws,avg goals per match calculated)

SELECT season,
COUNT(*) AS total_matches,COUNT(CASE WHEN match_result = 'H' THEN 1 END) AS home_wins,
COUNT(CASE WHEN match_result = 'A' THEN 1 END) AS away_wins,
COUNT(CASE WHEN match_result = 'D' THEN 1 END) AS draws,
ROUND(AVG(total_goals),2) as avg_goals_per_match,
sum(total_goals) as total_goals_scored                                 
FROM epl_clean
GROUP BY season
ORDER BY season;


-- 3. All-Time Top 10 Teams by Total Wins across all 10 seasons from 2015-16 to 2024-25

SELECT winner as team,
COUNT(match_result) AS matches_won, COUNT(DISTINCT season) AS season_played
FROM epl_clean
WHERE winner <> 'Draw'
GROUP BY winner
ORDER BY matches_won DESC LIMIT 10;


-- 4. Top 10 Dominant Home Teams from Season 2015-16 to 2024-25

SELECT home_team as Team_name,SUM(home_goals) as goals_scored, SUM(away_goals) as goals_conceded,
COUNT(CASE WHEN match_result = 'H' THEN 1 END) AS home_wins,
    ROUND(100.0 * COUNT(CASE WHEN match_result = 'H' THEN 1 END) / COUNT(*), 2) AS home_win_percentage,
SUM(goal_difference) as total_goal_diff, ROUND(SUM(home_goals)*1/count(*),2) as avg_goals_per_match
FROM epl_clean
GROUP BY home_team
ORDER BY home_wins desc limit 10;


-- 5. Season-by-Season Champion (Team with MOST WINS each season)

WITH team_wins AS (
SELECT season,winner,COUNT(*) AS wins
FROM epl_clean
WHERE winner <> 'Draw'
GROUP BY season, winner
)
SELECT season,winner AS champion,wins
FROM 
(SELECT *, ROW_NUMBER() OVER (PARTITION BY season ORDER BY wins DESC) AS rn
FROM team_wins
) ranked
WHERE rn = 1
ORDER BY season;


-- 6. Top Dominant teams of from season 2015-16 to 2024-25
SELECT team_name,
    SUM(goals_scored) AS total_goals_scored,SUM(wins) AS total_wins,
    COUNT(*) AS matches_played,
    ROUND(SUM(goals_scored) / COUNT(*), 2) AS avg_goals_per_match
FROM (
    SELECT home_team AS team_name,home_goals AS goals_scored,
    CASE WHEN match_result = 'H' THEN 1 ELSE 0 END AS wins
    FROM epl_clean
UNION ALL
    SELECT away_team AS team_name,away_goals AS goals_scored,
    CASE WHEN match_result = 'A' THEN 1 ELSE 0 END AS wins
    FROM epl_clean
) AS all_goals
GROUP BY team_name
ORDER BY total_wins DESC;


-- 7. Average home and away goals scored per season from season 2015_16 to 2024_25

SELECT season,ROUND(AVG(total_goals), 2) AS avg_goals_per_match,
ROUND(AVG(home_goals), 2) AS avg_home_goals,
ROUND(AVG(away_goals), 2) AS avg_away_goals
FROM epl_clean
GROUP BY season
ORDER BY season;


 -- 8. Most Consistent Teams (highest average wins per season) of seasons 2015-16 to 2024-25
 
WITH team_season_wins AS (SELECT season,winner AS team_name,
COUNT(*) AS wins_in_season
FROM epl_clean
WHERE winner <> 'Draw'
GROUP BY season, winner
)   
SELECT team_name,COUNT(*) AS seasons_played,
	 SUM(wins_in_season) AS total_wins,
ROUND(AVG(wins_in_season), 2) AS avg_wins_per_season
FROM team_season_wins
GROUP BY team_name
ORDER BY avg_wins_per_season DESC
LIMIT 10;


-- 9. Top 10 Teams by Home Win % and Away Win %

WITH home AS (
    SELECT home_team AS team, 
COUNT(*) AS home_games,
SUM(CASE WHEN match_result = 'H' THEN 1 ELSE 0 END) AS home_wins
FROM epl_clean GROUP BY home_team),
away AS (
    SELECT away_team AS team, COUNT(*) AS away_games,
           SUM(CASE WHEN match_result = 'A' THEN 1 ELSE 0 END) AS away_wins
    FROM epl_clean GROUP BY away_team)
SELECT h.team,ROUND(h.home_wins * 100.0 / h.home_games, 1) AS home_win_pct,
    ROUND(a.away_wins * 100.0 / a.away_games, 1) AS away_win_pct,
    h.home_games, a.away_games
FROM home h
JOIN away a ON h.team = a.team
ORDER BY home_win_pct DESC
LIMIT 10;


