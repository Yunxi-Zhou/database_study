USE mysql;

CREATE TABLE courses
(
    cid INT NOT NULL,
    title TEXT NOT NULL,
    lecturer INT NOT NULL,
    PRIMARY KEY(cid)
);