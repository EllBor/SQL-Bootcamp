SELECT order_date AS action_date, name AS person_name
FROM person_order, person
WHERE (person_id = person.id)
INTERSECT
SELECT visit_date AS action_date, name AS person_name
FROM person_visits, person
WHERE (person_id = person.id)
ORDER BY action_date, person_name DESC;
