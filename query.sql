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
