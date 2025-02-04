--The Inner Joins selects all rows/records from both participating tables as long as there is a match between the columns.
--Left join keyword returns all records from the left table, and the matched records from the right table.
--Result is NULL from the right side,if there is no match.
--Right join keyword returns all records from the right table, and the matched records from the left table.

SELECT
  m.year,
  m.country_name as country,
  m.midyear_population as population,
  a.country_area as area
FROM
  `bigquery-public-data.census_bureau_international.midyear_population` m
LEFT JOIN
  `bigquery-public-data.census_bureau_international.country_names_area` a
ON m.country_code = a.country_code
ORDER BY
  year,country 

--JOINING TABLES WITH DUPLICATE RECORDS LEADS TO DUPLICATE RESULTS
SELECT
  z.zone_id,
  z.zone_name,
  z.borough,
  t.pickup_location_id,
  t.pickup_datetime,
  t.dropoff_datetime
FROM 
  `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom` z
JOIN 
  `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` t
ON z.zone_id = t.pickup_location_id 
LIMIT 100

--TRIMMING AND LOWERING WHEN JOINING ON COLUMNS OF TYPE STRING
--TRIM() function removes the space character OR other specified characters from the start or end of a string.
SELECT
  species_common_name,
  form,
  fall_color,
  COUNT(DISTINCT tree_id) as num_tree
FROM 
  `bigquery-public-data.new_york_trees.tree_species` s
LEFT JOIN
  `bigquery-public-data.new_york_trees.tree_census_2015` t
ON
  trim(lower(s.species_common_name)) = trim(lower(t.spc_common))
GROUP BY
  species_common_name,
  form,
  fall_color

--JOINING WITH MULTIPLE TABLES
SELECT
  a.country_code,
  a.country_name,
  a.country_area,
  p.year,
  p.midyear_population AS population,
  b.crude_birth_rate,
  b.crude_death_rate, 
  b.growth_rate,
  b.net_migration
FROM
  `bigquery-public-data.census_bureau_international.country_names_area` a
LEFT JOIN
  `bigquery-public-data.census_bureau_international.midyear_population` p
ON 
  a.country_code = p.country_code
LEFT JOIN 
  `bigquery-public-data.census_bureau_international.birth_death_growth_rates` b
ON 
  p.country_code = b.country_code AND p.year = b.year
LIMIT 1000
