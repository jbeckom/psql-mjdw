CREATE TABLE if not exists p_and_c.all_claims_monthly (
	claim_number varchar(256) NOT NULL,
	occurrence_number varchar(256) NULL,
	claimant_number varchar(256) NULL,
	paid_expense numeric(20,2) NULL,
	reserve_expense numeric(20,2) NULL,
	paid_indemnity numeric(20,2) NULL,
	paid_medical numeric(20,2) NULL,
	reserve_indemnity numeric(20,2) NULL,
	reserve_medical numeric(20,2) NULL,
	subrogation numeric(20,2) NULL,
	reimbursed numeric(20,2) NULL,
	claim_status varchar(256) NULL,
	description_text varchar(4096) NULL,
	claim_address_1 varchar(256) NULL,
	claim_address_2 varchar(256) NULL,
	claim_city varchar(256) NULL,
	claim_state varchar(256) NULL,
	claim_zip varchar(256) NULL,
	claim_site varchar(256) NULL,
	benefit_state varchar(256) NULL,
	garage_state varchar(256) NULL,
	occupation varchar(256) NULL,
	class_code varchar(256) NULL,
	claimant_name varchar(256) NULL,
	claimant_first varchar(256) NULL,
	claimant_middle varchar(256) NULL,
	claimant_last varchar(256) NULL,
	driver_first varchar(256) NULL,
	driver_middle varchar(256) NULL,
	driver_last varchar(256) NULL,
	loss_date date NULL,
	loss_time varchar(256) NULL,
	report_date date NULL,
	closed_date date NULL,
	reopen_date date NULL,
	litigation varchar(256) NULL,
	days_employed int4 NULL,
	claimant_gender varchar(256) NULL,
	claimant_age int4 NULL,
	claimant_shift varchar(256) NULL,
	claimant_supervisor varchar(256) NULL,
	carrier_body_part varchar(256) NULL,
	carrier_cause varchar(256) NULL,
	carrier_coverage_type varchar(256) NULL,
	carrier_nature varchar(256) NULL,
	carrier_injury_code varchar(256) NULL,
	carrier_policy_number varchar(256) NOT NULL,
	source_table varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	as_of_date date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.all_claims_monthly OWNER TO mj_admin;
GO

Grant select,insert on table p_and_c.all_claims_monthly to rl_pc_data_analyst;
GO

Grant delete, update, insert, select on table p_and_c.all_claims_monthly to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.all_claims_monthly to rpauser;
GO
GRANT SELECT ON p_and_c.all_claims_monthly to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_claims_monthly to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_claims_monthly to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_claims_monthly to rl_p_and_c_d;
GO