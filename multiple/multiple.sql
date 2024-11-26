-- 1. Selecting data from multiple tables

-- 1.1
-- Output only contains those courses and lectures that are connected to each other.
SELECT *
FROM courses2 C, instructors I
WHERE C.cid = I.cid;

-- 1.2 CROSS JOIN
-- Output only contains those courses and lectures that are connected to each other.
SELECT *
FROM courses2 C CROSS JOIN instructors I
WHERE C.cid = I.cid;

-- 1.3 JOIN .. ON
-- Output only contains those courses and lectures that are connected to each other.
SELECT * 
FROM courses2 C JOIN 
    instructors I ON C.cid = I.cid;

-- 1.4 INNER JOIN .. ON
-- Output only contains those courses and lectures that are connected to each other.
SELECT * 
FROM courses2 C INNER JOIN
    instructors I ON C.cid = I.cid;

-- 1.5 LEFT JOIN .. ON
-- Output contains all courses.
-- Courses with instructors include instructor details.
SELECT *
FROM courses C LEFT JOIN
    instructors I ON C.cid = I.cid;

-- 1.6 LEFT OUTER JOIN .. ON 
-- Output contains all courses.
-- Courses with instructors include instructor details.
SELECT * 
FROM courses2 C LEFT OUTER JOIN 
    instructors I ON C.cid = I.cid;

-- 1.7 RIGHT JOIN .. ON
-- Output contains all instructors.
-- Courses with instructors include instructor details.
SELECT *
FROM courses2 C RIGHT JOIN
    instructors I ON C.cid = I.cid;

-- 1.8 RIGHT OUTER JOIN .. ON
-- Output contains all instructors.
-- Courses with instructors include instructor details.
SELECT *
FROM courses2 C RIGHT OUTER JOIN
    instructors I ON C.cid = I.cid;

-- 1.9 FULL JOIN .. ON (Not support in MySql)
-- Equal to: LEFT JOIN .. ON  UNION  RIGHT JOIN .. ON
-- Output contains all courses and instructors
-- Courses and instructors are connected if possible

-- SELECT *
-- FROM courses2 C FULL JOIN
--     instructors I ON C.cid = I.cid;

SELECT *
FROM courses2 C LEFT JOIN 
    instructors I ON C.cid = I.cid
UNION
SELECT *
FROM courses2 C RIGHT JOIN 
    instructors I ON C.cid = I.cid;

-- 1.10 FULL OUTER JOIN .. ON
-- will not work in MySQL
-- Output contains all courses and instructors
-- Courses and instructors are connected if possible

-- SELECT *
-- FROM courses2 C FULL OUTER JOIN 
--     instructors I ON C.cid > I.cid;

-- 1.11 (>)

-- SELECT *
-- FROM courses2 C FULL JOIN
--     instructors I ON C.cid > I.cid;

SELECT *
FROM courses2 C RIGHT JOIN
    instructors I ON C.cid > I.cid

UNION

SELECT *
FROM courses2 C LEFT JOIN
    instructors I ON C.cid > I.cid;