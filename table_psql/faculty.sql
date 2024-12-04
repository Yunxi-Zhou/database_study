CREATE TABLE faculty
(
    fid INT NOT NULL,
    names TEXT NOT NULL,
    ranks TEXT NOT NULL,
    PRIMARY KEY(fid)
);

INSERT INTO faculty
VALUES (2, 'Bob', 'Assistant'),
        (3, 'Christy', 'Associate');

SELECT * FROM faculty;