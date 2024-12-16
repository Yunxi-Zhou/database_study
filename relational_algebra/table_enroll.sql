DROP TABLE enroll_in;

CREATE TABLE enroll_in
(
    sid INT NOT NULL REFERENCES students(sid),
    cid INT NOT NULL REFERENCES course(cid),
    year INT NOT NULL,
    PRIMARY KEY(sid,cid),
    CHECK(2020 <= year)
);

INSERT INTO enroll_in
VALUES (1,1,2021),
        (1,2,2020),
        (3,1,2020),
        (4,3,2020);

SELECT * FROM enroll_in;