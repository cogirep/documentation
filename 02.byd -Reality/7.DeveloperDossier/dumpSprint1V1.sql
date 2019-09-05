--
-- PostgreSQL database dump
--

 

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

 

-- Started on 2019-08-12 16:44:47 CEST

 

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

 

--
-- TOC entry 8 (class 2615 OID 123525)
-- Name: beyond; Type: SCHEMA; Schema: -; Owner: postgres
--

 

CREATE SCHEMA beyond;

 

--
-- TOC entry 189 (class 1259 OID 123582)
-- Name: account_pk_id_seq; Type: SEQUENCE; Schema: beyond; Owner: postgres
--

 

CREATE SEQUENCE beyond.account_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

 

 

 

SET default_tablespace = '';

 

SET default_with_oids = false;

 

--
-- TOC entry 186 (class 1259 OID 123532)
-- Name: account; Type: TABLE; Schema: beyond; Owner: postgres
--

 

CREATE TABLE beyond.account (
    pk_id bigint DEFAULT nextval('beyond.account_pk_id_seq'::regclass) NOT NULL,
    email character varying,
    firstname character varying,
    lastname character varying,
    status character varying NOT NULL,
    owner character varying,
    consumer character varying
);

 

 

 

--
-- TOC entry 188 (class 1259 OID 123554)
-- Name: account_permission; Type: TABLE; Schema: beyond; Owner: postgres
--

 

CREATE TABLE beyond.account_permission (
    pk_fk_accountid integer NOT NULL,
    pk_fk_permissionid integer NOT NULL,
    status character varying NOT NULL
);

 

 

 

--
-- TOC entry 187 (class 1259 OID 123546)
-- Name: permission; Type: TABLE; Schema: beyond; Owner: postgres
--

 

CREATE TABLE beyond.permission (
    pk_id bigint NOT NULL,
    code character varying,
    label character varying,
    description character varying
);

 

 

 

--
-- TOC entry 2406 (class 0 OID 123532)
-- Dependencies: 186
-- Data for Name: account; Type: TABLE DATA; Schema: beyond; Owner: postgres
--

 

INSERT INTO beyond.account (pk_id, email, firstname, lastname, status, owner, consumer) VALUES (2, 'dominique.parsis-ISC_France@fr.ibm.com', 'Dominique', 'PARSIS', 'ACTIF', NULL, NULL);
INSERT INTO beyond.account (pk_id, email, firstname, lastname, status, owner, consumer) VALUES (3, 'nico@ibm.com', 'nico', 'nico', 'ACTIF', NULL, NULL);
INSERT INTO beyond.account (pk_id, email, firstname, lastname, status, owner, consumer) VALUES (32, 'nbbcbb-isc.france@ibm.com', 'nicolas', 'delbe', 'ACTIF', NULL, NULL);
INSERT INTO beyond.account (pk_id, email, firstname, lastname, status, owner, consumer) VALUES (31, 'nbbbb-isc.france@ibm.com', 'nicolassss', 'delbeeeeee', 'ACTIF', NULL, NULL);

 


--
-- TOC entry 2408 (class 0 OID 123554)
-- Dependencies: 188
-- Data for Name: account_permission; Type: TABLE DATA; Schema: beyond; Owner: postgres
--

 

INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (32, 3, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (32, 1, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (32, 2, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (32, 4, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (32, 5, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (31, 2, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (31, 3, 'ACTIF');
INSERT INTO beyond.account_permission (pk_fk_accountid, pk_fk_permissionid, status) VALUES (31, 1, 'ACTIF');

 


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 189
-- Name: account_pk_id_seq; Type: SEQUENCE SET; Schema: beyond; Owner: postgres
--

 

SELECT pg_catalog.setval('beyond.account_pk_id_seq', 32, true);

 


--
-- TOC entry 2407 (class 0 OID 123546)
-- Dependencies: 187
-- Data for Name: permission; Type: TABLE DATA; Schema: beyond; Owner: postgres
--

 

INSERT INTO beyond.permission (pk_id, code, label, description) VALUES (1, 'ADMIN', 'administrer', 'administrer');
INSERT INTO beyond.permission (pk_id, code, label, description) VALUES (2, 'IMPORT', 'Importer', 'Importer');
INSERT INTO beyond.permission (pk_id, code, label, description) VALUES (3, 'TRANSFORM', 'Transformer', 'Transformer');
INSERT INTO beyond.permission (pk_id, code, label, description) VALUES (4, 'ACCESS', 'Accéder', 'Accéder');
INSERT INTO beyond.permission (pk_id, code, label, description) VALUES (5, 'DOWNLOAD', 'Télécharger', 'Télécharger');

 


--
-- TOC entry 2281 (class 2606 OID 123539)
-- Name: account pk_account; Type: CONSTRAINT; Schema: beyond; Owner: postgres
--

 

ALTER TABLE ONLY beyond.account
    ADD CONSTRAINT pk_account PRIMARY KEY (pk_id);

 


--
-- TOC entry 2286 (class 2606 OID 123561)
-- Name: account_permission pk_account_permission; Type: CONSTRAINT; Schema: beyond; Owner: postgres
--

 

ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT pk_account_permission PRIMARY KEY (pk_fk_accountid, pk_fk_permissionid);

 


--
-- TOC entry 2283 (class 2606 OID 123553)
-- Name: permission pk_permission; Type: CONSTRAINT; Schema: beyond; Owner: postgres
--

 

ALTER TABLE ONLY beyond.permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (pk_id);

 


--
-- TOC entry 2284 (class 1259 OID 123562)
-- Name: idx_account_permission_pk_fk_permissionid; Type: INDEX; Schema: beyond; Owner: postgres
--

 

CREATE INDEX idx_account_permission_pk_fk_permissionid ON beyond.account_permission USING btree (pk_fk_permissionid);

 


--
-- TOC entry 2288 (class 2606 OID 123568)
-- Name: account_permission fk_account_permission_account; Type: FK CONSTRAINT; Schema: beyond; Owner: postgres
--

 

ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT fk_account_permission_account FOREIGN KEY (pk_fk_accountid) REFERENCES beyond.account(pk_id);

 


--
-- TOC entry 2287 (class 2606 OID 123563)
-- Name: account_permission fk_account_permission_permission; Type: FK CONSTRAINT; Schema: beyond; Owner: postgres
--

 

ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT fk_account_permission_permission FOREIGN KEY (pk_fk_permissionid) REFERENCES beyond.permission(pk_id);

 


-- Completed on 2019-08-12 16:44:48 CEST

 

--
-- PostgreSQL database dump complete
--