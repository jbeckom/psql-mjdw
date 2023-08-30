
CREATE TABLE p_and_c.all_policies_override (
	policy_id int4 NULL,
	policy_id_suff int4 NULL,
	client_id varchar(16) NULL,
	carrier_id varchar(8) NULL,
	policy_number varchar(128) NULL,
	coverage_type_id varchar(8) NULL,
	premium numeric(18) NULL,
	policy_start_date date NULL,
	policy_end_date date NULL,
	prev_policy_id int8 NULL,
	captive_freq_fund numeric(18) NULL,
	captive_sev_fund numeric(18) NULL,
	retro_min_premium numeric(18) NULL,
	retro_max_premium numeric(18) NULL,
	retro_loss_factor numeric NULL,
	retro_tax_multiplier numeric NULL,
	captive_risk_sharing_inc numeric NULL,
	captive_assessments numeric NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.all_policies_override OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.all_policies_override to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_policies_override to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_policies_override to rpauser;
GO
GRANT SELECT ON p_and_c.all_policies_override to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_policies_override to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_policies_override to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_policies_override to rl_p_and_c_d;
GO