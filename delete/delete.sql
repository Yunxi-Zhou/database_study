-- 1. Deleting rows of data
-- 1.1
DELETE FROM reviews WHERE rid = 3;
-- 1.2
DELETE FROM reviews WHERE pid = rid;
-- 1.3 Deleting all data
DELETE FROM reviews;
