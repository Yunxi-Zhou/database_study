-- SELECT * FROM reviews;

-- SELECT pid, rid
-- FROM reviews
-- WHERE quality > 8;

-- SELECT pid, rid
-- FROM reviews
-- WHERE quality > 8 AND originality > 8;

-- SELECT pid, rid
-- FROM reviews
-- WHERE quality > 8 OR originality > 8;

-- SELECT pid, rid
-- FROM reviews
-- WHERE NOT(quality > 8 OR originality > 8);

-- SELECT pid, rid
-- FROM reviews
-- WHERE NOT(quality > 8) AND NOT(originality > 8);

-- SELECT pid, rid 
-- FROM reviews
-- WHERE quality <> 10;

-- INSERT INTO reviewswn
-- VALUES (1,1,6,7,'Great!'),
--         (1,2,NULL,NULL,'Amazing!'),
--         (2,1,NULL,9,'Perfect!'),
--         (2,3,10,NULL,'Superb!');
-- SELECT * FROM reviewswn;

-- SELECT pid, rid, quality + originality AS x
-- FROM reviewswn
-- WHERE quality > 8 OR originality > 8;

SELECT * FROM reviewswn;