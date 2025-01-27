SELECT '2022-01-01'::DATE + i AS missing_date 
FROM generate_series(0, 9) AS i
LEFT JOIN person_visits ON person_visits.visit_date = '2022-01-01'::DATE + i
                       AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
WHERE person_visits.id IS NULL
ORDER BY missing_date;