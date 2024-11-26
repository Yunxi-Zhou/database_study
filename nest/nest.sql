-- 1. Nesting nested queries

-- let from A to B == A -> B or B <- A
-- 1.1 Eva
SELECT fromA FROM friendof
WHERE toB = "Frieda";

-- 1.2 (Celesta, Dafni)
SELECT fromA FROM friendof
WHERE toB IN (
    SELECT fromA FROM friendof
    WHERE toB = 'Frieda');
    -- 1.2.1 Frieda <- Eva <- Celesta
    -- 1.2.2 Frieda <- Eva <- Dafni

-- 1.3 (Bo, Dafni, Alicia)
SELECT fromA FROM friendof
WHERE toB IN (
    SELECT fromA FROM friendof
    WHERE toB IN (
        SELECT fromA FROM friendof
        WHERE toB = "Frieda"));
    -- 1.3.1 Frieda <- Eva <- Celesta <- Bo
    -- 1.3.2 Frieda <- Eva <- Celesta <- Dafni
    -- 1.3.3 Frieda <- Eva <- Dafni <- Alicia

-- 1.4 (Alicia)
SELECT fromA FROM friendof
WHERE toB IN (
    SELECT fromA FROM friendof
    WHERE toB IN (
        SELECT fromA FROM friendof
        WHERE toB IN (
            SELECT fromA FROM friendof
            WHERE toB = "Frieda")));
    -- 1.4.1 Frieda <- Eva <- Celeste <- Bo <- Alicia
    -- 1.4.2 Frieda <- Eva <- Celeste <- Dafni <- Alicia

-- 2. Nested queries and ALL
-- 2.1 Return the primary keys of reviews with the highest originality score
SELECT pid, rid
FROM reviews
WHERE originality >= ALL (  -- >= ALL: 'originality' must be max(L).
    SELECT originality -- The nested query gives a list L of all 'originality' scores
    FROM reviews); 

-- 2.2 Return the primary keys of reviews with an originality score 
-- lower than any quality score
SELECT pid, rid
FROM reviews
WHERE originality < ALL (  -- < ALL: 'originality' must be less than min(L)
    SELECT quality -- The nested query gives a list L of all 'quality' scores
    FROM reviews); 
    -- < ALL: min(quality) = 4 -> select originality < 4 -> originality = 3 < 4: output (1,2)

-- 2.3 Return the primary keys of reviews with an originality score
-- that is not a quality score
SELECT pid, rid
FROM reviews
WHERE originality <> ALL (  -- <> ALL: 'originality' must be NOT IN L.
    SELECT quality  -- The nested query gives a list L of all 'quality' scores
    FROM reviews);

-- 3. Correlated nested queries
-- 3.1 Return the primary keys of its reviews with the highest originality score
SELECT pid, rid
FROM reviews AS ra  -- Give the two 'reviews' different names
WHERE originality >= ALL (
    SELECT originality
    FROM reviews AS rb);  -- Give the two 'reviews' different names

-- 3.2 AS is always optional
SELECT pid, rid
FROM reviews ra  -- Give the two 'reviews' different names
WHERE originality >= ALL (
    SELECT originality
    FROM reviews AS rb);  -- Give the two 'reviews' different names

-- 3.3 Only 'originality' scores of this reviewer
SELECT pid, rid
FROM reviews AS ra
WHERE originality >= ALL (
    SELECT originality
    FROM reviews AS rb
    WHERE ra.rid = rb.rid);
    -- 3.3.1 rid = 1 -> originality: [7,9] -> max [7,9] = 9 -> [2,1]
    -- 3.3.2 rid = 2 -> originality: [3] -> max [3] = 3 -> [1,2]
    -- 3.3.3 rid = 3 -> originality: [10] -> max [10] = 10 -> [2,3]

-- 4. Nesting correlated nested queries

-- 4.1 (Eva)
SELECT fromA FROM friendof2 F
WHERE toB = fromA;
    -- 4.1.1 from Eva to Eva

-- 4.2 (Alicia, Dafni, Eva)
SELECT fromA FROM friendof2 F 
WHERE toB IN (
    SELECT fromA FROM friendof2
    WHERE toB = F.fromA);
    -- F.toB IN fromA WHERE condition of fromA: toB = F.fromA
    -- i.e toB = F.fromA -> F.toB = fromA
    -- 4.2.1 toB:Alicia = F.fromA:Alicia -> F.toB:Dafni = fromA: Dafni
    -- 4.2.2 toB:Dafni = F.fromA:Dafni -> F.toB:Alicia = fromA: Alicia
    -- 4.2.3 toB:Eva = F.fromA:Eva -> F.toB:Eva = fromA: Eva
-- 4.3 (Eva)
SELECT fromA FROM friendof2 F
WHERE toB IN (
    SELECT fromA FROM friendof2
    WHERE toB IN (
        SELECT fromA FROM friendof2
        WHERE toB = F.fromA));
    -- step 1: 4.2 -> fromA:(Alicia, Dafni, Eva)
    -- step 2: 4.1 -> fromA:(Eva)
-- 4.4 (Alicia Bo Celeste Eva Frieda Dafni)
SELECT fromA FROM friendof2 F
WHERE toB IN (
    SELECT fromA FROM friendof2 
    WHERE toB IN (
        SELECT fromA FROM friendof2 
        WHERE toB IN (
            SELECT fromA FROM friendof2
            WHERE toB = F.fromA)));
    -- fromA1 -> toB1(fromA2) -> toB2(fromA3) -> toB3(fromA4 where toB4 = fromA1 -> fromA1)
    -- 4.4.1 Alicia
    -- 4.4.2 Dafni
    -- 4.4.3 Eva
    -- 4.4.4 Bo F -> Celeste F2 -> Eva F3 -> Frieda F4 (F4.toB = F.fromA = Bo)
    -- 4.4.5 Celeste F -> Eva F2 -> Eva F3 -> Frieda F4
    -- 4.4.6 Frieda F -> Bo F2 -> Celeste F3 -> Eva F4 (F4.toB = F.fromA = Frieda)
-- 4.5 (Bo Celeste Eva Frieda)
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
            AND F3.fromA <> F4.fromA
        )
    )
);
    -- 4.5.1 Bo -> Celeste -> Eva -> Frieda (F4.toB = F.fromA = Bo)
    -- 4.5.2 Celeste -> Eva -> Frieda -> Bo (F4.toB = F.fromA = Celeste)
    -- 4.5.3 Eva -> Frieda -> Bo -> Celeste (F4.toB = F.fromA = Eva)
    -- 4.5.4 Frieda -> Bo -> Celeste -> Eva (F4.toB = F.fromA = Frieda)
-- 4.6 (Bo Celeste Eva Frieda)
SELECT F.fromA, F2.fromA, F3.fromA, F4.fromA
FROM friendof2 F, friendof2 F2, friendof2 F3, friendof2 F4
WHERE F.toB = F2.fromA
AND F2.toB = F3.fromA
AND F3.toB = F4.fromA
AND F4.toB = F.fromA
AND F.fromA <> F2.fromA
AND F.fromA <> F3.fromA
AND F.fromA <> F4.fromA
AND F2.fromA <> F3.fromA
AND F2.fromA <> F4.fromA
AND F3.fromA <> F4.fromA;