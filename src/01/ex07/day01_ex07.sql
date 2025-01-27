SELECT order_date AS action_date, CONCAT(name, ' (age:', age, ')')  AS person_name
FROM person_order
JOIN person ON person_id = person.id
ORDER BY action_date, person_name;

