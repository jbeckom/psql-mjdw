CREATE TABLE p_and_c.raw_amtrust (
	run_date varchar(256) NOT NULL,
	claim_no varchar(256) NOT NULL,
	"converted_#" varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	"pol._eff_date" varchar(256) NOT NULL,
	claimant varchar(256) NOT NULL,
	class_cd varchar(256) NOT NULL,
	juris_st varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	department varchar(256) NULL,
	dol varchar(256) NOT NULL,
	first_aware varchar(256) NULL,
	date_rcvd varchar(256) NOT NULL,
	nature varchar(256) NOT NULL,
	employee_lag varchar(256) NULL,
	reporting_lag varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	category varchar(256) NOT NULL,
	adjuster varchar(256) NOT NULL,
	loss_location varchar(256) NOT NULL,
	part_injured varchar(256) NOT NULL,
	cause varchar(256) NOT NULL,
	loss_description varchar(256) NOT NULL,
	indem_reserves varchar(256) NOT NULL,
	indem_payments varchar(256) NOT NULL,
	indem_recoveries varchar(256) NOT NULL,
	indem_incurred varchar(256) NOT NULL,
	medical_reserves varchar(256) NOT NULL,
	medical_payments varchar(256) NOT NULL,
	medical_recoveries varchar(256) NOT NULL,
	medical_incurred varchar(256) NOT NULL,
	lae_reserves varchar(256) NOT NULL,
	lae_payments varchar(256) NOT NULL,
	lae_recoveries varchar(256) NOT NULL,
	lae_incurred varchar(256) NOT NULL,
	total_reserves varchar(256) NOT NULL,
	total_payments varchar(256) NOT NULL,
	total_recoveries varchar(256) NOT NULL,
	total_incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_amtrust OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_amtrust to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_amtrust to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_amtrust to rpauser;
GO
GRANT SELECT ON p_and_c.raw_amtrust to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_amtrust to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_amtrust to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_amtrust to rl_p_and_c_d;
GO