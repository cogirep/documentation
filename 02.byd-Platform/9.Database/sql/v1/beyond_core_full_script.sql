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
    code TEXT NOT NULL UNIQUE,
    label JSONB NOT NULL,
    description JSONB NOT NULL,
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
    label JSONB NOT NULL,
    description JSONB NOT NULL,
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

-- Add status data in database

INSERT INTO beyond_core.status (pk_id, code, label) VALUES (1, 'ACTIF', 'Actif');
INSERT INTO beyond_core.status (pk_id, code, label) VALUES (2, 'INACTIF', 'Inactif');

-- Add permission data in database

INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (3, 'PRODUCT_CREATE', 1, '[{"label": "Create product", "languageCode": "en-EN"}, {"label": "Création d''un produit", "languageCode": "fr-FR"}]', '[{"label": "Create product", "languageCode": "en-EN"}, {"label": "Création d''un produit", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (4, 'PRODUCT_UPDATE', 1, '[{"label": "Modify product", "languageCode": "en-EN"}, {"label": "Modification d''un produit", "languageCode": "fr-FR"}]', '[{"label": "Modify product", "languageCode": "en-EN"}, {"label": "Modification d''un produit", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (5, 'PRODUCT_DELETE', 1, '[{"label": "Delete product", "languageCode": "en-EN"}, {"label": "Suppression d''un produit", "languageCode": "fr-FR"}]', '[{"label": "Delete product", "languageCode": "en-EN"}, {"label": "Suppression d''un produit", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (6, 'PRODUCT_READ', 1, '[{"label": "Read product", "languageCode": "en-EN"}, {"label": "Consultation d''un produit", "languageCode": "fr-FR"}]', '[{"label": "Read product", "languageCode": "en-EN"}, {"label": "Consultation d''un produit", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (7, 'COMPANY_READ', 1, '[{"label": "Read company", "languageCode": "en-EN"}, {"label": "Consultation d''une compagnie", "languageCode": "fr-FR"}]', '[{"label": "Read company", "languageCode": "en-EN"}, {"label": "Consultation d''une company", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (8, 'COMPANY_CREATE', 1, '[{"label": "Create company", "languageCode": "en-EN"}, {"label": "Création d''une compagnie", "languageCode": "fr-FR"}]', '[{"label": "Create company", "languageCode": "en-EN"}, {"label": "Création d''une company", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (9, 'COMPANY_UPDATE', 1, '[{"label": "Modify company", "languageCode": "en-EN"}, {"label": "Modification d''une compagnie", "languageCode": "fr-FR"}]', '[{"label": "Modify company", "languageCode": "en-EN"}, {"label": "Modification d''une company", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (1, 'ADMIN_BEYOND_MANAGEMENT', 1, '[{"label": "Manage Beyond administrator", "languageCode": "en-EN"}, {"label": "Gestion des administrateurs Beyond", "languageCode": "fr-FR"}]', '[{"label": "Manage Beyond administrator", "languageCode": "en-EN"}, {"label": "Gestion des administrateurs Beyond", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (17, 'DELEGATED_ADMIN_MANAGEMENT', 1, '[{"label": "Manage delagated administrator", "languageCode": "en-EN"}, {"label": "Gestion des administrateurs délégué", "languageCode": "fr-FR"}]', '[{"label": "Manage delegated administrator", "languageCode": "en-EN"}, {"label": "Gestion des administrateurs délégué", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (10, 'COMPANY_DELETE', 1, '[{"label": "Delete company", "languageCode": "en-EN"}, {"label": "Suppression d''une compagnie", "languageCode": "fr-FR"}]', '[{"label": "Delete company", "languageCode": "en-EN"}, {"label": "Suppression d''une company", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (11, 'USER_READ', 1, '[{"label": "Read user", "languageCode": "en-EN"}, {"label": "Consultation d''un utilisateur", "languageCode": "fr-FR"}]', '[{"label": "Read user", "languageCode": "en-EN"}, {"label": "Consultation d''un utilisateur", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (12, 'USER_CREATE', 1, '[{"label": "Create user", "languageCode": "en-EN"}, {"label": "Création d''un utilisateur", "languageCode": "fr-FR"}]', '[{"label": "Create user", "languageCode": "en-EN"}, {"label": "Création d''un utilisateur", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (13, 'USER_UPDATE', 1, '[{"label": "Modify user", "languageCode": "en-EN"}, {"label": "Modification d''un utilisateur", "languageCode": "fr-FR"}]', '[{"label": "Modify user", "languageCode": "en-EN"}, {"label": "Modification d''un utilisateur", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (14, 'USER_DELETE', 1, '[{"label": "Delete user", "languageCode": "en-EN"}, {"label": "Suppression d''un utilisateur", "languageCode": "fr-FR"}]', '[{"label": "Delete user", "languageCode": "en-EN"}, {"label": "Suppression d''un utilisateur", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (15, 'IDP_DELETE', 1, '[{"label": "Delete idp", "languageCode": "en-EN"}, {"label": "Suppression d''un idp", "languageCode": "fr-FR"}]', '[{"label": "Delete idp", "languageCode": "en-EN"}, {"label": "Suppression d''un idp", "languageCode": "fr-FR"}]');
INSERT INTO beyond_core.permission (pk_id, code, fk_statusid, label, description) VALUES (16, 'IDP_CREATE', 1, '[{"label": "Create idp", "languageCode": "en-EN"}, {"label": "Création d''un idp", "languageCode": "fr-FR"}]', '[{"label": "Create idp", "languageCode": "en-EN"}, {"label": "Création d''un idp", "languageCode": "fr-FR"}]');

-- Add role data in database

INSERT INTO beyond_core.rolebydmanager (pk_id, fk_statusid, code, label, description) VALUES (2, 1, 'DELEGATED_ADMIN', '[{"label": "Administrateur délégué", "languageCode": "fr-FR"}, {"label": "Delegated administrator", "languageCode": "en-EN"}]', '[{"label": "Administrateur délégué", "languageCode": "fr-FR"}, {"label": "Delegated administrator", "languageCode": "en-EN"}]');
INSERT INTO beyond_core.rolebydmanager (pk_id, fk_statusid, code, label, description) VALUES (1, 1, 'ADMIN_BEYOND', '[{"label": "Administrateur BEYOND", "languageCode": "fr-FR"}, {"label": "Administrator BEYOND", "languageCode": "en-EN"}]', '[{"label": "Administrateur Beyond", "languageCode": "fr-FR"}, {"label": "Administrator Beyond", "languageCode": "en-EN"}]');

-- add permission_role data in database

INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 1, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 3, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 4, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 5, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 6, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 7, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 8, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 9, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 10, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 11, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 12, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 13, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 14, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 15, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 16, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (1, 17, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 3, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 4, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 5, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 6, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 7, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 8, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 9, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 10, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 11, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 12, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 13, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 14, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 15, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 16, 1);
INSERT INTO beyond_core.role_permission (fk_roleid, fk_permissionid, fk_statusid) VALUES (2, 17, 1);
