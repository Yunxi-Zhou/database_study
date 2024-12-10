-- 1. Multi-table constraints via ASSERTIONs
-- 1.1 A pet dog is not a pet snake
CREATE ASSERTION dogsnake
CHECK NOT EXISTS (
    SELECT did FROM dog
    INTERSECT
    SELECT sid FROM snake
);

-- ASSERTIONs are conditions that must always hold -->
-- powerful tool for expressing multi-table constraints

