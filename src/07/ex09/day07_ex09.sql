WITH temp AS (
    SELECT person.address AS address, 
        ROUND(MAX(age) - (MIN(age)::real / MAX(age))::numeric, 2) AS formula,
        ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
)

SELECT *, formula > average AS comparison
FROM temp
ORDER BY address;