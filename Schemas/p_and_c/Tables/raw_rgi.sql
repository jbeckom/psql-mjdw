CREATE TABLE p_and_c.raw_rgi (
	"policy" varchar(256) NULL,
	insured varchar(256) NULL,
	policy_dates varchar(256) NULL,
	report_date varchar(256) NULL,
	valuation_date varchar(256) NULL,
	currency varchar(256) NULL,
	claimant_name varchar(256) NULL,
	claimno_oneclaimno varchar(256) NULL,
	loss_date varchar(256) NULL,
	state_terr varchar(256) NULL,
	country varchar(256) NULL,
	receipt_date varchar(256) NULL,
	div_ho varchar(256) NULL,
	status varchar(256) NULL,
	closed_date varchar(256) NULL,
	accident_loss_description varchar(256) NULL,
	ind_bi_paid varchar(256) NULL,
	med_pd_paid varchar(256) NULL,
	alloc_exp_paid varchar(256) NULL,
	total_recoveries varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_rgi OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_rgi to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_rgi to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_rgi to rpauser;
GO
GRANT SELECT ON p_and_c.raw_rgi to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_rgi to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_rgi to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_rgi to rl_p_and_c_d;
GO