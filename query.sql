SELECT DISTINCT c.name, total_investment, imports
  FROM economies AS e
    LEFT JOIN countries AS c
        ON (e.code = c.code
        AND e.code IN (
          SELECT code
          FROM languages AS l
          WHERE official = 'true'
        ) )
  WHERE region = 'Central America' AND year = 2002
ORDER BY c.name;




SELECT region, continent, AVG(p.fertility_rate) AS avg_fert_rate
  FROM countries AS c
    INNER JOIN populations AS p
      ON c.code = p.country_code
  WHERE year = 2019
GROUP BY region, continent
ORDER BY avg_fert_rate;


-- Select fields
SELECT name, country_code, city_proper_pop, metroarea_pop,  
      -- Calculate city_perc
      metroarea_pop / city_proper_pop * 100 AS city_perc
  -- From appropriate table
  FROM cities
  -- Where 
  WHERE name IN
    -- Subquery
    (SELECT capital
     FROM countries
     WHERE (region = 'Europe'
        OR region LIKE '%America'))
       AND metroarea_pop IS NOT NULL
-- Order appropriately
ORDER BY city_perc DESC
-- Limit amount
LIMIT 11;


SELECT
	-- Select country name and the count match IDs
    name AS country_name,
    COUNT(sub.id) AS matches
FROM country AS c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT id, country_id 
           FROM match
           -- Filter the subquery by matches with 10+ goals
           WHERE (away_goal + home_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;
