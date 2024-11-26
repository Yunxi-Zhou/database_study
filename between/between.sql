-- BETWEEN 
-- Returns those reviews with an originality score between 7 and 9
SELECT pid, rid
FROM reviews
WHERE originality BETWEEN 7 AND 9;
-- Equivalent to 7 <= originality AND originality <= 9.