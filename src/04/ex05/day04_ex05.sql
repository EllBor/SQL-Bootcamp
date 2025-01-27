CREATE VIEW v_price_with_discount AS
SELECT person.name, pizza_name, price, (price - price*0.1)::INT AS discount_price
FROM menu
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
ORDER BY person.name, pizza_name;