CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS TABLE (fibonacci_numbers INTEGER) AS
$$
DECLARE
     x INTEGER;
     y INTEGER;
     z INTEGER;
BEGIN
    x := 0;
    y := 1;
    fibonacci_numbers := 0; 
    RETURN NEXT;
    fibonacci_numbers := 1; 
    RETURN NEXT;
    WHILE fibonacci_numbers < pstop LOOP
        z := x + y;
        fibonacci_numbers := z;
        IF fibonacci_numbers < pstop THEN
            RETURN NEXT;
        END IF;
         x := y;
         y := z;
    END LOOP;
END
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();