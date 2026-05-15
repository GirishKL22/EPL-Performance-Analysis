-- Creating one master table by combining all 10 clean tables(adding all epl seasons from 2015_16 to 2024_25)

DROP TABLE IF EXISTS epl_master;          -- Checking for duplicate table and dropping if it exists

CREATE TABLE epl_master AS
SELECT * FROM clean_2015_16
UNION ALL
SELECT * FROM clean_2016_17
UNION ALL
SELECT * FROM clean_2017_18
UNION ALL
SELECT * FROM clean_2018_19
UNION ALL
SELECT * FROM clean_2019_20
UNION ALL
SELECT * FROM clean_2020_21
UNION ALL
SELECT * FROM clean_2021_22
UNION ALL
SELECT * FROM clean_2022_23
UNION ALL
SELECT * FROM clean_2023_24
UNION ALL
SELECT * FROM clean_2024_25;


-- Data profiling to identify dirty data like nulls or errors in epl_master table before converting it to clean epl_table

SELECT COUNT(*) FROM epl_master;     -- Cross checking number of rows in master table (10 seasons × (380 matches/season) = 3800 rows total)

SELECT * FROM epl_master LIMIT 10;       -- Checking headers and created columns for epl_master table

-- Seeing does all season have same number of matches
SELECT Season, COUNT(*) as no_of_matches
FROM epl_master
GROUP BY Season
ORDER BY Season;

-- Check for missing values values in goal columns
SELECT COUNT(*) AS total_rows,
COUNT(CASE WHEN FTHG IS NULL OR TRIM(FTHG)= '' THEN 1 END) AS null_FTHG,     -- Missing or empty values
 COUNT(CASE WHEN FTAG IS NULL OR TRIM(FTAG)= '' THEN 1 END) AS null_FTAG,
 COUNT(CASE WHEN HTHG IS NULL OR TRIM(HTHG)= '' THEN 1 END) AS null_HTHG,
COUNT(CASE WHEN HTAG IS NULL OR TRIM(HTAG)= '' THEN 1 END) AS null_HTAG
FROM epl_master;

-- Checking for non-numeric values in goal columns
SELECT COUNT(*) AS total_rows,
COUNT(CASE WHEN FTHG NOT REGEXP '^[0-9]+$' THEN 1 END) AS bad_FTHG,                    -- Non-numeric values 
COUNT(CASE WHEN FTAG NOT REGEXP '^[0-9]+$' THEN 1 END) AS bad_FTAG,
COUNT(CASE WHEN HTHG NOT REGEXP '^[0-9]+$' THEN 1 END) AS bad_HTHG,
 COUNT(CASE WHEN HTAG NOT REGEXP '^[0-9]+$' THEN 1 END) AS bad_HTAG
FROM epl_master;


Select COUNT(*) FROM epl_master WHERE FTR NOT IN ('H','D','A');  -- checking FTR is valid and only have H, D or A values inside the column
