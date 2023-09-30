-- Q1-- Pull all the films acted by the actor ‘Will Wilson’.

use mavenmovies;
select title,first_name,last_name from actor inner join film_actor using
(actor_id) inner join film using (film_id) where first_name = 'will' and last_name = 'wilson';

-- Q2-- Pull all the films with ‘Comedy’ category.

select title,name from film inner join film_category using (film_id)
inner join category using(category_id)
where name = 'horror' order by title;


-- Q3-- Find the actors who have acted in the film ‘Frost Head’.

select title,first_name,last_name from actor inner join film_actor using (actor_id)
inner join film using (film_id)
where title = 'frost head';


-- Q4-- Pull all the films which were rented and return in the month of May.

select title from rental r inner join inventory i on r.inventory_id=i.inventory_id inner join film f on i.film_id=f.film_id 
where month(rental_date)=5 and month(return_date)=5;

-- Q5-- List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names.

select concat(first_name,' ',last_name) as 'full name',(awards), length(first_name) + length(last_name)
as 'full name character'
from actor_award where awards ='oscar';



/* -- Q6 -- (Write a SQL query to count the number of characters except the spaces for each actor,
Return first 10 actors name length along with their name*/

select first_name,last_name, length(first_name)+length(last_name)  'length of names character'
from actor limit 10;









