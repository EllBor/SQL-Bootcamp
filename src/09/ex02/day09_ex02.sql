
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit (row_id, created, type_event, name, age, gender, address) 
    VALUES(OLD.id, default, 'D', OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;