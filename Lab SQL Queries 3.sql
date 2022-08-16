use sakila;

-- How many distinct (different) actors' last names are there?
select distinct(last_name) as 'different actors\' last names' from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) as 'different languages originally produced' from film;
-- this only tells us hom many different languages the movies have, but we should use original_language_id(its full of NULLs) to determine that?
-- I dont think this query is possible as intended

-- How many movies were released with "PG-13" rating?
select count(rating) as 'amount of movies with PG-13 rating' from film where rating like('___13'); -- like('PG-13') gives same result here

-- Get 10 the longest movies from 2006.
select title as '10 longest movies from 2006' from film where release_year = 2006 order by length desc limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(last_update), min(rental_date)) as 'days since first rental' from rental;
-- I dont know where to find this info in the table
-- I decided to compare the very first rental to the last update 

-- Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, '%b') as month, date_format(rental_date,'%a') as weekday from rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, date_format(rental_date, '%b') as month, date_format(rental_date,'%a') as weekday, if(date_format(rental_date,'%w') in (0,6) , 'weekend', 'weekday')  as day_type from rental;

-- How many rentals were in the last month of activity?
select count(*) as 'rentals in last month' from rental where datediff(last_update, rental_date) <30;
-- technically in the last 30 days