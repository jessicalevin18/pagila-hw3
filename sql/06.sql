/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */
/*
i want actors 

i want a list of all the movies that kevin bacon is in

then for a list of an actor

i can do a join to get an actors movies that are also in that list
if the count is one they are included


SELECT first_name, last_name
    FROM actor a
    WHERE  IN (
        SELECT 
*/

SELECT a.first_name ||' '||  a.last_name AS "Actor Name"
    FROM actor a
     JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IN (
    SELECT f.film_id
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    WHERE fa.actor_id = 112
)
GROUP BY "Actor Name" 
HAVING a.first_name ||' '||  a.last_name != 'RUSSELL BACALL'
ORDER BY "Actor Name";
