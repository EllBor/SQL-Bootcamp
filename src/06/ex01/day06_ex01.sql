INSERT INTO person_discounts (id,discount, person_id, pizzeria_id)
SELECT  ROW_NUMBER() OVER () as id,
CASE COUNT(person_order.id) WHEN 1 THEN 10.5
        WHEN 2 THEN 22
        ELSE 30
        END,
        person_order.person_id, pizzeria_id
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_order.person_id, pizzeria_id;