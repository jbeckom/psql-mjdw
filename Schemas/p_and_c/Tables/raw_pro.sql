CREATE TABLE p_and_c.raw_pro (
	"last" varchar(256) NULL,
	"first" varchar(256) NULL,
	middle varchar(256) NULL,
	policy_number varchar(256) NULL,
	claim_number varchar(256) NULL,
	loss_date varchar(256) NULL,
	status varchar(256) NULL,
	activity varchar(256) NULL,
	activity_date varchar(256) NULL,
	product varchar(256) NULL,
	state varchar(256) NULL,
	agency varchar(256) NULL,
	policy_effective_date varchar(256) NULL,
	policy_expiration_date varchar(256) NULL,
	insured_name varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_pro OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_pro to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_pro to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_pro to rpauser;
GO
GRANT SELECT ON p_and_c.raw_pro to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_pro to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_pro to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_pro to rl_p_and_c_d;
GO