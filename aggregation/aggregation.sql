-- 1. Aggregation with nested queries

-- 1.1 Consider the following two queries
-- 1.1.1 Per product: get the review with highest rating
-- 1.1.2 Per user: get the product they rated lowest

-- Using nested queries
-- 1.1.1 >=
SELECT * 
FROM productreview P
WHERE rating >= ALL (
    SELECT rating
    FROM productreview Q
    WHERE P.product = Q.product
);

-- 1.1.2 <= 
SELECT *
FROM productreview P
WHERE rating <= ALL (
    SELECT rating
    FROM productreview Q
    WHERE P.user = Q.user
);

-- *** works but limited

-- 2. The basic of aggregation

-- 2.1 MIN
SELECT MIN(rating)
FROM productreview;
-- Minimum value in column 'rating'
-- Minimum of rating: 3
-- Aggregates operate on groups of rows

-- 2.1.1 Invalid queries
SELECT MIN(rating), product  -- ***invalid queries
FROM productreview
-- No longer access to individual unaggregated columns

-- 2.2 MAX
SELECT MAX(rating)
FROM productreview;
-- Maximum value in column 'rating'
-- Maximum of ratings: 10

-- 2.3 COUNT
SELECT COUNT(rating)
FROM productreview;
-- Number of rows
-- Ratings: 7

-- 2.3.1 COUNT(*)
SELECT COUNT(*)
FROM productreview;
-- Number of rows
-- For COUNTing rows: the columns don't matter.
-- Rows: 7

-- 2.3.2 DISTINCT 
-- DISTINCT in SQL means return the unique value (can't be repeated)
SELECT COUNT(DISTINCT rating)
FROM productreview;
-- Number of distinct values in column 'rating'
-- Distinct rating: 6

-- 2.4 SUM
SELECT SUM(rating)
FROM productreview;
-- Sum of the values in column 'rating'.
-- Sum of rating: 47

-- 2.4.1 SUM(DISTINCT)
SELECT SUM(DISTINCT rating)
FROM productreview;
-- Sum of the distinct values in column 'rating'.
-- Sum of distinct ratings: 42

-- 2.5 AVG
SELECT AVG(rating)
FROM productreview;
-- Average of the values in column 'rating'.
-- Average of ratings: 6.71..
-- The average can be an INT

-- 2.5.1 AVG(CAST(.. AS DOUBLE))
SELECT AVG(CAST(rating AS DOUBLE))
FROM productreview;
-- Sol: make column 'rating' as a DOUBLE

-- 2.5.2 DECIMAL
SELECT AVG(CAST(rating AS DECIMAL))
FROM productreview;
-- Sol: make column 'rating' as DECIMAL

-- 2.5.3 DISTINCT 
SELECT AVG(DISTINCT rating)
FROM productreview;
-- Average of the distinct values in column 'rating'
-- 7

-- 2.5.4 DISTINCT DECIMAL
SELECT AVG(DISTINCT CAST(rating AS DECIMAL))
FROM productreview;
-- Average of the distinct value in column 'rating' (decimal)

-- 2.6 Consider again the following query 
-- 2.6.1 Per product: get the review with highest rating.
-- Using aggregation and nested queries
SELECT *
FROM productreview P
WHERE rating = (
    SELECT MAX(rating)
    FROM productreview Q
    WHERE P.product = Q.product
);