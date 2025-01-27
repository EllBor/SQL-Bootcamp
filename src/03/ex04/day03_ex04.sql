WITH female AS (
    SELECT pizzeria.name AS female_id
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id AND gender = 'female'
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
),

male AS (
    SELECT pizzeria.name AS male_id
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id AND gender = 'male'
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
),

only_female AS (
    SELECT female_id AS pizzeria_name
    FROM female
    EXCEPT
    SELECT male_id
    FROM male
),

only_male AS (
    SELECT male_id AS pizzeria_name
    FROM male
    EXCEPT
    SELECT female_id
    FROM female
)

SELECT pizzeria_name
FROM only_female
UNION
SELECT pizzeria_name
FROM only_male
ORDER BY pizzeria_name;