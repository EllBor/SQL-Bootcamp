CREATE TABLE IF NOT EXISTS person_audit (
    row_id BIGINT NOT NULL,
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL DEFAULT 'I' CHECK(type_event = 'D' OR type_event = 'U' OR type_event = 'I'),
    name VARCHAR NOT NULL,
    age INTEGER NOT NULL DEFAULT 10,
    gender VARCHAR DEFAULT 'female' NOT NULL,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit (row_id, created, type_event, name, age, gender, address) 
    VALUES(NEW.id, default, default, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

