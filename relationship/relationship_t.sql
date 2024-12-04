-- INSERT INTO courses
-- VALUES (4,'Advanced Databases');

-- SELECT * FROM courses;

-- SELECT * FROM student;

-- CREATE TABLE enroll_in
-- (
--     sid INT NOT NULL REFERENCES student(sid),
--     cid INT NOT NULL REFERENCES courses(cid),
--     year INT NOT NULL,
--     PRIMARY KEY(sid,cid),
--     CHECK(2020 <= year)
-- );

-- INSERT INTO enroll_in
-- VALUES (1,1,2021),
--         (1,2,2020),
--         (3,1,2020),
--         (2,3,2020);

-- SELECT * FROM enroll_in;

-- INSERT INTO courses
-- VALUES (5,'Database Theory');

-- SELECT * FROM courses;
-- SELECT * FROM enroll_in;

-- DELETE FROM enroll_in;

-- SELECT * FROM enroll_in;

-- UPDATE courses SET cid = 5
-- WHERE title = 'Databases';

-- SELECT * FROM courses;
-- SELECT * FROM enroll_in;

-- INSERT INTO enroll_in
-- VALUES (3,6,2021);

-- UPDATE enroll_in SET cid = 6
-- WHERE sid = 1 AND year = 2020;

-- DELETE FROM enroll_in 
-- WHERE cid = 3 AND sid = 2;

-- SELECT * FROM enroll_in;

-- INSERT INTO enroll_in
-- VALUES (2,3,2020);

-- CREATE TABLE no_action
-- (
--     cid INT NOT NULL REFERENCES courses(cid),
--     PRIMARY KEY(cid)
-- );

-- INSERT INTO no_action
-- VALUES (1);

-- SELECT * FROM no_action;

-- CREATE TABLE restrict
-- (
--     cid INT NOT NULL REFERENCES courses(cid)
--         ON UPDATE RESTRICT
--         ON DELETE RESTRICT,
--     PRIMARY KEY(cid)
-- );

-- INSERT INTO restrict
-- VALUES (1),(2);

-- SELECT * FROM restrict;

-- DELETE FROM restrict WHERE cid = 1;

-- CREATE TABLE cascade
-- (
--     cid INT NOT NULL REFERENCES primaries(cid)
--         ON DELETE CASCADE
--         ON UPDATE CASCADE
-- );

-- INSERT INTO cascade
-- VALUES (1),(1),(2);

-- SELECT * FROM cascade;

-- DELETE FROM primaries WHERE cid = 1;

-- UPDATE primaries SET cid = 6 WHERE cid = 2;

-- SELECT * FROM cascade;

-- SELECT * FROM primaries;

-- DROP TABLE set_null;

-- CREATE TABLE set_null
-- (
--     cid INT REFERENCES primaries(cid)
--         ON DELETE SET NULL
--         ON UPDATE SET NULL
-- );

-- INSERT INTO set_null
-- VALUES (3),(4),(5);

-- DELETE FROM primaries WHERE cid = 3;

-- SELECT * FROM set_null;

-- SELECT * FROM primaries;

-- DROP TABLE set_default;

-- CREATE TABLE set_default
-- (
--     cid INT DEFAULT 0 REFERENCES primaries(cid)
--         ON DELETE SET DEFAULT
-- );

-- INSERT INTO set_default
-- VALUES (4),(5),(6);

-- SELECT * FROM set_default;

-- DELETE FROM primaries WHERE cid = 5;

-- SELECT * FROM set_default;