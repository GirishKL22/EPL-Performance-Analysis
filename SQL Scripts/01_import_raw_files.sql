CREATE DATABASE IF NOT EXISTS epl_analysis;                       -- Created new DB for EPL football analysis from season 2015_16 to 2024_25
USE epl_analysis;                                             


-- Creating raw tables for each season

CREATE TABLE raw_2015_16 (                                        -- Created new raw Tables for 2015_16 season
raw_line TEXT                                                 
);

-- Import the CSV file of 2015_16 season to raw table we created above for 2015_16 season
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2015-16.csv'
INTO TABLE raw_2015_16
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;                                                     -- Ignoring headings so it dont corrupt data

select count(*) from raw_2015_16;                                  -- Checking row counts to match with CSV file

SELECT raw_line                                                    -- Show the first 3 rows exactly as stored in the file to cross check with CSV file
FROM raw_2015_16 
LIMIT 3;


-- Repeating the above steps for each season from season 2016_17 to 2024_25

-- For 2016_17 season
CREATE TABLE raw_2016_17 (
    raw_line TEXT
);
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2016-17.csv'
INTO TABLE raw_2016_17
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select count(*) from raw_2016_17;

-- For 2017_18 season
CREATE TABLE raw_2017_18 (
raw_line text
);
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2017-18.csv'
INTO TABLE raw_2017_18
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY'\r\n'
IGNORE 1 ROWS;
select count(*) from raw_2018_19;

-- For 2018_19 season
CREATE TABLE IF NOT EXISTS raw_2018_19(
raw_line TEXT
 );
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2018-19.csv'
INTO TABLE raw_2018_19
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- For 2019_20 season
CREATE TABLE IF NOT EXISTS raw_2019_20 (
raw_line TEXT
 );
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2019-20.csv'
INTO TABLE raw_2019_20
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

-- For 2020_21 season
CREATE TABLE IF NOT EXISTS raw_2020_21 (
raw_line TEXT
 );
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2020-21.csv'
INTO TABLE raw_2020_21
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

-- For 2021_22 season
CREATE TABLE IF NOT EXISTS raw_2021_22 (
raw_line TEXT
 );
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2021-22.csv'
INTO TABLE raw_2021_22
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

-- For 2022_23 season
CREATE TABLE IF NOT EXISTS raw_2022_23 (
raw_line TEXT 
);
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2022-23.csv'
INTO TABLE raw_2022_23
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

-- For 2023_24 season
CREATE TABLE IF NOT EXISTS raw_2023_24 (
raw_line TEXT 
);
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2023-24.csv'
INTO TABLE raw_2023_24
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;

-- For 2024_25 season
CREATE TABLE IF NOT EXISTS raw_2024_25 (
raw_line TEXT
 );
LOAD DATA LOCAL INFILE 'D:\\Data Tools\\Data Sets\\Football\\Raw EPL files\\EPL 2024-25.csv'
INTO TABLE raw_2024_25
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS ;


















































