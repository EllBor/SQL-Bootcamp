SELECT name, COUNT(person_id) AS count_of_visits
FROM person
JOIN person_visits ON person_id = person.id
GROUP BY name
HAVING COUNT(person_id) > 3;