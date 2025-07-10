create database air_quality;
use air_quality;
select database();

-- Data Cleaning

update air_quality_india
set Date  = str_to_date(Date,'%d-%m-%Y');

alter table air_quality_india
modify column Date date;

alter table air_quality_india
change column `Unique ID` `unique_id` varchar(30);

alter table air_quality_india
rename column `Time Period` to time_period;

alter table air_quality_india
rename column `Data Value` to data_value;

alter table air_quality_india
rename column `Air Quality` to air_quality;

alter table air_quality_india
rename column `District` to city;


-- What are the top 5 most polluted cities based on the average PM10 levels?

select
city,
round(avg(data_value),2) as average_PM10_level
from air_quality_india
where Measure like '%PM10%'
group by city
order by average_PM10_level desc;

-- What is the yearly trend of NO₂ levels in Delhi over the past 10 years?

select
year(Date) as last_10_years,
data_value as NO2_level
from air_quality_india
where city = 'Delhi' and Measure like '%NO2%' and
year(Date) >= (select year(max(Date)-interval 10 year) from air_quality_india)
order by last_10_years asc;

-- Which city has shown the highest improvement in air quality over time?

select
year(Date) as year,
city,
air_quality,
count(*) as total_received
from air_quality_india
group by year,city,air_quality
order by year,city;

-- How does the average air quality index vary across different cities?

select
city,
avg(data_value) as average_air_quality
from air_quality_india
group by city
order by average_air_quality desc;

-- What is the highest recorded pollution level for each pollutant in each city?

select
city,
Measure,
max(data_value) as higest_lvel
from air_quality_india
group by city,Measure
order by city;

-- How many times has each city reported "Very Poor" or "Severe" air quality?

select
city,
count(air_quality) as total_very_poor_record
from air_quality_india
where air_quality = 'Very Poor'
group by city
order by total_very_poor_record desc;

-- What is the correlation between NO₂ and PM10 levels across all cities?

create view no2 as
select
city,
count(Measure) as NO2_level
from air_quality_india
where Measure like '%NO2%'
group by city;

create view pm10 as 
select
city,
count(Measure) as PM10_level
from air_quality_india
where Measure like '%PM10%'
group by city;

create view combined as
select
no2.city,
no2.NO2_level,
pm10.PM10_level
from no2
join pm10
on no2.city = pm10.city;


select
@an := avg(NO2_level),
@ap := avg(PM10_level),
@div := (stddev_samp(NO2_level)*stddev_samp(PM10_level))
from combined;

select
sum((NO2_level-@an)*(PM10_level-@ap))/
((count(NO2_level)-1)*@div) as 'corelation between NO2 & PM10'
from combined;

-- Find the average pollution levels for each month across all cities.

select 
monthname(Date) as month,
city,
round(avg(data_value),2) as `average pollution levels`
from air_quality_india
group by month,city
order by city,
case month
when 'January' then 1
when 'February' then 2
when 'March' then 3
when 'April' then 4
when 'May' then 5
when 'June' then 6
when 'July' then 7
when 'August' then 8
when 'September' then 9
when 'October' then 10
when 'November' then 11
when 'December' then 12
end;

-- Which city has the highest variance in pollution levels?

select 
city,
variance(data_value) as variances
from air_quality_india
group by city;

select 
city,
stddev(data_value) as variances
from air_quality_india
group by city;

-- What is the seasonal trend in pollution levels across major cities?

select
city,
case
	when quarter(Date) = 1 then '1st Quarter'
	when quarter(Date) = 2 then '2nd Quarter'
	when quarter(Date) = 3 then '3rd Quarter'
	when quarter(Date) = 4 then '4th Quarter'
end
as seasonal_trend,
round(avg(data_value),2) as avg_pollution_level
from air_quality_india
group by city,seasonal_trend
order by city;

--  How does the air quality vary between northern and southern cities?

select
city,
avg(data_value) as avg_air_quality
from air_quality_india
group by city
having city not in ("Kolkata","Mumbai");

-- 	Identify cities where pollution levels exceeded the safe limits most frequently.

select
city,
Measure,
count(*) as `Total times above safe limit`
from air_quality_india
where Measure like '%PM10%' and data_value > 100 or
Measure like '%PM2.5%' and data_value > 60 or
Measure like '%NO2%' and data_value > 80 or
Measure like '%SO2%' and data_value > 80 or
Measure like '%Ozone%' and data_value > 180
group by city,Measure
order by city;

-- Which pollutants are the most responsible for "Severe" air quality conditions?

select
Measure,
(count(*)/(select count(*) from air_quality_india))*100 as percent
from air_quality_india
where air_quality not in ("Good","Moderate")
group by Measure;

-- Find the most frequently recorded pollutant in the dataset.

select
Measure,
count(*) as total_record
from air_quality_india
group by Measure
order by total_record desc
limit 1;

-- What is the monthly trend of PM10 levels for the most polluted city?

with most_polluted_city as 
(select
city,
avg(data_value) as pollution_level
from air_quality_india
group by city
order by pollution_level desc
limit 1)

select
city,
monthname(Date) as monthly_trend,
round(avg(data_value),2) as PM10_level
from air_quality_india
where Measure like '%PM10%'
group by city,monthly_trend
having city = (select city from most_polluted_city)
order by
case monthly_trend
when 'January' then 1
when 'February' then 2
when 'March' then 3
when 'April' then 4
when 'May' then 5
when 'June' then 6
when 'July' then 7
when 'August' then 8
when 'September' then 9
when 'October' then 10
when 'November' then 11
when 'December' then 12
end;

-- How do pollution levels vary on weekdays versus weekends?

select
case
	when dayofweek(Date) in (1,7) then 'Weekend'
    else 'Weekday'
end
as week_period,
avg(data_value) as avg_pollution_level
from air_quality_india
group by week_period;

-- Which year had the worst overall air quality for each city?

select
year(Date) as worst_year,
round(avg(data_value),2) as avg_pollution_level
from air_quality_india
group by worst_year
order by avg_pollution_level desc
limit 1;

-- Which city experienced the highest percentage increase in pollution levels over the years?

with f_level as 
(select
city,
min(year(Date)) as years,
round(avg(data_value),2) as first_level
from air_quality_india
group by city
order by city),

l_level as
(select
city,
max(year(Date)) as years,
round(avg(data_value)) as last_level
from air_quality_india
group by city
order by city)

select
f_level.city,
round(((l_level.last_level - f_level.first_level)/f_level.first_level)*100,2) as percentage_increase
from f_level
join l_level
on f_level.city = l_level.city;

-- What is the distribution of different pollutants in each city?

select
ifnull(city,'Total'),
ifnull(Measure,'Total'),
concat(round((count(*)/(select count(Measure) from air_quality_india))*100,2),'%') as pollutant_distribution
from air_quality_india
group by city, Measure with rollup
order by city desc;

-- OR

select 
city,
Measure,
count(*) as total_record,
round((count(*)*100/sum(count(*)) over(partition by city)),2) as percent
from air_quality_india
group by city,Measure
order by city,percent desc;
