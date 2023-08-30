CREATE TABLE p_and_c.raw_aig (
	"policy" varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	policy_end_date varchar(256) NOT NULL,
	report_date varchar(256) NOT NULL,
	valuation_date varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	oneclaim_number varchar(256) NULL,
	loss_date varchar(256) NOT NULL,
	loss_type varchar(256) NULL,
	st_terr_ctry varchar(256) NOT NULL,
	receipt_date varchar(256) NOT NULL,
	div_ho varchar(256) NULL,
	status varchar(256) NOT NULL,
	closed_date varchar(256) NULL,
	accident_loss_description varchar(256) NOT NULL,
	major_class_code varchar(256) NULL,
	ind_bi_paid varchar(256) NOT NULL,
	med_pd_paid varchar(256) NOT NULL,
	alloc_exp_paid varchar(256) NOT NULL,
	total_reserves varchar(256) NOT NULL,
	total_recoveries varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_aig OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_aig to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_aig to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_aig to rpauser;
GO
GRANT SELECT ON p_and_c.raw_aig to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_aig to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_aig to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_aig to rl_p_and_c_d;
GO