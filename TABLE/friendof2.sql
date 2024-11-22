USE mysql;

CREATE TABLE friendof2
(
    fromA VARCHAR(255) NOT NULL,
    toB VARCHAR(255) NOT NULL,
    PRIMARY KEY(fromA,toB)
);

SELECT * FROM friendof2