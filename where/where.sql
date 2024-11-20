-- 1. A closer look at comparisons in WHERE

-- 1.1 Return review-rows with a high (>= 8) quality
SELECT pid, rid
FROM reviews
WHERE quality > 8;
-- Alternatives:
WHERE quality >= 9;
WHERE NOT(quality <= 8);
WHERE NOT(quality < 9);

-- 1.2 Return review-rows with a high (>= 8) quality and originality
WHERE quality > 8 AND originality > 8;

-- 1.3 Return review-rows with a high (>= 8) quality or originality
WHERE quality > 8 OR originality > 8;

-- 1.4 Return review-rows without a high (>= 8) quality or originality
WHERE NOT(quality > 8 OR originality > 8);
-- Alternative:
WHERE NOT(quality > 8) AND NOT(originality > 8);

-- 1.5 Return review-rows without the highest quality
SELECT pid, rid 
FROM reviews
WHERE quality <> 10;

-- 1.6 Queries and NULL values
SELECT pid, rid, quality + originality AS x
FROM reviewswn
WHERE quality > 8 OR originality > 8;

