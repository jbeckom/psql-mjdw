CREATE TABLE p_and_c.raw_qbe (
	client varchar(256) NOT NULL,
	as_of_date varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	policy_end_date varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_description varchar(256) NOT NULL,
	adjuster_name varchar(256) NOT NULL,
	wc_claim_type varchar(256) NULL,
	state varchar(256) NOT NULL,
	current_status varchar(256) NOT NULL,
	as_of_status varchar(256) NOT NULL,
	accident_date varchar(256) NOT NULL,
	reported_date varchar(256) NOT NULL,
	setup_date varchar(256) NOT NULL,
	closed_date varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	mtc varchar(256) NOT NULL,
	mtc_address varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	net_paid varchar(256) NOT NULL,
	remaining_reserves varchar(256) NOT NULL,
	total_paid varchar(256) NOT NULL,
	total_recoveries varchar(256) NOT NULL,
	total_days_open varchar(256) NOT NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_qbe OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_qbe to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_qbe to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_qbe to rpauser;
GO
GRANT SELECT ON p_and_c.raw_qbe to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_qbe to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_qbe to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_qbe to rl_p_and_c_d;
GO