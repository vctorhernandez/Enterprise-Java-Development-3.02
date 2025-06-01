-- 1. In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(DISTINCT flight_number) FROM flight;

-- 2. In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) FROM flight;

-- 3. In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(total_seats) FROM aircraft;

-- 4. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT status, AVG(total_mileage) AS avg_miles
FROM customer
GROUP BY status;

-- 5. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT status, MAX(total_mileage) AS max_miles
FROM customers
GROUP BY status;

-- 6. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*)
FROM aircraft
WHERE name LIKE '%Boeing%';

-- 7. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT * FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 8. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT c.status, AVG(f.flight_mileage) AS avg_distance
FROM booking b
JOIN customer c ON b.customer_id = c.id
JOIN flight f ON b.flight_id = f.id
GROUP BY c.status;

-- 9. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT a.name, COUNT(*) AS booking_count
FROM booking b
JOIN customer c ON b.customer_id = c.id
JOIN flight f ON b.flight_id = f.id
JOIN aircraft a ON f.aircraft_id = a.id
WHERE c.status = 'Gold'
GROUP BY a.name
ORDER BY booking_count DESC
LIMIT 1;
