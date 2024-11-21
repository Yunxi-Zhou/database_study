-- SELECT * FROM reviewswn

-- SELECT pid, rid, quality + originality AS x
-- FROM reviewswn
-- WHERE quality > 8 OR originality > 8;

-- SELECT pid, rid
-- FROM reviewswn
-- WHERE quality IS NULL AND
--       originality IS NOT NULL;

-- -- Add the data of student into table students
-- INSERT INTO students
-- VALUES (1,'Alicia',2020),
--         (3,'Celesta',2018),
--         (4,'Dafni',2019);

-- -- Add data of eva to the faculty
-- INSERT INTO faculty
-- VALUES (5,'Eva','Full');

-- update the data of faculty
-- UPDATE faculty
-- SET names = 'Celesta'
-- WHERE fid = 3;

-- SELECT * FROM students;
-- SELECT * FROM faculty;

-- SELECT cid AS id FROM students
-- UNION 
-- SELECT fid AS id FROM faculty;

-- SELECT cid AS id FROM students
-- UNION ALL 
-- SELECT fid AS id FROM faculty;

-- SELECT cid AS id FROM students
-- INTERSECT  
-- SELECT fid AS id FROM faculty;

-- SELECT cid AS id FROM students
-- EXCEPT
-- SELECT fid AS id FROM faculty;

-- SELECT cid 
-- FROM students
-- WHERE cid IN (
--     SELECT fid FROM faculty);

SELECT cid 
FROM students
WHERE cid NOT IN(
    SELECT fid FROM faculty);