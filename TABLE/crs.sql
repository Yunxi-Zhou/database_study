USE mysql;

CREATE TABLE courses2 (
    cid INT NOT NULL,
    title TEXT NOT NULL,
    PRIMARY KEY(cid)
);

INSERT INTO courses2
VALUES (1,"Programming"),
        (2,"D.Mathematics"),
        (3,"Databases");

SELECT * FROM courses2