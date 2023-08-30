CREATE TABLE p_and_c.loss_run_control (
	sg_pol_seq int8 NOT NULL,
	client_id varchar(256) NULL,
	active bool NULL,
	monthly bool NULL,
	quarterly bool NULL,
	annually bool NULL,
	as_needed bool NULL,
	future bool NULL,
	all_closed bool NULL,
	pull_method varchar(256) NULL,
	guide varchar(256) NULL,
	search_criteria varchar(256) NULL,
	subfolder varchar(256) NULL,
	rpa_active bool NULL,
	send_to_client bool NULL,
	client_file_type varchar(256) NULL,
	to_email_address varchar(256) NULL,
	to_email_subject varchar(512) NULL,
	from_email_address varchar(256) NULL,
	from_email_subject varchar(512) NULL,
	attachment_name varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL,
	file_save_code varchar(1) NULL,
	CONSTRAINT lrc_pk PRIMARY KEY (sg_pol_seq)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.loss_run_control OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.loss_run_control to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.loss_run_control to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.loss_run_control to rpauser;
GO
GRANT SELECT ON p_and_c.loss_run_control to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.loss_run_control to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.loss_run_control to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.loss_run_control to rl_p_and_c_d;
GO