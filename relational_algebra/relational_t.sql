-- SELECT * FROM courses;
-- SELECT * FROM instructors;

-- DELETE FROM courses WHERE cid = 4 OR cid = 5;

-- SELECT * FROM courses;

-- SELECT * 
-- FROM courses C CROSS JOIN instructors I
-- WHERE C.cid = I.cid;

-- SELECT C.title, I.names
-- FROM courses C CROSS JOIN instructors I
-- WHERE C.cid = I.cid;

-- SELECT * 
-- FROM courses CROSS JOIN instructors
-- WHERE courses.cid = instructors.cid;

-- SELECT C.title, I.names
-- FROM courses C NATURAL JOIN instructors I;

-- SELECT C.title, I.names
-- FROM courses C JOIN instructors I
-- ON C.cid = I.cid;

-- SELECT sid + year AS X, name
-- FROM students;

-- SELECT * FROM course;
-- SELECT * FROM courses;

-- SELECT C1.title
-- FROM course C1 CROSS JOIN course C2
-- WHERE C1.lecturer = C2.lecturer AND C1.cid <> C2.cid;

-- SELECT title 
-- FROM course
-- WHERE lecturer NOT IN (
--     SELECT lecturer
--     FROM course
--     GROUP BY lecturer
--     HAVING COUNT(*) >= 2
-- );

-- WITH X AS (
--     SELECT S1.sid AS sid1, S2.sid AS sid2, S1.year AS year1, S2.year AS year2
--     FROM students S1, students S2
--     WHERE S1.year < S2.year
-- ),

-- Y AS (
--     SELECT DISTINCT sid1
--     FROM X
-- ),

-- Z AS (
--     SELECT sid 
--     FROM students
--     WHERE sid NOT IN (SELECT sid1 FROM Y)
-- )

-- SELECT name FROM students
-- WHERE sid IN (SELECT sid FROM Z);

-- SELECT * FROM students

WITH XY AS (
    SELECT S1.sid AS sid1
    FROM students AS S1
    CROSS JOIN students AS S2
    WHERE S1.year < S2.year
),

Z AS (
    SELECT sid 
    FROM students
    WHERE sid NOT IN (SELECT sid1 FROM XY)
)

SELECT name
FROM students NATURAL JOIN Z;