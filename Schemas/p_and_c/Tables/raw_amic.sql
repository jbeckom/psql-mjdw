CREATE TABLE p_and_c.raw_amic (
	insured varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	policy_end_date varchar(256) NOT NULL,
	agent varchar(256) NOT NULL,
	carrier varchar(256) NOT NULL,
	claimant varchar(256) NOT NULL,
	sex varchar(256) NOT NULL,
	age varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_status varchar(256) NOT NULL,
	accident_date varchar(256) NOT NULL,
	date_closed varchar(256) NULL,
	injury varchar(256) NOT NULL,
	cause varchar(256) NOT NULL,
	class_code varchar(256) NOT NULL,
	jurisdiction varchar(256) NOT NULL,
	incurred_medical varchar(256) NOT NULL,
	incurred_indemnity varchar(256) NOT NULL,
	incurred_lae varchar(256) NOT NULL,
	paid_medical varchar(256) NOT NULL,
	paid_indemnity varchar(256) NOT NULL,
	paid_lae varchar(256) NOT NULL,
	reserve_medical varchar(256) NOT NULL,
	reserve_indemnity varchar(256) NOT NULL,
	reserve_lae varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_amic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_amic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_amic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_amic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_amic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_amic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_amic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_amic to rl_p_and_c_d;
GO