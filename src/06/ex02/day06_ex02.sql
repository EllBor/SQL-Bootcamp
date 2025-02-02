SELECT  person.name,
        pizza_name,
        price,
        (price*(1-discount/100))::INT AS discount_price,
        pizzeria.name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person_order.person_id = person.id
    JOIN person_discounts ON person_discounts.person_id = person.id
    AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY person.name, pizza_name;