CREATE TABLE productreview
(
    users VARCHAR(255) NOT NULL,
    product VARCHAR(255) NOT NULL,
    rating INT NOT NULL,
    PRIMARY KEY(users,product,rating)
);

INSERT INTO productreview
VALUES ('Alicia','cheese',10),
        ('Alicia','phone',5),
        ('Eva','cheese',9),
        ('Eva','shoe',8),
        ('Bo','phone',3),
        ('Celeste','cheese',7);

SELECT * FROM productreview;