CREATE TABLE p_and_c.raw_hanover (
	lob varchar(256) NOT NULL,
	inquiry_date varchar(256) NOT NULL,
	producer varchar(256) NOT NULL,
	producer_name varchar(256) NOT NULL,
	date_range varchar(256) NOT NULL,
	insured_name varchar(256) NOT NULL,
	customer_number varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	premium_amount varchar(256) NOT NULL,
	policy_effective_date varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	date_of_loss varchar(256) NOT NULL,
	date_claim_reported varchar(256) NOT NULL,
	desc_of_loss varchar(256) NOT NULL,
	paid_loss varchar(256) NOT NULL,
	subro varchar(256) NOT NULL,
	return_to_work varchar(256) NULL,
	current_reserve varchar(256) NOT NULL,
	claim_status varchar(256) NOT NULL,
	adjuster_name varchar(256) NOT NULL,
	phone_and_ext varchar(256) NOT NULL,
	fax varchar(256) NOT NULL,
	adjuster_skill varchar(256) NULL,
	adjuster_email_address varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_hanover OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_hanover to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_hanover to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_hanover to rpauser;
GO
GRANT SELECT ON p_and_c.raw_hanover to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_hanover to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_hanover to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_hanover to rl_p_and_c_d;
GO