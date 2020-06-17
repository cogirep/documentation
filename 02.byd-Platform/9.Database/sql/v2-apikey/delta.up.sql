BEGIN;

CREATE  TABLE beyond_core.apikey ( 
	pk_id           bigserial  NOT NULL,
	fk_product      bigint  NOT NULL,
	code            text  NOT NULL,
	apikey_name     text  NOT NULL,
	apikey_value    text  NOT NULL DEFAULT md5(random()::text || clock_timestamp()::text)::uuid,
	"role"          text  NOT NULL CHECK ("role" IN ('CLIENT', 'PROVIDER')),
	status          bigint  NOT NULL,
	created_at      timestamptz DEFAULT current_timestamp NOT NULL,
	created_by      bigint  NOT NULL,
	updated_at      timestamptz DEFAULT current_timestamp NOT NULL,
	updated_by      bigint  NOT NULL,
	CONSTRAINT pk_apikey_pk_id PRIMARY KEY ( pk_id ),
	CONSTRAINT fk_apikey_product FOREIGN KEY ( fk_product ) REFERENCES beyond_core.product( pk_id ),
	CONSTRAINT fk_apikey_status FOREIGN KEY ( status ) REFERENCES beyond_core.status( pk_id ),
	CONSTRAINT fk_apikey_account_createdby FOREIGN KEY ( created_by ) REFERENCES beyond_core.account( pk_id ),
	CONSTRAINT fk_apikey_account_updatedby FOREIGN KEY ( updated_by ) REFERENCES beyond_core.account( pk_id )
);

END;