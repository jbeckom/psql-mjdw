CREATE TABLE if not exists eb.table_history(
    id                  BIGINT GENERATED ALWAYS AS IDENTITY,
	log_timestamp       timestamp NULL DEFAULT now(),
	schema_name         text NULL,
	table_name          text NULL,
	operation           text NULL,
	user_name           text NULL DEFAULT SESSION_USER,
	old_table_record    json NULL,
	new_table_record    json NULL,
	CONSTRAINT eb_table_history_pk PRIMARY KEY (id)
);
GO;

ALTER TABLE eb.table_history OWNER TO mj_admin;
GO;

GRANT SELECT ON eb.table_history to rl_eb_full
GO;