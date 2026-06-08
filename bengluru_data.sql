-- 1. Retrieve all successful bookings:
SELECT booking_id,booking_status
FROM ride_data
WHERE booking_status = "Success"
-- 2. Find the average ride distance for each vehicle type:
SELECT vehicle_type,
       AVG(ride_distance) AS avg_ride_distance
FROM ride_data
GROUP BY vehicle_type;


-- 3. Get the total number of cancelled rides by customers:

select count(*) FROM ride_data where booking_status = "Cancelled by Customer"; 


-- 4. List the top 5 customers who booked the highest number of rides:

SELECT customer_id,
       COUNT(booking_id) AS total_rides
FROM ride_data
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT COUNT(*) FROM ride_data WHERE cancelled_rides_by_driver = 'Personal & Car
related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MIN(driver_ratings) as min_rating, MAX(driver_ratings) as max_rating
FROM ride_data
WHERE vehicle_type = "Prime Sedan" AND booking_status = "Success";
-- 7. Retrieve all rides where drop location is indiranagar:

SELECT * FROM ride_data WHERE drop_location = "indiranagar"; 

-- 8. Find the average customer rating per vehicle type:
SELECT vehicle_type , avg(customer_rating) as avg_cstm_rating
FROM ride_data
GROUP BY vehicle_type;
-- 9. Calculate the total booking value of rides completed successfully:
SELECT sum(booking_value) as "total booking value"  FROM ride_data WHERE incomplete_rides = 0;
-- 10. List all incomplete rides along with the reason:
SELECT booking_id,
       customer_id,
       vehicle_type,
       incomplete_rides_reason
FROM ride_data
WHERE incomplete_rides = 0;
