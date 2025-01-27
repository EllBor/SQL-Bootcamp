-- Session 1
BEGIN;
--starting a transaction mode 
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';

UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT; --setting the transaction

-- Session 2
--Before Commit
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';
--After Commit 
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';