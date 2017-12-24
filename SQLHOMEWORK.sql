use sakila;
select * from actor;

#1a
select first_name, last_name from actor;
#1b
SELECT Concat(first_name, '  ', last_name) AS Actor_Name
FROM actor;

#2a
select actor_id, first_name, last_name from actor
WHERE first_name = "JOE";

#2b
select first_name, last_name from actor
WHERE last_name like "%GEN%";

#2c
select last_name, first_name from actor
WHERE last_name like "%LI%";

#2d
SELECT country_id, country from country
WHERE country in ('Afghanistan', 'Bangladesh', 'China');

#3a
ALTER TABLE actor
	ADD COLUMN middle_name VARCHAR (45) AFTER first_name;
select * from actor;

#3b
ALTER TABLE actor
MODIFY COLUMN middle_name blob;
select * from actor

#3c
ALTER TABLE actor
	DROP COLUMN middle_name;
select* from actor

#4a 
SELECT last_name, count(last_name)
from actor
group by last_name
HAVING count(last_name)>1

#4b
SELECT last_name, count(last_name)
from actor
group by last_name
HAVING count(last_name)>=2

#4c
UPDATE actor
SET first_name = 'HAPRO'
WHERE first_name='GROUCHO' AND last_name='WILLIAMS';
select * from actor;

#4d
UPDATE actor
SET first_name='GROUCHO'
WHERE first_name='HAPRO' AND last_name='WILLIAMS';
select * from actor;

#5
show create table sakila.address

#6a
SELECT first_name, last_name, address
	FROM address JOIN staff;

#6b
select * from payment

SELECT payment.staff_id, sum(amount)
	FROM payment JOIN staff		
WHERE payment_date like '2005-08-%' 
GROUP BY payment.staff_id;

 #6c
 select * from film_actor;
 select * from film;
 
SELECT film.title, count(actor_id)
	from film INNER JOIN film_actor
GROUP BY film_actor.actor_id
HAVING COUNT(actor_id)>1;


#6d
select count(inventory_id)
from inventory
where film_id IN
(select film_id
from film
WHERE title = "Hunchback Impossible"
);

#6e
SELECT customer.first_name, customer.last_name, sum(amount)
	FROM payment JOIN customer	
	ON customer.customer_id=payment.customer_id
    GROUP BY payment.customer_id
    ORDER BY customer.last_name ASC;



#7a
select title
from film
where language_id IN
(select language_id
from language
WHERE name= "English"
)
AND title like 'K%'
OR title like 'Q%';


#7b
select first_name, last_name
from actor
where actor_id IN
(select actor_id
from film_actor
where film_id IN
(select film_id
from film
WHERE title= 'Alone Trip'
));

#7c

select first_name, last_name, email
from customer
join rental 
join country
where country = "Canada"

#7d

select title
from film_text
where film_id IN
(select film_id
from film_category
where catogory_id IN
(select catogory_id
from category
WHERE name= "Family"
));

#7e
select title, rental_rate from film
ORDER by rental_rate;





 

