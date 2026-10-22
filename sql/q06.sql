USE capstone_project;
show tables;

SELECT status,
       COUNT(*) AS number_of_orders,
       SUM(amount) AS total_amount
FROM orders
GROUP BY status
ORDER BY COUNT(*) DESC;