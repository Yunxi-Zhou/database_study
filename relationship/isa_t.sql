-- SELECT * FROM person;

-- CREATE TABLE person
-- (
--     uid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name TEXT NOT NULL
-- );

-- SELECT * FROM person;

-- CREATE TABLE student2
-- (
--     uid INT PRIMARY KEY REFERENCES person(uid),
--     generation INT NOT NULL
-- );

-- SELECT * FROM student2;

-- CREATE TABLE personnel
-- (
--     uid INT PRIMARY KEY REFERENCES person(uid),
--     salary DECIMAL NOT NULL
-- );

-- SELECT * FROM personnel;

-- DROP TABLE student2;
-- DROP TABLE personnel;
-- DROP TABLE person;