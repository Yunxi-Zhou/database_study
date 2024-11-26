USE mysql;

CREATE TABLE instructors (
    cid INT NOT NULL,
    names TEXT NOT NULL,
    PRIMARY KEY(cid)
);

INSERT INTO instructors
VALUES (2,"Eva"),
        (3,"Alicia"),
        (4,"Bo");

SELECT * FROM instructors