CREATE TABLE IF NOT EXISTS person_discounts (
    id bigint primary key,
    discount numeric,
    person_id bigint,
    pizzeria_id bigint,
    constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
    constraint fk_person_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
);

