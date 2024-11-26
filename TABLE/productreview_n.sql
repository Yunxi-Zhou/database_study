USE mysql;

CREATE TABLE productreview_n (
    user VARCHAR(255) NOT NULL,
    product VARCHAR(255) NOT NULL,
    rating INT,
    PRIMARY KEY(user, product)
);

INSERT INTO productreview_n 
VALUES ("Alicia", "cheese", 10),
        ("Alicia", "phone", 5),
        ("Eva", "cheese", NULL),
        ("Eva", "shoe", 8),
        ("Bo", "phone", NULL),
        ("Bo", "shoe", 5),
        ("Celeste", "cheese", 7);

SELECT * FROM productreview_n;