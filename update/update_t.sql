-- UPDATE reviews SET quality = 0 WHERE rid = 3;
-- SELECT * FROM reviews;
-- UPDATE reviews SET quality = 10 WHERE rid = 3;

-- UPDATE reviews SET quality = quality + 1 WHERE rid = 2;
-- SELECT * FROM reviews;
-- UPDATE reviews SET quality = quality - 1 WHERE rid = 2;

-- UPDATE reviews 
-- SET quality = @temp := quality,
--     quality = originality,
--     originality = @temp;
-- SELECT * FROM reviews;
-- UPDATE reviews 
-- SET originality = @temp := originality,
--     originality = quality,
--     quality = @temp;
-- SELECT * FROM reviews;

