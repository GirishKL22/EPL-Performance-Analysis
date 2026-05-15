-- Create final clean table from epl_master table with basic cleaning.

CREATE TABLE epl_clean as
SELECT season,
STR_TO_DATE(Date_Text, '%d/%m/%Y') AS match_date,      -- Text → DATE
TRIM(HomeTeam) AS home_team,                           -- Remove extra spaces
TRIM(AwayTeam) AS away_team,
CAST(FTHG AS UNSIGNED) AS home_goals,                       -- Text → Number
CAST(FTAG AS UNSIGNED) AS away_goals,
FTR as match_result,
CAST(HTHG AS UNSIGNED) AS home_halftime_goals,
CAST(HTAG AS UNSIGNED) AS away_halftime_goals
FROM epl_master;

Select * from epl_clean;

-- Adding Calculated columns to epl_clean table

-- 1. Adding Winner column
ALTER TABLE epl_clean 
ADD COLUMN winner VARCHAR(25);

UPDATE epl_clean 
SET winner = 
CASE 
  WHEN match_result = 'H' THEN home_team
WHEN match_result = 'A' THEN away_team
ELSE 'Draw'
END;

-- 2. Adding TotalGoals column
ALTER TABLE epl_clean 
ADD COLUMN total_goals INT;

UPDATE epl_clean 
SET total_goals = home_goals + away_goals;

-- 3. Adding GoalDifference column
ALTER TABLE epl_clean 
ADD COLUMN goal_difference INT;

UPDATE epl_clean                        
SET goal_difference = home_goals - away_goals;

-- Since cast of columns FTHG,FTAG,HTHG,HTAG AS UNSIGNED datatype since goals scored cant be negative 
-- Goaldiffrence cant be calculated since gd can be negative if home team loses, so we change UNSIGNED datatype to INT


ALTER TABLE epl_clean                                -- Changing Unsigned to INT to allow negative values 
MODIFY COLUMN home_goals INT,
MODIFY COLUMN away_goals INT,
MODIFY COLUMN home_halftime_goals INT,
MODIFY COLUMN away_halftime_goals INT;

UPDATE epl_clean                        
SET goal_difference = home_goals - away_goals;

SELECT  MIN(goal_difference) AS min_gd,                          -- Checking the working of GoalDiffrence column we created
   MAX(goal_difference) AS max_gd,
COUNT(CASE WHEN goal_difference < 0 THEN 1 END) AS negative_matches
FROM epl_clean;

SELECT * FROM epl_clean                           -- Checking the sample rows like 20 rows for created epl_clean table
LIMIT 20;
