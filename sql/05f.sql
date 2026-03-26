/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
SELECT title
FROM (
    SELECT title
FROM (
    SELECT DISTINCT f2.title
    FROM film f1
    JOIN film_category fc1 on (f1.film_id = fc1.film_id)
    JOIN category c ON (fc1.category_id = c.category_id)
    JOIN film_category fc2 ON (c.category_id = fc2.category_id)
    JOIN film f2 on (fc2.film_id = f2.film_id)
    WHERE c.name = 'Classics'
    UNION ALL
    SELECT DISTINCT f2.title
    FROM film f1
    JOIN film_category fc1 on (f1.film_id = fc1.film_id)
    JOIN category c ON (fc1.category_id = c.category_id)
    JOIN film_category fc2 ON (c.category_id = fc2.category_id)
    JOIN film f2 on (fc2.film_id = f2.film_id)
    WHERE c.name = 'Foreign'
    UNION ALL
    SELECT DISTINCT f2.title
    FROM film f1
    JOIN film_category fc1 on (f1.film_id = fc1.film_id)
    JOIN category c ON (fc1.category_id = c.category_id)
    JOIN film_category fc2 ON (c.category_id = fc2.category_id)
    JOIN film f2 on (fc2.film_id = f2.film_id)
    WHERE c.name = 'Music'
) AS subquery
GROUP BY title
HAVING COUNT(*) > 1) as subquery2
INTERSECT
   select f2.title
from film f1
join film_actor fa1 on (f1.film_id = fa1.film_id)
join actor on (fa1.actor_id = actor.actor_id)
join film_actor  fa2 on (actor.actor_id = fa2.actor_id)
join film f2 on (fa2.film_id = f2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
ORDER BY title;
