BEGIN;
DROP TABLE beyond.groups CASCADE;

DROP TABLE beyond.organisation CASCADE;

DROP TABLE beyond.groups_account CASCADE;

ALTER TABLE beyond.account DROP COLUMN pk_fk_organisationid;
ALTER TABLE beyond.account DROP CONSTRAINT fk_account_organisation;

END;