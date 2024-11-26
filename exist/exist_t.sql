-- SELECT * FROM students;
-- SELECT * FROM faculty;

-- SELECT * FROM students
-- WHERE EXISTS (
--     SELECT *
--     FROM faculty
-- );

SELECT * FROM students
WHERE NOT EXISTS (
    SELECT *
    FROM faculty
    WHERE cid = fid
);