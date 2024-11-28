-- CREATE TABLE student
-- (
--     sid INT PRIMARY KEY,
--     birthdate DATE NOT NULL,
--     names TEXT NOT NULL
-- );

-- SELECT * FROM student;

-- DROP TABLE student;
-- SELECT * FROM student;

-- CREATE TABLE student
-- (
--     sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     birthdate DATE NOT NULL,
--     name TEXT NOT NULL
-- );

-- SELECT * FROM student;

-- DROP TABLE student;
-- SELECT * FROM student;

-- DROP TABLE IF EXISTS student;

-- CREATE TABLE student
-- (
--     sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name TEXT NOT NULL,
--     birthdate DATE NOT NULL
-- );

-- INSERT INTO student (name, birthdate)
-- VALUES ('Alicia','2000-07-04'),
--         ('Celeste','1999-12-12'),
--         ('Dafni','2001-04-17');

-- INSERT INTO student (name, birthdate)
-- VALUES ('Bo','2000-06-17');

-- ALTER TABLE student ALTER COLUMN sid DROP IDENTITY;
-- UPDATE student SET sid = 5 
-- WHERE name = 'Bo' AND birthdate = '2000-06-17';
-- ALTER TABLE student ALTER COLUMN sid ADD GENERATED ALWAYS AS IDENTITY;

-- DELETE FROM student WHERE sid = 1;

-- ALTER TABLE student ALTER COLUMN sid DROP IDENTITY;
-- INSERT INTO student
-- VALUES (1,'Alicia','2000-07-04');
-- ALTER TABLE student ALTER COLUMN sid ADD GENERATED ALWAYS AS IDENTITY;



SELECT * FROM student ORDER BY sid;