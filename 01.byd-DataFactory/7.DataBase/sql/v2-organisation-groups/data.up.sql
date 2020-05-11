BEGIN;

WITH orga AS (
  INSERT INTO beyond.organisation (label, description) VALUES ('IBM', 'IBM Lille') RETURNING pk_id
)

UPDATE beyond.account SET pk_fk_organisationid = (select pk_id from orga);

END;