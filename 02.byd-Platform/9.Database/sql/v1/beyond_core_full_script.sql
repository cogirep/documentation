CREATE TABLE beyond_core.account (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    fk_companyid BIGINT,
    email TEXT NOT NULL UNIQUE,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    provider_userid TEXT UNIQUE,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.company (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE beyond_core.idp (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    fk_companyid BIGINT NOT NULL,
    name TEXT NOT NULL UNIQUE,
    patern_email TEXT NOT NULL
);

CREATE TABLE beyond_core.company_role_account (
    fk_accountid BIGINT,
    fk_companyid BIGINT,
    fk_roleid BIGINT,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.rolebydmanager (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    label TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.role_permission (
    fk_roleid BIGINT,
    fk_permissionid BIGINT,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.permission (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.account_product (
    fk_company_productid BIGINT,
    fk_accountid BIGINT,
    is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE beyond_core.company_product (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    fk_companyid BIGINT,
    fk_productid BIGINT,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.product (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    fk_producttypeid BIGINT,
    fk_businesscodeid BIGINT,
    code TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL UNIQUE,
    description JSONB,
    image TEXT,
    icon TEXT,
    url_app TEXT,
    open_tab BOOLEAN DEFAULT FALSE,
    fk_statusid BIGINT NOT NULL
);

CREATE TABLE beyond_core.product_type (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    type TEXT NOT NULL UNIQUE
);

CREATE TABLE beyond_core.business_code (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    business_code TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL
);

CREATE TABLE beyond_core.status (
    pk_id BIGSERIAL NOT NULL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL UNIQUE
);

-- Add foreign keys

ALTER TABLE ONLY beyond_core.account
    ADD CONSTRAINT fk_account_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.account
    ADD CONSTRAINT fk_account_company FOREIGN KEY (fk_companyid) REFERENCES beyond_core.company(pk_id);

ALTER TABLE ONLY beyond_core.account_product
    ADD CONSTRAINT fk_acount_product_account FOREIGN KEY (fk_accountid) REFERENCES beyond_core.account(pk_id);

ALTER TABLE ONLY beyond_core.account_product
    ADD CONSTRAINT fk_acount_product_company_product FOREIGN KEY (fk_company_productid) REFERENCES beyond_core.company_product(pk_id);

ALTER TABLE ONLY beyond_core.company_product
    ADD CONSTRAINT fk_company_product_company FOREIGN KEY (fk_companyid) REFERENCES beyond_core.company(pk_id);

ALTER TABLE ONLY beyond_core.company_product
    ADD CONSTRAINT fk_company_product_product    FOREIGN KEY (fk_productid) REFERENCES beyond_core.product(pk_id);

ALTER TABLE ONLY beyond_core.company_product
    ADD CONSTRAINT fk_company_product_status    FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.company_role_account
    ADD CONSTRAINT fk_company_role_account_company FOREIGN KEY (fk_companyid) REFERENCES beyond_core.company(pk_id);

ALTER TABLE ONLY beyond_core.company_role_account
    ADD CONSTRAINT fk_company_role_account_account FOREIGN KEY (fk_accountid) REFERENCES beyond_core.account(pk_id);

ALTER TABLE ONLY beyond_core.company_role_account
    ADD CONSTRAINT fk_company_role_account_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.company_role_account
    ADD CONSTRAINT fk_company_role_account_rolebymanager FOREIGN KEY (fk_roleid) REFERENCES beyond_core.rolebydmanager(pk_id);

ALTER TABLE ONLY beyond_core.idp
    ADD CONSTRAINT fk_idp_company FOREIGN KEY (fk_companyid) REFERENCES beyond_core.company(pk_id);

ALTER TABLE ONLY beyond_core.permission
    ADD CONSTRAINT fk_permission_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.product
    ADD CONSTRAINT fk_product_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.product
    ADD CONSTRAINT fk_product_product_type FOREIGN KEY (fk_producttypeid) REFERENCES beyond_core.product_type(pk_id);

ALTER TABLE ONLY beyond_core.product
    ADD CONSTRAINT fk_product_business_code FOREIGN KEY (fk_businesscodeid) REFERENCES beyond_core.business_code(pk_id);

ALTER TABLE ONLY beyond_core.role_permission
    ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (fk_permissionid) REFERENCES beyond_core.permission(pk_id);

ALTER TABLE ONLY beyond_core.role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (fk_roleid) REFERENCES beyond_core.rolebydmanager(pk_id);

ALTER TABLE ONLY beyond_core.role_permission
    ADD CONSTRAINT fk_role_permission_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);

ALTER TABLE ONLY beyond_core.rolebydmanager
    ADD CONSTRAINT fk_role_status FOREIGN KEY (fk_statusid) REFERENCES beyond_core.status(pk_id);