BEGIN;

--
-- Organisation table
---
CREATE TABLE beyond.organisation
(
    pk_id bigserial NOT NULL ,
    label character varying,
    description character varying,
    CONSTRAINT pk_organisation PRIMARY KEY (pk_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE beyond.organisation
    OWNER to "ibm-cloud-base-user";

--
-- Groups table
---
CREATE TABLE beyond.groups
(
    pk_id bigserial NOT NULL,
    label character varying,
    description character varying,
    pk_fk_organisationid bigint,
    CONSTRAINT pk_group PRIMARY KEY (pk_id),
    CONSTRAINT fk_group_organisation FOREIGN KEY (pk_fk_organisationid)
        REFERENCES beyond.organisation (pk_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE beyond.groups
    OWNER to "ibm-cloud-base-user";

--
-- groups_account table
---
CREATE TABLE beyond.groups_account
(
    pk_fk_accountid bigint NOT NULL,
    pk_fk_groupid bigint NOT NULL,
    status character varying,
    CONSTRAINT pk_group_account PRIMARY KEY (pk_fk_accountid, pk_fk_groupid),
    CONSTRAINT fk_account_group_group FOREIGN KEY (pk_fk_groupid)
        REFERENCES beyond.groups (pk_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE beyond.groups_account
    OWNER to "ibm-cloud-base-user";
CREATE INDEX idx_account_group_pk_fk_groupid
    ON beyond.groups_account USING btree
    (pk_fk_groupid ASC NULLS LAST)
    TABLESPACE pg_default;

--
-- Account table
--
ALTER TABLE beyond.account
    ADD COLUMN pk_fk_organisationid bigint;
ALTER TABLE beyond.account
    ADD CONSTRAINT fk_account_organisation FOREIGN KEY (pk_fk_organisationid)
    REFERENCES beyond.organisation (pk_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;