-- Initialization for 2.

-- SELECT * 
-- FROM faculty;

-- SELECT * 
-- FROM course;

-- 1. computation on returned columns
-- SELECT *, cid + 5 AS one, 
--             cid * lecturer AS two
-- FROM courses;

-- 2. selecting data from multiple tables

-- SELECT *
-- FROM course, faculty;

-- SELECT *
-- FROM course, faculty
-- WHERE lecturer = fid;

-- SELECT title, names
-- FROM course, faculty
-- WHERE lecturer = fid;

-- 3. You specify what you want, not how to do it
-- It's important to consider the time and space cost

-- TRUNCATE TABLE courses;
-- SELECT *
-- FROM courses;

-- 4. Sorting returned rows
-- SELECT title, lecturer
-- FROM courses
-- ORDER BY title;

-- 5. Ascending is the default if not specified
SELECT title, lecturer
FROM courses
ORDER BY lecturer DESC, title ASC;
