CREATE TABLE p_and_c.raw_gmcc (
	name_insured varchar(256) NOT NULL,
	run_date varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	loc_unit varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	term varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	cause_of_loss varchar(256) NOT NULL,
	amt_paid varchar(256) NOT NULL,
	reserve varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_gmcc OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_gmcc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_gmcc to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_gmcc to rpauser;
GO
GRANT SELECT ON p_and_c.raw_gmcc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_gmcc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_gmcc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_gmcc to rl_p_and_c_d;
GO