USE mysql;

CREATE TABLE students
(
    cid INT NOT NULL,
    names TEXT NOT NULL,
    years INT NOT NULL,
    PRIMARY KEY(cid)
);