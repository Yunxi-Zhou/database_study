-- 1. updating rows of data
-- 1.1
UPDATE reviews SET quality = 0 WHERE rid = 3;
-- 1.2
UPDATE reviews SET quality = quality + 1 WHERE rid = 2;
-- 1.3
UPDATE reviews 
SET quality = @temp := quality,
    quality = originality,
    originality = @temp;
