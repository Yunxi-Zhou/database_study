CREATE TABLE students
(
    sid INT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    year INT NOT NULL
);

INSERT INTO students
VALUES (1,'Alicia',2020),
        (3,'Celeste',2018),
        (4,'Dafni',2019);

SELECT * FROM students;