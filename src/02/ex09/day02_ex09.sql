SELECT name 
FROM person
WHERE id IN (SELECT person_id FROM person_order where menu_id IN (SELECT id FROM menu WHERE pizza_name = 'cheese pizza'))
AND id IN (SELECT person_id FROM person_order where menu_id IN (SELECT id FROM menu WHERE pizza_name = 'pepperoni pizza'))
AND gender = 'female'
ORDER BY name;