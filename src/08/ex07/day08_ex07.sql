-- Session 1

BEGIN;
--starting a transaction mode
UPDATE pizzeria SET rating = 4 WHERE id = 1;

UPDATE pizzeria SET rating = 4 WHERE id = 2;

COMMIT;
--setting the transaction 

-- Session 2

BEGIN;
--starting a transaction mode
UPDATE pizzeria SET rating = 4 WHERE id = 2;

UPDATE pizzeria SET rating = 4 WHERE id = 1;

COMMIT;
--setting the transaction 