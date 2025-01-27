-- Session 1

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--starting a transaction mode
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;
--setting the transaction 
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session 2

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--starting a transaction mode
UPDATE pizzeria SET rating = 3.0
WHERE name = 'Pizza Hut';

COMMIT;
--setting the transaction 
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';