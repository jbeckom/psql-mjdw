DROP TABLE p_and_c.loss_run_tracker;
GO

CREATE TABLE p_and_c.loss_run_tracker (
	policy_num int8 NULL,
	policy_eff_date date NULL,
	client_id varchar(256) NULL,
	carrier varchar(256) NULL,
	pull_date date NULL,
	pull_method varchar(256) NULL,
	guide varchar(256) NULL,
	search_criteria varchar(256) NULL,
	subfolder varchar(256) NULL,
	saved bool NULL DEFAULT false,
	imported bool NULL DEFAULT false,
	rpa_active bool NULL DEFAULT false,
	coverage_type varchar(256) NULL,
	send_to_client bool NULL DEFAULT false,
	client_file_type varchar(256) NULL,
	sent bool NULL DEFAULT false,
	unique_id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	from_email_subject varchar(512) NULL,
	to_email_address varchar(256) NULL,
	from_email_address varchar(256) NULL,
	request_sent bool NULL DEFAULT false,
	to_email_subject varchar(512) NULL,
	policy_to_request varchar(256) NULL,
	attachment_name varchar(256) NULL,
	file_save_code varchar(1) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.loss_run_tracker OWNER TO mj_admin;
GO

Grant select,update on table p_and_c.loss_run_tracker to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.loss_run_tracker to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.loss_run_tracker to rpauser;
GO
GRANT SELECT ON p_and_c.loss_run_tracker to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.loss_run_tracker to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.loss_run_tracker to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.loss_run_tracker to rl_p_and_c_d;
GO