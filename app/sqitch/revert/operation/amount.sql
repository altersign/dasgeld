-- Revert dasgeld:operation/amount from sqlite
--
-- PRAGMA foreign_keys = ON;
BEGIN;

-- XXX Add DDLs here.
ALTER TABLE operation RENAME TO tmp_operation;
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
INSERT INTO operation (operation_id, account_id, summa, description, tags, performed, created, parent_operation_id, is_actual, revision, editor_id)
    SELECT operation_id, account_id, amount, description, tags, performed, created, parent_operation_id, is_actual, revision, editor_id
    FROM tmp_operation;
DROP TABLE tmp_operation;

COMMIT;
