-- Session 1

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--starting a transaction mode
SELECT SUM(rating)
FROM pizzeria;

SELECT SUM(rating)
FROM pizzeria;

COMMIT;
--setting the transaction 
SELECT SUM(rating)
FROM pizzeria;

-- Session 2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--starting a transaction mode
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

COMMIT;
--setting the transaction 
SELECT SUM(rating)
FROM pizzeria;