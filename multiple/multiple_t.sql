-- SELECT * FROM courses2;
-- SELECT * FROM instructors;

-- SELECT *
-- FROM courses2 C, instructors I
-- WHERE C.cid = I.cid;

-- SELECT *
-- FROM courses2 C CROSS JOIN instructors I
-- WHERE C.cid = I.cid;

-- SELECT * 
-- FROM courses2 C JOIN 
-- instructors I ON C.cid = I.cid;

-- SELECT * 
-- FROM courses2 C INNER JOIN
--     instructors I ON C.cid = I.cid;

-- SELECT *
-- FROM courses2 C LEFT JOIN
--     instructors I ON C.cid = I.cid;

-- SELECT * FROM courses2

-- SELECT * 
-- FROM courses2 C LEFT OUTER JOIN 
--     instructors I ON C.cid = I.cid

-- SELECT *
-- FROM courses2 C RIGHT JOIN
--     instructors I ON C.cid = I.cid;

-- SELECT *
-- FROM courses2 C RIGHT OUTER JOIN
--     instructors I ON C.cid = I.cid;

-- SELECT *
-- FROM courses2 C FULL JOIN
--     instructors I ON C.cid = I.cid;

-- SELECT *
-- FROM courses2 C 
-- LEFT JOIN instructors I ON C.cid = I.cid
-- UNION
-- SELECT *
-- FROM courses2 C 
-- RIGHT JOIN instructors I ON C.cid = I.cid;

-- SELECT *
-- FROM courses2 C RIGHT JOIN 
--     instructors I ON C.cid > I.cid

-- UNION

-- SELECT *
-- FROM courses2 C LEFT JOIN
--     instructors I ON C.cid > I.cid;

SELECT * FROM instructors