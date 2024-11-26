-- 1. HAVING: Filtering on groups

-- 1.1 Only look at products with many reviews
SELECT product, MAX(rating) AS C1, MIN(rating) AS C2
FROM productreview
GROUP BY product
HAVING COUNT(*) > 2;

-- 1.2 Only look at products with high average ratings
SELECT product, MAX(rating) AS C1, MIN(rating) AS C2
FROM productreview
GROUP BY product
HAVING AVG(rating) >= 5;
-- First ignore the bad ratings(WHERE)
-- Then look at products with high ratings(HAVING)
