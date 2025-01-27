CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', 
                            pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE(name varchar) AS
$$
BEGIN
    return query
        SELECT DISTINCT pizzeria.name
        FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person.id = person_visits.person_id
        WHERE price < $2 AND visit_date = $3 AND person.name = $1;
END
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300, pdate := '2022-01-01');
