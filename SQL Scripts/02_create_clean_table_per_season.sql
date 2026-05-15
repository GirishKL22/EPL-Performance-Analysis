-- Creating clean tables per season from raw tables for merging ready tables

-- Creating clean table for season 2015_16 from raw_2015_16 table we created
CREATE TABLE clean_2015_16 AS
SELECT 
    '2015/16' AS Season,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,          -- Extracting columns from raw table using position (comma count)
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 3), ',', -1) AS HomeTeam,
  SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS AwayTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS FTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTAG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTAG
FROM raw_2015_16;

SELECT COUNT(*)                                                            -- Checking row counts to match with raw_2015_16 table
FROM clean_2015_16;

SELECT * FROM clean_2015_16 LIMIT 5;                                 -- Cross Checking the columns created from raw_2015_16 table


-- Reapeating the process for all seasons from season 2016_17 to season 2024_25

-- For season 2016_17
CREATE TABLE clean_2016_17 AS
SELECT 
'2016/17' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 3), ',', -1) AS HomeTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS AwayTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS FTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTAG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTR,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTAG
FROM raw_2016_17;
SELECT * FROM clean_2016_17 LIMIT 5;

-- For 2017_18 season
CREATE TABLE clean_2017_18 AS
SELECT '2017/18' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 3), ',', -1) AS HomeTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS AwayTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS FTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTAG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTAG
FROM raw_2017_18;

SELECT * FROM clean_2017_18 LIMIT 5;


-- For 2018/19 season
CREATE TABLE clean_2018_19 AS
SELECT '2018/19' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 3), ',', -1) AS HomeTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS AwayTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS FTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTAG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTAG
FROM raw_2018_19;
SELECT * FROM clean_2018_19 LIMIT 5;

-- From 2019_20 season we have extra time column added in raw files so we skip that 3rd column

-- For 2019_20 season
CREATE TABLE clean_2019_20 AS
SELECT 
'2019/20' AS Season,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
  SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2019_20;

SELECT * FROM clean_2019_20 LIMIT 5;

-- For 2020_21 season
CREATE TABLE clean_2020_21 AS
SELECT 
'2020/21' AS Season,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
 SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
  SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2020_21;
SELECT * FROM clean_2020_21 LIMIT 5; 

-- For 2021_22 season
CREATE TABLE clean_2021_22 AS
SELECT '2021/22' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2021_22;
SELECT * FROM clean_2021_22 LIMIT 5; 

-- For 2022_23 season
CREATE TABLE clean_2022_23 AS
SELECT 
    '2022/23' AS Season,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
 SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
   SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2022_23;
SELECT * FROM clean_2022_23 LIMIT 5; 

-- For 2023_24 season
CREATE TABLE clean_2023_24 AS
SELECT 
    '2023/24' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
	  SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
  SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
      SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2023_24;
SELECT * FROM clean_2023_24 LIMIT 5; 

-- For 2024/25 season
CREATE TABLE clean_2024_25 AS
SELECT '2024/25' AS Season,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 2), ',', -1) AS Date_Text,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 4), ',', -1) AS HomeTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 5), ',', -1) AS AwayTeam,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 6), ',', -1) AS FTHG,
 SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 7), ',', -1) AS FTAG,
SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 8), ',', -1) AS FTR,
    SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 9), ',', -1) AS HTHG,
   SUBSTRING_INDEX(SUBSTRING_INDEX(raw_line, ',', 10), ',', -1) AS HTAG
FROM raw_2024_25;

SELECT * FROM clean_2024_25 LIMIT 5; 

