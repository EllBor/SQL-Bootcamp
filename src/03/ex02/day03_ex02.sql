SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE person_order.menu_id IS NULL
ORDER BY pizza_name, price;