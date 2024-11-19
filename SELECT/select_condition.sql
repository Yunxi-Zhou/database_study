-- ALTER TABLE courses 
-- CHANGE COLUMN tile title TEXT NOT NULL;
SELECT *
FROM courses
-- WHERE lecturer = 2;
-- WHERE cid < lecturer;
-- WHERE title = 'D';
WHERE title LIKE '%D%';