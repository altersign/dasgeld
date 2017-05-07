-- Verify dasgeld:operation/amount on sqlite
PRAGMA foreign_keys = ON;
BEGIN;

-- XXX Add verifications here.
SELECT amount FROM operation WHERE 0;

ROLLBACK;
