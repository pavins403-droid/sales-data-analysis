USE capstone_project;

SELECT
    c.region,
    SUM(o.amount) AS revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region
HAVING SUM(o.amount) > 80000
ORDER BY SUM(o.amount) DESC;
