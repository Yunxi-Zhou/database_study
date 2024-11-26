-- SELECT * FROM productreview;

-- SELECT *
-- FROM productreview
-- GROUP BY product;

-- SELECT product, MAX(rating), MIN(rating)
-- FROM productreview
-- GROUP BY product;

SELECT product, MAX(rating), MIN(rating)
FROM productreview
WHERE rating <> 5
GROUP BY product;