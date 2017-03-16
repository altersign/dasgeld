-- Revert dasgeld:baseschema from sqlite
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

DROP TABLE IF EXISTS operation_tag;
DROP VIEW IF EXISTS actual_operation;

DROP TRIGGER IF EXISTS drop_is_actual;
DROP TRIGGER IF EXISTS next_operation_revision;

DROP TABLE IF EXISTS operation;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS auth;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS person;

COMMIT TRANSACTION;
