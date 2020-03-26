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
    "providerId" character varying(255)
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
-- Name: connected pk_id; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.connected
    ADD CONSTRAINT pk_id PRIMARY KEY (pk_id);


--
-- Name: permission pk_permission; Type: CONSTRAINT; Schema: beyond
--
ALTER TABLE ONLY beyond.permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (pk_id);


--
-- Name: idx_account_permission_pk_fk_permissionid; Type: INDEX; Schema: beyond
--
CREATE INDEX idx_account_permission_pk_fk_permissionid ON beyond.account_permission USING btree (pk_fk_permissionid);


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
