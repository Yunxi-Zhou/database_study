-- SELECT * FROM reviews

-- SELECT pid, rid 
-- FROM reviews
-- WHERE originality = ANY (
--     SELECT quality
--     FROM reviews
-- );

-- SELECT pid, rid 
-- FROM reviews
-- WHERE originality > ANY (
--     SELECT quality
--     FROM reviews
-- );

SELECT pid, rid 
FROM reviews
WHERE originality <> ANY (
    SELECT quality
    FROM reviews
);
