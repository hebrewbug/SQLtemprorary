SELECT DISTINCT c.name, total_investment, imports
  FROM economies AS e
    LEFT JOIN countries AS c
        ON (e.code = c.code
        AND e.code IN (
          SELECT code
          FROM languages AS l
          WHERE official = 'true'
        ) )
  WHERE region = 'Central America' AND year = 2015
ORDER BY c.name;
