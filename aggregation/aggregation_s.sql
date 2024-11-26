-- Structure of aggregated queries
SELECT aggregated output columns
FROM sources
WHERE row conditions  -- Filter rows before grouping
GROUP BY columns to group rows on
HAVING conditions on aggregated groups;