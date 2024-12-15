-- 1. An example of the relational algebra and the domain calculus
SELECT S.name, C.title
FROM students S, enroll_in E, courses C
WHERE S.sid = E.sid AND E.cid = C.cid AND 
        S.sid NOT IN (SELECT fid FROM faculty);

-- 1.1 𝜌C (courses)
-- courses C

-- 2. courses × instructors
SELECT * 
FROM courses CROSS JOIN instructors

-- 3. 𝜎courses.cid=instructors.cid(courses × instructors)
SELECT * 
FROM courses CROSS JOIN instructors
WHERE courses.cid = instructors.cid;

-- 3.1 𝜎C.cid=I.cid(𝜌C (courses) × 𝜌I(instructors))
SELECT * 
FROM courses C CROSS JOIN instructors I
WHERE C.cid = I.cid;

-- 4. 𝜋C.title,I.name (𝜎C.cid=I.cid(𝜌C (courses) × 𝜌I(instructors)))
SELECT C.title, I.names
FROM courses C CROSS JOIN instructors I
WHERE C.cid = I.cid;

-- 5. The conditional join and natural join operators Z

-- 5.1 natural join
-- 𝜋C.title,I.name (𝜌C (courses) Z 𝜌I(instructors))
SELECT C.title, I.names
FROM courses C NATURAL JOIN instructors I;

-- 5.2 conditional join
-- 𝜋C.title,I.name (𝜌C (courses) ZC.cid=I.cid 𝜌I(instructors))
SELECT C.title, I.names
FROM courses C JOIN instructors I
ON C.cid = I.cid;

-- 6. The extended projection operator 𝜋
-- 𝜋sid+year↦X,name (students)
SELECT sid + year AS X, name
FROM students;

-- 7. At-least n
-- 𝜋C1.title (𝜎C1.lecturer=C2.lecturer(𝜎C1.cid≠C2.cid(𝜌C1 (courses) × 𝜌C2(courses))))
SELECT C1.title
FROM course C1 CROSS JOIN course C2
WHERE C1.lecturer = C2.lecturer AND C1.cid <> C2.cid;

-- 8. Exact n
-- X := courses with lectures that lecture at-least two courses;
-- ▶ Y := courses with lectures that lecture at-least one courses;
-- ▶ Z := Y \ X;
-- ▶ 𝜋title (Z)
SELECT title
FROM course 
WHERE lecturer NOT IN (
    SELECT lecturer
    FROM courses
    GROUP BY lecturer
    HAVING COUNT(*) >= 2
);

-- 9. Largest value
-- ▶ X := 𝜌S1(students) × 𝜌S2(students);
-- ▶ Y := 𝜎S1.year<S2.year(X);
-- ▶ Z := 𝜋sid(students) \ 𝜋S1.sid(Y);
-- ▶ 𝜋name (students Z Z)

-- method 1
WITH X AS (
    SELECT S1.sid AS sid1, S2.sid AS sid2, S1.year AS year1, S2.year AS year2
    FROM students S1, students S2
    WHERE S1.year < S2.year
),

Y AS (
    SELECT DISTINCT sid1
    FROM X
),

Z AS (
    SELECT sid 
    FROM students
    WHERE sid NOT IN (SELECT sid1 FROM Y)
)

SELECT name FROM students
WHERE sid IN (SELECT sid FROM Z);

-- method 2
-- ▶ X := 𝜌S1(students) × 𝜌S2(students);
-- ▶ Y := 𝜎S1.year<S2.year(X);
-- ▶ Z := 𝜋sid(students) \ 𝜋S1.sid(Y);
-- ▶ 𝜋name (students Z Z)
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