WITH female AS (
    SELECT pizzeria_id, COUNT(*) AS count_female
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id AND gender = 'female'
    GROUP BY pizzeria_id
),

male AS (
    SELECT pizzeria_id, COUNT(*) AS count_male
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id AND gender = 'male'
    GROUP BY pizzeria_id
)
SELECT pizzeria.name AS pizzeria_name
FROM female
JOIN male ON female.pizzeria_id= male.pizzeria_id
JOIN pizzeria ON female.pizzeria_id = pizzeria.id
WHERE count_female <> count_male
ORDER BY pizzeria_name;