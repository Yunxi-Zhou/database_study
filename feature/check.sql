-- 1. Views: Shorthands for SELECT queries
-- Views can be used to define shorthands:
-- Views act like tables, but are defined by a SELECT statement:

CREATE VIEW viewname
AS SELECT query;

-- Simple views are typically updatable(INSERT, UPDATE, DELETE work properly)

-- 2. Multi-table constraints via CHECK
-- 2.1 A pet dog is not a pet snake
CREATE TABLE dog
(
    did INT NOT NULL PRIMARY KEY,
    CHECK(did NOT IN (
        SELECT sid FROM snake
    ))
);

CREATE TABLE snake
(
    sid INT NOT NULL PRIMARY KEY,
    CHECK(sid NOT IN (
        SELECT did FROM dog
    ))
);

-- CHECKs in table x are only evaluated when values are inserted or updated in x
-- CHECKs are not evaluated when values are deleted (not a problem in this example)
-- Not supported by most DBSMs