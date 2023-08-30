CREATE TABLE p_and_c.raw_chubb_other (
	policy_number varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	policy_end_date varchar(256) NOT NULL,
	insured_name varchar(256) NOT NULL,
	sub_ltr varchar(256) NOT NULL,
	occurrence_id varchar(256) NOT NULL,
	proc_aim varchar(256) NOT NULL,
	event_date varchar(256) NOT NULL,
	made_date varchar(256) NULL,
	report_date varchar(256) NOT NULL,
	close_date varchar(256) NOT NULL,
	reopen_date varchar(256) NULL,
	state varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	claimant varchar(256) NOT NULL,
	sts varchar(256) NOT NULL,
	gross_paid_loss varchar(256) NOT NULL,
	gross_paid_expense varchar(256) NOT NULL,
	gross_outstanding varchar(256) NOT NULL,
	gross_incurred_loss varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_chubb_other OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_chubb_other to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_chubb_other to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_chubb_other to rpauser;
GO
GRANT SELECT ON p_and_c.raw_chubb_other to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_chubb_other to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_chubb_other to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_chubb_other to rl_p_and_c_d;
GO