CREATE TABLE p_and_c.raw_starr (
	"date" varchar(256) NOT NULL,
	valued_at varchar(256) NOT NULL,
	client varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_effective_dates varchar(256) NOT NULL,
	policy_cancel_date varchar(256) NULL,
	carrier varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_status varchar(256) NOT NULL,
	claim_class_locs varchar(256) NOT NULL,
	juris_acc_state varchar(256) NOT NULL,
	client_claim_ varchar(256) NULL,
	occurrence_id varchar(256) NULL,
	ded_sir varchar(256) NULL,
	claimant_name varchar(256) NOT NULL,
	accident_date varchar(256) NOT NULL,
	social_security varchar(256) NULL,
	injury_type varchar(256) NULL,
	occupation varchar(256) NULL,
	hire_date varchar(256) NULL,
	litigation varchar(256) NOT NULL,
	const_def varchar(256) NOT NULL,
	desc_of_accident varchar(4096) NOT NULL,
	part_of_body varchar(256) NOT NULL,
	accident_type varchar(256) NULL,
	location_codes_13 varchar(256) NULL,
	location_codes_46 varchar(256) NULL,
	subrogation varchar(256) NOT NULL,
	controverted varchar(256) NOT NULL,
	ind_bi_incurred varchar(256) NOT NULL,
	ind_bi_paid varchar(256) NOT NULL,
	ind_bi_outstanding varchar(256) NOT NULL,
	med_propdmg_incurred varchar(256) NOT NULL,
	med_propdmg_paid varchar(256) NOT NULL,
	med_propdmg_outstanding varchar(256) NOT NULL,
	expense_incurred varchar(256) NOT NULL,
	expense_paid varchar(256) NOT NULL,
	expense_outstanding varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	total_paid varchar(256) NOT NULL,
	total_outstanding varchar(256) NOT NULL,
	recovered_incurred varchar(256) NOT NULL,
	recovered_paid varchar(256) NOT NULL,
	recovered_outstanding varchar(256) NOT NULL,
	net_incurred varchar(256) NOT NULL,
	net_paid varchar(256) NOT NULL,
	net_outstanding varchar(256) NOT NULL,
	reimbursed varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_starr OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_starr to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_starr to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_starr to rpauser;
GO
GRANT SELECT ON p_and_c.raw_starr to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_starr to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_starr to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_starr to rl_p_and_c_d;
GO