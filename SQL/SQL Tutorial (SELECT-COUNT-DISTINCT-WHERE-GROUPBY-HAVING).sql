--SELECT AND COUNT AND DISTINCT
SELECT
count(*) as cnt,
count(gender) as gender_count,
count(distinct gender) as gender_distinct_count,
count(distinct state) as state_distinct_count,
count(*) as num_records,
count(name) as cnt
FROM
  `bigquery-public-data.usa_names.usa_1910_2013`

--DISTINCT WITH ORDER BY
SELECT
  DISTINCT state
FROM
  `bigquery-public-data.usa_names.usa_1910_current`
ORDER BY
  STATE desc

-- WHERE CLAUSE WITH CATEGORICAL VARIABLES
SELECT
  DISTINCT minor_category
FROM
  `bigquery-public-data.london_crime.crime_by_lsoa`
WHERE
minor_category LIKE '%Drug%'

-- WHERE CLAUSE WITH NUMERIC VARIABLES
SELECT
  *
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE 
  tripduration > 24*60*60

--WHERE CLAUSE ON TIMESTAMP FUNCTIONS
--Converts (CAST) the start_time timestamp into a date format (YYYY-MM-DD), removing the time component.
--Extracts the hour (0–23) from the start_time timestamp.
--Extract(minute from start_time) as start_time_minute
--Extract(year from start_time) as start_time_year
SELECT
  start_time as start_time_timestamp,
  cast(start_time AS date) as start_time_date,
  extract(hour from start_time) as start_time_hour,
  extract(minute from start_time) as start_time_minute,
  extract(year from start_time) as start_time_year
FROM
  `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE
start_time > '2022-10-01'
LIMIT
  100

--IS NULL OR IS NOT NULL
SELECT
  COUNT(*) AS count1,
  COUNT(dropoff_location) AS count2
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
  dropoff_location IS NOT NULL

-- GROUP BY WITH AGGREGATION AND HAVING
SELECT
  name,
  sum(number) as num_people
FROM
  `bigquery-public-data.usa_names.usa_1910_2013`
WHERE
  gender = 'F'
GROUP BY
  name
HAVING
  num_people > 500000
ORDER BY
  num_people desc
limit 100

--FIND DUPLICATES WITH COUNT AND HAVING
SELECT 
  COUNT(*) AS duplicate_count,
  name,
  state
FROM 
  `bigquery-public-data.usa_names.usa_1910_2013` 
GROUP BY
  name, state
HAVING COUNT(*) > 1
  