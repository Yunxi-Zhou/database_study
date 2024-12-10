-- more complicated example

-- step 1: The entity Person
-- Person(username(pk):VARCHAR(20), number(pk):SMALLINT, regdate:TIMESTAMP)
CREATE TABLE person
(
    username VARCHAR(20) NOT NULL,
    number SMALLINT NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(username, number)
);

-- step 2: The weak entity and ISA hierarchy Pet

-- Pet(oname(pk):VARCHAR(20), onumber(pk):SMALLINT,
--     firstname(pk):VARCHAR(100), lastname(pk):VARCHAR(100),
--     birthdate:DATE, sname:VARCHAR(20)(OPT), snumber:SMALLINT(OPT))

-- The pair (oname, onumber) is a foreign key pointing to an owner (primary key in Person)
-- pet have at-most one seller, integrate this relationship
-- The pair (sname, snumber) is a foreign key pointing to a seller (primary key in Person)
CREATE TABLE pet
(
    oname VARCHAR(20) NOT NULL,
    onumber SMALLINT NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    sname VARCHAR(20),
    snumber SMALLINT,
    FOREIGN KEY(oname, onumber) REFERENCES person(username, number),
    FOREIGN KEY(sname, snumber) REFERENCES person(username, number),
    PRIMARY KEY(oname, onumber, firstname, lastname)
);

-- step 3: The relationship Play_Friend

-- Play_Friend(foname(pk):VARCHAR(20), fonumber(pk):SMALLINT,
--             ffname(pk):VARCHAR(100), flname(pk):VARCHAR(100),
--             toname(pk):VARCHAR(20), tonumber(pk):SMALLINT,
--             tfname(pk):VARCHAR(100), tlname(pk):VARCHAR(100),
--             since:DATE)

-- The tuple(foname, fonumber, ffname, flname) is a foreign key
-- pointing to the from-friend (primary key in Pet)

-- The tuple(toname, tonumber, tfname, tlname) is a foreign key
-- pointing to the to-friend(primary key in Pet)

CREATE TABLE play_friend
(
    foname VARCHAR(20) NOT NULL, fonumber SMALLINT NOT NULL,
    ffname VARCHAR(100) NOT NULL, flname VARCHAR(100) NOT NULL,
    toname VARCHAR(20) NOT NULL, tonumber SMALLINT NOT NULL,
    tfname VARCHAR(100) NOT NULL, tlname VARCHAR(100) NOT NULL,
    since DATE NOT NULL,
    FOREIGN KEY(foname, fonumber, ffname, flname)
                REFERENCES pet(oname, onumber, firstname, lastname),
    FOREIGN KEY(toname, tonumber, tfname, tlname)
                REFERENCES pet(oname, onumber, firstname, lastname),
    PRIMARY KEY(foname, fonumber, ffname, flname,
                toname, tonumber, tfname, tlname)
);

-- step 4: The entity Dog

-- Dog(oname(pk):VARCHAR(20), onumber(pk):SMALLINT,
--     firstname(pk):VARCHAR(100), lastname(pk):VARCHAR(100),
--     breed:VARCHAR(100))

-- The tuple (oname, onumber, firstname, lastname) is a foreign key
-- pointing to the pet entity this dog belongs to (primary key in Pet)

CREATE TABLE dog
(
    oname VARCHAR(20) NOT NULL,
    onumber SMALLINT NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    breed VARCHAR(100) NOT NULL,
    FOREIGN KEY(oname, onumber, firstname, lastname)
                REFERENCES pet(oname, onumber, firstname, lastname),
    PRIMARY KEY(oname, onumber, firstname, lastname)
);

-- step 5: The entity Snake

-- Snake(oname(pk):VARCHAR(20), onumber(pk):SMALLINT,
--     firstname(pk):VARCHAR(100), lastname(pk):VARCHAR(100),
--     venom:BOOLEAN)

-- The tuple(oname, onumber, firstname, lastname) is a foreign key
-- pointing to the pet entity this dog belongs to (primary key in Pet)

CREATE TABLE snake
(
    oname VARCHAR(20) NOT NULL,
    onumber SMALLINT NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    venom BOOLEAN NOT NULL,
    FOREIGN KEY(oname, onumber, firstname, lastname)
                REFERENCES pet(oname, onumber, firstname, lastname),
    PRIMARY KEY(oname, onumber, firstname, lastname)
);

-- step 6: The relationship Barked_At

-- Barked_At(doname(pk):VARCHAR(20),donumber(pk):SMALLINT,
--         dfname(pk):VARCHAR(100), dlname(pk):VARCHAR(100),
--         soname(pk):VARCHAR(20), sonumber(pk):SMALLINT,
--         sfname(pk):VARCHAR(100), slname(pk):VARCHAR(100))

-- The tuple(doname, donumber, dfname, dlname) is a foreign key
-- pointing to the dog that barked (primary key in Dog)

-- The tuple(soname, sonumber, sfname, slname) is a foreign key
-- pointing to the snake that got barked at(primary key in Snake)

CREATE TABLE barked_at
(
    doname VARCHAR(20) NOT NULL, donumber SMALLINT NOT NULL,
    dfname VARCHAR(100) NOT NULL, dlname VARCHAR(100) NOT NULL,
    soname VARCHAR(20) NOT NULL, sonumber SMALLINT NOT NULL,
    sfname VARCHAR(100) NOT NULL, slname VARCHAR(100) NOT NULL,
    FOREIGN KEY(doname, donumber, dfname, dlname)
                REFERENCES dog(oname, onumber, firstname, lastname),
    FOREIGN KEY(soname, sonumber, sfname, slname)
                REFERENCES snake(oname, onumber, firstname, lastname),
    PRIMARY KEY(doname, donumber, dfname, dlname,
                soname, sonumber, sfname, slname)
);

-- PRIMARY KEY each row has a unique not-NULL value in this column.
-- Typically used to identify the row

-- UNIQUE each row with a not-NULL value has a unique this column.
-- If also NOT NULL: a candidate key

-- REFERENCES each not-NULL value in this column points to a unique value in a column.

-- These foreign keys are important when representing relationships.
-- CHECK additional conditions on the value in the column.
-- Ofen used to express domain constraints.