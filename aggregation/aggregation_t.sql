-- SELECT * FROM productreview

-- SELECT * 
-- FROM productreview P
-- WHERE rating >= ALL (
--     SELECT rating
--     FROM productreview Q
--     WHERE P.product = Q.product
-- );

-- SELECT *
-- FROM productreview P
-- WHERE rating <= ALL (
--     SELECT rating
--     FROM productreview Q
--     WHERE P.user = Q.user
-- );

-- SELECT MIN(rating)
-- FROM productreview;

-- SELECT MIN(rating), product
-- FROM productreview

-- SELECT MAX(rating)
-- FROM productreview;

-- SELECT COUNT(rating)
-- FROM productreview;

-- SELECT COUNT(*)
-- FROM productreview;

-- SELECT COUNT(DISTINCT rating)
-- FROM productreview;

-- SELECT SUM(DISTINCT rating)
-- FROM productreview;

-- SELECT AVG(rating)
-- FROM productreview;

-- SELECT AVG(CAST(rating AS DOUBLE))
-- FROM productreview;

-- SELECT AVG(CAST(rating AS DECIMAL))
-- FROM productreview;

-- SELECT AVG(DISTINCT rating)
-- FROM productreview;

-- SELECT AVG(DISTINCT CAST(rating AS DECIMAL))
-- FROM productreview;

SELECT *
FROM productreview P
WHERE rating = (
    SELECT MAX(rating)
    FROM productreview Q
    WHERE P.product = Q.product
);