-- Create a new table
CREATE TABLE cab_rides (
  ride_id text ,	
  distance decimal,
  cab_type VARCHAR(30) NOT NULL,
  time_stamp text NOT NULL,	
  destination VARCHAR(30) NOT NULL,
  pickup VARCHAR(30) NOT NULL,
  price decimal,
  surge_mutliplier decimal,
  product_id VARCHAR,
  name	VARCHAR
);

-- Query only the `name` field
SELECT 
  DISTINCT NAME

FROM cab_rides;

SELECT
    distance,
    price,
	name,
	Product_id
INTO TEMP TABLE new_table
FROM
    cab_rides
WHERE
    distance > 5
ORDER BY
    distance DESC;

SELECT * FROM new_table



-- drop table cab_rides

-- drop table cab_rides1

CREATE TABLE cab_rides1 (
  ride_id text ,	
  distance decimal,
  cab_type VARCHAR(30) NOT NULL,
--   time_stamp timestamp NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),
  time_stamp BIGINT,
  destination VARCHAR(30) NOT NULL,
  pickup VARCHAR(30) NOT NULL,
  price decimal,
  surge_mutliplier decimal,
  product_id VARCHAR,
  name	VARCHAR
);

SELECT * FROM cab_rides

--change the timestamp to real time

SELECT
TIMESTAMP 'epoch' + 1544952607890 * INTERVAL '1 second' as real_datetime



CREATE TABLE date_table AS (

SELECT cab_rides1.time_stamp,
      TIMESTAMP 'epoch' + cab_rides1.time_stamp/1000 * INTERVAL '1 second' as date_col
FROM cab_rides1)

SELECT * FROM date_table
drop table date_table


--alter table cab_rides1 
alter table cab_rides1 
drop column date_col;
SELECT * FROM cab_rides1 

SELECT * from cab_rides1
SELECT * FROM date_table


CREATE TEMP TABLE new_table AS
SELECT * FROM cab_rides1
INNER JOIN date_table ON cab_rides1.time_stamp = date_table.time_stamp;




Update cab_rides1
SET date_col = (SELECT date_col
				 FROM cab_rides1
				 WHERE  time_stamp/1000 * INTERVAL '1 second');





	



SELECT
   SUM (price) AS total
FROM
   cab_rides
WHERE
   name = "UberPool";

SELECT
   DISTINCT column_1
FROM
   table_name;


-- Filter the query to show only dogs under the age of 5
SELECT pet_type, pet_name
FROM people
WHERE pet_type = 'dog'
AND pet_age < 5;

desc cab_rides1