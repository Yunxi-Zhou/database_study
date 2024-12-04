CREATE TABLE dish
(
    did INT PRIMARY KEY,
    creator INT NOT NULL REFERENCES person(pid)
);

CREATE TABLE person
(
    pid INT PRIMARY KEY,
    favdish INT NOT NULL REFERENCES dish(did)
);

CREATE TABLE tree
(
    node_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label VARCHAR(20) NOT NULL,
    parent INT REFERENCES tree(node_id)
);

-- This table can store tree nodes(as part of a tree structure).
-- Each node can refer to a parent node(in the same table).