-- Intermission: Common data types in SQL

-- 1. Character string and binary string types

-- 1.1 character
CHAR(n) -- fixed-length string of n characters
VARCHAR(n) -- variable-length string of at-most n characters
TEXT -- large strings *** TEXT = CLOB ***

-- 1.2 binary
BINARY(n) -- fixed-length binary string of n characters
VARBINARY(n) -- variable-length binary string of at-most n characters
BYTEA -- large binary strings *** BYTEA = BLOB ***

-- Both TEXT and BYTEA are intended to store large objects, not to operate on them
-- E.g., cannot be primary keys, be joined on, or take part in UNION,....

-- 2. Exact and approximate numeric types

-- 2.1 exact
DECIMAL(p,s) -- exact number with p position before the comma and s after.
             -- Also: DECIMAL and DECIMAL(p)
SMALLINT -- fixed-width integer type.
INT -- larger fixed-width integer type
BIGINT -- largest fixed-width integer type.

REAL -- floating point type
DOUBLE -- larger floating point type.

-- 2.2 approximate
BOOLEAN -- Boolean type

-- 3 Date and time types

-- 3.1
DATE -- Date(no time of day)
TIME -- Time(no date)
TIMESTAMP -- Date and time information
INTERVAL -- Time interval(duration)
         -- Comes in year-month and in day-time flavor

-- 3.2 yield now
CURRENT_DATE
CURRENT_TIME
CURRENT_TIMESTAMP

-- 3.3 extract date information
YEAR
MONTH
DAY

-- 3.4 extract time information
HOUR
MINUTE
SECOND

-- 3.5 Example
CREATE TABLE test
(
    value INT NOT NULL,
    stamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO test (value)
VALUES (10),
        (20),
        (30);
SELECT 
    EXTRACT(YEAR FROM stamp) AS year,
    EXTRACT(SECOND FROM stamp) AS second
FROM test;
