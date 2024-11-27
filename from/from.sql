-- 1. The FROM clause

-- 1.1 
SELECT * 
FROM (SELECT * FROM courses
        WHERE cid IN (SELECT cid FROM instructors)) AS C
WHERE title LIKE '%Databases%';
    -- 1. C.cid in I.cid -> cid = (2,3)
    -- 2. title = "Databases" -> return (3, "Databases")

-- 1.2 Examples: Very useful for complex queries with aggregation
SELECT *
FROM (SELECT product, COUNT(*) AS c, SUM(rating) AS s
        FROM productreview_n
        GROUP BY product) P, sellers S
WHERE P.product = S.product;
-- Aggregation before the join, otherwise the computed aggregates don't make any sense

