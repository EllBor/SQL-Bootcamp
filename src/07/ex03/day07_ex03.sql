WITH total AS
(
   (  
        SELECT pizzeria.name, COUNT(*) AS count
        FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY pizzeria.name
        ORDER BY count DESC, pizzeria.name
    )
    UNION ALL
   ( 
        SELECT pizzeria.name, COUNT(*) AS count
        FROM person_order
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY pizzeria.name
        ORDER BY count DESC, pizzeria.name
    )
)

SELECT name, SUM(count) AS total_count
FROM  total
GROUP BY name
ORDER BY total_count DESC, name;