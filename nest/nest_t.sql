-- SELECT * FROM friendof

-- INSERT INTO friendof
-- VALUES ("Alicia", "Bo"),
--         ("Alicia", "Dafni"),
--         ("Bo", "Celeste"),
--         ("Dafni","Celeste"),
--         ("Celeste", "Eva"),
--         ("Eva", "Frieda");

-- SELECT * FROM friendof

-- SELECT fromA FROM friendof
-- WHERE toB = "Frieda";

-- INSERT INTO friendof
-- VALUES ("Dafni", "Eva");

-- SELECT * FROM friendof;

-- SELECT fromA FROM friendof
-- WHERE toB IN (
--     SELECT fromA FROM friendof
--     WHERE toB = 'Frieda');

-- SELECT fromA FROM friendof
-- WHERE toB IN (
--     SELECT fromA FROM friendof
--     WHERE toB IN (
--         SELECT fromA FROM friendof
--         WHERE toB = "Frieda"));

-- SELECT fromA FROM friendof
-- WHERE toB IN (
--     SELECT fromA FROM friendof
--     WHERE toB IN (
--         SELECT fromA FROM friendof
--         WHERE toB IN (
--             SELECT fromA FROM friendof
--             WHERE toB = "Frieda")));

-- SELECT * FROM reviews;

-- SELECT pid, rid
-- FROM reviews
-- WHERE originality >= ALL (
--     SELECT originality
--     FROM reviews); 

-- SELECT pid, rid
-- FROM reviews
-- WHERE originality < ALL (
--     SELECT quality
--     FROM reviews); 

-- SELECT pid, rid
-- FROM reviews
-- WHERE originality <> ALL (
--     SELECT quality 
--     FROM reviews);

-- SELECT pid, rid
-- FROM reviews AS ra  
-- WHERE originality >= ALL (
--     SELECT originality
--     FROM reviews AS rb);

-- SELECT pid, rid
-- FROM reviews ra
-- WHERE originality >= ALL (
--     SELECT originality
--     FROM reviews AS rb);

-- SELECT pid, rid
-- FROM reviews AS ra
-- WHERE originality >= ALL (
--     SELECT originality
--     FROM reviews AS rb
--     WHERE ra.rid = rb.rid);

-- SELECT * FROM reviews

-- INSERT INTO friendof2
-- VALUES ("Alicia","Bo"),
--         ("Alicia","Dafni"),
--         ("Dafni","Alicia"),
--         ("Bo","Celeste"),
--         ("Dafni","Celeste"),
--         ("Celeste","Eva"),
--         ("Dafni","Eva"),
--         ("Eva","Eva"),
--         ("Eva","Frieda"),
--         ("Frida","Bo");

-- SELECT * FROM friendof2

-- SELECT fromA FROM friendof2 F
-- WHERE toB = fromA;

-- SELECT fromA FROM friendof2 F 
-- WHERE toB IN (
--     SELECT fromA FROM friendof2
--     WHERE toB = F.fromA);

-- SELECT fromA FROM friendof2 F
-- WHERE toB IN (
--     SELECT fromA FROM friendof2
--     WHERE toB IN (
--         SELECT fromA FROM friendof2
--         WHERE toB = F.fromA));

-- SELECT fromA FROM friendof2 F
-- WHERE toB IN (
--     SELECT fromA FROM friendof2 
--     WHERE toB IN (
--         SELECT fromA FROM friendof2 
--         WHERE toB IN (
--             SELECT fromA FROM friendof2
--             WHERE toB = F.fromA)));

SELECT fromA FROM friendof2 F
WHERE toB IN (
    SELECT fromA FROM friendof2 F2
    WHERE toB IN (
        SELECT fromA FROM friendof2 F3
        WHERE toB IN (
            SELECT fromA FROM friendof2 F4
            WHERE toB = F.fromA
            AND F.fromA <> F2.fromA
            AND F.fromA <> F3.fromA
            AND F.fromA <> F4.fromA
            AND F2.fromA <> F3.fromA
            AND F2.fromA <> F4.fromA
            AND F3.fromA <> F4.fromA)));

