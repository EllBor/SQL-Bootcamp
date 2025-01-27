SELECT pizzeria.name 
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' and price < 800 and visit_date = '2022-01-08'
ORDER BY price
LIMIT 1;