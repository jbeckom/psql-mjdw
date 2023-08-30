CREATE TABLE p_and_c.raw_eai (
	"date" varchar(256) NOT NULL,
	company varchar(256) NOT NULL,
	claims_per_policy varchar(256) NOT NULL,
	agent varchar(256) NOT NULL,
	"policy" varchar(256) NOT NULL,
	effdate varchar(256) NOT NULL,
	expdate varchar(256) NOT NULL,
	insured varchar(256) NOT NULL,
	claimant_no_001 varchar(256) NOT NULL,
	claimant_no_002 varchar(256) NULL,
	"claim_no." varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	driver_name varchar(256) NULL,
	typ varchar(256) NOT NULL,
	loss_reserve varchar(256) NULL,
	loss_paid varchar(256) NULL,
	loss_recovery varchar(256) NULL,
	expense_reserve varchar(256) NULL,
	expense_paid varchar(256) NULL,
	expense_recovery varchar(256) NULL,
	total_incurred varchar(256) NULL,
	cause_of_loss varchar(256) NOT NULL,
	close_date varchar(256) NULL,
	reported_date varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_eai OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_eai to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_eai to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_eai to rpauser;
GO
GRANT SELECT ON p_and_c.raw_eai to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_eai to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_eai to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_eai to rl_p_and_c_d;
GO