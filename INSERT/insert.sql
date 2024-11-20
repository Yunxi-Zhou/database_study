-- 1. Inserting rows of data

-- INSERT INTO reviews
-- VALUES (1,1,6,7,'Great!'),
--         (1,2,9,3,'Amazing!'),
--         (2,1,4,9,'Perfect!'),
--         (2,3,10,10,'Superb!');
-- SELECT * FROM reviews

-- 2. Inserting rows of data with default values

-- INSERT INTO users(names)
-- VALUES ('Bo');
-- -- 2.1
-- INSERT INTO users(names,levels) VALUES('Celeste',15);
-- INSERT INTO users(names,levels,mail) VALUES('Alicia',9,'a@b.com');
-- INSERT INTO users(levels,names) VALUES(20,'Dafni');
-- SELECT * FROM users;
-- -- 2.2
-- INSERT INTO users VALUES(12,'Eva',13,'e@b.com');
-- -- Will not work, 'uid' must be generated
-- SELECT * FROM users;
-- 2.3
INSERT INTO users VALUES(17,'f@b.com');
-- Will not work,'name' has no default