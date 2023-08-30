CREATE TABLE p_and_c.raw_cap_spec (
	policy_number varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	policy_term varchar(256) NOT NULL,
	claim_period_shown varchar(256) NOT NULL,
	report_date varchar(256) NOT NULL,
	agency varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	claim_description varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	adjuster varchar(256) NULL,
	coverage varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	paid varchar(256) NOT NULL,
	reserve varchar(256) NOT NULL,
	recoveries varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_cap_spec OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_cap_spec to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_cap_spec to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_cap_spec to rpauser;
GO
GRANT SELECT ON p_and_c.raw_cap_spec to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_cap_spec to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_cap_spec to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_cap_spec to rl_p_and_c_d;
GO