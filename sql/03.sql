/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

/* SELECT */

SELECT country.country, SUM(amount) as total_payments
    FROM payment p
        JOIN customer c ON p.customer_id = c.customer_id
        JOIN address a ON c.address_id = a.address_id
        JOIN city ON a.city_id = city.city_id
        JOIN country ON city.country_id = country.country_id
        GROUP BY country.country
        ORDER BY total_payments DESC, country.country;
        
