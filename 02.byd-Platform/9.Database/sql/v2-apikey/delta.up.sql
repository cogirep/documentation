BEGIN;

CREATE  TABLE beyond_core.apikey ( 
	pk_id                bigserial  NOT NULL ,
	fk_product           bigint  NOT NULL ,
	code                 text  NOT NULL ,
	apikey_name          text  NOT NULL ,
	apikey_value         text  NOT NULL ,
	"role"               text  NOT NULL ,
	status               bigint  NOT NULL ,
	created_at           timestamptz DEFAULT current_timestamp NOT NULL ,
	created_by           bigint  NOT NULL ,
	updated_at           timestamptz DEFAULT current_timestamp NOT NULL ,
	updated_by           bigint  NOT NULL ,
	CONSTRAINT pk_apikey_pk_id PRIMARY KEY ( pk_id ),
	CONSTRAINT fk_apikey_product FOREIGN KEY ( fk_product ) REFERENCES core.product( pk_id )  ,
	CONSTRAINT fk_apikey_status FOREIGN KEY ( status ) REFERENCES core.status( pk_id )  ,
	CONSTRAINT fk_apikey_account FOREIGN KEY ( created_by ) REFERENCES core.account( pk_id )  ,
	CONSTRAINT fk_apikey_account_0 FOREIGN KEY ( updated_by ) REFERENCES core.account( pk_id )  
 );

END;