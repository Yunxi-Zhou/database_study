-- Extension: aggregation
-- Syntax of the aggregation operators
-- 𝛾group-by columns, aggregated columns(expression e)

-- 1. 𝛾product,m:=max(rating),n:=min(rating) (productreview)
SELECT product,
        MAX(rating) AS m,
        MIN(rating) AS n
FROM productreview
GROUP BY product;