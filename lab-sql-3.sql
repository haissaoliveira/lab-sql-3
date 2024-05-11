USE SAKILA; 
-- How many distinct (different) actors' last names are there?
SELECT (COUNT(DISTINCT LAST_NAME))
FROM SAKILA.ACTOR
;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(LANGUAGE_ID)
FROM SAKILA.FILM; 

-- How many movies were released with "PG-13" rating?
SELECT count(RATING)
FROM SAKILA.FILM
WHERE RATING IN ('PG-13')
;

-- Get 10 the longest movies from 2006.
SELECT RELEASE_YEAR, LENGTH, TITLE AS LONGEST_IN_2006
FROM SAKILA.FILM
WHERE RELEASE_YEAR IN ('2006')
ORDER BY LENGTH DESC
LIMIT 10
;

-- How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF('2005-05-27', '2005-05-24') AS COMP_OPERATION
FROM SAKILA.RENTAL;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT * FROM SAKILA.RENTAL;

SELECT *,
CONVERT(RETURN_DATE, date) AS RENTAL_INFO_UPDATED,
DATE_FORMAT(CONVERT(LAST_UPDATE, DATE), '%M') AS MONTH_,
DATE_FORMAT(CONVERT(LAST_UPDATE, DATE), '%D') AS DAY_
FROM SAKILA.RENTAL
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CONVERT(RENTAL_DATE, date) AS DAY_TYPE,
DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%W') AS Day_of_week,
CASE WHEN DATE_FORMAT(CONVERT(RENTAL_DATE, DATE), '%W') IN ('Saturday', 'Sunday') THEN 'Weekend'
ELSE 'Workday' END AS new_column
FROM SAKILA.RENTAL
;



SELECT * FROM SAKILA.RENTAL