-- CREATE TABLE test
-- (
--     value INT NOT NULL,
--     stamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

-- INSERT INTO test (value)
-- VALUES (10),
--         (20),
--         (30);

SELECT 
    EXTRACT(YEAR FROM stamp) AS year,
    EXTRACT(SECOND FROM stamp) AS second
FROM test;