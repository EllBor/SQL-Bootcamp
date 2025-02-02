DROP TRIGGER if exists trg_person_insert_audit on person CASCADE;
DROP TRIGGER if exists trg_person_update_audit on person CASCADE;
DROP TRIGGER if exists trg_person_delete_audit on person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DELETE FROM person_audit;


CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS
$$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit (row_id, created, type_event, name, age, gender, address) 
        VALUES(OLD.id, default, 'D', OLD.name, OLD.age, OLD.gender, OLD.address);
    ELSIF (TG_OP = 'UPDATE') THEN 
        INSERT INTO person_audit (row_id, created, type_event, name, age, gender, address) 
        VALUES(OLD.id, default, 'U', OLD.name, OLD.age, OLD.gender, OLD.address);
    ELSIF (TG_OP = 'INSERT') THEN 
        INSERT INTO person_audit (row_id, created, type_event, name, age, gender, address) 
        VALUES(NEW.id, default, default, NEW.name, NEW.age, NEW.gender, NEW.address);
    END IF;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_audit
AFTER DELETE OR INSERT OR UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
