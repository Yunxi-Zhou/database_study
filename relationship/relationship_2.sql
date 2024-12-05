-- 1. The entity-relationship model: Relationships

-- 1.1 strict-one-to-many
CREATE TABLE student
(
    sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    birthdate DATE NOT NULL,
    name TEXT NOT NULL,
    supervisor INT NOT NULL REFERENCES faculty(fid)
);

-- 1.2 one-to-many
CREATE TABLE student
(
    sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    birthdate DATE NOT NULL,
    name TEXT NOT NULL,
    supervisor INT REFERENCES faculty(fid)
);
-- 1.2.1 An important use case for outer joins
SELECT * FROM student LEFT JOIN faculty ON supervisor = fid;

-- 1.3 one-to-one
CREATE TABLE student
(
    sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    birthdate DATE NOT NULL,
    name TEXT NOT NULL,
    supervisor INT UNIQUE REFERENCES faculty(fid)
);
-- UNIQUE guarantees that each non-NULL value only occurs once in a column

-- 2. Weak entities
-- step 1: The entity Program
-- Program(prefix(pk):VARCHAR(10), type:VARCHAR(3))
CREATE TABLE program
(
    prefix VARCHAR(10) PRIMARY KEY,
    type VARCHAR(3) NOT NULL,
    CHECK(type = 'BSc' OR type = 'MSc' OR type = 'phD')
);

-- step 2: The weak entity Course and identifying relationship Part_Of
-- Course(prefix(pk):VARCHAR(10),code(pk):VARCHAR(4),year:INT)
-- Prefix is a foreign key pointing to the primary key in 'Program'
CREATE TABLE course
(
    prefix VARCHAR(10) NOT NULL REFERENCES program(prefix),
    code VARCHAR(4) NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(prefix, code)
);

-- step 3: The weak entity Assignment and identifying relationship C_Assign
-- Assignment(prefix(pk):VARCHAR(10),code(pk):VARCHAR(4),number(pk):INT,file:BYTEA)
-- The pair(prefix, code) is a foreign key pointing to the primary key in 'Course'
CREATE TABLE assignment
(
    prefix VARCHAR(10) NOT NULL,
    code VARCHAR(4) NOT NULL,
    number INT NOT NULL,
    file BYTEA NOT NULL,
    FOREIGN KEY(prefix, code) REFERENCES course(prefix, code),
    PRIMARY KEY(prefix, code, number)
);