CREATE TABLE p_and_c.raw_nav (
	policy_number varchar(256) NOT NULL,
	effective_date varchar(256) NOT NULL,
	expiration_date varchar(256) NOT NULL,
	assured_name varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_title varchar(256) NOT NULL,
	date_of_loss varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	claim_adjuster varchar(256) NOT NULL,
	gross_paid varchar(256) NOT NULL,
	gross_outstanding varchar(256) NOT NULL,
	gross_incurred varchar(256) NOT NULL,
	file_name varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_nav OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_nav to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_nav to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_nav to rpauser;
GO
GRANT SELECT ON p_and_c.raw_nav to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_nav to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_nav to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_nav to rl_p_and_c_d;
GO