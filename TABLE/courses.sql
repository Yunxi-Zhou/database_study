USE mysql;

CREATE TABLE courses
(
    cid INT NOT NULL,
    tile TEXT NOT NULL,
    lecturer INT NOT NULL,
    PRIMARY KEY(cid)
);