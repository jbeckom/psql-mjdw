CREATE TABLE p_and_c.raw_occ (
	insured varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	start_date varchar(256) NOT NULL,
	end_date varchar(256) NULL,
	valued_date varchar(256) NULL,
	claimant_name varchar(256) NULL,
	date_of_injury varchar(256) NULL,
	claim_number varchar(256) NULL,
	claim_type varchar(256) NULL,
	status varchar(256) NULL,
	state varchar(256) NULL,
	ncci_class varchar(256) NULL,
	injury_desc varchar(256) NULL,
	medical_paid varchar(256) NULL,
	medical_reserves varchar(256) NULL,
	indemnity_paid varchar(256) NULL,
	indemnity_reserves varchar(256) NULL,
	expense_paid varchar(256) NULL,
	expense_reserves varchar(256) NULL,
	actual_recov varchar(256) NULL,
	total_paid varchar(256) NULL,
	total_reserved varchar(256) NULL,
	total_incurred varchar(256) NULL,
	file_name varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_occ OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_occ to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_occ to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_occ to rpauser;
GO
GRANT SELECT ON p_and_c.raw_occ to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_occ to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_occ to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_occ to rl_p_and_c_d;
GO