DROP TABLE p_and_c.raw_claims_other CASCADE;
GO

CREATE TABLE p_and_c.raw_claims_other (
	insured_name varchar(256) NULL,
	line_of_coverage varchar(256) NULL,
	carrier_id varchar(256) NULL,
	policy_number varchar(256) NULL,
	policy_start_date varchar(256) NULL,
	claim_number varchar(256) NULL,
	paid_expense varchar(256) NULL,
	paid_indemnity varchar(256) NULL,
	paid_medical varchar(256) NULL,
	reserve_indemnity varchar(256) NULL,
	reserve_medical varchar(256) NULL,
	subrogation varchar(256) NULL,
	reimbursed varchar(256) NULL,
	claim_status varchar(256) NULL,
	description_text varchar(4096) NULL,
	claim_address_1 varchar(256) NULL,
	claim_address_2 varchar(256) NULL,
	claim_city varchar(256) NULL,
	claim_state varchar(256) NULL,
	claim_zip varchar(256) NULL,
	claim_site varchar(256) NULL,
	occupation varchar(256) NULL,
	class_code varchar(256) NULL,
	claimant_name varchar(256) NULL,
	loss_date varchar(256) NULL,
	loss_time varchar(256) NULL,
	report_date varchar(256) NULL,
	closed_date varchar(256) NULL,
	reopen_date varchar(256) NULL,
	litigation varchar(256) NULL,
	days_employed varchar(256) NULL,
	claimant_gender varchar(256) NULL,
	claimant_age varchar(256) NULL,
	claimant_shift varchar(256) NULL,
	claimant_supervisor varchar(256) NULL,
	body_part varchar(256) NULL,
	cause varchar(256) NULL,
	coverage_type varchar(256) NULL,
	nature varchar(256) NULL,
	injury_code varchar(256) NULL,
	claimant_number varchar(256) NULL,
	reserve_expense varchar(256) NULL,
	benefit_state varchar(256) NULL,
	garage_state varchar(256) NULL,
	claimant_first varchar(256) NULL,
	claimant_middle varchar(256) NULL,
	claimant_last varchar(256) NULL,
	driver_first varchar(256) NULL,
	driver_middle varchar(256) NULL,
	driver_last varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_claims_other OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.raw_claims_other to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_claims_other to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_claims_other to rpauser;
GO
GRANT SELECT ON p_and_c.raw_claims_other to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_claims_other to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_claims_other to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_claims_other to rl_p_and_c_d;
GO