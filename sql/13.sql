/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */
WITH film_revenue AS (
  SELECT
    fa.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id,
    f.title,
    ROUND(SUM(p.amount), 2) AS revenue
  FROM film_actor fa
  JOIN actor a
    ON a.actor_id = fa.actor_id
  JOIN film f
    ON f.film_id = fa.film_id
  JOIN inventory i
    ON i.film_id = f.film_id
  JOIN rental r
    ON r.inventory_id = i.inventory_id
  JOIN payment p
    ON p.rental_id = r.rental_id
  GROUP BY
    fa.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id,
    f.title
),
ranked AS (
  SELECT
    actor_id,
    first_name,
    last_name,
    film_id,
    title,
    ROW_NUMBER() OVER (
      PARTITION BY actor_id
      ORDER BY revenue DESC, film_id
    ) AS rank,
    revenue
  FROM film_revenue
)
SELECT
  actor_id,
  first_name,
  last_name,
  film_id,
  title,
  rank,
  revenue
FROM ranked
WHERE rank <= 3
ORDER BY actor_id, rank, title;
