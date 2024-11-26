-- 1. Nested queries and ANY

-- 1.1 (= ANY) 
-- Return the reviews with an originality score equal to a quality score.
SELECT pid, rid 
FROM reviews
WHERE originality = ANY ( -- = ANY: 'originality' must be IN L.
    SELECT quality -- The nested query gives a list L of all 'quality' scores
    FROM reviews
);
-- quality: [6,9,4,10] -> originality = ANY in quality -> [9,10] -> (2 1, 2 3)

-- 1.2 (> ANY) 
-- Return the reviews with an originality score larger than the minimum quality score.
SELECT pid, rid 
FROM reviews
WHERE originality > ANY ( -- = ANY: 'originality' must be more than min(L).
    SELECT quality -- The nested query gives a list L of all 'quality' scores
    FROM reviews
);
-- quality: [6,9,4,10] -> originality > ANY in quality -> [7, 9, 10]

-- 1.3 (<> ANY) 
-- Return the reviews with an originality score different from a quality score.
SELECT pid, rid 
FROM reviews
WHERE originality <> ANY ( -- = ANY: a different value must be in L.
    SELECT quality -- The nested query gives a list L of all 'quality' scores
    FROM reviews
);
-- quality: [6,9,4,10] -> originality != ANY in quality -> [7,3,9,10]