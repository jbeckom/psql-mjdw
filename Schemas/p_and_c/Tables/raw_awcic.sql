CREATE TABLE p_and_c.raw_awcic (
	client_id varchar(256) NULL,
	policy_number varchar(256) NULL,
	policy_effective_date varchar(256) NULL,
	policy_expiration_date varchar(256) NULL,
	rate_state varchar(256) NULL,
	accident_date varchar(256) NULL,
	claim_type varchar(256) NULL,
	claim_number varchar(256) NULL,
	claimant_name varchar(256) NULL,
	body_part varchar(256) NULL,
	cause_of_loss varchar(256) NULL,
	total_paid varchar(256) NULL,
	total_reserve varchar(256) NULL,
	total_incurred varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_awcic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_awcic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_awcic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_awcic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_awcic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_awcic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_awcic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_awcic to rl_p_and_c_d;
GO