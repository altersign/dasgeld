PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS person (
    person_id   INTEGER PRIMARY KEY,
    name        TEXT NOT NULL,
    email       TEXT NOT NULL,
    created     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tag (
    tag_id      INTEGER PRIMARY KEY,
    name        TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS auth (
    auth_id     INTEGER PRIMARY KEY,
    person_id   INTEGER NOT NULL REFERENCES person(person_id),
    username    TEXT NOT NULL,
    password    TEXT
);

CREATE TABLE IF NOT EXISTS account (
    account_id  INTEGER PRIMARY KEY,
    account_owner_id    INTEGER NOT NULL REFERENCES person(person_id),
    name        TEXT NOT NULL,
    currency    CHAR(3) NOT NULL DEFAULT 'EUR',
    created     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS operation (
    operation_id    INTEGER PRIMARY KEY,
    account_id      INTEGER NOT NULL REFERENCES account(account_id),
    summa           INTEGER NOT NULL,
    description     TEXT,
    tags            TEXT,
    performed       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    parent_operation_id INTEGER REFERENCES operation(operation_id) CHECK (parent_operation_id != operation_id),
    is_actual       BOOLEAN NOT NULL DEFAULT 1,
    revision        INTEGER NOT NULL DEFAULT 1,
    editor_id       INTEGER NOT NULL REFERENCES person(person_id)
);

CREATE TRIGGER IF NOT EXISTS next_operation_revision AFTER INSERT ON operation
    FOR EACH ROW WHEN NEW.parent_operation_id IS NOT NULL AND NEW.revision=1
BEGIN 
    UPDATE operation SET revision=(
        SELECT max(revision)+1 FROM operation 
            WHERE operation_id=NEW.parent_operation_id OR
                  parent_operation_id=NEW.parent_operation_id
        ) WHERE rowid=NEW.rowid;
END;

CREATE TRIGGER IF NOT EXISTS drop_is_actual BEFORE INSERT ON operation
    FOR EACH ROW WHEN NEW.parent_operation_id IS NOT NULL
BEGIN 
    UPDATE operation SET is_actual=0
        WHERE operation_id=NEW.parent_operation_id OR
              parent_operation_id=NEW.parent_operation_id;
END;

CREATE VIEW IF NOT EXISTS actual_operation AS SELECT * FROM operation WHERE is_actual == 1;

CREATE TABLE IF NOT EXISTS operation_tag (
    operation_tag_id    INTEGER PRIMARY KEY,
    operation_id        INTEGER NOT NULL REFERENCES operation(operation_id),
    tag_id              INTEGER NOT NULL REFERENCES tag(tag_id)
);

COMMIT TRANSACTION;
