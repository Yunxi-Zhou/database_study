-- 1. Create a normal table

-- CREATE TABLE reviews
-- (
    -- pid INT NOT NULL,
    -- rid INT NOT NULL,
    -- quality INT NOT NULL,
    -- originality INT NOT NULL,
    -- description TEXT NOT NULL,
    -- PRIMARY KEY(pid, rid)
-- );
-- SELECT * FROM reviews;

-- CREATE TABLE reviewswn
-- (
--     pid INT NOT NULL,
--     rid INT NOT NULL,
--     quality INT,  -- Might not have values
--     originality INT,
--     description TEXT NOT NULL,
--     PRIMARY KEY(pid, rid)
-- );
-- SELECT * FROM reviewswn

-- 2. Creating a table with default values

-- CREATE TABLE users
-- (
--     -- uid INT GENERATED ALWAYS AS IDENTITY, -- An identifier is generated automatically
--     uid INT AUTO_INCREMENT PRIMARY KEY, 
--                             -- The primary key consist of a single column
--     names VARCHAR(100) NOT NULL, -- A small amount of text (up-to-100 characters)
--     levels INT NOT NULL DEFAULT 13, -- A default value of 13
--     mail VARCHAR(100) -- The default is the value NULL
-- );
-- SELECT * FROM users