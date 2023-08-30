DROP TABLE pc_ops.contact_cleanup_cards_log;
GO

CREATE TABLE pc_ops.contact_cleanup_cards_log (
	guid uuid NOT NULL,
	contact_source varchar(16) NOT NULL,
	source_key int4 NOT NULL,
	servicer_id varchar(16) NOT NULL,
	creation_time varchar(256) NOT NULL,
	response_time varchar(256) NULL,
	sg_success varchar(256) NULL,
	bp_success varchar(256) NULL,
	powerapps_success varchar(256) NULL,
	completion_time varchar(256) NULL,
	vertafore_error varchar(2048) NULL,
	powerapps_error varchar(2048) NULL,
	skipped boolean NOT NULL DEFAULT FALSE,
	CONSTRAINT contact_cleanup_cards_log_pkey PRIMARY KEY (guid)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE pc_ops.contact_cleanup_cards_log OWNER TO mj_admin;
GO

Grant select on table pc_ops.contact_cleanup_cards_log to rl_pc_data_analyst;
GO

Grant delete, update, insert, select on table pc_ops.contact_cleanup_cards_log to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table pc_ops.contact_cleanup_cards_log to rpauser;
GO
GRANT SELECT ON pc_ops.contact_cleanup_cards_log to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.contact_cleanup_cards_log to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.contact_cleanup_cards_log to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.contact_cleanup_cards_log to rl_pc_ops_d;
GO