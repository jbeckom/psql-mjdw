CREATE TABLE p_and_c.raw_allianz_2021 (
	extract_date varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	agent varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_effective_date varchar(256) NOT NULL,
	policy_expiration_date varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	accident_date varchar(256) NOT NULL,
	claim_description varchar(256) NOT NULL,
	occurrence_number varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	indemnity_paid varchar(256) NOT NULL,
	expenses_paid varchar(256) NOT NULL,
	recovery_paid varchar(256) NOT NULL,
	recovery_exp_paid varchar(256) NOT NULL,
	indemnity_reserves varchar(256) NOT NULL,
	expenses_reserves varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_allianz_2021 OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_allianz_2021 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_allianz_2021 to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_allianz_2021 to rpauser;
GO
GRANT SELECT ON p_and_c.raw_allianz_2021 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_allianz_2021 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_allianz_2021 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_allianz_2021 to rl_p_and_c_d;
GO