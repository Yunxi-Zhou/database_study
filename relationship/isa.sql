-- 1. The entity-relationship model: ISA

-- ASSERTION can technically check these types of constraints
-- ASSERTIONs not supported

-- 2. ISAs and ER method

-- step 1: The entity Person in SQL
-- Person(uid(pk):INT, name: TEXT)
CREATE TABLE person
(
    uid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL
);

-- step 2: The entity Student
-- Student(uid(pk+fk):INT, generation:INT)
-- uid is a foreign key pointing to the primary key in Person.
CREATE TABLE student
(
    uid INT PRIMARY KEY REFERENCES person(uid),
    generation INT NOT NULL
);

-- step 3: The entity Personnel 
-- Personnel(uid(pk+fk):INT, salary:DECIMAL)
-- uid is a foreign key pointing to the primary key in Person
CREATE TABLE personnel
(
    uid INT PRIMARY KEY REFERENCES person(uid),
    salary DECIMAL NOT NULL
);

-- 3. ISAs and OO method

-- step 1: Determine the valid combinations
-- person are only student
-- person are only personnel
-- person are both students and personnel

-- step 2: Person that are only students
-- Student(uid(pk):INT, name:TEXT, generation:INT)
CREATE TABLE student
(
    uid INT PRIMARY KEY,
    name TEXT NOT NULL,
    generation INT NOT NULL
);

-- step 3: Person that are only personnel
-- Personnel(uid(pk):INT, name:TEXT, salary:DECIMAL)
CREATE TABLE personnel
(
    uid INT PRIMARY KEY,
    name TEXT NOT NULL,
    salary DECIMAL NOT NULL
);

-- step 4: Persons that are both students and personnel
-- StudentPersonnel(uid(pk):INT, name:TEXT, generation:INT, salary:DECIMAL)
CREATE TABLE student_personnel
(
    uid INT PRIMARY KEY, name TEXT NOT NULL,
    generation INT NOT NULL,
    salary DECIMAL NOT NULL
);

-- *** use different identifiers ***

-- ISAs and the NULL method

-- step 1: The entity person
-- Person(uid(pk):INT, name:TEXT, generation:INT(OPT), salary:DECIMAL(OPT))
CREATE TABLE person
(
    uid INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    generation INT, salary DECIMAL
);

