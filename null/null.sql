-- 1. Answering queries with NULL values
SELECT pid, rid, quality + originality AS x
FROM reviewswn
WHERE quality > 8 OR originality > 8;

-- 2. Working with NULL values
SELECT pid, rid
FROM reviewswn
WHERE quality IS NULL AND 
        originality IS NOT NULL; 
-- Check whether 'quality' is a NULL value
-- Check whether 'originality' is not a NULL value

-- 3. Set-wise combining SELECT queries
--    Return the identifier of all students
-- 3.1 UNION
SELECT cid AS id FROM students
UNION  -- UNION combines results as * a set *
SELECT fid AS id FROM faculty;
-- 3.2 UNION ALL 
SELECT cid AS id FROM students
UNION ALL -- UNION ALL combines results as * a multiset *
SELECT fid AS id FROM faculty;
-- 3.3 INTERSECT
SELECT cid AS id FROM students
INTERSECT  -- INTERSECT combines results as a set
SELECT fid AS id FROM faculty;
-- 3.4 EXCEPT
SELECT cid AS id FROM students
EXCEPT  -- EXCEPT combines results as a set
SELECT fid AS id FROM faculty;

-- 4. Nested queries: Another option for intersections and differences
-- 4.1 Return the identifier of all students that are faculty
SELECT cid 
FROM students
WHERE cid IN (  -- IN checks whether 'sid' is in a list
    SELECT fid FROM faculty);  -- obtained from column 'fid' in table 'faculty'.
-- 4.2 Return the identifier of all students that are not faculty
SELECT cid 
FROM students
WHERE cid NOT IN (  -- NOT IN checks whether 'cid' is not in a list
    SELECT fid FROM faculty);  -- obtained from column 'fid' in table 'faculty'
-- Nested queries are power tools that, with proper usage, are highly efficient
