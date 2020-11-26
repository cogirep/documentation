CREATE SCHEMA beyond;


--
-- Name: account_pk_id_seq; Type: SEQUENCE; Schema: beyond
--

CREATE SEQUENCE beyond.account_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.account (
    pk_id bigint DEFAULT nextval('beyond.account_pk_id_seq'::regclass) NOT NULL,
    email character varying,
    firstname character varying,
    lastname character varying,
    status character varying NOT NULL,
    "group" character varying,
    "providerId" character varying(255),
    pk_fk_organisationid bigint
);


--
-- Name: account_permission; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.account_permission (
    pk_fk_accountid integer NOT NULL,
    pk_fk_permissionid integer NOT NULL,
    status character varying NOT NULL
);


--
-- Name: connected; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.connected (
    pk_id bigint NOT NULL,
    email character varying NOT NULL,
    token character varying NOT NULL,
    lastconnectiondate timestamp(4) with time zone NOT NULL
);


--
-- Name: connected_pk_id_seq; Type: SEQUENCE; Schema: beyond
--
CREATE SEQUENCE beyond.connected_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: connected_pk_id_seq1; Type: SEQUENCE; Schema: beyond
--
CREATE SEQUENCE beyond.connected_pk_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: connected_pk_id_seq1; Type: SEQUENCE OWNED BY; Schema: beyond
--
ALTER SEQUENCE beyond.connected_pk_id_seq1 OWNED BY beyond.connected.pk_id;


--
-- Name: group_pk_id_seq; Type: SEQUENCE; Schema: beyond
--
CREATE SEQUENCE beyond.group_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.groups (
    pk_id bigint DEFAULT nextval('beyond.group_pk_id_seq'::regclass) NOT NULL,
    label character varying,
    description character varying,
    pk_fk_organisationid bigint
);


--
-- Name: groups_account; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.groups_account (
    pk_fk_accountid integer NOT NULL,
    pk_fk_groupid integer NOT NULL,
    status character varying NOT NULL
);


--
-- Name: interlocutor; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.interlocutor (
    pk_id integer NOT NULL,
    code character varying NOT NULL,
    type character varying,
    url character varying NOT NULL,
    "order" bigint NOT NULL,
    iconcode character varying NOT NULL,
    status character varying NOT NULL,
    label jsonb,
    tooltip jsonb
);


--
-- Name: interlocutor_pk_id_seq; Type: SEQUENCE; Schema: beyond
--
CREATE SEQUENCE beyond.interlocutor_pk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interlocutor_pk_id_seq; Type: SEQUENCE OWNED BY; Schema: beyond
--
ALTER SEQUENCE beyond.interlocutor_pk_id_seq OWNED BY beyond.interlocutor.pk_id;


--
-- Name: organisation_pk_id_seq; Type: SEQUENCE; Schema: beyond
--
CREATE SEQUENCE beyond.organisation_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organisation; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.organisation (
    pk_id bigint DEFAULT nextval('beyond.organisation_pk_id_seq'::regclass) NOT NULL,
    label character varying,
    description character varying
);


--
-- Name: permission; Type: TABLE; Schema: beyond
--
CREATE TABLE beyond.permission (
    pk_id bigint DEFAULT nextval('beyond.account_pk_id_seq'::regclass) NOT NULL,
    code character varying,
    label character varying,
    description character varying
);


--
-- Name: connected pk_id; Type: DEFAULT; Schema: beyond
--
ALTER TABLE ONLY beyond.connected ALTER COLUMN pk_id SET DEFAULT nextval('beyond.connected_pk_id_seq1'::regclass);


--
-- Name: interlocutor pk_id; Type: DEFAULT; Schema: beyond
--
ALTER TABLE ONLY beyond.interlocutor ALTER COLUMN pk_id SET DEFAULT nextval('beyond.interlocutor_pk_id_seq'::regclass);



--
-- Name: account pk_account; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.account
    ADD CONSTRAINT pk_account PRIMARY KEY (pk_id);


--
-- Name: account_permission pk_account_permission; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT pk_account_permission PRIMARY KEY (pk_fk_accountid, pk_fk_permissionid);


--
-- Name: interlocutor pk_company; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.interlocutor
    ADD CONSTRAINT pk_company PRIMARY KEY (pk_id);


--
-- Name: groups pk_group; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.groups
    ADD CONSTRAINT pk_group PRIMARY KEY (pk_id);


--
-- Name: groups_account pk_group_account; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.groups_account
    ADD CONSTRAINT pk_group_account PRIMARY KEY (pk_fk_accountid, pk_fk_groupid);


--
-- Name: connected pk_id; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.connected
    ADD CONSTRAINT pk_id PRIMARY KEY (pk_id);


--
-- Name: organisation pk_organisation; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.organisation
    ADD CONSTRAINT pk_organisation PRIMARY KEY (pk_id);


--
-- Name: permission pk_permission; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (pk_id);


--
-- Name: idx_account_group_pk_fk_groupid; Type: INDEX; Schema: beyond
--
CREATE INDEX idx_account_group_pk_fk_groupid ON beyond.groups_account USING btree (pk_fk_groupid);


--
-- Name: idx_account_permission_pk_fk_permissionid; Type: INDEX; Schema: beyond
--
CREATE INDEX idx_account_permission_pk_fk_permissionid ON beyond.account_permission USING btree (pk_fk_permissionid);


--
-- Name: groups_account fk_account_group_group; Type: FK CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.groups_account
    ADD CONSTRAINT fk_account_group_group FOREIGN KEY (pk_fk_groupid) REFERENCES beyond.groups(pk_id);


--
-- Name: account fk_account_organisation; Type: FK CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.account
    ADD CONSTRAINT fk_account_organisation FOREIGN KEY (pk_fk_organisationid) REFERENCES beyond.organisation(pk_id);


--
-- Name: account_permission fk_account_permission_account; Type: FK CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT fk_account_permission_account FOREIGN KEY (pk_fk_accountid) REFERENCES beyond.account(pk_id);


--
-- Name: account_permission fk_account_permission_permission; Type: FK CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.account_permission
    ADD CONSTRAINT fk_account_permission_permission FOREIGN KEY (pk_fk_permissionid) REFERENCES beyond.permission(pk_id);


--
-- Name: groups fk_group_organisation; Type: FK CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.groups
    ADD CONSTRAINT fk_group_organisation FOREIGN KEY (pk_fk_organisationid) REFERENCES beyond.organisation(pk_id);
