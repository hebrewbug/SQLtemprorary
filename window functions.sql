
  -- Assign numbers to each row
SELECT
  *,
  ROW_NUMBER() OVER () AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;


-- Assign the lowest numbers to the most recent years
SELECT
  Year,
  ROW_NUMBER() OVER (ORDER BY year desc) AS Row_N
FROM (
  SELECT DISTINCT Year
  FROM Summer_Medals
) AS Years
ORDER BY Year;

