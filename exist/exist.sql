-- 1. Nested queries and EXIST
-- 1.1 EXIST
-- Return the students if there are faculty members.
SELECT * FROM students
WHERE EXISTS (  -- EXISTS: true if L != empty
    SELECT * 
    FROM faculty  -- The nested query gives a list L with all rows in 'faculty'.
);

-- 1.2 NOT EXIST
-- Return those students that are not also faculty members
SELECT * FROM students S
WHERE NOT EXISTS (  -- NOT EXISTS: true if L = empty
    SELECT *  -- The nested query give a list L with all rows in 'faculty' that are the same
                -- person as the student.
    FROM faculty F
    WHERE S.cid = F.fid
);
    -- not (cid = fid) -> not Celeste