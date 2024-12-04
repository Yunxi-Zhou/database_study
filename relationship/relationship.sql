-- 1. The entity-relationship model: Relationships 

-- 1.1 many-to-many
CREATE TABLE enroll_in
(
    sid INT NOT NULL REFERENCES student(sid),
    cid INT NOT NULL REFERENCES courses(cid),
    year INT NOT NULL,
    PRIMARY KEY(sid,cid),
    CHECK(2020 <= year)
);
-- REFERENCES points to a column in another table: foreign key constraint.
-- The referenced columns must have a UNIQUE constraint
-- REFERENCES points to the primary key in another table

-- 2. Updating data and foreign key constraint

-- 2.1 INSERT
INSERT INTO courses
VALUES (5,'Database Theory');  -- Nothing get invalidated

-- 2.2 UPDATE
UPDATE courses SET cid = 5
WHERE title = 'Databases';
-- If the key changes, the row in 'enroll_in' can be invalidated

-- 2.3 DELETE
DELETE FROM courses WHERE cid = 1;
-- If a row is deleted, then rows in enroll_in can be invalidated.

-- 2.4 INSERT
INSERT INTO enroll_in
VALUES (3,6,2021);
-- Is only valid for the inserted 'cid' exists (cid = 6 does not exist)

-- 2.5 UPDATE (not exists)
UPDATE enroll_in SET cid = 6
WHERE sid = 1 AND year = 2020;
-- Is only valid for 'cid' exists

-- 2.6 DELETE from enroll_in
DELETE FROM enroll_in 
WHERE cid = 1 AND sid = 3;
-- Nothing gets invalidated

-- 3. Non-default actions: ON UPDATE action ON DELETE action

-- 3.1 NO ACTION
-- NO ACTION: reject all invalidating changes(default).
CREATE TABLE no_action
(
    cid INT NOT NULL REFERENCES courses(cid),
    PRIMARY KEY(cid)
);

-- 3.2 RESTRICT
-- RESTRICT: reject all changes to foreign key columns in referenced rows
CREATE TABLE restrict
(
    cid INT NOT NULL REFERENCES courses(cid)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    PRIMARY KEY(cid)
);

-- 3.3 CASCADE
-- apply the same changes to the foreign key
CREATE TABLE cascade
(
    cid INT NOT NULL REFERENCES primaries(cid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3.3 SET NULL
-- set the foreign key to NULL
CREATE TABLE set_null
(
    cid INT REFERENCES primaries(cid)
        ON DELETE SET NULL
        ON UPDATE SET NULL
);

-- 3.4 SET DEFAULT
-- set the foreign key to the default value(of that column)
CREATE TABLE set_default
(
    cid INT DEFAULT 0 REFERENCES primaries(cid)
        ON DELETE SET DEFAULT
        ON UPDATE SET DEFAULT
);