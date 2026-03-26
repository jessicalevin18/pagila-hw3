/*
 * Compute the country with the most customers in it. 
 */


/* need to do a join and then i'm gonna group by and sort and select top */

SELECT country.country 
    FROM customer c
        JOIN address a ON c.address_id = a.address_id
        JOIN city ON a.city_id = city.city_id
        JOIN country ON city.country_id = country.country_id
        GROUP BY country.country
        ORDER BY count(*) DESC
        LIMIT 1;

