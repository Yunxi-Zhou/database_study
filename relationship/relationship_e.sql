-- 1. The entity-relationship model: aggregation

-- Passenger(fid(pk):INT, cid(pk):INT, approved: BOOLEAN)

-- fid is foreign key pointing to the primary key in Flight
-- cid is foreign key pointing to the primary key in Customer

CREATE TABLE flight
(
    fid INT NOT NULL PRIMARY KEY
);

CREATE TABLE customer
(
    cid INT NOT NULL PRIMARY KEY
);

CREATE TABLE airline
(
    lid INT NOT NULL PRIMARY KEY
);

-- step 1: The relationship Passenger in SQL
CREATE TABLE passenger
(
    fid INT NOT NULL REFERENCES flight(fid),
    cid INT NOT NULL REFERENCES customer(cid),
    approved BOOLEAN NOT NULL,
    PRIMARY KEY(fid,cid)
);

-- step 2: The relationship Provided in SQL
CREATE TABLE provided
(
    fid INT NOT NULL, cid INT NOT NULL,
    lid INT NOT NULL REFERENCES airline(lid),
    FOREIGN KEY(fid, cid) REFERENCES passenger(fid, cid),
    PRIMARY KEY(fid,cid,lid)
);

-- step 2.1: Every passenger has exactly one airline(providing a ticket)
-- Passenger(fid(pk):INT, cid(pk):INT, approved:BOOLEAN, lid:INT)
CREATE TABLE passenger
(
    fid INT NOT NULL REFERENCES flight(fid),
    cid INT NOT NULL REFERENCES customer(cid),
    approved BOOLEAN NOT NULL,
    lid INT NOT NULL REFERENCES airline(lid),
    PRIMARY KEY(fid, cid)
);