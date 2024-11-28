-- 1. Basic entities on tables

-- 1.1
CREATE TABLE student
(
    sid INT PRIMARY KEY,
    birthdate DATE NOT NULL,
    names TEXT NOT NULL
);
-- PRIMARY KEY implies NOT NULL and UNIQUE

-- 1.2 
CREATE TABLE student
(
    sid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    birthdate DATE NOT NULL,
    name TEXT NOT NULL
);
-- Some DBMSs prefer or require NOT NULL

-- 2. Primary key constraints
-- student: sid INT PRIMARY KEY

-- 2.1 INSERT INTO
INSERT INTO student (name, birthdate)
VALUES ('Bo','2000-06-17');
-- The chosen primary key must be unique and not NULL (case: not automatically generated)

-- 2.2 UPDATE
ALTER TABLE student ALTER COLUMN sid DROP IDENTITY;
UPDATE student SET sid = 5 
WHERE name = 'Bo' AND birthdate = '2000-06-17';
ALTER TABLE student ALTER COLUMN sid ADD GENERATED ALWAYS AS IDENTITY;

-- 2.3 DELETE
DELETE FROM student WHERE sid = 1;
-- Noting gets invalidated
-- SQL: All changes that invalidate a primary key constraint will be rejected