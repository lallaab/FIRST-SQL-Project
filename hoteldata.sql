-- cancels percentage per hotel each year
select hotel, arrival_date_year, is_canceled, (round((CAST(count(is_canceled) AS real) / 21996)*100,3)) as cancels_percentage
from dbo.['2018$']
group by is_canceled, hotel, arrival_date_year
union 
select hotel, arrival_date_year, is_canceled, (round((CAST(count(is_canceled) AS real) / 79264)*100,1)) as cancels_percentage
from dbo.['2019$']
group by is_canceled, hotel, arrival_date_year
union 
select hotel, arrival_date_year, is_canceled, (round((CAST(count(is_canceled) AS real) / 40687)*100,3)) as cancels_percentage
from dbo.['2020$']
group by is_canceled, hotel, arrival_date_year
order by arrival_date_year DESC;

-- busiest months of each year 
select hotel, arrival_date_year, arrival_date_month, 
       count ( arrival_date_month) as frequency_m 
from dbo.['2018$']
group by  arrival_date_year, arrival_date_month, hotel
union 
select hotel, arrival_date_year, arrival_date_month, 
       count ( arrival_date_month) as frequency_m 
from dbo.['2019$']
group by arrival_date_year, arrival_date_month, hotel
union
select hotel, arrival_date_year, arrival_date_month, 
       count ( arrival_date_month) as frequency_m 
from dbo.['2020$']
group by arrival_date_year, arrival_date_month, hotel
order by arrival_date_year, hotel, frequency_m DESC;

--busiest days of each year
select hotel, arrival_date_year, arrival_date_day_of_month, 
       count (arrival_date_day_of_month) AS frequency_d
from dbo.['2018$']
group by arrival_date_year, arrival_date_day_of_month, hotel
union
select hotel, arrival_date_year,  arrival_date_day_of_month, 
       count (arrival_date_day_of_month) AS frequency_d
from dbo.['2019$']
group by arrival_date_year, arrival_date_day_of_month, hotel
union
select hotel, arrival_date_year, arrival_date_day_of_month, 
       count (arrival_date_day_of_month) AS frequency_d
from dbo.['2020$']
group by arrival_date_year, arrival_date_day_of_month, hotel
order by arrival_date_year, hotel, frequency_d DESC;

-- most visited countries each year
select hotel, arrival_date_year, country, count (is_canceled) as total_res
from dbo.['2018$']
group by arrival_date_year, country, hotel
union
select hotel, arrival_date_year, country, count (is_canceled) as total_res
from dbo.['2019$']
group by arrival_date_year, country, hotel
union
select hotel, arrival_date_year, country, count (is_canceled) as total_res
from dbo.['2020$']
group by arrival_date_year, country, hotel
order by arrival_date_year, hotel, total_res DESC;

-- reservation status percentage each year
select hotel, arrival_date_year, reservation_status, 
      (round((CAST(count(reservation_status) AS real) / 21996)*100,2)) as reservation_status_percentage
from dbo.['2018$']
group by arrival_date_year, hotel, reservation_status
union 
select hotel, arrival_date_year, reservation_status, 
      (round((CAST(count(reservation_status) AS real) / 79264)*100,2)) as reservation_status_percentage
from dbo.['2019$']
group by arrival_date_year, hotel, reservation_status
union 
select hotel, arrival_date_year, reservation_status, 
      (round((CAST(count(reservation_status) AS real) / 40687)*100,2)) as reservation_status_percentage
from dbo.['2020$']
group by arrival_date_year, hotel, reservation_status
order by arrival_date_year, hotel, reservation_status_percentage DESC;

-- most popular agent of each year
select hotel, arrival_date_year, agent, count ( agent ) as reservations_number, 
       round((cast(count(agent) as real )/ 21996) *100,2) as agent_frequency
from dbo.['2018$']
where agent is not null 
group by arrival_date_year, hotel, agent
union
select hotel, arrival_date_year, agent, count ( agent ) as reservations_number, 
       round((cast(count(agent) as real )/ 79264) *100,2) as agent_frequency
from dbo.['2019$']
where agent is not null
group by arrival_date_year, hotel, agent
union
select hotel, arrival_date_year, agent, count ( agent ) as reservations_number, 
       round((cast(count(agent) as real )/ 40687) *100,2) as agent_frequency
from dbo.['2020$']
where agent is not null
group by arrival_date_year, hotel, agent
order by arrival_date_year, hotel, agent_frequency desc;

-- most frequent customer type of each year
select hotel, arrival_date_year, customer_type, count ( customer_type ) as type_number, 
       round((cast(count(customer_type) as real )/ 21996) *100,2) as type_frequency
from dbo.['2018$']
group by arrival_date_year, hotel, customer_type
union
select hotel, arrival_date_year, customer_type, count ( customer_type ) as type_number, 
       round((cast(count(customer_type) as real )/ 79264) *100,2) as type_frequency
from dbo.['2019$']
group by arrival_date_year, hotel, customer_type
union
select hotel, arrival_date_year, customer_type, count ( customer_type ) as type_number, 
       round((cast(count(customer_type) as real )/ 40687) *100,2) as type_frequency
from dbo.['2020$']
group by arrival_date_year, hotel, customer_type
order by arrival_date_year, hotel, type_frequency DESC;

-- most frequent meal reservation/request for each year
select hotel, arrival_date_year, meal, count (meal) as requests_number,
       round((cast(count (meal) as real) / 21996) *100,2) as meal_frequency
from dbo.['2018$']
group by arrival_date_year, hotel, meal
union
select hotel, arrival_date_year, meal, count (meal) as requests_number,
       round((cast(count (meal) as real) / 79264) *100,2) as meal_frequency
from dbo.['2019$']
group by arrival_date_year, hotel, meal
union
select hotel, arrival_date_year, meal, count (meal) as requests_number,
       round((cast(count (meal) as real) / 40687) *100,2) as meal_frequency
from dbo.['2020$']
group by arrival_date_year, hotel, meal
order by arrival_date_year, hotel, meal_frequency DESC;

--most popular market segment of each year
select hotel, arrival_date_year, market_segment, count ( market_segment ) as marketS_number, 
       round((cast(count(market_segment) as real )/ 21996) *100,2) as marketS_frequency
from dbo.['2018$']
group by arrival_date_year, hotel, market_segment
union
select hotel, arrival_date_year, market_segment, count ( market_segment ) as marketS_number, 
       round((cast(count(market_segment) as real )/ 79264) *100,2) as marketS_frequency
from dbo.['2019$']
group by arrival_date_year, hotel, market_segment
union
select hotel, arrival_date_year, market_segment, count ( market_segment ) as marketS_number, 
       round((cast(count(market_segment) as real )/ 40687) *100,2) as marketS_frequency
from dbo.['2020$']
group by arrival_date_year, hotel, market_segment
order by arrival_date_year, hotel, marketS_frequency DESC; 

--most frequent reserved room type of each year
select hotel, arrival_date_year, reserved_room_type, count (reserved_room_type) as roomType_number,
       round((cast(count(reserved_room_type) as real) / 21996)*100,2) as roomType_frequency
from dbo.['2018$']
group by arrival_date_year, hotel, reserved_room_type
union
select hotel, arrival_date_year, reserved_room_type, count (reserved_room_type) as roomType_number,
       round((cast(count(reserved_room_type) as real) / 79264)*100,2) as roomType_frequency
from dbo.['2019$']
group by arrival_date_year, hotel, reserved_room_type
union
select hotel, arrival_date_year, reserved_room_type, count (reserved_room_type) as roomType_number,
       round((cast(count(reserved_room_type) as real) / 40687)*100,2) as roomType_frequency
from dbo.['2020$']
group by arrival_date_year, hotel, reserved_room_type
order by arrival_date_year, hotel, roomType_frequency DESC;

--how many assigned room types differ from the reserved room types 
select hotel, arrival_date_year, reserved_room_type, assigned_room_type, 
       case 
       WHEN CONCAT('%',"reserved_room_type",'%') LIKE CONCAT('%',"assigned_room_type",'%')  THEN 1
       WHEN CONCAT('%',"assigned_room_type",'%') LIKE CONCAT('%',"reserved_room_type",'%') THEN 1
       ELSE 0
       END as matchings
from dbo.['2018$']
union all
select hotel, arrival_date_year, reserved_room_type, assigned_room_type, 
       case 
       WHEN CONCAT('%',"reserved_room_type",'%') LIKE CONCAT('%',"assigned_room_type",'%')  THEN 1
       WHEN CONCAT('%',"assigned_room_type",'%') LIKE CONCAT('%',"reserved_room_type",'%') THEN 1
       ELSE 0
       END as matchings
from dbo.['2019$']
union all
select hotel, arrival_date_year, reserved_room_type, assigned_room_type, 
       case 
       WHEN CONCAT('%',"reserved_room_type",'%') LIKE CONCAT('%',"assigned_room_type",'%')  THEN 1
       WHEN CONCAT('%',"assigned_room_type",'%') LIKE CONCAT('%',"reserved_room_type",'%') THEN 1
       ELSE 0
       END as matchings
from dbo.['2020$']
order by arrival_date_year, hotel, matchings DESC;

