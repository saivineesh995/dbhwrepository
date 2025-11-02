SQL Commmands


1.All CREATE TABLE statements (with your optional fields)
 CREATE TABLE film (
  film_id SERIAL PRIMARY KEY,
  film_title VARCHAR(200) NOT NULL,
  film_director VARCHAR(100) NOT NULL,
  year_released INTEGER,
  is_available BOOLEAN DEFAULT TRUE
);
CREATE TABLE
Rentals Tbel:

CREATE TABLE rentals (
  rental_id SERIAL PRIMARY KEY,
  film_id INTEGER NOT NULL,
  customer_name VARCHAR(100) NOT NULL,
  rental_date DATE NOT NULL DEFAULT CURRENT_DATE,
  return_date DATE,

  returned BOOLEAN DEFAULT FALSE

 );

2.All INSERT statements with YOUR unique data
Insert Statement for film:

INSERT INTO film (film_id,film_title, film_director, year_released,is_available)
VALUES
  (1,'Brindavanam', 'vamshi paidapally', 2010,'Y'),
  (2,'Chatrapthi','SS Rajamouli ', 2007,'Y'),
  (3,'Okaddu', 'Gunashekar',1999,'N'),
  (4,'RRR', 'SS Rajamouli', 2024,'N'),
  (5,'Kantara', 'Rishab Shetty', 2025,'Y');
INSERT 0 5



 
INSERT INTO rentals (rental_id, film_id, customer_name, rental_date, return_date)
VALUES
  (10, 1, 'Revanth', '2025-10-31', '2025-11-11'),
  (20, 2, 'Rahul',   '2025-10-10', '2025-10-28'),
  (30, 9, 'Rajesh',  '2025-09-17', '2025-10-10'),
  (40,10, 'Vineesh', '2025-08-20', '2025-08-29'),
  (60,20, 'Vijay',   '2025-06-20', '2025-09-17');
INSERT 0 5
3.The completed JOIN query
Join query
postgres=#
SELECT
  f.film_title,
  f.film_director,
  r.rental_date,
  r.customer_name
FROM
  film f
JOIN
  rentals r ON f.film_id = r.film_id
WHERE
  f.is_available = FALSE
ORDER BY
 r.rental_date DESC;
 film_title  |   film_director   | rental_date | customer_name
-------------+-------------------+-------------+---------------
 Brindavanam | vamshi paidapally | 2025-10-31  | Revanth
 Chatrapthi  | SS Rajamouli      | 2025-10-10  | Rahul
(2 rows)
 
4.At least 3 additional queries demonstrating different SQL features
a.query by row
 SELECT
  film_title,
  COUNT(*) AS total_rentals,
  ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM
  rentals
JOIN
  film ON rentals.film_id = film.film_id
GROUP BY
  film_title
LIMIT 3;
 film_title  | total_rentals | rank
-------------+---------------+------
 Chatrapthi  |             1 |    1
 Brindavanam |             1 |    2
(2 rows)



b.film released by last 5 years
 SELECT
  film_title,
  year_released
FROM
  film
WHERE
  year_released >= EXTRACT(YEAR FROM CURRENT_DATE) - 5;
 film_title | year_released
------------+---------------
 RRR        |          2024
 Kantara    |          2025
(2 rows)

c.subquery
  SELECT
  film_title
FROM
  film
WHERE
  film_id NOT IN (
    SELECT DISTINCT film_id FROM rentals
  );
 film_title
------------
 Okaddu
 RRR
 Kantara
(3 rows) 

4.Data Uniqueness Proof
 SELECT
  (SELECT COUNT(*) FROM film) AS film_count,
  (SELECT COUNT(DISTINCT year_released) FROM film) AS year_released_count, (SELECT STRING_AGG(customer_name, ', ') FROM rentals) AS customer_name;



