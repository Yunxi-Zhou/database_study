CREATE TABLE course
(
    cid INT NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    lecturer INT NOT NULL
);

INSERT INTO course
VALUES (1,'Programming',1),
        (2,'Discrete Mathematics',3),
        (3,'Databases',2),
        (4,'Advanced Databases',2);

SELECT * FROM course;