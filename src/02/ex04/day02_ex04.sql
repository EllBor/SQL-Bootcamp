SELECT pizza_name, name AS pizzeria_name, price 
FROM pizzeria
FULL JOIN menu ON pizzeria_id = pizzeria.id
WHERE pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
ORDER BY pizza_name, pizzeria_name;