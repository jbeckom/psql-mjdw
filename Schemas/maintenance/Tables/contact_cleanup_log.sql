CREATE TABLE maintenance.contact_cleanup_cards_log (
	guid uuid NOT NULL,
	contact_source varchar(16) NOT NULL,
	source_key int4 NOT NULL,
	servicer_id varchar(8) NOT NULL,
	creation_time varchar(256) NOT NULL,
	response_time varchar(256) NULL,
	sg_success varchar(256) NULL,
	bp_success varchar(256) NULL,
	powerapps_success varchar(256) NULL,
	completion_time varchar(256) NULL,
	CONSTRAINT contact_cleanup_cards_log_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSION ***/
ALTER TABLE maintenance.contact_cleanup_cards_log OWNER TO mj_admin;
GO 

GRANT SELECT ON maintenance.contact_cleanup_cards_log TO rl_maintenance_r;
GO 

GRANT INSERT ON maintenance.contact_cleanup_cards_log TO rl_maintenance_a;
GO 

GRANT UPDATE ON maintenance.contact_cleanup_cards_log TO rl_maintenance_w;
GO 

