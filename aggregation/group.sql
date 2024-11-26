-- 1. GROUP BY: Putting aggregation to good use
-- *** Reminder 
-- Aggregates operate on groups of rows <- entire table is one group

-- 1.1 Get the highest and lowest per product.
-- SELECT *  -- Invalid because no aggregation operation
-- FROM productreview
-- GROUP BY product;

SELECT product, MAX(rating), MIN(rating)
FROM productreview
GROUP BY product;
-- every row in a single aggregated group is the same product

-- 1.2 rating != 5
SELECT product, MAX(rating), MIN(rating)
FROM productreview
WHERE rating <> 5  -- Filters rows before grouping
GROUP BY product;