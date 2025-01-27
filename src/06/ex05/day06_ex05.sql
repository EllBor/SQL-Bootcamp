COMMENT ON TABLE person_discounts IS 'В таблице хранится информация о скидках, применяемых к заказам для каждого человека в конкретной пиццерии';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор для каждой записи о скидке';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор человека, получившего скидку';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, в которой была применена скидка';

COMMENT ON COLUMN person_discounts.discount IS 'Процентное значение скидки (от 0 до 100), применяемой к заказу';