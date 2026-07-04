create database airline_analysis;
use airline_analysis;
select * from flights limit 5;
# Q1. Which airlines operate the most flights?
select AIRLINE, 
count(*) as total_flights 
from flights 
group by airline 
order by total_flights desc;

#Q2. Which airlines have the highest average arrival delay?
SELECT
    AIRLINE,
    ROUND(AVG(ARR_DELAY),2) AS Avg_Arrival_Delay
FROM flights
GROUP BY AIRLINE
ORDER BY Avg_Arrival_Delay DESC;

#Q3. Which month has the highest average arrival delay?
select MONTH,
round(avg(ARR_DELAY),2) as avg_arrival_delay_month
from flights
group by MONTH
order by avg_arrival_delay_month desc;

#Q4. Which day of the week experiences the highest average arrival delay?
select DAY_OF_WEEK, 
round(avg(ARR_DELAY),2) as avg_arrival_delay_day
from flights
group by DAY_OF_WEEK
order by avg_arrival_delay_day desc;

#Q5. Top 10 busiest origin airports
select origin, count(*) as total_flights
from flights
group by origin
order by total_flights desc limit 10;

#Q6. Top 10 busiest destination airports
select dest, count(*) as total_flights_dest
from flights
group by dest
order by total_flights_dest desc limit 10;

#Q7. Which routes have the highest average arrival delay?
select route,
round(avg(arr_delay),2) as avg_arrival_delay_route
from flights
group by route
order by avg_arrival_delay_route desc;

#Q8. Which airports have the highest average departure delay?
select origin,
round(avg(DEP_DELAY),2) as avg_departure_delay_airport
from flights
group by origin
order by avg_departure_delay_airport desc;

#Q9. Which airlines have the best on-time performance?
select airline, 
round(avg(arr_delay),2) as on_time_performance
from flights
group by airline
order by on_time_performance asc;

#Q10. Percentage of flights delayed more than 15 minutes
SELECT
ROUND(SUM(CASE WHEN ARR_DELAY > 15 THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS Delay_Percentage
FROM flights;

#Q11. Average flight distance by airline
select airline,
round(avg(distance),2) as avg_distance
from flights
group by airline
order by avg_distance;

#Q11. Top 10 longest routes by average distance
select airline,
round(avg(distance),2) as avg_distance
from flights
group by airline
order by avg_distance desc limit 10;

#Q13. Monthly flight volume
select month, count(*) as total_monthly_flights
from flights
group by month
order by total_monthly_flights;

#Q14. Average departure delay by month
select month,
round(avg(dep_delay),2) as avg_dep_delay_monthly
from flights
group by month
order by avg_dep_delay_monthly;

#Q15. Which airlines fly the longest average distance?
select airline,
round(avg(distance),2) as avg_long_distance
from flights
group by airline
order by avg_long_distance desc;

#Categorize flights
SELECT
AIRLINE,
CASE
WHEN ARR_DELAY <= 0 THEN 'On Time'
WHEN ARR_DELAY <=15 THEN 'Slight Delay'
WHEN ARR_DELAY <=60 THEN 'Moderate Delay'
ELSE 'Heavy Delay'
END AS Delay_Category,
COUNT(*) AS Flights
FROM flights
GROUP BY AIRLINE, Delay_Category;


