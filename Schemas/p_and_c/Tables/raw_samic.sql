CREATE TABLE p_and_c.raw_samic (
	name_insured varchar(256) NOT NULL,
	run_date varchar(256) NOT NULL,
	cov_type varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	"policy_#" varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	location_code varchar(256) NULL,
	"claim_#" varchar(256) NOT NULL,
	"legacy_claim_#" varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	loss_day varchar(256) NOT NULL,
	loss_location varchar(256) NOT NULL,
	date_reported varchar(256) NOT NULL,
	loss_desc varchar(256) NOT NULL,
	adjuster varchar(256) NULL,
	phone varchar(256) NULL,
	claimant varchar(256) NOT NULL,
	type_of_loss varchar(256) NOT NULL,
	paid_losses varchar(256) NOT NULL,
	reserved_losses varchar(256) NOT NULL,
	paid_expenses varchar(256) NOT NULL,
	reserved_expenses varchar(256) NOT NULL,
	incurred_losses varchar(256) NOT NULL,
	all_recoveries varchar(256) NOT NULL,
	reserved_recoveries varchar(256) NOT NULL,
	total_net_loss varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_samic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_samic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_samic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_samic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_samic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_samic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_samic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_samic to rl_p_and_c_d;
GO