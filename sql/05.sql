/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

-- high level idea
-- first wrote the query from film -> actors
-- then  wrote the query from actors -> film
-- then combined the two together
select f2.title
from film f1
join film_actor fa1 on (f1.film_id = fa1.film_id)
join actor on (fa1.actor_id = actor.actor_id)
join film_actor  fa2 on (actor.actor_id = fa2.actor_id)
join film f2 on (fa2.film_id = f2.film_id)
WHERE
f1.title = 'AMERICAN CIRCUS'
ORDER BY f2.title;

