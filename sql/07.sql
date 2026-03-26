/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT DISTINCT
a.first_name || ' ' || a.last_name AS "Actor Name"
FROM
    actor a
JOIN
    film_actor fa ON a.actor_id = fa.actor_id
WHERE
    fa.film_id IN (
        SELECT
            f.film_id
        FROM
            film f
        JOIN
            film_actor fa ON f.film_id = fa.film_id
        WHERE
            fa.actor_id IN (
                SELECT
                    a.actor_id
                FROM
                    actor a
                JOIN
                    film_actor fa ON a.actor_id = fa.actor_id
                WHERE
                    fa.film_id IN (
                        SELECT
                            f.film_id
                        FROM
                            film f
                        JOIN
                            film_actor fa ON f.film_id = fa.film_id
                        WHERE
                            fa.actor_id = 112
                    )
            )
    )
    AND fa.actor_id NOT IN (
        SELECT
            a.actor_id
        FROM
            actor a
        JOIN
            film_actor fa ON a.actor_id = fa.actor_id
        WHERE
            fa.film_id IN (
                SELECT
                    f.film_id
                FROM
                    film f
                JOIN
                    film_actor fa ON f.film_id = fa.film_id
                WHERE
                    fa.actor_id = 112
            )
    )
    ORDER BY "Actor Name";

