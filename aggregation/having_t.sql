-- SELECT product, MAX(rating) AS C1, MIN(rating) AS C2
-- FROM productreview
-- GROUP BY product
-- HAVING COUNT(*) > 2;

SELECT product, MAX(rating) AS C1, MIN(rating) AS C2
FROM productreview
GROUP BY product
HAVING AVG(rating) >= 5;