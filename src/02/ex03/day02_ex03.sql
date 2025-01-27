WITH required_interval AS
(SELECT '2022-01-01'::DATE + i AS missing_date 
FROM generate_series(0, 9) AS i)

SELECT missing_date FROM required_interval
LEFT JOIN person_visits ON person_visits.visit_date = required_interval.missing_date
                       AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.id IS NULL
ORDER BY missing_date;