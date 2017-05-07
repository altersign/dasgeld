-- Verify dasgeld:baseschema on sqlite
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

SELECT person_id, name, email, created FROM person WHERE 0;
SELECT tag_id, name FROM tag WHERE 0;
SELECT auth_id, person_id, username, password FROM auth WHERE 0;
SELECT account_id, account_owner_id, name, currency, created FROM account;
SELECT operation_id, account_id, summa, description, tags, performed, created, parent_operation_id, is_actual, revision, editor_id FROM operation;
SELECT operation_tag_id, operation_id, tag_id FROM operation_tag;

ROLLBACK TRANSACTION;
