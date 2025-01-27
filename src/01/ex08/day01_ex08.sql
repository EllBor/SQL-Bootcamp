SELECT order_date AS action_date, CONCAT(name, ' (age:', age, ')')  AS person_name
FROM person_order, person
NATURAL JOIN person_visits
WHERE (person_order.person_id = person.id)
ORDER BY action_date, person_name;