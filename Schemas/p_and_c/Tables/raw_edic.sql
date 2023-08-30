DROP Table if exists p_and_c.raw_edic CASCADE;
GO

CREATE TABLE p_and_c.raw_edic (
	insured varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_period varchar(256) NULL,
	cancel_date varchar(256) NULL,
	lob varchar(256) NULL,
	as_of varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_status varchar(256) NULL,
	closed_date varchar(256) NULL,
	date_of_loss varchar(256) NULL,
	date_reported varchar(256) NULL,
	days_between varchar(256) NULL,
	description_of_loss varchar(256) NULL,
	cause_of_loss varchar(256) NULL,
	loss_state_loc_veh_num varchar(256) NULL,
	claimant_name varchar(256) NULL,
	driver_class_cd varchar(256) NULL,
	loss_subline varchar(256) NULL,
	indemnity_paid varchar(256) NULL,
	indemnity_reserve varchar(256) NULL,
	indemnity_incurred varchar(256) NULL,
	medical_paid varchar(256) NULL,
	medical_reserve varchar(256) NULL,
	medical_incurred varchar(256) NULL,
	expense_paid varchar(256) NULL,
	expense_reserve varchar(256) NULL,
	expense_incurred varchar(256) NULL,
	subro_salvage varchar(256) NULL,
	deductible_recovery varchar(256) NULL,
	total_paid varchar(256) NULL,
	total_reserve varchar(256) NULL,
	total_incurred varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_edic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_edic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_edic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_edic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_edic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_edic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_edic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_edic to rl_p_and_c_d;
GO