-- 1. The basics of aggregation with NULL

-- 1.1 MIN
SELECT MIN(rating)
FROM productreview_n;
-- General rule: NULL values are discarded
-- Minimum of ratings: 5

-- 1.2 COUNT
SELECT COUNT(rating)
FROM productreview_n;
-- Ratings: 5

-- 1.3 COUNT(*)
SELECT COUNT(*)
FROM productreview_n;
-- Rows: 7

-- 1.4 DISTINCT
SELECT COUNT(DISTINCT rating)
FROM productreview_n;
-- Distinct ratings: 4

-- 1.5 SUM
SELECT SUM(rating)
FROM productreview_n;
-- Sum of ratings: 35

-- 1.6 AVG 
SELECT AVG(rating)
FROM productreview_n;
-- Average of ratings: 7

-- 1.7 AVG(DISTINCT )
SELECT AVG(DISTINCT rating)
FROM productreview_n;
-- Average of distinct ratings: 7

-- 1.8 IS NULL
-- General rule: NULL values are discarded
-- Unless all values are NULL
-- 1.8.1 MIN
SELECT MIN(rating)
FROM productreview_n
WHERE rating IS NULL;
-- Minimum of ratings: NULL

-- 1.8.2 MAX
SELECT MAX(rating)
FROM productreview_n
WHERE rating IS NULL;
-- Maximum of ratings: NULL

-- 1.8.3 COUNT
SELECT COUNT(rating)
FROM productreview_n
WHERE rating IS NULL;
-- Ratings: 0

-- 1.8.4 COUNT 
SELECT COUNT(*) 
FROM productreview_n
WHERE rating IS NULL;
-- Rows: 2

-- 1.8.5 COUNT(DISTINCT)
SELECT COUNT(DISTINCT rating)
FROM productreview_n
WHERE rating IS NULL;
-- *** Distinct ratings: 0

-- 1.8.6 SUM
SELECT SUM(rating)
FROM productreview_n
WHERE rating IS NULL;
-- Sum of ratings: NULL

-- 1.8.7 SUM(DISTINCT)
SELECT SUM(DISTINCT rating)
FROM productreview_n
WHERE rating IS NULL;
-- Sum of distinct ratings: NULL

-- 1.8.8 AVG
SELECT AVG(rating)
FROM productreview_n
WHERE rating IS NULL;
-- Average of ratings: NULL

-- 1.8.9 AVG(DISTINCT)
SELECT AVG(DISTINCT rating)
FROM productreview_n
WHERE rating IS NULL;
-- Average of distinct ratings: NULL